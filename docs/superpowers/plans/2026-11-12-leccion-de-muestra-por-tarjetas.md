# Lección de muestra por tarjetas · Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Una lección de muestra completa en el formato nuevo por tarjetas (lección 05 · Cambio de modalidad), con su vista interactiva y su video hecho con Revideo, para que la dueña la apruebe antes de convertir las 40.

**Architecture:** `items.leccion` admite una versión 2 `{version: 2, tarjetas: [...]}` validada en TypeScript (zod) y en la base (`leccion_valida`). El importador lee el Markdown nuevo. La página del paso elige la vista por tarjetas cuando la lección es versión 2. El video se fabrica en un proyecto Revideo aislado (`video/`, con sus propias dependencias) a partir de un guion que sale de las tarjetas.

**Tech Stack:** Next 16 (leer `node_modules/next/dist/docs/` antes de tocar rutas), Supabase (RLS, Storage), zod, Vitest, pgTAP, Playwright, Revideo 0.11 (`@revideo/core`, `@revideo/2d`, `@revideo/renderer`, MIT).

**Spec:** `docs/superpowers/specs/2026-11-12-lecciones-por-tarjetas-design.md`

## Global Constraints

- Alcance del CAU: grado y pregrado, EDH, ED y PD. Nada de P, PH ni posgrado salvo para aclarar que no aplica.
- Contenido en borrador y "A validar", con fuente; nada sin respaldo en `relevamiento/`.
- Textos mínimos en la interfaz; español rioplatense; nombres de casos inventados.
- Límites v2: 5 a 10 tarjetas; títulos ≤ 80; párrafos ≤ 500 por tarjeta; consulta del caso ≤ 300; opciones de `preguntar` 3 a 5, texto ≤ 120 y porqué ≤ 200; frase clave de `idea` ≤ 120.
- Mobile first (360 px sin desborde), tokens del sistema de diseño, modo oscuro y `prefers-reduced-motion`.
- La versión 1 de lección sigue siendo válida y se sigue mostrando como hoy.
- Revideo sin telemetría (`DISABLE_TELEMETRY=true`) y con el Chromium local (`/opt/pw-browsers/chromium`); `PUPPETEER_SKIP_DOWNLOAD=1` al instalar.
- Videos: bucket privado `videos`, enlace firmado; al sitio solo con aprobación de la dueña (esta entrega usa la base local).
- Commits con `Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>` y `Claude-Session: https://claude.ai/code/session_01Qbkzm1LPRqPzE6o2sYWnj4`.

## Review Focus

- Lección v2 sin tarjeta `video`, o con video que falta en Storage → la lección se ve igual, sin hueco ni error.
- Pregunta del Probalo sin tarjeta `probalo N` (agregada desde la app o de una sede) → aparece antes del `cierre`; la lección se puede completar.
- Volver a una tarjeta anterior → conserva lo marcado en `preguntar` y lo respondido en el Probalo.
- Textos largos (máximos) en 360 px y en modo oscuro → sin desborde y legibles.
- Una lección v1 (cualquiera de las otras 39) → se sigue viendo con los bloques de hoy.

---

### Task 1: Formato v2 en dominio y base

**Files:**
- Modify: `lib/dominio/lecciones.ts`, `lib/dominio/lecciones.test.ts`
- Create: `supabase/migrations/20261117000100_leccion_tarjetas.sql`, `supabase/tests/48_leccion_tarjetas.test.sql`

**Interfaces:**
- Produces (TS): `type Tarjeta = TarjetaVideo | TarjetaCaso | TarjetaPreguntar | TarjetaIdea | TarjetaProbalo | TarjetaOjo | TarjetaCierre` con `tipo` literal; `type LeccionV2 = { version: 2; tarjetas: Tarjeta[] }`; `esquemaLeccionV2` (zod); `esLeccionV2(l: unknown): l is LeccionV2`; `minutosDeLectura` acepta v1 o v2.
  - `video { tipo: "video"; ruta: string }` (ruta en el bucket `videos`)
  - `caso { tipo: "caso"; persona: string; canal: "mostrador" | "telefono" | "whatsapp"; consulta: string }`
  - `preguntar { tipo: "preguntar"; opciones: { texto: string; clave: boolean; porque: string }[] }`
  - `idea { tipo: "idea"; titulo: string; texto: string; clave: string; ejemplo?: string }`
  - `probalo { tipo: "probalo"; n: number }` (posición 1..3 de la pregunta del Probalo)
  - `ojo { tipo: "ojo"; texto: string }`
  - `cierre { tipo: "cierre"; resolucion: string; recordar: string }`
- Produces (SQL): `leccion_valida(jsonb)` acepta v1 (igual que hoy) o v2 con los mismos límites.

