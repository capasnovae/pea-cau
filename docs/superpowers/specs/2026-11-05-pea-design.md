# PEA — Perfil Evolutivo de Asesor · Spec de diseño

Estado: en revisión · 2026-11-05

> Copia local del documento editable: https://claude.ai/artifact/X1q2HM1snEgLHYWUJWebwP (la fuente de verdad es el documento).

## 1. Propósito y contexto

PEA es la plataforma donde todo asesor de alumnado y de ventas de los CAU (Neuquén, Plottier, Zapala, Cipolletti, Bariloche, Cutral Co y Roca) de Siglo 21 aprende el ecosistema de la universidad, lo consulta en el día a día y demuestra lo que sabe. La impulsan un asesor/capacitador y un coordinador, y es para todos los CAU.

**Problemas que resuelve (todos a la vez):**

- Los asesores nuevos tardan en aprender.
- Las respuestas varían según la sede.
- No hay un lugar único donde esté todo.

**Criterios de éxito:**

- Un asesor nuevo completa el Nivel 1 y ya sabe dónde buscar cualquier tema.
- El coordinador ve en una pantalla quién está atrasado y qué temas fallan más.
- El contenido se mantiene en un solo lugar y los cursos y exámenes quedan actualizados solos.

**Independencia:** PEA tiene repo, base de datos y dominio propios. No se integra en tiempo de ejecución con ningún sistema de Siglo; esos sistemas son fuente de contenido (vía relevamiento), no dependencias.

**Datos personales:** PEA no almacena datos de alumnos. Las capturas y los ejemplos del relevamiento se anonimizan.

## 2. Stack

- **Next.js 15** (App Router, Server Components, Server Actions) + **TypeScript estricto**.
- **Tailwind CSS** + **shadcn/ui**. Mobile-first. UI en español rioplatense.
- **Supabase:**
  - Auth: email y contraseña por invitación, preparado para sumar Microsoft Entra ID.
  - Postgres 17 con RLS.
  - Storage, con buckets `recursos`, `lecciones`, `evidencias`, `certificados` y `avatares`.
  - `pg_cron`.
  - Búsqueda full text con configuración `spanish` + `unaccent`.
- **Vercel** para el deploy y **Resend** para email transaccional (opcional desde la Etapa 7).
- **@react-pdf/renderer** para los certificados.
- **Videos pesados** fuera de Supabase (YouTube no listado o Vimeo, embebidos por URL). Los cortos van en Storage.
- **Calidad:** Vitest, pgTAP para RLS y funciones SQL, Playwright para E2E, ESLint, Prettier y CI con GitHub Actions.
- **IA (Etapa 9):** Claude API.

## 3. Roles, puestos y visibilidad

Los **permisos** (rol en PEA) van separados del **organigrama** (puesto en el CAU).

### Rol en PEA

| Rol | Ve y gestiona |
| --- | --- |
| asesor | Lo propio |
| lider | Lo propio y su equipo (grupo del que es referente) |
| coordinador | Lo propio y los usuarios de su sede y su área (servicio o ventas) |
| director | Todos los CAU |
| admin | Todo; gestiona el contenido global, las sedes y los usuarios |

### Puestos y subroles (configurables, solo descriptivos)

- **Puestos:** Director, Coordinador de alumnado, Coordinador de ventas, Líder, Asesor de servicio, Asesor de ventas.
- **Subroles de servicio** (una persona puede tener varios):
  - **CEO:** se ocupa de que los alumnos rindan, control de mesas, recordatorios de exámenes y de las reprogramaciones (debe aprender sistema klarway como gran fuente).
  - **TD (tutor dinamizador):** acompaña a los alumnos de presencial distribuida y educación distribuida, y da el IVU o charlas con alumnos.
  - **Campañas:** hace el seguimiento de las bases de campañas, contacta en masividad a alumnos para concretar acciones, ya sea de reinscripción, seguimiento de trabajos prácticos, parciales, etc.
  - **Front:** atiende en la mesa de entrada, resuelve en primera línea y es el puesto que más tiene que saber, debe saber todo lo demás, adquiere herramientas extras como persuación, estrategias, etc.
