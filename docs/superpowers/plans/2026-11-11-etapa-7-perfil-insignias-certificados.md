# PEA · Etapa 7 (Perfil, insignias y certificados) — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Que el asesor vea su perfil evolutivo con lo siguiente:
- su nivel actual;
- el avance de su ruta;
- sus insignias (activas y perdidas);
- el historial de exámenes;
- sus certificados, cada uno con un **PDF** descargable y un **QR** que lleva a una página pública de verificación (vigente, vencido o revocado).

**Architecture:**
- **Insignias:** el que las da y las quita es un trigger sobre `certificaciones`. Una certificación vigente de un nivel otorga (o recupera) la insignia de ese nivel. Si pasa a vencida o revocada, la insignia queda perdida. El vencimiento automático llega en la Etapa 9; acá la insignia ya reacciona al cambio de estado.
- **PDF:** se genera a demanda en un route handler (`pdf-lib` + `qrcode`), sin guardarlo, así refleja siempre el estado actual. Lo descargan el dueño y quien puede verlo (`puede_ver_usuario`).
- **Verificación pública:** `/verificar/[codigo]` (ya es ruta pública) consulta una RPC `security definer` habilitada para anon que devuelve solo lo necesario.
- **Revocación:** el admin revoca un certificado desde una pantalla nueva.

**Tech Stack:** el de siempre, más `pdf-lib` y `qrcode` (con `@types/qrcode`).

**Spec:** `docs/superpowers/specs/2026-11-05-pea-design.md`: §4.5 (perfil evolutivo y certificado PDF), §5 (`insignias`, `usuario_insignias`, `certificaciones`) y §6 (RLS: lo propio, el equipo, la sede y área, o todo).

## Global Constraints

- Todo lo anterior sigue valiendo: estilo B, modelo Canvas, español rioplatense, mobile-first, **textos mínimos** y contenido "(ejemplo)".
- **Insignias:**
  - Hay una por curso de nivel: `insignias(id, curso_id unique, nombre, descripcion, icono_path null)`. Se crea sola al crear un nivel, con el nombre "Nivel N" y la descripción vacía; el admin puede renombrarla.
  - Sin ícono subido, la insignia se dibuja como un círculo del color del nivel (`colorNivel`) con "N{orden}".
  - `usuario_insignias(id, usuario_id, insignia_id, otorgada_at, perdida_at null, motivo_perdida null)`, con unique `(usuario_id, insignia_id)`. Recuperarla limpia `perdida_at` y actualiza `otorgada_at`.
- **Certificado PDF:**
  - Solo para certificaciones de origen `examen`; la ubicación acredita sin PDF.
  - A4 apaisado con "PEA · Perfil Evolutivo de Asesor", "Certificado", el nombre completo, "Nivel N · {título del curso}", las fechas de emisión y de vencimiento ("Sin vencimiento" si no vence), el código de verificación y el QR a `{origen}/verificar/{codigo}`.
  - Texto en español, sin logos de Siglo.
- **Verificación pública:**
  - Muestra el nombre del asesor (nombre y apellido), el nivel, la fecha de emisión, la de vencimiento y el estado: **Vigente**, **Vencido** (`vence_at < now()` aunque el estado guardado diga vigente) o **Revocado**.
  - Un código inexistente muestra "Código no encontrado".
  - Sin email ni otro dato personal.
- **Revocación:** solo el admin, con `revocar_certificacion(id, motivo)`. El motivo es obligatorio (1 a 300 caracteres) y queda en `auditoria`.

## Review Focus

1. La página de verificación no expone datos de más (email, sede, intentos) y no permite listar certificados: solo se busca por un código exacto. Tarea 1.
2. Un asesor no descarga el PDF de otro, ni adivinando el id. Tarea 3 (el route handler pasa por la RLS).
3. Perder y recuperar la insignia no duplica filas (unique), y una certificación de ubicación también otorga la insignia. Tarea 1.
4. Un certificado vencido por fecha se ve "Vencido" en la verificación y en el perfil, aunque el job de la Etapa 9 todavía no haya cambiado el estado. Tareas 1 y 2.
5. Un nivel sin insignia (creado antes de esta etapa) no rompe el perfil: la migración crea las insignias que falten. Tarea 1.

---

