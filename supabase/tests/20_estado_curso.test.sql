begin;
select plan(5);
select tests.escenario();
select tests.escenario_cursos();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;

select tests.como(tests.uid('ase1@t'));
select public.marcar_item('e3000000-0000-4000-8000-000000000001', 'visto');
select tests.como_postgres();

select tests.como(tests.uid('ase2@t'));
select throws_ok($$select public.item_cumplido('e3000000-0000-4000-8000-000000000001', tests.uid('ase1@t'))$$,
  '42501', null, 'un asesor no consulta el progreso de otro con item_cumplido');
select throws_ok($$select public.curso_cumplido('e1000000-0000-4000-8000-000000000001', tests.uid('ase1@t'))$$,
  '42501', null, 'ni con curso_cumplido');
select tests.como_postgres();

select tests.como(tests.uid('ase1@t'));
select results_eq($$select titulo, cumplido, disponible from public.estado_curso('e1000000-0000-4000-8000-000000000001') order by modulo_orden, item_orden$$,
  $$values ('i1', true, true), ('i2', false, true), ('i3', false, false)$$, 'estado_curso devuelve el estado propio de cada ítem');
select is((select count(*)::int from public.estado_curso('e1000000-0000-4000-8000-000000000003')), 0, 'un curso de otra sede no devuelve nada');
select lives_ok($$select public.marcar_item('e3000000-0000-4000-8000-000000000002', 'hecho')$$, 'marcar sigue funcionando por la política');
select tests.como_postgres();

select * from finish();
rollback;
