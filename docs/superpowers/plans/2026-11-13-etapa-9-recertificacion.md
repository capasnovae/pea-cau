# Etapa 9 · Recertificación, actualizaciones y alertas — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Que las certificaciones venzan y se recertifiquen solas, que los cambios de contenido obligatorios lleguen a quien corresponde con su mini examen, y que todo eso se avise en la app (y quede listo para email).

**Architecture:** Una tabla `alertas` con deduplicación por clave, escrita solo por funciones internas. Un `job_diario()` (pg_cron) reúne consignas, vencimientos, avisos de 30/7 días, actualizaciones vencidas y correcciones atrasadas. Las insignias pasan a calcularse con una sola función (`sincronizar_insignias_de`) que mira certificación efectiva y actualizaciones vencidas. Las actualizaciones obligatorias reutilizan el motor de exámenes con un tipo nuevo `actualizacion`.

**Tech Stack:** Next.js 16, TypeScript, Tailwind 4, Supabase (RLS, pg_cron, pgTAP), zod, vitest, Playwright.

**Spec:** `docs/superpowers/specs/2026-11-05-pea-design.md` (§4.6, §5 "Certificación y recertificación", §10 etapa 9)

## Global Constraints

- UI en español rioplatense, mobile-first, textos mínimos (vacíos: una frase).
- Funciones `security definer` con `search_path = ''`; tablas nuevas escritas solo por RPC o funciones internas; `revoke` explícito a `anon`.
- Avisos a 30 y 7 días antes de vencer; al vencer: certificación `vencida`, insignia perdida, "a recertificar" en el panel; el reexamen es el final del nivel.
- Actualización obligatoria: la marca el admin al publicar una versión de artículo o un módulo, con mini examen opcional y plazo en días; se asigna a quienes ya habían cumplido ese contenido; si vence, pierde la insignia del nivel hasta completarla.
- Correcciones: avisar al coordinador del área las que pasaron 72 h.
- Email: solo preferencia y bandeja de salida; el envío real queda para cuando existan las cuentas (sin proveedor ni secretos en esta etapa).
- Sin datos de alumnos.

## Review Focus

- El job corre dos veces el mismo día → no duplica alertas ni asignaciones (claves de deduplicación).
- Un asesor que recertifica (aprueba el final otra vez) con la vieja certificación vencida → se emite una nueva y recupera la insignia; si aún tiene una actualización vencida del nivel, la insignia sigue perdida.
- Un asesor intenta leer o marcar alertas o asignaciones de otro → no puede (RLS y RPC).
- Una actualización sobre contenido que nadie cumplió → no asigna a nadie y no falla.
- El mini examen de una actualización solo lo rinde quien la tiene asignada y pendiente.

---

### Task 1: Etiqueta del requisito con Probalo

**Files:** Modify `lib/dominio/leccion.ts` (`etiquetaRequisito`), `lib/dominio/leccion.test.ts`, `app/(app)/estudiar/[curso]/page.tsx`, `supabase/migrations/20261113000050_estado_curso_probalo.sql` (si `estado_curso` necesita devolver `con_probalo`).

**Interfaces:** Produces `etiquetaRequisito(requisito: RequisitoItem, conProbalo: boolean): string` → "Completar el Probalo" cuando es lección con Probalo y requisito `marcar_hecho`.

- [ ] Test: con Probalo → "Completar el Probalo"; sin Probalo → la etiqueta actual. FAIL → implementar → PASS.
- [ ] `estado_curso` devuelve `con_probalo boolean` (pgTAP en 38) y la página la usa.
- [ ] Commit `fix(lecciones): etiqueta del requisito con Probalo`.

### Task 2: Alertas

**Files:** Create `supabase/migrations/20261113000100_alertas.sql`, `supabase/tests/38_alertas.test.sql`, `app/(app)/avisos/page.tsx`, `components/nav/campana.tsx`; Modify `components/nav/barra-lateral.tsx` y el encabezado mobile, `app/(app)/perfil/page.tsx` (preferencia de email), `lib/dominio/roles.ts` si hace falta.

**Interfaces:** Produces tabla `alertas (id, usuario_id, tipo text, titulo, mensaje, enlace null, clave text, leida_at null, email_pendiente boolean, created_at, unique (usuario_id, clave))`; `perfiles.avisos_email boolean default false`; interna `crear_alerta(p_usuario uuid, p_tipo text, p_titulo text, p_mensaje text, p_enlace text, p_clave text) returns boolean` (false si ya existía); RPCs `mis_alertas()`, `alertas_sin_leer() returns int`, `marcar_alertas_leidas(p_ids uuid[])`.

- [ ] pgTAP: crear dos veces con la misma clave → una fila; el dueño lee las suyas y otro no; `marcar_alertas_leidas` con ids ajenos no toca nada; `email_pendiente` es true solo si el perfil tiene `avisos_email`; anon sin execute; `crear_alerta` sin grant.
- [ ] FAIL → migración → PASS.
- [ ] UI: campana con contador en la barra (y en mobile), página `/avisos` (lista, "Marcar todo como leído", vacío "Sin avisos."), interruptor "Avisos por email" en Perfil.
- [ ] Commit `feat(alertas): avisos en la app con deduplicación y preferencia de email`.

### Task 3: Vencimiento y recertificación

**Files:** Create `supabase/migrations/20261113000200_recertificacion.sql`, `supabase/tests/39_recertificacion.test.sql`.

