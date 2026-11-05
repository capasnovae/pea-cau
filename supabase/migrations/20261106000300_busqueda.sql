-- PEA · Etapa 2 · Búsqueda full text del repositorio (español + sin acentos)

create extension if not exists unaccent with schema extensions;

-- unaccent no es immutable; este envoltorio sí (diccionario fijo), para usarlo en columnas generadas.
create or replace function public.f_unaccent(texto text) returns text
language sql immutable parallel safe strict set search_path = '' as $$
  select extensions.unaccent('extensions.unaccent'::regdictionary, texto)
$$;

create or replace function public.f_etiquetas_texto(etiquetas text[]) returns text
language sql immutable parallel safe set search_path = '' as $$
  select coalesce(array_to_string(etiquetas, ' '), '')
$$;

alter table public.articulos add column busqueda tsvector generated always as (
  setweight(to_tsvector('spanish', public.f_unaccent(coalesce(titulo, ''))), 'A')
  || setweight(to_tsvector('spanish', public.f_unaccent(coalesce(resumen, ''))), 'B')
  || setweight(to_tsvector('spanish', public.f_unaccent(coalesce(cuerpo_md, ''))), 'C')
) stored;

alter table public.recursos add column busqueda tsvector generated always as (
  setweight(to_tsvector('spanish', public.f_unaccent(coalesce(titulo, ''))), 'A')
  || setweight(to_tsvector('spanish', public.f_unaccent(coalesce(descripcion, ''))), 'B')
  || setweight(to_tsvector('spanish', public.f_unaccent(public.f_etiquetas_texto(etiquetas))), 'B')
) stored;

create index articulos_busqueda_idx on public.articulos using gin (busqueda);
create index recursos_busqueda_idx on public.recursos using gin (busqueda);

-- security invoker: corre con los permisos de quien busca, así la RLS filtra sede y estado.
create or replace function public.buscar_contenido(q text, p_limite int default 20)
returns table (tipo text, id uuid, titulo text, resumen text, categoria_slug text, slug text, rango real)
language sql stable security invoker set search_path = '' as $$
  with consulta as (
    select websearch_to_tsquery('spanish', public.f_unaccent(trim(q))) as tsq
    where length(trim(coalesce(q, ''))) > 0
  )
  select * from (
    select 'articulo'::text, a.id, a.titulo, a.resumen, c.slug, a.slug, ts_rank(a.busqueda, consulta.tsq)
    from public.articulos a
    join public.categorias c on c.id = a.categoria_id
    cross join consulta
    where a.busqueda @@ consulta.tsq
      and a.estado = 'publicado'
      and (a.vigente_hasta is null or a.vigente_hasta >= current_date)
    union all
    select 'recurso'::text, r.id, r.titulo, r.descripcion, c.slug, null::text, ts_rank(r.busqueda, consulta.tsq)
    from public.recursos r
    join public.categorias c on c.id = r.categoria_id
    cross join consulta
    where r.busqueda @@ consulta.tsq
      and r.estado = 'publicado'
      and (r.vigente_hasta is null or r.vigente_hasta >= current_date)
  ) resultados (tipo, id, titulo, resumen, categoria_slug, slug, rango)
  order by rango desc
  limit greatest(1, least(coalesce(p_limite, 20), 50))
$$;

revoke all on function public.buscar_contenido(text, int) from public, anon;
grant execute on function public.buscar_contenido(text, int) to authenticated;