- [ ] **Step 1: Tests de dominio** en `lecciones.test.ts`: una v2 válida de 7 tarjetas pasa; falla con 4 o 11 tarjetas, `idea.texto` de 501, `preguntar` con 2 opciones o sin ninguna `clave: true`, `caso.canal: "mail"`, sin `caso` o sin `cierre`, `cierre` que no es la última; `esLeccionV2({resumen: [...]})` es `false`; `minutosDeLectura` de una v2 de 1.000 palabras da 5.
- [ ] **Step 2:** `npx vitest run lib/dominio/lecciones.test.ts` → FAIL.
- [ ] **Step 3:** Implementar en `lib/dominio/lecciones.ts` (reglas: exactamente un `caso` y un `cierre`; `cierre` última; `video`, si está, primera).
- [ ] **Step 4:** Test → PASS.
- [ ] **Step 5: pgTAP 48**: `leccion_valida` acepta la misma v2 válida y rechaza 4 tarjetas, `idea.texto` de 501 y tipo desconocido; una v1 válida sigue pasando; `insert` en `items` con v2 inválida falla por el check existente.
- [ ] **Step 6:** Migración: `create or replace function public.leccion_valida` con rama v1 (cuerpo actual) o rama v2; mismos grants. `npx supabase db reset && npx supabase test db` → PASS.
- [ ] **Step 7:** Commit "Lecciones v2 por tarjetas: formato y validación".

### Task 2: Importador de lecciones v2

**Files:**
- Modify: `lib/lecciones/importar.ts`, `lib/lecciones/importar.test.ts`

**Interfaces:**
- Consumes: `esquemaLeccionV2`, `LeccionV2` (Task 1).
- Produces: `LeccionArchivo.leccion: Leccion | LeccionV2`; formato Markdown v2 detectado por front matter `formato: "tarjetas"`. Secciones: `## video` (línea `ruta: <ruta>`), `## caso` (`persona:`, `canal:`, luego la consulta), `## preguntar` (`- [x] texto` / `- [ ] texto` con `  > porqué`), `## idea: <título>` (párrafos, `clave: <frase>`, opcional `ejemplo: <texto>`), `## probalo <n>`, `## ojo`, `## cierre` (párrafo de resolución y `recordar: <frase>`), y el bloque `## Probalo` de siempre al final para las preguntas.

- [ ] **Step 1: Tests**: un Markdown v2 de muestra (en el test) da `{version: 2, tarjetas}` en el orden escrito y pasa `esquemaLeccionV2`; `## probalo 4` con 3 preguntas da error con la ruta; `armarSqlLecciones` de una v2 escribe `"version":2` en `items.leccion`; los 40 archivos actuales (v1) siguen pasando el test existente.
- [ ] **Step 2:** `npx vitest run lib/lecciones/importar.test.ts` → FAIL.
- [ ] **Step 3:** Implementar `leerLeccionV2(ruta, cuerpo): LeccionV2` y llamarla desde `leerLeccion` cuando `formato: "tarjetas"`.
- [ ] **Step 4:** Test → PASS.
- [ ] **Step 5:** Commit "Importador: lecciones por tarjetas".

### Task 3: Lección de muestra 05 · Cambio de modalidad

**Files:**
- Modify: `contenido/lecciones/05-cambio-de-modalidad.md`, `supabase/seed-lecciones.sql` (regenerado)

**Interfaces:**
- Consumes: formato Markdown v2 (Task 2).

- [ ] **Step 1:** Reescribir en v2 a partir del texto corregido, de su Probalo y de `docs/relevamiento-2026-11/contenido/lecciones-lote-1.md` (sección 05). Guía: caso por WhatsApp de una alumna de EDH que quiere pasarse a ED con materias cursando y una mesa anotada; `preguntar` con 4 opciones (modalidad de origen y destino; si está anotada a un final o tiene nota pendiente; cuántos pases hizo; qué materias tiene y en qué condición); 3 a 4 ideas (cuándo se pide; requisitos; qué pasa con cada condición de materia; Seminario de Práctica en ED↔EDH); `probalo 1` después de la idea de requisitos y `probalo 2` y `3` antes del cierre; `ojo` "Libre por Nota no se conserva"; `cierre` con el caso resuelto. Tono de compañero, sin viñetas sueltas. Todo con respaldo en `rg-3-2-cambios-de-modalidad`. Sin `## video` todavía (lo agrega la Task 5).
- [ ] **Step 2:** `npx vitest run lib/lecciones/importar.test.ts` → PASS (los límites lo validan).
- [ ] **Step 3:** `node --experimental-strip-types scripts/importar-lecciones.mts`, `npx supabase db reset` sin errores; `select leccion->>'version' from items where titulo = 'Cambio de modalidad'` → `2`.
- [ ] **Step 4:** Commit "Lección de muestra: Cambio de modalidad por tarjetas".

### Task 4: Vista por tarjetas

**Files:**
- Create: `components/leccion/tarjetas/vista-tarjetas.tsx` (cliente: una tarjeta por vez, barra de pasos, Anterior/Siguiente, flechas del teclado, deslizar en táctil), `components/leccion/tarjetas/tarjeta.tsx` (una por tipo), `components/leccion/tarjetas/preguntar.tsx` (marcar y revelar)
- Modify: `app/(app)/estudiar/[curso]/[item]/page.tsx` (elige v1 o v2; arma la lista de tarjetas con las preguntas del Probalo ubicadas por `probalo N` y las sueltas antes del `cierre`; firma la ruta del video si existe)
- Test: `e2e/estudiar.spec.ts` (nuevo test), `components/leccion/tarjetas/orden.test.ts`

