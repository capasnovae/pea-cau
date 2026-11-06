-- Bandeja: conversaciones dentro de la sede y anuncios de coordinación
begin;
select plan(35);
select tests.escenario();
select tests.crear_usuario('baja@t', 'asesor', 'T-Neuquén', 'servicio');
update public.perfiles set activo = false where email = 'baja@t';

create temp table ids (k text primary key, v uuid);
grant all on ids to authenticated, anon;

-- Contactos
select tests.como(tests.uid('ase1@t'));
select ok((select count(*) = 4 from public.contactos_bandeja() where id in (tests.uid('ase2@t'), tests.uid('aseV@t'), tests.uid('coordS@t'), tests.uid('dir@t'))),
  'el asesor ve como contactos a su sede y al director');
select ok(not exists (select 1 from public.contactos_bandeja() where id in (tests.uid('aseR@t'), tests.uid('ase1@t'), tests.uid('baja@t'))),
  'no ve a otra sede, a sí mismo ni a perfiles inactivos');

-- Iniciar conversaciones
insert into ids select 'c1', public.iniciar_conversacion(array[tests.uid('ase2@t')], 'Hola', 'Primer mensaje');
select ok((select v is not null from ids where k = 'c1'), 'ase1 le escribe a ase2');
select throws_ok($$select public.iniciar_conversacion(array[tests.uid('aseR@t')], 'x', 'y')$$,
  'P0001', 'destinatario no permitido', 'no le escribe a otra sede');
select throws_ok($$select public.iniciar_conversacion('{}', 'x', 'y')$$, 'P0001', 'sin destinatarios', 'sin destinatarios');
select throws_ok($$select public.iniciar_conversacion(array[auth.uid()], 'x', 'y')$$, 'P0001', 'sin destinatarios', 'solo a sí mismo cuenta como vacío');
select throws_ok($$select public.iniciar_conversacion(array(select gen_random_uuid() from generate_series(1, 51)), 'x', 'y')$$,
  'P0001', 'demasiados destinatarios', 'más de 50 destinatarios');
select throws_ok($$select public.iniciar_conversacion(array[tests.uid('ase2@t')], 'x', '   ')$$, '23514', null, 'cuerpo vacío');
select throws_ok($$insert into public.mensajes (conversacion_id, autor_id, cuerpo) values ((select v from ids where k = 'c1'), auth.uid(), 'x')$$,
  '42501', null, 'insert directo de mensajes: rechazado');
select tests.como_postgres();

select tests.como(tests.uid('dir@t'));
select lives_ok($$select public.iniciar_conversacion(array[tests.uid('aseR@t')], 'Dir', 'Hola Roca')$$, 'el director le escribe a cualquier sede');
select tests.como_postgres();
select tests.como(tests.uid('aseR@t'));
select lives_ok($$select public.iniciar_conversacion(array[tests.uid('dir@t')], 'Al dir', 'Hola')$$, 'cualquiera le escribe al director');
select tests.como_postgres();

-- Un tercero no ve nada
select tests.como(tests.uid('aseV@t'));
select is((select count(*)::int from public.conversaciones), 0, 'un no participante no ve conversaciones');
select is((select count(*)::int from public.mensajes), 0, 'ni mensajes');
select throws_ok($$select public.responder((select v from ids where k = 'c1'), 'x')$$, 'P0001', 'no participás de esta conversación', 'ni responde');
select throws_ok($$select * from public.mensajes_de((select v from ids where k = 'c1'))$$, 'P0001', 'no participás de esta conversación', 'ni lee los mensajes');
select tests.como_postgres();

-- Sin leer
select tests.como(tests.uid('ase2@t'));
select is(public.mensajes_sin_leer(), 1, 'el destinatario tiene 1 sin leer');
select ok(not exists (select 1 from public.mi_bandeja('enviados') where conversacion_id = (select v from ids where k = 'c1')),
  'para el destinatario no figura en enviados');
