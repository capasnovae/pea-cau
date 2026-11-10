-- estado_curso indica qué lecciones tienen Probalo publicado (visible para quien consulta)
begin;
select plan(2);
select tests.escenario();
select tests.escenario_cursos();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;
insert into public.modulos (id, curso_id, orden, titulo) values ('e2000000-0000-4000-8000-000000000009', 'e1000000-0000-4000-8000-000000000001', 3, 'ML');
insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito) values
  ('e3000000-0000-4000-8000-000000000061', 'e2000000-0000-4000-8000-000000000009', 1, 'Con', 'leccion',
   (select id from public.articulos where alcance = 'global' and estado = 'publicado' limit 1),
   '{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}', 'marcar_hecho'),
  ('e3000000-0000-4000-8000-000000000062', 'e2000000-0000-4000-8000-000000000009', 2, 'Sin', 'leccion',
   (select id from public.articulos where alcance = 'global' and estado = 'publicado' limit 1),
   '{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}', 'marcar_hecho');
insert into public.preguntas (tipo, enunciado_md, categoria_id, estado, alcance, uso, item_id) values
  ('verdadero_falso', 'p', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', 'practica', 'e3000000-0000-4000-8000-000000000061');
select tests.como(tests.uid('ase1@t'));
select is((select con_probalo from public.estado_curso('e1000000-0000-4000-8000-000000000001') where item_id = 'e3000000-0000-4000-8000-000000000061'), true, 'con Probalo publicado');
select is((select con_probalo from public.estado_curso('e1000000-0000-4000-8000-000000000001') where item_id = 'e3000000-0000-4000-8000-000000000062'), false, 'sin Probalo');
select tests.como_postgres();
select * from finish();
rollback;
