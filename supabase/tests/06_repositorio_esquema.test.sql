begin;
select plan(14);

select has_table('public', t, 'existe la tabla ' || t)
from unnest(array['categorias','articulos','articulo_versiones','campanas','recursos']) t;
select enum_has_labels('public', 'alcance', array['global','sede'], 'labels de alcance');
select enum_has_labels('public', 'estado_contenido', array['borrador','publicado','archivado'], 'labels de estado_contenido');
select enum_has_labels('public', 'tipo_recurso', array['imagen','video','pdf','presentacion','enlace','otro'], 'labels de tipo_recurso');
select is((select count(*)::int from public.categorias), 10, 'hay 10 categorías iniciales');

select throws_ok($$insert into public.articulos (categoria_id, slug, titulo, alcance, sede_id)
  values ((select id from public.categorias where slug = 'reglamento'), 'x', 'X', 'sede', null)$$,
  '23514', null, 'artículo de sede sin sede rechazado');
select throws_ok($$insert into public.recursos (categoria_id, titulo, tipo, alcance)
  values ((select id from public.categorias where slug = 'reglamento'), 'R', 'pdf', 'global')$$,
  '23514', null, 'recurso sin archivo ni URL rechazado');

insert into public.articulos (id, categoria_id, slug, titulo, cuerpo_md, alcance)
values ('33333333-3333-3333-3333-333333333333', (select id from public.categorias where slug = 'reglamento'),
  'insc', 'Inscripción', 'texto v1', 'global');
update public.articulos set cuerpo_md = 'texto v2', ultimo_cambio = 'Corrijo fechas' where id = '33333333-3333-3333-3333-333333333333';
select is((select version from public.articulos where id = '33333333-3333-3333-3333-333333333333'), 2, 'editar el cuerpo sube la versión');
select results_eq($$select version, cuerpo_md, resumen_cambio from public.articulo_versiones
  where articulo_id = '33333333-3333-3333-3333-333333333333'$$,
  $$values (1, 'texto v1', 'Corrijo fechas')$$, 'se guarda la versión anterior con el resumen del cambio');
update public.articulos set orden = 5 where id = '33333333-3333-3333-3333-333333333333';
select is((select version from public.articulos where id = '33333333-3333-3333-3333-333333333333'), 2, 'cambiar el orden no versiona');

select * from finish();
rollback;
