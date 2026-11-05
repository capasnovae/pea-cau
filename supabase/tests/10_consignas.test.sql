begin;
select plan(9);
select tests.escenario();
select tests.crear_usuario('aseFront@t', 'asesor', 'T-Neuquén', 'servicio');
insert into public.perfil_subroles (perfil_id, subrol_id) select tests.uid('aseFront@t'), id from public.subroles where nombre = 'Front';

create temp table nqn as select id from public.sedes where nombre = 'T-Neuquén';

-- destino sede, creada por el coordinador de servicio
insert into public.consignas (id, sede_id, area, creada_por, tipo, titulo, destino)
values ('44444444-4444-4444-4444-444444444441', (select id from nqn), 'servicio', tests.uid('coordS@t'), 'tarea', 'Sede', 'sede');
select results_eq(
  $$select p.email from public.consigna_asignaciones a join public.perfiles p on p.id = a.usuario_id
    where a.consigna_id = '44444444-4444-4444-4444-444444444441' order by p.email$$,
  $$values ('ase1@t'), ('ase2@t'), ('aseFront@t'), ('lider1@t')$$,
  'destino sede: activos de servicio de la sede, sin el creador ni ventas ni inactivos');

-- destino equipo
insert into public.consignas (id, sede_id, creada_por, tipo, titulo, destino, destino_equipo_id)
values ('44444444-4444-4444-4444-444444444442', (select id from nqn), tests.uid('lider1@t'), 'tarea', 'Equipo', 'equipo',
        (select id from public.equipos where nombre = 'E1'));
select results_eq(
  $$select p.email from public.consigna_asignaciones a join public.perfiles p on p.id = a.usuario_id
    where a.consigna_id = '44444444-4444-4444-4444-444444444442' order by p.email$$,
  $$values ('ase1@t')$$, 'destino equipo: los miembros que el líder ve (no él mismo)');

-- destino subrol
insert into public.consignas (id, sede_id, area, creada_por, tipo, titulo, destino, destino_subrol_id)
values ('44444444-4444-4444-4444-444444444443', (select id from nqn), 'servicio', tests.uid('coordS@t'), 'tarea', 'Front', 'subrol',
        (select id from public.subroles where nombre = 'Front'));
select results_eq(
  $$select p.email from public.consigna_asignaciones a join public.perfiles p on p.id = a.usuario_id
    where a.consigna_id = '44444444-4444-4444-4444-444444444443'$$,
  $$values ('aseFront@t')$$, 'destino subrol: solo quienes lo tienen');

select throws_ok($$insert into public.consignas (sede_id, creada_por, tipo, titulo, destino)
  values ((select id from nqn), tests.uid('coordS@t'), 'lectura', 'Sin artículo', 'sede')$$, '23514', null, 'lectura sin artículo rechazada');
select throws_ok($$insert into public.consignas (sede_id, creada_por, tipo, titulo, destino)
  values ((select id from nqn), tests.uid('coordS@t'), 'tarea', 'Mal destino', 'equipo')$$, '23514', null, 'destino equipo sin equipo rechazado');

select is(public.periodo_actual('semanal', '2026-11-06'), '2026-11-02'::date, 'período semanal empieza el lunes');
select is(public.fin_periodo('mensual', '2026-02-01'), '2026-02-28'::date, 'fin de período mensual');
select is(public.generar_asignaciones('44444444-4444-4444-4444-444444444441', current_date), 0, 'regenerar el mismo período no duplica');
select is((select vence_el from public.consigna_asignaciones where consigna_id = '44444444-4444-4444-4444-444444444441' limit 1), null::date,
  'sin fecha límite ni recurrencia, no vence');

select * from finish();
rollback;
