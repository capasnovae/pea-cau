begin;
select plan(16);
select tests.escenario();
select tests.escenario_cursos();
-- los niveles 8 y 9 dependen del nivel anterior que exista; para el test, el 8 es el primero si no hay 1..7 publicados
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;

select tests.como(tests.uid('ase1@t'));
select throws_ok($$select public.marcar_item('e3000000-0000-4000-8000-000000000002', 'hecho')$$,
  'P0001', 'bloqueado: completá lo anterior', 'no se saltea el orden secuencial');
select throws_ok($$select public.marcar_item('e3000000-0000-4000-8000-000000000003', 'visto')$$,
  'P0001', 'bloqueado: completá lo anterior', 'no se abre un módulo con prerrequisito pendiente');
select throws_ok($$select public.marcar_item('e3000000-0000-4000-8000-000000000004', 'visto')$$,
  'P0001', 'bloqueado: completá lo anterior', 'no se avanza en un nivel bloqueado');
select lives_ok($$select public.marcar_item('e3000000-0000-4000-8000-000000000001', 'visto')$$, 'marca i1 visto');
select throws_ok($$select public.marcar_item('e3000000-0000-4000-8000-000000000001', 'hecho')$$,
  'P0001', 'integridad: este ítem no se marca a mano', 'un ítem de ver no se marca como hecho');
select lives_ok($$select public.marcar_item('e3000000-0000-4000-8000-000000000002', 'hecho')$$, 'marca i2 hecho');
select lives_ok($$select public.marcar_item('e3000000-0000-4000-8000-000000000003', 'visto')$$, 'i3 se habilita con M1 cumplido');
select ok(public.curso_cumplido('e1000000-0000-4000-8000-000000000001', auth.uid()), 'el nivel A quedó cumplido');
select ok(public.curso_desbloqueado('e1000000-0000-4000-8000-000000000002', auth.uid()), 'el nivel B se desbloqueó');
select is_empty($$select 1 from public.modulos where curso_id = 'e1000000-0000-4000-8000-000000000003'$$, 'no ve módulos de un curso de Roca');
select is_empty($$select 1 from public.items where id = 'e3000000-0000-4000-8000-000000000006'$$, 'no ve ítems de un curso en borrador');
select throws_ok($$select public.marcar_item('e3000000-0000-4000-8000-000000000005', 'visto')$$,
  'P0001', 'bloqueado: completá lo anterior', 'no marca un ítem de Roca');
select throws_ok($$insert into public.item_progreso (usuario_id, item_id, visto_at) values (tests.uid('ase2@t'), 'e3000000-0000-4000-8000-000000000001', now())$$,
  '42501', null, 'no escribe progreso de otro');
select tests.como_postgres();

select tests.como(tests.uid('ase2@t'));
select is_empty($$select 1 from public.item_progreso where usuario_id = tests.uid('ase1@t')$$, 'ase2 no lee el progreso de ase1');
select tests.como_postgres();
select tests.como(tests.uid('lider1@t'));
select ok(exists(select 1 from public.item_progreso where usuario_id = tests.uid('ase1@t')), 'el líder lee el progreso de su equipo');
select tests.como_postgres();
select tests.como(tests.uid('adm@t'));
select lives_ok($$select public.promover_contenido('cursos', 'e1000000-0000-4000-8000-000000000003')$$, 'el admin promueve un curso');
select tests.como_postgres();

select * from finish();
rollback;
