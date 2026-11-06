-- Prácticas simuladas: devolución inmediata, sin revelar exámenes, y paso cumplido al acertar todo
begin;
select plan(9);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;

-- Práctica sobre un módulo propio, con un V/F y un cuadro
insert into public.modulos (id, curso_id, orden, titulo) values ('e2000000-0000-4000-8000-000000000009', 'e1000000-0000-4000-8000-000000000001', 3, 'MP');
insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, modulo_id, categoria_id, estado, alcance, uso, config) values
  ('f2000000-0000-4000-8000-000000000021', 'verdadero_falso', 'p-vf', 'exp-p-vf', 'e2000000-0000-4000-8000-000000000009', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', 'practica', null),
  ('f2000000-0000-4000-8000-000000000022', 'clasificar', 'p-cla', 'exp-p-cla', 'e2000000-0000-4000-8000-000000000009', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', 'practica', '{"columnas": ["A", "B"]}');
insert into public.opciones (id, pregunta_id, texto, es_correcta, grupo, orden) values
  ('f3000000-0000-4000-8000-000000000021', 'f2000000-0000-4000-8000-000000000021', 'Verdadero', true, null, 1),
  ('f3000000-0000-4000-8000-000000000022', 'f2000000-0000-4000-8000-000000000021', 'Falso', false, null, 2),
  ('f3000000-0000-4000-8000-000000000023', 'f2000000-0000-4000-8000-000000000022', 'uno', false, 'A', 1),
  ('f3000000-0000-4000-8000-000000000024', 'f2000000-0000-4000-8000-000000000022', 'dos', false, 'B', 2);
insert into public.examenes (id, titulo, tipo, modulo_id, cantidad_preguntas, alcance, estado)
values ('f1000000-0000-4000-8000-000000000021', 'T-Práctica', 'practica', 'e2000000-0000-4000-8000-000000000009', 10, 'global', 'publicado');
insert into public.items (id, modulo_id, orden, titulo, tipo, examen_id, requisito)
values ('e3000000-0000-4000-8000-000000000021', 'e2000000-0000-4000-8000-000000000009', 1, 'Práctica', 'practica', 'f1000000-0000-4000-8000-000000000021', 'marcar_hecho');

select tests.como(tests.uid('ase1@t'));
select is((select count(*)::int from public.practica_preguntas('f1000000-0000-4000-8000-000000000021')), 2, 'la práctica trae sus preguntas');
select ok(not exists (select 1 from public.practica_preguntas('f1000000-0000-4000-8000-000000000021')
                      where opciones::text ~ '(es_correcta|grupo|posicion)' or coalesce(config::text, '') ~ 'solucion'),
  'sin soluciones antes de comprobar');
select results_eq($$select es_correcta, solucion is not null from public.comprobar_practica('f1000000-0000-4000-8000-000000000021', 'f2000000-0000-4000-8000-000000000021',
  '{"opcion_ids": ["f3000000-0000-4000-8000-000000000022"]}')$$, $$values (false, true)$$, 'mal: ✗ con la solución');
select is((select count(*)::int from public.practica_progreso), 0, 'un error no suma progreso');
select is((select es_correcta from public.comprobar_practica('f1000000-0000-4000-8000-000000000021', 'f2000000-0000-4000-8000-000000000021',
  '{"opcion_ids": ["f3000000-0000-4000-8000-000000000021"]}')), true, 'bien: ✓');
select ok(not (select cumplido from public.estado_curso('e1000000-0000-4000-8000-000000000001') where item_id = 'e3000000-0000-4000-8000-000000000021'),
  'con una sola acertada, el paso todavía no se cumple');
select is((select es_correcta from public.comprobar_practica('f1000000-0000-4000-8000-000000000021', 'f2000000-0000-4000-8000-000000000022',
  '{"valores": {"f3000000-0000-4000-8000-000000000023": "A", "f3000000-0000-4000-8000-000000000024": "B"}}')), true, 'el cuadro también');
select ok((select cumplido from public.estado_curso('e1000000-0000-4000-8000-000000000001') where item_id = 'e3000000-0000-4000-8000-000000000021'),
  'acertadas todas, el paso queda cumplido');
select throws_ok($$select * from public.comprobar_practica('f1000000-0000-4000-8000-000000000021', 'f2000000-0000-4000-8000-000000000001', '{"opcion_ids": []}')$$,
  'P0001', 'no es de práctica', 'una pregunta de examen no se comprueba en la práctica');
select tests.como_postgres();

select * from finish();
rollback;
