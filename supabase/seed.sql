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
      ('asesor2.nqn@pea.local', 'Bruno', 'Ceo', 'asesor', 'Neuquén', 'servicio'),
      ('asesor3.nqn@pea.local', 'Sofía', 'Quieta', 'asesor', 'Neuquén', 'servicio')
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

-- ============================================================================
-- Etapa 6 · Exámenes de ejemplo (d1 = exámenes, d2 = preguntas, d3 = opciones, d4 = casos)
-- ============================================================================
insert into public.casos (id, titulo, contexto_md, categoria_id, alcance, estado) values
  ('d4000000-0000-4000-8000-000000000001', 'Caso: alumno sin mesa (ejemplo)',
   'Un alumno llama porque no le aparece la mesa de examen en el portal. Es de Educación Distribuida Home.',
   (select id from public.categorias where slug = 'tramites'), 'global', 'publicado');

insert into public.preguntas (id, tipo, enunciado_md, contexto_md, caso_id, orden_en_caso, explicacion_md, rubrica_md, puntaje_max,
                              modulo_id, categoria_id, articulo_fuente_id, estado, alcance, uso, config, solucion) values
  -- Nivel 1 · Reglamento
  ('d2000000-0000-4000-8000-000000000001', 'opcion_multiple', '¿Qué necesita un alumno para inscribirse a una materia? (ejemplo)', null, null, null,
   'Tiene que estar regular y sin deuda (ejemplo).', null, 1, 'c5000000-0000-4000-8000-000000000001',
   (select id from public.categorias where slug = 'reglamento'), 'a0000000-0000-4000-8000-000000000001', 'publicado', 'global', 'examen', null, null),
  ('d2000000-0000-4000-8000-000000000002', 'verdadero_falso', 'Un alumno puede inscribirse fuera de término sin autorización. (ejemplo)', null, null, null,
   'Fuera de término hace falta autorización (ejemplo).', null, 1, 'c5000000-0000-4000-8000-000000000001',
   (select id from public.categorias where slug = 'reglamento'), 'a0000000-0000-4000-8000-000000000001', 'publicado', 'global', 'examen', null, null),
  ('d2000000-0000-4000-8000-000000000003', 'escenario', '¿Qué le respondés?',
   'Una alumna pregunta si puede rendir un final que tiene correlativas pendientes (ejemplo).', null, null,
   'Primero tiene que aprobar las correlativas (ejemplo).', null, 1, 'c5000000-0000-4000-8000-000000000001',
   (select id from public.categorias where slug = 'reglamento'), null, 'publicado', 'global', 'examen', null, null),
  ('d2000000-0000-4000-8000-000000000004', 'ordenar', 'Ordená los pasos para inscribir a una materia en el portal (ejemplo)', null, null, null,
   'Ingresar, buscar la materia, elegir la comisión y confirmar (ejemplo).', null, 1, 'c5000000-0000-4000-8000-000000000002',
   (select id from public.categorias where slug = 'plataformas'), null, 'publicado', 'global', 'examen', null, null),
  -- Nivel 1 · simulación (Plataformas)
  ('d2000000-0000-4000-8000-000000000005', 'simulacion', '¿Qué sistema abrís primero?', null, 'd4000000-0000-4000-8000-000000000001', 1,
   'Primero se revisa el portal de estudiantes (ejemplo).', null, 1, 'c5000000-0000-4000-8000-000000000002',
   (select id from public.categorias where slug = 'tramites'), null, 'publicado', 'global', 'examen', null, null),
  ('d2000000-0000-4000-8000-000000000006', 'simulacion', 'La mesa no está habilitada. ¿A dónde derivás?', null, 'd4000000-0000-4000-8000-000000000001', 2,
   'Se deriva a Gestión de exámenes con un ticket (ejemplo).', null, 1, 'c5000000-0000-4000-8000-000000000002',
   (select id from public.categorias where slug = 'tramites'), null, 'publicado', 'global', 'examen', null, null),
  -- Nivel 2 · Modalidades (con una libre)
  ('d2000000-0000-4000-8000-000000000007', 'opcion_multiple', '¿Cuál es una modalidad de cursado? (ejemplo)', null, null, null,
   'Educación Distribuida Home es una modalidad (ejemplo).', null, 1, 'c5000000-0000-4000-8000-000000000003',
   (select id from public.categorias where slug = 'modalidades'), null, 'publicado', 'global', 'examen', null, null),
  ('d2000000-0000-4000-8000-000000000008', 'verdadero_falso', 'En Presencial Distribuida no hay encuentros presenciales. (ejemplo)', null, null, null,
   'Sí hay encuentros presenciales (ejemplo).', null, 1, 'c5000000-0000-4000-8000-000000000003',
   (select id from public.categorias where slug = 'modalidades'), null, 'publicado', 'global', 'examen', null, null),
  ('d2000000-0000-4000-8000-000000000009', 'libre', 'Explicá con tus palabras la diferencia entre las modalidades (ejemplo)', null, null, null,
   'Se espera que nombre las tres y su diferencia principal (ejemplo).', 'Nombra las tres modalidades (1) y explica la diferencia (1).', 2,
   'c5000000-0000-4000-8000-000000000003', (select id from public.categorias where slug = 'modalidades'), null, 'publicado', 'global', 'examen', null, null),
  -- Categoría Plataformas: cuadro, formulario simulado y opción múltiple
  ('d2000000-0000-4000-8000-000000000010', 'clasificar', 'Ubicá cada consulta en el área que la resuelve (ejemplo)', null, null, null,
   'Las cuotas las ve Tesorería; la reinscripción, el CAU (ejemplo).', null, 1, null,
   (select id from public.categorias where slug = 'plataformas'), null, 'publicado', 'global', 'examen',
   '{"columnas": ["CAU", "Tesorería"]}', null),
  ('d2000000-0000-4000-8000-000000000011', 'formulario', 'Creá el caso en el sistema para un alumno con la cuota vencida (ejemplo)', null, null, null,
   'Área Tesorería, prioridad Alta, motivo "cuota vencida" (ejemplo).', null, 1, null,
   (select id from public.categorias where slug = 'plataformas'), null, 'publicado', 'global', 'examen',
   '{"campos": [{"id": "area", "etiqueta": "Área", "tipo": "select", "opciones": ["CAU", "Tesorería", "Gestión de exámenes"]}, {"id": "prioridad", "etiqueta": "Prioridad", "tipo": "select", "opciones": ["Baja", "Media", "Alta"]}, {"id": "motivo", "etiqueta": "Motivo", "tipo": "texto"}]}',
   '{"area": ["Tesorería"], "prioridad": ["Alta"], "motivo": ["cuota vencida", "cuota impaga"]}'),
  ('d2000000-0000-4000-8000-000000000012', 'opcion_multiple', '¿Dónde se ven las notas de un alumno? (ejemplo)', null, null, null,
   'En el portal de estudiantes (ejemplo).', null, 1, null,
   (select id from public.categorias where slug = 'plataformas'), 'a0000000-0000-4000-8000-000000000004', 'publicado', 'global', 'examen', null, null);

