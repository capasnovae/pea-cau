# Etapa 8 · Lecciones, panel y reportes — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Un tipo de ítem "lección" con bloques fijos y Probalo, los primeros borradores del curso "Reglamento esencial", y el panel de coordinación con atrasados, tasa por pregunta y CSV.

**Architecture:** La lección vive en `items.leccion` (jsonb validado en la base y en zod) con `articulo_id` como fuente; sus preguntas de Probalo son preguntas de práctica con `preguntas.item_id`. El motor de prácticas se reutiliza extrayendo la corrección a una función interna. El panel son RPCs `security definer` que filtran con `puede_ver_usuario` y una página `/equipo/panel` con exportación CSV por route handler.

**Tech Stack:** Next.js 16, TypeScript, Tailwind 4, Supabase (RLS, pgTAP), zod, vitest, Playwright.

**Spec:** `docs/superpowers/specs/2026-11-05-pea-design.md` (§4.7, §4.10, §5, §10)

## Global Constraints

- UI en español rioplatense, mobile-first, estilo B índigo. Textos mínimos: sin párrafos explicativos; los vacíos, una frase corta.
- Límites de la lección (§4.10): resumen 1–5 ítems ≤200; ejemplos 1–4 con consulta ≤200 y respuesta ≤400; ojo 0–4 ≤200; Probalo 1–3 preguntas (opcional); fuente obligatoria.
- Requisito de la lección: `ver` o `marcar_hecho`; con Probalo, `marcar_hecho` = acertar todas sus preguntas.
- Funciones `security definer` con `search_path = ''`, `revoke` de `public, anon` y `grant` explícito; escrituras sensibles solo por RPC.
- Sin datos personales de alumnos. Contenido relevado: borrador, "A validar", con fuente.
- No crear cuentas ni proyectos externos.

## Review Focus

- Un asesor (o anon) llamando a las RPCs del panel → `sin permiso` o filas vacías; nunca datos de otras sedes.
- Un líder ve solo su equipo; un coordinador, su sede y área; el director/admin, todo (regla `puede_ver_usuario`).
- CSV con nombres que empiezan con `=`, `+`, `-`, `@` o tienen comas, comillas o saltos de línea → se escapan y no se ejecutan como fórmula en Excel.
- Una lección con Probalo cuyas preguntas están archivadas o sin publicar → no queda imposible de cumplir (sin preguntas publicadas, `marcar_hecho` vuelve a ser el botón).
- Tasa por pregunta con muy pocas respuestas → no se ordena como "la peor" (mínimo 5 respuestas para el ranking).

---

### Task 1: Lección en la base y Probalo

**Files:**
- Create: `supabase/migrations/20261112000100_lecciones.sql`
- Test: `supabase/tests/34_lecciones.test.sql`

**Interfaces:**
- Produces: `tipo_item` += `'leccion'`; `items.leccion jsonb`; `preguntas.item_id uuid null references items on delete set null`; `public.leccion_valida(jsonb) returns boolean` (immutable); tabla `practica_intentos (id, usuario_id, pregunta_id, correcta, created_at)` sin escritura directa; `public.probalo_preguntas(p_item uuid)` (mismas columnas que `practica_preguntas`); `public.comprobar_probalo(p_item uuid, p_pregunta uuid, p_respuesta jsonb)` (mismas columnas que `comprobar_practica`); `item_cumplido` contempla la lección.

- [ ] **Step 1: Test pgTAP** `34_lecciones.test.sql` (escenario + escenario_cursos), con `plan` exacto:
  - `leccion_valida` acepta `{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}` y rechaza: resumen vacío, 6 ítems, un ítem de 201 caracteres, 5 ejemplos, respuesta de 401, ojo con 5, clave extra.
  - Insertar un ítem `leccion` sin `articulo_id` o con `leccion` inválida → `23514`.
  - Probalo: con 2 preguntas de práctica publicadas con `item_id` = la lección, `probalo_preguntas` devuelve 2 para un asesor que ve el curso; `comprobar_probalo` mal → `es_correcta=false` y una fila en `practica_intentos`; bien → otra fila y `practica_progreso`.
  - Una pregunta de práctica de otra lección → `comprobar_probalo` lanza `no es de esta lección`.
  - `item_cumplido` con `requisito='marcar_hecho'`: falso con 1 de 2 acertadas, verdadero con 2 de 2; si se archivan las dos preguntas, depende de `item_progreso.hecho_at`.
  - `comprobar_practica` (práctica de módulo) también escribe en `practica_intentos`.
  - El asesor no puede `insert` en `practica_intentos` (42501) y solo lee las propias.