### Task 1: Insignias y verificación en la base

**Files:**
- Create: `supabase/migrations/20261111000100_insignias.sql`, `supabase/tests/31_insignias.test.sql`
- Modify: `lib/supabase/tipos.ts` (regenerar)

**Interfaces:**
- Produces:
  - Las tablas `insignias` y `usuario_insignias`, con RLS:
    - `insignias`: select para todo usuario activo; update solo admin; sin insert ni delete directos (los hace el trigger).
    - `usuario_insignias`: select propio o con `puede_ver_usuario`; sin escritura directa.
  - Un trigger `after insert on cursos` (tipo nivel) que crea la insignia. La migración crea también las de los niveles existentes.
  - Un trigger `after insert or update of estado, vence_at on certificaciones`:
    - si la certificación queda `vigente`, hace upsert de `usuario_insignias` con `perdida_at = null` y `otorgada_at = now()`;
    - si pasa a `vencida` o `revocada` y no queda otra vigente de ese curso, pone `perdida_at = now()` y `motivo_perdida` = 'vencida' o 'revocada'.
  - `estado_efectivo(p_estado estado_certificacion, p_vence timestamptz) returns text`: `'revocada'` si está revocada, `'vencida'` si está vencida o si `p_vence < now()`, y si no `'vigente'`.
  - `verificar_certificado(p_codigo text) returns table(nombre text, nivel int, curso text, emitida_at timestamptz, vence_at timestamptz, estado text)`:
    - es `security definer` y se puede ejecutar como anon y como authenticated;
    - devuelve una fila solo con un `codigo_verificacion` exacto (comparado en mayúsculas y sin espacios);
    - `nombre` = nombre y apellido.
  - `revocar_certificacion(p_id uuid, p_motivo text) returns void`: solo admin (si no, `'sin permiso'`); motivo de 1 a 300 caracteres (si no, `'motivo inválido'`); escribe `estado = 'revocada'` y la auditoría.
  - `mi_perfil_evolutivo() returns table(nivel_actual int, nivel_titulo text, cursos_total int, cursos_cumplidos int)`:
    - el nivel actual es el mayor con certificación vigente, o el primero desbloqueado y no cumplido de `mi_ruta`;
    - `cursos_*` cuentan los obligatorios de la ruta.

- [ ] **Step 1: Escribir `31_insignias.test.sql`**:
  - Crear un curso nivel crea su insignia, y los niveles 8 y 9 del escenario tienen la suya.
  - Una certificación vigente para ase1 (insertada como postgres) le otorga 1 `usuario_insignias` sin `perdida_at`.
  - Pasarla a `vencida` marca `perdida_at` y `motivo_perdida = 'vencida'`. Una nueva certificación vigente la recupera sin duplicar: sigue habiendo 1 fila y `perdida_at` es null.
  - Una certificación de origen `ubicacion` también otorga la insignia.
  - Como ase2: 0 filas en `usuario_insignias`. Como coordS: ve la de ase1.
  - Como anon:
    - `verificar_certificado(<código en minúsculas y con espacios>)` devuelve 1 fila con `estado = 'vigente'` y `nombre = 'ase1'`;
    - con `vence_at` en el pasado devuelve `'vencida'`;
    - con un código inexistente, 0 filas;
    - `select * from certificaciones` da 0 filas o 42501.
  - `revocar_certificacion` como coordS da `'sin permiso'`. Como adm con motivo vacío da `'motivo inválido'`; con un motivo válido, la verificación devuelve `'revocada'` y la insignia queda perdida.
- [ ] **Step 2:** FAIL.
- [ ] **Step 3:** Implementar.
- [ ] **Step 4:** PASS y regenerar los tipos.
- [ ] **Step 5:** Commit `feat(perfil): insignias por nivel, verificación pública y revocación`.

### Task 2: Dominio de certificados (puro)

**Files:**
- Create: `lib/dominio/certificados.ts`, `lib/dominio/certificados.test.ts`

