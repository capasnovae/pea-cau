-- PEA · Seed de desarrollo (solo local). Contraseña de todos los usuarios: pea-dev-1234

insert into public.sedes (nombre, ciudad) values
  ('Neuquén', 'Neuquén'),
  ('Plottier', 'Plottier'),
  ('Zapala', 'Zapala'),
  ('Cipolletti', 'Cipolletti'),
  ('Bariloche', 'San Carlos de Bariloche'),
  ('Cutral Co', 'Cutral Co'),
  ('Roca', 'General Roca');

insert into public.puestos (nombre, area, orden, descripcion_md) values
  ('Director', null, 1, 'Dirige los siete CAU.'),
  ('Coordinador de alumnado', 'servicio', 2, 'Coordina a los asesores de servicio de su sede.'),
  ('Coordinador de ventas', 'ventas', 3, 'Coordina a los asesores de ventas de su sede.'),
  ('Líder', null, 4, 'Referente de un grupo de asesores.'),
  ('Asesor de servicio', 'servicio', 5, 'Atiende a los alumnos actuales: trámites, tickets y seguimiento.'),
  ('Asesor de ventas', 'ventas', 6, 'Asesora a interesados y acompaña la inscripción.');

insert into public.subroles (nombre, area, orden, descripcion_md) values
  ('CEO', 'servicio', 1, 'Se ocupa de que los alumnos rindan: control de mesas, recordatorios de exámenes y reprogramaciones. Klarway es su herramienta principal.'),
  ('TD', 'servicio', 2, 'Tutor dinamizador: acompaña a los alumnos de presencial distribuida y educación distribuida, y da la IVU y charlas con alumnos.'),
  ('Campañas', 'servicio', 3, 'Hace el seguimiento de las bases de campañas y contacta masivamente a alumnos para reinscripción, trabajos prácticos, parciales, etc.'),
  ('Front', 'servicio', 4, 'Atiende en la mesa de entrada y resuelve en primera línea. Es el puesto que más tiene que saber, más persuasión y estrategias de atención.');

-- Usuarios de desarrollo
do $$
declare
  u record;
  v_id uuid;
begin
  for u in
    select * from (values
      ('admin@pea.local', 'Ada', 'Admin', 'admin', null, null),
      ('director@pea.local', 'Diego', 'Director', 'director', null, null),
      ('coord.servicio.nqn@pea.local', 'Carla', 'Servicio', 'coordinador', 'Neuquén', 'servicio'),
      ('coord.ventas.nqn@pea.local', 'Ciro', 'Ventas', 'coordinador', 'Neuquén', 'ventas'),
      ('lider.nqn@pea.local', 'Lucía', 'Líder', 'lider', 'Neuquén', 'servicio'),
      ('asesor.nqn@pea.local', 'Andrés', 'Asesor', 'asesor', 'Neuquén', 'servicio'),
      ('asesor.roca@pea.local', 'Rocío', 'Asesora', 'asesor', 'Roca', 'servicio')
    ) as t(email, nombre, apellido, rol, sede, area)
  loop
    v_id := gen_random_uuid();
    insert into auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at,
                            raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
                            confirmation_token, recovery_token, email_change_token_new, email_change)
    values (v_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', u.email,
            extensions.crypt('pea-dev-1234', extensions.gen_salt('bf')), now(),
            '{"provider":"email","providers":["email"]}'::jsonb,
            jsonb_build_object('nombre', u.nombre, 'apellido', u.apellido, 'rol', u.rol, 'area', u.area,
                               'sede_id', (select id from public.sedes where nombre = u.sede)),
            now(), now(), '', '', '', '');
    insert into auth.identities (id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
    values (gen_random_uuid(), v_id, v_id::text,
            jsonb_build_object('sub', v_id::text, 'email', u.email, 'email_verified', true),
            'email', now(), now(), now());
  end loop;
end $$;

-- Equipo del líder en Neuquén, con el asesor adentro y subrol Front
insert into public.equipos (sede_id, area, nombre, lider_id)
select s.id, 'servicio', 'Equipo Lucía', p.id
from public.sedes s, public.perfiles p
where s.nombre = 'Neuquén' and p.email = 'lider.nqn@pea.local';

update public.perfiles set equipo_id = (select id from public.equipos where nombre = 'Equipo Lucía')
where email in ('lider.nqn@pea.local', 'asesor.nqn@pea.local');

update public.perfiles set puesto_id = (select id from public.puestos where nombre = 'Asesor de servicio')
where email in ('asesor.nqn@pea.local', 'asesor.roca@pea.local');

insert into public.perfil_subroles (perfil_id, subrol_id)
select p.id, s.id from public.perfiles p, public.subroles s
where p.email = 'asesor.nqn@pea.local' and s.nombre = 'Front';
