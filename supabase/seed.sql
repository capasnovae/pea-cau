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
      ('asesor.roca@pea.local', 'Rocío', 'Asesora', 'asesor', 'Roca', 'servicio'),
      ('asesor2.nqn@pea.local', 'Bruno', 'Ceo', 'asesor', 'Neuquén', 'servicio')
    ) as t(email, nombre, apellido, rol, sede, area)
  loop
    v_id := gen_random_uuid();
    insert into auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at,
                            raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
                            confirmation_token, recovery_token, email_change_token_new, email_change)
    values (v_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated', u.email,
            extensions.crypt('pea-dev-1234', extensions.gen_salt('bf')), now(),
            jsonb_build_object('provider', 'email', 'providers', jsonb_build_array('email'), 'pea_alta', true,
                               'rol', u.rol, 'area', u.area, 'sede_id', (select id from public.sedes where nombre = u.sede)),
            jsonb_build_object('nombre', u.nombre, 'apellido', u.apellido),
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
where (p.email = 'asesor.nqn@pea.local' and s.nombre = 'Front') or (p.email = 'asesor2.nqn@pea.local' and s.nombre = 'CEO');

-- Repositorio: contenido de EJEMPLO (no es información real de Siglo; se reemplaza con el relevamiento)
insert into public.articulos (id, categoria_id, slug, titulo, resumen, cuerpo_md, alcance, estado, orden) values
  ('a0000000-0000-4000-8000-000000000001', (select id from public.categorias where slug = 'reglamento'),
   'inscripcion-a-materias-ejemplo', 'Inscripción a materias (ejemplo)', 'Cómo y cuándo se inscribe un alumno a sus materias.',
   E'> Contenido de ejemplo para probar la plataforma.\n\n## Cuándo\n\nLas inscripciones abren según el calendario académico.\n\n## Pasos\n\n1. El alumno entra al portal de estudiantes.\n2. Elige las materias habilitadas.\n3. Confirma la inscripción.\n\n| Situación | Qué hacer |\n|---|---|\n| No ve la materia | Revisar correlativas |\n| Error en el portal | Crear ticket en HubSpot |',
   'global', 'publicado', 1),
  ('a0000000-0000-4000-8000-000000000002', (select id from public.categorias where slug = 'reglamento'),
   'correlatividades-ejemplo', 'Correlatividades (ejemplo)', 'Qué materias habilitan a otras.',
   E'Contenido de ejemplo sobre correlatividades.', 'global', 'publicado', 1),
  ('a0000000-0000-4000-8000-000000000003', (select id from public.categorias where slug = 'reglamento'),
   'bajas-de-materias-ejemplo', 'Bajas de materias (ejemplo)', 'Plazos y efectos de dar de baja una materia.',
   E'Contenido de ejemplo sobre bajas.', 'global', 'publicado', 2),
  ('a0000000-0000-4000-8000-000000000004', (select id from public.categorias where slug = 'plataformas'),
   'portal-de-estudiantes-ejemplo', 'Portal de estudiantes (ejemplo)', 'Para qué lo usa el alumno y qué puede resolver solo.',
   E'Contenido de ejemplo sobre el portal de estudiantes.', 'global', 'publicado', 1);

update public.articulos set padre_id = 'a0000000-0000-4000-8000-000000000001'
where id in ('a0000000-0000-4000-8000-000000000002', 'a0000000-0000-4000-8000-000000000003');

insert into public.articulos (categoria_id, slug, titulo, resumen, cuerpo_md, alcance, sede_id, estado) values
  ((select id from public.categorias where slug = 'institucional'), 'horarios-cau-neuquen-ejemplo',
   'Horarios del CAU Neuquén (ejemplo)', 'Horarios de atención de la sede.', E'Contenido de ejemplo de la sede Neuquén.',
   'sede', (select id from public.sedes where nombre = 'Neuquén'), 'publicado'),
  ((select id from public.categorias where slug = 'institucional'), 'horarios-cau-roca-ejemplo',
   'Horarios del CAU Roca (ejemplo)', 'Horarios de atención de la sede.', E'Contenido de ejemplo de la sede Roca.',
   'sede', (select id from public.sedes where nombre = 'Roca'), 'publicado');

-- Campaña y recursos de EJEMPLO
insert into public.campanas (id, nombre, descripcion_md, vigente_desde, vigente_hasta, alcance, estado)
values ('c0000000-0000-4000-8000-000000000001', 'Reinscripción (ejemplo)', 'Campaña de ejemplo.', current_date - 7, current_date + 60, 'global', 'publicado');
insert into public.recursos (categoria_id, campana_id, titulo, descripcion, tipo, url_externa, etiquetas, alcance, estado) values
  ((select id from public.categorias where slug = 'campanas-y-piezas'), 'c0000000-0000-4000-8000-000000000001',
   'Pieza para redes (ejemplo)', 'Imagen de ejemplo para compartir con alumnos.', 'enlace', 'https://example.com/pieza', '{reinscripcion,redes}', 'global', 'publicado'),
  ((select id from public.categorias where slug = 'aranceles-y-pagos'), null,
   'Folleto de becas (ejemplo)', 'Resumen de becas y descuentos.', 'enlace', 'https://example.com/becas', '{becas,descuentos}', 'global', 'publicado');

-- Cursos de EJEMPLO (Etapa 4)
insert into public.cursos (id, tipo, nivel_orden, titulo, descripcion_md, alcance, estado, vigencia_meses) values
  ('c4000000-0000-4000-8000-000000000001', 'nivel', 1, 'Base: reglamento y plataformas', 'Lo primero que necesita saber todo asesor. Contenido de ejemplo.', 'global', 'publicado', 12),
  ('c4000000-0000-4000-8000-000000000002', 'nivel', 2, 'Operativo: modalidades y trámites', 'Contenido de ejemplo.', 'global', 'publicado', 12);
insert into public.cursos (id, tipo, titulo, descripcion_md, alcance, estado) values
  ('c4000000-0000-4000-8000-000000000003', 'capacitacion', 'Herramientas del CEO (ejemplo)', 'Klarway, mesas y reprogramaciones.', 'global', 'publicado');

insert into public.modulos (id, curso_id, orden, titulo, avance_secuencial) values
  ('c5000000-0000-4000-8000-000000000001', 'c4000000-0000-4000-8000-000000000001', 1, 'Reglamento', true),
  ('c5000000-0000-4000-8000-000000000002', 'c4000000-0000-4000-8000-000000000001', 2, 'Plataformas', false),
  ('c5000000-0000-4000-8000-000000000003', 'c4000000-0000-4000-8000-000000000002', 1, 'Modalidades', false),
  ('c5000000-0000-4000-8000-000000000004', 'c4000000-0000-4000-8000-000000000003', 1, 'Klarway', false);
insert into public.modulo_prerrequisitos values ('c5000000-0000-4000-8000-000000000002', 'c5000000-0000-4000-8000-000000000001');

insert into public.items (modulo_id, orden, titulo, tipo, articulo_id, contenido_md, url, requisito) values
  ('c5000000-0000-4000-8000-000000000001', 1, 'Inscripción a materias', 'articulo', 'a0000000-0000-4000-8000-000000000001', null, null, 'ver'),
  ('c5000000-0000-4000-8000-000000000001', 2, 'Cómo buscar una materia en el portal (ejemplo)', 'pagina', null,
   E'Seguí estos pasos con el alumno:\n\n1. Entrá al **portal de estudiantes** con su usuario.\n2. Abrí **Inscripciones** y buscá la materia por nombre.\n3. Revisá que esté habilitada antes de confirmar.\n\n> **Error común:** inscribir sin revisar correlatividades. El portal lo rechaza más tarde y el alumno pierde el turno.\n\n> **Tip:** si no aparece la materia, revisá el plan de estudios del alumno en el campus virtual.', null, 'marcar_hecho'),
  ('c5000000-0000-4000-8000-000000000001', 3, 'Video: recorrido por el portal (ejemplo)', 'video', null, null, 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 'ver'),
  ('c5000000-0000-4000-8000-000000000002', 1, 'Portal de estudiantes', 'articulo', 'a0000000-0000-4000-8000-000000000004', null, null, 'marcar_hecho'),
  ('c5000000-0000-4000-8000-000000000003', 1, 'Las tres modalidades (ejemplo)', 'pagina', null, E'Educación Distribuida Home, Educación Distribuida y Presencial Distribuida. Contenido de ejemplo.', null, 'ver'),
  ('c5000000-0000-4000-8000-000000000004', 1, 'Qué es Klarway (ejemplo)', 'pagina', null, E'Klarway supervisa los exámenes online. Contenido de ejemplo.', null, 'ver');

insert into public.ruta_cursos (curso_id, subrol_id, obligatorio)
select 'c4000000-0000-4000-8000-000000000003', id, true from public.subroles where nombre = 'CEO';

-- Etapa 5 · Examen de ejemplo (se configura en la etapa de exámenes)
insert into public.items (modulo_id, orden, titulo, tipo, requisito) values
  ('c5000000-0000-4000-8000-000000000003', 2, 'Examen del Nivel 2 (ejemplo)', 'examen', 'ninguno');

-- Etapa 5 · Calendario: eventos de ejemplo del mes actual
insert into public.eventos (titulo, fecha, hora, tipo, sede_id, creado_por)
select 'Jornada de bienvenida (ejemplo)', (date_trunc('month', public.hoy_ar()) + interval '9 days')::date, '09:00'::time, 'evento'::public.tipo_evento, null::uuid,
       (select id from public.perfiles where email = 'director@pea.local')
union all
select 'Capacitación CEO (ejemplo)', public.hoy_ar() + 6, '10:00'::time, 'capacitacion', s.id,
       (select id from public.perfiles where email = 'coord.servicio.nqn@pea.local')
from public.sedes s where s.nombre = 'Neuquén'
union all
select 'Reunión de equipo (ejemplo)', public.hoy_ar() + 13, null::time, 'evento', s.id,
       (select id from public.perfiles where email = 'coord.servicio.nqn@pea.local')
from public.sedes s where s.nombre = 'Neuquén';

-- Etapa 5 · Bandeja: un anuncio de coordinación y una conversación de ejemplo
insert into public.conversaciones (id, asunto, es_anuncio, sede_id, creada_por, ultimo_mensaje_at)
select 'c7000000-0000-4000-8000-000000000001', 'Campaña de reinscripción (ejemplo)', true, s.id, p.id, now() - interval '2 hours'
from public.sedes s, public.perfiles p where s.nombre = 'Neuquén' and p.email = 'coord.servicio.nqn@pea.local';
insert into public.conversacion_participantes (conversacion_id, usuario_id, leido_at)
select 'c7000000-0000-4000-8000-000000000001', p.id, case when p.email = 'coord.servicio.nqn@pea.local' then now() end
from public.perfiles p join public.sedes s on s.id = p.sede_id where s.nombre = 'Neuquén' and p.activo;
insert into public.mensajes (conversacion_id, autor_id, cuerpo, created_at)
select 'c7000000-0000-4000-8000-000000000001', id, 'Mañana arranca la campaña de reinscripción. Revisen la matriz en Recursos.', now() - interval '2 hours'
from public.perfiles where email = 'coord.servicio.nqn@pea.local';

insert into public.conversaciones (id, asunto, creada_por, ultimo_mensaje_at)
select 'c7000000-0000-4000-8000-000000000002', 'Módulo de Reglamento (ejemplo)', id, now() - interval '1 day'
from public.perfiles where email = 'lider.nqn@pea.local';
insert into public.conversacion_participantes (conversacion_id, usuario_id, leido_at)
select 'c7000000-0000-4000-8000-000000000002', id, case when email = 'lider.nqn@pea.local' then now() end
from public.perfiles where email in ('lider.nqn@pea.local', 'asesor.nqn@pea.local');
insert into public.mensajes (conversacion_id, autor_id, cuerpo, created_at)
select 'c7000000-0000-4000-8000-000000000002', id, m.cuerpo, now() - m.hace
from public.perfiles, (values ('¿Pudiste ver el módulo de Reglamento?', interval '1 day 1 hour'),
                               ('Cuando lo termines avisame y vemos dudas.', interval '1 day')) as m(cuerpo, hace)
where email = 'lider.nqn@pea.local';
