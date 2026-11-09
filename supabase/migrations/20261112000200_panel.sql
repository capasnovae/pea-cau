-- PEA · Etapa 8 · Panel de coordinación (spec §4.7): progreso, atrasados, tasa por pregunta y cola de corrección.
-- Todo filtra con puede_ver_usuario: el líder ve su equipo; el coordinador, su sede y área; director y admin, todo.

-- La ruta de cualquier usuario (interna: solo la usan mi_ruta y el panel)
create or replace function public.ruta_de(p_usuario uuid)
returns table (
  curso_id uuid, titulo text, descripcion_md text, tipo public.tipo_curso, nivel_orden int,
  obligatorio boolean, desbloqueado boolean, cumplido boolean,
  items_total int, items_cumplidos int, siguiente_item uuid
)
language sql stable security definer set search_path = '' as $$
  with yo as (
    select p.id, p.sede_id, p.puesto_id from public.perfiles p where p.id = p_usuario and p.activo
  ),
  mis_subroles as (
    select ps.subrol_id from public.perfil_subroles ps where ps.perfil_id = p_usuario
  ),
  visibles as (
    select c.* from public.cursos c, yo
    where c.estado = 'publicado' and (c.alcance = 'global' or c.sede_id = yo.sede_id)
  ),
  en_ruta as (
    select r.curso_id, bool_or(r.obligatorio) as obligatorio
    from public.ruta_cursos r, yo
    where r.puesto_id = yo.puesto_id or r.subrol_id in (select subrol_id from mis_subroles)
    group by r.curso_id
  ),
  elegidos as (
    select v.*,
           coalesce(er.obligatorio, false) or (v.tipo = 'nivel' and v.nivel_orden = (
             select min(n.nivel_orden) from visibles n where n.tipo = 'nivel')) as es_obligatorio
    from visibles v left join en_ruta er on er.curso_id = v.id
    where v.tipo = 'nivel' or er.curso_id is not null
  )
  select e.id, e.titulo, e.descripcion_md, e.tipo, e.nivel_orden,
         e.es_obligatorio,
         public.curso_desbloqueado(e.id, p_usuario),
         public.curso_cumplido(e.id, p_usuario),
         (select count(*)::int from public.items i join public.modulos m on m.id = i.modulo_id
           where m.curso_id = e.id and i.requisito <> 'ninguno'),
         (select count(*)::int from public.items i join public.modulos m on m.id = i.modulo_id
           where m.curso_id = e.id and i.requisito <> 'ninguno' and public.item_cumplido(i.id, p_usuario)),
         (select i.id from public.items i join public.modulos m on m.id = i.modulo_id
           where m.curso_id = e.id and i.requisito <> 'ninguno'
             and not public.item_cumplido(i.id, p_usuario) and public.item_disponible(i.id, p_usuario)
           order by m.orden, m.id, i.orden, i.id limit 1)
  from elegidos e
  order by (e.tipo <> 'nivel'), e.nivel_orden nulls last, e.titulo
$$;

create or replace function public.mi_ruta()
returns table (
  curso_id uuid, titulo text, descripcion_md text, tipo public.tipo_curso, nivel_orden int,
  obligatorio boolean, desbloqueado boolean, cumplido boolean,
  items_total int, items_cumplidos int, siguiente_item uuid
)
language sql stable security definer set search_path = '' as $$
  select * from public.ruta_de(auth.uid())
$$;

create or replace function public.puede_ver_panel() returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce(public.mi_rol() in ('lider', 'coordinador', 'director', 'admin'), false) and public.mi_perfil_activo()
$$;

-- Asesores visibles con su avance y lo que los atrasa
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
         (select count(*)::int from public.certificaciones c
          where c.usuario_id = p.id and public.estado_efectivo(c.estado, c.vence_at) = 'vencida'),
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

-- Tasa de acierto por pregunta sobre la gente visible: exámenes cerrados (sin responder = error; libres afuera) y prácticas
create or replace function public.panel_preguntas()
returns table (
  pregunta_id uuid, enunciado_md text, tipo public.tipo_pregunta, uso public.uso_pregunta,
  categoria text, modulo text, respuestas int, aciertos int
)
language plpgsql stable security definer set search_path = '' as $$
begin
  if not public.puede_ver_panel() then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  return query
  with eventos as (
    select ip.pregunta_id, coalesce(r.es_correcta, false) as ok
    from public.intento_preguntas ip
    join public.intentos i on i.id = ip.intento_id and i.estado = 'cerrado'
    left join public.respuestas r on r.intento_id = ip.intento_id and r.pregunta_id = ip.pregunta_id
    where public.puede_ver_usuario(i.usuario_id)
    union all
    select pi.pregunta_id, pi.correcta from public.practica_intentos pi
    where public.puede_ver_usuario(pi.usuario_id)
  )
  select q.id, q.enunciado_md, q.tipo, q.uso, c.nombre, m.titulo, count(*)::int, count(*) filter (where ev.ok)::int
  from eventos ev
  join public.preguntas q on q.id = ev.pregunta_id
  left join public.categorias c on c.id = q.categoria_id
  left join public.modulos m on m.id = q.modulo_id
  where q.tipo <> 'libre'
  group by q.id, q.enunciado_md, q.tipo, q.uso, c.nombre, m.titulo;
end $$;

-- Cola de corrección por sede (intentos de la gente visible)
create or replace function public.panel_correccion()
returns table (sede text, pendientes int, tomados int, vencidos int)
language plpgsql stable security definer set search_path = '' as $$
begin
  if not public.puede_ver_panel() then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  return query
  select s.nombre, count(*)::int,
         count(*) filter (where public.tomado_vigente(i.corrector_id, i.tomado_at))::int,
         count(*) filter (where i.entregado_at < now() - interval '72 hours')::int
  from public.intentos i
  join public.perfiles p on p.id = i.usuario_id
  left join public.sedes s on s.id = coalesce(i.sede_id, p.sede_id)
  where i.estado = 'pendiente_correccion' and public.puede_ver_usuario(i.usuario_id)
  group by s.nombre
  order by s.nombre nulls last;
end $$;

revoke all on function public.ruta_de(uuid) from public, anon, authenticated;
revoke all on function public.mi_ruta(), public.puede_ver_panel(), public.panel_asesores(), public.panel_preguntas(), public.panel_correccion()
  from public, anon;
grant execute on function public.mi_ruta(), public.puede_ver_panel(), public.panel_asesores(), public.panel_preguntas(), public.panel_correccion()
  to authenticated;
