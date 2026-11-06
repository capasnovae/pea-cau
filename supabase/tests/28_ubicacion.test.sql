-- Examen de ubicación por bloques
begin;
select plan(14);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;
update public.examenes set estado = 'archivado' where tipo = 'ubicacion' and id <> 'f1000000-0000-4000-8000-000000000006';

create temp table ids (k text primary key, v uuid);
grant all on ids to authenticated, anon;

-- Respuestas correctas de cada bloque
create function pg_temp.bien(p_intento uuid) returns void language plpgsql as $$
begin
  perform public.guardar_respuesta(p_intento, q.pregunta_id,
    case q.pregunta_id
      when 'f2000000-0000-4000-8000-000000000001' then array['f3000000-0000-4000-8000-000000000001', 'f3000000-0000-4000-8000-000000000002']::uuid[]
      when 'f2000000-0000-4000-8000-000000000002' then array['f3000000-0000-4000-8000-000000000004']::uuid[]
      when 'f2000000-0000-4000-8000-000000000005' then array['f3000000-0000-4000-8000-000000000009']::uuid[]
      when 'f2000000-0000-4000-8000-000000000006' then array['f3000000-0000-4000-8000-000000000011']::uuid[]
    end,
    case when q.pregunta_id = 'f2000000-0000-4000-8000-000000000003'
      then array['f3000000-0000-4000-8000-000000000006', 'f3000000-0000-4000-8000-000000000007', 'f3000000-0000-4000-8000-000000000008']::uuid[] end,
    null)
  from public.preguntas_intento(p_intento) q;
end $$;

select tests.como(tests.uid('ase1@t'));
select throws_ok($$select public.iniciar_ubicacion()$$, 'P0001', 'no habilitada', 'sin habilitar no se rinde');
select tests.como_postgres();
select tests.como(tests.uid('aseR@t'));
select throws_ok($$select public.habilitar_ubicacion(tests.uid('ase1@t'))$$, 'P0001', 'sin permiso', 'un asesor no habilita');
select tests.como_postgres();
select tests.como(tests.uid('coordS@t'));
select lives_ok($$select public.habilitar_ubicacion(tests.uid('ase1@t'))$$, 'el coordinador de su sede y área habilita');
select tests.como_postgres();
select ok((select experiencia_previa from public.perfiles where id = tests.uid('ase1@t')), 'queda marcado con experiencia');

-- Bloque 1 aprobado, bloque 2 reprobado
select tests.como(tests.uid('ase1@t'));
select results_eq($$select habilitada, rendida, bloque_actual from public.estado_ubicacion()$$, $$values (true, false, 1)$$, 'habilitada, bloque 1');
insert into ids select 'b1', public.iniciar_ubicacion();
select is((select bloque_nivel from public.intentos where id = (select v from ids where k = 'b1')), 1, 'arranca por el bloque 1');
select pg_temp.bien((select v from ids where k = 'b1'));
select public.entregar_intento((select v from ids where k = 'b1'));
select results_eq($$select origen::text from public.certificaciones where curso_id = 'e1000000-0000-4000-8000-000000000001'$$, $$values ('ubicacion')$$,
  'aprobar el bloque acredita el nivel');
select ok((select bool_and(disponible) from public.estado_curso('e1000000-0000-4000-8000-000000000002')), 'y desbloquea el siguiente');
insert into ids select 'b2', public.iniciar_ubicacion();
select is((select bloque_nivel from public.intentos where id = (select v from ids where k = 'b2')), 2, 'sigue con el bloque 2');
select public.entregar_intento((select v from ids where k = 'b2'));
select results_eq($$select rendida, niveles_acreditados from public.estado_ubicacion()$$, $$values (true, array[8])$$,
  'reprobar un bloque corta la ubicación');
select throws_ok($$select public.iniciar_ubicacion()$$, 'P0001', 'no habilitada', 'no se rinde dos veces');
select tests.como_postgres();
select tests.como(tests.uid('coordS@t'));
select throws_ok($$select public.habilitar_ubicacion(tests.uid('ase1@t'))$$, 'P0001', 'ya rendida', 'no se vuelve a habilitar');
select public.habilitar_ubicacion(tests.uid('ase2@t'));
select tests.como_postgres();

-- Aprobar todos los bloques termina la ubicación
select tests.como(tests.uid('ase2@t'));
insert into ids select 'c1', public.iniciar_ubicacion();
select pg_temp.bien((select v from ids where k = 'c1'));
select public.entregar_intento((select v from ids where k = 'c1'));
insert into ids select 'c2', public.iniciar_ubicacion();
select pg_temp.bien((select v from ids where k = 'c2'));
select public.entregar_intento((select v from ids where k = 'c2'));
select results_eq($$select rendida, niveles_acreditados from public.estado_ubicacion()$$, $$values (true, array[8, 9])$$,
  'aprobado el último bloque, la ubicación termina con todo acreditado');
select tests.como_postgres();
select tests.como(tests.uid('ase1@t'));
select throws_ok($$select public.habilitar_ubicacion(tests.uid('ase2@t'))$$, 'P0001', 'sin permiso', 'el asesor no habilita a otro');
select tests.como_postgres();

select * from finish();
rollback;
