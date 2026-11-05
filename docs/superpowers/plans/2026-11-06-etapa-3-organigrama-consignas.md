# PEA · Etapa 3 (Organigrama y consignas) — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** El organigrama de los siete CAU (director → sedes → coordinadores → equipos con líder y asesores, con puestos y subroles), las áreas de derivación, y las consignas: tareas, lecturas obligatorias y capacitaciones que el líder, el coordinador, el director o el admin asignan a una persona, un equipo, un subrol o una sede, con recurrencia, vencimiento y cierre con comentario y evidencia.

**Architecture:** Igual que las etapas anteriores: las reglas viven en Postgres (RLS + funciones `security definer`, probadas con pgTAP).
- El organigrama se lee con una RPC que devuelve solo datos de directorio (nombre, rol, puesto, subroles, sede, área, equipo) de los usuarios activos. Así todos ven el organigrama sin abrir la tabla `perfiles`, que sigue con su RLS estricta.
- Al crear una consigna, un trigger genera una asignación por destinatario.
- Una función diaria (`pg_cron`) crea los períodos de las recurrentes y marca las vencidas.
- Las evidencias van a un bucket privado aparte.

**Tech Stack:** lo de las etapas 1 y 2 + `pg_cron`.

**Spec:** `docs/superpowers/specs/2026-11-05-pea-design.md` §3 (roles, puestos, subroles) y §4.2 (organigrama, áreas de derivación, consignas). También incluye lo que quedó pendiente de la Etapa 1: filtros de la lista de usuarios.

## Global Constraints

- Todo lo de las etapas anteriores sigue valiendo.
- **Quién crea consignas y para quién** (spec §4.2):
  - el líder, para su equipo o una persona de su equipo;
  - el coordinador, para su sede y su área (persona, equipo, subrol o la sede entera, siempre dentro de su área);
  - el director, para cualquier sede;
  - el admin, para cualquiera.
- **Tipos de consigna:** `tarea`; `lectura` (requiere `articulo_id` y el asesor confirma la lectura); `capacitacion` (apunta a un curso o examen). Los cursos y exámenes llegan en las etapas 4 y 5, así que en esta etapa el tipo `capacitacion` existe en la base pero no se ofrece en la UI.
- **Destinos:** `usuario`, `equipo`, `subrol` (dentro de la sede de la consigna) y `sede`. Solo reciben asignación los usuarios activos que el creador puede ver. Una consigna de sede creada por un coordinador llega solo a su área.
- **Estados de asignación:** `pendiente`, `en_curso`, `hecha`, `vencida`. Una asignación vencida todavía se puede cerrar como hecha (queda registrada la fecha real).
- **Recurrencia:** `ninguna`, `diaria`, `semanal` (lunes) y `mensual` (día 1). Cada período genera una asignación por persona (`unique(consigna_id, usuario_id, periodo)`). El vencimiento de una asignación recurrente es el fin de su período. El de una no recurrente es su `fecha_limite`.
- **Evidencias:** bucket privado `evidencias`, máximo 10 MB por archivo, imágenes o pdf, ruta `<asignacion_id>/<uuid>-<nombre>`. Las sube solo el destinatario y las ven el destinatario, el creador de la consigna y quien puede ver al destinatario.
- **Directorio:** todos los usuarios activos ven nombre, apellido, rol, puesto, subroles, sede, área y equipo de los usuarios activos. El email y el teléfono no se exponen en el organigrama.
- **Áreas de derivación:** las carga el admin. Mientras el usuario no pase la lista real, la sección muestra "Todavía no se cargaron las áreas de derivación." No se inventan áreas.

## Review Focus

1. **Destino fuera de alcance:** un líder que crea una consigna para una persona de otro equipo, o un coordinador de servicio que apunta a la sede entera, no debe generar asignaciones para gente fuera de su alcance. (Test en Task 2.)
2. **Asesor que edita su asignación:** solo puede cambiar estado, comentario y evidencia, nunca el `usuario_id`, el `periodo` ni la consigna. Tampoco puede crear asignaciones para otros. (Test en Task 2.)
3. **Usuario inactivo o que cambia de equipo:** no recibe asignaciones nuevas. Las ya generadas quedan con su historial. (Test en Task 3.)
4. **Recurrente que se procesa dos veces el mismo día:** no duplica asignaciones. (Test en Task 3.)
5. **Evidencia de otro:** un asesor no puede leer ni subir evidencias en la asignación de otra persona. (Test en Task 4.)