- Cada puesto y subrol tiene una descripción de funciones que se muestra en el organigrama.
- Los puestos y subroles definen las **rutas de aprendizaje**: qué cursos son obligatorios para cada uno.

### Regla central de visibilidad

La función `puede_ver_usuario(target)` devuelve verdadero si se cumple alguna de estas condiciones:

- es el propio usuario;
- quien consulta es admin;
- quien consulta es director (alcance: los siete CAU);
- quien consulta es coordinador y el usuario es de su sede y de su área;
- quien consulta es líder y el usuario está en su equipo.

Todas las políticas de las tablas con datos por persona usan esta función.

## 4. Módulos funcionales

### 4.1 Repositorio

**Base de conocimiento:** artículos en Markdown, con jerarquía (por ejemplo, el reglamento único dividido en secciones), versionado y buscador full text. Categorías iniciales, editables:

| # | Categoría | Contenido |
| --- | --- | --- |
| 1 | Institucional | CAU y sus asesores, organigrama, división de roles |
| 2 | Reglamento | Un único documento dividido en secciones |
| 3 | Plataformas | Portal de estudiantes, campus virtual (herramienta del asesor), Canvas (de los alumnos), Excel de servicios, HubSpot, base de conocimiento, portal de equivalencias, matrices, Teams, Power BI, Klarway |
| 4 | Oferta académica | Carreras, planes, títulos, doble titulación, articulaciones, APLV |
| 5 | Modalidades | Educación Distribuida Home (distancia), Educación Distribuida (híbrida), Presencial Distribuida |
| 6 | Trámites | Inscripción, reinscripción, equivalencias, certificados, bajas, cambio de carrera, exámenes, creación y seguimiento de tickets |
| 7 | Aranceles y pagos | Cuotas, medios de pago, becas, descuentos, convenios, beneficios |
| 8 | Ventas y asesoramiento | Guiones, objeciones, seguimiento de leads |
| 9 | Campañas y piezas | Campañas vigentes con sus imágenes y videos |
| 10 | Atención y derivaciones | Qué resuelve el CAU, qué se deriva y a qué área |

**Biblioteca de recursos:** archivos e imágenes, videos (por URL o Storage), presentaciones (por ejemplo, el IVU) y enlaces. Cada recurso tiene etiquetas, categoría, campaña opcional y vigencia; al vencer, se oculta del listado general.

**Vigencias:** los artículos y recursos tienen fecha de inicio y de fin, para casos como las matrices de apertura (2027, verano). Al publicar una versión nueva se muestra un aviso de "nueva versión".

**Alcance:**

- El contenido **global** lo crea el admin.
- El contenido **de sede** lo crean el coordinador de esa sede o el director, y solo lo ven en esa sede.
- El admin puede **promover** contenido de sede a global. Se conservan el autor, la sede de origen y quién y cuándo lo promovió.

### 4.2 Organigrama y consignas

**Organigrama**, generado a partir de los datos: arriba, el director, a cargo de los siete CAU; debajo, cada sede con sus coordinadores y sus equipos (líder y asesores); cada persona con su puesto y sus subroles; la descripción de cada puesto.

**Áreas de derivación:** nombre, qué resuelve, qué no resuelve, canal de contacto y plazo esperado. La lista la pasa el usuario.

**Consignas:**

- **Tipos:** tarea; lectura (apunta a un artículo y requiere confirmar la lectura); capacitación (apunta a un curso o examen).
- **Destino:** una persona, un equipo, un subrol dentro de la sede o la sede entera. Se genera una asignación por persona.
- **Datos:** título, detalle, fecha límite, prioridad (baja, normal, alta), recurrencia (ninguna, diaria, semanal, mensual) y si requiere evidencia.
- **Estado por asignación:** pendiente, en curso, hecha o vencida. Al cerrar, el asesor puede dejar un comentario y una evidencia.
- **Quién crea consignas:** el líder (para su equipo), el coordinador (para su sede y área), el director (para cualquier CAU) y el admin.
- **Fuera de alcance:** kanban, subtareas, registro de horas y dependencias.

