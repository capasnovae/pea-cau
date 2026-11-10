-- Recertificación por tiempo: avisos a 30 y 7 días, vencimiento, insignia y reexamen
begin;
select plan(12);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();
update public.cursos set vigencia_meses = 12 where id = 'e1000000-0000-4000-8000-000000000001';

insert into public.certificaciones (id, usuario_id, curso_id, origen, emitida_at, vence_at) values
  ('c0000000-0000-4000-8000-000000000001', tests.uid('ase1@t'), 'e1000000-0000-4000-8000-000000000001', 'examen', now() - interval '11 months', now() + interval '20 days'),
  ('c0000000-0000-4000-8000-000000000002', tests.uid('ase2@t'), 'e1000000-0000-4000-8000-000000000001', 'examen', now() - interval '12 months', now() + interval '5 days'),
  ('c0000000-0000-4000-8000-000000000003', tests.uid('aseV@t'), 'e1000000-0000-4000-8000-000000000001', 'examen', now() - interval '13 months', now() - interval '1 day'),
  ('c0000000-0000-4000-8000-000000000004', tests.uid('aseR@t'), 'e1000000-0000-4000-8000-000000000002', 'examen', now() - interval '5 years', null);

select public.procesar_recertificacion();
select public.procesar_recertificacion();
select is((select count(*)::int from public.alertas where usuario_id = tests.uid('ase1@t') and clave like 'vence30:%'), 1,
  'a 20 días avisa una sola vez aunque el proceso corra dos veces');
select is((select count(*)::int from public.alertas where usuario_id = tests.uid('ase1@t') and clave like 'vence7:%'), 0, 'todavía no avisa a 7 días');
select is((select count(*)::int from public.alertas where usuario_id = tests.uid('ase2@t') and clave like 'vence7:%'), 1, 'a 5 días avisa a 7 días');
select is((select estado::text from public.certificaciones where id = 'c0000000-0000-4000-8000-000000000003'), 'vencida', 'la vencida por fecha pasa a vencida');
select ok(not exists (select 1 from public.usuario_insignias ui join public.insignias i on i.id = ui.insignia_id
             where ui.usuario_id = tests.uid('aseV@t') and i.curso_id = 'e1000000-0000-4000-8000-000000000001' and ui.perdida_at is null),
  'y no tiene la insignia activa');
select is((select enlace from public.alertas where usuario_id = tests.uid('aseV@t') and clave like 'vencio:%'),
  '/examenes/f1000000-0000-4000-8000-000000000005', 'el aviso lleva al final del nivel');
select is((select estado::text from public.certificaciones where id = 'c0000000-0000-4000-8000-000000000004'), 'vigente', 'un nivel sin vigencia no vence');

-- Una insignia activa se pierde cuando vence la certificación
update public.certificaciones set vence_at = now() - interval '1 hour' where id = 'c0000000-0000-4000-8000-000000000002';
select public.procesar_recertificacion();
select is((select motivo_perdida from public.usuario_insignias ui join public.insignias i on i.id = ui.insignia_id
           where ui.usuario_id = tests.uid('ase2@t') and i.curso_id = 'e1000000-0000-4000-8000-000000000001' and ui.perdida_at is not null),
  'vencida', 'al vencer, la insignia activa se pierde');

-- Reexamen: aprobar el final de nuevo emite una certificación nueva y devuelve la insignia
create temp table ids as select gen_random_uuid() as id;
insert into public.intentos (id, usuario_id, examen_id, estado, entregado_at, cerrado_at, nota, aprobado)
select id, tests.uid('aseV@t'), 'f1000000-0000-4000-8000-000000000005', 'cerrado', now(), now(), 90, true from ids;
select public.aplicar_efectos((select id from ids));
select is((select count(*)::int from public.certificaciones where usuario_id = tests.uid('aseV@t') and estado = 'vigente'), 1, 'recertifica');
select is((select perdida_at from public.usuario_insignias ui join public.insignias i on i.id = ui.insignia_id
           where ui.usuario_id = tests.uid('aseV@t') and i.curso_id = 'e1000000-0000-4000-8000-000000000001'), null, 'y recupera la insignia');

-- Certificación guardada como vigente pero vencida por fecha: reaprobar emite una nueva igual
update public.certificaciones set vence_at = now() - interval '1 day' where id = 'c0000000-0000-4000-8000-000000000001';
create temp table ids2 as select gen_random_uuid() as id;
insert into public.intentos (id, usuario_id, examen_id, estado, entregado_at, cerrado_at, nota, aprobado)
select id, tests.uid('ase1@t'), 'f1000000-0000-4000-8000-000000000005', 'cerrado', now(), now(), 90, true from ids2;
select public.aplicar_efectos((select id from ids2));
select is((select count(*)::int from public.certificaciones where usuario_id = tests.uid('ase1@t') and public.estado_efectivo(estado, vence_at) = 'vigente'), 1,
  'reaprobar con la anterior vencida por fecha emite una vigente');
select ok(not has_function_privilege('authenticated', 'public.procesar_recertificacion(timestamptz)', 'execute'), 'el proceso no lo corre un usuario');

select * from finish();
rollback;
