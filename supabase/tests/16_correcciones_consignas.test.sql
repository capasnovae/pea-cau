begin;
select plan(8);
select tests.escenario();
select tests.contenido('Art NQN', 'sede', 'T-Neuquén', 'publicado');
select tests.contenido('Art global', 'global', null, 'publicado');
create temp table r as select
  (select id from public.sedes where nombre = 'T-Neuquén') as nqn,
  (select id from public.sedes where nombre = 'T-Roca') as roca,
  (select id from public.equipos where nombre = 'E1') as e1;
grant select on r to authenticated;

insert into public.consignas (id, sede_id, creada_por, tipo, titulo, destino, destino_equipo_id, requiere_evidencia)
values ('77777777-7777-7777-7777-777777777777', (select nqn from r), tests.uid('lider1@t'), 'tarea', 'Evidencia', 'equipo', (select e1 from r), true);

select tests.como(tests.uid('ase1@t'));
-- I1: la base exige la evidencia
select throws_ok($$update public.consigna_asignaciones set estado = 'hecha'
  where usuario_id = auth.uid() and consigna_id = '77777777-7777-7777-7777-777777777777'$$,
  'P0001', 'integridad: subí la evidencia', 'sin evidencia no se cierra');
-- I1: la evidencia tiene que ser de la propia asignación
select throws_ok($$update public.consigna_asignaciones set evidencia_path = '00000000-0000-0000-0000-000000000000/x.pdf'
  where usuario_id = auth.uid() and consigna_id = '77777777-7777-7777-7777-777777777777'$$,
  'P0001', 'no_autorizado: la evidencia no es de esta asignación', 'evidencia ajena rechazada');
select lives_ok($$update public.consigna_asignaciones set evidencia_path = id::text || '/foto.png', estado = 'hecha'
  where usuario_id = auth.uid() and consigna_id = '77777777-7777-7777-7777-777777777777'$$, 'con evidencia propia se cierra');
-- I2: las fechas no se reescriben
update public.consigna_asignaciones set completada_at = '2000-01-01'
  where usuario_id = auth.uid() and consigna_id = '77777777-7777-7777-7777-777777777777';
select ok((select completada_at > '2001-01-01' from public.consigna_asignaciones
  where usuario_id = auth.uid() and consigna_id = '77777777-7777-7777-7777-777777777777'), 'completada_at no se puede falsear');
select throws_ok($$update public.consigna_asignaciones set estado = 'pendiente'
  where usuario_id = auth.uid() and consigna_id = '77777777-7777-7777-7777-777777777777'$$,
  'P0001', 'no_autorizado: una consigna hecha no se reabre', 'una hecha no se reabre');
select tests.como_postgres();

-- I3: la lectura solo puede apuntar a un artículo global o de la sede de la consigna
select tests.como(tests.uid('dir@t'));
select throws_ok($$insert into public.consignas (sede_id, tipo, titulo, destino, articulo_id)
  values ((select roca from r), 'lectura', 'Leer NQN en Roca', 'sede', (select id from public.articulos where titulo = 'Art NQN'))$$,
  'P0001', 'integridad: el artículo no es visible para esa sede', 'no se asigna a Roca un artículo de Neuquén');
select lives_ok($$insert into public.consignas (sede_id, tipo, titulo, destino, articulo_id)
  values ((select roca from r), 'lectura', 'Leer global en Roca', 'sede', (select id from public.articulos where titulo = 'Art global'))$$,
  'un artículo global sí');
select tests.como_postgres();
-- I3: borrar un artículo usado en una lectura no rompe por el check
select throws_ok($$delete from public.articulos where titulo = 'Art global'$$, '23503', null, 'no se borra un artículo usado en una consigna');

select * from finish();
rollback;