### 4.3 Cursos estilo Canvas

- **Estructura:** curso, módulos e ítems.
- **Tipos de curso:** nivel (los cuatro niveles, ordenados y configurables, cada uno con vigencia e insignia) y capacitación (cursos sueltos, incluidos los de sede).
- **Tipos de ítem:** artículo (apunta al repositorio, sin copiarlo), recurso, página propia, video, enlace y examen.
- **Requisito de cada ítem:** ninguno, ver, marcar como hecho o aprobar con nota mínima.
- **Módulos:** pueden tener prerrequisitos (otros módulos) y avance secuencial (el ítem siguiente se habilita al cumplir el anterior).
- **Desbloqueo de niveles:** el nivel N se habilita si el N‑1 está aprobado (certificación vigente o vencida) o acreditado por el examen de ubicación. Un nivel vencido no bloquea el siguiente, pero queda marcado para recertificar.
- **Rutas por puesto:** qué cursos son obligatorios u opcionales para cada puesto o subrol. Todos hacen el Nivel 1.
- **El progreso se calcula, no se guarda:** un ítem está cumplido si tiene registro de progreso o un intento aprobado; un módulo, si todos sus ítems con requisito lo están; un curso, si todos sus módulos lo están, más el examen final si lo tiene.

### 4.4 Exámenes

**Tipos de examen:** por módulo, por categoría (por ejemplo, todo HubSpot), por nivel (examen final), de ubicación y de actualización (mini examen por un cambio obligatorio de contenido).

**Configuración:** cantidad de preguntas, nota mínima (80% por defecto), máximo de intentos por ciclo, horas de espera entre ciclos, tiempo límite opcional y mezcla de preguntas y opciones.

**Tipos de pregunta:**

| Tipo | Corrección |
| --- | --- |
| Opción múltiple (una o varias correctas) | Automática |
| Verdadero/falso | Automática |
| Escenario (caso y opciones) | Automática |
| Ordenar pasos | Automática |
| Simulación (preguntas encadenadas sobre un mismo caso: qué sistema abrís, qué ticket creás, a dónde derivás) | Automática |
| Respuesta libre (con rúbrica y puntaje máximo) | Manual, con precorrección de IA en la Etapa 9 |

**Banco de preguntas:** cada pregunta tiene módulo opcional, categoría, artículo de fuente (para enlazar "estudiá esto"), dificultad, estado (borrador, publicada, archivada), origen (manual o IA) y alcance (global o de sede). Las preguntas de una simulación se sortean como bloque.

**Intentos (todo del lado del servidor):**

- Al **iniciar**: se valida el acceso, los intentos que quedan en el ciclo y el tiempo de espera; se sortean las preguntas y se guarda qué le tocó; se devuelven las preguntas sin la respuesta correcta, sin explicación y sin rúbrica.
- **Durante**: cada respuesta se guarda al momento, para no perder lo hecho si se corta la conexión.
- Al **entregar**: se valida el tiempo límite (con margen de gracia) y se corrigen las preguntas cerradas. Sin preguntas libres, se cierra y se aplican los efectos (aprobación, certificación, insignia); con preguntas libres, queda pendiente de corrección.
- **Revisión**: solo con el intento cerrado. Muestra qué respondió mal, cuál era la respuesta correcta y la explicación, con enlace al artículo de fuente.
- El asesor **nunca** puede leer las respuestas correctas, las explicaciones ni las rúbricas antes de entregar.

**Cola de corrección:**

