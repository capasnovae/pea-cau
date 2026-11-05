# PEA · Etapa 2 (Repositorio) — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** La base de conocimiento y la biblioteca de recursos de PEA: categorías, artículos en Markdown con jerarquía y versiones, recursos (archivos, videos, presentaciones, enlaces) agrupables por campaña, vigencias, buscador full text, contenido global o de sede y promoción de sede a global.

**Architecture:** Igual que la Etapa 1: la autorización vive en Postgres (RLS + funciones `security definer`), probada con pgTAP; la app Next.js lee con el cliente del usuario. Los archivos van a un bucket privado de Storage con políticas por carpeta (`global/…` o `<sede_id>/…`) y se sirven con URLs firmadas. La búsqueda es una RPC `security invoker` sobre columnas `tsvector` (español + unaccent), así respeta la RLS de quien busca.

**Tech Stack:** lo de la Etapa 1 + `react-markdown` y `remark-gfm` (render seguro: sin HTML crudo), Supabase Storage.

**Spec:** `docs/superpowers/specs/2026-11-05-pea-design.md` §4.1, §5.3 ("Repositorio") y §6 (fila de artículos, recursos y campañas).

## Global Constraints

- Todo lo de la Etapa 1 sigue valiendo (español rioplatense, mobile-first, snake_case en SQL, funciones auxiliares `security definer stable set search_path = ''`, service role solo en el servidor).
- Alcance: `global` lo crea y edita solo el admin. `sede` lo crean y editan el coordinador **de esa sede** y el director (cualquier sede). Solo el admin promueve sede → global, conservando autor, sede de origen (`sede_origen_id`), `promovido_por` y `promovido_at`.
- Check en todas las tablas con alcance: `alcance = 'sede'` ⇔ `sede_id is not null`.
- Lectura: un usuario activo ve lo **publicado** que sea global o de su sede. Los editores ven además los borradores y archivados que pueden editar.
- Vigencia: lo vencido (`vigente_hasta < current_date`) no aparece en listados ni búsqueda general; sigue visible para editores y por enlace directo con el cartel "Vencido".
- Aviso "Nueva versión": artículo con `version > 1` actualizado en los últimos 14 días.
- Categorías iniciales (seed, slugs fijos): `institucional`, `reglamento`, `plataformas`, `oferta-academica`, `modalidades`, `tramites`, `aranceles-y-pagos`, `ventas-y-asesoramiento`, `campanas-y-piezas`, `atencion-y-derivaciones`, con los nombres y descripciones de la tabla de la spec §4.1.
- Archivos: bucket privado `recursos`, máximo 50 MB por archivo, tipos permitidos: imágenes (png, jpg, webp, gif), pdf, pptx, docx, xlsx, mp4. Videos largos van por URL (YouTube o Vimeo).
- Markdown: no se renderiza HTML crudo; los enlaces externos abren en pestaña nueva con `rel="noopener noreferrer"`.
- No se cargan datos reales de Siglo en el seed: solo artículos de ejemplo marcados "(ejemplo)". El contenido real llega con el relevamiento.

## Review Focus

1. **Asesor de otra sede:** un asesor de Roca no debe ver, por ninguna vía (listado, búsqueda, enlace directo, URL firmada), un artículo o recurso de sede de Neuquén. (Tests en Tasks 2, 3, 4.)
2. **Borrador filtrado:** un artículo en borrador no aparece para asesores, ni siquiera en la búsqueda. (Tests en Tasks 2 y 3.)
3. **Coordinador fuera de su alcance:** un coordinador no puede crear contenido global, ni contenido de otra sede, ni editar uno global, ni promover. (Test en Task 2.)
4. **Archivo subido a la carpeta equivocada:** un coordinador de Neuquén que sube a `global/` o a la carpeta de Roca es rechazado. (Test en Task 4.)
5. **Búsqueda con acentos y operadores:** "inscripcion" encuentra "Inscripción"; una consulta con comillas o caracteres raros no rompe la RPC. (Test en Task 3.)

---

## File Structure

