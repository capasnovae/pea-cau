-- PEA · Etapa 9 · Actualizaciones obligatorias (spec §4.6): cambio de contenido con mini examen y plazo

alter table public.examenes drop constraint examenes_referencia;
alter table public.examenes add constraint examenes_referencia check (
  (tipo <> 'modulo' or modulo_id is not null)
  and (tipo <> 'categoria' or categoria_id is not null)
  and (tipo <> 'nivel' or curso_id is not null)
  and (tipo <> 'practica' or modulo_id is not null or categoria_id is not null)
  and (tipo <> 'actualizacion' or modulo_id is not null or categoria_id is not null)
);

create type public.estado_actualizacion as enum ('pendiente', 'cumplida', 'vencida');

create table public.actualizaciones (
  id uuid primary key default gen_random_uuid(),
  titulo text not null check (char_length(titulo) between 1 and 160),
  descripcion_md text not null default '' check (char_length(descripcion_md) <= 4000),
  articulo_id uuid references public.articulos (id) on delete set null,
  articulo_version_id uuid references public.articulo_versiones (id) on delete set null,
  modulo_id uuid references public.modulos (id) on delete set null,
  examen_id uuid references public.examenes (id) on delete set null,
  plazo_dias int not null check (plazo_dias between 1 and 90),
  publicada_por uuid references public.perfiles (id) on delete set null,
  publicada_at timestamptz not null default now(),
  check (articulo_id is not null or modulo_id is not null)
);

create table public.actualizacion_asignaciones (
  id uuid primary key default gen_random_uuid(),
  actualizacion_id uuid not null references public.actualizaciones (id) on delete cascade,
  usuario_id uuid not null references public.perfiles (id) on delete cascade,
  vence_at timestamptz not null,
  leida_at timestamptz,
  aprobada_at timestamptz,
  estado public.estado_actualizacion not null default 'pendiente',
  unique (actualizacion_id, usuario_id)
);
create index actualizacion_asignaciones_usuario_idx on public.actualizacion_asignaciones (usuario_id, estado);

alter table public.actualizaciones enable row level security;
alter table public.actualizacion_asignaciones enable row level security;
revoke all on public.actualizaciones, public.actualizacion_asignaciones from anon;
revoke insert, update, delete, truncate on public.actualizaciones, public.actualizacion_asignaciones from authenticated;
create policy actualizaciones_leer on public.actualizaciones for select to authenticated using (
  public.mi_rol() = 'admin'
  or exists (select 1 from public.actualizacion_asignaciones s where s.actualizacion_id = actualizaciones.id and s.usuario_id = auth.uid()));
create policy asignaciones_leer on public.actualizacion_asignaciones for select to authenticated using (
  usuario_id = auth.uid() or public.mi_rol() = 'admin' or public.puede_ver_usuario(usuario_id));

-- Cursos afectados por una actualización: el del módulo, o los que usan el artículo en algún paso
create or replace function public.cursos_de_actualizacion(p_actualizacion uuid) returns setof uuid
language sql stable security definer set search_path = '' as $$
  select m.curso_id from public.actualizaciones a join public.modulos m on m.id = a.modulo_id where a.id = p_actualizacion
  union
  select m.curso_id from public.actualizaciones a
  join public.items i on i.articulo_id = a.articulo_id
  join public.modulos m on m.id = i.modulo_id
  where a.id = p_actualizacion
$$;

-- Queda cumplida cuando está leída y, si tiene mini examen, aprobado
create or replace function public.revisar_asignacion(p_asignacion uuid) returns void
language plpgsql security definer set search_path = '' as $$
declare v_usuario uuid; v_n int;
begin
  update public.actualizacion_asignaciones s set estado = 'cumplida'
  from public.actualizaciones a
  where s.id = p_asignacion and a.id = s.actualizacion_id and s.estado <> 'cumplida'
    and s.leida_at is not null and (a.examen_id is null or s.aprobada_at is not null)
  returning s.usuario_id into v_usuario;
  get diagnostics v_n = row_count;
  if v_n > 0 then perform public.sincronizar_insignias_de(v_usuario); end if;
end $$;

create or replace function public.sincronizar_insignias_de(p_usuario uuid, p_motivo text default null) returns void
language plpgsql security definer set search_path = '' as $$
declare r record;
begin
  for r in
    select i.id as insignia_id, i.curso_id,
           exists (select 1 from public.certificaciones c where c.usuario_id = p_usuario and c.curso_id = i.curso_id
                     and public.estado_efectivo(c.estado, c.vence_at) = 'vigente') as vigente,
           exists (select 1 from public.actualizacion_asignaciones s
                   where s.usuario_id = p_usuario and s.estado = 'vencida'
                     and i.curso_id in (select public.cursos_de_actualizacion(s.actualizacion_id))) as con_actualizacion_vencida,
           (select c.estado::text from public.certificaciones c where c.usuario_id = p_usuario and c.curso_id = i.curso_id
             order by c.emitida_at desc, c.id desc limit 1) as ultimo_estado
    from public.insignias i
    where exists (select 1 from public.certificaciones c where c.usuario_id = p_usuario and c.curso_id = i.curso_id)
       or exists (select 1 from public.usuario_insignias ui where ui.usuario_id = p_usuario and ui.insignia_id = i.id)
  loop
    if r.vigente and not r.con_actualizacion_vencida then
      insert into public.usuario_insignias (usuario_id, insignia_id, otorgada_at)
      values (p_usuario, r.insignia_id, now())
      on conflict (usuario_id, insignia_id) do update
        set perdida_at = null, motivo_perdida = null,
            otorgada_at = case when public.usuario_insignias.perdida_at is not null then now() else public.usuario_insignias.otorgada_at end;
    else
      update public.usuario_insignias
      set perdida_at = now(), motivo_perdida = case when r.vigente then 'actualizacion' else coalesce(p_motivo, case when r.ultimo_estado = 'revocada' then 'revocada' else 'vencida' end) end
      where usuario_id = p_usuario and insignia_id = r.insignia_id and perdida_at is null;
    end if;
  end loop;
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
     or (v_ex is not null and not exists (select 1 from public.examenes where id = v_ex and tipo = 'actualizacion')) then
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