---

## File Structure

```
supabase/migrations/
  20261107000100_consignas.sql            → enums, tablas, trigger de asignaciones
  20261107000200_rls_consignas.sql        → alcance de creación, políticas, protección de columnas
  20261107000300_procesar_consignas.sql   → recurrencia y vencimiento + pg_cron
  20261107000400_evidencias.sql           → bucket y políticas
  20261107000500_organigrama.sql          → RPC organigrama() + RLS de areas_derivacion ya existente
supabase/tests/10_consignas.test.sql, 11_consignas_rls.test.sql, 12_procesar.test.sql,
               13_evidencias.test.sql, 14_organigrama.test.sql
lib/dominio/organigrama.ts (+ test)        → armado del árbol
lib/dominio/consignas.ts (+ test)          → zod, destinos por rol, períodos, textos de estado
lib/dominio/roles.ts (+ test)              → menú: Organigrama, Consignas, Equipo (gestores)
app/(app)/organigrama/page.tsx, organigrama/derivaciones/page.tsx
app/(app)/admin/derivaciones/page.tsx (+ acciones)
app/(app)/consignas/page.tsx (+ acciones, formulario de cierre)
app/(app)/equipo/consignas/page.tsx, equipo/consignas/nueva/page.tsx, equipo/consignas/[id]/page.tsx (+ acciones)
app/(app)/admin/usuarios/page.tsx          → (modificar) filtros por sede, rol, estado y texto
e2e/organigrama-consignas.spec.ts
```

---

### Task 1: Esquema de consignas y generación de asignaciones

**Files:**
- Create: `supabase/migrations/20261107000100_consignas.sql`, `supabase/tests/10_consignas.test.sql`

**Interfaces:**
- Produces:
  - Enums `tipo_consigna`, `destino_consigna`, `estado_asignacion`, `recurrencia`, `prioridad` (valores de la spec §5.1).
  - Tablas `consignas` y `consigna_asignaciones` de la spec §5.7, con estos agregados:
    - en `consignas`: `area area null` (área de la consigna, para consignas de sede de un coordinador), `created_at` y `updated_at`;
    - en `consigna_asignaciones`: `vence_el date null` y `leida_at timestamptz null` (para el tipo lectura).
  - Checks:
    - `tipo='lectura'` ⇒ `articulo_id is not null`;
    - según `destino`, exactamente el campo de destino que corresponde está lleno (`destino='sede'` ⇒ los tres `destino_*` en null);
    - `recurrencia <> 'ninguna'` o `fecha_limite` libre.
  - `public.periodo_actual(p_recurrencia recurrencia, p_hoy date) returns date` (immutable): ninguna → `p_hoy`; diaria → `p_hoy`; semanal → el lunes de esa semana; mensual → el día 1.
  - `public.fin_periodo(p_recurrencia, p_periodo date) returns date`: diaria → el mismo día; semanal → periodo + 6; mensual → el último día del mes.
  - `public.destinatarios_consigna(p_consigna uuid) returns setof uuid` (`security definer`): los usuarios activos que corresponden al destino, dentro de la sede de la consigna (y de su área si `area` no es null), y que el **creador** puede ver (reusa la lógica de `puede_ver_usuario` evaluada para `creada_por`; para eso se extrae `public.puede_ver_usuario_como(p_actor uuid, p_objetivo uuid)` y `puede_ver_usuario(objetivo)` pasa a llamarla con `auth.uid()`).
  - Trigger `after insert on consignas` → `generar_asignaciones(new.id, periodo_actual(new.recurrencia, current_date))`. `generar_asignaciones(p_consigna uuid, p_periodo date) returns int` (`security definer`): inserta `(consigna_id, usuario_id, periodo, vence_el)` para cada destinatario, con `on conflict do nothing`, y devuelve la cantidad insertada.

- [ ] **Step 1: Test que falla** `10_consignas.test.sql` (escenario de la Etapa 1, que suma un usuario `aseFront@t` de T-Neuquén, servicio, con subrol Front):
  - consigna de `coordS` con destino `sede` → asignaciones para los activos de servicio de T-Neuquén (`ase1`, `ase2`, `lider1`, `aseFront`); no para `aseV`, `aseR`, `aseInactivo` ni el propio `coordS`;
  - destino `equipo` E1 → `ase1` y `lider1`;
  - destino `subrol` Front → solo `aseFront`;
  - `throws_ok` (23514) consigna de tipo lectura sin artículo;
  - `periodo_actual('semanal','2026-11-06')` = `2026-11-02`; `fin_periodo('mensual','2026-02-01')` = `2026-02-28`;
  - insertar la misma consigna dos veces en el mismo período no duplica.