```
supabase/migrations/
  20261106000100_repositorio.sql          → tablas, checks, triggers de versión, seed de categorías
  20261106000200_rls_repositorio.sql      → funciones de alcance + políticas + promover_contenido()
  20261106000300_busqueda.sql             → f_unaccent, tsvector, buscar_contenido()
  20261106000400_storage_recursos.sql     → bucket y políticas de storage.objects
supabase/seed.sql                          → (modificar) artículos y recursos de ejemplo
supabase/tests/06_repositorio_esquema.test.sql, 07_repositorio_rls.test.sql,
               08_busqueda.test.sql, 09_storage.test.sql
lib/dominio/contenido.ts (+ .test.ts)      → slug, vigencia, nueva versión, rutas de archivo
lib/dominio/esquemas-contenido.ts (+ .test.ts) → zod de artículo, recurso, campaña
lib/dominio/roles.ts (+ test)              → (modificar) menú con Repositorio, Recursos, Contenido
components/markdown.tsx                    → render seguro
app/(app)/repositorio/page.tsx, [categoria]/page.tsx, [categoria]/[slug]/page.tsx
app/(app)/recursos/page.tsx
app/(app)/buscar/page.tsx
app/(app)/contenido/…                      → gestión (editores): artículos, recursos, campañas
e2e/repositorio.spec.ts
```

---

### Task 1: Esquema del repositorio y categorías

**Files:**
- Create: `supabase/migrations/20261106000100_repositorio.sql`, `supabase/tests/06_repositorio_esquema.test.sql`

**Interfaces:**
- Produces: enums `alcance (global|sede)`, `estado_contenido (borrador|publicado|archivado)`, `tipo_recurso (imagen|video|pdf|presentacion|enlace|otro)`; tablas de la spec §5.3, más `sede_origen_id uuid null` en `articulos`, `recursos` y `campanas`, `updated_at` y `tocar_updated_at`. Además:
  - `articulos`: `unique (categoria_id, slug)`. Check de alcance. `padre_id` debe ser de la misma categoría (trigger `validar_padre_articulo`, error `'integridad: el artículo padre es de otra categoría'`).
  - `articulo_versiones`: el trigger `versionar_articulo` (before update on `articulos`): si cambian `titulo` o `cuerpo_md`, guarda la versión **anterior** en `articulo_versiones` y hace `new.version := old.version + 1`. El `resumen_cambio` sale de una columna transitoria `articulos.ultimo_cambio text`, que se limpia después de guardar.
  - `recursos`: check `archivo_path is not null or url_externa is not null`.
  - Seed de las 10 categorías dentro de la migración (son datos de referencia, no de desarrollo).

- [ ] **Step 1: Test que falla** `06_repositorio_esquema.test.sql`: `has_table` para las 5 tablas; `enum_has_labels` de los 3 enums; `is((select count(*) from categorias), 10)`; `throws_ok` al insertar un artículo `alcance='sede'` sin `sede_id` (23514); `throws_ok` al insertar un recurso sin archivo ni URL (23514); actualizar el `cuerpo_md` de un artículo → `version = 2` y una fila en `articulo_versiones` con `version = 1` y el cuerpo anterior; actualizar solo `orden` → la versión no cambia.
- [ ] **Step 2:** `npx supabase test db` → FAIL.
- [ ] **Step 3:** Escribir la migración.
- [ ] **Step 4:** `npx supabase db reset && npx supabase test db` → PASS.
- [ ] **Step 5: Commit** `feat(db): esquema del repositorio y categorías`

---

### Task 2: Alcance, RLS y promoción

**Files:**
- Create: `supabase/migrations/20261106000200_rls_repositorio.sql`, `supabase/tests/07_repositorio_rls.test.sql`
- Modify: `supabase/tests/00_ayudantes.sql` (agrega `tests.contenido(titulo, alcance, sede, estado) returns uuid`, que crea un artículo en la categoría `reglamento`)

**Interfaces:**
- Produces (`security definer stable set search_path = ''`, `grant execute to authenticated`):
  - `puede_editar_contenido(p_alcance alcance, p_sede uuid) returns boolean`: admin siempre; director si `p_alcance='sede'`; coordinador si `p_alcance='sede' and p_sede = mi_sede()`.
  - `puede_leer_contenido(p_alcance alcance, p_sede uuid, p_estado estado_contenido) returns boolean`: `puede_editar_contenido(...)` o (`mi_perfil_activo()` y `p_estado='publicado'` y (`p_alcance='global'` o `p_sede = mi_sede()`)).
  - Políticas en `articulos`, `recursos` y `campanas`: `select using (puede_leer_contenido(alcance, sede_id, estado))`; `insert/update/delete` con `using` y `with check (puede_editar_contenido(alcance, sede_id))`. `articulo_versiones`: `select` si se puede leer el artículo; sin escritura directa. `categorias`: lectura para activos, escritura admin. `anon` sin grants.
  - Trigger `fijar_autoria_contenido` (before insert): `autor_id := auth.uid()` si hay usuario; `sede_origen_id := sede_id`.
  - `promover_contenido(p_tabla text, p_id uuid) returns void` (`security definer`): solo admin (si no, `'no_autorizado: solo el admin promueve'`); `p_tabla in ('articulos','recursos','campanas')`; pone `alcance='global'`, `sede_id=null`, `promovido_por=auth.uid()`, `promovido_at=now()`; escribe `auditoria` con `accion='promover'`.

