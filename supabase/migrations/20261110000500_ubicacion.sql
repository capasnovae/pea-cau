-- PEA · Etapa 6 · Examen de ubicación por bloques (spec §4.4)
-- Lo habilita un coordinador (con acceso al asesor), el director o el admin; se rinde una sola vez.
-- Bloques = los niveles publicados en orden (hasta 3). Aprobar un bloque acredita ese nivel; el primero reprobado corta.

create or replace function public.proteger_campos_perfil() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_rol public.rol_app := public.mi_rol();
begin
  -- Sin usuario autenticado en el request (service role, migraciones, seed): sin restricciones.
  -- Ojo: un superusuario con claims de usuario en el mismo request SÍ queda restringido.
  if auth.uid() is null or v_rol = 'admin' then
    return new;
  end if;
  if new.rol is distinct from old.rol then
    raise exception 'no_autorizado: no podés cambiar el rol' using errcode = 'P0001';
  end if;
  -- ubicacion_rendida_at solo lo escribe aplicar_efectos (examen de ubicación), que marca pea.ubicacion.
  if new.sede_id is distinct from old.sede_id
     or new.email is distinct from old.email
     or new.activo is distinct from old.activo
     or new.area is distinct from old.area
     or (new.ubicacion_rendida_at is distinct from old.ubicacion_rendida_at
         and current_setting('pea.ubicacion', true) is distinct from 'si') then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  if new.id = auth.uid() and (
       new.equipo_id is distinct from old.equipo_id
       or new.puesto_id is distinct from old.puesto_id
       or new.experiencia_previa is distinct from old.experiencia_previa
       or new.fecha_ingreso is distinct from old.fecha_ingreso
       or new.ubicacion_habilitada_por is distinct from old.ubicacion_habilitada_por) then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  -- Quien habilita la ubicación tiene que ser quien firma el cambio.
  if new.ubicacion_habilitada_por is distinct from old.ubicacion_habilitada_por
     and new.ubicacion_habilitada_por is not null
     and new.ubicacion_habilitada_por <> auth.uid() then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  return new;
end $$;

-- Cursos de nivel que forman los bloques, en orden
create or replace function public.bloques_ubicacion() returns uuid[]
language sql stable security definer set search_path = '' as $$
  select coalesce(array_agg(id order by nivel_orden), '{}') from (
    select c.id, c.nivel_orden from public.cursos c
    where c.tipo = 'nivel' and c.estado = 'publicado' order by c.nivel_orden limit 3) b
$$;

-- El examen de ubicación vigente: el último publicado global
create or replace function public.examen_ubicacion() returns uuid
language sql stable security definer set search_path = '' as $$
  select e.id from public.examenes e
  where e.tipo = 'ubicacion' and e.estado = 'publicado' and e.alcance = 'global'
  order by e.created_at desc, e.id limit 1
$$;

create or replace function public.habilitar_ubicacion(p_usuario uuid) returns void
language plpgsql security definer set search_path = '' as $$
declare v_p public.perfiles;
begin
  if not public.mi_perfil_activo() or public.mi_rol() not in ('coordinador', 'director', 'admin')
     or not public.puede_ver_usuario(p_usuario) or p_usuario = auth.uid() then
    raise exception 'sin permiso' using errcode = 'P0001';
  end if;
  select * into v_p from public.perfiles where id = p_usuario;
  if not found or v_p.rol <> 'asesor' or not v_p.activo then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  if v_p.ubicacion_rendida_at is not null then raise exception 'ya rendida' using errcode = 'P0001'; end if;
  update public.perfiles set experiencia_previa = true, ubicacion_habilitada_por = auth.uid() where id = p_usuario;
end $$;

create or replace function public.estado_ubicacion()
returns table (habilitada boolean, rendida boolean, bloque_actual int, total_bloques int, intento_en_curso uuid, niveles_acreditados int[])
language sql stable security definer set search_path = '' as $$
  select p.ubicacion_habilitada_por is not null,
         p.ubicacion_rendida_at is not null,
         1 + (select count(*)::int from public.intentos i join public.examenes e on e.id = i.examen_id
              where i.usuario_id = p.id and e.tipo = 'ubicacion' and i.estado = 'cerrado' and i.aprobado),
         cardinality(public.bloques_ubicacion()),
         (select i.id from public.intentos i join public.examenes e on e.id = i.examen_id
          where i.usuario_id = p.id and e.tipo = 'ubicacion' and i.estado = 'en_curso' limit 1),
         coalesce((select array_agg(c.nivel_orden order by c.nivel_orden) from public.certificaciones ce
                   join public.cursos c on c.id = ce.curso_id
                   where ce.usuario_id = p.id and ce.origen = 'ubicacion' and ce.estado = 'vigente'), '{}')
  from public.perfiles p where p.id = auth.uid() and p.activo
