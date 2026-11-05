begin;
select plan(19);
select tests.escenario();
select tests.contenido('G', 'global', null, 'publicado');
select tests.contenido('N', 'sede', 'T-Neuquén', 'publicado');
select tests.contenido('NB', 'sede', 'T-Neuquén', 'borrador');
select tests.contenido('R', 'sede', 'T-Roca', 'publicado');

create temp table ids as select titulo, id from public.articulos where titulo in ('G','N','NB','R');
grant select on ids to authenticated, anon;

-- asesor de Neuquén
select tests.como(tests.uid('ase1@t'));
select results_eq($$select titulo from public.articulos where titulo in ('G','N','NB','R') order by titulo$$,
  $$values ('G'), ('N')$$, 'ase1 ve lo global y lo publicado de su sede');
select tests.como_postgres();

-- asesor de Roca
select tests.como(tests.uid('aseR@t'));
select results_eq($$select titulo from public.articulos where titulo in ('G','N','NB','R') order by titulo$$,
  $$values ('G'), ('R')$$, 'aseR ve lo global y lo de Roca');
select is_empty($$select 1 from public.articulos where id = (select id from ids where titulo = 'N')$$,
  'aseR no ve el artículo de Neuquén por id');
select tests.como_postgres();

-- coordinador de Neuquén
select tests.como(tests.uid('coordS@t'));
select ok(exists(select 1 from public.articulos where titulo = 'NB'), 'coordS ve el borrador de su sede');
select lives_ok($$insert into public.articulos (categoria_id, slug, titulo, alcance, sede_id)
  values ((select id from public.categorias where slug = 'tramites'), 'c1', 'C1', 'sede', public.mi_sede())$$,
  'coordS crea contenido de su sede');
select is((select autor_id from public.articulos where slug = 'c1'), auth.uid(), 'el autor queda registrado');
select throws_ok($$insert into public.articulos (categoria_id, slug, titulo, alcance)
  values ((select id from public.categorias where slug = 'tramites'), 'c2', 'C2', 'global')$$,
  '42501', null, 'coordS no crea contenido global');
select throws_ok($$insert into public.articulos (categoria_id, slug, titulo, alcance, sede_id)
  values ((select id from public.categorias where slug = 'tramites'), 'c3', 'C3', 'sede', (select id from public.sedes where nombre = 'T-Roca'))$$,
  '42501', null, 'coordS no crea contenido de otra sede');
select is_empty($$update public.articulos set resumen = 'x' where titulo = 'G' returning id$$, 'coordS no edita lo global');
select throws_ok($$select public.promover_contenido('articulos', (select id from ids where titulo = 'N'))$$,
  'P0001', 'no_autorizado: solo el admin promueve', 'coordS no promueve');
select tests.como_postgres();

-- director
select tests.como(tests.uid('dir@t'));
select lives_ok($$insert into public.articulos (categoria_id, slug, titulo, alcance, sede_id)
  values ((select id from public.categorias where slug = 'tramites'), 'd1', 'D1', 'sede', (select id from public.sedes where nombre = 'T-Roca'))$$,
  'director crea contenido de cualquier sede');
select throws_ok($$insert into public.articulos (categoria_id, slug, titulo, alcance)
  values ((select id from public.categorias where slug = 'tramites'), 'd2', 'D2', 'global')$$,
  '42501', null, 'director no crea contenido global');
select tests.como_postgres();

-- admin promueve
select tests.como(tests.uid('adm@t'));
select lives_ok($$select public.promover_contenido('articulos', (select id from ids where titulo = 'N'))$$, 'admin promueve');
select tests.como_postgres();
select is((select alcance from public.articulos where titulo = 'N'), 'global'::public.alcance, 'quedó global');
select is((select s.nombre from public.articulos a join public.sedes s on s.id = a.sede_origen_id where a.titulo = 'N'), 'T-Neuquén', 'conserva la sede de origen');
select is((select count(*)::int from public.auditoria where accion = 'promover' and entidad_id = (select id from ids where titulo = 'N')), 1, 'la promoción queda auditada');
select tests.como(tests.uid('aseR@t'));
select ok(exists(select 1 from public.articulos where titulo = 'N'), 'aseR ve lo promovido');
select tests.como_postgres();

-- inactivo y anónimo
select tests.como(tests.uid('aseInactivo@t'));
select is_empty($$select 1 from public.articulos where titulo = 'G'$$, 'inactivo no ve nada');
select tests.como_postgres();
select tests.como_anon();
select throws_ok($$select 1 from public.articulos$$, '42501', null, 'anon no accede');
select tests.como_postgres();

select * from finish();
rollback;
