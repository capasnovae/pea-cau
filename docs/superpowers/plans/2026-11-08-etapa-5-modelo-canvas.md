# PEA · Etapa 5 (Modelo Canvas: navegación, tablero, cursos, calendario y bandeja) — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Que el asesor vea PEA como "su Canvas" en PC: barra lateral con íconos, Tablero con pestañas Tablero / Cursos, Mis cursos con la tabla de todos los cursos, Calendario, Bandeja de entrada dentro de la sede (con anuncios de coordinación) y una pantalla de bienvenida con elección de rol que lleva al mismo ingreso.

**Architecture:** El mismo patrón que las etapas anteriores.
- **Reglas en Postgres:** RLS y funciones `security definer` con `search_path=''`, probadas con pgTAP. La bandeja se escribe solo por RPC; la lectura de conversaciones y mensajes exige ser participante.
- **App:** Next.js con el cliente del usuario. El shell (`app/(app)/layout.tsx`) pasa a una barra lateral angosta de íconos en PC y mantiene la píldora inferior en celular.
- **Rutas:** se conservan las URL actuales para no romper enlaces: Tablero = `/inicio` y Cursos = `/estudiar`.
- **Etapas:** los exámenes pasan a ser la Etapa 6 y se corre la numeración del resto.

**Tech Stack:** el de siempre (Next.js 16, React 19, Tailwind 4, Supabase, Vitest, pgTAP, Playwright).

**Spec:** `docs/superpowers/specs/2026-11-05-pea-design.md`, con el anexo §4.9 que agrega la Tarea 1. El diseño aprobado son los tableros D-* de https://claude.ai/artifact/31RxfyMWbpaG5QkLPoJTUd: D-Bienvenida (camino de niveles a la izquierda y elección de rol a la derecha), D-Tablero, D-Cursos, D-Calendario y D-Bandeja.

## Global Constraints

- Todo lo de las etapas anteriores sigue valiendo: estilo B, español rioplatense, mobile-first, sin datos de alumnos y contenido "(ejemplo)" hasta el relevamiento.
- **Textos mínimos (pedido del usuario):** nada de párrafos explicativos, subtítulos que repiten el título ni descripciones bajo cada opción. Etiquetas y títulos cortos, y estados vacíos de una sola frase breve ("Sin consignas pendientes."). Si la interfaz se entiende sola, no lleva texto. Esto vale también para las pantallas existentes que se tocan en esta etapa.
- Se toma de Canvas **solo la estructura**: nada de logos, nombres ni colores de Canvas o de Siglo. Mientras no haya logo, la marca es el texto "PEA"; el logo queda para otra etapa.
- **Barra lateral en PC (≥ md):** 92 px, fondo `#1e1b4b`, ítems con ícono de 24 px y etiqueta de 12 px. El ítem activo va con fondo blanco y texto `#4338ca`; los inactivos, en `#c7d2fe`.
  - Orden: Cuenta, Tablero, Cursos, Calendario, Bandeja (con contador de sin leer), Exámenes, Repositorio, Organigrama. Después se suman Equipo (líder o más), Contenido (coordinador, director o admin) y Admin (admin). Ayuda va al final.
- **Celular:** la píldora inferior actual muestra 4 ítems (Tablero, Cursos, Calendario, Bandeja) y "Más" con el resto. Cuenta va en el encabezado.
- **Bandeja:**
  - Puede escribirle a otra persona quien comparte sede con ella, y además cualquiera puede escribirle al director o al admin, que a su vez pueden escribirle a cualquiera. Siempre con perfiles activos y nunca a uno mismo. Máximo 50 destinatarios.
  - Los **anuncios** los publican el coordinador (solo para su sede), el director o el admin (para una sede o para todas). No admiten respuestas, salvo de su autor.
  - Asunto de 1 a 150 caracteres y cuerpo de 1 a 5000.
- **Calendario:**
  - Muestra el vencimiento de mis consignas y los eventos de mi sede o globales.
  - El coordinador crea eventos para su sede; el director y el admin, para cualquier sede o para todas (`sede_id null`).
  - Tipos de evento: `capacitacion` y `evento`. Exámenes y recertificación se suman en sus etapas.
  - La semana empieza el **lunes** y "hoy" se calcula en `America/Argentina/Buenos_Aires`.
- **Colores de categoría en el calendario:** consigna `#c2410c`, capacitación `#0f766e`, evento `#4f46e5`.
- **Bienvenida:** `/bienvenida` es pública. El anónimo que entra a `/` va ahí; a cualquier otra ruta privada, a `/ingresar` como hasta ahora. A la izquierda va "PEA", "Perfil Evolutivo de Asesor", "Cada día sabés un poco más." y el camino N1–N4. A la derecha, "¿Cómo ingresás?", tres opciones (Asesor, Coordinador o líder, Director) con ícono y nombre, sin descripción, y el botón "Ingresar" a `/ingresar`. El rol elegido no cambia nada en el ingreso.
- **Exámenes:** en esta etapa la página lista los ítems de tipo `examen` de mis cursos con el chip "Próximamente". Sin lógica nueva.

