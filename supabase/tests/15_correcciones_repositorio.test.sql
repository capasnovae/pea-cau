begin;
select plan(8);
select tests.escenario();
create temp table c as select (select id::text from public.sedes where nombre = 'T-Neuquén') as nqn;
grant select on c to authenticated;

-- archivos en storage + filas de recursos
insert into storage.objects (bucket_id, name) values
  ('recursos', 'global/borrador.pdf'),
  ('recursos', (select nqn from c) || '/publicado-nqn.pdf');
insert into public.recursos (categoria_id, titulo, tipo, archivo_path, alcance, sede_id, estado) values
  ((select id from public.categorias where slug = 'reglamento'), 'Borrador global', 'pdf', 'global/borrador.pdf', 'global', null, 'borrador'),
  ((select id from public.categorias where slug = 'reglamento'), 'Publicado NQN', 'pdf', (select nqn from c) || '/publicado-nqn.pdf', 'sede',
   (select id from public.sedes where nombre = 'T-Neuquén'), 'publicado');

-- I2: el archivo de un borrador no es visible para asesores
select tests.como(tests.uid('ase1@t'));
select is_empty($$select 1 from storage.objects where bucket_id = 'recursos' and name = 'global/borrador.pdf'$$,
  'el asesor no ve el archivo de un recurso en borrador');
select ok(exists(select 1 from storage.objects where bucket_id = 'recursos' and name = (select nqn from c) || '/publicado-nqn.pdf'),
  'el asesor ve el archivo de un recurso publicado de su sede');
select tests.como_postgres();
select tests.como(tests.uid('adm@t'));
select ok(exists(select 1 from storage.objects where bucket_id = 'recursos' and name = 'global/borrador.pdf'), 'el admin ve el borrador');

-- I3: promover un recurso con archivo deja el archivo descargable para otras sedes
select public.promover_contenido('recursos', (select id from public.recursos where titulo = 'Publicado NQN'));
select tests.como_postgres();
select tests.como(tests.uid('aseR@t'));
select ok(exists(select 1 from storage.objects where bucket_id = 'recursos' and name = (select nqn from c) || '/publicado-nqn.pdf'),
  'tras promover, el asesor de Roca ve el archivo');
select tests.como_postgres();

-- I5: el historial de versiones no expone borradores a asesores
select tests.contenido('Versionado', 'global', null, 'borrador');
update public.articulos set cuerpo_md = 'SECRETO borrador' where titulo = 'Versionado';
update public.articulos set cuerpo_md = 'Texto final', estado = 'publicado' where titulo = 'Versionado';
select tests.como(tests.uid('aseR@t'));
select is_empty($$select 1 from public.articulo_versiones v join public.articulos a on a.id = v.articulo_id where a.titulo = 'Versionado'$$,
  'el asesor no lee el historial de versiones');
select tests.como_postgres();
select tests.como(tests.uid('adm@t'));
select ok(exists(select 1 from public.articulo_versiones v join public.articulos a on a.id = v.articulo_id where a.titulo = 'Versionado'),
  'el admin lee el historial');
select tests.como_postgres();

-- Un recurso no puede apuntar a un archivo de una carpeta que su autor no puede editar
select tests.como(tests.uid('coordS@t'));
select throws_ok($$insert into public.recursos (categoria_id, titulo, tipo, archivo_path, alcance, sede_id, estado)
  values ((select id from public.categorias where slug = 'reglamento'), 'Truco', 'pdf',
          (select id::text from public.sedes where nombre = 'T-Roca') || '/ajeno.pdf', 'sede', public.mi_sede(), 'publicado')$$,
  'P0001', 'no_autorizado: el archivo es de otra carpeta', 'coordS no puede apuntar a un archivo de Roca');
select throws_ok($$insert into public.recursos (categoria_id, titulo, tipo, archivo_path, alcance, sede_id, estado)
  values ((select id from public.categorias where slug = 'reglamento'), 'Truco 2', 'pdf', 'global/ajeno.pdf', 'sede', public.mi_sede(), 'publicado')$$,
  'P0001', 'no_autorizado: el archivo es de otra carpeta', 'coordS no puede apuntar a un archivo global');
select tests.como_postgres();

select * from finish();
rollback;