**Interfaces:**
- `estadoEfectivo(estado: "vigente" | "vencida" | "revocada", venceAt: string | null, ahora: Date): "vigente" | "vencida" | "revocada"` (misma regla que la base).
- `ETIQUETA_ESTADO_CERT`: Vigente, Vencido y Revocado. `COLOR_ESTADO_CERT` con las clases de estilo B.
- `textoVencimiento(venceAt: string | null): string` → `"Vence el 12/11/2027"`, o `"Sin vencimiento"` si es null. Usa `formatearFecha`.
- `urlVerificacion(origen: string, codigo: string): string` → `${origen}/verificar/${codigo}`, sin barras dobles.
- `normalizarCodigo(c: string): string` → mayúsculas, sin espacios ni guiones.

- [ ] **Step 1: Tests**
  - Vigente con `vence_at` pasado → `"vencida"`; revocada → `"revocada"` aunque no haya vencido.
  - `textoVencimiento(null) === "Sin vencimiento"`.
  - `urlVerificacion("https://pea.app/", "AB12") === "https://pea.app/verificar/AB12"`.
  - `normalizarCodigo(" ab-12 cd ") === "AB12CD"`.
- [ ] **Step 2:** FAIL.
- [ ] **Step 3:** Implementar.
- [ ] **Step 4:** PASS.
- [ ] **Step 5:** Commit `feat(perfil): dominio de certificados`.

### Task 3: Certificado PDF con QR

**Files:**
- Modify: `package.json` (`npm install pdf-lib qrcode` y `npm install -D @types/qrcode`)
- Create:
  - `lib/certificados/pdf.ts`: `generarCertificadoPdf(d: { nombre: string; nivel: number; curso: string; emitidaAt: string; venceAt: string | null; codigo: string; urlVerificacion: string }): Promise<Uint8Array>`. Es server-only, usa pdf-lib con StandardFonts Helvetica y Helvetica-Bold, y un QR en PNG generado con `qrcode.toBuffer`.
  - `lib/certificados/pdf.test.ts`
  - `app/(app)/certificados/[id]/pdf/route.ts`: GET con `requerirPerfil`. Busca la certificación con el cliente del usuario (decide la RLS), que tiene que ser de origen `examen` (si no, 404). Devuelve `application/pdf` con `Content-Disposition: attachment; filename="certificado-nivel-N.pdf"`.

- [ ] **Step 1: Test** (vitest, node). El resultado de `generarCertificadoPdf`:
  - empieza con `%PDF`;
  - al cargarlo con `PDFDocument.load` tiene 1 página apaisada (ancho mayor que alto);
  - `getTitle()` es `"Certificado Nivel 1 · Nombre Apellido"` (se fija con `setTitle`).
- [ ] **Step 2:** FAIL.
- [ ] **Step 3:** Implementar `pdf.ts` y la ruta. Caracteres con tilde: Helvetica con WinAnsi los soporta; si alguno falla, se reemplaza por su versión sin tilde (ruling si hace falta).
- [ ] **Step 4:** PASS, más `npm run typecheck && npm run lint`.
- [ ] **Step 5:** Commit `feat(perfil): certificado PDF con QR de verificación`.

### Task 4: Página pública de verificación

**Files:**
- Create: `app/verificar/[codigo]/page.tsx` (fuera de `(app)` y de `(auth)`, con layout propio mínimo: "PEA" y una tarjeta centrada)
- Create: `app/verificar/page.tsx`: un form con el campo "Código" que redirige a `/verificar/{código normalizado}`.

**Interfaces:**
- Consumes: `verificar_certificado`, con un cliente de servidor sin sesión (`crearClienteServidor` funciona igual para anon).
- La tarjeta muestra el estado grande (Vigente en verde, Vencido en naranja y Revocado en rojo), nombre, "Nivel N · curso", "Emitido el …" y `textoVencimiento`.

- [ ] **Step 1:** Implementar.
- [ ] **Step 2:** `npm run typecheck && npm run lint`, más capturas en 390 y 1440.
- [ ] **Step 3:** Commit `feat(perfil): verificación pública de certificados`.

### Task 5: Perfil evolutivo

**Files:**
- Modify: `app/(app)/perfil/page.tsx` (rehacer)
- Create: `components/perfil/insignia.tsx`: `<Insignia nivel={number} nombre={string} perdida={boolean} />`, un círculo del color del nivel, gris y con opacidad si está perdida, con "N{n}".
- Modify: `components/nav/panel-cuenta.tsx` (se saca "Próximamente" de "Mis insignias")

