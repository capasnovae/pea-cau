-- Intentos del lado del servidor: iniciar, responder, entregar, revisar
begin;
select plan(32);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;

create temp table ids (k text primary key, v uuid);
grant all on ids to authenticated, anon;

-- Iniciar es idempotente
select tests.como(tests.uid('ase1@t'));
insert into ids select 'i1', public.iniciar_intento('f1000000-0000-4000-8000-000000000001');
select is(public.iniciar_intento('f1000000-0000-4000-8000-000000000001'), (select v from ids where k = 'i1'), 'iniciar de nuevo retoma el mismo intento');
select is((select count(*)::int from public.intentos where examen_id = 'f1000000-0000-4000-8000-000000000001'), 1, 'hay un solo intento');
select is((select count(*)::int from public.preguntas_intento((select v from ids where k = 'i1'))), 3, 'el intento trae 3 preguntas');
select results_eq($$select pregunta_id from public.preguntas_intento((select v from ids where k = 'i1')) order by orden$$,
  $$values ('f2000000-0000-4000-8000-000000000001'::uuid), ('f2000000-0000-4000-8000-000000000002'::uuid), ('f2000000-0000-4000-8000-000000000003'::uuid)$$,
  'sin mezclar, las preguntas salen siempre en el mismo orden (el de alta)');
select ok(not exists (select 1 from public.preguntas_intento((select v from ids where k = 'i1'))
                      where opciones::text ~ '(es_correcta|posicion_correcta|grupo)' or coalesce(config::text, '') ~ 'solucion'),
  'las preguntas no traen respuestas correctas');
select throws_ok($$select * from public.revision_intento((select v from ids where k = 'i1'))$$, 'P0001', 'revisión no disponible', 'sin entregar no hay revisión');
select throws_ok($$select public.guardar_respuesta((select v from ids where k = 'i1'), 'f2000000-0000-4000-8000-000000000001', array['f3000000-0000-4000-8000-000000000004']::uuid[], null, null)$$,
  'P0001', 'opción inválida', 'no acepta opciones de otra pregunta');
select tests.como_postgres();

select tests.como(tests.uid('ase2@t'));
select throws_ok($$select * from public.preguntas_intento((select v from ids where k = 'i1'))$$, 'P0001', 'sin permiso', 'otro asesor no ve el intento');
select throws_ok($$select * from public.revision_intento((select v from ids where k = 'i1'))$$, 'P0001', 'sin permiso', 'ni su revisión');
select throws_ok($$select public.guardar_respuesta((select v from ids where k = 'i1'), 'f2000000-0000-4000-8000-000000000002', array['f3000000-0000-4000-8000-000000000004']::uuid[], null, null)$$,
  'P0001', 'sin permiso', 'ni responde por él');
select tests.como_postgres();

-- Responder todo bien y entregar
select tests.como(tests.uid('ase1@t'));
select public.guardar_respuesta((select v from ids where k = 'i1'), 'f2000000-0000-4000-8000-000000000001', array['f3000000-0000-4000-8000-000000000002', 'f3000000-0000-4000-8000-000000000001']::uuid[], null, null);
select public.guardar_respuesta((select v from ids where k = 'i1'), 'f2000000-0000-4000-8000-000000000002', array['f3000000-0000-4000-8000-000000000005']::uuid[], null, null);
select public.guardar_respuesta((select v from ids where k = 'i1'), 'f2000000-0000-4000-8000-000000000002', array['f3000000-0000-4000-8000-000000000004']::uuid[], null, null);
select public.guardar_respuesta((select v from ids where k = 'i1'), 'f2000000-0000-4000-8000-000000000003', null,
  array['f3000000-0000-4000-8000-000000000006', 'f3000000-0000-4000-8000-000000000007', 'f3000000-0000-4000-8000-000000000008']::uuid[], null);
select results_eq($$select estado::text, nota, aprobado from public.entregar_intento((select v from ids where k = 'i1'))$$,
  $$values ('cerrado', 100, true)$$, 'todo bien: cerrado con 100 y aprobado (cambiar la respuesta antes de entregar vale)');
