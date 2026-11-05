begin;
select plan(6);
insert into public.sedes (nombre, ciudad) values ('T-Alta', 'Neuquén');

insert into auth.users (id, instance_id, aud, role, email, encrypted_password, raw_app_meta_data, raw_user_meta_data, created_at, updated_at)
values ('11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
  'ana@t', '', '{}', jsonb_build_object('nombre', 'Ana', 'apellido', 'Paz', 'rol', 'coordinador',
  'sede_id', (select id from public.sedes where nombre = 'T-Alta'), 'area', 'servicio'), now(), now());

select is((select nombre || ' ' || apellido from public.perfiles where email = 'ana@t'), 'Ana Paz', 'nombre y apellido desde metadata');
select is((select rol from public.perfiles where email = 'ana@t'), 'coordinador'::public.rol_app, 'rol desde metadata');
select is((select area from public.perfiles where email = 'ana@t'), 'servicio'::public.area, 'área desde metadata');
select is((select s.nombre from public.perfiles p join public.sedes s on s.id = p.sede_id where p.email = 'ana@t'), 'T-Alta', 'sede desde metadata');

insert into auth.users (id, instance_id, aud, role, email, encrypted_password, raw_app_meta_data, raw_user_meta_data, created_at, updated_at)
values ('22222222-2222-2222-2222-222222222222', '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
  'x@t', '', '{}', '{"rol": "superadmin", "sede_id": "no-es-uuid", "area": "otra"}', now(), now());

select is((select rol from public.perfiles where email = 'x@t'), 'asesor'::public.rol_app, 'rol inválido cae en asesor');
select is((select count(*)::int from public.auditoria where accion = 'alta_usuario' and entidad_id in
  ('11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222')), 2, 'auditoría de altas');

select * from finish();
rollback;
