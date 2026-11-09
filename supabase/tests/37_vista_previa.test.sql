-- Vista previa: quien edita un curso en borrador puede recorrerlo entero; nadie más
begin;
select plan(6);
select tests.escenario();
select tests.escenario_cursos();

-- e1..04 es el curso global en borrador del escenario (módulo e2..05, ítem e3..06)
select tests.como(tests.uid('adm@t'));
select is((select disponible from public.estado_curso('e1000000-0000-4000-8000-000000000004') where item_id = 'e3000000-0000-4000-8000-000000000006'),
  true, 'el admin recorre un curso global en borrador');
select lives_ok($$select public.marcar_item('e3000000-0000-4000-8000-000000000006', 'visto')$$, 'y puede marcar pasos en la vista previa');
select tests.como_postgres();

select tests.como(tests.uid('coordS@t'));
select is((select count(*)::int from public.estado_curso('e1000000-0000-4000-8000-000000000004')), 0, 'un coordinador no ve borradores globales');
select tests.como_postgres();

select tests.como(tests.uid('ase1@t'));
select is((select count(*)::int from public.estado_curso('e1000000-0000-4000-8000-000000000004')), 0, 'un asesor tampoco');
select throws_ok($$select public.marcar_item('e3000000-0000-4000-8000-000000000006', 'visto')$$, 'P0001', null, 'ni puede marcar sus pasos');
select tests.como_postgres();

-- En un curso publicado, el editor respeta el orden como cualquiera (i2 va después de i1 con avance secuencial)
select tests.como(tests.uid('adm@t'));
select is((select disponible from public.estado_curso('e1000000-0000-4000-8000-000000000001') where item_id = 'e3000000-0000-4000-8000-000000000002'),
  false, 'en un curso publicado no se saltea el orden');
select tests.como_postgres();

select * from finish();
rollback;
