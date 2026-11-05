# PEA — Perfil Evolutivo de Asesor · Spec de diseño

Fecha: 2026-11-05 · Estado: **en revisión**

---

## 1. Propósito y contexto

PEA es la plataforma donde todo asesor de alumnado de los CAU (Centros de Aprendizaje Universitario) de Siglo 21 aprende el ecosistema de la universidad, lo consulta en el día a día y demuestra lo que sabe. La impulsan un asesor/capacitador y un coordinador, y es para todos los CAU.

**Problemas que resuelve (todos a la vez):**
- Los asesores nuevos tardan en aprender.
- Las respuestas varían según la sede.
- No hay un lugar único donde esté todo.

**Criterios de éxito:**
- Un asesor nuevo completa el Nivel 1 y ya sabe dónde buscar cualquier tema.
- El coordinador ve en una pantalla quién está atrasado y qué temas fallan más.
- El contenido se mantiene en un solo lugar y los cursos y exámenes quedan actualizados solos.

**Independencia:** PEA es un proyecto propio, con repo, base de datos y dominio propios. No se integra en tiempo de ejecución con ningún sistema de Siglo. Esos sistemas son **fuente de contenido** (vía relevamiento manual o asistido, sección 12), no dependencias.

**Datos personales:** PEA no almacena datos de alumnos. Las capturas y los ejemplos que salen del relevamiento se anonimizan.

---

## 2. Stack

- **Next.js 15** (App Router, Server Components, Server Actions) + **TypeScript estricto**.
- **Tailwind CSS** + **shadcn/ui**. Mobile-first. UI en español rioplatense.
- **Supabase:**
  - Auth: email y contraseña por invitación. Preparado para sumar Microsoft Entra ID.
  - Postgres 17 con RLS.
  - Storage, con buckets `recursos`, `lecciones`, `evidencias`, `certificados` y `avatares`.
  - `pg_cron`.
  - Búsqueda full text con configuración `spanish` + `unaccent`.
- **Vercel** (deploy). **Resend** (email transaccional, opcional desde la Etapa 7).
- **@react-pdf/renderer** para los certificados.
- **Videos pesados** fuera de Supabase: YouTube no listado o Vimeo, embebidos por URL. Los videos cortos van en Storage.
- **Calidad:**
  - Vitest para unidades.
  - pgTAP para RLS y funciones SQL.
  - Playwright para los flujos E2E clave.
  - ESLint y Prettier.
  - GitHub Actions para CI.
- **IA (Etapa 9):** Claude API.

---

## 3. Roles, puestos y visibilidad

Se separan **permisos** (rol en PEA) de **organigrama** (puesto en el CAU).

### 3.1 Rol en PEA (`rol_app`)

| Rol | Ve y gestiona |
|---|---|
| `asesor` | Lo propio |
| `lider` | Lo propio y su **equipo** (grupo del que es referente) |
| `coordinador` | Lo propio y los usuarios de **su sede y su área** (`servicio` o `ventas`) |
| `director` | Todo **su CAU** |
| `admin` | Todo. Gestiona el contenido global, las sedes y los usuarios |

### 3.2 Puesto y subroles (configurables, solo descriptivos)

- **Puestos:** Director, Coordinador de alumnado, Coordinador de ventas, Líder, Asesor de servicio, Asesor de ventas.
- **Subroles de servicio:** CEO, TD, Campañas, Front. Una persona puede tener varios.
  - **CEO:** se ocupa de que los alumnos rindan y de las reprogramaciones.
  - **TD (tutor dinamizador):** acompaña a los alumnos de las modalidades presencial distribuida y educación distribuida, y da la IVU.
  - **Campañas:** hace el seguimiento de las bases de campañas.
  - **Front:** atiende en la mesa de entrada, resuelve en primera línea y es el puesto que más tiene que saber.
- Cada puesto y subrol tiene una descripción de funciones, que se muestra en el organigrama.
- Los puestos y subroles definen las **rutas de aprendizaje** (qué cursos son obligatorios para cada uno).

### 3.3 Función central de visibilidad

