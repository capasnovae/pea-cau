-- Correcciones de la revisión de la Etapa 8: Probalo por sede, lo cumplido queda, y no se marca a mano
begin;
select plan(5);
select tests.escenario();
select tests.escenario_cursos();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;

insert into public.modulos (id, curso_id, orden, titulo) values ('e2000000-0000-4000-8000-000000000009', 'e1000000-0000-4000-8000-000000000001', 3, 'ML');
insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito) values
  ('e3000000-0000-4000-8000-000000000051', 'e2000000-0000-4000-8000-000000000009', 1, 'Lección', 'leccion',
   (select id from public.articulos where alcance = 'global' and estado = 'publicado' limit 1),
   '{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}', 'marcar_hecho');
insert into public.preguntas (id, tipo, enunciado_md, categoria_id, estado, alcance, sede_id, uso, item_id) values
  ('f2000000-0000-4000-8000-000000000051', 'verdadero_falso', 'global', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', null, 'practica', 'e3000000-0000-4000-8000-000000000051'),
  ('f2000000-0000-4000-8000-000000000052', 'verdadero_falso', 'de Roca', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'sede',
   (select id from public.sedes where nombre = 'T-Roca'), 'practica', 'e3000000-0000-4000-8000-000000000051');
insert into public.opciones (id, pregunta_id, texto, es_correcta, orden) values
  ('f3000000-0000-4000-8000-000000000051', 'f2000000-0000-4000-8000-000000000051', 'Verdadero', true, 1),
  ('f3000000-0000-4000-8000-000000000052', 'f2000000-0000-4000-8000-000000000052', 'Verdadero', true, 1);

-- ase1 (Neuquén) no ve la pregunta de Roca: acertando la suya, cumple
select tests.como(tests.uid('ase2@t'));
select throws_ok($$select public.marcar_item('e3000000-0000-4000-8000-000000000051', 'hecho')$$, 'P0001', null,
  'con Probalo, no se marca hecho a mano');
select throws_ok($$insert into public.item_progreso (usuario_id, item_id, hecho_at) values (auth.uid(), 'e3000000-0000-4000-8000-000000000051', now())$$,
  'P0001', null, 'ni escribiendo el progreso directo');
select tests.como_postgres();
select tests.como(tests.uid('ase1@t'));
select is((select es_correcta from public.comprobar_probalo('e3000000-0000-4000-8000-000000000051', 'f2000000-0000-4000-8000-000000000051',
  '{"opcion_ids": ["f3000000-0000-4000-8000-000000000051"]}')), true, 'acierta la única que ve');
select tests.como_postgres();
select ok(public.item_cumplido('e3000000-0000-4000-8000-000000000051', tests.uid('ase1@t')),
  'una pregunta de otra sede no traba la lección');

-- Una pregunta nueva publicada después no descumple
insert into public.preguntas (tipo, enunciado_md, categoria_id, estado, alcance, uso, item_id) values
  ('verdadero_falso', 'nueva', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', 'practica', 'e3000000-0000-4000-8000-000000000051');
select ok(public.item_cumplido('e3000000-0000-4000-8000-000000000051', tests.uid('ase1@t')),
  'lo cumplido queda aunque se agreguen preguntas');

select * from finish();
rollback;
