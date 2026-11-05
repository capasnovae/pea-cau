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
  on conflict (id) do update set rol = excluded.rol, sede_id = excluded.sede_id, area = excluded.area;
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

grant usage on schema tests to authenticated, anon;
grant execute on all functions in schema tests to authenticated, anon;

select pass('ayudantes de test cargados');
select * from finish();
