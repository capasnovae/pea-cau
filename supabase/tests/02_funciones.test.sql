begin;
select plan(22);
select tests.escenario();

-- asesor
select tests.como(tests.uid('ase1@t'));
select ok(public.puede_ver_usuario(tests.uid('ase1@t')), 'asesor se ve a sí mismo');
select ok(not public.puede_ver_usuario(tests.uid('ase2@t')), 'asesor no ve a otro asesor');
select is(public.mi_rol(), 'asesor'::public.rol_app, 'mi_rol del asesor');
select tests.como_postgres();

-- coordinador de servicio
select tests.como(tests.uid('coordS@t'));
select ok(public.puede_ver_usuario(tests.uid('ase1@t')), 'coordS ve ase1');
select ok(public.puede_ver_usuario(tests.uid('ase2@t')), 'coordS ve ase2');
select ok(not public.puede_ver_usuario(tests.uid('aseV@t')), 'coordS no ve ventas');
select ok(not public.puede_ver_usuario(tests.uid('aseR@t')), 'coordS no ve otra sede');
select is(public.mi_area(), 'servicio'::public.area, 'mi_area del coordS');
select tests.como_postgres();

-- coordinador de ventas
select tests.como(tests.uid('coordV@t'));
select ok(public.puede_ver_usuario(tests.uid('aseV@t')), 'coordV ve aseV');
select ok(not public.puede_ver_usuario(tests.uid('ase1@t')), 'coordV no ve servicio');
select tests.como_postgres();

-- líder
select tests.como(tests.uid('lider1@t'));
select ok(public.puede_ver_usuario(tests.uid('ase1@t')), 'líder ve a su equipo');
select ok(not public.puede_ver_usuario(tests.uid('ase2@t')), 'líder no ve fuera de su equipo');
select tests.como_postgres();

-- director y admin
select tests.como(tests.uid('dir@t'));
select ok(public.puede_ver_usuario(tests.uid('aseR@t')), 'director ve Roca');
select ok(public.puede_ver_usuario(tests.uid('ase1@t')), 'director ve Neuquén');
select tests.como_postgres();
select tests.como(tests.uid('adm@t'));
select ok(public.puede_ver_usuario(tests.uid('aseR@t')), 'admin ve todo');
select tests.como_postgres();

-- coordinador sin área (perfil incompleto)
select tests.como(tests.uid('coordX@t'));
select ok(not public.puede_ver_usuario(tests.uid('ase1@t')), 'coord sin área no ve a nadie');
select ok(public.puede_ver_usuario(tests.uid('coordX@t')), 'coord sin área se ve a sí mismo');
select tests.como_postgres();

-- usuario inactivo
select tests.como(tests.uid('aseInactivo@t'));
select is(public.mi_rol(), null, 'inactivo no tiene rol efectivo');
select ok(not public.puede_ver_usuario(tests.uid('ase1@t')), 'inactivo no ve a otros');
select ok(public.puede_ver_usuario(tests.uid('aseInactivo@t')), 'inactivo se ve a sí mismo');
select tests.como_postgres();

-- equipo sin líder no abre nada
select tests.como(tests.uid('aseR@t'));
select ok(not public.puede_ver_usuario(tests.uid('ase1@t')), 'equipo sin líder no da visibilidad');
select ok(not public.mi_perfil_activo() is null, 'mi_perfil_activo devuelve booleano');
select tests.como_postgres();

select * from finish();
rollback;
