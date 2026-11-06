-- Correcciones de la revisión final de la Etapa 4
begin;
select plan(17);
select tests.escenario();
select tests.escenario_cursos();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;

-- I2: un nivel anterior sin pasos con requisito no bloquea al siguiente
update public.items set requisito = 'ninguno' where modulo_id in ('e2000000-0000-4000-8000-000000000001', 'e2000000-0000-4000-8000-000000000002');
select tests.como(tests.uid('ase1@t'));
select ok((select bool_and(disponible) from public.estado_curso('e1000000-0000-4000-8000-000000000002')),
  'si el nivel anterior no tiene pasos obligatorios, el siguiente queda desbloqueado');
select tests.como_postgres();
update public.items set requisito = 'ver' where id in ('e3000000-0000-4000-8000-000000000001', 'e3000000-0000-4000-8000-000000000003');
update public.items set requisito = 'marcar_hecho' where id = 'e3000000-0000-4000-8000-000000000002';

-- I2: hasta la etapa de exámenes no se puede exigir "aprobar"
select throws_ok($$insert into public.items (modulo_id, titulo, tipo, requisito) values ('e2000000-0000-4000-8000-000000000001', 'ex', 'examen', 'aprobar')$$,
  '23514', null, 'todavía no se puede crear un examen con requisito aprobar');

-- I3: ciclos de prerrequisitos
select throws_ok($$insert into public.modulo_prerrequisitos values ('e2000000-0000-4000-8000-000000000001', 'e2000000-0000-4000-8000-000000000002')$$,
  'P0001', 'integridad: los prerrequisitos forman un ciclo', 'el trigger rechaza un ciclo A→B→A');
select tests.como(tests.uid('adm@t'));
select throws_ok($$select public.guardar_prerrequisitos('e2000000-0000-4000-8000-000000000001', array['e2000000-0000-4000-8000-000000000002']::uuid[])$$,
  'P0001', 'integridad: los prerrequisitos forman un ciclo', 'guardar_prerrequisitos rechaza un ciclo');
select is((select count(*)::int from public.modulo_prerrequisitos where modulo_id = 'e2000000-0000-4000-8000-000000000002'), 1,
  'si falla, los prerrequisitos anteriores quedan intactos');
select lives_ok($$select public.guardar_prerrequisitos('e2000000-0000-4000-8000-000000000002', '{}'::uuid[])$$, 'se pueden vaciar');
select is((select count(*)::int from public.modulo_prerrequisitos where modulo_id = 'e2000000-0000-4000-8000-000000000002'), 0, 'quedan vacíos');
select tests.como_postgres();
select tests.como(tests.uid('coordS@t'));
select throws_ok($$select public.guardar_prerrequisitos('e2000000-0000-4000-8000-000000000002', array['e2000000-0000-4000-8000-000000000001']::uuid[])$$,
  '42501', null, 'un coordinador no edita prerrequisitos de un curso global');
select tests.como_postgres();

-- I4: un curso no puede usar contenido de otra sede
select throws_ok(format($$insert into public.items (modulo_id, titulo, tipo, articulo_id, requisito) values ('e2000000-0000-4000-8000-000000000001', 'a', 'articulo', %L, 'ver')$$,
  tests.contenido('Art NQN', 'sede', 'T-Neuquén', 'publicado')),
  'P0001', 'integridad: el contenido del paso no es visible para todo el público del curso', 'un curso global no usa un artículo de sede');
select lives_ok(format($$insert into public.items (modulo_id, titulo, tipo, articulo_id, requisito) values ('e2000000-0000-4000-8000-000000000004', 'a', 'articulo', %L, 'ver')$$,
  tests.contenido('Art Roca', 'sede', 'T-Roca', 'publicado')), 'un curso de Roca sí usa un artículo de Roca');
select tests.como(tests.uid('adm@t'));
select throws_ok($$select public.promover_contenido('cursos', 'e1000000-0000-4000-8000-000000000003')$$,
  'P0001', 'integridad: el curso usa contenido de sede; promové ese contenido primero', 'no se promueve un curso que usa contenido de sede');
select tests.como_postgres();

-- Escrituras directas a item_progreso
select tests.como(tests.uid('ase1@t'));
select throws_ok($$insert into public.item_progreso (usuario_id, item_id, visto_at) values (auth.uid(), 'e3000000-0000-4000-8000-000000000004', now())$$,
  '42501', null, 'insert directo de un ítem bloqueado: rechazado por la RLS');
select throws_ok($$insert into public.item_progreso (usuario_id, item_id, hecho_at) values (auth.uid(), 'e3000000-0000-4000-8000-000000000001', now())$$,
  'P0001', null, 'no se marca hecho un ítem de requisito ver');
insert into public.item_progreso (usuario_id, item_id, visto_at) values (auth.uid(), 'e3000000-0000-4000-8000-000000000001', '2000-01-01');
select ok((select visto_at > now() - interval '1 minute' from public.item_progreso where item_id = 'e3000000-0000-4000-8000-000000000001' and usuario_id = auth.uid()),
  'la fecha la pone el servidor');
select tests.como_postgres();

-- RLS de escritura por rol y sede
select tests.como(tests.uid('coordS@t'));
select throws_ok($$insert into public.cursos (tipo, nivel_orden, titulo, alcance, sede_id) values ('nivel', 7, 'x', 'sede', public.mi_sede())$$,
  null, null, 'un coordinador no crea niveles');
select throws_ok($$insert into public.modulos (curso_id, titulo) values ('e1000000-0000-4000-8000-000000000003', 'x')$$,
  '42501', null, 'ni módulos en un curso de otra sede');
select throws_ok($$insert into public.ruta_cursos (curso_id, puesto_id) values ('e1000000-0000-4000-8000-000000000001', (select id from public.puestos limit 1))$$,
  '42501', null, 'ni rutas');
select tests.como_postgres();

select * from finish();
rollback;
