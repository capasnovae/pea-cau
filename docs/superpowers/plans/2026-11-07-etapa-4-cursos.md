# PEA · Etapa 4 (Cursos estilo Canvas, con estilo B) — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Cursos estilo Canvas: niveles y capacitaciones, módulos e ítems con requisitos, prerrequisitos, avance secuencial, desbloqueo de niveles y rutas por puesto. Lecciones con texto, capturas anotadas y video. Todo con el estilo visual B ("Aprendizaje motivador") elegido por el usuario.

**Architecture:** Igual que las etapas anteriores: reglas en Postgres (RLS + funciones `security definer`, pgTAP) y app Next.js con el cliente del usuario.
- El progreso **se calcula**: una RPC `mi_ruta()` devuelve los cursos del usuario con avance, obligatoriedad por puesto o subrol y si están desbloqueados.
- `item_progreso` guarda solo "visto" o "hecho". Registrarlo exige que el ítem esté disponible: sin prerrequisitos pendientes ni ítems anteriores sin cumplir cuando el avance es secuencial.
- Los ítems de tipo examen quedan como "no cumplidos" hasta la Etapa 5.

**Tech Stack:** el de siempre.

**Spec:** §4.3 (cursos estilo Canvas), §5.4 (esquema de cursos) y §6 (RLS). La decisión de diseño B está en el lienzo https://claude.ai/artifact/31RxfyMWbpaG5QkLPoJTUd.

## Global Constraints

- Todo lo de las etapas anteriores sigue valiendo.
- **Alcance de cursos:** igual que en el repositorio (global para el admin; de sede para el coordinador de esa sede y para el director; promoción solo del admin). `promover_contenido` suma `cursos`.
- **Niveles:** `cursos.tipo='nivel'` con `nivel_orden` único (1 a 4). El nivel N se desbloquea con el N‑1 **cumplido**: todos sus ítems con requisito cumplidos. En la Etapa 5 se suma el examen final aprobado y la acreditación por ubicación. Las capacitaciones no se bloquean por nivel.
- **Requisitos por ítem:**
  - `ninguno`: no cuenta para el avance;
  - `ver`: se cumple al abrirlo;
  - `marcar_hecho`: se cumple con el botón "Listo";
  - `aprobar`: se cumple al aprobar el examen, en la Etapa 5.
- **Disponibilidad de un ítem:** su curso está desbloqueado; los módulos prerrequisito de su módulo están cumplidos; y, si el módulo tiene avance secuencial, todos los ítems con requisito anteriores (por orden) están cumplidos.
- **Rutas:** `ruta_cursos` marca qué cursos son obligatorios u opcionales por puesto o subrol. El Nivel 1 es obligatorio para todos aunque no figure en la ruta. "Mi ruta" muestra los niveles y las capacitaciones que figuran en la ruta del usuario.
- **Lecciones:**
  - un ítem `pagina` lleva Markdown;
  - las imágenes se insertan con `![texto](recurso:<uuid>)`, se resuelven en el servidor a una URL firmada y solo si el usuario puede leer ese recurso;
  - las cajas de "Error común" o "Tip" se escriben como blockquote que empieza con `**Error común:**` o `**Tip:**`;
  - un ítem `video` acepta YouTube o Vimeo (embed en un `iframe` con `youtube-nocookie.com` o `player.vimeo.com`) o un recurso de video.
- **Estilo B:**
  - fondo `#f7f7fb`, tinta `#1a1a2e`, primario índigo `#4f46e5` (texto sobre blanco `#4338ca`), éxito `#047857`, alerta `#c2410c`;
  - tipografía Plus Jakarta Sans (Google Fonts por `<link>`, con fallback del sistema);
  - radios de 16 a 24 px, sombras suaves y sin bordes duros;
  - barra inferior oscura tipo píldora en celular;
  - contraste de texto de al menos 4.5:1 y botones de al menos 44 px.

## Review Focus

1. **Saltear el orden:** un asesor no puede marcar como hecho un ítem bloqueado (por prerrequisito, por avance secuencial o por nivel bloqueado) llamando a la API. (Test en Task 2.)
2. **Curso de otra sede o en borrador:** ni sus módulos ni sus ítems se ven ni se pueden marcar. (Test en Task 2.)
3. **Imagen de un recurso ajeno en una lección:** `recurso:<uuid>` de otra sede o en borrador no se resuelve y se muestra un recuadro "Imagen no disponible". (Test en Task 4.)
4. **Progreso de otro:** un asesor no lee ni escribe el progreso de otro. Su líder o coordinador sí lo lee. (Test en Task 2.)
5. **Video con una URL rara:** solo se embeben YouTube y Vimeo; cualquier otra URL queda como link externo. (Test en Task 4.)

---