insert into public.opciones (id, pregunta_id, texto, es_correcta, posicion_correcta, grupo, orden) values
  ('d3000000-0000-4000-8000-000000000001', 'd2000000-0000-4000-8000-000000000001', 'Estar regular', true, null, null, 1),
  ('d3000000-0000-4000-8000-000000000002', 'd2000000-0000-4000-8000-000000000001', 'No tener deuda', true, null, null, 2),
  ('d3000000-0000-4000-8000-000000000003', 'd2000000-0000-4000-8000-000000000001', 'Tener el título secundario legalizado ese día', false, null, null, 3),
  ('d3000000-0000-4000-8000-000000000004', 'd2000000-0000-4000-8000-000000000002', 'Verdadero', false, null, null, 1),
  ('d3000000-0000-4000-8000-000000000005', 'd2000000-0000-4000-8000-000000000002', 'Falso', true, null, null, 2),
  ('d3000000-0000-4000-8000-000000000006', 'd2000000-0000-4000-8000-000000000003', 'Sí, puede rendir igual', false, null, null, 1),
  ('d3000000-0000-4000-8000-000000000007', 'd2000000-0000-4000-8000-000000000003', 'Primero tiene que aprobar las correlativas', true, null, null, 2),
  ('d3000000-0000-4000-8000-000000000008', 'd2000000-0000-4000-8000-000000000004', 'Ingresar al portal', false, 1, null, 1),
  ('d3000000-0000-4000-8000-000000000009', 'd2000000-0000-4000-8000-000000000004', 'Buscar la materia', false, 2, null, 2),
  ('d3000000-0000-4000-8000-000000000010', 'd2000000-0000-4000-8000-000000000004', 'Elegir la comisión', false, 3, null, 3),
  ('d3000000-0000-4000-8000-000000000011', 'd2000000-0000-4000-8000-000000000004', 'Confirmar la inscripción', false, 4, null, 4),
  ('d3000000-0000-4000-8000-000000000012', 'd2000000-0000-4000-8000-000000000005', 'Portal de estudiantes', true, null, null, 1),
  ('d3000000-0000-4000-8000-000000000013', 'd2000000-0000-4000-8000-000000000005', 'Power BI', false, null, null, 2),
  ('d3000000-0000-4000-8000-000000000014', 'd2000000-0000-4000-8000-000000000006', 'Gestión de exámenes (ticket)', true, null, null, 1),
  ('d3000000-0000-4000-8000-000000000015', 'd2000000-0000-4000-8000-000000000006', 'Tesorería', false, null, null, 2),
  ('d3000000-0000-4000-8000-000000000016', 'd2000000-0000-4000-8000-000000000007', 'Educación Distribuida Home', true, null, null, 1),
  ('d3000000-0000-4000-8000-000000000017', 'd2000000-0000-4000-8000-000000000007', 'Cursado nocturno', false, null, null, 2),
  ('d3000000-0000-4000-8000-000000000018', 'd2000000-0000-4000-8000-000000000008', 'Verdadero', false, null, null, 1),
  ('d3000000-0000-4000-8000-000000000019', 'd2000000-0000-4000-8000-000000000008', 'Falso', true, null, null, 2),
  ('d3000000-0000-4000-8000-000000000020', 'd2000000-0000-4000-8000-000000000010', 'Reinscripción', false, null, 'CAU', 1),
  ('d3000000-0000-4000-8000-000000000021', 'd2000000-0000-4000-8000-000000000010', 'Cuota vencida', false, null, 'Tesorería', 2),
  ('d3000000-0000-4000-8000-000000000022', 'd2000000-0000-4000-8000-000000000010', 'Cambio de carrera', false, null, 'CAU', 3),
  ('d3000000-0000-4000-8000-000000000023', 'd2000000-0000-4000-8000-000000000012', 'En el portal de estudiantes', true, null, null, 1),
  ('d3000000-0000-4000-8000-000000000024', 'd2000000-0000-4000-8000-000000000012', 'En HubSpot', false, null, null, 2);