## Review Focus

1. Un asesor de Roca no puede escribirle a uno de Neuquén ni leer sus mensajes, ni siquiera con un insert directo o adivinando el id de la conversación. Lo cubren los tests de la Tarea 1.
2. El contador de sin leer no cuenta los mensajes propios y baja a 0 al abrir la conversación. Tarea 1 (`mensajes_sin_leer`) y Tarea 7 (la página llama `marcar_leida`).
3. Un coordinador no puede publicar un anuncio para otra sede ni crear eventos globales o de otra sede. Tareas 1 y 2.
4. Navegar meses en el calendario con `?mes=` inválido (`2026-13`, `abc`, vacío) cae al mes actual sin error 500. Tarea 6 (`parseMes`).
5. Un usuario sin sede (director o admin) ve la bandeja y el calendario sin romperse, y su lista de contactos incluye a todos. Tareas 1, 2 y 8 (E2E del director).

---

### Task 1: Bandeja en la base (conversaciones, mensajes, anuncios)

**Files:**
- Create: `supabase/migrations/20261109000100_bandeja.sql`
- Create: `supabase/tests/22_bandeja.test.sql`
- Modify: `docs/superpowers/specs/2026-11-05-pea-design.md`. Agregar §4.9 "Modelo Canvas: navegación, calendario y bandeja" con las reglas de Global Constraints. Renumerar §10 Etapas: 5 Modelo Canvas, 6 Exámenes, 7 Perfil, 8 Panel, 9 Recertificación, 10 IA.
- Modify: `lib/supabase/tipos.ts` (regenerar con `npx supabase gen types typescript --local > lib/supabase/tipos.ts`)

**Interfaces:**
- Produces:
  - Tablas:
    - `conversaciones(id, asunto, es_anuncio bool, sede_id uuid null, creada_por uuid, created_at, ultimo_mensaje_at)`
    - `conversacion_participantes(conversacion_id, usuario_id, leido_at timestamptz null, archivada bool default false, PK(conversacion_id, usuario_id))`
    - `mensajes(id, conversacion_id, autor_id, cuerpo, created_at)`, con índice `(conversacion_id, created_at)`
  - RLS habilitada en las tres tablas. Solo `select`, con `public.es_participante(p_conversacion uuid) returns boolean`. Sin políticas de insert, update ni delete.
  - Funciones. Todas `security definer`, `set search_path=''`, `revoke` a public/anon y `grant execute` a authenticated:
    - `puede_escribir_a(p_destino uuid) returns boolean`, con la regla de Global Constraints.
    - `contactos_bandeja() returns table(id uuid, nombre text, apellido text, rol public.rol_app, sede text, mismo_equipo boolean)`: perfiles a los que puedo escribir, ordenados por apellido y nombre. Sin email ni teléfono.
    - `iniciar_conversacion(p_destinatarios uuid[], p_asunto text, p_cuerpo text) returns uuid`. Deduplica y saca al propio usuario. Errores: `'sin destinatarios'` si queda vacío; `'demasiados destinatarios'` si son más de 50; `'destinatario no permitido'` si alguno falla `puede_escribir_a`.
    - `responder(p_conversacion uuid, p_cuerpo text) returns uuid` (id del mensaje). Errores: `'no participás de esta conversación'`; `'los anuncios no admiten respuestas'` si es anuncio y quien responde no es `creada_por`. Efectos: actualiza `ultimo_mensaje_at`, pone mi `leido_at=now()` y `archivada=false` para todos.
    - `publicar_anuncio(p_asunto text, p_cuerpo text, p_sede uuid) returns uuid`.
      - Coordinador: con `p_sede` null usa su sede; con otra sede, `'sin permiso'`.
      - Director o admin: cualquier sede, o null para todas.
      - Otros roles: `'sin permiso'`.
      - Participantes: el autor y todos los perfiles activos de la sede (o todos los activos si es null).
    - `marcar_leida(p_conversacion uuid) returns void` y `archivar(p_conversacion uuid, p_archivada boolean) returns void`. Ambas fallan con `'no participás de esta conversación'`.
    - `mi_bandeja(p_filtro text default 'entrada') returns table(conversacion_id uuid, asunto text, es_anuncio boolean, participantes text, ultimo_cuerpo text, ultimo_autor text, ultimo_mensaje_at timestamptz, sin_leer boolean, archivada boolean)`.
      - Filtros: `'entrada'` (no archivadas), `'sin_leer'`, `'anuncios'`, `'enviados'` (con algún mensaje mío) y `'archivadas'`. Cualquier otro valor da el error `'filtro inválido'`.
      - `participantes` = los otros participantes como "Nombre Apellido", unidos con ", " y ordenados. En un anuncio es el nombre del autor.
      - `ultimo_cuerpo` = los primeros 140 caracteres del último mensaje.
      - Orden: `ultimo_mensaje_at desc`.
    - `mensajes_sin_leer() returns int`: conversaciones no archivadas con algún mensaje de otro autor con `created_at > coalesce(leido_at, '-infinity')`.
    - `mensajes_de(p_conversacion uuid) returns table(id uuid, autor_id uuid, autor text, cuerpo text, created_at timestamptz, propio boolean)`, en orden cronológico. Error si no participo.
    - `participantes_de(p_conversacion uuid) returns table(id uuid, nombre text)`. Error si no participo.
  - Checks: `char_length(asunto) between 1 and 150` y `char_length(btrim(cuerpo)) between 1 and 5000`.

