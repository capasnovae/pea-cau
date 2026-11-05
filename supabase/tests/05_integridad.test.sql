begin;
select plan(7);
select tests.escenario();
select tests.crear_usuario('liderR@t', 'lider', 'T-Roca', 'servicio');
update public.equipos set lider_id = tests.uid('liderR@t') where nombre = 'E2';

-- I2: un equipo de otra sede no puede recibir asesores de Neuquén
select throws_ok($$update public.perfiles set equipo_id = (select id from public.equipos where nombre = 'E2') where email = 'ase2@t'$$,
  'P0001', 'integridad: el equipo es de otra sede o área', 'no se asigna un equipo de otra sede');
select throws_ok($$update public.equipos set lider_id = tests.uid('lider1@t') where nombre = 'E2'$$,
  'P0001', 'integridad: el líder es de otra sede o área', 'no se nombra líder de otra sede');

-- I2: aunque quede un dato viejo, el líder de otra sede no ve
set local session_replication_role = replica; -- simula un dato heredado, salteando triggers
update public.perfiles set sede_id = (select id from public.sedes where nombre = 'T-Roca') where email = 'lider1@t';
set local session_replication_role = origin;
select tests.como(tests.uid('lider1@t'));
select ok(not public.puede_ver_usuario(tests.uid('ase1@t')), 'líder mudado de sede deja de ver a su equipo viejo');
select tests.como_postgres();

-- I3: campos del examen de ubicación protegidos
select tests.como(tests.uid('ase2@t'));
select throws_ok($$update public.perfiles set ubicacion_habilitada_por = tests.uid('coordS@t') where id = auth.uid()$$,
  'P0001', 'no_autorizado: campo protegido', 'asesor no se habilita la ubicación');
select throws_ok($$update public.perfiles set experiencia_previa = true where id = auth.uid()$$,
  'P0001', 'no_autorizado: campo protegido', 'asesor no marca experiencia previa');
select tests.como_postgres();
select tests.como(tests.uid('coordS@t'));
select lives_ok($$update public.perfiles set ubicacion_habilitada_por = auth.uid(), experiencia_previa = true where email = 'ase2@t'$$,
  'coordinador habilita la ubicación a un asesor que ve');
select throws_ok($$update public.perfiles set ubicacion_rendida_at = now() where email = 'ase2@t'$$,
  'P0001', 'no_autorizado: campo protegido', 'nadie escribe la ubicación rendida a mano');
select tests.como_postgres();

select * from finish();
rollback;