insert into public.examenes (id, titulo, tipo, modulo_id, categoria_id, curso_id, cantidad_preguntas, nota_minima, max_intentos,
                             espera_horas, tiempo_limite_min, mezclar, alcance, estado) values
  ('d1000000-0000-4000-8000-000000000001', 'Final del Nivel 1 (ejemplo)', 'nivel', null, null, 'c4000000-0000-4000-8000-000000000001', 6, 80, 3, 24, null, false, 'global', 'publicado'),
  ('d1000000-0000-4000-8000-000000000002', 'Final del Nivel 2 (ejemplo)', 'nivel', null, null, 'c4000000-0000-4000-8000-000000000002', 3, 80, 3, 24, null, false, 'global', 'publicado'),
  ('d1000000-0000-4000-8000-000000000003', 'Plataformas (ejemplo)', 'categoria', null, (select id from public.categorias where slug = 'plataformas'), null, 4, 80, 3, 24, 10, false, 'global', 'publicado'),
  ('d1000000-0000-4000-8000-000000000004', 'Examen de ubicación (ejemplo)', 'ubicacion', null, null, null, 3, 80, 1, 0, null, true, 'global', 'publicado'),
  ('d1000000-0000-4000-8000-000000000005', 'Integrador Nivel 1 y 2 (ejemplo)', 'integrador', null, null, null, 5, 80, 3, 24, null, true, 'global', 'publicado');