`puede_ver_usuario(target uuid) returns boolean`. Es `security definer` y `stable`. Devuelve verdadero si se cumple alguna de estas condiciones:

- `target = auth.uid()`;
- `mi_rol() = 'admin'`;
- `mi_rol() = 'director'` y la sede del target es la mía;
- `mi_rol() = 'coordinador'` y el target es de mi sede y de mi área;
- `mi_rol() = 'lider'` y el equipo del target tiene como líder a `auth.uid()`.

Todas las políticas de las tablas con datos por persona usan esta función.

---

## 4. Módulos funcionales

### 4.1 Repositorio

**Base de conocimiento:** artículos en Markdown, con jerarquía (por ejemplo, el reglamento único dividido en secciones), versionado y buscador full text. Categorías iniciales, editables:

1. **Institucional:** CAU y sus asesores, organigrama, división de roles.
2. **Reglamento:** un único documento, dividido en secciones.
3. **Plataformas:** portal de estudiantes, campus virtual (herramienta del asesor), Canvas (de los alumnos), Excel de servicios, HubSpot, base de conocimiento, portal de equivalencias, matrices, Teams, Power BI y Klarway.
4. **Oferta académica:** carreras, planes, títulos, doble titulación, articulaciones y APLV.
5. **Modalidades:** Educación Distribuida Home (distancia), Educación Distribuida (híbrida) y Presencial Distribuida.
6. **Trámites:** inscripción, reinscripción, equivalencias, certificados, bajas, cambio de carrera, exámenes, creación y seguimiento de tickets.
7. **Aranceles y pagos:** cuotas, medios de pago, becas, descuentos, convenios y beneficios.
8. **Ventas y asesoramiento:** guiones, objeciones y seguimiento de leads.
9. **Campañas y piezas:** campañas vigentes, con sus imágenes y videos.
10. **Atención y derivaciones:** qué resuelve el CAU, qué se deriva y a qué área.

**Biblioteca de recursos:** archivos e imágenes, videos (por URL o Storage), presentaciones (por ejemplo, la IVU) y enlaces. Cada recurso tiene etiquetas, categoría, campaña opcional y vigencia. Al vencer, se oculta del listado general.

**Vigencias:** los artículos y recursos tienen `vigente_desde` y `vigente_hasta`, para casos como las matrices de apertura (2027, verano). Al publicar una versión nueva, se muestra un aviso de "nueva versión".

**Alcance:**
- `global` lo crea el admin.
- `sede` lo crean el coordinador o el director de esa sede, y solo lo ven en esa sede.
- El admin puede **promover** contenido de sede a global. Se conservan el autor, la sede de origen y quién y cuándo lo promovió.

### 4.2 Organigrama y consignas

**Organigrama, que se genera solo a partir de los datos:**
- Cada sede con su director, sus coordinadores y sus equipos (líder y asesores).
- Cada persona con su puesto y sus subroles.
- La descripción de cada puesto.

**Áreas de derivación:** nombre, qué resuelve, qué no resuelve, canal de contacto y plazo esperado. *La lista la pasa el usuario.*

**Consignas:**
- **Tipos:**
  - `tarea`;
  - `lectura`: apunta a un artículo y requiere confirmar la lectura;
  - `capacitacion`: apunta a un curso o examen.
- **Destino:** una persona, un equipo, un subrol dentro de la sede o la sede entera. Se genera una asignación por persona.
- **Datos:** título, detalle, fecha límite, prioridad (baja, normal o alta), recurrencia (ninguna, diaria, semanal o mensual) y si requiere evidencia.
- **Estado por asignación:** `pendiente`, `en_curso`, `hecha` o `vencida`. Al cerrar, el asesor puede dejar un comentario y una evidencia.
- **Quién crea consignas:** el líder (para su equipo), el coordinador (para su sede y área), el director (para su sede) y el admin.
- **Fuera de alcance:** kanban, subtareas, registro de horas y dependencias.

### 4.3 Cursos estilo Canvas

- **Estructura:** `curso` → `módulos` → `ítems`.
- **Tipos de curso:**
  - `nivel`: los cuatro niveles, ordenados y configurables. Cada uno tiene vigencia e insignia.
  - `capacitacion`: cursos sueltos, incluidos los que crea un coordinador para su sede.
