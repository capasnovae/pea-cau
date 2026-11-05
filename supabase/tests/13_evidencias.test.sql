begin;
select plan(5);
select tests.escenario();
insert into public.consignas (id, sede_id, creada_por, tipo, titulo, destino, destino_equipo_id)
values ('66666666-6666-6666-6666-666666666666', (select id from public.sedes where nombre = 'T-Neuquén'), tests.uid('lider1@t'),
        'tarea', 'Con evidencia', 'equipo', (select id from public.equipos where nombre = 'E1'));
create temp table a as select id::text as asig from public.consigna_asignaciones
  where consigna_id = '66666666-6666-6666-6666-666666666666' and usuario_id = tests.uid('ase1@t');
grant select on a to authenticated;

select is((select public from storage.buckets where id = 'evidencias'), false, 'bucket evidencias privado');

select tests.como(tests.uid('ase1@t'));
select lives_ok($$insert into storage.objects (bucket_id, name) values ('evidencias', (select asig from a) || '/foto.png')$$, 'ase1 sube a su asignación');
select tests.como_postgres();

select tests.como(tests.uid('ase2@t'));
select throws_ok($$insert into storage.objects (bucket_id, name) values ('evidencias', (select asig from a) || '/otra.png')$$,
  '42501', null, 'ase2 no sube a la asignación de ase1');
select is_empty($$select 1 from storage.objects where bucket_id = 'evidencias' and name like (select asig from a) || '/%'$$, 'ase2 no la ve');
select tests.como_postgres();

select tests.como(tests.uid('lider1@t'));
select ok(exists(select 1 from storage.objects where bucket_id = 'evidencias' and name = (select asig from a) || '/foto.png'), 'el líder la ve');
select tests.como_postgres();

select * from finish();
rollback;
