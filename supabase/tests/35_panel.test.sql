-- Panel de coordinación: alcance por rol, atrasados, tasa por pregunta y cola de corrección
begin;
select plan(17);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();

create temp table r as select 1;
grant all on r to authenticated;

-- Actividad: ase1 practicó hace 2 días; ase2 sin actividad
insert into public.preguntas (id, tipo, enunciado_md, categoria_id, estado, alcance, uso) values
  ('f2000000-0000-4000-8000-000000000041', 'verdadero_falso', 'pp', (select id from public.categorias where slug = 'reglamento'), 'publicado', 'global', 'practica');
insert into public.practica_intentos (usuario_id, pregunta_id, correcta, created_at) values
  (tests.uid('ase1@t'), 'f2000000-0000-4000-8000-000000000041', true, now() - interval '2 days'),
  (tests.uid('ase1@t'), 'f2000000-0000-4000-8000-000000000041', false, now() - interval '5 days');

-- Una consigna vencida y una certificación por vencer para ase1
insert into public.consignas (id, sede_id, area, creada_por, tipo, titulo, destino, destino_usuario_id)
values ('44444444-4444-4444-4444-444444444491', (select id from public.sedes where nombre = 'T-Neuquén'), 'servicio',
        tests.uid('coordS@t'), 'tarea', 'C', 'usuario', tests.uid('ase1@t'));
update public.consigna_asignaciones set vence_el = current_date - 3, estado = 'vencida'
where consigna_id = '44444444-4444-4444-4444-444444444491';
insert into public.certificaciones (usuario_id, curso_id, origen, vence_at)
values (tests.uid('ase1@t'), 'e1000000-0000-4000-8000-000000000001', 'examen', now() + interval '10 days');

-- Tasa: la pregunta om (f2..01) en 4 intentos cerrados: 2 bien, 1 mal, 1 sin responder
create temp table ints as
select gen_random_uuid() as id, u, ok from (values ('ase1@t', true), ('ase2@t', true), ('aseV@t', false), ('aseR@t', null)) v(u, ok);
insert into public.intentos (id, usuario_id, examen_id, estado, iniciado_at, entregado_at, cerrado_at, nota, aprobado)
select id, tests.uid(u), 'f1000000-0000-4000-8000-000000000001', 'cerrado', now() - interval '10 days', now() - interval '10 days', now(), 0, false from ints;
insert into public.intento_preguntas (intento_id, pregunta_id, orden) select id, 'f2000000-0000-4000-8000-000000000001', 1 from ints;
insert into public.respuestas (intento_id, pregunta_id, es_correcta) select id, 'f2000000-0000-4000-8000-000000000001', ok from ints where ok is not null;

-- Cola: un intento pendiente de ase2 entregado hace 4 días
insert into public.intentos (usuario_id, examen_id, sede_id, estado, iniciado_at, entregado_at)
values (tests.uid('ase2@t'), 'f1000000-0000-4000-8000-000000000002', (select id from public.sedes where nombre = 'T-Neuquén'),
        'pendiente_correccion', now() - interval '4 days', now() - interval '4 days');

-- Alcance
select tests.como(tests.uid('ase1@t'));
select throws_ok($$select * from public.panel_asesores()$$, 'P0001', 'sin permiso', 'un asesor no ve el panel');
select throws_ok($$select * from public.panel_preguntas()$$, 'P0001', 'sin permiso', 'ni la tasa por pregunta');
select throws_ok($$select * from public.panel_correccion()$$, 'P0001', 'sin permiso', 'ni la cola');
select tests.como_postgres();
select ok(not has_function_privilege('anon', 'public.panel_asesores()', 'execute'), 'anon no ejecuta el panel');
select ok(not has_function_privilege('authenticated', 'public.ruta_de(uuid)', 'execute'), 'ruta_de es interna');

select tests.como(tests.uid('lider1@t'));
select results_eq($$select email::text from public.panel_asesores() a join public.perfiles p on p.id = a.usuario_id order by 1$$,
  $$values ('ase1@t')$$, 'el líder ve solo a su equipo');
select tests.como_postgres();
select tests.como(tests.uid('coordS@t'));
select results_eq($$select email::text from public.panel_asesores() a join public.perfiles p on p.id = a.usuario_id order by 1$$,
  $$values ('ase1@t'), ('ase2@t')$$, 'el coordinador ve su sede y área (sin inactivos)');
select results_eq($$select consignas_vencidas, cert_por_vencer, cert_vencidas from public.panel_asesores() where usuario_id = tests.uid('ase1@t')$$,
  $$values (1, 1, 0)$$, 'cuenta consignas vencidas y certificaciones por vencer');
select ok((select ultima_actividad between now() - interval '2 days 1 minute' and now() - interval '47 hours'
           from public.panel_asesores() where usuario_id = tests.uid('ase1@t')), 'la última actividad es la práctica más reciente');
select ok((select ultima_actividad between now() - interval '4 days 1 minute' and now() - interval '95 hours'
           from public.panel_asesores() where usuario_id = tests.uid('ase2@t')), 'también cuenta el intento más reciente');
select is((select cursos_total > 0 from public.panel_asesores() where usuario_id = tests.uid('ase1@t')), true, 'trae el avance de la ruta');
select results_eq($$select pendientes, vencidos from public.panel_correccion()$$, $$values (1, 1)$$, 'la cola de su sede, con el vencido');
select results_eq($$select respuestas, aciertos from public.panel_preguntas() where pregunta_id = 'f2000000-0000-4000-8000-000000000001'$$,
  $$values (2, 2)$$, 'el coordinador solo cuenta respuestas de su gente');
select ok(not exists (select 1 from public.panel_preguntas() where tipo = 'libre'), 'las preguntas libres no entran en la tasa');
select tests.como_postgres();

select tests.como(tests.uid('adm@t'));
select results_eq($$select respuestas, aciertos from public.panel_preguntas() where pregunta_id = 'f2000000-0000-4000-8000-000000000001'$$,
  $$values (4, 2)$$, 'el admin ve todo: sin responder cuenta como error');
select results_eq($$select respuestas, aciertos from public.panel_preguntas() where pregunta_id = 'f2000000-0000-4000-8000-000000000041'$$,
  $$values (2, 1)$$, 'las prácticas suman con cada comprobación');
select ok((select count(*) from public.panel_asesores() a join public.perfiles p on p.id = a.usuario_id where p.email like '%@t') = 4,
  'el admin ve a los cuatro asesores activos');
select tests.como_postgres();

select * from finish();
rollback;
