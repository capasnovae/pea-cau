-- Insignias por nivel, verificación pública y revocación
begin;
select plan(16);
select tests.escenario();
select tests.escenario_cursos();

create temp table ids (k text primary key, v uuid);
grant all on ids to authenticated, anon;

select ok((select count(*) = 2 from public.insignias where curso_id in ('e1000000-0000-4000-8000-000000000001', 'e1000000-0000-4000-8000-000000000002')),
  'los niveles tienen su insignia');
insert into public.cursos (id, tipo, nivel_orden, titulo, alcance, estado) values ('e1000000-0000-4000-8000-000000000009', 'nivel', 7, 'T-Nivel 7', 'global', 'borrador');
select is((select nombre from public.insignias where curso_id = 'e1000000-0000-4000-8000-000000000009'), 'Nivel 7', 'crear un nivel crea su insignia');

-- Otorgar, perder y recuperar sin duplicar
with x as (insert into public.certificaciones (usuario_id, curso_id, origen)
  values (tests.uid('ase1@t'), 'e1000000-0000-4000-8000-000000000001', 'examen') returning id)
insert into ids select 'c', id from x;
select is((select count(*)::int from public.usuario_insignias where usuario_id = tests.uid('ase1@t') and perdida_at is null), 1, 'una certificación vigente otorga la insignia');
update public.certificaciones set estado = 'vencida' where id = (select v from ids where k = 'c');
select results_eq($$select perdida_at is not null, motivo_perdida from public.usuario_insignias where usuario_id = tests.uid('ase1@t')$$,
  $$values (true, 'vencida')$$, 'al vencer se pierde');
insert into public.certificaciones (usuario_id, curso_id, origen) values (tests.uid('ase1@t'), 'e1000000-0000-4000-8000-000000000001', 'examen');
select results_eq($$select count(*)::int, bool_and(perdida_at is null) from public.usuario_insignias where usuario_id = tests.uid('ase1@t')$$,
  $$values (1, true)$$, 'una nueva certificación la recupera sin duplicar');
insert into public.certificaciones (usuario_id, curso_id, origen) values (tests.uid('ase2@t'), 'e1000000-0000-4000-8000-000000000002', 'ubicacion');
select is((select count(*)::int from public.usuario_insignias where usuario_id = tests.uid('ase2@t')), 1, 'la ubicación también otorga la insignia');

select tests.como(tests.uid('ase2@t'));
select is((select count(*)::int from public.usuario_insignias where usuario_id = tests.uid('ase1@t')), 0, 'otro asesor no ve insignias ajenas');
select tests.como_postgres();
select tests.como(tests.uid('coordS@t'));
select is((select count(*)::int from public.usuario_insignias where usuario_id = tests.uid('ase1@t')), 1, 'el coordinador de su sede y área sí');
select tests.como_postgres();

-- Verificación pública
create temp table cod as select codigo_verificacion as c from public.certificaciones
  where usuario_id = tests.uid('ase1@t') and estado = 'vigente';
grant select on cod to anon, authenticated;
select tests.como_anon();
select results_eq($$select nombre, estado from public.verificar_certificado(lower(' ' || (select c from cod) || ' '))$$,
  $$values ('ase1', 'vigente')$$, 'anon verifica por código (sin importar mayúsculas ni espacios)');
select is((select count(*)::int from public.verificar_certificado('NOEXISTE')), 0, 'un código inexistente no devuelve nada');
select throws_ok($$select count(*) from public.certificaciones$$, '42501', null, 'anon no lee certificaciones');
select tests.como_postgres();
update public.certificaciones set vence_at = now() - interval '1 day' where codigo_verificacion = (select c from cod);
select tests.como_anon();
select is((select estado from public.verificar_certificado((select c from cod))), 'vencida', 'vencida por fecha aunque el estado diga vigente');
select tests.como_postgres();

-- Revocación
select tests.como(tests.uid('coordS@t'));
select throws_ok($$select public.revocar_certificacion((select id from public.certificaciones where codigo_verificacion = (select c from cod)), 'x')$$,
  'P0001', 'sin permiso', 'solo el admin revoca');
select tests.como_postgres();
select tests.como(tests.uid('adm@t'));
select throws_ok($$select public.revocar_certificacion((select id from public.certificaciones where codigo_verificacion = (select c from cod)), '  ')$$,
  'P0001', 'motivo inválido', 'con motivo');
select public.revocar_certificacion((select id from public.certificaciones where codigo_verificacion = (select c from cod)), 'Error de carga');
select tests.como_postgres();
select tests.como_anon();
select is((select estado from public.verificar_certificado((select c from cod))), 'revocada', 'la verificación muestra revocada');
select tests.como_postgres();
select is((select motivo_perdida from public.usuario_insignias where usuario_id = tests.uid('ase1@t')), 'revocada', 'y la insignia queda perdida');

select * from finish();
rollback;