**Interfaces:**
- Consumes: `mi_perfil_evolutivo()`, `usuario_insignias` (join `insignias` y `cursos`), `certificaciones` (propias), `intentos` cerrados o pendientes (join `examenes`, los últimos 20) y `consigna_asignaciones` pendientes (las primeras 5).
- Estructura, de arriba hacia abajo:
  1. Encabezado con avatar, nombre, rol, sede y la "píldora" del nivel actual (color del nivel).
  2. Barra de avance de la ruta: obligatorios cumplidos sobre el total.
  3. "Insignias" (`id="insignias"`): grilla de insignias, primero las activas y después las perdidas (con la etiqueta "Perdida"). Si no hay: "Sin insignias todavía.".
  4. "Certificados": lista con el nivel, el estado efectivo (chip), el vencimiento, el botón "PDF" (solo los de origen examen) y el enlace "Verificar" (`/verificar/{codigo}`, en otra pestaña).
  5. "Exámenes": la fecha, el título, la nota o "Pendiente", un chip Aprobado o No aprobado y un enlace al resultado.
  6. "Consignas pendientes": las primeras 5 y "Ver todas".
  7. "Datos": la tarjeta actual de email, rol, sede, etc., más el formulario de teléfono, que se mantiene.
- En PC van 2 columnas (izquierda: avance, insignias y certificados; derecha: exámenes, consignas y datos) y en celular una sola.

- [ ] **Step 1:** Implementar.
- [ ] **Step 2:** `npm run typecheck && npm run lint`, más capturas.
- [ ] **Step 3:** Commit `feat(perfil): perfil evolutivo con insignias, certificados y exámenes`.

### Task 6: Gestión: insignias y revocación

**Files:**
- Modify: `app/(app)/contenido/cursos/[id]/page.tsx`. En un curso de nivel, la tarjeta "Insignia" (solo para el admin) muestra la vista previa con `<Insignia>` y un form de nombre y descripción.
- Create: `app/(app)/contenido/cursos/insignia.tsx` (form cliente) y la acción `guardarInsignia` en `app/(app)/contenido/cursos/acciones.ts` (zod: nombre de 1 a 60 y descripción de hasta 300; update con RLS de admin).
- Create:
  - `app/(app)/admin/certificaciones/page.tsx`: buscador por nombre o código (`?q=`), una lista de hasta 100 certificaciones con nombre, nivel, origen, estado efectivo y emitida, y el botón "Revocar" en las vigentes;
  - `app/(app)/admin/certificaciones/revocar.tsx`: un `<details>` con el campo "Motivo" y "Confirmar";
  - `app/(app)/admin/certificaciones/acciones.ts` con `revocar(id, prev, formData)`.
- Modify: `app/(app)/admin/pestanas.tsx` (suma "Certificados")

- [ ] **Step 1:** Implementar.
- [ ] **Step 2:** `npm run typecheck && npm run lint`.
- [ ] **Step 3:** Commit `feat(perfil): edición de insignias y revocación de certificados`.

### Task 7: Seed y E2E

**Files:**
- Modify: `supabase/seed.sql`. Insignias con nombres de ejemplo: Nivel 1 "Base (ejemplo)" y Nivel 2 "Operativo (ejemplo)".
- Create: `e2e/perfil.spec.ts`

- [ ] **Step 1: E2E**
  - `asesor.nqn` aprueba el Final del Nivel 1, reusando el helper `responderBien`, que se mueve a `e2e/ayudantes-examenes.ts`. En `/perfil` ve la insignia del Nivel 1 activa y el certificado "Vigente". El link "PDF" responde 200 con `content-type` `application/pdf`.
  - Abre "Verificar" (anónimo, en un contexto nuevo): ve "Vigente" y su nombre.
  - `asesor.roca` pide el PDF de ese certificado → 404.
  - El admin revoca el certificado con el motivo "Prueba E2E". La verificación muestra "Revocado" y el perfil del asesor muestra la insignia "Perdida".
  - `/verificar/NOEXISTE` muestra "Código no encontrado".
- [ ] **Step 2:** `npx supabase db reset` y la suite completa → verde.
- [ ] **Step 3:** Commit `feat(perfil): seed y E2E de perfil, insignias y certificados`.