select results_eq($$select estado::text, nota, aprobado from public.entregar_intento((select v from ids where k = 'i1'))$$,
  $$values ('cerrado', 100, true)$$, 'entregar de nuevo no cambia nada');
select is((select count(*)::int from public.respuestas where intento_id = (select v from ids where k = 'i1')), 3, 'sin respuestas duplicadas');
select is((select explicacion_md from public.revision_intento((select v from ids where k = 'i1')) where pregunta_id = 'f2000000-0000-4000-8000-000000000001'),
  'exp-om', 'después de entregar, la revisión trae la explicación');
select throws_ok($$select public.iniciar_intento('f1000000-0000-4000-8000-000000000001')$$, 'P0001', 'ya aprobado', 'no se rinde de nuevo lo aprobado');
select ok((select aprobado from public.mis_examenes() where examen_id = 'f1000000-0000-4000-8000-000000000001'), 'mis_examenes lo muestra aprobado');
select tests.como_postgres();

select tests.como(tests.uid('coordS@t'));
select ok((select es_correcta from public.revision_intento((select v from ids where k = 'i1')) where pregunta_id = 'f2000000-0000-4000-8000-000000000003'),
  'el coordinador de su sede y área ve la revisión');
select tests.como_postgres();

-- Paso de curso con requisito "aprobar"
insert into public.items (modulo_id, orden, titulo, tipo, examen_id, requisito)
values ('e2000000-0000-4000-8000-000000000002', 9, 'Examen M1', 'examen', 'f1000000-0000-4000-8000-000000000001', 'aprobar');
select tests.como(tests.uid('ase1@t'));
select ok((select cumplido from public.estado_curso('e1000000-0000-4000-8000-000000000001') where titulo = 'Examen M1'),
  'el paso "aprobar" queda cumplido al aprobar el examen');
select tests.como_postgres();

-- Tiempo límite y corrección manual pendiente
update public.examenes set tiempo_limite_min = 10 where id = 'f1000000-0000-4000-8000-000000000002';
select tests.como(tests.uid('ase1@t'));
insert into ids select 'i2', public.iniciar_intento('f1000000-0000-4000-8000-000000000002');
select tests.como_postgres();
update public.intentos set vence_at = now() - interval '10 minutes' where id = (select v from ids where k = 'i2');
select tests.como(tests.uid('ase1@t'));
select throws_ok($$select public.guardar_respuesta((select v from ids where k = 'i2'), 'f2000000-0000-4000-8000-000000000004', null, null, 'tarde')$$,
  'P0001', 'tiempo agotado', 'después del tiempo más la gracia no guarda');
select tests.como_postgres();
update public.intentos set vence_at = now() + interval '5 minutes' where id = (select v from ids where k = 'i2');
select tests.como(tests.uid('ase1@t'));
select public.guardar_respuesta((select v from ids where k = 'i2'), 'f2000000-0000-4000-8000-000000000004', null, null, 'Mi respuesta');
select is((select estado::text from public.entregar_intento((select v from ids where k = 'i2'))), 'pendiente_correccion', 'con libre queda pendiente');
select ok((select correccion_vence_at between now() + interval '71 hours' and now() + interval '73 hours' from public.intentos where id = (select v from ids where k = 'i2')),
  'con plazo de 72 h');
select tests.como_postgres();

-- Ciclos y simulación como bloque
update public.examenes set max_intentos = 1 where id = 'f1000000-0000-4000-8000-000000000003';
select tests.como(tests.uid('ase1@t'));
insert into ids select 'i3', public.iniciar_intento('f1000000-0000-4000-8000-000000000003');
select results_eq($$select pregunta_id from public.preguntas_intento((select v from ids where k = 'i3')) order by orden$$,
  $$values ('f2000000-0000-4000-8000-000000000005'::uuid), ('f2000000-0000-4000-8000-000000000006'::uuid)$$, 'el caso viene completo y en orden');
