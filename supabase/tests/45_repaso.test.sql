-- Repaso diario espaciado: las preguntas de práctica vuelven a 1, 3, 7, 16 y 35 días; racha por día
begin;
select plan(15);
select tests.escenario();
select tests.escenario_cursos();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;

insert into public.modulos (id, curso_id, orden, titulo) values ('e2000000-0000-4000-8000-000000000095', 'e1000000-0000-4000-8000-000000000001', 3, 'MR');
insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito) values
  ('e3000000-0000-4000-8000-000000000095', 'e2000000-0000-4000-8000-000000000095', 1, 'L', 'leccion',
   (select id from public.articulos where alcance = 'global' and estado = 'publicado' limit 1),
   '{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}', 'marcar_hecho');
insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id) values
  ('f2000000-0000-4000-8000-000000000095', 'verdadero_falso', 'r-1', 'exp', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', 'practica', 'e3000000-0000-4000-8000-000000000095'),
  ('f2000000-0000-4000-8000-000000000096', 'verdadero_falso', 'r-2', 'exp', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', 'practica', 'e3000000-0000-4000-8000-000000000095');
insert into public.opciones (id, pregunta_id, texto, es_correcta, orden) values
  ('f3000000-0000-4000-8000-000000000095', 'f2000000-0000-4000-8000-000000000095', 'Verdadero', true, 1),
  ('f3000000-0000-4000-8000-000000000096', 'f2000000-0000-4000-8000-000000000095', 'Falso', false, 2),
  ('f3000000-0000-4000-8000-000000000097', 'f2000000-0000-4000-8000-000000000096', 'Verdadero', true, 1),
  ('f3000000-0000-4000-8000-000000000098', 'f2000000-0000-4000-8000-000000000096', 'Falso', false, 2);

-- Al practicar, la pregunta entra al repaso
select tests.como(tests.uid('ase1@t'));
select public.comprobar_probalo('e3000000-0000-4000-8000-000000000095', 'f2000000-0000-4000-8000-000000000095', '{"opcion_ids": ["f3000000-0000-4000-8000-000000000095"]}');
select public.comprobar_probalo('e3000000-0000-4000-8000-000000000095', 'f2000000-0000-4000-8000-000000000096', '{"opcion_ids": ["f3000000-0000-4000-8000-000000000098"]}');
select results_eq($$select caja, proxima - public.hoy_ar() from public.repaso where pregunta_id = 'f2000000-0000-4000-8000-000000000095'$$,
  $$values (1, 1)$$, 'acertada la primera vez: vuelve mañana');
select results_eq($$select caja, proxima - public.hoy_ar() from public.repaso where pregunta_id = 'f2000000-0000-4000-8000-000000000096'$$,
  $$values (1, 0)$$, 'fallada: vuelve hoy');
select is((select count(*)::int from public.repaso_de_hoy()), 1, 'el repaso de hoy trae solo las vencidas');
select ok(not exists (select 1 from public.repaso_de_hoy() where opciones::text ~ '(es_correcta|grupo|posicion)'), 'sin soluciones');
select is((select pendientes from public.mi_repaso()), 1, 'una pendiente');
select is((select racha from public.mi_repaso()), 0, 'sin racha todavía');

select is((select es_correcta from public.responder_repaso('f2000000-0000-4000-8000-000000000096', '{"opcion_ids": ["f3000000-0000-4000-8000-000000000097"]}')), true, 'responde bien en el repaso');
select results_eq($$select caja, proxima - public.hoy_ar() from public.repaso where pregunta_id = 'f2000000-0000-4000-8000-000000000096'$$,
  $$values (2, 3)$$, 'al acertar sube de caja: vuelve en 3 días');
select results_eq($$select racha, hechas_hoy, pendientes from public.mi_repaso()$$, $$values (1, 1, 0)$$, 'racha de 1 día y nada pendiente');
select throws_ok($$select * from public.responder_repaso('f2000000-0000-4000-8000-000000000095', '{"opcion_ids": []}')$$, 'P0001', null,
  'no se responde una pregunta que no toca hoy');
select throws_ok($$insert into public.repaso (usuario_id, pregunta_id) values (auth.uid(), 'f2000000-0000-4000-8000-000000000095')$$, '42501', null,
  'el repaso no se escribe a mano');
select tests.como_postgres();

-- Fallar en el repaso vuelve a la caja 1; la racha cuenta días seguidos
update public.repaso set proxima = public.hoy_ar(), caja = 4 where pregunta_id = 'f2000000-0000-4000-8000-000000000095';
insert into public.repaso_dias (usuario_id, dia) values (tests.uid('ase1@t'), public.hoy_ar() - 1), (tests.uid('ase1@t'), public.hoy_ar() - 3);
select tests.como(tests.uid('ase1@t'));
select is((select es_correcta from public.responder_repaso('f2000000-0000-4000-8000-000000000095', '{"opcion_ids": ["f3000000-0000-4000-8000-000000000096"]}')), false, 'falla en el repaso');
select results_eq($$select caja, proxima - public.hoy_ar() from public.repaso where pregunta_id = 'f2000000-0000-4000-8000-000000000095'$$,
  $$values (1, 1)$$, 'vuelve a la caja 1 y a mañana');
select is((select racha from public.mi_repaso()), 2, 'la racha cuenta hoy y ayer (corta en el día que faltó)');
select tests.como_postgres();

select tests.como(tests.uid('ase2@t'));
select is((select count(*)::int from public.repaso), 0, 'nadie ve el repaso de otro');
select tests.como_postgres();

select * from finish();
rollback;
