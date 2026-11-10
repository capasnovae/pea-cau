begin;
select plan(7);
select tests.escenario();
select tests.crear_usuario('ase3@t', 'asesor', 'T-Neuquén', 'servicio');
update public.perfiles set equipo_id = (select id from public.equipos where nombre = 'E1') where email = 'ase3@t';

-- consigna semanal del equipo E1 creada por el líder; su primer período lo fijamos en 2026-11-02
insert into public.consignas (id, sede_id, creada_por, tipo, titulo, destino, destino_equipo_id, recurrencia)
values ('55555555-5555-5555-5555-555555555555', (select id from public.sedes where nombre = 'T-Neuquén'), tests.uid('lider1@t'),
        'tarea', 'Semanal', 'equipo', (select id from public.equipos where nombre = 'E1'), 'semanal');
delete from public.consigna_asignaciones where consigna_id = '55555555-5555-5555-5555-555555555555';
select public.generar_asignaciones('55555555-5555-5555-5555-555555555555', '2026-11-02');

-- antes del nuevo período, ase3 queda inactivo
update public.perfiles set activo = false where email = 'ase3@t';

select is((public.procesar_consignas('2026-11-09')->>'generadas')::int, 1, 'genera el período nuevo solo para activos');
select is((public.procesar_consignas('2026-11-09')->>'generadas')::int, 0, 'procesar dos veces el mismo día no duplica');
select is((select estado from public.consigna_asignaciones a join public.perfiles p on p.id = a.usuario_id
  where a.consigna_id = '55555555-5555-5555-5555-555555555555' and a.periodo = '2026-11-02' and p.email = 'ase1@t'),
  'vencida'::public.estado_asignacion, 'la del período anterior quedó vencida');
select is((select vence_el from public.consigna_asignaciones a join public.perfiles p on p.id = a.usuario_id
  where a.consigna_id = '55555555-5555-5555-5555-555555555555' and a.periodo = '2026-11-09' and p.email = 'ase1@t'),
  '2026-11-15'::date, 'la nueva vence el domingo');
select ok(not exists(select 1 from public.consigna_asignaciones a join public.perfiles p on p.id = a.usuario_id
  where a.periodo = '2026-11-09' and p.email = 'ase3@t'), 'el inactivo no recibe el período nuevo');

select tests.como(tests.uid('ase1@t'));
select lives_ok($$update public.consigna_asignaciones set estado = 'hecha'
  where usuario_id = auth.uid() and periodo = '2026-11-02' and consigna_id = '55555555-5555-5555-5555-555555555555'$$,
  'una vencida se puede cerrar igual');
select tests.como_postgres();

select ok(exists(select 1 from cron.job where jobname = 'pea-diario'), 'existe el job diario (incluye consignas)');

select * from finish();
rollback;