### Task 1: Esquema de cursos

**Files:** `supabase/migrations/20261108000100_cursos.sql`, `supabase/tests/17_cursos_esquema.test.sql`

**Interfaces:**
- Produces: enums `tipo_curso`, `tipo_item`, `requisito_item`; tablas de la spec §5.4 (`cursos`, `ruta_cursos`, `modulos`, `modulo_prerrequisitos`, `items`, `item_progreso`). `items.examen_id uuid null` todavía no lleva FK: se agrega en la Etapa 5. `cursos` usa el mismo alcance, estado, autoría y promoción que `articulos`.
- Checks:
  - `nivel_orden` entre 1 y 9, único, y no nulo si `tipo='nivel'`;
  - el ítem tiene el FK que corresponde a su tipo (`articulo` ⇒ `articulo_id`; `recurso` ⇒ `recurso_id`; `video` ⇒ `url` o `recurso_id`; `enlace` ⇒ `url`; `pagina` ⇒ `contenido_md`; `examen` ⇒ sin FK por ahora);
  - `ruta_cursos` tiene exactamente uno de `puesto_id` o `subrol_id`;
  - un módulo no es prerrequisito de sí mismo y el prerrequisito pertenece al mismo curso (trigger).

- [ ] **Step 1: Test que falla:** `has_table` para las 6 tablas; los checks anteriores con `throws_ok`; prerrequisito de otro curso → `'integridad: el prerrequisito es de otro curso'`.
- [ ] **Step 2–4:** FAIL → migración → PASS.
- [ ] **Step 5: Commit** `feat(db): esquema de cursos`

### Task 2: RLS, disponibilidad y progreso

**Files:** `supabase/migrations/20261108000200_rls_cursos.sql`, `supabase/tests/18_cursos_rls.test.sql`

**Interfaces:**
- Produces:
  - Políticas:
    - `cursos` con `puede_leer_contenido` / `puede_editar_contenido`;
    - `modulos`, `items` y `modulo_prerrequisitos`: lectura si se puede leer el curso; escritura si se puede editar el curso (reciben la función `curso_de_modulo` / `curso_de_item`);
    - `ruta_cursos`: lectura para activos, escritura para el admin.
  - `promover_contenido` acepta `cursos`.
  - Funciones (`security definer stable`, con `p_usuario` como parámetro; las versiones públicas usan `auth.uid()`):
    - `item_cumplido(p_item uuid, p_usuario uuid) returns boolean`;
    - `modulo_cumplido(p_modulo uuid, p_usuario uuid)`;
    - `curso_cumplido(p_curso uuid, p_usuario uuid)` (un curso sin ítems con requisito no está cumplido);
    - `curso_desbloqueado(p_curso uuid, p_usuario uuid)`;
    - `item_disponible(p_item uuid, p_usuario uuid)`.
  - `item_progreso`:
    - `select` si es propio o `puede_ver_usuario(usuario_id)`;
    - `insert` y `update` solo propios, con `with check (item_disponible(item_id, auth.uid()))`;
    - sin `delete`.
  - Trigger: `visto_at` y `hecho_at` los pone el servidor (`now()`). Una vez puestos no se borran. `hecho_at` solo se acepta si el requisito del ítem es `marcar_hecho`.
  - RPC `marcar_item(p_item uuid, p_accion text)` (`'visto'|'hecho'`): hace el upsert del progreso propio y devuelve `{ok, cumplido}`. Si el ítem no está disponible, falla con `'bloqueado: completá lo anterior'`.

- [ ] **Step 1: Test que falla** (escenario de la Etapa 1 más: Nivel 1 global publicado con el módulo M1 secuencial (ítems i1 `ver`, i2 `marcar_hecho`) y el módulo M2 con prerrequisito M1 (ítem i3 `ver`); Nivel 2 publicado con el ítem j1; un curso de sede T-Roca; un curso en borrador):
  - `ase1` no puede marcar `i2` antes de `i1` (`'bloqueado: completá lo anterior'`);
  - marca `i1` como visto y después `i2` como hecho;
  - `i3` queda disponible recién con M1 cumplido;
  - con todo hecho, `curso_cumplido(Nivel 1)` es true y `curso_desbloqueado(Nivel 2)` es true;
  - antes de eso, marcar `j1` falla;
  - `ase1` no ve los módulos del curso de Roca ni los del borrador;
  - `ase1` no lee el progreso de `ase2`; `lider1` lee el de `ase1`;
  - `hecho_at` sobre un ítem `ver` → `'integridad: este ítem no se marca a mano'`;
  - `ase1` no puede insertar progreso con `usuario_id` de otro (42501).
- [ ] **Step 2–4:** FAIL → migración → PASS + `db lint`.
- [ ] **Step 5: Commit** `feat(db): disponibilidad y progreso de cursos`

