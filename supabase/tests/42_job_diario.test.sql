-- Job diario: vence actualizaciones y consignas, avisa correcciones atrasadas, libera tomas viejas y no duplica nada
begin;
select plan(10);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();

-- Una actualización vencida para ase1 (con certificación vigente del nivel)
insert into public.modulos (id, curso_id, orden, titulo) values ('e2000000-0000-4000-8000-000000000081', 'e1000000-0000-4000-8000-000000000001', 3, 'MJ');
insert into public.certificaciones (usuario_id, curso_id, origen) values (tests.uid('ase1@t'), 'e1000000-0000-4000-8000-000000000001', 'examen');
insert into public.actualizaciones (id, titulo, modulo_id, plazo_dias) values ('a0000000-0000-4000-8000-000000000081', 'Cambio', 'e2000000-0000-4000-8000-000000000081', 3);
insert into public.actualizacion_asignaciones (id, actualizacion_id, usuario_id, vence_at)
values ('a1000000-0000-4000-8000-000000000081', 'a0000000-0000-4000-8000-000000000081', tests.uid('ase1@t'), now() - interval '1 hour');

-- Un intento de ase1 (Neuquén, servicio) entregado hace 80 h y tomado hace 30 h
insert into public.intentos (id, usuario_id, examen_id, sede_id, area, estado, entregado_at, corrector_id, tomado_at)
values ('a2000000-0000-4000-8000-000000000081', tests.uid('ase1@t'), 'f1000000-0000-4000-8000-000000000002',
        (select id from public.sedes where nombre = 'T-Neuquén'), 'servicio', 'pendiente_correccion',
        now() - interval '80 hours', tests.uid('lider1@t'), now() - interval '30 hours');

select public.job_diario();
select public.job_diario();

select is((select estado::text from public.actualizacion_asignaciones where id = 'a1000000-0000-4000-8000-000000000081'), 'vencida', 'vence la actualización');
select is((select motivo_perdida from public.usuario_insignias ui join public.insignias i on i.id = ui.insignia_id
           where ui.usuario_id = tests.uid('ase1@t') and i.curso_id = 'e1000000-0000-4000-8000-000000000001'), 'actualizacion', 'y quita la insignia del nivel');
select is((select count(*)::int from public.alertas where usuario_id = tests.uid('ase1@t') and tipo = 'actualizacion_vencida'), 1, 'avisa una sola vez');
select is((select count(*)::int from public.alertas where usuario_id = tests.uid('coordS@t') and tipo = 'correccion_atrasada'), 1,
  'avisa al coordinador del área y sede la corrección de más de 72 h, una vez');
select is((select count(*)::int from public.alertas where usuario_id = tests.uid('coordV@t') and tipo = 'correccion_atrasada'), 0, 'no al de otra área');
select is((select corrector_id from public.intentos where id = 'a2000000-0000-4000-8000-000000000081'), null, 'libera la toma de más de 24 h');

-- Completar después devuelve la insignia
update public.actualizacion_asignaciones set leida_at = now() where id = 'a1000000-0000-4000-8000-000000000081';
select public.revisar_asignacion('a1000000-0000-4000-8000-000000000081');
select is((select estado::text from public.actualizacion_asignaciones where id = 'a1000000-0000-4000-8000-000000000081'), 'cumplida', 'completarla tarde la cumple');
select is((select perdida_at from public.usuario_insignias ui join public.insignias i on i.id = ui.insignia_id
           where ui.usuario_id = tests.uid('ase1@t') and i.curso_id = 'e1000000-0000-4000-8000-000000000001'), null, 'y devuelve la insignia');

select ok(exists (select 1 from cron.job where jobname = 'pea-diario'), 'el job diario está programado');
select ok(not exists (select 1 from cron.job where jobname = 'procesar-consignas'), 'y reemplaza al de consignas');

select * from finish();
rollback;
