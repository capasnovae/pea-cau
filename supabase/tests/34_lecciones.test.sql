-- Lecciones: bloques con límites, Probalo con corrección inmediata y registro de cada comprobación
begin;
select plan(24);
select tests.escenario();
select tests.escenario_cursos();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;

-- Límites de la lección
select ok(public.leccion_valida('{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}'), 'una lección mínima es válida');
select ok(not public.leccion_valida('{"resumen":[],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}'), 'sin ideas clave no');
select ok(not public.leccion_valida('{"resumen":["a","b","c","d","e","f"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}'), 'más de 5 ideas no');
select ok(not public.leccion_valida(jsonb_build_object('resumen', jsonb_build_array(repeat('x', 201)), 'ejemplos', '[{"consulta":"c","respuesta":"r"}]'::jsonb, 'ojo', '[]'::jsonb)), 'una idea de 201 caracteres no');
select ok(not public.leccion_valida('{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"},{"consulta":"c","respuesta":"r"},{"consulta":"c","respuesta":"r"},{"consulta":"c","respuesta":"r"},{"consulta":"c","respuesta":"r"}],"ojo":[]}'), 'más de 4 ejemplos no');
select ok(not public.leccion_valida(jsonb_build_object('resumen', '["a"]'::jsonb, 'ejemplos', jsonb_build_array(jsonb_build_object('consulta', 'c', 'respuesta', repeat('x', 401))), 'ojo', '[]'::jsonb)), 'una respuesta de 401 no');
select ok(not public.leccion_valida('{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":["1","2","3","4","5"]}'), 'más de 4 "ojo con" no');
select ok(not public.leccion_valida('{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[],"extra":1}'), 'claves de más no');

insert into public.modulos (id, curso_id, orden, titulo) values ('e2000000-0000-4000-8000-000000000009', 'e1000000-0000-4000-8000-000000000001', 3, 'ML');
select throws_ok($$insert into public.items (modulo_id, orden, titulo, tipo, leccion, requisito) values ('e2000000-0000-4000-8000-000000000009', 1, 'L', 'leccion',
  '{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}', 'ver')$$, '23514', null, 'sin fuente no se guarda');
select throws_ok($$insert into public.items (modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito) values ('e2000000-0000-4000-8000-000000000009', 1, 'L', 'leccion',
  (select id from public.articulos where alcance = 'global' and estado = 'publicado' limit 1), '{"resumen":[]}', 'ver')$$, '23514', null, 'una lección inválida no se guarda');

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito) values
  ('e3000000-0000-4000-8000-000000000031', 'e2000000-0000-4000-8000-000000000009', 1, 'Lección', 'leccion',
   (select id from public.articulos where alcance = 'global' and estado = 'publicado' limit 1),
   '{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}', 'marcar_hecho'),
  ('e3000000-0000-4000-8000-000000000032', 'e2000000-0000-4000-8000-000000000009', 2, 'Otra', 'leccion',
   (select id from public.articulos where alcance = 'global' and estado = 'publicado' limit 1),
   '{"resumen":["b"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}', 'ver');
insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id) values
  ('f2000000-0000-4000-8000-000000000031', 'verdadero_falso', 'l-1', 'exp-1', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', 'practica', 'e3000000-0000-4000-8000-000000000031'),
  ('f2000000-0000-4000-8000-000000000032', 'verdadero_falso', 'l-2', 'exp-2', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', 'practica', 'e3000000-0000-4000-8000-000000000031'),
  ('f2000000-0000-4000-8000-000000000033', 'verdadero_falso', 'l-3', 'exp-3', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', 'practica', 'e3000000-0000-4000-8000-000000000032');
insert into public.opciones (id, pregunta_id, texto, es_correcta, orden) values
  ('f3000000-0000-4000-8000-000000000031', 'f2000000-0000-4000-8000-000000000031', 'Verdadero', true, 1),
  ('f3000000-0000-4000-8000-000000000032', 'f2000000-0000-4000-8000-000000000031', 'Falso', false, 2),
  ('f3000000-0000-4000-8000-000000000033', 'f2000000-0000-4000-8000-000000000032', 'Verdadero', true, 1),
  ('f3000000-0000-4000-8000-000000000034', 'f2000000-0000-4000-8000-000000000033', 'Verdadero', true, 1);

select tests.como(tests.uid('ase1@t'));
select is((select count(*)::int from public.probalo_preguntas('e3000000-0000-4000-8000-000000000031')), 2, 'el Probalo trae las preguntas de la lección');
select is((select es_correcta from public.comprobar_probalo('e3000000-0000-4000-8000-000000000031', 'f2000000-0000-4000-8000-000000000031',
  '{"opcion_ids": ["f3000000-0000-4000-8000-000000000032"]}')), false, 'mal: ✗');
select is((select es_correcta from public.comprobar_probalo('e3000000-0000-4000-8000-000000000031', 'f2000000-0000-4000-8000-000000000031',
  '{"opcion_ids": ["f3000000-0000-4000-8000-000000000031"]}')), true, 'bien: ✓');
select results_eq($$select correcta from public.practica_intentos where usuario_id = auth.uid() order by created_at, correcta$$,
  $$values (false), (true)$$, 'cada comprobación queda registrada y el asesor ve las suyas');
select throws_ok($$select * from public.comprobar_probalo('e3000000-0000-4000-8000-000000000031', 'f2000000-0000-4000-8000-000000000033', '{"opcion_ids": []}')$$,
  'P0001', 'no es de esta lección', 'una pregunta de otra lección no se comprueba');
select throws_ok($$insert into public.practica_intentos (usuario_id, pregunta_id, correcta) values (auth.uid(), 'f2000000-0000-4000-8000-000000000031', true)$$,
  '42501', null, 'el asesor no escribe intentos a mano');
select tests.como_postgres();
select ok(not public.item_cumplido('e3000000-0000-4000-8000-000000000031', tests.uid('ase1@t')), 'con 1 de 2 acertadas no se cumple');
select tests.como(tests.uid('ase1@t'));
select is((select es_correcta from public.comprobar_probalo('e3000000-0000-4000-8000-000000000031', 'f2000000-0000-4000-8000-000000000032',
  '{"opcion_ids": ["f3000000-0000-4000-8000-000000000033"]}')), true, 'la segunda también');
select tests.como_postgres();
select ok(public.item_cumplido('e3000000-0000-4000-8000-000000000031', tests.uid('ase1@t')), 'con todas acertadas se cumple');
select tests.como(tests.uid('ase2@t'));
select public.marcar_item('e3000000-0000-4000-8000-000000000031', 'hecho');
select tests.como_postgres();
select ok(not public.item_cumplido('e3000000-0000-4000-8000-000000000031', tests.uid('ase2@t')), 'con Probalo, marcar hecho a mano no alcanza');

-- Sin preguntas publicadas: lo cumplido queda y vuelve a ser "marcar como hecho"
update public.preguntas set estado = 'archivado' where item_id = 'e3000000-0000-4000-8000-000000000031';
select ok(public.item_cumplido('e3000000-0000-4000-8000-000000000031', tests.uid('ase1@t')), 'quien completó el Probalo lo conserva');
select ok(public.item_cumplido('e3000000-0000-4000-8000-000000000031', tests.uid('ase2@t')), 'sin Probalo publicado vale marcar hecho');

-- El editor guarda la pregunta de Probalo con su lección, y el Probalo no se mezcla con prácticas por categoría
select tests.como(tests.uid('adm@t'));
create temp table nueva as select public.guardar_pregunta(jsonb_build_object(
  'tipo', 'verdadero_falso', 'enunciado_md', 'nueva', 'alcance', 'global', 'estado', 'publicado', 'uso', 'practica',
  'item_id', 'e3000000-0000-4000-8000-000000000032', 'categoria_id', (select id from public.categorias where slug = 'reglamento'),
  'opciones', '[{"texto":"V","es_correcta":true,"orden":1},{"texto":"F","es_correcta":false,"orden":2}]'::jsonb)) as id;
select is((select p.item_id from public.preguntas p join nueva n on n.id = p.id),
  'e3000000-0000-4000-8000-000000000032'::uuid, 'guardar_pregunta conserva la lección del Probalo');
select tests.como_postgres();
insert into public.examenes (id, titulo, tipo, categoria_id, cantidad_preguntas, alcance, estado)
values ('f1000000-0000-4000-8000-000000000031', 'T-Práctica cat', 'practica', (select id from public.categorias where slug = 'reglamento'), 10, 'global', 'publicado');
select ok(not exists (select 1 from public.pozo_practica('f1000000-0000-4000-8000-000000000031') q(id)
  join public.preguntas p on p.id = q.id where p.item_id is not null), 'las preguntas de Probalo no entran en otras prácticas');

select * from finish();
rollback;
