-- Cola de corrección por sede
begin;
select plan(15);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();
select tests.crear_usuario('coordR@t', 'coordinador', 'T-Roca', 'servicio');

create temp table ids (k text primary key, v uuid);
grant all on ids to authenticated, anon;

select tests.como(tests.uid('ase1@t'));
insert into ids select 'i', public.iniciar_intento('f1000000-0000-4000-8000-000000000002');
select public.guardar_respuesta((select v from ids where k = 'i'), 'f2000000-0000-4000-8000-000000000004', null, null, 'Le explico el trámite.');
select public.entregar_intento((select v from ids where k = 'i'));
select is((select count(*)::int from public.cola_correccion()), 0, 'el asesor no tiene cola');
select tests.como_postgres();

select tests.como(tests.uid('coordR@t'));
select is((select count(*)::int from public.cola_correccion()), 0, 'otra sede no lo ve');
select throws_ok($$select public.tomar_correccion((select v from ids where k = 'i'))$$, 'P0001', 'sin permiso', 'ni lo toma');
select tests.como_postgres();

select tests.como(tests.uid('lider1@t'));
select is((select count(*)::int from public.cola_correccion()), 1, 'el líder de la sede lo ve');
select public.tomar_correccion((select v from ids where k = 'i'));
select tests.como_postgres();

select tests.como(tests.uid('coordS@t'));
select ok((select tomado_por is not null and not tomado_por_mi from public.cola_correccion() where intento_id = (select v from ids where k = 'i')),
  'figura tomado por otra persona');
select throws_ok($$select public.tomar_correccion((select v from ids where k = 'i'))$$, 'P0001', 'ya lo tomó otra persona', 'dos no lo toman a la vez');
select tests.como_postgres();
update public.intentos set tomado_at = now() - interval '25 hours' where id = (select v from ids where k = 'i');
select tests.como(tests.uid('coordS@t'));
select lives_ok($$select public.tomar_correccion((select v from ids where k = 'i'))$$, 'pasadas 24 h vuelve a la cola y lo toma otro');
select is((select count(*)::int from public.respuestas_a_corregir((select v from ids where k = 'i'))), 1, 've la respuesta libre');
insert into ids select 'r', respuesta_id from public.respuestas_a_corregir((select v from ids where k = 'i'));
select throws_ok($$select public.cerrar_correccion((select v from ids where k = 'i'))$$, 'P0001', 'faltan respuestas', 'no cierra sin corregir todo');
select throws_ok($$select public.corregir_respuesta((select v from ids where k = 'r'), 3, 'x')$$, 'P0001', 'puntaje inválido', 'no pasa el máximo');
select public.corregir_respuesta((select v from ids where k = 'r'), 2, 'Muy bien');
select results_eq($$select nota, aprobado from public.cerrar_correccion((select v from ids where k = 'i'))$$, $$values (100, true)$$,
  'al cerrar se calcula la nota');
select is((select estado::text from public.intentos where id = (select v from ids where k = 'i')), 'cerrado', 'el intento queda cerrado');
select tests.como_postgres();

-- El propio intento no aparece en la cola de quien lo rindió
select tests.como(tests.uid('lider1@t'));
insert into ids select 'p', public.iniciar_intento('f1000000-0000-4000-8000-000000000002');
select public.guardar_respuesta((select v from ids where k = 'p'), 'f2000000-0000-4000-8000-000000000004', null, null, 'Mi respuesta');
select public.entregar_intento((select v from ids where k = 'p'));
select is((select count(*)::int from public.cola_correccion()), 0, 'nadie ve su propio intento en la cola');
select throws_ok($$select public.tomar_correccion((select v from ids where k = 'p'))$$, 'P0001', 'sin permiso', 'ni lo corrige');
select tests.como_postgres();
update public.intentos set correccion_vence_at = now() - interval '1 hour' where id = (select v from ids where k = 'p');
select tests.como(tests.uid('coordS@t'));
select ok((select vencida from public.cola_correccion() where intento_id = (select v from ids where k = 'p')), 'pasado el plazo sale vencida');
select tests.como_postgres();

select * from finish();
rollback;
