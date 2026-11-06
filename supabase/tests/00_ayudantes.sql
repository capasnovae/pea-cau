-- Ayudantes de test (se cargan antes que los tests: orden alfabético).
select plan(1);
-- Crea el esquema "tests" con funciones para fabricar usuarios y simular sesiones.
create extension if not exists pgtap with schema extensions;
create schema if not exists tests;

create or replace function tests.crear_usuario(
  p_email text, p_rol text, p_sede text default null, p_area text default null
) returns uuid language plpgsql security definer set search_path = '' as $$
declare v_id uuid := gen_random_uuid();
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at,
                          raw_app_meta_data, raw_user_meta_data, created_at, updated_at)
  values (v_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', p_email,
          '', now(), '{}'::jsonb, '{}'::jsonb, now(), now());
  insert into public.perfiles (id, nombre, apellido, email, rol, sede_id, area)
  values (v_id, split_part(p_email, '@', 1), 'Test', p_email, p_rol::public.rol_app,
          (select id from public.sedes where nombre = p_sede), p_area::public.area)
  on conflict (id) do update set rol = excluded.rol, sede_id = excluded.sede_id, area = excluded.area, activo = true;
  return v_id;
end $$;

create or replace function tests.como(p_uid uuid) returns void language plpgsql as $$
begin
  perform set_config('request.jwt.claims', json_build_object('sub', p_uid, 'role', 'authenticated')::text, true);
  perform set_config('request.jwt.claim.sub', p_uid::text, true);
  execute 'set local role authenticated';
end $$;

create or replace function tests.como_anon() returns void language plpgsql as $$
begin
  perform set_config('request.jwt.claims', json_build_object('role', 'anon')::text, true);
  execute 'set local role anon';
end $$;

create or replace function tests.como_postgres() returns void language plpgsql as $$
begin
  execute 'reset role';
  perform set_config('request.jwt.claims', '', true);
end $$;

create or replace function tests.uid(p_email text) returns uuid language sql security definer set search_path = '' as $$
  select id from public.perfiles where email = p_email
$$;

-- Escenario común para tests de visibilidad (spec §3).
create or replace function tests.escenario() returns void language plpgsql security definer set search_path = '' as $$
declare v_e1 uuid; v_nqn uuid; v_roca uuid;
begin
  insert into public.sedes (nombre, ciudad) values ('T-Neuquén', 'Neuquén'), ('T-Roca', 'General Roca');
  perform tests.crear_usuario('coordS@t', 'coordinador', 'T-Neuquén', 'servicio');
  perform tests.crear_usuario('coordV@t', 'coordinador', 'T-Neuquén', 'ventas');
  perform tests.crear_usuario('lider1@t', 'lider', 'T-Neuquén', 'servicio');
  perform tests.crear_usuario('ase1@t', 'asesor', 'T-Neuquén', 'servicio');
  perform tests.crear_usuario('ase2@t', 'asesor', 'T-Neuquén', 'servicio');
  perform tests.crear_usuario('aseV@t', 'asesor', 'T-Neuquén', 'ventas');
  perform tests.crear_usuario('aseR@t', 'asesor', 'T-Roca', 'servicio');
  perform tests.crear_usuario('dir@t', 'director');
  perform tests.crear_usuario('adm@t', 'admin');
  perform tests.crear_usuario('coordX@t', 'coordinador', 'T-Neuquén', null);
  perform tests.crear_usuario('aseInactivo@t', 'asesor', 'T-Neuquén', 'servicio');
  update public.perfiles set activo = false where email = 'aseInactivo@t';
  select id into v_nqn from public.sedes where nombre = 'T-Neuquén';
  select id into v_roca from public.sedes where nombre = 'T-Roca';
  insert into public.equipos (sede_id, area, nombre, lider_id)
    values (v_nqn, 'servicio', 'E1', tests.uid('lider1@t')) returning id into v_e1;
  insert into public.equipos (sede_id, area, nombre, lider_id) values (v_roca, 'servicio', 'E2', null);
  update public.perfiles set equipo_id = v_e1 where email in ('ase1@t', 'lider1@t');
  update public.perfiles set equipo_id = (select id from public.equipos where nombre = 'E2') where email = 'aseR@t';