- [ ] **Step 2:** `npx supabase test db` → FAIL (función inexistente).
- [ ] **Step 3: Migración.** `alter type ... add value 'leccion'` va sola al principio del archivo (antes de usarla, separada con `commit`-safe: usar el valor solo en funciones/constraints creadas después, como hizo `examenes.sql`). `items_por_tipo` suma `(tipo = 'leccion' and articulo_id is not null and public.leccion_valida(leccion))`. Extraer de `comprobar_practica` una interna `public.corregir_practica(p_pregunta uuid, p_respuesta jsonb) returns table (es_correcta boolean, explicacion_md text, solucion jsonb)` (sin grant) que también inserta en `practica_intentos` y en `practica_progreso` al acertar; `comprobar_practica` y `comprobar_probalo` la llaman. `probalo_preguntas` exige `item_disponible(p_item, auth.uid())` y toma preguntas `uso='practica'`, `estado='publicado'`, `item_id = p_item`, alcance global o de mi sede. `item_cumplido`: rama `tipo='leccion' and requisito='marcar_hecho' and exists(preguntas publicadas del ítem)` → todas en `practica_progreso`; si no hay preguntas publicadas, la regla normal.
- [ ] **Step 4:** `npx supabase test db` → PASS (todas).
- [ ] **Step 5: Commit** `feat(lecciones): tipo lección, Probalo y registro de intentos de práctica`.

### Task 2: Dominio de la lección

**Files:**
- Create: `lib/dominio/lecciones.ts`, `lib/dominio/lecciones.test.ts`
- Modify: `lib/dominio/esquemas-cursos.ts` (esquemaItem), `lib/dominio/esquemas-cursos.test.ts`

**Interfaces:**
- Produces: `type Leccion = { resumen: string[]; ejemplos: { consulta: string; respuesta: string }[]; ojo: string[] }`; `LIMITES_LECCION` (los valores de Global Constraints); `esquemaLeccion` (zod, trim, mensajes en castellano); `minutosDeLectura(l: Leccion): number` (palabras / 200, hacia arriba, mínimo 1); `esquemaItem` acepta `tipo: "leccion"` con `leccion` (string JSON en el formulario → `esquemaLeccion`), exige `articulo_id` ("Elegí la fuente."), solo `ver` o `marcar_hecho`, y conserva `articulo_id` y `leccion` en el transform (el resto en null).

- [ ] **Step 1: Tests:** límites exactos (5 ok / 6 no; 200 ok / 201 no; 400 ok / 401 no; 4 ejemplos ok / 5 no); trim y descartar renglones vacíos; `minutosDeLectura` de 210 palabras → 2, de 10 → 1; `esquemaItem` lección sin fuente → "Elegí la fuente."; con `requisito: "aprobar"` → error; JSON inválido → "Revisá la lección.".
- [ ] **Step 2:** `npx vitest run lib/dominio` → FAIL.
- [ ] **Step 3:** Implementar.
- [ ] **Step 4:** `npx vitest run lib/dominio` → PASS.
- [ ] **Step 5: Commit** `feat(lecciones): esquema y tiempo de lectura`.

### Task 3: Ver una lección

**Files:**
- Create: `components/leccion/vista-leccion.tsx`
- Modify: `app/(app)/estudiar/[curso]/[item]/page.tsx`, `app/(app)/estudiar/[curso]/[item]/practica.tsx`, `app/(app)/estudiar/[curso]/[item]/acciones.ts` (o donde viva `comprobar`)

**Interfaces:**
- Consumes: `Leccion`, `minutosDeLectura` (Task 2); `probalo_preguntas`, `comprobar_probalo` (Task 1).
- Produces: `<VistaLeccion leccion fuente={{ titulo, href }} minutos />` con secciones `aria-label` "En 30 segundos", "Así llega al CAU", "Ojo con" (se omite si está vacía), "Fuente". `<Practica>` recibe `origen: { tipo: "examen"; id } | { tipo: "leccion"; id }` y titula "Probalo" cuando es lección.

- [ ] **Step 1:** Rama `item.tipo === "leccion"` en la página: VistaLeccion, Probalo inline si hay preguntas, y el control de requisito existente (sin botón "hecho" si el Probalo define el cumplimiento). Ejemplo: consulta en cursiva entre comillas, respuesta debajo con "→".
- [ ] **Step 2:** `npm run typecheck && npm run lint` → sin errores. (El E2E va en Task 7.)
- [ ] **Step 3: Commit** `feat(lecciones): vista de la lección con Probalo`.

### Task 4: Editar una lección

**Files:**
- Create: `components/contenido/editor-leccion.tsx`
- Modify: `app/(app)/contenido/cursos/formularios.tsx` (tipo "Lección" primero en el select y por defecto), `app/(app)/contenido/cursos/acciones.ts`, `app/(app)/contenido/preguntas/*` (campo "Lección (Probalo)" cuando `uso = practica`), `lib/dominio/examenes.ts` (`item_id` opcional en el esquema de pregunta) y `supabase/migrations/20261112000100_lecciones.sql` solo si `guardar_pregunta` necesita aceptar `item_id`.