- [ ] **Step 1: Escribir `22_bandeja.test.sql`** usando `tests.escenario()`. Cada caso es un `ok`, `is`, `throws_ok` o `lives_ok`:
  - `contactos_bandeja()` como ase1: incluye ase2, aseV, coordS y dir; excluye a aseR, a ase1 y a un perfil de T-Neuquén con `activo=false`.
  - ase1 → ase2: `iniciar_conversacion` funciona. ase1 → aseR da `'destinatario no permitido'`. dir → aseR funciona, y aseR → dir también.
  - `iniciar_conversacion('{}', …)` da `'sin destinatarios'`; un arreglo con solo el propio id, también. Con 51 ids, `'demasiados destinatarios'`. Un cuerpo de `'   '` viola el check (`throws_ok` con 23514).
  - Como aseV (no participa): `select count(*) from conversaciones` = 0 y de `mensajes` = 0. `responder(conv, 'x')` y `mensajes_de(conv)` dan `'no participás de esta conversación'`.
  - `insert into mensajes(...)` directo como ase1 da 42501.
  - Sin leer: ase1 escribe a ase2. `mensajes_sin_leer()` da 1 para ase2 y 0 para ase1. Después de `marcar_leida` como ase2, da 0.
  - Archivado: ase2 archiva. La conversación no aparece en `mi_bandeja('entrada')` y sí en `'archivadas'`. Cuando ase1 responde, vuelve a `'entrada'` de ase2 con `sin_leer = true`.
  - `mi_bandeja('enviados')` como ase1 la incluye; como ase2, antes de responder, no. `mi_bandeja('xxx')` da `'filtro inválido'`.
  - Anuncios:
    - ase1 `publicar_anuncio` da `'sin permiso'`.
    - coordS con `p_sede` = T-Roca da `'sin permiso'`.
    - coordS con null funciona: ase1 lo ve con `es_anuncio = true` y aseR no.
    - ase1 `responder` sobre el anuncio da `'los anuncios no admiten respuestas'`; coordS responde sin error.
    - dir con null: aseR lo ve.
  - Como anon: `iniciar_conversacion` da 42501 (sin permiso de ejecución).
- [ ] **Step 2:** `npx supabase test db` → FAIL en 22 (las funciones no existen).
- [ ] **Step 3:** Escribir la migración con las tablas, la RLS y las funciones de Interfaces. Agregar §4.9 a la spec y renumerar las etapas.
- [ ] **Step 4:** `npx supabase db reset && npx supabase test db` → `Result: PASS`. Regenerar `tipos.ts` y correr `npm run typecheck` → sin errores.
- [ ] **Step 5:** Commit `feat(bandeja): conversaciones, mensajes y anuncios con RLS`.

### Task 2: Calendario, favoritos y resumen de trabajo en la base

**Files:**
- Create: `supabase/migrations/20261109000200_calendario.sql`
- Create: `supabase/tests/23_calendario.test.sql`
- Modify: `lib/supabase/tipos.ts` (regenerar)

