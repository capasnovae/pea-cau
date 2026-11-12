-- Bucket privado de videos de lecciones: lo leen los perfiles activos; solo se sube con la clave de servicio
begin;
select plan(5);
select tests.escenario();

select is((select public from storage.buckets where id = 'videos'), false, 'el bucket videos es privado');
select ok((select 'video/mp4' = any(allowed_mime_types) from storage.buckets where id = 'videos'), 'acepta mp4');

insert into storage.objects (bucket_id, name) values ('videos', 'lecciones/05.mp4');

select tests.como(tests.uid('ase1@t'));
select ok(exists(select 1 from storage.objects where bucket_id = 'videos' and name = 'lecciones/05.mp4'),
  'un asesor activo ve los videos');
select throws_ok($$insert into storage.objects (bucket_id, name) values ('videos', 'lecciones/x.mp4')$$,
  '42501', null, 'un asesor no sube videos');
select tests.como_postgres();

select tests.como(tests.uid('adm@t'));
select throws_ok($$insert into storage.objects (bucket_id, name) values ('videos', 'lecciones/y.mp4')$$,
  '42501', null, 'tampoco el admin desde la app: los videos se fabrican y suben con el script');
select tests.como_postgres();

select * from finish();
rollback;
