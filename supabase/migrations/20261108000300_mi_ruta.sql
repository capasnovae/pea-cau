-- PEA · Etapa 4 · Mi ruta de aprendizaje

create or replace function public.mi_ruta()
returns table (
  curso_id uuid, titulo text, descripcion_md text, tipo public.tipo_curso, nivel_orden int,
  obligatorio boolean, desbloqueado boolean, cumplido boolean,
  items_total int, items_cumplidos int, siguiente_item uuid
)
language sql stable security definer set search_path = '' as $$
  with yo as (
    select p.id, p.sede_id, p.puesto_id from public.perfiles p where p.id = auth.uid() and p.activo
  ),
  mis_subroles as (
    select ps.subrol_id from public.perfil_subroles ps where ps.perfil_id = auth.uid()
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
         public.curso_desbloqueado(e.id, auth.uid()),
         public.curso_cumplido(e.id, auth.uid()),
         (select count(*)::int from public.items i join public.modulos m on m.id = i.modulo_id
           where m.curso_id = e.id and i.requisito <> 'ninguno'),
         (select count(*)::int from public.items i join public.modulos m on m.id = i.modulo_id
           where m.curso_id = e.id and i.requisito <> 'ninguno' and public.item_cumplido(i.id, auth.uid())),
         (select i.id from public.items i join public.modulos m on m.id = i.modulo_id
           where m.curso_id = e.id and i.requisito <> 'ninguno'
             and not public.item_cumplido(i.id, auth.uid()) and public.item_disponible(i.id, auth.uid())
           order by m.orden, m.id, i.orden, i.id limit 1)
  from elegidos e
  order by (e.tipo <> 'nivel'), e.nivel_orden nulls last, e.titulo
$$;

revoke all on function public.mi_ruta() from public, anon;
grant execute on function public.mi_ruta() to authenticated;
