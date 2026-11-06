-- Banco de preguntas, exámenes, intentos y certificaciones: esquema y RLS
begin;
select plan(25);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();

select has_table('public', t, t) from unnest(array['casos', 'preguntas', 'opciones', 'examenes', 'examen_fuentes', 'intentos',
  'intento_preguntas', 'respuestas', 'certificaciones', 'practica_progreso']) t;

select tests.como(tests.uid('ase1@t'));
select is((select count(*)::int from public.preguntas), 0, 'el asesor no lee preguntas');
select is((select count(*)::int from public.opciones), 0, 'ni opciones');
select is((select count(*)::int from public.casos), 0, 'ni casos');
select ok((select count(*) > 0 from public.examenes), 'sí lee la configuración de los exámenes publicados');
select throws_ok($$insert into public.intentos (usuario_id, examen_id, ciclo) values (auth.uid(), 'f1000000-0000-4000-8000-000000000001', 1)$$,
  '42501', null, 'no inserta intentos directo');
select throws_ok($$insert into public.certificaciones (usuario_id, curso_id, origen) values (auth.uid(), 'e1000000-0000-4000-8000-000000000001', 'examen')$$,
  '42501', null, 'ni certificaciones');
select tests.como_postgres();

select tests.como(tests.uid('coordS@t'));
select lives_ok($$insert into public.preguntas (tipo, enunciado_md, rubrica_md, categoria_id, alcance, sede_id) values ('libre', 'x', 'r', (select id from public.categorias where slug = 'reglamento'), 'sede', public.mi_sede())$$,
  'el coordinador crea preguntas de su sede');
select throws_ok($$insert into public.preguntas (tipo, enunciado_md, rubrica_md, categoria_id, alcance, sede_id) values ('libre', 'x', 'r', (select id from public.categorias where slug = 'reglamento'), 'sede', (select id from public.sedes where nombre = 'T-Roca'))$$,
  '42501', null, 'no de otra sede');
select throws_ok($$insert into public.preguntas (tipo, enunciado_md, rubrica_md, categoria_id, alcance) values ('libre', 'x', 'r', (select id from public.categorias where slug = 'reglamento'), 'global')$$,
  '42501', null, 'ni globales');
select tests.como_postgres();

select throws_ok($$insert into public.preguntas (tipo, enunciado_md, categoria_id) values ('simulacion', 'x', (select id from public.categorias where slug = 'reglamento'))$$,
  '23514', null, 'simulación sin caso');
select throws_ok($$insert into public.preguntas (tipo, enunciado_md, categoria_id, config) values ('formulario', 'x', (select id from public.categorias where slug = 'reglamento'), '{"campos": []}')$$,
  '23514', null, 'formulario sin solución');
select throws_ok($$insert into public.opciones (pregunta_id, texto, posicion_correcta) values ('f2000000-0000-4000-8000-000000000001', 'x', 1)$$,
  'P0001', null, 'posición correcta solo en ordenar');
select throws_ok($$insert into public.examenes (titulo, tipo, cantidad_preguntas) values ('x', 'modulo', 3)$$,
  '23514', null, 'examen de módulo sin módulo');
select throws_ok($$insert into public.examen_fuentes (examen_id, modulo_id, categoria_id) values ('f1000000-0000-4000-8000-000000000007', 'e2000000-0000-4000-8000-000000000001', (select id from public.categorias where slug = 'reglamento'))$$,
  '23514', null, 'una fuente con dos referencias');
select lives_ok($$insert into public.items (modulo_id, titulo, tipo, examen_id, requisito) values ('e2000000-0000-4000-8000-000000000001', 'ex', 'examen', 'f1000000-0000-4000-8000-000000000001', 'aprobar')$$,
  'un paso de examen ya puede exigir aprobar');

select * from finish();
rollback;