**Interfaces:**
- Produces:
  - `create type public.tipo_evento as enum ('capacitacion','evento')`.
  - Tabla `eventos(id, titulo text check 1..120, descripcion text default '' check ≤2000, fecha date not null, hora time null, tipo tipo_evento default 'evento', sede_id uuid null, creado_por uuid, created_at)`. Lleva un trigger `before insert` que fija `creado_por := auth.uid()`.
  - RLS de `eventos`:
    - select: `mi_perfil_activo()` y (`sede_id is null` o `sede_id = mi_sede()` o `mi_rol() in ('director','admin')`);
    - insert, update y delete: `public.puede_gestionar_evento(sede_id)`, que es true si `mi_rol() in ('director','admin')` o si (`mi_rol()='coordinador'` y `sede_id = mi_sede()`).
  - Tabla `cursos_favoritos(usuario_id uuid default auth.uid(), curso_id, created_at, PK(usuario_id, curso_id))`.
    - RLS de select y delete: `usuario_id = auth.uid()`;
    - RLS de insert: `usuario_id = auth.uid() and puede_leer_curso(curso_id)`.
  - `public.hoy_ar() returns date`: `(now() at time zone 'America/Argentina/Buenos_Aires')::date`.
  - `mi_calendario(p_desde date, p_hasta date) returns table(fecha date, hora time, titulo text, categoria text, ref_id uuid, estado text)`.
    - Es `security invoker`, así que aplica la RLS.
    - `categoria` vale `'consigna'` (de mis `consigna_asignaciones` con `vence_el` en el rango, con el título de `consignas` y `estado::text`) o el `tipo::text` del evento (con `estado` null).
    - Error `'rango inválido'` si `p_hasta < p_desde` o si el rango supera los 62 días.
  - `mi_trabajo() returns table(por_vencer int, vencidas int, hechas int)`:
    - `por_vencer`: estado pendiente o en_curso con `vence_el` entre hoy_ar y hoy_ar + 7;
    - `vencidas`: estado vencida, o pendiente o en_curso con `vence_el < hoy_ar`;
    - `hechas`: estado hecha con `completada_at` en los últimos 30 días.

- [ ] **Step 1: Escribir `23_calendario.test.sql`**, con `tests.escenario()` más sedes y usuarios del escenario:
  - coordS inserta un evento con `sede_id` T-Neuquén → ok. Con T-Roca → 42501; con null → 42501.
  - dir inserta un evento con null → ok.
  - aseR ve el global y no el de T-Neuquén; ase1 ve los dos.
  - Un evento insertado por coordS con `creado_por` = id de dir queda con `creado_por` = coordS.
  - `mi_calendario`:
    - para ase1, con una asignación que vence dentro del rango, devuelve una fila `categoria='consigna'`;
    - para ase2 no devuelve esa fila;
    - con el rango invertido o de 63 días da `'rango inválido'`.
  - `cursos_favoritos`:
    - ase1 inserta un favorito de un curso global publicado → ok;
    - ase1 inserta con `usuario_id` de ase2 → 42501;
    - ase2 no ve el favorito de ase1.
  - `mi_trabajo()` con tres asignaciones de ase1 (una vence en 3 días, una venció ayer, una hecha hoy) → (1, 1, 1).
- [ ] **Step 2:** `npx supabase test db` → FAIL en 23.
- [ ] **Step 3:** Escribir la migración.
- [ ] **Step 4:** `npx supabase db reset && npx supabase test db` → PASS. Regenerar `tipos.ts`.
- [ ] **Step 5:** Commit `feat(calendario): eventos de sede, favoritos y resumen de trabajo`.

### Task 3: Shell tipo Canvas (barra lateral, cuenta, bienvenida)

**Files:**
- Modify: `lib/dominio/roles.ts`, `lib/dominio/roles.test.ts`
- Modify: `lib/dominio/acceso.ts`, `lib/dominio/acceso.test.ts`
- Create: `components/nav/iconos.tsx` (SVG inline de 24 px, `stroke="currentColor"`, `aria-hidden`; mismos trazos que D-Tablero)
- Create: `components/nav/barra-lateral.tsx` (client: usa `usePathname`)
- Create: `components/nav/panel-cuenta.tsx`
- Modify: `components/nav/menu-principal.tsx` (solo queda la variante inferior)
- Modify: `app/(app)/layout.tsx`
- Modify: `app/page.tsx`
- Create: `app/(auth)/bienvenida/page.tsx`, `app/(auth)/bienvenida/elegir-rol.tsx` (client)
- Modify: `app/(auth)/layout.tsx` (la bienvenida ocupa toda la pantalla: el layout envuelve con `max-w-sm` solo a las demás páginas; mover esas páginas a un grupo `(auth)/(formulario)` con su propio layout)
- Create: `app/(app)/ayuda/page.tsx` (lista corta de contactos de ayuda "(ejemplo)", sin explicaciones)

**Interfaces:**
- Produces:
  - `type IconoMenu = "tablero"|"cursos"|"calendario"|"bandeja"|"examenes"|"repositorio"|"organigrama"|"equipo"|"contenido"|"admin"|"ayuda"`
  - `type ItemMenu = { href: string; etiqueta: string; icono: IconoMenu }`
  - `menuPorRol(rol: RolApp): ItemMenu[]`, con los href en este orden:
    - todos: `/inicio` Tablero, `/estudiar` Cursos, `/calendario` Calendario, `/bandeja` Bandeja, `/examenes` Exámenes, `/repositorio` Repositorio, `/organigrama` Organigrama;
    - más `/equipo/consignas` Equipo para líder o superior;
    - más `/contenido` Contenido para coordinador, director o admin;
    - más `/admin/usuarios` Admin para admin;
    - siempre al final, `/ayuda` Ayuda.
  - `decidirRedireccion`:
    - `/bienvenida` es pública;
    - anónimo en `/` → `/bienvenida`;
    - activo en `/bienvenida` → `/inicio`;
    - todo lo demás, sin cambios.
  - `<BarraLateral items={ItemMenu[]} sinLeer={number} perfil={{ nombre: string }} />`
  - `<PanelCuenta perfil={{ nombre: string; apellido: string; rol: RolApp }} />`: un `<details>` con nombre y rol, y los enlaces "Mi perfil" (`/perfil`), "Mis insignias" (`/perfil#insignias`, con el chip "Próximamente") y "Salir" (form con la acción `salir`).
