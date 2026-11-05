begin;
select plan(7);
select tests.escenario();
create temp table carpetas as
  select (select id::text from public.sedes where nombre = 'T-Neuquén') as nqn,
         (select id::text from public.sedes where nombre = 'T-Roca') as roca;
grant select on carpetas to authenticated;

select is((select public from storage.buckets where id = 'recursos'), false, 'el bucket recursos es privado');

select tests.como(tests.uid('coordS@t'));
select lives_ok($$insert into storage.objects (bucket_id, name) values ('recursos', (select nqn from carpetas) || '/a.pdf')$$,
  'coordS sube a la carpeta de su sede');
select throws_ok($$insert into storage.objects (bucket_id, name) values ('recursos', 'global/b.pdf')$$,
  '42501', null, 'coordS no sube a global');
select throws_ok($$insert into storage.objects (bucket_id, name) values ('recursos', (select roca from carpetas) || '/c.pdf')$$,
  '42501', null, 'coordS no sube a otra sede');
select tests.como_postgres();

insert into public.recursos (categoria_id, titulo, tipo, archivo_path, alcance, sede_id, estado)
values ((select id from public.categorias where slug = 'reglamento'), 'A', 'pdf', (select nqn from carpetas) || '/a.pdf', 'sede',
        (select id from public.sedes where nombre = 'T-Neuquén'), 'publicado');

select tests.como(tests.uid('aseR@t'));
select is_empty($$select 1 from storage.objects where bucket_id = 'recursos' and name like (select nqn from carpetas) || '/%'$$,
  'aseR no ve archivos de Neuquén');
select tests.como_postgres();

select tests.como(tests.uid('ase1@t'));
select ok(exists(select 1 from storage.objects where bucket_id = 'recursos' and name = (select nqn from carpetas) || '/a.pdf'),
  'ase1 ve archivos de su sede');
select tests.como_postgres();

select tests.como(tests.uid('adm@t'));
select lives_ok($$insert into storage.objects (bucket_id, name) values ('recursos', 'global/d.pdf')$$, 'admin sube a global');
select tests.como_postgres();

select * from finish();
rollback;