- **Tipos de ítem:** `articulo` (apunta al repositorio, sin copiarlo), `recurso`, `pagina` (contenido propio del curso), `video`, `enlace` y `examen`.
- **Requisito de cada ítem:** `ninguno`, `ver`, `marcar_hecho` o `aprobar` (con nota mínima).
- **Módulos:**
  - pueden tener **prerrequisitos** (otros módulos);
  - pueden tener **avance secuencial**: si está activo, el ítem siguiente se habilita al cumplir el anterior.
- **Desbloqueo de niveles:** el nivel N se habilita si el N‑1 está **aprobado** (certificación vigente o vencida) o **acreditado** por el examen de ubicación. Un nivel vencido **no bloquea** el siguiente, pero queda marcado para recertificar.
- **Rutas por puesto:** la tabla `ruta_cursos` indica qué cursos son obligatorios u opcionales para cada puesto o subrol. Todos hacen el Nivel 1.
- **El progreso se calcula, no se guarda como bandera:**
  - un ítem está cumplido si existe su registro de progreso o un intento aprobado;
  - un módulo está cumplido si todos sus ítems con requisito están cumplidos;
  - un curso está cumplido si todos sus módulos lo están, más el examen final si lo tiene.

### 4.4 Exámenes

**Tipos de examen:**
- `modulo`: preguntas del módulo.
- `categoria`: preguntas de una categoría del repositorio, por ejemplo todo HubSpot.
- `nivel`: examen final, con preguntas de todos los módulos del curso.
- `ubicacion`: examen de ubicación.
- `actualizacion`: mini examen por un cambio obligatorio de contenido.

**Configuración:** cantidad de preguntas, nota mínima (80% por defecto), máximo de intentos por ciclo, horas de espera entre ciclos, tiempo límite opcional y mezcla de preguntas y opciones.

**Tipos de pregunta:**

| Tipo | Corrección |
|---|---|
| `opcion_multiple` (una o varias correctas) | automática |
| `verdadero_falso` | automática |
| `escenario` (caso y opciones) | automática |
| `ordenar_pasos` | automática |
| `simulacion` (varias preguntas encadenadas sobre un mismo `caso`, por ejemplo qué sistema abrís, qué ticket creás y a dónde derivás) | automática |
| `respuesta_libre` (con rúbrica y puntaje máximo) | manual, con precorrección de IA en la Etapa 9 |

**Banco de preguntas:**
- Cada pregunta tiene un módulo opcional, una categoría, un artículo de fuente (para enlazar "estudiá esto"), dificultad, estado (`borrador`, `publicada` o `archivada`), origen (`manual` o `ia`) y alcance (global o de sede).
- Las preguntas de una simulación se sortean **como bloque**.

**Intentos (todo del lado del servidor, con RPC `security definer`):**
- `iniciar_intento(examen_id)`:
  - valida el acceso (desbloqueo), los intentos que quedan en el ciclo y el tiempo de espera;
  - sortea las preguntas y guarda las preguntas y el orden de opciones que le tocaron;
  - devuelve las preguntas **sin** `es_correcta`, sin explicación y sin rúbrica.
- `guardar_respuesta(...)`: guarda parcialmente, para no perder lo hecho si se corta la conexión.
- `entregar_intento(intento_id)`:
  - valida el tiempo límite, con un margen de gracia;
  - corrige las preguntas cerradas;
  - si no hay preguntas libres, cierra el intento y aplica los efectos (aprobación, certificación, insignia);
  - si hay preguntas libres, pasa el intento a `pendiente_correccion`.
- `revision_intento(intento_id)`: solo funciona con el intento cerrado. Muestra qué respondió mal el asesor, cuál era la respuesta correcta y la explicación, con un enlace al artículo de fuente.
- **El asesor no tiene `select` directo sobre `opciones`, ni sobre `preguntas.explicacion` ni sobre `preguntas.rubrica`.**