- Consumes: `mensajes_sin_leer()` (Tarea 1).

- [ ] **Step 1: Actualizar los tests unitarios**
  - `roles.test.ts`: `menuPorRol("asesor").map(i=>i.href)` es igual a `["/inicio","/estudiar","/calendario","/bandeja","/examenes","/repositorio","/organigrama","/ayuda"]`. Los de líder, coordinador y admin insertan sus ítems antes de `/ayuda`. Cada ítem tiene `icono` definido. 
  - `acceso.test.ts`: `decidirRedireccion("/", "anonimo")` es `"/bienvenida"`. Con `("/bienvenida","anonimo")` es null; con `("/bienvenida","activo")`, `"/inicio"`; con `("/calendario","anonimo")`, `"/ingresar"`.
- [ ] **Step 2:** `npm test` → FAIL en roles y acceso.
- [ ] **Step 3:** Implementar `roles.ts`, `acceso.ts`, los componentes y el layout.
  - El layout pide `mensajes_sin_leer` en paralelo con el perfil.
  - En PC: barra lateral fija a la izquierda, sin el encabezado actual, con el buscador dentro de Repositorio. `main` usa `max-w-6xl` y padding `px-10 py-7`.
  - En celular: encabezado con "PEA" y `PanelCuenta`, más la píldora inferior.
  - `app/page.tsx`: si hay sesión, redirige a `/inicio`; si no, a `/bienvenida` (el proxy ya lo resuelve, pero queda por las dudas).
  - La bienvenida replica D-Bienvenida tal como está en Global Constraints: el `radiogroup` de 3 opciones es solo visual, sin texto extra.
- [ ] **Step 4:** `npm test && npm run typecheck && npm run lint` → todo verde.
- [ ] **Step 5:** Commit `feat(shell): barra lateral tipo Canvas, panel de cuenta y bienvenida`.

### Task 4: Tablero con pestañas Tablero / Cursos

**Files:**
- Modify: `app/(app)/inicio/page.tsx`
- Create: `components/tablero/pestanas.tsx`, `components/tablero/tarjeta-curso.tsx` (se reusa en la Tarea 5)

**Interfaces:**
- Consumes: `mi_ruta()`, `mi_trabajo()` y `mi_bandeja('anuncios')` (las primeras 3 filas), más `contactos_bandeja()` filtrado por `mismo_equipo`, con un máximo de 6.
- Produces: `<TarjetaCurso curso={FilaMiRuta} favorito?={boolean} />`, donde `type FilaMiRuta` es la fila de `mi_ruta` en `tipos.ts`. Muestra la cabecera del color del nivel (`colorNivel`), el porcentaje, el título y "Se abre al terminar el Nivel N-1" si está bloqueado, con opacidad 0.6.

- [ ] **Step 1:** Ajustar la página.
  - El encabezado conserva el texto `¡Hola, {nombre}!`, porque lo esperan los E2E (`esperarInicio`).
  - Pestañas como enlaces `role="tab"`: `/inicio` (Tablero) y `/inicio?vista=cursos` (Cursos), con `aria-selected` según `searchParams.vista`.
  - Vista Tablero, en una grilla de 2 columnas en PC y 1 en celular:
    - "Mi trabajo": tres contadores de `mi_trabajo` y la lista de las 3 consignas próximas que ya existe, con "Ver todas" → `/consignas`;
    - "Mi progreso": las `TarjetaCurso` de los cursos desbloqueados no cumplidos;
    - "Novedades": anuncios recientes que enlazan a `/bandeja/{id}`;
    - "Mi equipo": compañeros con el botón "Escribir" → `/bandeja/nueva?para={id}`.
  - Vista Cursos: una grilla de `TarjetaCurso` con todos los cursos de `mi_ruta`, primero los favoritos.
  - Estados vacíos: "Sin consignas pendientes.", "Sin novedades." y "Sin equipo asignado."
- [ ] **Step 2:** `npm run typecheck && npm run lint`. Correr `npx playwright test e2e/auth.spec.ts e2e/estudiar.spec.ts --trace off` → PASS. Si un test buscaba el texto viejo de Inicio, actualizarlo al nuevo y anotarlo.
- [ ] **Step 3:** Commit `feat(tablero): tablero con pestañas, mi trabajo, novedades y mi equipo`.