select public.guardar_respuesta((select v from ids where k = 'i3'), 'f2000000-0000-4000-8000-000000000005', array['f3000000-0000-4000-8000-000000000010']::uuid[], null, null);
select is((select aprobado from public.entregar_intento((select v from ids where k = 'i3'))), false, 'mal respondido: no aprueba');
select throws_ok($$select public.iniciar_intento('f1000000-0000-4000-8000-000000000003')$$, 'P0001', 'en espera', 'ciclo agotado: en espera');
select tests.como_postgres();
update public.intentos set entregado_at = now() - interval '25 hours' where id = (select v from ids where k = 'i3');
select tests.como(tests.uid('ase1@t'));
insert into ids select 'i3b', public.iniciar_intento('f1000000-0000-4000-8000-000000000003');
select is((select ciclo from public.intentos where id = (select v from ids where k = 'i3b')), 2, 'pasada la espera, ciclo nuevo');
select tests.como_postgres();

-- Cuadro y formulario simulado
select tests.como(tests.uid('ase1@t'));
insert into ids select 'i4', public.iniciar_intento('f1000000-0000-4000-8000-000000000004');
select public.guardar_respuesta((select v from ids where k = 'i4'), 'f2000000-0000-4000-8000-000000000007', null, null, null,
  '{"f3000000-0000-4000-8000-000000000013": "CAU", "f3000000-0000-4000-8000-000000000014": "Tesorería"}');
select public.guardar_respuesta((select v from ids where k = 'i4'), 'f2000000-0000-4000-8000-000000000008', null, null, null,
  '{"area": "  mesa de AYUDA ", "prioridad": "Alta"}');
select is((select nota from public.entregar_intento((select v from ids where k = 'i4'))), 100, 'cuadro y formulario corregidos (texto normalizado)');
select tests.como_postgres();

-- Pozo: chico, vacío, integrador y preguntas de práctica
insert into public.preguntas (tipo, enunciado_md, explicacion_md, modulo_id, categoria_id, estado, alcance, uso)
values ('verdadero_falso', 'práctica', '', 'e2000000-0000-4000-8000-000000000001', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', 'practica');
insert into public.examenes (id, titulo, tipo, modulo_id, cantidad_preguntas, alcance, estado) values
  ('f1000000-0000-4000-8000-000000000008', 'T-Ex grande', 'modulo', 'e2000000-0000-4000-8000-000000000001', 10, 'global', 'publicado'),
  ('f1000000-0000-4000-8000-000000000009', 'T-Ex vacío', 'modulo', 'e2000000-0000-4000-8000-000000000005', 5, 'global', 'publicado');
select tests.como(tests.uid('ase2@t'));
insert into ids select 'i6', public.iniciar_intento('f1000000-0000-4000-8000-000000000008');
select is((select count(*)::int from public.preguntas_intento((select v from ids where k = 'i6'))), 3,
  'con menos preguntas que las pedidas, sortea todas (y nunca las de práctica)');
select throws_ok($$select public.iniciar_intento('f1000000-0000-4000-8000-000000000009')$$, 'P0001', 'sin preguntas', 'pozo vacío');
select tests.como_postgres();
update public.examenes set cantidad_preguntas = 10 where id = 'f1000000-0000-4000-8000-000000000003';
select tests.como(tests.uid('ase2@t'));
insert into ids select 'i7', public.iniciar_intento('f1000000-0000-4000-8000-000000000003');
select is((select count(*)::int from public.preguntas_intento((select v from ids where k = 'i7'))), 2, 'un caso entra una sola vez aunque falten preguntas');
insert into ids select 'i5', public.iniciar_intento('f1000000-0000-4000-8000-000000000007');
select tests.como_postgres();
select is((select count(*)::int from public.intento_preguntas ip join public.preguntas p on p.id = ip.pregunta_id
           where ip.intento_id = (select v from ids where k = 'i5') and p.modulo_id = 'e2000000-0000-4000-8000-000000000001'), 1,
  'integrador: respeta el cupo de la fuente');
select is((select count(*)::int from public.intento_preguntas where intento_id = (select v from ids where k = 'i5')), 3, 'integrador: completa la cantidad');

select tests.como_anon();
select throws_ok($$select public.iniciar_intento('f1000000-0000-4000-8000-000000000001')$$, '42501', null, 'anon no inicia');
select tests.como_postgres();

select * from finish();
rollback;
