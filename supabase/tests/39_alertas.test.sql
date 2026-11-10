-- Alertas: deduplicadas por clave, solo del dueño, escritas por funciones internas
begin;
select plan(12);
select tests.escenario();

select ok(public.crear_alerta(tests.uid('ase1@t'), 'prueba', 'Hola', 'Mensaje', '/avisos', 'k1'), 'crea la alerta');
select ok(not public.crear_alerta(tests.uid('ase1@t'), 'prueba', 'Hola', 'Mensaje', '/avisos', 'k1'), 'con la misma clave no la repite');
select is((select count(*)::int from public.alertas where usuario_id = tests.uid('ase1@t')), 1, 'queda una sola');
select is((select email_pendiente from public.alertas where clave = 'k1'), false, 'sin preferencia de email no queda para enviar');
update public.perfiles set avisos_email = true where id = tests.uid('ase2@t');
select public.crear_alerta(tests.uid('ase2@t'), 'prueba', 'Hola', 'Mensaje', null, 'k2');
select is((select email_pendiente from public.alertas where clave = 'k2'), true, 'con preferencia queda para enviar');

select tests.como(tests.uid('ase1@t'));
select is(public.alertas_sin_leer(), 1, 'el dueño ve su contador');
select is((select count(*)::int from public.alertas), 1, 'y solo sus alertas');
select public.marcar_alertas_leidas(array[(select id from public.alertas limit 1)]);
select is(public.alertas_sin_leer(), 0, 'marca las suyas como leídas');
select public.preferir_avisos_email(true);
select is((select avisos_email from public.perfiles where id = auth.uid()), true, 'el asesor elige recibir avisos por email');
select throws_ok($$insert into public.alertas (usuario_id, tipo, titulo, mensaje, clave) values (auth.uid(), 'x', 'x', 'x', 'x')$$, '42501', null, 'no se escriben a mano');
select tests.como_postgres();

select tests.como(tests.uid('ase1@t'));
select public.marcar_alertas_leidas(array[(select id from public.alertas where clave = 'k2')]);
select tests.como_postgres();
select is((select leida_at from public.alertas where clave = 'k2'), null, 'no puede marcar las ajenas');
select ok(not has_function_privilege('authenticated', 'public.crear_alerta(uuid, text, text, text, text, text)', 'execute'), 'crear_alerta es interna');

select * from finish();
rollback;
