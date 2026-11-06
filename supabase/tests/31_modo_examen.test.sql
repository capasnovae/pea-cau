-- Modo examen: registro de salidas del examen
begin;
select plan(4);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();

create temp table ids (k text primary key, v uuid);
grant all on ids to authenticated, anon;

select tests.como(tests.uid('ase1@t'));
insert into ids select 'i', public.iniciar_intento('f1000000-0000-4000-8000-000000000001');
select public.registrar_salida((select v from ids));
select is(public.registrar_salida((select v from ids)), 2, 'cada salida suma');
select throws_ok($$update public.intentos set salidas = 0 where id = (select v from ids)$$, '42501', null, 'el asesor no borra sus salidas');
select tests.como_postgres();

select tests.como(tests.uid('ase2@t'));
select throws_ok($$select public.registrar_salida((select v from ids))$$, 'P0001', 'sin permiso', 'no registra salidas en intentos ajenos');
select tests.como_postgres();

select tests.como(tests.uid('ase1@t'));
select public.entregar_intento((select v from ids));
select throws_ok($$select public.registrar_salida((select v from ids))$$, 'P0001', 'sin permiso', 'ni en intentos entregados');
select tests.como_postgres();

select * from finish();
rollback;