### Task 3: Mi ruta

**Files:** `supabase/migrations/20261108000300_mi_ruta.sql`, `supabase/tests/19_mi_ruta.test.sql`

**Interfaces:**
- Produces: `mi_ruta() returns table(curso_id, titulo, descripcion_md, tipo, nivel_orden, obligatorio boolean, desbloqueado boolean, cumplido boolean, items_total int, items_cumplidos int, siguiente_item uuid)` (`security definer`, para el usuario activo):
  - incluye los niveles publicados visibles y las capacitaciones de su ruta (por puesto o por subroles);
  - `obligatorio` es true para el Nivel 1 y para lo marcado así en la ruta;
  - `siguiente_item` es el primer ítem disponible no cumplido.
  - Orden: niveles por `nivel_orden` y después capacitaciones por título.

- [ ] **Step 1: Test que falla:**
  - un asesor con subrol Front ve el Nivel 1 (obligatorio) y la capacitación "Front" de su ruta, pero no la de CEO;
  - avance 0/3 y `siguiente_item = i1`;
  - después de marcar `i1`, avance 1/3 y `siguiente_item = i2`.
- [ ] **Step 2–4:** FAIL → migración → PASS.
- [ ] **Step 5: Commit** `feat(db): mi ruta de aprendizaje`

### Task 4: Dominio de cursos y lecciones (lógica pura)

**Files:** `lib/dominio/cursos.ts` (+ test), `lib/dominio/leccion.ts` (+ test), `lib/dominio/roles.ts` (+ test)

**Interfaces:**
- `urlEmbedVideo(url: string): string | null`: devuelve el embed de `youtube.com/watch?v=ID`, `youtu.be/ID` y `vimeo.com/ID`, y `null` para cualquier otra URL o esquema.
- `idsRecursoEnMarkdown(md: string): string[]`: los uuid de `](recurso:<uuid>)`, únicos.
- `reemplazarRecursos(md: string, urls: Record<string, string>): string`: las ids con URL se reemplazan; las demás pasan a `](#imagen-no-disponible)`.
- `tipoCaja(texto: string): "error" | "tip" | null`, para los blockquote.
- `etiquetaRequisito(r: RequisitoItem): string`: Ver, Marcar como hecho, Aprobar examen.
- `porcentaje(cumplidos: number, total: number): number` (entero 0–100; con total 0 da 0).
- `menuPorRol`: suma "Estudiar" (`/estudiar`) después de Inicio, para todos.

- [ ] **Step 1: Tests que fallan:** casos de YouTube, youtu.be, Vimeo, `javascript:` y otra URL → null; ids repetidas; reemplazo con y sin URL; cajas; porcentaje 0/0 y 1/3 = 33; menú.
- [ ] **Step 2–4:** FAIL → implementar → PASS.
- [ ] **Step 5: Commit** `feat(dominio): cursos y lecciones`

### Task 5: Estilo B en toda la app

**Files:** `app/globals.css`, `app/layout.tsx`, `components/ui/*`, `components/nav/menu-principal.tsx`, `app/(app)/layout.tsx`, `app/(app)/inicio/page.tsx`, `app/(auth)/layout.tsx`

- [ ] **Step 1:** Tokens B en `globals.css` (colores de las Global Constraints, `--radius-card: 20px`, sombra suave), Plus Jakarta Sans por `<link>` en el layout raíz, y componentes con radios B (botón 14 px, card 20 px, input 12 px).
- [ ] **Step 2:** Barra inferior oscura tipo píldora (como en el lienzo) y barra lateral de PC con el ítem activo relleno en índigo.
- [ ] **Step 3:** Inicio B:
  - saludo;
  - tarjeta índigo "Tu ruta" con el siguiente curso de `mi_ruta()`, su porcentaje, segmentos por módulo y "Continuar" (va a `siguiente_item`);
  - "Para hoy" (consignas pendientes);
  - fichas de niveles N1–N4 con su estado (cumplido, en curso o bloqueado).
- [ ] **Step 4:** Ajustar los textos de los tests de punta a punta que cambian, revisar las capturas a 412 px y 1280 px sin scroll horizontal, y correr build y E2E.
- [ ] **Step 5: Commit** `feat(ui): estilo B (aprendizaje motivador)`

### Task 6: Mi ruta y vista de curso

**Files:** `app/(app)/estudiar/page.tsx`, `app/(app)/estudiar/[curso]/page.tsx`