- [ ] **Step 2:** FAIL. **Step 3:** migración (incluye el refactor de `puede_ver_usuario` y vuelve a pasar `02_funciones`). **Step 4:** `db reset && test db` → PASS.
- [ ] **Step 5: Commit** `feat(db): consignas y generación de asignaciones`

---

### Task 2: RLS y alcance de las consignas

**Files:**
- Create: `supabase/migrations/20261107000200_rls_consignas.sql`, `supabase/tests/11_consignas_rls.test.sql`

**Interfaces:**
- Produces:
  - `puede_crear_consigna(p_sede uuid, p_area area, p_destino destino_consigna, p_usuario uuid, p_equipo uuid) returns boolean`, con la regla de las Global Constraints:
    - el líder solo puede usar los destinos `usuario` (de su equipo) y `equipo` (el suyo);
    - el coordinador solo en su sede y con `p_area = mi_area()`.
  - `consignas`:
    - `insert` con `check (creada_por = auth.uid() and puede_crear_consigna(...))`;
    - `select` para el creador, para quien puede crear con ese alcance y para los destinatarios que tienen una asignación;
    - `update` y `delete` solo para el creador o el admin.
  - Trigger `before insert`: `creada_por := auth.uid()`. Si quien crea es coordinador, `area := mi_area()`.
  - `consigna_asignaciones`:
    - `select` si es el propio usuario, o `puede_ver_usuario(usuario_id)`, o el creador de la consigna;
    - `update` solo del destinatario;
    - sin `insert` ni `delete` para `authenticated`.
  - Trigger `proteger_asignacion`: para el destinatario solo pueden cambiar `estado`, `iniciada_at`, `completada_at`, `comentario`, `evidencia_path` y `leida_at`. Al pasar a `hecha` se completa `completada_at := now()`. En una consigna de tipo lectura, `hecha` exige `leida_at`.

- [ ] **Step 1: Test que falla** `11_consignas_rls.test.sql`:
  - como `lider1`: `lives_ok` consigna para su equipo; `throws_ok` (42501) consigna para `ase2` (sin equipo) y destino `sede`.
  - como `coordS`: `throws_ok` (42501) consigna para la sede T-Roca; la consigna de sede que crea queda con `area='servicio'`.
  - como `dir`: `lives_ok` consigna para T-Roca.
  - como `ase1`: ve su asignación; `lives_ok` pasarla a `hecha` con comentario (queda `completada_at`); `throws_ok` cambiar su `usuario_id` (`'no_autorizado: campo protegido'`); `throws_ok` (42501) insertar una asignación; no ve la asignación de `lider1`; `throws_ok` (42501) crear una consigna.
  - como `lider1`: ve la asignación de `ase1` (su equipo).
  - lectura: `throws_ok` pasar a `hecha` sin `leida_at` (`'integridad: confirmá la lectura'`); `lives_ok` con `leida_at`.
- [ ] **Step 2:** FAIL. **Step 3:** migración. **Step 4:** PASS + `db lint`.
- [ ] **Step 5: Commit** `feat(db): alcance y permisos de las consignas`

---

### Task 3: Recurrencia y vencimiento

**Files:**
- Create: `supabase/migrations/20261107000300_procesar_consignas.sql`, `supabase/tests/12_procesar.test.sql`

**Interfaces:**
- Produces:
  - `procesar_consignas(p_hoy date default current_date) returns jsonb` (`security definer`; `execute` solo para `postgres` y `service_role`):
    1. para cada consigna activa con recurrencia, genera las asignaciones de `periodo_actual(recurrencia, p_hoy)` si todavía no existen;
    2. pasa a `vencida` las asignaciones `pendiente` o `en_curso` con `vence_el < p_hoy`;
    3. devuelve `{"generadas": n, "vencidas": m}`.
  - `cron.schedule('procesar-consignas', '5 3 * * *', 'select public.procesar_consignas()')`, todos los días a las 03:05 UTC (00:05 en Argentina).