end $$;

-- Crea un artículo en la categoría reglamento (como postgres, sin RLS).
create or replace function tests.contenido(p_titulo text, p_alcance text, p_sede text, p_estado text)
returns uuid language plpgsql security definer set search_path = '' as $$
declare v_id uuid;
begin
  insert into public.articulos (categoria_id, slug, titulo, alcance, sede_id, estado)
  values ((select id from public.categorias where slug = 'reglamento'),
          lower(regexp_replace(p_titulo, '[^a-zA-Z0-9]+', '-', 'g')) || '-' || substr(gen_random_uuid()::text, 1, 6),
          p_titulo, p_alcance::public.alcance, (select id from public.sedes where nombre = p_sede),
          p_estado::public.estado_contenido)
  returning id into v_id;
  return v_id;
end $$;

-- Escenario de cursos: Nivel 1 (M1 secuencial: i1 ver, i2 marcar_hecho; M2 con prerrequisito M1: i3 ver),
-- Nivel 2 (j1 ver), curso de sede T-Roca y curso en borrador. Usa niveles 8 y 9 para no chocar con el seed.
create or replace function tests.escenario_cursos() returns void language plpgsql security definer set search_path = '' as $$
begin
  insert into public.cursos (id, tipo, nivel_orden, titulo, alcance, estado) values
    ('e1000000-0000-4000-8000-000000000001', 'nivel', 8, 'T-Nivel A', 'global', 'publicado'),
    ('e1000000-0000-4000-8000-000000000002', 'nivel', 9, 'T-Nivel B', 'global', 'publicado');
  insert into public.cursos (id, tipo, titulo, alcance, sede_id, estado) values
    ('e1000000-0000-4000-8000-000000000003', 'capacitacion', 'T-Roca', 'sede', (select id from public.sedes where nombre = 'T-Roca'), 'publicado');
  insert into public.cursos (id, tipo, titulo, alcance, estado) values
    ('e1000000-0000-4000-8000-000000000004', 'capacitacion', 'T-Borrador', 'global', 'borrador');
  insert into public.modulos (id, curso_id, orden, titulo, avance_secuencial) values
    ('e2000000-0000-4000-8000-000000000001', 'e1000000-0000-4000-8000-000000000001', 1, 'M1', true),
    ('e2000000-0000-4000-8000-000000000002', 'e1000000-0000-4000-8000-000000000001', 2, 'M2', false),
    ('e2000000-0000-4000-8000-000000000003', 'e1000000-0000-4000-8000-000000000002', 1, 'MB', false),
    ('e2000000-0000-4000-8000-000000000004', 'e1000000-0000-4000-8000-000000000003', 1, 'MR', false),
    ('e2000000-0000-4000-8000-000000000005', 'e1000000-0000-4000-8000-000000000004', 1, 'MD', false);
  insert into public.modulo_prerrequisitos values ('e2000000-0000-4000-8000-000000000002', 'e2000000-0000-4000-8000-000000000001');
  insert into public.items (id, modulo_id, orden, titulo, tipo, contenido_md, requisito) values
    ('e3000000-0000-4000-8000-000000000001', 'e2000000-0000-4000-8000-000000000001', 1, 'i1', 'pagina', 'x', 'ver'),
    ('e3000000-0000-4000-8000-000000000002', 'e2000000-0000-4000-8000-000000000001', 2, 'i2', 'pagina', 'x', 'marcar_hecho'),
    ('e3000000-0000-4000-8000-000000000003', 'e2000000-0000-4000-8000-000000000002', 1, 'i3', 'pagina', 'x', 'ver'),
    ('e3000000-0000-4000-8000-000000000004', 'e2000000-0000-4000-8000-000000000003', 1, 'j1', 'pagina', 'x', 'ver'),
    ('e3000000-0000-4000-8000-000000000005', 'e2000000-0000-4000-8000-000000000004', 1, 'r1', 'pagina', 'x', 'ver'),
    ('e3000000-0000-4000-8000-000000000006', 'e2000000-0000-4000-8000-000000000005', 1, 'd1', 'pagina', 'x', 'ver');