- Es por sede. Corrige cualquiera con rol líder o superior de esa sede, nunca su propio intento.
- Al tomar un intento, queda asignado para que no lo corrijan dos personas. Si el corrector lo suelta o pasan 24 h sin terminar, vuelve a la cola.
- Plazo de 72 h desde la entrega. Si se vence, se avisa al coordinador del área del asesor.
- Quien corrige carga un puntaje por respuesta y una devolución. Al completar todas, el intento se cierra y se aplican los efectos.

**Examen de ubicación:**

- Solo para asesores con experiencia. Lo habilita un coordinador, un director o el admin para cada persona, y se rinde una sola vez.
- Avanza por bloques: Nivel 1, luego 2, luego 3. Si aprueba un bloque, pasa al siguiente; si lo desaprueba, se corta ahí.
- Los niveles aprobados quedan acreditados: sin PDF de certificado completo, pero desbloquean el nivel siguiente.
- El asesor nuevo no lo rinde y arranca en el Nivel 1.

### 4.5 Perfil evolutivo

- Muestra el nivel actual, una barra de progreso de la ruta de su puesto, las insignias (activas y perdidas), el historial de intentos con notas, los certificados, las consignas pendientes y las alertas.
- **Certificado PDF** al aprobar el examen final de un nivel: nombre, nivel, fecha, vencimiento, código de verificación y un QR a una página pública de verificación que muestra si está vigente, vencido o revocado.

### 4.6 Recertificación

- **Por tiempo:**
  - cada nivel tiene una vigencia en meses (o no vence);
  - avisa en la app (y por email opcional) a los 30 y a los 7 días antes de vencer;
  - al vencer, la certificación pasa a vencida, el asesor pierde la insignia y aparece como "a recertificar" en el panel;
  - el reexamen es el examen final del nivel; si lo aprueba, se emite una certificación nueva y recupera la insignia.
- **Por cambio de contenido:**
  - al publicar una versión nueva de un artículo o módulo, el admin puede marcarla como actualización obligatoria, con un mini examen y un plazo en días;
  - se asigna a quienes ya habían aprobado ese contenido;
  - el asesor tiene que leer el cambio y aprobar el mini examen;
  - si no lo hace en plazo, aparece como vencido y pierde la insignia del nivel hasta completarlo.
- **Job diario:** vence certificaciones, actualizaciones y consignas; genera alertas; devuelve a la cola las correcciones abandonadas y avisa las que pasaron las 72 h.

### 4.7 Panel de coordinación y reportes

Cada usuario ve lo que le permite su alcance (equipo, sede y área, sede entera o global):

- progreso por asesor, equipo y sede, y avance de cada ruta por puesto;
- atrasados: sin actividad en N días, consignas vencidas, certificaciones vencidas o por vencer;
- tasa de acierto por pregunta y por categoría, para detectar preguntas mal armadas o temas flojos;
- estado de la cola de corrección;
- exportación a CSV de cada tabla.

### 4.8 IA (Etapa 9)

- Generar preguntas a partir de documentos subidos o de artículos del repositorio. Entran como borrador y requieren revisión y aprobación humana para publicarse.
- Precorregir respuestas libres con la rúbrica: Claude sugiere puntaje y justificación, y la persona que corrige confirma o modifica.

## 5. Esquema de base de datos

Convenciones: claves primarias `uuid`; todas las tablas con `created_at` y, cuando corresponde, `updated_at` por trigger; nombres en español y en snake_case.

### Enums

```
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

### Organización

```
sedes            (id, nombre, ciudad, direccion, activa)
puestos          (id, nombre, area null, descripcion_md, orden)
subroles         (id, nombre, area, descripcion_md, orden)
equipos          (id, sede_id, area, nombre, lider_id null)
perfiles         (id = auth.users.id, nombre, apellido, email unique, telefono null,
                  rol default 'asesor', area null, sede_id null, equipo_id null, puesto_id null,
                  fecha_ingreso, experiencia_previa bool,
                  ubicacion_habilitada_por null, ubicacion_rendida_at null,
                  avatar_path null, activo bool)