- [ ] **Step 1: Test que falla** `12_procesar.test.sql`:
  - una consigna semanal del equipo E1 creada con período `2026-11-02` → `procesar_consignas('2026-11-09')` genera 2 asignaciones nuevas con período `2026-11-09`; correrlo otra vez ese día genera 0;
  - la asignación del período anterior, todavía pendiente, queda `vencida`;
  - si `ase1` está inactivo (o pasa a otro equipo) antes del 9, no recibe la del nuevo período;
  - una vencida se puede cerrar como `hecha` por el destinatario;
  - existe el job `procesar-consignas` en `cron.job`.
- [ ] **Step 2:** FAIL. **Step 3:** migración. **Step 4:** PASS.
- [ ] **Step 5: Commit** `feat(db): recurrencia y vencimiento de consignas`

---

### Task 4: Evidencias

**Files:**
- Create: `supabase/migrations/20261107000400_evidencias.sql`, `supabase/tests/13_evidencias.test.sql`

**Interfaces:**
- Produces:
  - Bucket `evidencias` (privado, 10 MB, `image/png`, `image/jpeg`, `image/webp`, `application/pdf`).
  - `puede_leer_evidencia(p_nombre text)`: el primer segmento es un `consigna_asignaciones.id` que el usuario puede ver (destinatario, `puede_ver_usuario` o creador).
  - `puede_subir_evidencia(p_nombre text)`: es el destinatario de esa asignación.
  - Políticas en `storage.objects` para `bucket_id='evidencias'`: `select` con leer; `insert`, `update` y `delete` con subir.

- [ ] **Step 1: Test que falla** `13_evidencias.test.sql`:
  - `ase1` sube a su asignación;
  - `throws_ok` (42501) cuando `ase2` sube a la de `ase1`;
  - `ase2` no la ve;
  - `lider1` y `coordS` la ven.
- [ ] **Step 2:** FAIL. **Step 3:** migración. **Step 4:** PASS.
- [ ] **Step 5: Commit** `feat(db): evidencias de consignas`

---

### Task 5: Organigrama (datos)

**Files:**
- Create: `supabase/migrations/20261107000500_organigrama.sql`, `supabase/tests/14_organigrama.test.sql`

**Interfaces:**
- Produces: `organigrama() returns table(id uuid, nombre text, apellido text, rol rol_app, area area, sede_id uuid, sede text, equipo_id uuid, equipo text, es_lider boolean, puesto text, subroles text[])`. Es `security definer`, `stable` y solo para usuarios activos (si quien llama no está activo, devuelve 0 filas). Incluye solo perfiles activos, sin email ni teléfono.

- [ ] **Step 1: Test que falla** `14_organigrama.test.sql`:
  - como `ase1`: `organigrama()` incluye a `aseR` y a `dir`, y no incluye a `aseInactivo`;
  - la columna email no existe en el resultado (`hasnt_column` sobre un `create temp table as select * from organigrama()`);
  - como `aseInactivo`: 0 filas;
  - como anon: `throws_ok` (42501).
- [ ] **Step 2:** FAIL. **Step 3:** migración. **Step 4:** PASS.
- [ ] **Step 5: Commit** `feat(db): directorio para el organigrama`

---

### Task 6: Dominio de organigrama y consignas (lógica pura)

**Files:**
- Create: `lib/dominio/organigrama.ts` (+ test), `lib/dominio/consignas.ts` (+ test)
- Modify: `lib/dominio/roles.ts` (+ test)

**Interfaces:**
- Produces:
  - `armarOrganigrama(filas: FilaOrganigrama[]): { directores: Persona[]; admins: Persona[]; sedes: { id, nombre, coordinadores: { servicio: Persona[]; ventas: Persona[] }, equipos: { id, nombre, area, lider: Persona | null, miembros: Persona[] }[], sinEquipo: { servicio: Persona[]; ventas: Persona[] } }[] }`. Sedes ordenadas por nombre; personas por apellido.
  - `destinosPermitidos(rol: RolApp): DestinoConsigna[]`: líder → `["usuario","equipo"]`; coordinador, director y admin → los cuatro; asesor → `[]`.
  - `esquemaConsigna` (zod): `titulo` 1–160, `detalle_md` ≤ 5000, `tipo` en `tarea|lectura`, `articulo_id` obligatorio si es lectura, `destino` y el campo correspondiente, `sede_id`, `fecha_limite` (fecha ≥ hoy o null; null si es recurrente), `prioridad`, `recurrencia`, `requiere_evidencia`.
  - `ETIQUETA_ESTADO`: pendiente → "Pendiente", en_curso → "En curso", hecha → "Hecha", vencida → "Vencida".
  - `menuPorRol`:
    - todos suman Organigrama (`/organigrama`) y Consignas (`/consignas`);
    - líder, coordinador, director y admin suman Equipo (`/equipo/consignas`);
    - el orden queda: Inicio, Consignas, Repositorio, Recursos, Buscar, Organigrama, Mi perfil, [Equipo], [Contenido], [admin…].