**Cola de corrección:**
- Es **por sede**. Corrige cualquier usuario con rol `lider` o superior de esa sede, y **nunca** su propio intento.
- Al tomar un intento de la cola, queda asignado (`corrector_id` y `tomado_at`) para que no lo corrijan dos personas. Si el corrector lo suelta o pasan 24 h sin terminar, vuelve a la cola.
- El plazo es de **72 h** desde la entrega. Si se vence, se genera un aviso al coordinador del área del asesor.
- Quien corrige carga un puntaje por respuesta y una devolución. Al completar todas las respuestas, el intento se cierra y se aplican los efectos.

**Examen de ubicación:**
- Es solo para asesores con experiencia. Lo **habilita** un coordinador, un director o el admin para cada persona, y se rinde **una sola vez**.
- Avanza por bloques: Nivel 1, luego 2, luego 3. Si el asesor aprueba un bloque con la nota mínima, pasa al siguiente; si lo desaprueba, se corta ahí.
- Los niveles aprobados quedan **acreditados**: certificación con origen `ubicacion`, sin PDF de certificado completo, que desbloquea el nivel siguiente.
- El asesor nuevo **no rinde** el examen de ubicación y arranca en el Nivel 1.

### 4.5 Perfil evolutivo

- Muestra el nivel actual, una barra de progreso de la ruta de su puesto, las insignias (activas y perdidas), el historial de intentos con sus notas, los certificados, las consignas pendientes y las alertas.
- **Certificado PDF:** se emite al aprobar el examen final de un nivel. Incluye nombre, nivel, fecha, vencimiento, código de verificación y un QR a `/verificar/[codigo]`, una página pública que muestra el estado vigente, vencido o revocado.

### 4.6 Recertificación

- **Por tiempo:**
  - cada nivel tiene `vigencia_meses` (null significa que no vence);
  - avisa en la app (y por email opcional) a los 30 y a los 7 días antes de vencer;
  - al vencer, la certificación pasa a `vencida`, el asesor **pierde la insignia** y aparece como "a recertificar" en el panel;
  - el reexamen es el examen final del nivel. Si lo aprueba, se emite una certificación nueva y recupera la insignia.
- **Por cambio de contenido:**
  - al publicar una nueva versión de un artículo o un módulo, el admin puede marcarla como **actualización obligatoria**, con un examen de actualización y un plazo en días;
  - se asigna a quienes ya habían aprobado el módulo o curso que contiene ese contenido;
  - el asesor tiene que leer el cambio y aprobar el mini examen;
  - si no lo hace en plazo, aparece como vencido y pierde la insignia del nivel hasta completarlo.
- **Job diario de `pg_cron`:** vence certificaciones, actualizaciones y consignas; genera alertas; devuelve a la cola las correcciones abandonadas y avisa las que tienen el plazo de 72 h vencido.

### 4.7 Panel de coordinación y reportes

Cada usuario ve lo que le permite su alcance: equipo, sede y área, sede entera, o global. El panel muestra:

- progreso por asesor, equipo y sede, y avance de cada ruta por puesto;
- atrasados: sin actividad en N días, consignas vencidas, certificaciones vencidas o por vencer;
- **tasa de acierto por pregunta y por categoría**, para detectar preguntas mal armadas o temas flojos;
- estado de la cola de corrección;
- exportación a CSV de cada tabla.

### 4.8 IA (Etapa 9)

- Generar preguntas a partir de documentos subidos o de artículos del repositorio. Entran como `borrador`, con `origen = 'ia'`, y requieren la revisión y aprobación de una persona para pasar a `publicada`.
- Precorregir respuestas libres con la rúbrica. Claude sugiere un puntaje y una justificación, y la persona que corrige confirma o modifica.

---

## 5. Esquema de base de datos

Convenciones:
- Las claves primarias son `uuid default gen_random_uuid()`.
- Todas las tablas tienen `created_at timestamptz default now()` y, cuando corresponde, `updated_at` actualizado por trigger.
- Nombres en español y en snake_case.

### 5.1 Enums

