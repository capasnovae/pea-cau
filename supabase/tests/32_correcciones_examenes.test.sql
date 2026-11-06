-- Correcciones de la revisión final de la Etapa 6
begin;
select plan(7);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;

create temp table ids (k text primary key, v uuid);
grant all on ids to authenticated, anon;

-- I1: un final de nivel suelto no se rinde con el nivel bloqueado
insert into public.examenes (id, titulo, tipo, curso_id, cantidad_preguntas, alcance, estado)
values ('f1000000-0000-4000-8000-000000000031', 'T-Final B suelto', 'nivel', 'e1000000-0000-4000-8000-000000000002', 2, 'global', 'publicado');
select tests.como(tests.uid('ase1@t'));
select throws_ok($$select public.iniciar_intento('f1000000-0000-4000-8000-000000000031')$$, 'P0001', 'no disponible', 'final de un nivel bloqueado: no disponible');
select ok(not exists (select 1 from public.mis_examenes() where examen_id = 'f1000000-0000-4000-8000-000000000031'), 'ni aparece en mis exámenes');
select tests.como_postgres();

-- I2: una pregunta de sede solo entra en intentos de esa sede
insert into public.preguntas (id, tipo, enunciado_md, rubrica_md, modulo_id, categoria_id, estado, alcance, sede_id, uso)
values ('f2000000-0000-4000-8000-000000000031', 'libre', 'de NQN', 'r', 'e2000000-0000-4000-8000-000000000001', (select id from public.categorias where slug = 'reglamento'),
        'publicado', 'sede', (select id from public.sedes where nombre = 'T-Neuquén'), 'examen');
insert into public.examenes (id, titulo, tipo, modulo_id, cantidad_preguntas, mezclar, alcance, estado)
values ('f1000000-0000-4000-8000-000000000032', 'T-Ex M1 grande', 'modulo', 'e2000000-0000-4000-8000-000000000001', 10, false, 'global', 'publicado');
select tests.como(tests.uid('aseR@t'));
insert into ids select 'r', public.iniciar_intento('f1000000-0000-4000-8000-000000000032');
select is((select count(*)::int from public.preguntas_intento((select v from ids where k = 'r'))), 3, 'otra sede no recibe la pregunta de NQN');
select tests.como_postgres();
select tests.como(tests.uid('aseV@t'));
insert into ids select 'v', public.iniciar_intento('f1000000-0000-4000-8000-000000000032');
select is((select count(*)::int from public.preguntas_intento((select v from ids where k = 'v'))), 4, 'la sede sí la recibe');
select tests.como_postgres();

-- I3: el coordinador no ve el intento de ventas, pero la pregunta igual cuenta como usada
select tests.como(tests.uid('coordS@t'));
select throws_ok($$select public.guardar_pregunta(jsonb_build_object('id', 'f2000000-0000-4000-8000-000000000031', 'tipo', 'opcion_multiple', 'enunciado_md', 'x',
  'modulo_id', 'e2000000-0000-4000-8000-000000000001', 'alcance', 'sede', 'sede_id', public.mi_sede(), 'estado', 'publicado', 'uso', 'examen',
  'opciones', '[{"texto": "a", "es_correcta": true, "orden": 1}, {"texto": "b", "es_correcta": false, "orden": 2}]'::jsonb))$$,
  'P0001', 'pregunta en uso', 'una pregunta usada en un intento que el editor no ve sigue protegida');
select tests.como_postgres();

-- M3: una certificación vencida no traba el nivel siguiente
insert into public.certificaciones (usuario_id, curso_id, origen, estado)
values (tests.uid('ase2@t'), 'e1000000-0000-4000-8000-000000000001', 'examen', 'vencida');
select tests.como(tests.uid('ase2@t'));
select ok((select bool_and(disponible) from public.estado_curso('e1000000-0000-4000-8000-000000000002')), 'con el nivel anterior vencido, el siguiente sigue abierto');
select tests.como_postgres();

-- M5: una práctica completada no se "descumple" al sumar preguntas
insert into public.modulos (id, curso_id, orden, titulo) values ('e2000000-0000-4000-8000-000000000009', 'e1000000-0000-4000-8000-000000000001', 3, 'MP');
insert into public.preguntas (id, tipo, enunciado_md, modulo_id, estado, alcance, uso)
values ('f2000000-0000-4000-8000-000000000032', 'verdadero_falso', 'p1', 'e2000000-0000-4000-8000-000000000009', 'publicado', 'global', 'practica');
insert into public.opciones (id, pregunta_id, texto, es_correcta, orden) values
  ('f3000000-0000-4000-8000-000000000031', 'f2000000-0000-4000-8000-000000000032', 'Verdadero', true, 1),
  ('f3000000-0000-4000-8000-000000000032', 'f2000000-0000-4000-8000-000000000032', 'Falso', false, 2);
insert into public.examenes (id, titulo, tipo, modulo_id, cantidad_preguntas, alcance, estado)
values ('f1000000-0000-4000-8000-000000000033', 'T-Práctica MP', 'practica', 'e2000000-0000-4000-8000-000000000009', 10, 'global', 'publicado');
insert into public.items (id, modulo_id, orden, titulo, tipo, examen_id, requisito)
values ('e3000000-0000-4000-8000-000000000031', 'e2000000-0000-4000-8000-000000000009', 1, 'Práctica', 'practica', 'f1000000-0000-4000-8000-000000000033', 'marcar_hecho');
select tests.como(tests.uid('ase1@t'));
select public.comprobar_practica('f1000000-0000-4000-8000-000000000033', 'f2000000-0000-4000-8000-000000000032', '{"opcion_ids": ["f3000000-0000-4000-8000-000000000031"]}');
select tests.como_postgres();
insert into public.preguntas (tipo, enunciado_md, rubrica_md, modulo_id, estado, alcance, uso)
values ('libre', 'p2', 'r', 'e2000000-0000-4000-8000-000000000009', 'publicado', 'global', 'practica');
select tests.como(tests.uid('ase1@t'));
select ok((select cumplido from public.estado_curso('e1000000-0000-4000-8000-000000000001') where item_id = 'e3000000-0000-4000-8000-000000000031'),
  'una práctica ya completada sigue cumplida aunque se sumen preguntas');
select tests.como_postgres();

select * from finish();
rollback;