create or replace function public.marcar_actualizacion_leida(p_asignacion uuid) returns void
language plpgsql security definer set search_path = '' as $$
begin
  update public.actualizacion_asignaciones set leida_at = coalesce(leida_at, now())
  where id = p_asignacion and usuario_id = auth.uid() and estado <> 'cumplida';
  if not found then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  perform public.revisar_asignacion(p_asignacion);
end $$;

create or replace function public.puede_rendir(p_examen uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select public.mi_perfil_activo()
    and exists (
      select 1 from public.examenes e
      where e.id = p_examen and e.estado = 'publicado' and e.tipo not in ('ubicacion', 'practica')
        and public.puede_leer_contenido(e.alcance, e.sede_id, e.estado)
        and (e.tipo <> 'nivel' or public.curso_desbloqueado(e.curso_id, auth.uid()))
        and (e.tipo <> 'actualizacion' or exists (
              select 1 from public.actualizacion_asignaciones s join public.actualizaciones a on a.id = s.actualizacion_id
              where a.examen_id = e.id and s.usuario_id = auth.uid() and s.estado <> 'cumplida')))
    and (not exists (select 1 from public.items i where i.examen_id = p_examen)
         or exists (select 1 from public.items i where i.examen_id = p_examen and public.item_disponible(i.id, auth.uid())))
$$;

create or replace function public.aplicar_efectos(p_intento uuid) returns void
language plpgsql security definer set search_path = '' as $$
declare v_i public.intentos; v_e public.examenes; v_meses int; v_curso uuid; v_bloques uuid[];
begin
  select * into v_i from public.intentos where id = p_intento;
  select * into v_e from public.examenes where id = v_i.examen_id;
  if v_e.tipo = 'nivel' and v_i.aprobado and v_e.curso_id is not null
     and not exists (select 1 from public.certificaciones c
                     where c.usuario_id = v_i.usuario_id and c.curso_id = v_e.curso_id and public.estado_efectivo(c.estado, c.vence_at) = 'vigente') then
    select vigencia_meses into v_meses from public.cursos where id = v_e.curso_id;
    update public.certificaciones set estado = 'vencida'
    where usuario_id = v_i.usuario_id and curso_id = v_e.curso_id and estado = 'vigente' and vence_at < now();
    insert into public.certificaciones (usuario_id, curso_id, origen, intento_id, emitida_at, vence_at)
    values (v_i.usuario_id, v_e.curso_id, 'examen', p_intento, now(),
            case when v_meses is not null then now() + make_interval(months => v_meses) end);
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

create or replace function public.contar_pozo(p_examen uuid) returns int
language plpgsql stable security definer set search_path = '' as $$
declare v_e public.examenes; v_n int; v_sede uuid;
begin
  if not public.puede_editar_examen(p_examen) then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  select * into v_e from public.examenes where id = p_examen;
  v_sede := coalesce(v_e.sede_id, public.mi_sede());
  select count(distinct p.id) into v_n
  from public.preguntas p
  where p.estado = 'publicado'
    and (p.alcance = 'global' or p.sede_id = v_sede)
    and p.uso = case when v_e.tipo = 'practica' then 'practica'::public.uso_pregunta else 'examen'::public.uso_pregunta end
    and (
      (v_e.tipo = 'practica' and p.item_id is null and (v_e.modulo_id is null or p.modulo_id = v_e.modulo_id) and (v_e.categoria_id is null or p.categoria_id = v_e.categoria_id))
      or (v_e.tipo = 'modulo' and p.modulo_id = v_e.modulo_id)
      or (v_e.tipo = 'categoria' and p.categoria_id = v_e.categoria_id)
      or (v_e.tipo = 'actualizacion' and (p.modulo_id = v_e.modulo_id or p.categoria_id = v_e.categoria_id))
      or (v_e.tipo = 'nivel' and p.modulo_id in (select m.id from public.modulos m where m.curso_id = v_e.curso_id))
      or (v_e.tipo = 'ubicacion' and p.modulo_id in (select m.id from public.modulos m where m.curso_id = any (public.bloques_ubicacion())))
      or (v_e.tipo = 'integrador' and exists (
            select 1 from public.examen_fuentes f where f.examen_id = v_e.id
              and (p.modulo_id = f.modulo_id or p.categoria_id = f.categoria_id
                   or p.modulo_id in (select m.id from public.modulos m where m.curso_id = f.curso_id)))));
  return v_n;
end $$;

revoke all on function public.cursos_de_actualizacion(uuid), public.revisar_asignacion(uuid), public.sincronizar_insignias_de(uuid, text),
  public.aplicar_efectos(uuid) from public, anon, authenticated;
revoke all on function public.publicar_actualizacion(jsonb), public.marcar_actualizacion_leida(uuid), public.puede_rendir(uuid),
  public.contar_pozo(uuid) from public, anon;
grant execute on function public.publicar_actualizacion(jsonb), public.marcar_actualizacion_leida(uuid), public.puede_rendir(uuid),
  public.contar_pozo(uuid) to authenticated;
