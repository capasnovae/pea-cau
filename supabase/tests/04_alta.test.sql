begin;
select plan(8);
insert into public.sedes (nombre, ciudad) values ('T-Alta', 'Neuquén');

-- Alta hecha por el servidor (service role): datos confiables en raw_app_meta_data
insert into auth.users (id, instance_id, aud, role, email, encrypted_password, raw_app_meta_data, raw_user_meta_data, created_at, updated_at)
values ('11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
  'ana@t', '', jsonb_build_object('pea_alta', true, 'rol', 'coordinador',
  'sede_id', (select id from public.sedes where nombre = 'T-Alta'), 'area', 'servicio'),
  '{"nombre": "Ana", "apellido": "Paz"}', now(), now());

select is((select nombre || ' ' || apellido from public.perfiles where email = 'ana@t'), 'Ana Paz', 'nombre y apellido desde user metadata');
select is((select rol from public.perfiles where email = 'ana@t'), 'coordinador'::public.rol_app, 'rol desde app metadata');
select is((select s.nombre from public.perfiles p join public.sedes s on s.id = p.sede_id where p.email = 'ana@t'), 'T-Alta', 'sede desde app metadata');
select ok((select activo from public.perfiles where email = 'ana@t'), 'alta del servidor queda activa');

-- Alta con metadata controlada por el usuario (signUp): nunca da privilegios
insert into auth.users (id, instance_id, aud, role, email, encrypted_password, raw_app_meta_data, raw_user_meta_data, created_at, updated_at)
values ('22222222-2222-2222-2222-222222222222', '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
  'hacker@t', '', '{}', jsonb_build_object('rol', 'admin', 'area', 'servicio',
  'sede_id', (select id from public.sedes where nombre = 'T-Alta')), now(), now());

select is((select rol from public.perfiles where email = 'hacker@t'), 'asesor'::public.rol_app, 'user metadata no da rol');
select is((select sede_id from public.perfiles where email = 'hacker@t'), null, 'user metadata no da sede');
select ok(not (select activo from public.perfiles where email = 'hacker@t'), 'alta sin aval del servidor queda inactiva');

select is((select count(*)::int from public.auditoria where accion = 'alta_usuario' and entidad_id in
  ('11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222')), 2, 'auditoría de altas');

select * from finish();
rollback;
