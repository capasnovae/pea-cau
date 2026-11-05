begin;
select plan(11);

select has_table('public', t, 'existe ' || t)
from unnest(array['cursos','ruta_cursos','modulos','modulo_prerrequisitos','items','item_progreso']) t;

select throws_ok($$insert into public.cursos (tipo, titulo, alcance) values ('nivel', 'Sin orden', 'global')$$,
  '23514', null, 'un nivel sin nivel_orden se rechaza');
insert into public.cursos (id, tipo, nivel_orden, titulo, alcance) values ('c1000000-0000-4000-8000-000000000001', 'nivel', 7, 'N7', 'global');
insert into public.cursos (id, tipo, titulo, alcance) values ('c1000000-0000-4000-8000-000000000002', 'capacitacion', 'Cap', 'global');
insert into public.modulos (id, curso_id, orden, titulo) values
  ('d1000000-0000-4000-8000-000000000001', 'c1000000-0000-4000-8000-000000000001', 1, 'M1'),
  ('d1000000-0000-4000-8000-000000000002', 'c1000000-0000-4000-8000-000000000002', 1, 'Otro curso');

select throws_ok($$insert into public.items (modulo_id, orden, titulo, tipo, requisito) values ('d1000000-0000-4000-8000-000000000001', 1, 'Pag', 'pagina', 'ver')$$,
  '23514', null, 'una página sin contenido se rechaza');
select throws_ok($$insert into public.ruta_cursos (curso_id, obligatorio) values ('c1000000-0000-4000-8000-000000000002', true)$$,
  '23514', null, 'una ruta sin puesto ni subrol se rechaza');
select throws_ok($$insert into public.modulo_prerrequisitos (modulo_id, requiere_modulo_id)
  values ('d1000000-0000-4000-8000-000000000001', 'd1000000-0000-4000-8000-000000000002')$$,
  'P0001', 'integridad: el prerrequisito es de otro curso', 'prerrequisito de otro curso rechazado');
select throws_ok($$insert into public.modulo_prerrequisitos (modulo_id, requiere_modulo_id)
  values ('d1000000-0000-4000-8000-000000000001', 'd1000000-0000-4000-8000-000000000001')$$,
  '23514', null, 'un módulo no es prerrequisito de sí mismo');

select * from finish();
rollback;