end $$;

-- Escenario de exámenes (requiere escenario y escenario_cursos). Ids fijos para responder en los tests.
-- f1 = examenes, f2 = preguntas, f3 = opciones, f4 = casos.
create or replace function tests.escenario_examenes() returns void language plpgsql security definer set search_path = '' as $$
declare v_reg uuid := (select id from public.categorias where slug = 'reglamento');
        v_pla uuid := (select id from public.categorias where slug = 'plataformas');
begin
  -- Los tests no dependen de los exámenes ni de las preguntas del seed.
  update public.preguntas set estado = 'archivado' where estado = 'publicado';
  update public.examenes set estado = 'archivado' where estado = 'publicado';
  insert into public.casos (id, titulo, contexto_md, categoria_id, alcance, estado) values
    ('f4000000-0000-4000-8000-000000000001', 'T-Caso', 'Un alumno llama por una mesa.', v_reg, 'global', 'publicado');
  insert into public.preguntas (id, tipo, enunciado_md, contexto_md, caso_id, orden_en_caso, explicacion_md, rubrica_md, puntaje_max,
                                modulo_id, categoria_id, estado, alcance, uso, config, solucion) values
    ('f2000000-0000-4000-8000-000000000001', 'opcion_multiple', 'om', null, null, null, 'exp-om', null, 1, 'e2000000-0000-4000-8000-000000000001', v_reg, 'publicado', 'global', 'examen', null, null),
    ('f2000000-0000-4000-8000-000000000002', 'verdadero_falso', 'vf', null, null, null, 'exp-vf', null, 1, 'e2000000-0000-4000-8000-000000000001', v_reg, 'publicado', 'global', 'examen', null, null),
    ('f2000000-0000-4000-8000-000000000003', 'ordenar', 'ord', null, null, null, 'exp-ord', null, 1, 'e2000000-0000-4000-8000-000000000001', v_reg, 'publicado', 'global', 'examen', null, null),
    ('f2000000-0000-4000-8000-000000000004', 'libre', 'lib', null, null, null, 'exp-lib', 'rúbrica', 2, 'e2000000-0000-4000-8000-000000000004', v_reg, 'publicado', 'global', 'examen', null, null),
    ('f2000000-0000-4000-8000-000000000005', 'simulacion', 'sim1', null, 'f4000000-0000-4000-8000-000000000001', 1, 'exp-s1', null, 1, 'e2000000-0000-4000-8000-000000000003', v_reg, 'publicado', 'global', 'examen', null, null),
    ('f2000000-0000-4000-8000-000000000006', 'simulacion', 'sim2', null, 'f4000000-0000-4000-8000-000000000001', 2, 'exp-s2', null, 1, 'e2000000-0000-4000-8000-000000000003', v_reg, 'publicado', 'global', 'examen', null, null),
    ('f2000000-0000-4000-8000-000000000007', 'clasificar', 'cla', null, null, null, 'exp-cla', null, 1, null, v_pla, 'publicado', 'global', 'examen',
       '{"columnas": ["CAU", "Tesorería"]}', null),
    ('f2000000-0000-4000-8000-000000000008', 'formulario', 'form', null, null, null, 'exp-form', null, 1, null, v_pla, 'publicado', 'global', 'examen',
       '{"campos": [{"id": "area", "etiqueta": "Área", "tipo": "texto"}, {"id": "prioridad", "etiqueta": "Prioridad", "tipo": "select", "opciones": ["Alta", "Baja"]}]}',
       '{"area": ["Mesa de ayuda"], "prioridad": ["Alta"]}');
  insert into public.opciones (id, pregunta_id, texto, es_correcta, posicion_correcta, grupo, orden) values
    ('f3000000-0000-4000-8000-000000000001', 'f2000000-0000-4000-8000-000000000001', 'a', true, null, null, 1),
    ('f3000000-0000-4000-8000-000000000002', 'f2000000-0000-4000-8000-000000000001', 'b', true, null, null, 2),
    ('f3000000-0000-4000-8000-000000000003', 'f2000000-0000-4000-8000-000000000001', 'c', false, null, null, 3),
    ('f3000000-0000-4000-8000-000000000004', 'f2000000-0000-4000-8000-000000000002', 'Verdadero', true, null, null, 1),
    ('f3000000-0000-4000-8000-000000000005', 'f2000000-0000-4000-8000-000000000002', 'Falso', false, null, null, 2),
    ('f3000000-0000-4000-8000-000000000006', 'f2000000-0000-4000-8000-000000000003', 'uno', false, 1, null, 1),
    ('f3000000-0000-4000-8000-000000000007', 'f2000000-0000-4000-8000-000000000003', 'dos', false, 2, null, 2),
    ('f3000000-0000-4000-8000-000000000008', 'f2000000-0000-4000-8000-000000000003', 'tres', false, 3, null, 3),
    ('f3000000-0000-4000-8000-000000000009', 'f2000000-0000-4000-8000-000000000005', 's1-ok', true, null, null, 1),
    ('f3000000-0000-4000-8000-000000000010', 'f2000000-0000-4000-8000-000000000005', 's1-no', false, null, null, 2),
    ('f3000000-0000-4000-8000-000000000011', 'f2000000-0000-4000-8000-000000000006', 's2-ok', true, null, null, 1),
    ('f3000000-0000-4000-8000-000000000012', 'f2000000-0000-4000-8000-000000000006', 's2-no', false, null, null, 2),
    ('f3000000-0000-4000-8000-000000000013', 'f2000000-0000-4000-8000-000000000007', 'Reinscripción', false, null, 'CAU', 1),
    ('f3000000-0000-4000-8000-000000000014', 'f2000000-0000-4000-8000-000000000007', 'Cuota vencida', false, null, 'Tesorería', 2);
  insert into public.examenes (id, titulo, tipo, modulo_id, categoria_id, curso_id, cantidad_preguntas, mezclar, alcance, estado) values
    ('f1000000-0000-4000-8000-000000000001', 'T-Ex M1', 'modulo', 'e2000000-0000-4000-8000-000000000001', null, null, 3, false, 'global', 'publicado'),
    ('f1000000-0000-4000-8000-000000000002', 'T-Ex libre', 'modulo', 'e2000000-0000-4000-8000-000000000004', null, null, 1, false, 'global', 'publicado'),
    ('f1000000-0000-4000-8000-000000000003', 'T-Ex simulación', 'modulo', 'e2000000-0000-4000-8000-000000000003', null, null, 2, false, 'global', 'publicado'),
    ('f1000000-0000-4000-8000-000000000004', 'T-Ex plataformas', 'categoria', null, v_pla, null, 2, false, 'global', 'publicado'),
    ('f1000000-0000-4000-8000-000000000005', 'T-Ex nivel A', 'nivel', null, null, 'e1000000-0000-4000-8000-000000000001', 3, false, 'global', 'publicado'),
    ('f1000000-0000-4000-8000-000000000006', 'T-Ubicación', 'ubicacion', null, null, null, 3, false, 'global', 'publicado'),
    ('f1000000-0000-4000-8000-000000000007', 'T-Integrador', 'integrador', null, null, null, 3, false, 'global', 'publicado');
  insert into public.examen_fuentes (examen_id, modulo_id, categoria_id, cantidad) values
    ('f1000000-0000-4000-8000-000000000007', 'e2000000-0000-4000-8000-000000000001', null, 1),
    ('f1000000-0000-4000-8000-000000000007', null, v_pla, null);
end $$;

grant usage on schema tests to authenticated, anon;
grant execute on all functions in schema tests to authenticated, anon;

select pass('ayudantes de test cargados');
select * from finish();
