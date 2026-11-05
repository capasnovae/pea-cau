begin;
select plan(6);
select tests.escenario();
select tests.contenido('Inscripción a materias', 'global', null, 'publicado');
select tests.contenido('Inscripción Roca', 'sede', 'T-Roca', 'publicado');
select tests.contenido('Inscripción borrador', 'global', null, 'borrador');
insert into public.recursos (categoria_id, titulo, tipo, url_externa, etiquetas, alcance, estado)
values ((select id from public.categorias where slug = 'aranceles-y-pagos'), 'Folleto de becas', 'enlace', 'https://ejemplo.test/f', '{becas}', 'global', 'publicado'),
       ((select id from public.categorias where slug = 'aranceles-y-pagos'), 'Becas 2020', 'enlace', 'https://ejemplo.test/v', '{becas}', 'global', 'publicado');
update public.recursos set vigente_hasta = '2020-12-31' where titulo = 'Becas 2020';

select tests.como(tests.uid('ase1@t'));
select results_eq($$select titulo from public.buscar_contenido('inscripcion')$$, $$values ('Inscripción a materias')$$,
  'busca sin acentos y respeta sede y estado');
select results_eq($$select titulo from public.buscar_contenido('becas')$$, $$values ('Folleto de becas')$$,
  'encuentra recursos por etiqueta y excluye vencidos');
select lives_ok($$select * from public.buscar_contenido('"inscrip OR ) (')$$, 'consulta rara no rompe');
select is_empty($$select * from public.buscar_contenido('   ')$$, 'consulta vacía no devuelve nada');
select tests.como_postgres();

select tests.como(tests.uid('aseR@t'));
select ok(exists(select 1 from public.buscar_contenido('inscripcion') where titulo = 'Inscripción Roca'), 'aseR encuentra lo de su sede');
select ok(not exists(select 1 from public.buscar_contenido('inscripcion') where titulo = 'Inscripción borrador'), 'nadie ve borradores en la búsqueda');
select tests.como_postgres();

select * from finish();
rollback;