**Interfaces:**
- Consumes: `esquemaItem`, `LIMITES_LECCION` (Task 2).
- Produces: `<EditorLeccion inicial? />` que escribe un `<input type="hidden" name="leccion">` con el JSON; listas con "Agregar" (deshabilitado al tope) y "Quitar", contador `n/200` por campo; selector "Fuente" con los artículos visibles.

- [ ] **Step 1: Test** en `lib/dominio/examenes.test.ts`: `item_id` vacío → null; uuid → se conserva; con `uso: "examen"` se descarta.
- [ ] **Step 2:** FAIL → implementar → PASS (`npx vitest run lib/dominio`).
- [ ] **Step 3:** `npm run typecheck && npm run lint`.
- [ ] **Step 4: Commit** `feat(lecciones): editor de lección y preguntas de Probalo`.

### Task 5: Borradores de "Reglamento esencial"

**Files:**
- Create: `contenido/lecciones/*.md` (12 lecciones), `lib/lecciones/importar.ts`, `lib/lecciones/importar.test.ts`, `scripts/importar-lecciones.mts`, `supabase/seed-lecciones.sql` (generado)
- Modify: `supabase/config.toml` (`sql_paths` += `./seed-lecciones.sql`, después de `seed-relevamiento.sql`), `relevamiento/README.md` (cómo regenerar)

**Interfaces:**
- Consumes: `esquemaLeccion` (Task 2); slugs de `supabase/seed-relevamiento.sql` (`rg-…`, `ln-…`).
- Produces: `leerLeccion(ruta: string, texto: string): LeccionArchivo` con `{ slug, titulo, modulo, orden, fuente, leccion: Leccion, probalo: PreguntaProbalo[] }`; `armarSqlLecciones(l: LeccionArchivo[]): string`.

Formato del archivo:
```
---
titulo: "Cambio de modalidad"
modulo: "Trámites"
orden: 2
fuente: "rg-3-2-cambios-de-modalidad"
---
## En 30 segundos
- …
## Así llega al CAU
- "consulta" → respuesta
## Ojo con
- …
## Probalo
### unica: enunciado
- [x] correcta
- [ ] incorrecta
> explicación
```
Temas (fuente entre paréntesis; leer la fuente y no agregar nada que no diga): modalidades (3-1), cambio de modalidad (3-2), requisitos y documentación (2-2, 2-5), inscripción a materias (5-2), cambio de cátedra (5-4), equivalencias (6-1), evaluación EVA 21 (4-5), titulación (12-5), colación (12-6), normas arancelarias (14-4), becas y beneficios (14-3), solicitud de baja (14-5). Módulos: "Cursado", "Trámites", "Egreso", "Administración".

- [ ] **Step 1: Tests:** `leerLeccion` del ejemplo de arriba (bloques, `[x]` correcta, explicación); falta `## En 30 segundos` → error con la ruta; **todas** las lecciones de `contenido/lecciones` pasan `esquemaLeccion`, tienen 1–3 preguntas de Probalo con al menos una correcta, y su `fuente` existe en `relevamiento/`; `armarSqlLecciones` crea el curso `capacitacion` global en `borrador` "Reglamento esencial", módulos en borrador, ítems `leccion` con `requisito='marcar_hecho'`, preguntas `uso='practica'`, `estado='publicado'`, `item_id`, y usa `on conflict do nothing` con ids determinísticos (uuid v5 o md5 del slug).
- [ ] **Step 2:** FAIL → escribir parser y lecciones → PASS (`npx vitest run lib/lecciones`).
- [ ] **Step 3:** `node --experimental-strip-types scripts/importar-lecciones.mts` y `npx supabase db reset` → sin errores; `select count(*) from items where tipo='leccion'` = 12.
- [ ] **Step 4: Commit** `feat(lecciones): borradores de Reglamento esencial a partir del relevamiento`.

### Task 6: Panel en la base

**Files:**
- Create: `supabase/migrations/20261112000200_panel.sql`, `supabase/tests/35_panel.test.sql`

