begin;
select plan(5);
select tests.escenario();

select tests.como(tests.uid('ase1@t'));
select ok(exists(select 1 from public.organigrama() where id = tests.uid('aseR@t')), 'el asesor ve a gente de otra sede en el organigrama');
select ok(exists(select 1 from public.organigrama() where id = tests.uid('dir@t')), 've al director');
select ok(not exists(select 1 from public.organigrama() where id = tests.uid('aseInactivo@t')), 'no ve inactivos');
create temp table o as select * from public.organigrama();
select hasnt_column('o', 'email', 'el organigrama no expone el email');
select tests.como_postgres();

select tests.como(tests.uid('aseInactivo@t'));
select is_empty($$select 1 from public.organigrama()$$, 'un inactivo no ve el organigrama');
select tests.como_postgres();

select * from finish();
rollback;
