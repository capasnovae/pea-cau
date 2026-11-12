-- Probalo con explicación por opción: se ve solo después de responder, nunca antes
begin;
select plan(5);
select tests.escenario();
select tests.escenario_cursos();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;

insert into public.modulos (id, curso_id, orden, titulo) values ('e2000000-0000-4000-8000-000000000097', 'e1000000-0000-4000-8000-000000000001', 3, 'MX');
insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito) values
  ('e3000000-0000-4000-8000-000000000097', 'e2000000-0000-4000-8000-000000000097', 1, 'L', 'leccion',
   (select id from public.articulos where alcance = 'global' and estado = 'publicado' limit 1),
   '{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}', 'marcar_hecho');
insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id) values
  ('f2000000-0000-4000-8000-000000000098', 'opcion_multiple', 'caso', 'regla', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', 'practica', 'e3000000-0000-4000-8000-000000000097');
insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion) values
  ('f3000000-0000-4000-8000-000000000101', 'f2000000-0000-4000-8000-000000000098', 'Bien', true, 1, 'Porque sí'),
  ('f3000000-0000-4000-8000-000000000102', 'f2000000-0000-4000-8000-000000000098', 'Mal', false, 2, 'Porque no');

select has_column('public', 'opciones', 'explicacion', 'las opciones tienen su explicación');
select throws_ok($$insert into public.opciones (pregunta_id, texto, explicacion) values ('f2000000-0000-4000-8000-000000000098', 'x', repeat('a', 401))$$,
  '23514', null, 'la explicación de una opción es corta');

select tests.como(tests.uid('ase1@t'));
select ok(not exists (select 1 from public.probalo_preguntas('e3000000-0000-4000-8000-000000000097') where opciones::text ~ 'Porque'),
  'antes de responder no se ve ninguna explicación');
select is((select solucion -> 'explicaciones' ->> 'f3000000-0000-4000-8000-000000000102'
           from public.comprobar_probalo('e3000000-0000-4000-8000-000000000097', 'f2000000-0000-4000-8000-000000000098',
                                         '{"opcion_ids": ["f3000000-0000-4000-8000-000000000102"]}')),
  'Porque no', 'al responder llega la explicación de la opción elegida');
select is((select jsonb_typeof(solucion -> 'explicaciones')
           from public.comprobar_probalo('e3000000-0000-4000-8000-000000000097', 'f2000000-0000-4000-8000-000000000098',
                                         '{"opcion_ids": ["f3000000-0000-4000-8000-000000000101"]}')),
  'object', 'y la de todas las opciones');
select tests.como_postgres();

select * from finish();
rollback;