- [ ] **Step 1: Test que falla** `07_repositorio_rls.test.sql` (escenario de la Etapa 1 + contenidos: G publicado global, N publicado de T-Neuquén, NB borrador de T-Neuquén, R publicado de T-Roca):
  - como `ase1` (Neuquén): ve G y N, no ve NB ni R (`results_eq` sobre los títulos).
  - como `aseR` (Roca): ve G y R; `is_empty` al pedir N por id.
  - como `coordS`: ve NB; `lives_ok` crear un artículo de sede T-Neuquén; `throws_ok` (42501) crear uno global; `throws_ok` (42501) crear uno de T-Roca; editar G afecta 0 filas; `throws_ok` `promover_contenido('articulos', N)` con `'no_autorizado: solo el admin promueve'`.
  - como `dir`: `lives_ok` crear un artículo de sede T-Roca; `throws_ok` (42501) crear uno global.
  - como `adm`: `lives_ok` promover N → después `ase1` y `aseR` lo ven, y `sede_origen_id` sigue siendo T-Neuquén.
  - como `aseInactivo`: no ve G.
  - como anon: `throws_ok` (42501) al leer `articulos`.
- [ ] **Step 2:** FAIL. **Step 3:** migración. **Step 4:** `db reset && test db` → PASS.
- [ ] **Step 5: Commit** `feat(db): alcance, RLS y promoción del repositorio`

---

### Task 3: Búsqueda full text

**Files:**
- Create: `supabase/migrations/20261106000300_busqueda.sql`, `supabase/tests/08_busqueda.test.sql`

**Interfaces:**
- Produces:
  - `create extension if not exists unaccent with schema extensions`; `public.f_unaccent(text) returns text immutable` (envoltorio de `extensions.unaccent('extensions.unaccent', $1)`).
  - Columnas generadas `busqueda tsvector` en `articulos` (titulo A, resumen B, cuerpo_md C) y en `recursos` (titulo A, descripcion B, etiquetas B), con `to_tsvector('spanish', f_unaccent(...))`, más índices GIN.
  - `buscar_contenido(q text, p_limite int default 20) returns table(tipo text, id uuid, titulo text, resumen text, categoria_slug text, slug text, rango real)`. Es `security invoker`, así respeta la RLS. Usa `websearch_to_tsquery('spanish', f_unaccent(q))`, excluye vencidos (`vigente_hasta < current_date`) y no publicados, y ordena por `ts_rank` descendente. Con `q` vacío o de solo espacios devuelve 0 filas.

- [ ] **Step 1: Test que falla** `08_busqueda.test.sql`: artículo publicado global "Inscripción a materias" y recurso publicado global "Folleto de becas" con etiqueta `becas`; artículo de sede Roca "Inscripción Roca"; artículo en borrador "Inscripción borrador"; recurso vencido "Becas 2020".
  - como `ase1`: `buscar_contenido('inscripcion')` devuelve exactamente "Inscripción a materias"; `buscar_contenido('becas')` devuelve "Folleto de becas" y no el vencido.
  - `lives_ok` con `buscar_contenido('"inscrip OR ) (')`.
  - `is_empty` con `buscar_contenido('   ')`.
  - como `aseR`: `buscar_contenido('inscripcion')` incluye "Inscripción Roca".
- [ ] **Step 2:** FAIL. **Step 3:** migración. **Step 4:** PASS.
- [ ] **Step 5: Commit** `feat(db): búsqueda full text del repositorio`

---

### Task 4: Storage de recursos

**Files:**
- Create: `supabase/migrations/20261106000400_storage_recursos.sql`, `supabase/tests/09_storage.test.sql`