$$;

create or replace function public.iniciar_ubicacion() returns uuid
language plpgsql security definer set search_path = '' as $$
declare v_p public.perfiles; v_examen uuid; v_id uuid; v_bloque int; v_bloques uuid[];
begin
  perform public.entregar_vencidos();
  select * into v_p from public.perfiles where id = auth.uid() and activo;
  if not found or v_p.ubicacion_habilitada_por is null or v_p.ubicacion_rendida_at is not null then
    raise exception 'no habilitada' using errcode = 'P0001';
  end if;
  v_examen := public.examen_ubicacion();
  if v_examen is null then raise exception 'no disponible' using errcode = 'P0001'; end if;
  select i.id into v_id from public.intentos i where i.usuario_id = auth.uid() and i.examen_id = v_examen and i.estado = 'en_curso';
  if found then return v_id; end if;
  if exists (select 1 from public.intentos i where i.usuario_id = auth.uid() and i.examen_id = v_examen and i.estado = 'pendiente_correccion') then
    raise exception 'pendiente de corrección' using errcode = 'P0001';
  end if;
  v_bloques := public.bloques_ubicacion();
  select bloque_actual into v_bloque from public.estado_ubicacion();
  if v_bloque > cardinality(v_bloques) then raise exception 'no habilitada' using errcode = 'P0001'; end if;
  begin
    insert into public.intentos (usuario_id, examen_id, sede_id, area, equipo_id, ciclo, bloque_nivel, vence_at)
    select auth.uid(), v_examen, v_p.sede_id, v_p.area, v_p.equipo_id, v_bloque, v_bloque,
           case when e.tiempo_limite_min is not null then now() + make_interval(mins => e.tiempo_limite_min) end
    from public.examenes e where e.id = v_examen
    returning id into v_id;
  exception when unique_violation then
    select i.id into v_id from public.intentos i where i.usuario_id = auth.uid() and i.examen_id = v_examen and i.estado = 'en_curso';
    return v_id;
  end;
  perform public.sortear_intento(v_id, v_bloques[v_bloque]);
  return v_id;
end $$;

-- Efectos al cerrar: certificación de nivel y bloques de ubicación
create or replace function public.aplicar_efectos(p_intento uuid) returns void
language plpgsql security definer set search_path = '' as $$
declare v_i public.intentos; v_e public.examenes; v_meses int; v_curso uuid; v_bloques uuid[];
begin
  select * into v_i from public.intentos where id = p_intento;
  select * into v_e from public.examenes where id = v_i.examen_id;
  if v_e.tipo = 'nivel' and v_i.aprobado and v_e.curso_id is not null
     and not exists (select 1 from public.certificaciones c
                     where c.usuario_id = v_i.usuario_id and c.curso_id = v_e.curso_id and c.estado = 'vigente') then
    select vigencia_meses into v_meses from public.cursos where id = v_e.curso_id;
    insert into public.certificaciones (usuario_id, curso_id, origen, intento_id, emitida_at, vence_at)
    values (v_i.usuario_id, v_e.curso_id, 'examen', p_intento, now(),
            case when v_meses is not null then now() + make_interval(months => v_meses) end);
  elsif v_e.tipo = 'ubicacion' then
    v_bloques := public.bloques_ubicacion();
    v_curso := v_bloques[v_i.bloque_nivel];
    if v_i.aprobado and v_curso is not null
       and not exists (select 1 from public.certificaciones c
                       where c.usuario_id = v_i.usuario_id and c.curso_id = v_curso and c.estado = 'vigente') then
      select vigencia_meses into v_meses from public.cursos where id = v_curso;
      insert into public.certificaciones (usuario_id, curso_id, origen, intento_id, emitida_at, vence_at)
      values (v_i.usuario_id, v_curso, 'ubicacion', p_intento, now(),
              case when v_meses is not null then now() + make_interval(months => v_meses) end);
    end if;
    if not v_i.aprobado or v_i.bloque_nivel >= cardinality(v_bloques) then
      perform set_config('pea.ubicacion', 'si', true);
      update public.perfiles set ubicacion_rendida_at = now() where id = v_i.usuario_id;
      perform set_config('pea.ubicacion', '', true);
    end if;
  end if;
end $$;

revoke all on function public.bloques_ubicacion(), public.examen_ubicacion(), public.habilitar_ubicacion(uuid),
  public.estado_ubicacion(), public.iniciar_ubicacion(), public.aplicar_efectos(uuid) from public, anon, authenticated;
grant execute on function public.habilitar_ubicacion(uuid), public.estado_ubicacion(), public.iniciar_ubicacion() to authenticated;