```sql
rol_app           : asesor | lider | coordinador | director | admin
area              : servicio | ventas
alcance           : global | sede
estado_contenido  : borrador | publicado | archivado
tipo_recurso      : imagen | video | pdf | presentacion | enlace | otro
tipo_curso        : nivel | capacitacion
tipo_item         : articulo | recurso | pagina | video | enlace | examen
requisito_item    : ninguno | ver | marcar_hecho | aprobar
tipo_examen       : modulo | categoria | nivel | ubicacion | actualizacion
tipo_pregunta     : opcion_multiple | verdadero_falso | escenario | ordenar_pasos | simulacion | respuesta_libre
estado_pregunta   : borrador | publicada | archivada
origen_pregunta   : manual | ia
estado_intento    : en_curso | pendiente_correccion | cerrado | expirado
origen_cert       : examen | ubicacion
estado_cert       : vigente | vencida | revocada
tipo_consigna     : tarea | lectura | capacitacion
destino_consigna  : usuario | equipo | subrol | sede
estado_asignacion : pendiente | en_curso | hecha | vencida
recurrencia       : ninguna | diaria | semanal | mensual
prioridad         : baja | normal | alta
```

### 5.2 Organización

```sql
sedes            (id, nombre, ciudad, direccion, activa)
puestos          (id, nombre, area null, descripcion_md, orden)
subroles         (id, nombre, area, descripcion_md, orden)
equipos          (id, sede_id→sedes, area, nombre, lider_id→perfiles null)
perfiles         (id = auth.users.id, nombre, apellido, email unique, telefono null,
                  rol rol_app default 'asesor', area null, sede_id→sedes null,
                  equipo_id→equipos null, puesto_id→puestos null,
                  fecha_ingreso, experiencia_previa bool default false,
                  ubicacion_habilitada_por→perfiles null, ubicacion_rendida_at null,
                  avatar_path null, activo bool default true)
perfil_subroles  (perfil_id, subrol_id)  PK compuesta
areas_derivacion (id, nombre, que_resuelve_md, que_no_resuelve_md, canal_contacto, plazo_esperado, orden)
```

Restricciones:
- El usuario no puede modificar su propio `rol`, `sede_id`, `area`, `equipo_id` ni `puesto_id`. Se aplica con permisos por columna y un trigger.
- Solo el admin cambia los roles. El director y el coordinador pueden asignar el equipo, el puesto y los subroles dentro de su alcance.

### 5.3 Repositorio

```sql
categorias          (id, slug unique, nombre, descripcion, icono, orden, padre_id→categorias null)
articulos           (id, categoria_id, padre_id→articulos null, orden, slug, titulo, resumen,
                     cuerpo_md, version int default 1,
                     alcance, sede_id null, estado estado_contenido,
                     vigente_desde date null, vigente_hasta date null, fuente_url null,
                     autor_id, promovido_por null, promovido_at null,
                     busqueda tsvector generated (spanish+unaccent: titulo A, resumen B, cuerpo C))
articulo_versiones  (id, articulo_id, version, titulo, cuerpo_md, resumen_cambio,
                     autor_id, created_at)   unique(articulo_id, version)
campanas            (id, nombre, descripcion_md, vigente_desde, vigente_hasta, alcance, sede_id null, estado)
recursos            (id, categoria_id, campana_id null, titulo, descripcion, tipo tipo_recurso,
                     archivo_path null, url_externa null, miniatura_path null, etiquetas text[],
                     alcance, sede_id null, estado, vigente_hasta date null, autor_id,
                     promovido_por null, promovido_at null, busqueda tsvector generated)
```

Check: `alcance = 'sede'` si y solo si `sede_id is not null`. Se aplica a todas las tablas que tienen alcance.

### 5.4 Cursos

