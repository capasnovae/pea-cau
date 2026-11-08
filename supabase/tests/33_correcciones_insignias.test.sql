-- Correcciones de la revisión de la Etapa 7: relleno de insignias y permisos de anon
begin;
select plan(5);
select tests.escenario();
select tests.escenario_cursos();

insert into public.certificaciones (usuario_id, curso_id, origen) values
  (tests.uid('ase1@t'), 'e1000000-0000-4000-8000-000000000001', 'examen'),
  (tests.uid('ase2@t'), 'e1000000-0000-4000-8000-000000000001', 'ubicacion');
insert into public.certificaciones (usuario_id, curso_id, origen, vence_at) values
  (tests.uid('ase2@t'), 'e1000000-0000-4000-8000-000000000002', 'examen', now() - interval '1 day');
-- Simula certificaciones anteriores a la Etapa 7: sin insignia otorgada
delete from public.usuario_insignias;
select public.rellenar_insignias();
select results_eq(
  $$select p.email::text, i.curso_id from public.usuario_insignias ui join public.perfiles p on p.id = ui.usuario_id
    join public.insignias i on i.id = ui.insignia_id where ui.perdida_at is null and p.email like '%@t' order by 1$$,
  $$values ('ase1@t', 'e1000000-0000-4000-8000-000000000001'::uuid), ('ase2@t', 'e1000000-0000-4000-8000-000000000001'::uuid)$$,
  'las certificaciones vigentes existentes reciben su insignia (no las vencidas por fecha)');
select public.rellenar_insignias();
select is((select count(*)::int from public.usuario_insignias ui join public.perfiles p on p.id = ui.usuario_id where p.email like '%@t'), 2, 'rellenar dos veces no duplica');

select ok(not has_function_privilege('anon', 'public.revocar_certificacion(uuid, text)', 'execute'), 'anon no ejecuta revocar_certificacion');
select ok(not has_function_privilege('anon', 'public.mi_perfil_evolutivo()', 'execute'), 'anon no ejecuta mi_perfil_evolutivo');
select ok(not has_function_privilege('authenticated', 'public.rellenar_insignias()', 'execute'), 'rellenar_insignias no es para usuarios');
select * from finish();
rollback;