perfil_subroles  (perfil_id, subrol_id)
areas_derivacion (id, nombre, que_resuelve_md, que_no_resuelve_md, canal_contacto, plazo_esperado, orden)
```

El usuario no puede modificar su propio rol, sede, área, equipo ni puesto. Solo el admin cambia roles; el director y el coordinador asignan equipo, puesto y subroles dentro de su alcance.

### Repositorio

```
categorias          (id, slug unique, nombre, descripcion, icono, orden, padre_id null)
articulos           (id, categoria_id, padre_id null, orden, slug, titulo, resumen, cuerpo_md,
                     version, alcance, sede_id null, estado, vigente_desde null, vigente_hasta null,
                     fuente_url null, autor_id, promovido_por null, promovido_at null,
                     busqueda tsvector generado)
articulo_versiones  (id, articulo_id, version, titulo, cuerpo_md, resumen_cambio, autor_id)
campanas            (id, nombre, descripcion_md, vigente_desde, vigente_hasta, alcance, sede_id null, estado)
recursos            (id, categoria_id, campana_id null, titulo, descripcion, tipo,
                     archivo_path null, url_externa null, miniatura_path null, etiquetas text[],
                     alcance, sede_id null, estado, vigente_hasta null, autor_id,
                     promovido_por null, promovido_at null, busqueda tsvector generado)
```

En todas las tablas con alcance: si el alcance es `sede`, `sede_id` es obligatorio; si es `global`, va vacío.

### Cursos

```
cursos                (id, tipo, nivel_orden null unique, titulo, descripcion_md, portada_path null,
                       vigencia_meses null, alcance, sede_id null, estado, autor_id,
                       promovido_por null, promovido_at null)
ruta_cursos           (id, curso_id, puesto_id null, subrol_id null, obligatorio)
modulos               (id, curso_id, orden, titulo, descripcion_md, avance_secuencial, estado)
modulo_prerrequisitos (modulo_id, requiere_modulo_id)
items                 (id, modulo_id, orden, titulo, tipo, articulo_id null, recurso_id null,
                       examen_id null, contenido_md null, url null, requisito)
item_progreso         (usuario_id, item_id, visto_at null, hecho_at null)
insignias             (id, curso_id unique, nombre, descripcion, icono_path)
usuario_insignias     (id, usuario_id, insignia_id, otorgada_at, perdida_at null, motivo_perdida null)
```

### Exámenes

```
casos              (id, titulo, contexto_md, categoria_id, alcance, sede_id null)
preguntas          (id, tipo, enunciado_md, contexto_md null, caso_id null, orden_en_caso null,
                    explicacion_md, rubrica_md null, puntaje_max, dificultad 1..3,
                    modulo_id null, categoria_id, articulo_fuente_id null, estado, origen,
                    alcance, sede_id null, autor_id, aprobada_por null, aprobada_at null)
opciones           (id, pregunta_id, texto, es_correcta, posicion_correcta null, orden)
examenes           (id, titulo, tipo, modulo_id null, categoria_id null, curso_id null,
                    actualizacion_id null, cantidad_preguntas, nota_minima default 80,
                    max_intentos default 3, espera_horas default 24, tiempo_limite_min null,
                    mezclar, alcance, sede_id null, estado)
intentos           (id, usuario_id, examen_id, sede_id, area, equipo_id, ciclo,
                    iniciado_at, vence_at null, entregado_at null, estado,
                    puntaje_auto null, puntaje_manual null, nota null, aprobado null,
                    bloque_nivel null, corrector_id null, tomado_at null,
                    correccion_vence_at null, cerrado_at null)
intento_preguntas  (intento_id, pregunta_id, orden, orden_opciones uuid[])
respuestas         (id, intento_id, pregunta_id, opcion_ids uuid[] null, orden_respuesta uuid[] null,
                    texto_libre null, es_correcta null, puntaje null, devolucion_md null,
                    corregida_por null, corregida_at null,
                    ia_puntaje_sugerido null, ia_justificacion null)