**Interfaces:**
- Produces:
  - Bucket `recursos` (`public=false`, `file_size_limit=52428800`, `allowed_mime_types` según las Global Constraints).
  - Convención de ruta: `<carpeta>/<uuid>-<nombre-slug>.<ext>`, donde `<carpeta>` es `global` o el `sede_id`.
  - `carpeta_alcance(p_nombre text) returns table(alcance alcance, sede_id uuid)`: interpreta el primer segmento de la ruta.
  - Políticas sobre `storage.objects` para `bucket_id='recursos'`:
    - `select`: el usuario está activo y la carpeta es `global` o su sede, o puede editar ese alcance.
    - `insert`, `update` y `delete`: `puede_editar_contenido` de la carpeta.

- [ ] **Step 1: Test que falla** `09_storage.test.sql` (inserta directamente en `storage.objects`, como hace la API):
  - como `coordS`: `lives_ok` insertar `<id T-Neuquén>/a.pdf`; `throws_ok` (42501) insertar `global/b.pdf` y `<id T-Roca>/c.pdf`.
  - como `aseR`: no ve el objeto `<id T-Neuquén>/a.pdf`.
  - como `ase1`: lo ve.
  - como `adm`: `lives_ok` insertar `global/d.pdf`.
- [ ] **Step 2:** FAIL. **Step 3:** migración. **Step 4:** PASS (correr también `npx supabase db lint`).
- [ ] **Step 5: Commit** `feat(db): bucket de recursos con políticas por carpeta`

---

### Task 5: Dominio de contenido (lógica pura)

**Files:**
- Create: `lib/dominio/contenido.ts`, `lib/dominio/contenido.test.ts`, `lib/dominio/esquemas-contenido.ts`, `lib/dominio/esquemas-contenido.test.ts`

**Interfaces:**
- Produces:
  - `slugificar(texto: string): string`: minúsculas, sin acentos, guiones, máximo 80 caracteres, sin guiones al principio ni al final.
  - `estaVencido(vigenteHasta: string | null, hoy?: Date): boolean`.
  - `esNuevaVersion(version: number, updatedAt: string, hoy?: Date): boolean`: `version > 1` y menos de 14 días.
  - `rutaArchivo(carpeta: string, nombreOriginal: string, id: string): string`, que arma `<carpeta>/<id>-<slug>.<ext>`.
  - `esquemaArticulo` (zod): `titulo` 1–160, `slug` opcional (si falta, sale del título), `categoria_id` uuid, `padre_id` uuid|null, `resumen` ≤ 300, `cuerpo_md` ≤ 100 000, `alcance`, `sede_id` (obligatorio si el alcance es `sede`), `estado`, `vigente_desde`/`vigente_hasta` (fecha o null, hasta ≥ desde), `fuente_url` (url o null), `ultimo_cambio` ≤ 200.
  - `esquemaRecurso`: `titulo`, `descripcion` ≤ 500, `tipo`, `categoria_id`, `campana_id`, `etiquetas` (texto separado por comas → array sin vacíos, en minúsculas), `url_externa` (http/https), alcance y sede como en el artículo, `vigente_hasta`. Refinamiento: si `tipo='enlace'` o `tipo='video'` sin archivo, `url_externa` es obligatoria.
  - `esquemaCampana`: `nombre`, `descripcion_md`, `vigente_desde`, `vigente_hasta` (hasta ≥ desde), alcance y sede.

- [ ] **Step 1: Tests que fallan**:

```ts
expect(slugificar("  Inscripción a Materias 2027! ")).toBe("inscripcion-a-materias-2027")
expect(estaVencido("2020-01-01", new Date("2026-11-06"))).toBe(true)
expect(estaVencido(null)).toBe(false)
expect(esNuevaVersion(2, "2026-11-01T10:00:00Z", new Date("2026-11-06"))).toBe(true)
expect(esNuevaVersion(1, "2026-11-05T10:00:00Z", new Date("2026-11-06"))).toBe(false)
expect(esNuevaVersion(3, "2026-10-01T10:00:00Z", new Date("2026-11-06"))).toBe(false)
expect(rutaArchivo("global", "Folleto Becas.PDF", "abc")).toBe("global/abc-folleto-becas.pdf")
expect(esquemaArticulo.safeParse({ ...art, alcance: "sede", sede_id: null }).success).toBe(false)
expect(esquemaArticulo.safeParse({ ...art, vigente_desde: "2027-01-01", vigente_hasta: "2026-01-01" }).success).toBe(false)
expect(esquemaRecurso.safeParse({ ...rec, tipo: "enlace", url_externa: "" }).success).toBe(false)
expect(esquemaRecurso.parse({ ...rec, etiquetas: "Becas, , Descuentos " }).etiquetas).toEqual(["becas", "descuentos"])
```