select is((select participantes from public.mi_bandeja() where conversacion_id = (select v from ids where k = 'c1')), 'ase1', 'muestra al otro participante');
select is((select count(*)::int from public.mensajes_de((select v from ids where k = 'c1'))), 1, 'el participante lee los mensajes');
select is((select count(*)::int from public.conversacion_participantes where conversacion_id = (select v from ids where k = 'c1')), 1,
  'cada participante ve solo su propia fila (no las lecturas de los demás)');
select public.marcar_leida((select v from ids where k = 'c1'));
select is(public.mensajes_sin_leer(), 0, 'después de leer, 0');
select public.archivar((select v from ids where k = 'c1'), true);
select ok(not exists (select 1 from public.mi_bandeja('entrada') where conversacion_id = (select v from ids where k = 'c1')), 'archivada no está en la entrada');
select ok(exists (select 1 from public.mi_bandeja('archivadas') where conversacion_id = (select v from ids where k = 'c1')), 'está en archivadas');
select throws_ok($$select * from public.mi_bandeja('xxx')$$, 'P0001', 'filtro inválido', 'filtro inválido');
select tests.como_postgres();

select tests.como(tests.uid('ase1@t'));
select is(public.mensajes_sin_leer(), 0, 'los mensajes propios no cuentan como sin leer');
select ok(exists (select 1 from public.mi_bandeja('enviados') where conversacion_id = (select v from ids where k = 'c1')), 'el autor la ve en enviados');
select public.responder((select v from ids where k = 'c1'), 'Segundo');
select tests.como_postgres();
select tests.como(tests.uid('ase2@t'));
select ok((select sin_leer from public.mi_bandeja('entrada') where conversacion_id = (select v from ids where k = 'c1')),
  'una respuesta la desarchiva y queda sin leer');
select tests.como_postgres();

-- Anuncios
select tests.como(tests.uid('ase1@t'));
select throws_ok($$select public.publicar_anuncio('x', 'y', null)$$, 'P0001', 'sin permiso', 'un asesor no publica anuncios');
select tests.como_postgres();
select tests.como(tests.uid('coordS@t'));
select throws_ok($$select public.publicar_anuncio('x', 'y', (select id from public.sedes where nombre = 'T-Roca'))$$,
  'P0001', 'sin permiso', 'un coordinador no publica para otra sede');
insert into ids select 'a1', public.publicar_anuncio('Campaña', 'Arranca mañana', null);
select tests.como_postgres();
select tests.como(tests.uid('ase1@t'));
select ok((select es_anuncio from public.mi_bandeja('anuncios') where conversacion_id = (select v from ids where k = 'a1')), 'el asesor de la sede recibe el anuncio');
select is((select count(*)::int from public.participantes_de((select v from ids where k = 'a1'))), 0, 'un anuncio no expone la lista de destinatarios');
select throws_ok($$select public.responder((select v from ids where k = 'a1'), 'ok')$$, 'P0001', 'los anuncios no admiten respuestas', 'no se responde un anuncio');
select tests.como_postgres();
select tests.como(tests.uid('aseR@t'));
select ok(not exists (select 1 from public.mi_bandeja('anuncios') where conversacion_id = (select v from ids where k = 'a1')), 'otra sede no lo recibe');
select tests.como_postgres();
select tests.como(tests.uid('dir@t'));
insert into ids select 'a2', public.publicar_anuncio('General', 'Para todos', null);
select tests.como_postgres();
select tests.como(tests.uid('aseR@t'));
select ok(exists (select 1 from public.mi_bandeja('anuncios') where conversacion_id = (select v from ids where k = 'a2')), 'el anuncio del director llega a todas las sedes');
select tests.como_postgres();

select tests.como_anon();
select throws_ok($$select public.iniciar_conversacion(array[gen_random_uuid()], 'x', 'y')$$, '42501', null, 'anon no ejecuta');
select tests.como_postgres();

select * from finish();
rollback;