```

La sede, el área y el equipo se copian en `intentos` al iniciar, para que los reportes históricos no cambien si alguien se muda de sede.

### Certificación y recertificación

```
certificaciones            (id, usuario_id, curso_id, origen, intento_id null, emitida_at,
                            vence_at null, estado, codigo_verificacion unique, pdf_path null)
actualizaciones            (id, titulo, descripcion_md, articulo_version_id null, modulo_id null,
                            examen_id null, plazo_dias, publicada_por, publicada_at)
actualizacion_asignaciones (id, actualizacion_id, usuario_id, vence_at, leida_at null,
                            aprobada_at null, estado)
alertas                    (id, usuario_id, tipo, titulo, mensaje, enlace null, leida_at null)
```

### Consignas

```
consignas              (id, sede_id, creada_por, tipo, titulo, detalle_md,
                        articulo_id null, curso_id null, examen_id null,
                        destino, destino_usuario_id null, destino_equipo_id null, destino_subrol_id null,
                        fecha_limite null, prioridad, recurrencia, requiere_evidencia, activa)
consigna_asignaciones  (id, consigna_id, usuario_id, periodo, estado, iniciada_at null,
                        completada_at null, comentario null, evidencia_path null)
```

### Auditoría, vistas e IA

```
auditoria         (id, actor_id, accion, entidad, entidad_id, datos jsonb)
documentos_fuente (id, titulo, archivo_path, subido_por)                       -- Etapa 9
generaciones_ia   (id, documento_id null, articulo_id null, solicitado_por,
                   modelo, estado, preguntas_generadas)                         -- Etapa 9
```

Vistas que respetan la RLS de quien consulta: progreso por curso, estado del asesor, tasa de acierto por pregunta y cola de corrección.

## 6. RLS (resumen)

| Datos | Asesor | Líder | Coordinador | Director | Admin |
| --- | --- | --- | --- | --- | --- |
| Sedes, puestos, subroles, categorías, áreas de derivación | Lee | Lee | Lee | Lee | Todo |
| Equipos y perfiles | Su perfil y su equipo | Su equipo | Sede y área | Todos los CAU | Todo |
| Artículos, recursos, campañas, cursos (publicados: globales o de su sede) | Lee | Lee | Lee y escribe los de su sede | Lee y escribe los de cualquier CAU | Todo y promueve |
| Preguntas, opciones, casos | Solo vía examen | Solo vía examen | Escribe las de su sede | Escribe las de cualquier CAU | Todo |
| Intentos, progreso, certificaciones, insignias, alertas | Lo propio | Su equipo | Sede y área | Todos los CAU | Todo |
| Consignas | Las asignadas a él | Crea para su equipo | Crea para su sede y área | Crea para cualquier CAU | Todo |

- Para el panel, el coordinador ve la tasa de acierto por pregunta en una vista agregada que incluye el enunciado pero no la respuesta correcta.
- Las escrituras sensibles se hacen siempre por funciones del servidor: entregar y corregir intentos, emitir certificaciones, promover contenido y cambiar roles.
- Storage replica la regla de alcance; evidencias y certificados son privados.
- Cada política se prueba con un usuario de cada rol, desde una sede propia y desde una ajena.

## 7. Arquitectura de la app

```
app/
  (auth)/ingresar, recuperar, invitacion/[token]
  (app)/
    inicio                 → resumen: ruta, consignas, alertas
    repositorio/[categoria]/[slug]
    recursos               → biblioteca con filtros
    buscar
    organigrama, organigrama/derivaciones
    cursos/[id]/modulos/[mid]/items/[iid]
    examenes/[id]/rendir, examenes/intentos/[id]/revision
    perfil, perfil/certificados
    consignas
    equipo/...             → líder, coordinador, director: progreso, cola de corrección, consignas
    admin/...              → contenido, preguntas, sedes, usuarios, promociones, actualizaciones
  verificar/[codigo]       → pública
lib/
  supabase/                → clientes y tipos generados
  dominio/                 → lógica pura y testeable: progreso, sorteo, corrección, vigencias