insert into public.examen_fuentes (examen_id, modulo_id, cantidad) values
  ('d1000000-0000-4000-8000-000000000005', 'c5000000-0000-4000-8000-000000000001', 2),
  ('d1000000-0000-4000-8000-000000000005', 'c5000000-0000-4000-8000-000000000002', null),
  ('d1000000-0000-4000-8000-000000000005', 'c5000000-0000-4000-8000-000000000003', null);

-- El paso de examen del Nivel 2 pasa a exigir aprobar su final
update public.items set examen_id = 'd1000000-0000-4000-8000-000000000002', requisito = 'aprobar', titulo = 'Final del Nivel 2 (ejemplo)'
where titulo = 'Examen del Nivel 2 (ejemplo)';

-- asesor2 tiene experiencia y la ubicación habilitada por la coordinación de servicio
update public.perfiles set experiencia_previa = true,
  ubicacion_habilitada_por = (select id from public.perfiles where email = 'coord.servicio.nqn@pea.local')
where email = 'asesor2.nqn@pea.local';

-- Etapa 6 · Práctica de ejemplo en el Nivel 2 (antes de su final): un cuadro y un formulario simulado
insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, modulo_id, categoria_id, estado, alcance, uso, config, solucion) values
  ('d2000000-0000-4000-8000-000000000031', 'clasificar', 'Ubicá cada consulta en el área que la resuelve (ejemplo)',
   'Cuotas y pagos van a Tesorería; las mesas, a Gestión de exámenes; la reinscripción la resuelve el CAU (ejemplo).',
   'c5000000-0000-4000-8000-000000000003', (select id from public.categorias where slug = 'atencion-y-derivaciones'), 'publicado', 'global', 'practica',
   '{"columnas": ["CAU", "Tesorería", "Gestión de exámenes"]}', null),
  ('d2000000-0000-4000-8000-000000000032', 'formulario', 'Creá el caso en HubSpot para un alumno al que no le aparece la mesa (ejemplo)',
   'Tipo Consulta, área Gestión de exámenes, prioridad Alta (ejemplo).',
   'c5000000-0000-4000-8000-000000000003', (select id from public.categorias where slug = 'atencion-y-derivaciones'), 'publicado', 'global', 'practica',
   '{"campos": [{"id": "tipo", "etiqueta": "Tipo de caso", "tipo": "select", "opciones": ["Consulta", "Reclamo", "Trámite"]}, {"id": "area", "etiqueta": "Área", "tipo": "select", "opciones": ["CAU", "Tesorería", "Gestión de exámenes"]}, {"id": "prioridad", "etiqueta": "Prioridad", "tipo": "select", "opciones": ["Baja", "Media", "Alta"]}]}',
   '{"tipo": ["Consulta"], "area": ["Gestión de exámenes"], "prioridad": ["Alta"]}');
insert into public.opciones (id, pregunta_id, texto, grupo, orden) values
  ('d3000000-0000-4000-8000-000000000031', 'd2000000-0000-4000-8000-000000000031', 'Reinscripción', 'CAU', 1),
  ('d3000000-0000-4000-8000-000000000032', 'd2000000-0000-4000-8000-000000000031', 'Cuota vencida', 'Tesorería', 2),
  ('d3000000-0000-4000-8000-000000000033', 'd2000000-0000-4000-8000-000000000031', 'No aparece la mesa', 'Gestión de exámenes', 3);
insert into public.examenes (id, titulo, tipo, modulo_id, cantidad_preguntas, alcance, estado)
values ('d1000000-0000-4000-8000-000000000006', 'Práctica: derivar consultas (ejemplo)', 'practica', 'c5000000-0000-4000-8000-000000000003', 10, 'global', 'publicado');
update public.items set orden = 3 where titulo = 'Final del Nivel 2 (ejemplo)';
insert into public.items (modulo_id, orden, titulo, tipo, examen_id, requisito)
values ('c5000000-0000-4000-8000-000000000003', 2, 'Práctica: derivar consultas (ejemplo)', 'practica', 'd1000000-0000-4000-8000-000000000006', 'marcar_hecho');

-- Etapa 7 · Nombres de ejemplo de las insignias de nivel
update public.insignias set nombre = 'Base (ejemplo)', descripcion = 'Reglamento y plataformas'
where curso_id = 'c4000000-0000-4000-8000-000000000001';
update public.insignias set nombre = 'Operativo (ejemplo)', descripcion = 'Modalidades y trámites'
where curso_id = 'c4000000-0000-4000-8000-000000000002';

