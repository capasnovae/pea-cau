-- Correcciones de la revisión de la Etapa 9: reexamen real, recertificación anticipada, mini examen único,
-- panel después de recertificar y avisos de consignas sin avalancha
begin;
select plan(11);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;
update public.cursos set vigencia_meses = 12 where id = 'e1000000-0000-4000-8000-000000000001';

-- ase1 aprobó el final hace 13 meses y su certificación venció
insert into public.intentos (usuario_id, examen_id, estado, iniciado_at, entregado_at, cerrado_at, nota, aprobado)
values (tests.uid('ase1@t'), 'f1000000-0000-4000-8000-000000000005', 'cerrado', now() - interval '13 months', now() - interval '13 months', now() - interval '13 months', 90, true);
insert into public.certificaciones (usuario_id, curso_id, origen, emitida_at, vence_at)
values (tests.uid('ase1@t'), 'e1000000-0000-4000-8000-000000000001', 'examen', now() - interval '13 months', now() - interval '1 month');
select public.procesar_recertificacion();

select tests.como(tests.uid('ase1@t'));
select is((select aprobado from public.mis_examenes() where examen_id = 'f1000000-0000-4000-8000-000000000005'), false,
  'con la certificación vencida, el final vuelve a figurar para rendir');
select lives_ok($$select public.iniciar_intento('f1000000-0000-4000-8000-000000000005')$$, 'y se puede iniciar el reexamen');
select tests.como_postgres();

-- ase2: aprobó y tiene la certificación vigente por 200 días más: no lo rinde de nuevo
insert into public.intentos (usuario_id, examen_id, estado, entregado_at, cerrado_at, nota, aprobado)
values (tests.uid('ase2@t'), 'f1000000-0000-4000-8000-000000000005', 'cerrado', now() - interval '5 months', now() - interval '5 months', 90, true);
insert into public.certificaciones (usuario_id, curso_id, origen, emitida_at, vence_at)
values (tests.uid('ase2@t'), 'e1000000-0000-4000-8000-000000000001', 'examen', now() - interval '5 months', now() + interval '200 days');
select tests.como(tests.uid('ase2@t'));
select throws_ok($$select public.iniciar_intento('f1000000-0000-4000-8000-000000000005')$$, 'P0001', 'ya aprobado', 'vigente por mucho tiempo: ya aprobado');
select tests.como_postgres();

-- Recertificación anticipada: a 10 días de vencer, aprobar de nuevo extiende desde el vencimiento
update public.certificaciones set vence_at = now() + interval '10 days' where usuario_id = tests.uid('ase2@t');
select tests.como(tests.uid('ase2@t'));
select is((select aprobado from public.mis_examenes() where examen_id = 'f1000000-0000-4000-8000-000000000005'), false,
  'dentro de los 30 días se puede recertificar antes de que venza');
select tests.como_postgres();
create temp table ids as select gen_random_uuid() as id;
insert into public.intentos (id, usuario_id, examen_id, estado, entregado_at, cerrado_at, nota, aprobado)
select id, tests.uid('ase2@t'), 'f1000000-0000-4000-8000-000000000005', 'cerrado', now(), now(), 95, true from ids;
select public.aplicar_efectos((select id from ids));
select ok((select vence_at > now() + interval '12 months' from public.certificaciones
           where usuario_id = tests.uid('ase2@t') and estado = 'vigente'), 'la nueva vence 12 meses después del vencimiento anterior');
select is((select count(*)::int from public.certificaciones where usuario_id = tests.uid('ase2@t') and estado = 'vigente'), 1,
  'y queda una sola vigente');
select is((select perdida_at from public.usuario_insignias ui join public.insignias i on i.id = ui.insignia_id
           where ui.usuario_id = tests.uid('ase2@t') and i.curso_id = 'e1000000-0000-4000-8000-000000000001'), null, 'sin perder la insignia');

-- Panel: después de recertificar no figura como certificación vencida
create temp table ids1 as select gen_random_uuid() as id;
insert into public.intentos (id, usuario_id, examen_id, estado, entregado_at, cerrado_at, nota, aprobado)
select id, tests.uid('ase1@t'), 'f1000000-0000-4000-8000-000000000005', 'cerrado', now(), now(), 95, true from ids1;
select public.aplicar_efectos((select id from ids1));
select tests.como(tests.uid('coordS@t'));
select is((select cert_vencidas from public.panel_asesores() where usuario_id = tests.uid('ase1@t')), 0,
  'el panel no muestra a recertificar a quien ya recertificó');
select tests.como_postgres();

-- Un mini examen es de una sola actualización, y tiene que estar publicado y ser global
insert into public.examenes (id, titulo, tipo, categoria_id, cantidad_preguntas, alcance, estado) values
  ('f1000000-0000-4000-8000-000000000091', 'T-Mini', 'actualizacion', (select id from public.categorias where slug = 'reglamento'), 1, 'global', 'publicado'),
  ('f1000000-0000-4000-8000-000000000092', 'T-Mini borrador', 'actualizacion', (select id from public.categorias where slug = 'reglamento'), 1, 'global', 'borrador');
select tests.como(tests.uid('adm@t'));
select public.publicar_actualizacion(jsonb_build_object('titulo', 'A', 'plazo_dias', 5, 'modulo_id', 'e2000000-0000-4000-8000-000000000001',
  'examen_id', 'f1000000-0000-4000-8000-000000000091'));
select throws_ok($$select public.publicar_actualizacion(jsonb_build_object('titulo', 'B', 'plazo_dias', 5, 'modulo_id', 'e2000000-0000-4000-8000-000000000001',
  'examen_id', 'f1000000-0000-4000-8000-000000000091'))$$, 'P0001', null, 'no se reusa el mini examen de otra actualización');
select throws_ok($$select public.publicar_actualizacion(jsonb_build_object('titulo', 'C', 'plazo_dias', 5, 'modulo_id', 'e2000000-0000-4000-8000-000000000001',
  'examen_id', 'f1000000-0000-4000-8000-000000000092'))$$, 'P0001', null, 'ni uno sin publicar');
select tests.como_postgres();

-- Avisos de consignas vencidas: solo las recientes (sin avalancha con el historial)
insert into public.consignas (id, sede_id, area, creada_por, tipo, titulo, destino, destino_usuario_id) values
  ('44444444-4444-4444-4444-444444444481', (select id from public.sedes where nombre = 'T-Neuquén'), 'servicio', tests.uid('coordS@t'), 'tarea', 'Vieja', 'usuario', tests.uid('aseV@t')),
  ('44444444-4444-4444-4444-444444444482', (select id from public.sedes where nombre = 'T-Neuquén'), 'servicio', tests.uid('coordS@t'), 'tarea', 'Reciente', 'usuario', tests.uid('aseV@t'));
delete from public.consigna_asignaciones where consigna_id in ('44444444-4444-4444-4444-444444444481', '44444444-4444-4444-4444-444444444482');
insert into public.consigna_asignaciones (consigna_id, usuario_id, periodo, vence_el, estado) values
  ('44444444-4444-4444-4444-444444444481', tests.uid('aseV@t'), current_date - 60, current_date - 40, 'vencida'),
  ('44444444-4444-4444-4444-444444444482', tests.uid('aseV@t'), current_date - 10, current_date - 1, 'vencida');
select public.job_diario();
select results_eq($$select mensaje from public.alertas where usuario_id = tests.uid('aseV@t') and tipo = 'consigna_vencida'$$,
  $$values ('Reciente')$$, 'avisa solo las consignas que vencieron hace poco');

select * from finish();
rollback;
