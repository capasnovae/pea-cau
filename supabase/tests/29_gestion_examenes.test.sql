-- Gestión: guardar preguntas con sus opciones (atómico) y contar el pozo de un examen
begin;
select plan(12);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();

create temp table ids (k text primary key, v uuid);
grant all on ids to authenticated, anon;

select tests.como(tests.uid('coordS@t'));
insert into ids select 'q', public.guardar_pregunta(jsonb_build_object(
  'tipo', 'opcion_multiple', 'enunciado_md', '¿Cuál?', 'explicacion_md', '', 'puntaje_max', 1, 'dificultad', 1,
  'categoria_id', (select id from public.categorias where slug = 'reglamento'), 'alcance', 'sede', 'sede_id', public.mi_sede(),
  'estado', 'borrador', 'uso', 'examen',
  'opciones', jsonb_build_array(jsonb_build_object('texto', 'a', 'es_correcta', true, 'orden', 1), jsonb_build_object('texto', 'b', 'es_correcta', false, 'orden', 2))));
select is((select count(*)::int from public.opciones where pregunta_id = (select v from ids where k = 'q')), 2, 'crea la pregunta con sus opciones');
select public.guardar_pregunta(jsonb_build_object(
  'id', (select v from ids where k = 'q'), 'tipo', 'opcion_multiple', 'enunciado_md', '¿Cuál de todas?', 'explicacion_md', '', 'puntaje_max', 1, 'dificultad', 1,
  'categoria_id', (select id from public.categorias where slug = 'reglamento'), 'alcance', 'sede', 'sede_id', public.mi_sede(),
  'estado', 'publicado', 'uso', 'examen',
  'opciones', jsonb_build_array(jsonb_build_object('texto', 'a', 'es_correcta', true, 'orden', 1), jsonb_build_object('texto', 'b', 'es_correcta', false, 'orden', 2),
                                jsonb_build_object('texto', 'c', 'es_correcta', false, 'orden', 3))));
select is((select count(*)::int from public.opciones where pregunta_id = (select v from ids where k = 'q')), 3, 'al editar reemplaza las opciones');
select is((select enunciado_md from public.preguntas where id = (select v from ids where k = 'q')), '¿Cuál de todas?', 'y actualiza la pregunta');
select tests.como_postgres();

select tests.como(tests.uid('aseR@t'));
select throws_ok(format($$select public.guardar_pregunta(jsonb_build_object('id', %L, 'tipo', 'opcion_multiple', 'enunciado_md', 'x', 'alcance', 'global', 'estado', 'borrador', 'opciones', '[]'::jsonb))$$,
  (select v from ids where k = 'q')), '42501', null, 'otro usuario no la edita');
select tests.como_postgres();

-- Una pregunta usada en un intento no cambia de tipo ni de cantidad de opciones, pero sí de texto
select tests.como(tests.uid('ase1@t'));
select public.iniciar_intento('f1000000-0000-4000-8000-000000000001');
select tests.como_postgres();
select tests.como(tests.uid('adm@t'));
select throws_ok($$select public.guardar_pregunta(jsonb_build_object('id', 'f2000000-0000-4000-8000-000000000001', 'tipo', 'verdadero_falso', 'enunciado_md', 'om',
  'categoria_id', (select id from public.categorias where slug = 'reglamento'), 'alcance', 'global', 'estado', 'publicado', 'uso', 'examen',
  'opciones', '[{"texto": "V", "es_correcta": true, "orden": 1}, {"texto": "F", "es_correcta": false, "orden": 2}]'::jsonb))$$,
  'P0001', 'pregunta en uso', 'no cambia el tipo de una pregunta usada');
select lives_ok($$select public.guardar_pregunta(jsonb_build_object('id', 'f2000000-0000-4000-8000-000000000001', 'tipo', 'opcion_multiple', 'enunciado_md', 'om corregida',
  'modulo_id', 'e2000000-0000-4000-8000-000000000001', 'categoria_id', (select id from public.categorias where slug = 'reglamento'), 'alcance', 'global', 'estado', 'publicado', 'uso', 'examen',
  'opciones', '[{"texto": "a2", "es_correcta": true, "orden": 1}, {"texto": "b", "es_correcta": true, "orden": 2}, {"texto": "c", "es_correcta": false, "orden": 3}]'::jsonb))$$,
  'sí corrige el texto');
select is((select texto from public.opciones where id = 'f3000000-0000-4000-8000-000000000001'), 'a2', 'conservando las opciones (los intentos siguen apuntando a ellas)');
select is(public.contar_pozo('f1000000-0000-4000-8000-000000000001'), 3, 'el pozo del examen de M1 tiene 3 preguntas');
select tests.como_postgres();

-- Examen integrador con fuentes, guardado de una vez
select tests.como(tests.uid('adm@t'));
insert into ids select 'e', public.guardar_examen(jsonb_build_object('titulo', 'Integrador', 'tipo', 'integrador', 'cantidad_preguntas', 4,
  'nota_minima', 80, 'max_intentos', 3, 'espera_horas', 24, 'mezclar', true, 'alcance', 'global', 'estado', 'borrador',
  'fuentes', jsonb_build_array(jsonb_build_object('modulo_id', 'e2000000-0000-4000-8000-000000000001', 'cantidad', 1),
                               jsonb_build_object('categoria_id', (select id from public.categorias where slug = 'plataformas')))));
select is((select count(*)::int from public.examen_fuentes where examen_id = (select v from ids where k = 'e')), 2, 'guarda el examen con sus fuentes');
select throws_ok(format($$select public.guardar_examen(jsonb_build_object('id', %L, 'titulo', 'Integrador', 'tipo', 'integrador', 'cantidad_preguntas', 4,
  'alcance', 'global', 'estado', 'borrador', 'fuentes', '[{"modulo_id": "e2000000-0000-4000-8000-000000000001", "categoria_id": "e2000000-0000-4000-8000-000000000001"}]'::jsonb))$$,
  (select v from ids where k = 'e')), '23514', null, 'una fuente inválida no deja nada a medias');
select is((select count(*)::int from public.examen_fuentes where examen_id = (select v from ids where k = 'e')), 2, 'las fuentes anteriores siguen');
select tests.como_postgres();

select tests.como(tests.uid('ase1@t'));
select throws_ok($$select public.contar_pozo('f1000000-0000-4000-8000-000000000001')$$, 'P0001', 'sin permiso', 'el asesor no cuenta el pozo');
select tests.como_postgres();

select * from finish();
rollback;
