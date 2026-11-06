-- Calendario: eventos de sede, mi_calendario, favoritos y mi_trabajo
begin;
select plan(16);
select tests.escenario();
select tests.escenario_cursos();

create temp table ids (k text primary key, v uuid);
grant all on ids to authenticated, anon;

-- Eventos
select tests.como(tests.uid('coordS@t'));
select lives_ok($$insert into public.eventos (titulo, fecha, sede_id, creado_por) values ('NQN', public.hoy_ar() + 2, public.mi_sede(), tests.uid('dir@t'))$$,
  'el coordinador crea un evento de su sede');
select throws_ok($$insert into public.eventos (titulo, fecha, sede_id) values ('Roca', public.hoy_ar(), (select id from public.sedes where nombre = 'T-Roca'))$$,
  '42501', null, 'no para otra sede');
select throws_ok($$insert into public.eventos (titulo, fecha, sede_id) values ('Global', public.hoy_ar(), null)$$,
  '42501', null, 'ni global');
select tests.como_postgres();
select is((select creado_por from public.eventos where titulo = 'NQN'), tests.uid('coordS@t'), 'creado_por lo fija el servidor');

select tests.como(tests.uid('dir@t'));
select lives_ok($$insert into public.eventos (titulo, fecha, sede_id, tipo) values ('Global', public.hoy_ar() + 3, null, 'capacitacion')$$,
  'el director crea un evento global');
select tests.como_postgres();

select tests.como(tests.uid('aseR@t'));
select results_eq($$select titulo from public.eventos order by titulo$$, $$values ('Global')$$, 'otra sede ve solo el global');
select tests.como_postgres();
select tests.como(tests.uid('ase1@t'));
select results_eq($$select titulo from public.eventos order by titulo$$, $$values ('Global'), ('NQN')$$, 'la sede ve el suyo y el global');
select tests.como_postgres();

-- Consignas de ase1 (como postgres): una vence en 3 días, una venció ayer, una hecha hoy
insert into public.consignas (id, sede_id, creada_por, titulo, destino, destino_usuario_id)
values ('55555555-5555-4555-8555-555555555551', (select id from public.sedes where nombre = 'T-Neuquén'), tests.uid('coordS@t'),
        'Planilla', 'usuario', tests.uid('ase1@t'));
delete from public.consigna_asignaciones where consigna_id = '55555555-5555-4555-8555-555555555551';
insert into public.consigna_asignaciones (consigna_id, usuario_id, periodo, vence_el, estado, completada_at) values
  ('55555555-5555-4555-8555-555555555551', tests.uid('ase1@t'), '2026-01-01', public.hoy_ar() + 3, 'pendiente', null),
  ('55555555-5555-4555-8555-555555555551', tests.uid('ase1@t'), '2026-01-02', public.hoy_ar() - 1, 'pendiente', null),
  ('55555555-5555-4555-8555-555555555551', tests.uid('ase1@t'), '2026-01-03', public.hoy_ar(), 'hecha', now());

select tests.como(tests.uid('ase1@t'));
select is((select count(*)::int from public.mi_calendario(public.hoy_ar() - 5, public.hoy_ar() + 10) where categoria = 'consigna'), 3,
  'mi_calendario trae mis consignas del rango');
select is((select count(*)::int from public.mi_calendario(public.hoy_ar() - 5, public.hoy_ar() + 10) where categoria in ('evento', 'capacitacion')), 2,
  'y los eventos visibles');
select throws_ok($$select * from public.mi_calendario(public.hoy_ar(), public.hoy_ar() - 1)$$, 'P0001', 'rango inválido', 'rango invertido');
select throws_ok($$select * from public.mi_calendario(public.hoy_ar(), public.hoy_ar() + 63)$$, 'P0001', 'rango inválido', 'rango de más de 62 días');
select results_eq($$select por_vencer, vencidas, hechas from public.mi_trabajo()$$, $$values (1, 1, 1)$$, 'mi_trabajo resume por vencer, vencidas y hechas');

-- Favoritos
select lives_ok($$insert into public.cursos_favoritos (curso_id) values ('e1000000-0000-4000-8000-000000000001')$$, 'el asesor marca un favorito');
select throws_ok($$insert into public.cursos_favoritos (usuario_id, curso_id) values (tests.uid('ase2@t'), 'e1000000-0000-4000-8000-000000000002')$$,
  '42501', null, 'no marca favoritos de otro');
select tests.como_postgres();
select tests.como(tests.uid('ase2@t'));
select is((select count(*)::int from public.cursos_favoritos), 0, 'no ve favoritos ajenos');
select is((select count(*)::int from public.mi_calendario(public.hoy_ar() - 5, public.hoy_ar() + 10) where categoria = 'consigna'), 0,
  'ni consignas ajenas en su calendario');
select tests.como_postgres();

select * from finish();
rollback;
