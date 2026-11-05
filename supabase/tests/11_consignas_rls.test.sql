begin;
select plan(17);
select tests.escenario();
select tests.contenido('Artículo L', 'global', null, 'publicado');
create temp table r as select
  (select id from public.sedes where nombre = 'T-Neuquén') as nqn,
  (select id from public.sedes where nombre = 'T-Roca') as roca,
  (select id from public.equipos where nombre = 'E1') as e1,
  (select id from public.articulos where titulo = 'Artículo L') as art;
grant select on r to authenticated;

-- líder
select tests.como(tests.uid('lider1@t'));
select lives_ok($$insert into public.consignas (sede_id, tipo, titulo, destino, destino_equipo_id)
  values ((select nqn from r), 'tarea', 'Para mi equipo', 'equipo', (select e1 from r))$$, 'líder crea para su equipo');
select is((select creada_por from public.consignas where titulo = 'Para mi equipo'), auth.uid(), 'creada_por es quien crea');
select throws_ok($$insert into public.consignas (sede_id, tipo, titulo, destino, destino_usuario_id)
  values ((select nqn from r), 'tarea', 'Para ase2', 'usuario', tests.uid('ase2@t'))$$, '42501', null, 'líder no asigna fuera de su equipo');
select throws_ok($$insert into public.consignas (sede_id, tipo, titulo, destino)
  values ((select nqn from r), 'tarea', 'Para la sede', 'sede')$$, '42501', null, 'líder no asigna a la sede');
select tests.como_postgres();

-- coordinador
select tests.como(tests.uid('coordS@t'));
select throws_ok($$insert into public.consignas (sede_id, tipo, titulo, destino)
  values ((select roca from r), 'tarea', 'A Roca', 'sede')$$, '42501', null, 'coordinador no asigna a otra sede');
select lives_ok($$insert into public.consignas (sede_id, tipo, titulo, destino, articulo_id)
  values ((select nqn from r), 'lectura', 'Leer L', 'sede', (select art from r))$$, 'coordinador asigna a su sede');
select is((select area from public.consignas where titulo = 'Leer L'), 'servicio'::public.area, 'la consigna del coordinador queda en su área');
select tests.como_postgres();

-- director
select tests.como(tests.uid('dir@t'));
select lives_ok($$insert into public.consignas (sede_id, tipo, titulo, destino)
  values ((select roca from r), 'tarea', 'Director a Roca', 'sede')$$, 'director asigna a cualquier sede');
select tests.como_postgres();

-- asesor
select tests.como(tests.uid('ase1@t'));
select is((select count(*)::int from public.consigna_asignaciones a join public.consignas c on c.id = a.consigna_id
  where c.titulo = 'Para mi equipo'), 1, 'ase1 ve su asignación');
select lives_ok($$update public.consigna_asignaciones set estado = 'hecha', comentario = 'Listo'
  where usuario_id = auth.uid() and consigna_id = (select id from public.consignas where titulo = 'Para mi equipo')$$, 'ase1 cierra su tarea');
select ok((select completada_at is not null from public.consigna_asignaciones a join public.consignas c on c.id = a.consigna_id
  where c.titulo = 'Para mi equipo' and a.usuario_id = auth.uid()), 'al cerrar se completa la fecha');
select throws_ok($$update public.consigna_asignaciones set usuario_id = tests.uid('ase2@t') where usuario_id = auth.uid()$$,
  'P0001', 'no_autorizado: campo protegido', 'ase1 no cambia el destinatario');
select throws_ok($$insert into public.consigna_asignaciones (consigna_id, usuario_id, periodo)
  values ((select id from public.consignas where titulo = 'Para mi equipo'), tests.uid('ase2@t'), current_date)$$,
  '42501', null, 'ase1 no crea asignaciones');
select throws_ok($$insert into public.consignas (sede_id, tipo, titulo, destino) values ((select nqn from r), 'tarea', 'X', 'sede')$$,
  '42501', null, 'ase1 no crea consignas');
select throws_ok($$update public.consigna_asignaciones set estado = 'hecha'
  where usuario_id = auth.uid() and consigna_id = (select id from public.consignas where titulo = 'Leer L')$$,
  'P0001', 'integridad: confirmá la lectura', 'lectura no se cierra sin confirmar');
select lives_ok($$update public.consigna_asignaciones set leida_at = now(), estado = 'hecha'
  where usuario_id = auth.uid() and consigna_id = (select id from public.consignas where titulo = 'Leer L')$$, 'lectura confirmada se cierra');
select tests.como_postgres();

-- el líder ve las asignaciones de su equipo
select tests.como(tests.uid('lider1@t'));
select ok(exists(select 1 from public.consigna_asignaciones where usuario_id = tests.uid('ase1@t')), 'el líder ve la asignación de ase1');
select tests.como_postgres();

select * from finish();
rollback;