- [ ] **Step 2:** `npm test` → FAIL. **Step 3:** implementar. **Step 4:** PASS.
- [ ] **Step 5: Commit** `feat(dominio): slug, vigencias y esquemas de contenido`

---

### Task 6: Lectura del repositorio

**Files:**
- Create: `components/markdown.tsx`, `app/(app)/repositorio/page.tsx`, `app/(app)/repositorio/[categoria]/page.tsx`, `app/(app)/repositorio/[categoria]/[slug]/page.tsx`
- Modify: `lib/dominio/roles.ts`, `lib/dominio/roles.test.ts`, `supabase/seed.sql`

**Interfaces:**
- Consumes: Tasks 1–3 y 5.
- `menuPorRol`: asesor y líder → Inicio, Repositorio, Recursos, Buscar, Mi perfil. Coordinador y director → lo mismo + Contenido (`/contenido`). Admin → lo de coordinador + Usuarios, Sedes, Equipos. En la barra inferior del celular se muestran como máximo 5 ítems; el resto va a un menú "Más" (`MenuPrincipal` recibe `maxInferior=4`).
- `Markdown({ texto }: { texto: string })`: `react-markdown` + `remark-gfm`, sin `rehype-raw`, con estilos de tipografía legibles en celular.

- [ ] **Step 1: Test que falla** en `roles.test.ts`: los `href` esperados de `asesor`, `coordinador` y `admin` según lo anterior.
- [ ] **Step 2:** FAIL. **Step 3:** actualizar `menuPorRol` y `MenuPrincipal` (con "Más").
- [ ] **Step 4:** Páginas:
  - **`/repositorio`:** grilla de las 10 categorías, con la cantidad de artículos visibles de cada una.
  - **`/repositorio/[categoria]`:** árbol de artículos (padre → hijos), con badges "Nueva versión", "De tu sede" y "Vencido". Si la categoría no existe, `notFound()`.
  - **`/repositorio/[categoria]/[slug]`:**
    - título, resumen, cuerpo renderizado, índice de los hijos y "Volver";
    - pie con "Versión N · actualizado el dd/mm/aaaa", más el link a la fuente si hay;
    - cartel "Este contenido venció el dd/mm/aaaa" si corresponde;
    - si no existe o no es visible para el usuario, 404.
  - **Seed:** 3 artículos de ejemplo globales (Reglamento › "Inscripción a materias (ejemplo)" con dos secciones hijas; Plataformas › "Portal de estudiantes (ejemplo)") y uno de sede Neuquén.
- [ ] **Step 5:** `npm test && npm run typecheck && npm run build` → PASS.
- [ ] **Step 6: Commit** `feat(repositorio): lectura por categoría y artículo`

---

### Task 7: Biblioteca de recursos y buscador

**Files:**
- Create: `app/(app)/recursos/page.tsx`, `app/(app)/recursos/acciones.ts`, `app/(app)/buscar/page.tsx`
- Modify: `supabase/seed.sql`

**Interfaces:**
- Produces: `obtenerUrlDescarga(recursoId: string): Promise<{ ok: true; url: string } | { ok: false; error: string }>`. Lee el recurso con el cliente del usuario (si la RLS no lo devuelve, responde "No encontramos ese recurso.") y firma la ruta por 10 minutos con el mismo cliente, así Storage aplica su política.

- [ ] **Step 1:** **`/recursos`:**
  - filtros por categoría, tipo y campaña (query params) y búsqueda dentro de la biblioteca;
  - tarjetas con tipo, título, etiquetas, campaña y vigencia;
  - botón "Descargar" (archivo) o "Abrir" (enlace o video externo);
  - los vencidos no se listan;
  - estado vacío: "No hay recursos con esos filtros."