- [ ] **Step 1: Tests que fallan:**
  - `armarOrganigrama` con dos sedes, un equipo con líder y un asesor sin equipo;
  - `destinosPermitidos("lider")` = `["usuario","equipo"]`;
  - `esquemaConsigna` rechaza una lectura sin artículo y una recurrente con fecha límite;
  - los `href` del menú para asesor, líder y admin.
- [ ] **Step 2:** FAIL. **Step 3:** implementar. **Step 4:** PASS.
- [ ] **Step 5: Commit** `feat(dominio): organigrama y consignas`

---

### Task 7: Organigrama y áreas de derivación (UI)

**Files:**
- Create: `app/(app)/organigrama/page.tsx`, `app/(app)/organigrama/derivaciones/page.tsx`, `app/(app)/admin/derivaciones/page.tsx`, `app/(app)/admin/derivaciones/acciones.ts`
- Modify: `lib/dominio/roles.ts` (el admin suma "Derivaciones" → `/admin/derivaciones`, con su test)

- [ ] **Step 1:** **`/organigrama`:**
  - arriba, el director;
  - después, una tarjeta por sede (plegable con `<details>`; en celular se abre la propia) con los coordinadores de servicio y de ventas, los equipos (líder destacado y miembros con puesto y subroles) y "Sin equipo";
  - al final, una sección "Qué hace cada puesto" con las descripciones de `puestos` y `subroles`.
- [ ] **Step 2:** **`/organigrama/derivaciones`:** una tarjeta por área con qué resuelve, qué no resuelve (Markdown), canal de contacto y plazo esperado. Estado vacío: "Todavía no se cargaron las áreas de derivación."
- [ ] **Step 3:** **`/admin/derivaciones`:** CRUD de áreas (nombre, qué resuelve, qué no resuelve, canal, plazo y orden), con zod y el cliente del usuario (la RLS de la Etapa 1 ya restringe la escritura al admin).
- [ ] **Step 4:** `npm test && npm run typecheck && npm run build` → PASS.
- [ ] **Step 5: Commit** `feat(organigrama): organigrama y áreas de derivación`

---

### Task 8: Consignas (UI)

**Files:**
- Create: `app/(app)/consignas/page.tsx`, `app/(app)/consignas/acciones.ts`, `app/(app)/consignas/formulario-cierre.tsx`, `app/(app)/equipo/consignas/page.tsx`, `app/(app)/equipo/consignas/nueva/page.tsx`, `app/(app)/equipo/consignas/[id]/page.tsx`, `app/(app)/equipo/consignas/acciones.ts`
- Modify: `app/(app)/inicio/page.tsx` (bloque "Tus consignas pendientes", con hasta 3)

**Interfaces (Server Actions, siempre con el cliente del usuario):**
- `actualizarAsignacion(prev, formData)`: estado `en_curso` o `hecha`, comentario ≤ 1000 y evidencia opcional. La evidencia se sube a `evidencias/<asignacion_id>/<uuid>-<slug>.<ext>` y se valida en el cliente y en el servidor con los límites del bucket. Si la consigna `requiere_evidencia`, no se puede cerrar sin ella.
- `confirmarLectura(asignacionId)`: completa `leida_at`.
- `crearConsigna(prev, formData)`: valida con `esquemaConsigna`. Si la RLS rechaza, responde "No tenés permiso para asignar a ese destino." Al terminar, redirige a `/equipo/consignas/<id>` y muestra cuántas asignaciones se generaron.
- `desactivarConsigna(id)`: `activa=false`, así se cortan las recurrencias.
- `urlEvidencia(asignacionId)`: URL firmada por 10 minutos.