- [ ] **Step 1:** **`/estudiar`:** los niveles como tarjetas grandes con color por nivel (N1 índigo, N2 verde azulado, N3 naranja, N4 rosa), porcentaje, estado y candado si está bloqueado ("Completá el Nivel N‑1 para desbloquearlo"). Abajo, "Capacitaciones de tu puesto", con las obligatorias marcadas.
- [ ] **Step 2:** **`/estudiar/[curso]`:**
  - encabezado con el color del nivel y la barra de avance;
  - módulos plegables con sus ítems (ícono por tipo, requisito, estado: cumplido ✓, disponible o bloqueado 🔒 con el motivo);
  - si el curso no es visible, 404; si está bloqueado, se ve el temario pero no se puede abrir ningún ítem.
- [ ] **Step 3:** typecheck y build → PASS.
- [ ] **Step 4: Commit** `feat(estudiar): mi ruta y vista de curso`

### Task 7: Lección

**Files:** `app/(app)/estudiar/[curso]/[item]/page.tsx`, `app/(app)/estudiar/acciones.ts`, `components/leccion/*`

**Interfaces:** Server Action `marcarItem(itemId, accion)` que llama a la RPC y traduce `'bloqueado'` a "Completá lo anterior para seguir."

- [ ] **Step 1:** Pantalla de lección B:
  - barra superior con "×" (vuelve al curso) y progreso del módulo;
  - el título;
  - el contenido según el tipo:
    - `pagina`: Markdown con las imágenes `recurso:` resueltas y las cajas Error común y Tip con estilo;
    - `articulo`: el artículo del repositorio, con link "Ver en el repositorio";
    - `video`: iframe 16:9 o link;
    - `recurso`: botón de descarga;
    - `enlace`: botón "Abrir";
    - `examen`: tarjeta "El examen llega en la próxima etapa";
  - botón principal fijo abajo: "Listo, siguiente" (`marcar_hecho`) o "Siguiente" (`ver`).
- [ ] **Step 2:** Al abrir un ítem `ver` disponible, se marca como visto en el servidor. Un ítem bloqueado muestra el motivo y el link al ítem que falta.
- [ ] **Step 3:** typecheck y build → PASS.
- [ ] **Step 4: Commit** `feat(estudiar): lección con texto, capturas y video`

### Task 8: Gestión de cursos (editores)

**Files:** `app/(app)/contenido/cursos/page.tsx`, `app/(app)/contenido/cursos/[id]/page.tsx` (+ formularios y acciones), pestaña "Cursos" en `/contenido`, `app/(app)/admin/rutas/page.tsx`

- [ ] **Step 1:** Lista de cursos editables con el botón "Nuevo curso" (tipo, nivel, título, descripción, alcance, estado y vigencia en meses).
- [ ] **Step 2:** Editor del curso:
  - módulos con orden, avance secuencial y prerrequisitos (checkboxes de los otros módulos);
  - ítems por módulo con tipo, título, requisito, orden, y el campo según el tipo (selector de artículo publicado, de recurso, URL o Markdown con vista previa);
  - botones subir y bajar para el orden;
  - "Promover a todos los CAU" (admin).
- [ ] **Step 3:** **`/admin/rutas`:** tabla de cursos × puestos y subroles con las opciones "obligatorio", "opcional" o nada.
- [ ] **Step 4:** typecheck, lint y build → PASS.
- [ ] **Step 5: Commit** `feat(contenido): gestión de cursos y rutas`

### Task 9: Seed y E2E

**Files:** `supabase/seed.sql`, `e2e/estudiar.spec.ts`

- [ ] **Step 1: Seed de ejemplo:**
  - **Nivel 1 "Base"** con dos módulos:
    - "Reglamento", secuencial: el artículo de inscripción (`ver`), una página "Cómo buscar una materia en el portal (ejemplo)" con pasos y cajas, y un video de enlace (`ver`);
    - "Plataformas", con prerrequisito "Reglamento": el artículo del portal (`marcar_hecho`).
  - **Nivel 2 "Operativo"** con un módulo y un ítem.
  - **Capacitación "Herramientas del CEO (ejemplo)"** en la ruta del subrol CEO (obligatoria).
- [ ] **Step 2: Tests**:
  - el asesor de Neuquén ve en Inicio la tarjeta del Nivel 1 al 0% y "Continuar" lo lleva a la primera lección;
  - recorre las lecciones en orden;
  - el ítem de "Plataformas" aparece bloqueado hasta terminar "Reglamento";
  - al terminar, el Nivel 2 se desbloquea en `/estudiar`;
  - `asesor2.nqn` (CEO) ve su capacitación obligatoria y `asesor.nqn` no;
  - el coordinador crea un curso de sede con un módulo y una página, y lo publica; el asesor de Neuquén lo ve y el de Roca no.
- [ ] **Step 3:** `db reset && e2e` → PASS (incluye todos los anteriores).
- [ ] **Step 4: Commit** `test(e2e): cursos y ruta de aprendizaje`

## Cierre

Suite completa en verde y revisión independiente de la rama.
