-- PEA · Etapa 9 · estado_curso indica si la lección tiene Probalo publicado (para la etiqueta del requisito)
drop function public.estado_curso(uuid);
create function public.estado_curso(p_curso uuid)
returns table (
  modulo_id uuid, modulo_titulo text, modulo_orden int, modulo_cumplido boolean,
  item_id uuid, titulo text, tipo public.tipo_item, requisito public.requisito_item, item_orden int,
  cumplido boolean, disponible boolean, con_probalo boolean
)
language sql stable security definer set search_path = '' as $$
  select m.id, m.titulo, m.orden, public.modulo_cumplido(m.id, auth.uid()),
         i.id, i.titulo, i.tipo, i.requisito, i.orden,
         public.item_cumplido(i.id, auth.uid()), public.item_disponible(i.id, auth.uid()),
         i.tipo = 'leccion' and exists (select 1 from public.pozo_probalo_de(i.id, auth.uid()))
  from public.modulos m
  join public.items i on i.modulo_id = m.id
  where m.curso_id = p_curso and public.puede_leer_curso(p_curso)
  order by m.orden, m.id, i.orden, i.id
$$;
revoke all on function public.estado_curso(uuid) from public, anon;
grant execute on function public.estado_curso(uuid) to authenticated;