- [ ] **Step 2:** **`/buscar?q=`:** formulario y resultados de `buscar_contenido`, agrupados en Artículos y Recursos, con el texto "No encontramos nada para «q». Probá con otras palabras." cuando no hay resultados. El header de la app suma un acceso rápido a buscar.
- [ ] **Step 3:** Seed: una campaña de ejemplo vigente con 2 recursos de tipo enlace (sin archivos binarios en el seed).
- [ ] **Step 4:** `npm run typecheck && npm run build` → PASS.
- [ ] **Step 5: Commit** `feat(repositorio): biblioteca de recursos y buscador`

---

### Task 8: Gestión de contenido (editores)

**Files:**
- Create: `app/(app)/contenido/page.tsx`, `app/(app)/contenido/articulos/[id]/page.tsx` (con `nuevo`), `app/(app)/contenido/recursos/[id]/page.tsx`, `app/(app)/contenido/campanas/page.tsx`, `app/(app)/contenido/acciones.ts`, y formularios cliente

**Interfaces:**
- Consumes: esquemas de la Task 5, `rutaArchivo`, `promover_contenido`.
- Produces (Server Actions, todas con `requerirRol(["coordinador","director","admin"])` y escritura **con el cliente del usuario**, así la RLS decide): `guardarArticulo`, `guardarRecurso` (sube el archivo con el cliente del usuario a `rutaArchivo(carpeta, ...)` y, si la fila falla, borra el archivo subido), `guardarCampana`, `cambiarEstadoContenido(tabla, id, estado)`, `promover(tabla, id)` (solo admin; llama a la RPC).
- Mensajes: 42501 o 0 filas → "No tenés permiso para hacer esto."; 23505 → "Ya hay un artículo con ese slug en la categoría."; el resto → "No pudimos guardar. Probá de nuevo."

- [ ] **Step 1:** **`/contenido`:** tabs Artículos, Recursos y Campañas, con lo que el usuario puede editar (filtros por estado y alcance) y el botón "Nuevo". Los editores de sede solo ven el selector de su sede (el director, todas). El alcance global solo aparece para el admin.
- [ ] **Step 2:** **Editor de artículo:** título, slug (autocompletado desde el título, editable), categoría, artículo padre (solo de la misma categoría), resumen, cuerpo en un textarea con pestaña "Vista previa" (usa `Markdown`), vigencias, fuente, "¿Qué cambió?" (`ultimo_cambio`, visible al editar), estado y alcance. Al guardar una edición, se muestra el historial de versiones (número, fecha, autor, resumen del cambio).
- [ ] **Step 3:** Editor de recurso con subida de archivo (valida tipo y tamaño en el cliente con los mismos límites del bucket) y editor de campañas.
- [ ] **Step 4:** Botón "Promover a todos los CAU" (solo admin, solo en contenido de sede), con confirmación.
- [ ] **Step 5:** `npm run typecheck && npm run lint && npm run build` → PASS.
- [ ] **Step 6: Commit** `feat(contenido): gestión de artículos, recursos y campañas`

---

### Task 9: E2E del repositorio

**Files:**
- Create: `e2e/repositorio.spec.ts`

- [ ] **Step 1: Tests**:
  - **El asesor de Neuquén:** entra a Repositorio › Reglamento, abre "Inscripción a materias (ejemplo)" y ve sus secciones hijas. Busca "inscripcion" y la encuentra. No ve el artículo de sede de Roca (404 por URL directa).
  - **El coordinador de Neuquén:**
    - crea un artículo de sede en borrador;
    - el asesor de Neuquén no lo ve;
    - lo publica y el asesor de Neuquén sí lo ve, con el badge "De tu sede";
    - el asesor de Roca no lo ve.
  - **El coordinador:** edita ese artículo con "¿Qué cambió?" y aparece la versión 2 en el historial y el badge "Nueva versión".
  - **El coordinador:** sube un PDF chico de ejemplo (generado en el test) a la biblioteca de su sede. El asesor de Neuquén lo descarga (respuesta 200 de la URL firmada).
  - **El admin:** promueve el artículo y el asesor de Roca pasa a verlo.
- [ ] **Step 2:** `npx supabase db reset && npm run e2e` → PASS (incluye los 7 de la Etapa 1).
- [ ] **Step 3: Commit** `test(e2e): repositorio por alcance, versiones, recursos y promoción`

---

## Cierre de la Etapa 2 (demo)

- `npx supabase db reset && npm run dev`: recorrer el repositorio como asesor de Neuquén, de Roca, coordinador y admin.
- `npm test && npx supabase test db && npm run e2e` en verde.
- Revisión final de la rama por un revisor independiente, como en la Etapa 1.
