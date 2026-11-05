begin;
select plan(17);
select tests.escenario();

-- asesor
select tests.como(tests.uid('ase1@t'));
select is((select count(*)::int from public.perfiles where email like '%@t'), 1, 'asesor solo ve su perfil');
select throws_ok($$update public.perfiles set rol = 'admin' where id = auth.uid()$$,
  'P0001', 'no_autorizado: no podés cambiar el rol', 'asesor no puede autoascenderse');
select throws_ok($$update public.perfiles set sede_id = null where id = auth.uid()$$,
  'P0001', 'no_autorizado: campo protegido', 'asesor no puede cambiar su sede');
select throws_ok($$update public.perfiles set activo = false where id = auth.uid()$$,
  'P0001', 'no_autorizado: campo protegido', 'asesor no puede cambiar su estado');
select lives_ok($$update public.perfiles set telefono = '299 555 0000' where id = auth.uid()$$,
  'asesor puede cambiar su teléfono');
select throws_ok($$insert into public.sedes (nombre, ciudad) values ('X', 'X')$$,
  '42501', null, 'asesor no crea sedes');
select tests.como_postgres();

-- coordinador de servicio
select tests.como(tests.uid('coordS@t'));
select is((select count(*)::int from public.perfiles where email like '%@t'), 5,
  'coordS ve su sede y área (incluye inactivos)');
select lives_ok($$update public.perfiles set equipo_id = (select id from public.equipos where nombre = 'E1')
  where email = 'ase2@t'$$, 'coordS asigna equipo');
select throws_ok($$update public.perfiles set rol = 'lider' where email = 'ase2@t'$$,
  'P0001', 'no_autorizado: no podés cambiar el rol', 'coordS no cambia roles');
select throws_ok($$update public.perfiles set sede_id = null where email = 'ase2@t'$$,
  'P0001', 'no_autorizado: campo protegido', 'coordS no cambia sedes');
select is_empty($$update public.perfiles set telefono = 'x' where email = 'aseR@t' returning id$$,
  'coordS no toca otra sede');
select tests.como_postgres();

-- director
select tests.como(tests.uid('dir@t'));
select is((select count(*)::int from public.perfiles where email like '%@t'), 11, 'director ve todos');
select tests.como_postgres();

-- inactivo
select tests.como(tests.uid('aseInactivo@t'));
select is((select count(*)::int from public.sedes), 0, 'inactivo no ve sedes');
select tests.como_postgres();

-- anónimo
select tests.como_anon();
select throws_ok($$select count(*) from public.perfiles$$, '42501', null, 'anon no accede a perfiles');
select throws_ok($$select count(*) from public.sedes$$, '42501', null, 'anon no accede a sedes');
select tests.como_postgres();

-- admin
select tests.como(tests.uid('adm@t'));
select lives_ok($$update public.perfiles set rol = 'lider' where email = 'ase2@t'$$, 'admin cambia roles');
select is((select rol from public.perfiles where email = 'ase2@t'), 'lider'::public.rol_app, 'el rol cambió');
select tests.como_postgres();

select * from finish();
rollback;