**Interfaces:** Produces `sincronizar_insignias_de(p_usuario uuid)` (insignia activa ⇔ certificación del curso con `estado_efectivo = 'vigente'` y sin asignación de actualización `vencida` en ese nivel; el trigger de certificaciones la llama); `procesar_recertificacion(p_ahora timestamptz default now()) returns jsonb` (vence certificaciones, alerta "venció", alertas `vence30:<id>` y `vence7:<id>`); `aplicar_efectos` emite una certificación nueva si la anterior no está efectivamente vigente.

- [ ] pgTAP: cert con `vence_at` en 20 días → alerta de 30 días una sola vez aunque corra dos veces; en 5 días → alerta de 7; vencida → estado `vencida`, insignia perdida, alerta con enlace al final del nivel; reaprobar el final (intento cerrado aprobado) → certificación nueva vigente e insignia recuperada; nivel sin vigencia (`vence_at` null) → nunca vence.
- [ ] FAIL → migración → PASS.
- [ ] Commit `feat(recertificacion): vencimientos, avisos de 30/7 días y reexamen`.

### Task 4: Actualizaciones obligatorias

**Files:** Create `supabase/migrations/20261113000250_tipo_actualizacion.sql` (solo el valor del enum), `supabase/migrations/20261113000300_actualizaciones.sql`, `supabase/tests/40_actualizaciones.test.sql`, `lib/dominio/actualizaciones.ts` (+ test), `app/(app)/actualizaciones/page.tsx`, `app/(app)/actualizaciones/[id]/page.tsx`, `app/(app)/actualizaciones/acciones.ts`, `app/(app)/contenido/actualizaciones/page.tsx` (admin: listar y publicar).

**Interfaces:** Produces `tipo_examen` += `actualizacion` (pozo por `modulo_id` o `categoria_id`, como módulo/categoría); tablas `actualizaciones (id, titulo, descripcion_md, articulo_id null, articulo_version_id null, modulo_id null, examen_id null, plazo_dias int 1..90, publicada_por, publicada_at)` y `actualizacion_asignaciones (id, actualizacion_id, usuario_id, vence_at, leida_at, aprobada_at, estado enum pendiente|cumplida|vencida, unique (actualizacion_id, usuario_id))`; RPCs `publicar_actualizacion(p jsonb) returns uuid` (solo admin; asigna a asesores activos que tienen cumplido algún paso que usa ese artículo —tipo artículo o lección con esa fuente— o ese módulo; devuelve el id), `mis_actualizaciones()`, `marcar_actualizacion_leida(p_asignacion uuid)`; `puede_rendir` permite un examen `actualizacion` solo a quien tiene asignación pendiente; aprobar el intento la cumple (y vuelve a sincronizar insignias). `esquemaActualizacion` (zod: título 1–160, plazo 1–90, artículo o módulo obligatorio).

- [ ] Tests unitarios del esquema; pgTAP: asigna solo a quienes cumplieron ese contenido (y a nadie si nadie lo cumplió, sin error); solo admin publica; leída sin examen → cumplida; con examen → cumplida al aprobar; un no asignado no rinde el mini examen; alerta "Nueva actualización" a cada asignado.
- [ ] FAIL → implementar → PASS.
- [ ] UI asesor: `/actualizaciones` (pendientes con fecha límite), detalle con la descripción, enlace al artículo o módulo, "Ya lo leí" y botón al mini examen. UI admin: formulario en Contenido → Actualizaciones.
- [ ] Commit `feat(actualizaciones): cambios de contenido obligatorios con mini examen y plazo`.

### Task 5: Job diario

**Files:** Create `supabase/migrations/20261113000400_job_diario.sql`, `supabase/tests/41_job_diario.test.sql`.

**Interfaces:** Produces `job_diario(p_ahora timestamptz default now()) returns jsonb` = `procesar_consignas` + `procesar_recertificacion` + vencer asignaciones de actualización (alerta y `sincronizar_insignias_de`) + alertas de consignas vencidas al asesor + alerta al/los coordinador/es del área y sede del asesor por cada intento con más de 72 h sin corregir (clave por intento) + limpiar `corrector_id` de tomas de más de 24 h. Reemplaza el cron `procesar-consignas` por `pea-diario` a las 03:10 UTC.

- [ ] pgTAP: correrlo dos veces no duplica nada; actualización vencida → asignación `vencida`, insignia del nivel perdida, alerta; completar después → cumplida e insignia recuperada; intento de 80 h → alerta al coordinador de su área y sede, no al de otra área; existe el cron `pea-diario` y no `procesar-consignas`.
- [ ] FAIL → migración → PASS.
- [ ] Commit `feat(job): job diario con vencimientos, alertas y correcciones atrasadas`.

### Task 6: Seed, tipos y E2E

**Files:** Modify `supabase/seed.sql` (una certificación por vencer y una alerta para un asesor; una actualización con asignación pendiente), `lib/supabase/tipos.ts`, `e2e/recertificacion.spec.ts`.

- [ ] E2E: el asesor ve la campana con avisos, abre `/avisos` y marca todo como leído; abre la actualización pendiente, marca "Ya lo leí", rinde el mini examen y queda cumplida; el admin publica una actualización desde Contenido; un asesor no entra a Contenido → Actualizaciones (404).
- [ ] `npm run typecheck && npm run lint && npm test`, `npx supabase db reset && npx supabase test db`, `PEA_E2E_PUERTO=3000 npx playwright test --trace off` → verde.
- [ ] Commit `test(etapa-9): seed y E2E de recertificación, actualizaciones y avisos`.