```sql
cursos               (id, tipo tipo_curso, nivel_orden int null unique, titulo, descripcion_md,
                      portada_path null, vigencia_meses int null, alcance, sede_id null,
                      estado, autor_id, promovido_por null, promovido_at null)
ruta_cursos          (id, curso_id, puesto_id null, subrol_id null, obligatorio bool)
                      -- check: exactamente uno de puesto_id / subrol_id
modulos              (id, curso_id, orden, titulo, descripcion_md, avance_secuencial bool default false,
                      estado)
modulo_prerrequisitos(modulo_id, requiere_modulo_id)  PK compuesta
items                (id, modulo_id, orden, titulo, tipo tipo_item,
                      articulo_id null, recurso_id null, examen_id null,
                      contenido_md null, url null,
                      requisito requisito_item default 'ver')
                      -- check: el FK correcto según el tipo
item_progreso        (usuario_id, item_id, visto_at null, hecho_at null)  PK compuesta
insignias            (id, curso_id unique, nombre, descripcion, icono_path)
usuario_insignias    (id, usuario_id, insignia_id, otorgada_at, perdida_at null, motivo_perdida null)
```

### 5.5 Exámenes

```sql
casos              (id, titulo, contexto_md, categoria_id, alcance, sede_id null)   -- simulaciones
preguntas          (id, tipo tipo_pregunta, enunciado_md, contexto_md null,
                    caso_id→casos null, orden_en_caso int null,
                    explicacion_md, rubrica_md null, puntaje_max numeric default 1,
                    dificultad smallint 1..3, modulo_id null, categoria_id,
                    articulo_fuente_id null, estado estado_pregunta, origen origen_pregunta,
                    alcance, sede_id null, autor_id, aprobada_por null, aprobada_at null)
opciones           (id, pregunta_id, texto, es_correcta bool, posicion_correcta int null, orden)
examenes           (id, titulo, tipo tipo_examen,
                    modulo_id null, categoria_id null, curso_id null, actualizacion_id null,
                    cantidad_preguntas int, nota_minima numeric default 80,
                    max_intentos int default 3, espera_horas int default 24,
                    tiempo_limite_min int null, mezclar bool default true,
                    alcance, sede_id null, estado)
intentos           (id, usuario_id, examen_id, sede_id, area, equipo_id,   -- copia al iniciar
                    ciclo int, iniciado_at, vence_at null, entregado_at null,
                    estado estado_intento, puntaje_auto numeric null, puntaje_manual numeric null,
                    nota numeric null, aprobado bool null,
                    bloque_nivel int null,                                  -- examen de ubicación
                    corrector_id null, tomado_at null, correccion_vence_at null, cerrado_at null)
intento_preguntas  (intento_id, pregunta_id, orden, orden_opciones uuid[])  PK compuesta
respuestas         (id, intento_id, pregunta_id, opcion_ids uuid[] null, orden_respuesta uuid[] null,
                    texto_libre null, es_correcta bool null, puntaje numeric null,
                    devolucion_md null, corregida_por null, corregida_at null,
                    ia_puntaje_sugerido numeric null, ia_justificacion null)
                    unique(intento_id, pregunta_id)
```

### 5.6 Certificación y recertificación

```sql
certificaciones            (id, usuario_id, curso_id, origen origen_cert, intento_id null,
                            emitida_at, vence_at null, estado estado_cert,
                            codigo_verificacion text unique, pdf_path null)
actualizaciones            (id, titulo, descripcion_md, articulo_version_id null, modulo_id null,
                            examen_id null, plazo_dias int, publicada_por, publicada_at)
actualizacion_asignaciones (id, actualizacion_id, usuario_id, vence_at, leida_at null,
                            aprobada_at null, estado estado_asignacion)
alertas                    (id, usuario_id, tipo text, titulo, mensaje, enlace null,
                            leida_at null, created_at)
```

### 5.7 Consignas

```sql
consignas              (id, sede_id, creada_por, tipo tipo_consigna, titulo, detalle_md,
                        articulo_id null, curso_id null, examen_id null,
                        destino destino_consigna, destino_usuario_id null, destino_equipo_id null,
                        destino_subrol_id null, fecha_limite date null, prioridad,
                        recurrencia default 'ninguna', requiere_evidencia bool default false,
                        activa bool default true)
consigna_asignaciones  (id, consigna_id, usuario_id, periodo date, estado estado_asignacion,
                        iniciada_at null, completada_at null, comentario null, evidencia_path null)
                        unique(consigna_id, usuario_id, periodo)
```

### 5.8 Auditoría y vistas