### Task 5: Mis cursos y "Todos los cursos"

**Files:**
- Modify: `app/(app)/estudiar/page.tsx`
- Modify: `app/(app)/estudiar/acciones.ts` (agregar `alternarFavorito`)
- Create: `app/(app)/estudiar/boton-favorito.tsx` (client, con `useActionState`)

**Interfaces:**
- Consumes: `mi_ruta()`, `cursos_favoritos` (Tarea 2) y `TarjetaCurso` (Tarea 4).
- Produces: `alternarFavorito(cursoId: string): Promise<{ ok: boolean; favorito?: boolean; error?: string }>` en `acciones.ts`. Valida el uuid con zod, inserta o borra en `cursos_favoritos` y revalida `/estudiar` y `/inicio`.

- [ ] **Step 1:** Rehacer la página según D-Cursos.
  - Título "Mis cursos".
  - Grilla de 4 columnas con las tarjetas de cursos en curso y bloqueados.
  - Tarjeta "Todos los cursos": una tabla con columnas Favorito (botón estrella con `aria-label` "Marcar como favorito" o "Quitar de favoritos" y `aria-pressed`), Curso (enlace a `/estudiar/{id}`), Tipo (Nivel o Capacitación), Estado ("En curso · N%", "Bloqueado" o "Cumplido") y Vigencia (`vigencia_meses` como "N meses", o "—").
  - Sección "Terminados" con los cumplidos.
  - En celular la tabla pasa a una lista de filas apiladas (`hidden md:table` y `md:hidden`).
  - El texto "Mi ruta" deja de ser el título. Si un E2E lo usa, actualizarlo.
- [ ] **Step 2:** `npm run typecheck && npm run lint && npx playwright test e2e/estudiar.spec.ts --trace off` → PASS.
- [ ] **Step 3:** Commit `feat(cursos): mis cursos con tabla de todos los cursos y favoritos`.

### Task 6: Calendario

**Files:**
- Create: `lib/dominio/calendario.ts`, `lib/dominio/calendario.test.ts`
- Create: `app/(app)/calendario/page.tsx`, `app/(app)/calendario/acciones.ts`, `app/(app)/calendario/formulario-evento.tsx`

**Interfaces:**
- Consumes: `mi_calendario`, `eventos` y `hoy_ar` (Tarea 2).
- Produces, en `calendario.ts`:
  - `parseMes(valor: string | undefined, hoy: Date): { anio: number; mes: number }`. `mes` va de 1 a 12. Si el valor no es `AAAA-MM` válido, devuelve el mes de `hoy`.
  - `claveMes(m: { anio: number; mes: number }): string` → `"2026-11"`.
  - `mesVecino(m, delta: -1 | 1): { anio; mes }`
  - `gridMes(m): string[][]`: semanas de lunes a domingo con fechas ISO `AAAA-MM-DD`, incluidos los días de relleno de los meses vecinos. Son 5 o 6 filas de 7.
  - `nombreMes(m): string` → `"Noviembre 2026"`.
  - `agruparPorDia<T extends { fecha: string }>(filas: T[]): Map<string, T[]>`
  - `COLOR_CATEGORIA: Record<"consigna"|"capacitacion"|"evento", string>`, con los valores de Global Constraints.
  - `esquemaEvento`, de zod: `titulo` 1..120 recortado, `descripcion` ≤2000, `fecha` ISO, `hora` opcional `HH:MM`, `tipo` en el enum y `sede_id` uuid o vacío → null.
- `crearEvento(estado, formData)` y `borrarEvento(id: string)` en `acciones.ts`. Exigen `requerirRol(["coordinador","director","admin"])` y dejan que la RLS decida la sede. Si la RLS rechaza, devuelven el error "No podés crear eventos para esa sede.".

- [ ] **Step 1: Escribir `calendario.test.ts`**
  - `parseMes("2026-11", hoy)` → `{2026, 11}`. `parseMes("2026-13", hoy)`, `parseMes("abc", hoy)` y `parseMes(undefined, hoy)` → el mes de `hoy`.
  - `mesVecino({2026,12}, 1)` → `{2027,1}` y `mesVecino({2026,1}, -1)` → `{2025,12}`.
  - `gridMes({2026,11})[0][0] === "2026-10-26"`, porque el 1/11/2026 es domingo y la semana arranca el lunes 26/10. El grid tiene 6 filas y todas miden 7. `gridMes({2027,2})` tiene 4 filas: febrero de 2027 empieza el lunes 1 y tiene 28 días.
  - `nombreMes({2026,11}) === "Noviembre 2026"`.
  - `esquemaEvento` rechaza el título vacío y la hora `"25:00"`.
