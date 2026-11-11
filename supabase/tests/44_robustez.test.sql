-- Robustez a largo plazo: la historia no se borra en cascada, permisos de tabla mínimos e índices en claves foráneas
begin;
select plan(9);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();

insert into public.certificaciones (usuario_id, curso_id, origen) values (tests.uid('ase1@t'), 'e1000000-0000-4000-8000-000000000002', 'examen');
select throws_ok($$delete from public.cursos where id = 'e1000000-0000-4000-8000-000000000002'$$, '23503', null,
  'un curso con certificaciones no se borra (se archiva)');
select is((select count(*)::int from public.certificaciones where curso_id = 'e1000000-0000-4000-8000-000000000002'), 1, 'y el certificado sigue existiendo');

insert into public.intentos (usuario_id, examen_id, estado, entregado_at, cerrado_at, nota, aprobado)
values (tests.uid('ase1@t'), 'f1000000-0000-4000-8000-000000000001', 'cerrado', now(), now(), 80, true);
select throws_ok($$delete from public.examenes where id = 'f1000000-0000-4000-8000-000000000001'$$, '23503', null,
  'un examen con intentos no se borra (se archiva)');
select lives_ok($$delete from public.examenes where id = 'f1000000-0000-4000-8000-000000000003'$$, 'un examen sin intentos sí se puede borrar');

select ok(not has_table_privilege('anon', 'public.mensajes', 'select') and not has_table_privilege('anon', 'public.conversaciones', 'insert')
      and not has_table_privilege('anon', 'public.eventos', 'select') and not has_table_privilege('anon', 'public.cursos_favoritos', 'delete'),
  'anon no tiene permisos sobre bandeja, eventos ni favoritos');
select is((select count(*)::int from information_schema.role_table_grants
           where table_schema = 'public' and grantee in ('anon', 'authenticated') and privilege_type = 'TRUNCATE'), 0,
  'nadie puede vaciar tablas (TRUNCATE)');
select is((select count(*)::int from information_schema.role_table_grants
           where table_schema = 'public' and grantee = 'anon' and privilege_type <> 'SELECT'), 0, 'anon no escribe en ninguna tabla');

select ok(exists (select 1 from pg_indexes where schemaname = 'public' and tablename = 'intentos' and indexdef like '%(examen_id%'),
  'intentos tiene índice por examen');
select is((select count(*)::int from pg_constraint c
           where c.contype = 'f' and c.connamespace = 'public'::regnamespace
             and c.conrelid::regclass::text in ('intentos', 'intento_preguntas', 'respuestas', 'certificaciones', 'items', 'examenes', 'examen_fuentes',
                                                'practica_progreso', 'usuario_insignias', 'consignas', 'actualizaciones')
             and not exists (select 1 from pg_index i where i.indrelid = c.conrelid and i.indkey[0] = c.conkey[1])), 0,
  'las claves foráneas de las tablas con más volumen tienen índice');

select * from finish();
rollback;