-- Etapa 8 · Una lección de ejemplo publicada (con Probalo) y actividad vieja para el panel
insert into public.cursos (id, tipo, titulo, descripcion_md, alcance, estado)
values ('c4000000-0000-4000-8000-000000000009', 'capacitacion', 'Lecciones (ejemplo)', 'Formato de lección.', 'global', 'publicado');
insert into public.modulos (id, curso_id, orden, titulo)
values ('c5000000-0000-4000-8000-000000000009', 'c4000000-0000-4000-8000-000000000009', 1, 'Inscripción');
insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
values ('c6000000-0000-4000-8000-000000000009', 'c5000000-0000-4000-8000-000000000009', 1, 'Inscripción a materias (ejemplo)', 'leccion',
  (select id from public.articulos where slug = 'inscripcion-a-materias-ejemplo'),
  '{"resumen": ["Se inscribe en el período del calendario académico (ejemplo)."],
    "ejemplos": [{"consulta": "Se me pasó la fecha, ¿me anotan?", "respuesta": "No: cerrado el período no hay inscripción (ejemplo)."}],
    "ojo": ["Los ingresantes no se anotan a materias extra (ejemplo)."]}', 'marcar_hecho');
insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
values ('d2000000-0000-4000-8000-000000000041', 'verdadero_falso', 'Cerrado el período, se puede inscribir igual (ejemplo).',
  'Una vez cerrado el período no hay inscripción (ejemplo).', (select id from public.categorias where slug = 'reglamento'),
  'publicado', 'global', 'practica', 'c6000000-0000-4000-8000-000000000009');
insert into public.opciones (id, pregunta_id, texto, es_correcta, orden) values
  ('d3000000-0000-4000-8000-000000000041', 'd2000000-0000-4000-8000-000000000041', 'Verdadero', false, 1),
  ('d3000000-0000-4000-8000-000000000042', 'd2000000-0000-4000-8000-000000000041', 'Falso', true, 2);
insert into public.practica_intentos (usuario_id, pregunta_id, correcta, created_at)
select id, 'd2000000-0000-4000-8000-000000000031', false, now() - interval '20 days'
from public.perfiles where email = 'asesor3.nqn@pea.local';

-- Etapa 9 · Recertificación y actualizaciones de ejemplo para Rocío (asesor.roca)
insert into public.certificaciones (usuario_id, curso_id, origen, emitida_at, vence_at)
select id, 'c4000000-0000-4000-8000-000000000001', 'examen', now() - interval '11 months', now() + interval '20 days'
from public.perfiles where email = 'asesor.roca@pea.local';
select public.procesar_recertificacion();
insert into public.examenes (id, titulo, tipo, modulo_id, categoria_id, curso_id, cantidad_preguntas, nota_minima, max_intentos, espera_horas,
                             tiempo_limite_min, mezclar, alcance, estado)
values ('d1000000-0000-4000-8000-000000000007', 'Actualización: plataformas (ejemplo)', 'actualizacion', null,
        (select id from public.categorias where slug = 'plataformas'), null, 4, 80, 3, 0, null, false, 'global', 'publicado');
insert into public.actualizaciones (id, titulo, descripcion_md, articulo_id, examen_id, plazo_dias)
values ('d5000000-0000-4000-8000-000000000001', 'Cambió el acceso al portal (ejemplo)', 'Ahora se entra con la cuenta institucional.',
        (select id from public.articulos where slug = 'portal-de-estudiantes-ejemplo'), 'd1000000-0000-4000-8000-000000000007', 10);
insert into public.actualizacion_asignaciones (id, actualizacion_id, usuario_id, vence_at)
select 'd6000000-0000-4000-8000-000000000001', 'd5000000-0000-4000-8000-000000000001', id, now() + interval '10 days'
from public.perfiles where email = 'asesor.roca@pea.local';
select public.crear_alerta(id, 'actualizacion', 'Nueva actualización: Cambió el acceso al portal (ejemplo)', 'Tenés 10 días para completarla.',
  '/actualizaciones/d6000000-0000-4000-8000-000000000001', 'actualizacion:d5000000-0000-4000-8000-000000000001')
from public.perfiles where email = 'asesor.roca@pea.local';
