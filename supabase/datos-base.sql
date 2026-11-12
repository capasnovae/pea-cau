-- PEA · Datos base de la organización: van a producción (sin usuarios ni contenido de ejemplo).
-- Se puede correr más de una vez.

insert into public.sedes (nombre, ciudad) values
  ('Neuquén', 'Neuquén'),
  ('Plottier', 'Plottier'),
  ('Zapala', 'Zapala'),
  ('Cipolletti', 'Cipolletti'),
  ('Bariloche', 'San Carlos de Bariloche'),
  ('Cutral Co', 'Cutral Co'),
  ('Roca', 'General Roca')
on conflict (nombre) do nothing;

insert into public.puestos (nombre, area, orden, descripcion_md) values
  ('Director', null, 1, 'Dirige los siete CAU.'),
  ('Coordinador de alumnado', 'servicio', 2, 'Coordina a los asesores de servicio de su sede.'),
  ('Coordinador de ventas', 'ventas', 3, 'Coordina a los asesores de ventas de su sede.'),
  ('Líder', null, 4, 'Referente de un grupo de asesores.'),
  ('Asesor de servicio', 'servicio', 5, 'Atiende a los alumnos actuales: trámites, tickets y seguimiento.'),
  ('Asesor de ventas', 'ventas', 6, 'Asesora a interesados y acompaña la inscripción.')
on conflict (nombre) do nothing;

insert into public.subroles (nombre, area, orden, descripcion_md) values
  ('CEO', 'servicio', 1, 'Se ocupa de que los alumnos rindan: control de mesas, recordatorios de exámenes y reprogramaciones. Klarway es su herramienta principal.'),
  ('TD', 'servicio', 2, 'Tutor dinamizador: acompaña a los alumnos de presencial distribuida y educación distribuida, y da la IVU y charlas con alumnos.'),
  ('Campañas', 'servicio', 3, 'Hace el seguimiento de las bases de campañas y contacta masivamente a alumnos para reinscripción, trabajos prácticos, parciales, etc.'),
  ('Front', 'servicio', 4, 'Atiende en la mesa de entrada y resuelve en primera línea. Es el puesto que más tiene que saber, más persuasión y estrategias de atención.')
on conflict (nombre) do nothing;