- [ ] **Step 2:** `npm test` → FAIL.
- [ ] **Step 3:** Implementar `calendario.ts` y la página según D-Calendario.
  - Encabezado: "Calendario", el botón "Hoy" (`/calendario`), ‹ › (`?mes=` del mes vecino) y el nombre del mes.
  - Vista mes en PC: grilla de 7 columnas con los días del mes y los eventos como chips del color de su categoría. Los días de otros meses van atenuados y hoy, con un círculo índigo.
  - En celular: vista agenda, una lista por día solo con los días que tienen eventos.
  - Columna derecha en PC: leyenda de categorías y, para los roles de gestión, el formulario "Nuevo evento" (select de sede: la propia para el coordinador; "Todas" o cualquier sede para el director y el admin).
  - El chip de consigna enlaza a `/consignas`.
  - Rango que se pide a `mi_calendario`: del primer al último día de `gridMes`.
- [ ] **Step 4:** `npm test && npm run typecheck && npm run lint` → verde.
- [ ] **Step 5:** Commit `feat(calendario): vista mes y agenda con consignas y eventos de sede`.

### Task 7: Bandeja de entrada

**Files:**
- Create: `lib/dominio/bandeja.ts`, `lib/dominio/bandeja.test.ts`
- Create: `app/(app)/bandeja/page.tsx` (lista y estado vacío a la derecha), `app/(app)/bandeja/[id]/page.tsx` (lista y conversación), `app/(app)/bandeja/nueva/page.tsx`, `app/(app)/bandeja/acciones.ts`, `app/(app)/bandeja/formularios.tsx`, `app/(app)/bandeja/lista.tsx`

**Interfaces:**
- Consumes: todas las RPC de la Tarea 1.
- Produces, en `bandeja.ts`:
  - `FILTROS_BANDEJA = ["entrada","sin_leer","anuncios","enviados","archivadas"] as const`, `ETIQUETA_FILTRO` ("Bandeja de entrada", "Sin leer", "Anuncios", "Enviados", "Archivados") y `parseFiltro(v: string | undefined): FiltroBandeja` (por defecto `"entrada"`).
  - `esquemaMensajeNuevo`: `destinatarios` es un arreglo de uuid de 1 a 50 (desde `formData.getAll("para")`), `asunto` 1..150 recortado y `cuerpo` 1..5000 recortado.
  - `esquemaRespuesta`: `cuerpo` 1..5000.
  - `esquemaAnuncio`: `asunto`, `cuerpo` y `sede_id` uuid o vacío → null.
  - `fechaCorta(iso: string, ahora: Date): string`: "HH:MM" si es hoy, "ayer", el día de la semana abreviado ("lun") si es de los últimos 6 días, o "D/M".
  - `iniciales(nombre: string): string` → "MG" para "Martín Gómez".
- Acciones en `acciones.ts`, todas con `revalidatePath("/bandeja")` y `revalidatePath("/", "layout")` para el contador:
  - `enviarNuevo`: llama `iniciar_conversacion` y redirige a `/bandeja/{id}`;
  - `responder`;
  - `publicarAnuncio`: `requerirRol(["coordinador","director","admin"])`;
  - `archivar(id: string, archivada: boolean)`.
  - Los errores de la RPC se traducen a mensajes para el usuario: `'destinatario no permitido'` → "Solo podés escribirle a gente de tu sede."; `'los anuncios no admiten respuestas'` → "Este anuncio no admite respuestas.".

- [ ] **Step 1: Escribir `bandeja.test.ts`**
  - `parseFiltro("anuncios") === "anuncios"` y `parseFiltro("x") === "entrada"`.
  - `esquemaMensajeNuevo` rechaza `destinatarios: []` y un asunto de 151 caracteres, y acepta un uuid con asunto y cuerpo.
  - `fechaCorta` con `ahora = 2026-11-06T15:00-03:00`: el mismo día a las 10:24 → `"10:24"`; el 5/11 → `"ayer"`; el 2/11 → `"lun"`; el 20/10 → `"20/10"`.
  - `iniciales("Martín Gómez") === "MG"` e `iniciales("Ana") === "A"`.
- [ ] **Step 2:** `npm test` → FAIL.
- [ ] **Step 3:** Implementar según D-Bandeja.
  - Barra superior: título, select de filtro (`?filtro=`, con un form GET), "Nuevo mensaje" y, para los roles de gestión, "Nuevo anuncio" (`/bandeja/nueva?anuncio=1`).
  - Lista de 420 px: punto índigo si hay sin leer, avatar con iniciales, nombre, chip "ANUNCIO", fecha corta y primera línea.
  - Panel derecho:
    - en `/bandeja`, el estado vacío "Ninguna conversación abierta";
    - en `/bandeja/[id]`, los mensajes como burbujas (los propios a la derecha, en índigo suave), los participantes arriba, el formulario de respuesta (oculto si es un anuncio ajeno, sin texto en su lugar) y el botón Archivar o Desarchivar. Al renderizar se llama `marcar_leida`.
  - En celular, `/bandeja` muestra solo la lista y `/bandeja/[id]` solo la conversación, con un enlace "‹ Bandeja".
  - `/bandeja/nueva`: checkboxes de contactos (`contactos_bandeja`) agrupados por sede con un filtro de texto del lado del cliente. `?para=` premarca uno. Después vienen asunto y cuerpo. Con `?anuncio=1`, en lugar de los contactos va el select de sede.