- [ ] **Step 1:** **`/consignas` (cualquier usuario):**
  - pestañas Pendientes, Hechas y Vencidas;
  - cada tarjeta muestra título, quién la asignó, fecha límite o período, prioridad y el detalle en Markdown;
  - si es de lectura, el link al artículo y el botón "Ya lo leí";
  - formulario de cierre con comentario y evidencia.
- [ ] **Step 2:** **`/equipo/consignas` (gestores):** lista de las consignas que creó, con el avance (hechas / total del período actual) y el botón "Nueva consigna".
- [ ] **Step 3:** **`/equipo/consignas/nueva`:**
  - tipo (tarea o lectura; en lectura, un selector de artículos publicados);
  - destino, solo con los permitidos por rol; los selectores de persona, equipo y subrol se arman con `organigrama()`, filtrado a lo que el rol puede alcanzar;
  - sede (director y admin la eligen; líder y coordinador usan la suya), fecha límite, prioridad, recurrencia y "Requiere evidencia".
- [ ] **Step 4:** **`/equipo/consignas/[id]`:** detalle con la tabla de asignaciones del período (persona, estado, fecha de cierre, comentario y link a la evidencia), el selector de período y el botón "Dejar de repetir" para las recurrentes.
- [ ] **Step 5:** Inicio: "Tus consignas pendientes" con hasta 3 y el link "Ver todas".
- [ ] **Step 6:** `npm run typecheck && npm run lint && npm run build` → PASS.
- [ ] **Step 7: Commit** `feat(consignas): bandeja del asesor y gestión del equipo`

---

### Task 9: Filtros de la lista de usuarios (pendiente de la Etapa 1)

**Files:**
- Modify: `app/(app)/admin/usuarios/page.tsx`
- Create: `lib/dominio/filtros-usuarios.ts` (+ test)

**Interfaces:**
- `leerFiltrosUsuarios(sp: Record<string, string | string[] | undefined>): { q: string; sede: string | null; rol: RolApp | null; estado: "activos" | "inactivos" | "todos" }`. Ignora los valores inválidos y por defecto muestra los activos.

- [ ] **Step 1: Test que falla:** `leerFiltrosUsuarios({ rol: "superadmin", estado: "x" })` → `{ q: "", sede: null, rol: null, estado: "activos" }`; `leerFiltrosUsuarios({ q: "  Ana ", rol: "lider" })` → `q: "Ana"`, `rol: "lider"`.
- [ ] **Step 2:** FAIL. **Step 3:** implementar. La página aplica los filtros en la consulta: `ilike` sobre nombre, apellido o email; `eq` por sede y por rol; y el estado.
- [ ] **Step 4:** PASS + build.
- [ ] **Step 5: Commit** `feat(admin): filtros en la lista de usuarios`

---

### Task 10: E2E

**Files:**
- Create: `e2e/organigrama-consignas.spec.ts`
- Modify: `supabase/seed.sql`, que suma `asesor2.nqn@pea.local` (servicio, Neuquén, sin equipo, subrol CEO)

- [ ] **Step 1: Tests**:
  - **Organigrama:** el asesor de Neuquén ve a Diego Director arriba, la tarjeta de Neuquén con "Equipo Lucía" (líder Lucía Líder) y la tarjeta de Roca con Rocío Asesora.
  - **Consigna de lectura:**
    - el líder crea una consigna de lectura para su equipo, sobre "Inscripción a materias (ejemplo)";
    - el asesor de Neuquén la ve en Inicio y en Consignas, abre el artículo, toca "Ya lo leí" y la cierra como hecha;
    - el líder ve 1 de 1 hecha en el detalle;
    - `asesor2.nqn` (fuera del equipo) no la tiene.
  - **Tarea con evidencia:**
    - el coordinador de servicio crea una tarea para el subrol CEO, con evidencia obligatoria;
    - `asesor2.nqn` no puede cerrarla sin evidencia, sube una imagen y la cierra;
    - el coordinador abre la evidencia (URL firmada, respuesta 200).
  - **Admin:** filtra la lista de usuarios por rol "Líder" y ve solo a Lucía.
- [ ] **Step 2:** `npx supabase db reset && npm run e2e` → PASS (incluye los anteriores).
- [ ] **Step 3: Commit** `test(e2e): organigrama y consignas`

---

## Cierre de la Etapa 3 (demo)

- Recorrer como asesor, líder, coordinador, director y admin.
- `npm test && npx supabase test db && npm run e2e` en verde.
- Revisión final de la rama por un revisor independiente.
