-- Correcciones del repaso: usuarios desactivados y preguntas de pasos que dejaron de estar disponibles
begin;
select plan(5);
select tests.escenario();
select tests.escenario_cursos();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;

insert into public.modulos (id, curso_id, orden, titulo) values ('e2000000-0000-4000-8000-000000000096', 'e1000000-0000-4000-8000-000000000001', 3, 'MR');
insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito) values
  ('e3000000-0000-4000-8000-000000000096', 'e2000000-0000-4000-8000-000000000096', 1, 'L', 'leccion',
   (select id from public.articulos where alcance = 'global' and estado = 'publicado' limit 1),
   '{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}', 'marcar_hecho');
insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id) values
  ('f2000000-0000-4000-8000-000000000097', 'verdadero_falso', 'r', 'exp', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', 'practica', 'e3000000-0000-4000-8000-000000000096');
insert into public.opciones (id, pregunta_id, texto, es_correcta, orden) values
  ('f3000000-0000-4000-8000-000000000099', 'f2000000-0000-4000-8000-000000000097', 'Verdadero', true, 1),
  ('f3000000-0000-4000-8000-000000000100', 'f2000000-0000-4000-8000-000000000097', 'Falso', false, 2);
insert into public.repaso (usuario_id, pregunta_id, caja, proxima) values
  (tests.uid('ase1@t'), 'f2000000-0000-4000-8000-000000000097', 1, public.hoy_ar()),
  (tests.uid('aseInactivo@t'), 'f2000000-0000-4000-8000-000000000097', 1, public.hoy_ar());

select tests.como(tests.uid('ase1@t'));
select is((select pendientes from public.mi_repaso()), 1, 'con el paso disponible, la pregunta toca hoy');
select tests.como_postgres();

-- El curso vuelve a borrador: la pregunta deja de aparecer y no se puede responder
update public.cursos set estado = 'borrador' where id = 'e1000000-0000-4000-8000-000000000001';
select tests.como(tests.uid('ase1@t'));
select is((select count(*)::int from public.repaso_de_hoy()), 0, 'un paso que ya no está disponible sale del repaso');
select throws_ok($$select * from public.responder_repaso('f2000000-0000-4000-8000-000000000097', '{"opcion_ids": []}')$$,
  'P0001', null, 'y no se puede responder');
select tests.como_postgres();
update public.cursos set estado = 'publicado' where id = 'e1000000-0000-4000-8000-000000000001';

-- Un usuario desactivado no responde ni ve pendientes, aunque conserve la sesión
select tests.como(tests.uid('aseInactivo@t'));
select throws_ok($$select * from public.responder_repaso('f2000000-0000-4000-8000-000000000097', '{"opcion_ids": ["f3000000-0000-4000-8000-000000000099"]}')$$,
  'P0001', 'sin permiso', 'un usuario desactivado no responde el repaso');
select is((select pendientes from public.mi_repaso()), 0, 'ni ve pendientes');
select tests.como_postgres();

select * from finish();
rollback;