- [ ] **Step 4:** `npm test && npm run typecheck && npm run lint` → verde.
- [ ] **Step 5:** Commit `feat(bandeja): bandeja de entrada, conversaciones y anuncios`.

### Task 8: Exámenes (placeholder), recursos en Repositorio, seed y E2E

**Files:**
- Create: `app/(app)/examenes/page.tsx`
- Modify: `app/(app)/repositorio/page.tsx` (encabezado con el buscador `form action="/buscar"` y pestañas Artículos / Recursos que enlazan a `/repositorio` y `/recursos`; misma cabecera en `app/(app)/recursos/page.tsx`)
- Modify: `supabase/seed.sql`
  - 3 eventos "(ejemplo)" en noviembre de 2026: 1 global del director y 2 de Neuquén del coordinador de servicio, uno de tipo `capacitacion`.
  - 1 anuncio de `coord.servicio.nqn@` para Neuquén.
  - 1 conversación entre `lider.nqn@` y `asesor.nqn@`, con 2 mensajes.
  - Inserción directa (el seed corre como postgres), con fechas relativas a `now()`.
- Create: `e2e/canvas.spec.ts`
- Modify: los E2E existentes que dependan del menú viejo (etiqueta "Inicio" → "Tablero", "Estudiar" → "Cursos")

**Interfaces:**
- Consumes: todo lo anterior. `/examenes` usa `mi_ruta()`, y por cada curso desbloqueado pide `estado_curso(curso_id)`, filtra los ítems `tipo='examen'` y lista curso, módulo, título y el chip "Próximamente". Si no hay ninguno: "Sin exámenes por ahora.".

- [ ] **Step 1: Escribir `e2e/canvas.spec.ts`**, con `test.skip(!await hayApiRest())` como los demás:
  - **Anónimo en `/`:** termina en `/bienvenida`. Ve "¿Cómo ingresás?" y las tres opciones; "Ingresar" lleva a `/ingresar`.
  - **Barra lateral del asesor** (`asesor.nqn@`), a 1440×900: `getByRole("navigation", { name: "Principal" })` contiene en orden Tablero, Cursos, Calendario, Bandeja, Exámenes, Repositorio, Organigrama y Ayuda, y no contiene "Contenido". Tablero tiene `aria-current="page"`.
  - **Bandeja:**
    - `asesor.nqn@` ve el anuncio del seed con el chip "ANUNCIO", lo abre y no ve el campo de respuesta;
    - crea un mensaje nuevo para "asesor2" con asunto "Prueba E2E" → la URL pasa a `/bandeja/<uuid>` y se ve el mensaje;
    - con otra sesión, `asesor2.nqn@` ve "Prueba E2E" con el indicador de sin leer y el contador "1" en Bandeja; al abrirla, el contador desaparece.
  - **Contactos fuera de la sede:** en `/bandeja/nueva`, `asesor.roca@` no ve a ningún contacto de Neuquén salvo director y admin.
  - **Calendario:** `coord.servicio.nqn@` crea el evento "Evento E2E" para el día 15 del mes actual → aparece en la grilla. `asesor.nqn@` lo ve y `asesor.roca@` no.
  - **Mis cursos:** `asesor.nqn@` en `/estudiar` marca como favorito el Nivel 1 → el botón queda `aria-pressed="true"`, y en `/inicio?vista=cursos` el Nivel 1 aparece primero.
  - **Director** (sin sede): `/bandeja` y `/calendario` cargan sin error y ven el evento global.
- [ ] **Step 2:** `npx supabase db reset` y `npx playwright test --trace off` → los nuevos fallan donde falte algo. Implementar `/examenes`, las pestañas del repositorio y el seed, y ajustar los E2E viejos.
- [ ] **Step 3:** Suite completa: `npx supabase test db` (PASS), `npm test`, `npm run typecheck`, `npm run lint` y `npx playwright test --trace off` → todo verde. Capturas a 1440×900 y 390×844 de Tablero, Cursos, Calendario y Bandeja en `scratchpad`, comparadas con los tableros D-*.
- [ ] **Step 4:** Commit `feat(canvas): exámenes, recursos en repositorio, seed y E2E del modelo Canvas`.
