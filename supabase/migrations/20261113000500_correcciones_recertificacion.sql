-- PEA · Etapa 9 · Correcciones de la revisión final

-- Se puede (re)certificar un nivel si no hay certificación vigente o si la vigente vence en 30 días o menos
create or replace function public.puede_recertificar(p_curso uuid, p_usuario uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select not exists (select 1 from public.certificaciones c
                     where c.usuario_id = p_usuario and c.curso_id = p_curso
                       and public.estado_efectivo(c.estado, c.vence_at) = 'vigente'
                       and (c.vence_at is null or c.vence_at > now() + interval '30 days'))
$$;

-- "Ya aprobado" deja de valer para un final de nivel a recertificar y para un mini examen con asignación sin aprobar
create or replace function public.examen_aprobado(p_examen uuid, p_usuario uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (select 1 from public.intentos i where i.usuario_id = p_usuario and i.examen_id = p_examen and i.estado = 'cerrado' and i.aprobado)
    and not exists (select 1 from public.examenes e where e.id = p_examen and (
          (e.tipo = 'nivel' and e.curso_id is not null and public.puede_recertificar(e.curso_id, p_usuario))
          or (e.tipo = 'actualizacion' and exists (
                select 1 from public.actualizacion_asignaciones s join public.actualizaciones a on a.id = s.actualizacion_id
                where a.examen_id = e.id and s.usuario_id = p_usuario and s.estado <> 'cumplida' and s.aprobada_at is null))))
$$;

create or replace function public.iniciar_intento(p_examen uuid) returns uuid
language plpgsql security definer set search_path = '' as $$
declare
  v_id uuid; v_e public.examenes; v_ciclo int; v_usados int; v_ultima timestamptz; v_perfil public.perfiles;
begin
  perform public.entregar_vencidos();
  select id into v_id from public.intentos where usuario_id = auth.uid() and examen_id = p_examen and estado = 'en_curso';
  if found then return v_id; end if;
  if not public.puede_rendir(p_examen) then raise exception 'no disponible' using errcode = 'P0001'; end if;
  if public.examen_aprobado(p_examen, auth.uid()) then
    raise exception 'ya aprobado' using errcode = 'P0001';
  end if;
  if exists (select 1 from public.intentos where usuario_id = auth.uid() and examen_id = p_examen and estado = 'pendiente_correccion') then
    raise exception 'pendiente de corrección' using errcode = 'P0001';
  end if;
  select * into v_e from public.examenes where id = p_examen;
  select max(ciclo) into v_ciclo from public.intentos where usuario_id = auth.uid() and examen_id = p_examen;
  if v_ciclo is null then
    v_ciclo := 1;
  else
    select count(*), max(entregado_at) into v_usados, v_ultima
    from public.intentos where usuario_id = auth.uid() and examen_id = p_examen and ciclo = v_ciclo;
    if v_usados >= v_e.max_intentos then
      if now() < v_ultima + make_interval(hours => v_e.espera_horas) then
        raise exception 'en espera' using errcode = 'P0001',
          detail = to_char(v_ultima + make_interval(hours => v_e.espera_horas), 'YYYY-MM-DD"T"HH24:MI:SSOF');
      end if;
      v_ciclo := v_ciclo + 1;
    end if;
  end if;
  select * into v_perfil from public.perfiles where id = auth.uid();
  begin
    insert into public.intentos (usuario_id, examen_id, sede_id, area, equipo_id, ciclo, vence_at)
    values (auth.uid(), p_examen, v_perfil.sede_id, v_perfil.area, v_perfil.equipo_id, v_ciclo,
            case when v_e.tiempo_limite_min is not null then now() + make_interval(mins => v_e.tiempo_limite_min) end)
    returning id into v_id;
  exception when unique_violation then
    -- Doble clic o dos pestañas: el otro request ya lo creó.
    select id into v_id from public.intentos where usuario_id = auth.uid() and examen_id = p_examen and estado = 'en_curso';
    return v_id;
  end;
  perform public.sortear_intento(v_id);
  return v_id;
end $$;

create or replace function public.mis_examenes()
returns table (examen_id uuid, titulo text, tipo public.tipo_examen, curso_titulo text, cantidad_preguntas int, nota_minima int,
               tiempo_limite_min int, intentos_restantes int, espera_hasta timestamptz, aprobado boolean, mejor_nota int,
               intento_en_curso uuid, intento_pendiente uuid)
language sql stable security definer set search_path = '' as $$
  with ex as (
    select e.* from public.examenes e where public.puede_rendir(e.id)
  ), ciclo as (
    select i.examen_id, max(i.ciclo) as ciclo from public.intentos i where i.usuario_id = auth.uid() group by i.examen_id
  ), uso as (
    select i.examen_id, count(*) as usados, max(i.entregado_at) as ultima
    from public.intentos i join ciclo c on c.examen_id = i.examen_id and c.ciclo = i.ciclo
    where i.usuario_id = auth.uid() group by i.examen_id
  )
  select e.id, e.titulo, e.tipo,
         coalesce((select cu.titulo from public.cursos cu where cu.id = e.curso_id),
                  (select cu.titulo from public.items it join public.modulos m on m.id = it.modulo_id join public.cursos cu on cu.id = m.curso_id
                   where it.examen_id = e.id limit 1),
                  (select cu.titulo from public.modulos m join public.cursos cu on cu.id = m.curso_id where m.id = e.modulo_id)),
         e.cantidad_preguntas, e.nota_minima, e.tiempo_limite_min,
         case when u.usados is null then e.max_intentos
              when u.usados >= e.max_intentos and now() >= u.ultima + make_interval(hours => e.espera_horas) then e.max_intentos
              else greatest(e.max_intentos - u.usados::int, 0) end,
         case when u.usados >= e.max_intentos and now() < u.ultima + make_interval(hours => e.espera_horas)
              then u.ultima + make_interval(hours => e.espera_horas) end,
         public.examen_aprobado(e.id, auth.uid()),
         (select max(i.nota) from public.intentos i where i.usuario_id = auth.uid() and i.examen_id = e.id and i.estado = 'cerrado'),
         (select i.id from public.intentos i where i.usuario_id = auth.uid() and i.examen_id = e.id and i.estado = 'en_curso'),
         (select i.id from public.intentos i where i.usuario_id = auth.uid() and i.examen_id = e.id and i.estado = 'pendiente_correccion' limit 1)
  from ex e left join uso u on u.examen_id = e.id
  order by e.titulo
$$;

create or replace function public.aplicar_efectos(p_intento uuid) returns void
language plpgsql security definer set search_path = '' as $$
declare v_i public.intentos; v_e public.examenes; v_meses int; v_curso uuid; v_bloques uuid[]; v_desde timestamptz; v_nueva uuid;
begin
  select * into v_i from public.intentos where id = p_intento;
  select * into v_e from public.examenes where id = v_i.examen_id;
  if v_e.tipo = 'nivel' and v_i.aprobado and v_e.curso_id is not null
     and public.puede_recertificar(v_e.curso_id, v_i.usuario_id) then
    select vigencia_meses into v_meses from public.cursos where id = v_e.curso_id;
    -- Recertificación anticipada: la nueva vigencia corre desde el vencimiento de la actual (si todavía no venció)
    v_desde := greatest(now(), coalesce((select max(c.vence_at) from public.certificaciones c
                                         where c.usuario_id = v_i.usuario_id and c.curso_id = v_e.curso_id
                                           and public.estado_efectivo(c.estado, c.vence_at) = 'vigente'), now()));
    insert into public.certificaciones (usuario_id, curso_id, origen, intento_id, emitida_at, vence_at)
    values (v_i.usuario_id, v_e.curso_id, 'examen', p_intento, now(),
            case when v_meses is not null then v_desde + make_interval(months => v_meses) end)
    returning id into v_nueva;
    update public.certificaciones set estado = 'vencida'
    where usuario_id = v_i.usuario_id and curso_id = v_e.curso_id and estado = 'vigente' and id <> v_nueva;
  elsif v_e.tipo = 'actualizacion' and v_i.aprobado then
    update public.actualizacion_asignaciones s set aprobada_at = coalesce(s.aprobada_at, now())
    from public.actualizaciones a
    where a.id = s.actualizacion_id and a.examen_id = v_e.id and s.usuario_id = v_i.usuario_id and s.estado <> 'cumplida';
    perform public.revisar_asignacion(s.id)
    from public.actualizacion_asignaciones s join public.actualizaciones a on a.id = s.actualizacion_id
    where a.examen_id = v_e.id and s.usuario_id = v_i.usuario_id and s.estado <> 'cumplida';
  elsif v_e.tipo = 'ubicacion' then
    v_bloques := public.bloques_ubicacion();
    v_curso := v_bloques[v_i.bloque_nivel];
    if v_i.aprobado and v_curso is not null
       and not exists (select 1 from public.certificaciones c
                       where c.usuario_id = v_i.usuario_id and c.curso_id = v_curso and public.estado_efectivo(c.estado, c.vence_at) = 'vigente') then
      select vigencia_meses into v_meses from public.cursos where id = v_curso;
      update public.certificaciones set estado = 'vencida'
      where usuario_id = v_i.usuario_id and curso_id = v_curso and estado = 'vigente' and vence_at < now();
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

create or replace function public.panel_asesores()
returns table (
  usuario_id uuid, nombre text, apellido text, sede text, equipo text, puesto text,
  nivel_actual int, cursos_total int, cursos_cumplidos int, ultima_actividad timestamptz,
  consignas_vencidas int, cert_vencidas int, cert_por_vencer int
)
language plpgsql stable security definer set search_path = '' as $$
begin
  if not public.puede_ver_panel() then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  return query
  select p.id, p.nombre, p.apellido, s.nombre, e.nombre, pu.nombre,
         coalesce(
           (select r.nivel_orden from public.ruta_de(p.id) r where r.tipo = 'nivel' and r.desbloqueado and not r.cumplido
            order by r.nivel_orden limit 1),
           (select max(cu.nivel_orden) from public.certificaciones c join public.cursos cu on cu.id = c.curso_id
            where c.usuario_id = p.id and cu.tipo = 'nivel' and c.estado <> 'revocada')),
         ru.total, ru.cumplidos,
         greatest(
           (select max(greatest(ip.visto_at, ip.hecho_at)) from public.item_progreso ip where ip.usuario_id = p.id),
           (select max(t.iniciado_at) from public.intentos t where t.usuario_id = p.id),
           (select max(pi.created_at) from public.practica_intentos pi where pi.usuario_id = p.id)),
         (select count(*)::int from public.consigna_asignaciones a
          where a.usuario_id = p.id
            and (a.estado = 'vencida' or (a.estado in ('pendiente', 'en_curso') and a.vence_el < public.hoy_ar()))),
         (select count(distinct c.curso_id)::int from public.certificaciones c
          where c.usuario_id = p.id and public.estado_efectivo(c.estado, c.vence_at) = 'vencida'
            and not exists (select 1 from public.certificaciones v where v.usuario_id = p.id and v.curso_id = c.curso_id
                              and public.estado_efectivo(v.estado, v.vence_at) = 'vigente')),
         (select count(*)::int from public.certificaciones c
          where c.usuario_id = p.id and public.estado_efectivo(c.estado, c.vence_at) = 'vigente'
            and c.vence_at is not null and c.vence_at < now() + interval '30 days')
  from public.perfiles p
  left join public.sedes s on s.id = p.sede_id
  left join public.equipos e on e.id = p.equipo_id
  left join public.puestos pu on pu.id = p.puesto_id
  cross join lateral (
    select count(*) filter (where r.obligatorio)::int as total,
           count(*) filter (where r.obligatorio and r.cumplido)::int as cumplidos
    from public.ruta_de(p.id) r
  ) ru
  where p.rol = 'asesor' and p.activo and p.id <> auth.uid() and public.puede_ver_usuario(p.id)
  order by s.nombre nulls last, p.apellido, p.nombre;
end $$;

create or replace function public.publicar_actualizacion(p jsonb) returns uuid
language plpgsql security definer set search_path = '' as $$
declare v_id uuid; v_art uuid := nullif(p ->> 'articulo_id', '')::uuid; v_mod uuid := nullif(p ->> 'modulo_id', '')::uuid;
        v_ex uuid := nullif(p ->> 'examen_id', '')::uuid; v_plazo int := (p ->> 'plazo_dias')::int; r record;
begin
  if public.mi_rol() is distinct from 'admin' or not public.mi_perfil_activo() then
    raise exception 'sin permiso' using errcode = 'P0001';
  end if;
  if (v_art is null and v_mod is null) or v_plazo is null or v_plazo not between 1 and 90
     or char_length(btrim(coalesce(p ->> 'titulo', ''))) not between 1 and 160
     or (v_ex is not null and not exists (select 1 from public.examenes where id = v_ex and tipo = 'actualizacion'
                                           and estado = 'publicado' and alcance = 'global'))
     or (v_ex is not null and exists (select 1 from public.actualizaciones where examen_id = v_ex)) then
    raise exception 'datos inválidos' using errcode = 'P0001';
  end if;
  insert into public.actualizaciones (titulo, descripcion_md, articulo_id, articulo_version_id, modulo_id, examen_id, plazo_dias, publicada_por)
  values (btrim(p ->> 'titulo'), coalesce(p ->> 'descripcion_md', ''), v_art,
          (select v.id from public.articulo_versiones v where v.articulo_id = v_art order by v.version desc limit 1),
          v_mod, v_ex, v_plazo, auth.uid())
  returning id into v_id;
  insert into public.actualizacion_asignaciones (actualizacion_id, usuario_id, vence_at)
  select v_id, pe.id, now() + make_interval(days => v_plazo)
  from public.perfiles pe
  where pe.activo
    and ((v_art is not null and exists (select 1 from public.items i where i.articulo_id = v_art and i.tipo in ('articulo', 'leccion')
                                          and public.item_cumplido(i.id, pe.id)))
      or (v_mod is not null and public.modulo_cumplido(v_mod, pe.id)));
  for r in select s.id, s.usuario_id from public.actualizacion_asignaciones s where s.actualizacion_id = v_id loop
    perform public.crear_alerta(r.usuario_id, 'actualizacion', 'Nueva actualización: ' || btrim(p ->> 'titulo'),
      'Tenés ' || v_plazo || ' días para completarla.', '/actualizaciones/' || r.id, 'actualizacion:' || v_id);
  end loop;
  insert into public.auditoria (actor_id, accion, entidad, entidad_id) values (auth.uid(), 'publicar', 'actualizaciones', v_id);
  return v_id;
end $$;

create or replace function public.job_diario(p_ahora timestamptz default now()) returns jsonb
language plpgsql security definer set search_path = '' as $$
declare r record; v_consignas jsonb; v_recert jsonb; v_act int := 0; v_corr int := 0; v_tomas int;
begin
  v_consignas := public.procesar_consignas((p_ahora at time zone 'America/Argentina/Buenos_Aires')::date);
  v_recert := public.procesar_recertificacion(p_ahora);

  -- Actualizaciones obligatorias fuera de plazo
  for r in
    update public.actualizacion_asignaciones s set estado = 'vencida'
    where s.estado = 'pendiente' and s.vence_at < p_ahora
    returning s.id, s.usuario_id, s.actualizacion_id
  loop
    v_act := v_act + 1;
    perform public.sincronizar_insignias_de(r.usuario_id);
    perform public.crear_alerta(r.usuario_id, 'actualizacion_vencida',
      'Venció una actualización: ' || (select titulo from public.actualizaciones where id = r.actualizacion_id),
      'Completala para recuperar la insignia del nivel.', '/actualizaciones/' || r.id, 'actualizacion_vencida:' || r.id);
  end loop;

  -- Consignas vencidas: aviso al asesor
  for r in
    select a.id, a.usuario_id, c.titulo from public.consigna_asignaciones a join public.consignas c on c.id = a.consigna_id
    where a.estado = 'vencida' and a.vence_el >= (p_ahora at time zone 'America/Argentina/Buenos_Aires')::date - 2
  loop
    perform public.crear_alerta(r.usuario_id, 'consigna_vencida', 'Venció una consigna', r.titulo, '/consignas', 'consigna_vencida:' || r.id);
  end loop;

  -- Correcciones con más de 72 h: aviso a los coordinadores del área y sede del asesor
  for r in
    select i.id as intento_id, co.id as coordinador_id, e.titulo
    from public.intentos i
    join public.perfiles p on p.id = i.usuario_id
    join public.examenes e on e.id = i.examen_id
    join public.perfiles co on co.rol = 'coordinador' and co.activo
      and co.sede_id = coalesce(i.sede_id, p.sede_id) and co.area = coalesce(i.area, p.area)
    where i.estado = 'pendiente_correccion' and i.entregado_at < p_ahora - interval '72 hours'
  loop
    if public.crear_alerta(r.coordinador_id, 'correccion_atrasada', 'Corrección atrasada',
         r.titulo || ': pasaron más de 72 h desde la entrega.', '/equipo/correcciones', 'correccion72:' || r.intento_id) then
      v_corr := v_corr + 1;
    end if;
  end loop;

  -- Tomas de corrección abandonadas (más de 24 h): vuelven a la cola
  update public.intentos set corrector_id = null, tomado_at = null
  where estado = 'pendiente_correccion' and tomado_at is not null and tomado_at < p_ahora - interval '24 hours';
  get diagnostics v_tomas = row_count;

  return jsonb_build_object('consignas', v_consignas, 'recertificacion', v_recert, 'actualizaciones_vencidas', v_act,
                            'correcciones_avisadas', v_corr, 'tomas_liberadas', v_tomas);
end $$;

revoke all on function public.puede_recertificar(uuid, uuid), public.examen_aprobado(uuid, uuid), public.aplicar_efectos(uuid),
  public.job_diario(timestamptz) from public, anon, authenticated;
grant execute on function public.job_diario(timestamptz) to service_role;
revoke all on function public.iniciar_intento(uuid), public.mis_examenes(), public.panel_asesores(), public.publicar_actualizacion(jsonb) from public, anon;
grant execute on function public.iniciar_intento(uuid), public.mis_examenes(), public.panel_asesores(), public.publicar_actualizacion(jsonb) to authenticated;
