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

grant usage on schema tests to authenticated, anon;
grant execute on all functions in schema tests to authenticated, anon;

select pass('ayudantes de test cargados');
select * from finish();