```sql
auditoria (id, actor_id, accion text, entidad text, entidad_id uuid, datos jsonb, created_at)
          -- promociones, cambios de rol, correcciones, revocaciones
```

Vistas, todas con `security_invoker = on` para que respeten la RLS de quien consulta:

- `v_progreso_curso` (usuario, curso, % de ítems cumplidos, aprobado o acreditado, vencimiento)
- `v_estado_asesor` (nivel actual, insignias activas, consignas vencidas, último acceso)
- `v_tasa_pregunta` (pregunta, veces respondida, % de acierto, por sede)
- `v_cola_correccion`

### 5.9 Etapa 9 (IA)

```sql
documentos_fuente (id, titulo, archivo_path, subido_por, created_at)
generaciones_ia   (id, documento_id null, articulo_id null, solicitado_por, modelo, estado,
                   preguntas_generadas int, created_at)
```

---

## 6. RLS (resumen)

Funciones auxiliares, todas `security definer`, `stable` y con `set search_path = ''`: `mi_rol()`, `mi_sede()`, `mi_area()`, `puede_ver_usuario(uuid)`, `puede_editar_contenido(alcance, sede_id)` y `es_corrector_de(intento_id)`.

| Tabla(s) | Asesor | Líder | Coordinador | Director | Admin |
|---|---|---|---|---|---|
| sedes, puestos, subroles, categorías, áreas de derivación | lee | lee | lee | lee | todo |
| equipos, perfiles | su equipo y su perfil | su equipo | sede y área | sede | todo |
| artículos, recursos, campañas, cursos, módulos, ítems (publicados y visibles: global o de mi sede) | lee | lee | lee y escribe los de su sede | lee y escribe los de su sede | todo y promueve |
| preguntas, opciones, casos | ❌ (solo vía RPC) | ❌ | escribe las de su sede (sin leer las globales*) | ídem | todo |
| intentos, respuestas, item_progreso, certificaciones, insignias de usuario, alertas | lo propio (las respuestas solo vía RPC hasta el cierre) | `puede_ver_usuario` | `puede_ver_usuario` | `puede_ver_usuario` | todo |
| consignas y asignaciones | las asignadas a él | crea para su equipo | crea para su sede y área | crea para su sede | todo |

\* Para el análisis del panel, el coordinador ve la tasa de acierto por pregunta mediante una vista agregada, que incluye el enunciado pero no la respuesta correcta.

Reglas adicionales:
- Las escrituras sensibles se hacen **siempre por RPC** y nunca por `update` directo: entregar y corregir intentos, emitir certificaciones, promover contenido y cambiar roles.
- Storage:
  - las políticas por bucket replican la regla de alcance;
  - el bucket de `evidencias` es privado y solo accede quien puede ver al usuario;
  - los certificados son privados, y `/verificar` lee solo los metadatos.
- **pgTAP:** cada política se prueba con un usuario de cada rol, desde una sede propia y desde una ajena.

---

## 7. Arquitectura de la app

```
app/
  (auth)/ingresar, recuperar, invitacion/[token]
  (app)/
    inicio                       → resumen: ruta, consignas, alertas
    repositorio/[categoria]/[slug]
    recursos                     → biblioteca con filtros
    buscar
    organigrama, organigrama/derivaciones
    cursos, cursos/[id], cursos/[id]/modulos/[mid]/items/[iid]
    examenes/[id]/rendir, examenes/intentos/[id]/revision
    perfil, perfil/certificados
    consignas
    equipo/...                   → líder, coordinador, director: progreso, cola de corrección, consignas
    admin/...                    → contenido, preguntas, sedes, usuarios, promociones, actualizaciones
  verificar/[codigo]             → pública
lib/
  supabase/ (server, client, middleware, tipos generados)
  dominio/  (lógica pura y testeable: cálculo de progreso, sorteo, corrección, vigencias)
supabase/
  migrations/, tests/ (pgTAP), seed.sql
```

- El middleware de Next refresca la sesión y redirige según el rol. **La autorización real vive en la RLS y en las RPC.** La UI solo oculta.
- Las altas de usuarios se hacen por invitación desde una Server Action del admin, con la service role (solo en el servidor). El usuario define su contraseña al aceptar.