supabase/
  migrations/, tests/ (pgTAP), seed.sql
```

- La autorización real vive en la RLS y en las funciones del servidor. La interfaz solo oculta lo que no corresponde.
- Las altas de usuarios se hacen por invitación del admin; el usuario define su contraseña al aceptar.

## 8. Manejo de errores

- Los errores de examen llevan un código (bloqueado, sin intentos, en espera, tiempo vencido, no autorizado) y la interfaz los traduce, por ejemplo: "Todavía no podés rendir: te quedan 5 h de espera".
- Si se cierra la pestaña durante un examen, el asesor retoma mientras no venza el tiempo. Si vence, se corrige lo que haya respondido.
- Las subidas de archivos validan tipo y tamaño.
- Los errores no esperados quedan en los logs de Vercel y Supabase. Sentry queda como opcional.

## 9. Estrategia de testing

- **pgTAP:** políticas por rol y sede; intentos (bloqueos, ciclos, espera, tiempo límite, corrección, efectos), ubicación, vencimientos y promoción.
- **Vitest:** la lógica de dominio.
- **Playwright E2E:**
  - el asesor estudia, rinde, ve su revisión y desbloquea el nivel siguiente;
  - el líder corrige una respuesta libre;
  - el coordinador crea una consigna, ve el panel y exporta a CSV;
  - el admin promueve contenido.
- **CI:** lint, tipos, Vitest, pgTAP y E2E contra una base local.

## 10. Etapas

Cada etapa termina con una demo y espera tu OK para seguir.

1. **Base:** setup, auth por invitación, roles, puestos y subroles, sedes y equipos, esquema base, RLS con tests y layout mobile-first.
2. **Repositorio:** categorías, artículos con versiones, biblioteca de recursos y campañas, buscador, alcance de sede y promoción.
3. **Organigrama y consignas:** vista del organigrama, áreas de derivación y consignas con recurrencia.
4. **Cursos estilo Canvas:** módulos, ítems, requisitos, prerrequisitos, avance secuencial y rutas por puesto.
5. **Exámenes:** banco de preguntas, los seis tipos, intentos, revisión, cola de corrección y examen de ubicación.
6. **Perfil, insignias y certificados**, con la página de verificación.
7. **Panel y reportes:** progreso, atrasados, tasa por pregunta y CSV.
8. **Recertificación:** vigencias, actualizaciones obligatorias, alertas y email.
9. **IA:** generación de preguntas con revisión humana y precorrección de respuestas libres.

En paralelo desde la Etapa 2: relevamiento de contenido.

## 11. Fuera de alcance (por ahora)

- Integraciones en tiempo de ejecución con HubSpot, el portal, Power BI, etc.
- Login con Microsoft (queda preparado para cuando sistemas lo apruebe).
- Gestión de proyectos completa en las consignas.
- App nativa: la web mobile-first alcanza.
- Gamificación más allá de insignias y niveles (rankings, puntos).

## 12. Relevamiento de contenido

- Se hace en una sesión local de Claude Code con la extensión Claude in Chrome, con tus sesiones ya iniciadas en la wiki de Siglo, HubSpot, el portal de estudiantes, el campus virtual, el portal de equivalencias, etc.
- **Salida:** archivos Markdown por categoría, con procedimientos paso a paso, pantallas anonimizadas, glosario, preguntas frecuentes y la fuente original. Se importan como artículos en borrador.
- **Reglas:** no extraer datos de alumnos; marcar "a validar" todo lo que no sea explícito; registrar la URL de la fuente y la fecha de extracción.

## 13. Pendientes

- [ ] Pasar la lista de áreas de derivación (qué resuelve cada una y su canal de contacto)
- [ ] Crear el email específico y las cuentas de Supabase y GitHub del proyecto (hasta entonces no se crea infraestructura)
- [ ] Confirmar el diseño de las consignas (sección 4.2)
- [ ] Aprobar esta spec para pasar al plan de la Etapa 1