**Interfaces:**
- Consumes: `LeccionV2`, `esLeccionV2` (Task 1); `Practica` en `app/(app)/estudiar/[curso]/[item]/practica.tsx` (se reusa con una sola pregunta por tarjeta `probalo`); `BarraSiguiente` al terminar.
- Produces: `ordenarTarjetas(tarjetas: Tarjeta[], preguntaIds: string[]): TarjetaConPregunta[]` (pura, en `components/leccion/tarjetas/orden.ts`), donde una `probalo n` se reemplaza por `{tipo: "probalo", preguntaId}` y las preguntas sin ubicar se insertan antes del `cierre`.

- [ ] **Step 1: Tests unitarios de `ordenarTarjetas`**: 3 preguntas con `probalo 1` y `probalo 3` → la 2 queda antes del `cierre`; `probalo 2` sin pregunta 2 → la tarjeta se omite; sin `video` no hay tarjeta de video.
- [ ] **Step 2: E2E** "lección por tarjetas: caso, preguntar, Probalo intercalado y cierre": entra a Cambio de modalidad en vista previa (curso Trámites, como el test existente), ve el caso, marca opciones en `preguntar` y ve "Lo importante" con los porqués, avanza con "Siguiente", responde el Probalo en su tarjeta y ve la explicación, vuelve atrás y lo respondido sigue ahí, llega al cierre. A 360 px no hay desborde.
- [ ] **Step 3:** Ambos → FAIL.
- [ ] **Step 4:** Implementar. La tarjeta en curso se recuerda por usuario en `localStorage` (clave `pea-tarjeta:<itemId>`, con try/catch). Animación de cambio con las clases `entra-der`/`entra-izq` ya existentes.
- [ ] **Step 5:** Tests unitarios, E2E del archivo y `npm run lint && npx tsc --noEmit` → PASS. Las otras lecciones (v1) siguen pasando sus E2E.
- [ ] **Step 6:** Commit "Vista de lección por tarjetas".

### Task 5: Video de la lección con Revideo

**Files:**
- Create: `lib/lecciones/guion.ts` + `guion.test.ts` (puro, lo prueba Vitest), `video/package.json`, `video/vite.config.ts`, `video/src/project.ts`, `video/src/escenas/*.tsx` (portada, caso, idea, ojo, cierre), `video/render.ts`, `scripts/subir-video.mts`
- Modify: `contenido/lecciones/05-cambio-de-modalidad.md` (agrega `## video`), `.gitignore` (`video/node_modules`, `video/salida`), `package.json` (script `videos`)

**Interfaces:**
- Consumes: `LeccionV2` (Task 1), `leerLeccion` (Task 2).
- Produces: `guionDeLeccion(l: LeccionV2, titulo: string): Escena[]` con `Escena = { tipo: "portada" | "caso" | "idea" | "ojo" | "cierre"; textos: string[]; segundos: number }`; `segundosDeLectura(texto: string): number`.

- [ ] **Step 1: Tests de `guion.ts`**: `segundosDeLectura` a 2,5 palabras por segundo más 1,5 s, con mínimo 3 y máximo 12; el guion de la lección de muestra tiene portada, caso, una escena por idea con su `clave` (no el texto completo), ojo y cierre; la duración total es la suma de las escenas y crece si se agrega una idea.
- [ ] **Step 2:** `npx vitest run lib/lecciones/guion.test.ts` → FAIL; implementar; → PASS.
- [ ] **Step 3:** Proyecto `video/` con Revideo 0.11: instalar con `PUPPETEER_SKIP_DOWNLOAD=1 npm --prefix video install`; las escenas leen el guion como variables del proyecto; colores y letra del sistema de diseño (índigo, Plus Jakarta Sans) y el logo Sendero. `video/render.ts <slug>` lee la lección con `leerLeccion`, arma el guion y llama a `renderVideo` con el Chromium local y telemetría apagada, a `video/salida/<slug>.mp4`.
- [ ] **Step 4:** `npm run videos -- 05-cambio-de-modalidad` → genera el MP4; `ffprobe` muestra la duración igual (±1 s) a la suma del guion.
- [ ] **Step 5:** `scripts/subir-video.mts <slug>` sube el MP4 al bucket privado `videos` de la base local (crear el bucket en la migración de la Task 1 si no existe, con la misma política que `recursos`), agregar `## video` con `ruta: lecciones/05-cambio-de-modalidad.mp4`, regenerar el seed. La tarjeta de video reproduce con enlace firmado; si el archivo no está, la tarjeta no aparece (Review Focus).
- [ ] **Step 6:** Commit "Video de la lección de muestra con Revideo".

### Task 6: Entrega a la dueña

- [ ] **Step 1:** Suite completa: `npm test`, `npx supabase test db`, `npx supabase db reset` + Playwright completo → todo PASS.
- [ ] **Step 2:** Capturas a 390 px de cada tarjeta (claro y una en oscuro) y el MP4; enviarlas con `SendUserFile`.
- [ ] **Step 3:** Push de la rama; no se carga nada al sitio.