---

## 8. Manejo de errores

- Las RPC devuelven errores con un código de dominio (`examen_bloqueado`, `sin_intentos`, `en_espera`, `tiempo_vencido`, `no_autorizado`). La UI los traduce a mensajes en rioplatense, por ejemplo: "Todavía no podés rendir: te quedan 5 h de espera".
- El progreso del examen se guarda pregunta por pregunta. Si se cierra la pestaña, el asesor retoma mientras no venza el tiempo. Si vence, el intento pasa a `expirado` y se corrige lo que haya respondido.
- Las subidas a Storage validan tipo y tamaño en el cliente y en las políticas.
- Los errores no esperados se registran en los logs de Vercel y Supabase. Sentry queda como opcional.

---

## 9. Estrategia de testing

- **pgTAP:** políticas RLS por rol y sede; RPC de intentos (bloqueos, ciclos, espera, tiempo límite, corrección, efectos), ubicación, vencimientos y promoción.
- **Vitest:** la lógica de dominio pura en `lib/dominio`.
- **Playwright E2E:**
  - el asesor estudia, rinde, ve su revisión y desbloquea el nivel siguiente;
  - el líder corrige una respuesta libre;
  - el coordinador crea una consigna, ve el panel y exporta a CSV;
  - el admin promueve contenido.
- **CI:** lint, typecheck, Vitest, pgTAP (con la Supabase CLI local) y E2E contra una base local.

---

## 10. Etapas

Cada etapa termina con una demo y espera el OK del usuario para seguir.

1. **Base:** setup, auth por invitación, roles, puestos y subroles, sedes y equipos, esquema base, funciones auxiliares, RLS con tests y layout mobile-first.
2. **Repositorio:** categorías, artículos con versiones, biblioteca de recursos y campañas, buscador, alcance de sede y promoción.
3. **Organigrama y consignas:** vista del organigrama, áreas de derivación y consignas con asignaciones y recurrencia.
4. **Cursos estilo Canvas:** cursos, módulos, ítems, requisitos, prerrequisitos, avance secuencial y rutas por puesto.
5. **Exámenes:** banco de preguntas, los seis tipos, RPC de intentos, revisión, cola de corrección y examen de ubicación.
6. **Perfil, insignias y certificados**, más `/verificar`.
7. **Panel y reportes:** progreso, atrasados, tasa por pregunta y exportación a CSV.
8. **Recertificación:** vigencias, actualizaciones obligatorias, alertas y email.
9. **IA:** generación de preguntas con revisión humana y precorrección de respuestas libres.

**En paralelo desde la Etapa 2:** relevamiento de contenido (sección 12).

---

## 11. Fuera de alcance (por ahora)

- Integraciones en tiempo de ejecución con HubSpot, el portal, Power BI, etc.
- Login con Microsoft (queda preparado, se activa cuando sistemas lo apruebe).
- Gestión de proyectos completa en las consignas.
- App nativa (la web es mobile-first y alcanza).
- Gamificación más allá de insignias y niveles (rankings, puntos).

---

## 12. Relevamiento de contenido

- Se hace en una sesión local de Claude Code con la extensión **Claude in Chrome**, con las sesiones del usuario ya iniciadas en la wiki de Siglo, HubSpot, el portal de estudiantes, el campus virtual, el portal de equivalencias, etc.
- **Salida:** archivos Markdown por categoría, con procedimientos paso a paso, pantallas (anonimizadas), glosario, preguntas frecuentes y la fuente original. Un script de importación los carga como artículos en `borrador`.
- **Reglas:** no extraer datos de alumnos; marcar como "a validar" todo lo que no sea explícito; registrar la URL de la fuente y la fecha de extracción.

---

## 13. Pendientes del usuario

- Lista de **áreas de derivación**: qué resuelve cada una y su canal de contacto.
- Email específico, cuenta de Supabase y cuenta de GitHub para el proyecto. **Hasta tenerlos no se crea ninguna infraestructura.**
- Confirmar el diseño de las **consignas** (sección 4.2).