**Interfaces:**
- Produces (todas `security definer`, grant a `authenticated`, `sin permiso` si `mi_rol() = 'asesor'` o perfil inactivo):
  - `public.ruta_de(p_usuario uuid)` interna (sin grant) con las columnas de `mi_ruta()`; `mi_ruta()` pasa a `select * from ruta_de(auth.uid())`.
  - `public.panel_asesores()` → `(usuario_id, nombre, apellido, sede, equipo, puesto, nivel_actual int, cursos_total int, cursos_cumplidos int, ultima_actividad timestamptz, consignas_vencidas int, cert_vencidas int, cert_por_vencer int)` para perfiles activos con rol asesor que `puede_ver_usuario`. `ultima_actividad` = mayor de `item_progreso` (visto/hecho), `intentos.iniciado_at`, `practica_intentos.created_at`. "Por vencer" = `vence_at` dentro de 30 días.
  - `public.panel_preguntas()` → `(pregunta_id, enunciado_md, tipo, uso, categoria, modulo, respuestas int, aciertos int)` sobre usuarios visibles: exámenes = `intento_preguntas` de intentos cerrados (sin respuesta cuenta como error; `libre` se excluye); prácticas = `practica_intentos`. Sin columnas de respuesta correcta.
  - `public.panel_correccion()` → `(sede, pendientes int, tomados int, vencidos int)`; vencido = entregado hace más de 72 h y sin cerrar; sedes que el usuario puede ver.

- [ ] **Step 1: Test pgTAP** con `plan` exacto: asesor → `sin permiso` en las tres; anon sin `execute`; líder ve solo su equipo; coordinador su sede y área; admin todo; `ultima_actividad` toma el `practica_intentos` más reciente; consigna vencida y certificación por vencer cuentan; una pregunta respondida 2 veces bien y 1 mal (más 1 sin responder) → `respuestas=4, aciertos=2`; `mi_ruta()` igual que antes (re-correr 19_mi_ruta).
- [ ] **Step 2:** FAIL → migración → PASS (`npx supabase test db`).
- [ ] **Step 3: Commit** `feat(panel): RPCs de progreso, atrasados, tasa por pregunta y cola`.

### Task 7: Dominio y página del panel, CSV y E2E

**Files:**
- Create: `lib/dominio/panel.ts`, `lib/dominio/panel.test.ts`, `app/(app)/equipo/panel/page.tsx`, `app/(app)/equipo/panel/csv/[tabla]/route.ts`
- Modify: `app/(app)/equipo/pestanas.tsx` ("Panel" primero), `lib/dominio/roles.ts` (`MENU_EQUIPO.href = "/equipo/panel"`), `supabase/seed.sql` (actividad de ejemplo: un asesor sin actividad hace 20 días, intentos de práctica), `e2e/panel.spec.ts`, `e2e/estudiar.spec.ts` (lección)

**Interfaces:**
- Consumes: RPCs de Task 6, `VistaLeccion` (Task 3).
- Produces: `motivosAtraso(f: FilaAsesor, ahora: Date, dias = 14): string[]` ("Sin actividad hace N días", "N consignas vencidas", "Certificación vencida", "Vence pronto"); `tasa(aciertos, respuestas): number | null` (null con 0); `rankingPreguntas(filas, minimo = 5)` (ascendente por tasa, solo con ≥ mínimo); `porCategoria(filas)`; `aCsv(columnas: { clave; titulo }[], filas): string` (BOM, `;` como separador para Excel en es-AR, comillas dobles escapadas, celdas que empiezan con `= + - @` prefijadas con `'`).

- [ ] **Step 1: Tests unitarios** de cada función, incluidos `aCsv` con `=SUMA(1)`, `"a;b"`, salto de línea y `null`; `tasa(0,0)` null; ranking ignora preguntas con 4 respuestas.
- [ ] **Step 2:** FAIL → implementar → PASS.
- [ ] **Step 3: Página** `/equipo/panel` (`requerirRol` líder o superior): tarjetas (asesores, atrasados, tasa general, por corregir), lista "Asesores" con filtro "Solo atrasados" (searchParam `atrasados=1`), "Preguntas a revisar" (ranking, 10), "Por categoría", "Cola de corrección"; cada sección con enlace "CSV" a `/equipo/panel/csv/{asesores|preguntas|categorias|correccion}`. Route handler: sesión + mismo RPC (decide la RLS), `text/csv; charset=utf-8`, `attachment; filename="panel-<tabla>-<fecha>.csv"`, `private, no-store`, tabla desconocida → 404.
- [ ] **Step 4: E2E** `panel.spec.ts`: el coordinador ve al asesor inactivo con "Sin actividad", filtra atrasados, descarga el CSV de asesores (status 200, contiene el encabezado y el nombre); un asesor recibe 404 en `/equipo/panel` y en el CSV. En `estudiar.spec.ts`: el coordinador publica "Reglamento esencial" (o el seed lo deja publicado solo para E2E vía una lección de ejemplo en el Nivel 2 de ejemplo), el asesor abre una lección, ve "En 30 segundos", responde mal y bien el Probalo y el paso queda cumplido.
- [ ] **Step 5:** `npm run typecheck && npm run lint && npm test`, `npx supabase db reset && npx supabase test db`, `PEA_E2E_PUERTO=3000 npx playwright test --trace off` → todo verde.
- [ ] **Step 6: Commit** `feat(panel): panel de coordinación con CSV y E2E de lecciones`.
