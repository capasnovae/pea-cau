-- Certificación de nivel al aprobar el examen final y desbloqueo del nivel siguiente
begin;
select plan(6);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;
update public.cursos set vigencia_meses = 12 where id = 'e1000000-0000-4000-8000-000000000001';

create temp table ids (k text primary key, v uuid);
grant all on ids to authenticated, anon;

select tests.como(tests.uid('ase1@t'));
select ok(not (select bool_and(disponible) from public.estado_curso('e1000000-0000-4000-8000-000000000002')), 'antes, el Nivel B está bloqueado');
insert into ids select 'i', public.iniciar_intento('f1000000-0000-4000-8000-000000000005');
select public.guardar_respuesta((select v from ids), 'f2000000-0000-4000-8000-000000000001', array['f3000000-0000-4000-8000-000000000001', 'f3000000-0000-4000-8000-000000000002']::uuid[], null, null);
select public.guardar_respuesta((select v from ids), 'f2000000-0000-4000-8000-000000000002', array['f3000000-0000-4000-8000-000000000004']::uuid[], null, null);
select public.guardar_respuesta((select v from ids), 'f2000000-0000-4000-8000-000000000003', null,
  array['f3000000-0000-4000-8000-000000000006', 'f3000000-0000-4000-8000-000000000007', 'f3000000-0000-4000-8000-000000000008']::uuid[], null);
select public.entregar_intento((select v from ids));
select results_eq($$select origen::text, estado::text, (vence_at = emitida_at + interval '12 months') from public.certificaciones where curso_id = 'e1000000-0000-4000-8000-000000000001'$$,
  $$values ('examen', 'vigente', true)$$, 'aprobar el final emite la certificación vigente con su vencimiento');
select ok((select bool_and(disponible) from public.estado_curso('e1000000-0000-4000-8000-000000000002')),
  'el Nivel B queda desbloqueado aunque falten pasos del A');
select tests.como_postgres();

select tests.como(tests.uid('ase2@t'));
select is((select count(*)::int from public.certificaciones), 0, 'otro asesor no ve la certificación');
select tests.como_postgres();
select tests.como(tests.uid('coordS@t'));
select is((select count(*)::int from public.certificaciones), 1, 'el coordinador de su sede y área sí');
select tests.como_postgres();
select tests.como(tests.uid('ase1@t'));
select throws_ok($$update public.certificaciones set estado = 'vigente'$$, '42501', null, 'el asesor no edita certificaciones');
select tests.como_postgres();

select * from finish();
rollback;
