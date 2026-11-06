# PEA · Etapa 6 (Exámenes) — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Banco de preguntas con los seis tipos, exámenes configurables (por módulo, categoría, nivel y ubicación), intentos resueltos del lado del servidor, revisión después de entregar, cola de corrección por sede para las respuestas libres y examen de ubicación por bloques. Aprobar el examen final de un nivel lo certifica y desbloquea el siguiente.

**Architecture:** Igual que antes: reglas en Postgres y pantallas en Next.js.
- **Base:**
  - El asesor nunca lee las tablas `preguntas`, `opciones` ni `casos`. Las ve solo a través de RPC `security definer` que devuelven el enunciado sin la respuesta correcta, sin la explicación y sin la rúbrica.
  - Sorteo, guardado, corrección y efectos ocurren en funciones de la base, probadas con pgTAP.
- **Certificaciones:** la tabla `certificaciones` nace en esta etapa, sin PDF, para registrar niveles aprobados o acreditados por ubicación. En la Etapa 7 se suman el PDF, el QR, la verificación pública y las insignias.
- **Desbloqueo:** el nivel N se desbloquea si el N-1 está cumplido, sea por todos sus pasos (incluido el examen final con `aprobar`) o por una certificación vigente.

**Tech Stack:** el de siempre.

**Spec:** `docs/superpowers/specs/2026-11-05-pea-design.md`: §4.4 (exámenes), el esquema de exámenes y certificaciones de §5 y §6 (RLS). Las etapas quedaron renumeradas en la Etapa 5: esta es la 6.

## Global Constraints

- Todo lo anterior sigue valiendo: estilo B, modelo Canvas, español rioplatense, mobile-first, **textos mínimos** (sin párrafos explicativos; estados vacíos de una frase) y contenido "(ejemplo)".
- **Tipos de pregunta** (enum `tipo_pregunta`):
  - `opcion_multiple`: una o varias correctas; se acierta si se marca exactamente el conjunto correcto.
  - `verdadero_falso`: dos opciones, "Verdadero" y "Falso".
  - `escenario`: `contexto_md` más opciones, y se corrige como opción múltiple.
  - `ordenar`: las opciones tienen `posicion_correcta` y se acierta con el orden exacto.
  - `simulacion`: preguntas de opciones encadenadas en un `caso` (`caso_id`, `orden_en_caso`); se sortean como bloque y en orden.
  - `libre`: con `rubrica_md` y `puntaje_max`; la corrige una persona.
- **Puntaje:**
  - Cada pregunta vale `puntaje_max` (por defecto 1). Las automáticas valen todo o nada.
  - Nota = `round(100 × suma de puntajes / suma de puntajes máximos)`.
  - Se aprueba con `nota >= nota_minima` (por defecto 80).
- **Configuración del examen:**
  - Tipos de examen: `modulo`, `categoria`, `nivel` y `ubicacion` (`actualizacion` se suma en la Etapa 9).
  - Valores: `cantidad_preguntas`, `nota_minima` 80, `max_intentos` 3 por ciclo, `espera_horas` 24 entre ciclos, `tiempo_limite_min` opcional, y `mezclar` (preguntas y opciones).
  - El pozo de preguntas sale de las preguntas publicadas: por módulo, las de `modulo_id`; por categoría, las de `categoria_id`; por nivel, las de los módulos de `curso_id`.
- **Intentos:**
  - Un intento en curso por examen; si existe uno, iniciar lo retoma.
  - Ciclos:
    - Mientras queden intentos en el ciclo actual, se puede iniciar.
    - Con el ciclo agotado, se inicia uno nuevo después de `espera_horas` desde la última entrega.
    - Si ya aprobó, no se rinde de nuevo; la recertificación es la Etapa 9.
  - Tiempo límite: `vence_at = iniciado_at + tiempo`. Hay 2 minutos de gracia para guardar respuestas.
    - Entregar siempre funciona y corrige lo guardado.
    - Un intento vencido que no se entregó se entrega solo la próxima vez que el usuario abre el examen o inicia otro intento.
- **Corrección:**
  - La cola es de la sede del intento, copiada al iniciar.
  - Corrigen líder, coordinador, director o admin con acceso a esa sede, nunca su propio intento.
  - Tomar un intento lo asigna. Queda libre si lo sueltan o si pasaron 24 h desde `tomado_at`; se calcula al leer, sin job.
  - Plazo de 72 h desde la entrega; si se pasa, se marca "Vencida" en la cola. El aviso al coordinador se suma con las alertas en la Etapa 9.
- **Examen de ubicación:**
  - Lo habilita un coordinador (de la sede y área del asesor), un director o el admin, con `habilitar_ubicacion(usuario)`, que también marca `experiencia_previa = true`.
  - Se rinde una sola vez y avanza por bloques: Nivel 1, 2 y 3, en un intento por bloque con `bloque_nivel`.
  - Cada bloque aprobado emite una certificación con origen `ubicacion` para ese nivel. El primer bloque desaprobado corta la ubicación y escribe `ubicacion_rendida_at`; aprobar el bloque 3 también la escribe.
  - Hay un único examen `ubicacion` publicado (global); sus preguntas por bloque salen de los módulos del curso de nivel N.
- **Efectos al cerrar un intento aprobado:**
  - Examen `nivel`: certificación con origen `examen` y `vence_at = emitida_at + cursos.vigencia_meses` (null si no vence).
  - Un ítem de curso `examen` con `requisito = 'aprobar'` y `examen_id` se cumple si existe un intento aprobado de ese examen; se calcula, no se escribe.
  - Se quita el check `items_sin_aprobar_hasta_examenes` de la Etapa 4.
- **Seguridad:**
  - El asesor nunca recibe `es_correcta`, `posicion_correcta`, `explicacion_md` ni `rubrica_md` antes de que el intento esté `cerrado`.
  - La revisión la ven el dueño y quien pueda ver al usuario (`puede_ver_usuario`).
- **Autoría:** preguntas, casos y exámenes siguen el mismo alcance que los cursos (`puede_editar_contenido(alcance, sede_id)`). El admin promueve con `promover_contenido`, que suma `preguntas`, `casos` y `examenes`.

## Review Focus

1. Un asesor que llama por PostgREST a `preguntas`, `opciones`, `casos` o `respuestas` de otro, o a la revisión de un intento abierto, no obtiene respuestas correctas, explicaciones ni rúbricas. Tests en las Tareas 1 y 3.
2. Doble clic en "Empezar" o dos pestañas no crean dos intentos ni consumen dos intentos del ciclo. Tarea 3: iniciar es idempotente mientras haya uno en curso.
3. Responder después del tiempo límite más la gracia no se guarda, y entregar tarde corrige solo lo guardado a tiempo. Tarea 3.
4. Un corrector no corrige su propio intento ni uno de otra sede, y dos correctores no toman el mismo intento. Tarea 5.
5. Un pozo con menos preguntas que `cantidad_preguntas` no rompe: se sortean todas las disponibles, y si no hay ninguna se avisa "Este examen todavía no tiene preguntas". Tarea 3.

---

### Task 1: Banco de preguntas y exámenes en la base

**Files:**
- Create: `supabase/migrations/20261110000100_examenes.sql`
- Create: `supabase/tests/24_examenes_esquema.test.sql`
- Modify: `supabase/tests/00_ayudantes.sql`: agregar `tests.escenario_examenes()`. Crea un examen de módulo sobre M1 del escenario de cursos con 3 preguntas (opción múltiple, V/F y ordenar), un examen con una pregunta libre y un caso de simulación de 2 preguntas.
- Modify: `lib/supabase/tipos.ts` (regenerar y pasar por Prettier)

**Interfaces:**
- Produces:
  - Enums:
    - `tipo_pregunta`
    - `tipo_examen ('modulo','categoria','nivel','ubicacion')`
    - `origen_pregunta ('manual','ia')`
    - `estado_intento ('en_curso','pendiente_correccion','cerrado')`
    - `origen_certificacion ('examen','ubicacion')`
    - `estado_certificacion ('vigente','vencida','revocada')`
  - Tablas (columnas de la spec §5, salvo estas aclaraciones):
    - `casos`
    - `preguntas`: `estado` usa `estado_contenido`; `puntaje_max int default 1 check > 0`; `dificultad int 1..3 default 1`.
    - `opciones`
    - `examenes`: `estado estado_contenido`; check de que el tipo tenga su referencia (`modulo` → `modulo_id`, `categoria` → `categoria_id`, `nivel` → `curso_id`, `ubicacion` sin referencia).
    - `intentos`
    - `intento_preguntas`, con PK `(intento_id, pregunta_id)`
    - `respuestas`, con unique `(intento_id, pregunta_id)`
    - `certificaciones (id, usuario_id, curso_id, origen, intento_id null, emitida_at, vence_at null, estado default 'vigente', codigo_verificacion text unique default upper(substr(md5(gen_random_uuid()::text),1,10)), pdf_path null)`
  - `alter table items add constraint items_examen_fk foreign key (examen_id) references examenes(id) on delete set null` y `drop constraint items_sin_aprobar_hasta_examenes`.
  - Checks:
    - `preguntas`: `simulacion` exige `caso_id` y `orden_en_caso`; `libre` exige `rubrica_md`.
    - `opciones`: `posicion_correcta` solo en preguntas `ordenar`, mediante un trigger `validar_opcion`.
  - RLS:
    - `casos`, `preguntas`, `opciones` y `examenes` (escritura): `puede_editar_contenido(alcance, sede_id)`. Las opciones lo heredan de su pregunta con `puede_editar_pregunta(p_pregunta)`.
    - Lectura de `casos`, `preguntas` y `opciones`: solo con la misma función de edición. El asesor no los lee.
    - Lectura de `examenes`: `puede_leer_contenido(alcance, sede_id, estado)`, porque la configuración no es secreta.
    - `intentos`, `respuestas` e `intento_preguntas`: select si `usuario_id = auth.uid()` o `puede_ver_usuario(usuario_id)`, vía el intento. Sin insert, update ni delete: todo pasa por RPC.
    - `certificaciones`: select propio o `puede_ver_usuario`. Sin escritura directa.
  - `promover_contenido` acepta `'preguntas'`, `'casos'` y `'examenes'`.

- [ ] **Step 1: Escribir `24_examenes_esquema.test.sql`**
  - Las tablas y los enums existen.
  - Como ase1, `select count(*) from preguntas` = 0, y lo mismo en `opciones` y `casos`, aunque haya preguntas publicadas globales.
  - Como coordS: inserta una pregunta de su sede → ok; de T-Roca → 42501; global → 42501.
  - Una pregunta `simulacion` sin `caso_id` → 23514.
  - Una opción con `posicion_correcta` en una pregunta `opcion_multiple` → P0001.
  - Un examen `modulo` sin `modulo_id` → 23514.
  - Insert directo en `intentos` como ase1 → 42501.
  - Un ítem `examen` con `requisito = 'aprobar'` ahora se puede crear.
- [ ] **Step 2:** `npx supabase test db` → FAIL en 24.
- [ ] **Step 3:** Escribir la migración y el ayudante.
- [ ] **Step 4:** `npx supabase db reset && npx supabase test db` → PASS. Regenerar `tipos.ts` y correr `npm run typecheck` sin errores. Ojo: `21_correcciones_cursos` espera que `aprobar` esté prohibido; ese caso pasa a probar que se permite (ruling).
- [ ] **Step 5:** Commit `feat(examenes): banco de preguntas, exámenes, intentos y certificaciones`.

### Task 2: Dominio de exámenes (puro)

**Files:**
- Create: `lib/dominio/examenes.ts`, `lib/dominio/examenes.test.ts`

**Interfaces:**
- Produces:
  - `type TipoPregunta`, `ETIQUETA_TIPO_PREGUNTA`, `ETIQUETA_TIPO_EXAMEN`
  - `notaFinal(puntajes: { puntaje: number; max: number }[]): number` → entero 0..100; 0 si el total de máximos es 0.
  - `aprobo(nota: number, minima: number): boolean`
  - `formatoDuracion(segundos: number): string` → `"12:05"`, o `"1:02:03"` si pasa la hora.
  - `estadoExamen(e: { aprobado: boolean; en_curso: boolean; pendiente: boolean; intentos_restantes: number; espera_hasta: string | null }): "aprobado" | "en_curso" | "pendiente" | "disponible" | "en_espera"`, con prioridad en ese orden.
  - `ETIQUETA_ESTADO_EXAMEN` con "Aprobado", "En curso", "Pendiente de corrección", "Disponible" y "En espera".
  - Esquemas zod:
    - `esquemaPregunta`: `tipo`, `enunciado_md` 1..4000, `contexto_md` opcional, `explicacion_md` ≤4000, `rubrica_md` (requerida si es `libre`), `puntaje_max` 1..100, `dificultad` 1..3, `modulo_id`/`categoria_id`/`articulo_fuente_id` uuid o vacío → null, `alcance`, `sede_id` y `estado`.
      - `opciones`: arreglo de `{ texto 1..500, es_correcta, posicion }`.
      - Validaciones según el tipo, con `superRefine`:
        - `opcion_multiple` y `escenario`: de 2 a 8 opciones y al menos una correcta;
        - `verdadero_falso`: exactamente 2 opciones y una correcta;
        - `ordenar`: de 2 a 8 opciones, con el orden de carga como orden correcto;
        - `libre`: sin opciones;
        - `simulacion`: como `opcion_multiple` y además `caso_id`.
    - `esquemaExamen`: `titulo` 1..150, `tipo` y la referencia que corresponde, `cantidad_preguntas` 1..100, `nota_minima` 1..100, `max_intentos` 1..10, `espera_horas` 0..720, `tiempo_limite_min` vacío → null o 1..300, `mezclar` (checkbox `"on"` → true), `alcance`, `sede_id` y `estado`.
    - `esquemaRespuesta`: `pregunta_id` uuid y `opcion_ids`, `orden` o `texto` (≤5000).
    - `esquemaCorreccion`: `respuesta_id` uuid, `puntaje` numérico ≥0 y `devolucion` ≤2000.

- [ ] **Step 1: Escribir `examenes.test.ts`**
  - `notaFinal([{puntaje:1,max:1},{puntaje:0,max:1},{puntaje:2,max:2}]) === 75` y `notaFinal([]) === 0`.
  - `aprobo(80,80) === true` y `aprobo(79,80) === false`.
  - `formatoDuracion(725) === "12:05"` y `formatoDuracion(3723) === "1:02:03"`.
  - `estadoExamen({aprobado:true,…, en_curso:true})` da `"aprobado"`, porque el aprobado gana. Con `intentos_restantes: 0` y `espera_hasta` en el futuro da `"en_espera"`.
  - `esquemaPregunta`:
    - rechaza V/F con 3 opciones, opción múltiple sin correcta, libre sin rúbrica y simulación sin caso;
    - acepta una opción múltiple con 2 correctas.
  - `esquemaExamen`:
    - rechaza un examen de módulo sin `modulo_id`;
    - convierte `tiempo_limite_min: ""` en null y `mezclar: "on"` en true.
- [ ] **Step 2:** `npx vitest run lib/dominio/examenes.test.ts` → FAIL.
- [ ] **Step 3:** Implementar.
- [ ] **Step 4:** Los tests pasan, y `npm run typecheck && npm run lint` también.
- [ ] **Step 5:** Commit `feat(examenes): dominio de notas, estados y validaciones`.

### Task 3: Intentos del lado del servidor (iniciar, responder, entregar, revisar)

**Files:**
- Create: `supabase/migrations/20261110000200_intentos.sql`
- Create: `supabase/tests/25_intentos.test.sql`

**Interfaces:**
- Produces (todas `security definer`, `search_path=''`, ejecutables solo por authenticated):
  - `puede_rendir(p_examen uuid) returns boolean`. El examen tiene que estar publicado y legible, y el usuario activo. Si algún ítem de curso apunta a este examen, alguno de esos ítems tiene que estar disponible para el usuario. `ubicacion` no se rinde por acá.
  - `iniciar_intento(p_examen uuid) returns uuid`. Hace, en orden:
    1. entrega solo los intentos propios vencidos;
    2. si hay uno en curso, devuelve ese;
    3. valida `puede_rendir` (error `'no disponible'`), que no esté aprobado (`'ya aprobado'`) y el ciclo (`'en espera'`);
    4. sortea: preguntas sueltas y casos completos (cada caso es una unidad, en orden) hasta alcanzar `cantidad_preguntas`, sin pasarse salvo por el último caso; error `'sin preguntas'` si el pozo está vacío;
    5. guarda `intento_preguntas` con `orden` y `orden_opciones` (mezclados si `mezclar`);
    6. copia `sede_id`, `area` y `equipo_id` del perfil y calcula `vence_at`.
  - `preguntas_intento(p_intento uuid) returns table(pregunta_id uuid, orden int, tipo tipo_pregunta, enunciado_md text, contexto_md text, caso_titulo text, caso_contexto_md text, puntaje_max int, opciones jsonb, respuesta jsonb)`.
    - `opciones` = `[{id, texto}]` en el orden guardado. Nunca incluye `es_correcta` ni `posicion_correcta`.
    - `respuesta` = `{opcion_ids, orden, texto}` guardada, o null.
    - Solo el dueño (`'sin permiso'`).
  - `guardar_respuesta(p_intento uuid, p_pregunta uuid, p_opcion_ids uuid[], p_orden uuid[], p_texto text) returns void`. Hace upsert. Errores:
    - `'sin permiso'` si no es el dueño;
    - `'intento cerrado'` si no está `en_curso`;
    - `'tiempo agotado'` si `now() > vence_at + 2 min`;
    - `'pregunta ajena'` si la pregunta no está en el intento;
    - `'opción inválida'` si alguna opción no es de esa pregunta.
  - `entregar_intento(p_intento uuid) returns table(estado estado_intento, nota int, aprobado boolean)`. Corrige las cerradas (`es_correcta` y `puntaje`). Si no hay libres, cierra y llama a `aplicar_efectos`; si hay, queda `pendiente_correccion` con `correccion_vence_at = entregado_at + 72 h`. Es idempotente sobre un intento ya entregado.
  - `aplicar_efectos(p_intento uuid) returns void` (interna, revocada a authenticated). Emite la certificación de nivel y gestiona los bloques de ubicación (Tarea 6).
  - `revision_intento(p_intento uuid) returns table(pregunta_id, orden, tipo, enunciado_md, contexto_md, opciones jsonb, respuesta jsonb, es_correcta boolean, puntaje numeric, puntaje_max int, explicacion_md text, devolucion_md text, articulo_fuente_id uuid)`.
    - `opciones` incluye `es_correcta` y `posicion_correcta`.
    - Solo con el intento `cerrado`; si no, `'revisión no disponible'`.
    - Accesible para el dueño o con `puede_ver_usuario`.
  - `mis_examenes() returns table(examen_id uuid, titulo text, tipo tipo_examen, curso_titulo text, cantidad_preguntas int, nota_minima int, tiempo_limite_min int, intentos_restantes int, espera_hasta timestamptz, aprobado boolean, mejor_nota int, intento_en_curso uuid, intento_pendiente uuid)`: exámenes que puedo rendir (sin `ubicacion`), ordenados por título.
  - `item_cumplido`: el caso `'aprobar'` pasa a ser `exists (intento cerrado y aprobado de items.examen_id por p_usuario)`.

- [ ] **Step 1: Escribir `25_intentos.test.sql`** con `tests.escenario()`, `tests.escenario_cursos()` y `tests.escenario_examenes()`:
  - ase1 `iniciar_intento` → uuid. Una segunda llamada devuelve el mismo uuid, y hay una sola fila en `intentos`.
  - `preguntas_intento`:
    - devuelve 3 filas;
    - el JSON de `opciones` no contiene las claves `es_correcta` ni `posicion_correcta` (se comprueba con `jsonb_path_exists`).
  - Como ase2: `preguntas_intento` del intento de ase1 da `'sin permiso'`; `revision_intento`, también.
  - `guardar_respuesta` con una opción de otra pregunta da `'opción inválida'`.
  - Con el intento de tiempo límite y `vence_at` corrido 10 minutos al pasado (como postgres), `guardar_respuesta` da `'tiempo agotado'`.
  - Responde todo bien y entrega: `(cerrado, 100, true)`. Entregar de nuevo devuelve lo mismo sin duplicar.
  - `revision_intento` como ase1 trae `explicacion_md` y `es_correcta`; como lider1 (que ve a ase1), también.
  - Antes de entregar, `revision_intento` da `'revisión no disponible'`.
  - Iniciar de nuevo tras aprobar da `'ya aprobado'`.
  - Ciclo: con `max_intentos = 1` y un intento reprobado, iniciar da `'en espera'`. Corriendo `entregado_at` 25 h atrás, inicia un ciclo nuevo con `ciclo = 2`.
  - Examen libre: entregar da `pendiente_correccion` con `correccion_vence_at` a 72 h.
  - Un pozo vacío da `'sin preguntas'`. Un pozo de 3 con `cantidad_preguntas = 10` sortea 3.
  - Simulación: un examen que incluye el caso trae sus 2 preguntas seguidas y en `orden_en_caso`.
  - Un ítem `aprobar` con ese examen queda cumplido después de aprobar (`estado_curso`).
- [ ] **Step 2:** `npx supabase test db` → FAIL en 25.
- [ ] **Step 3:** Escribir la migración.
- [ ] **Step 4:** `npx supabase db reset && npx supabase test db` → PASS. Regenerar los tipos.
- [ ] **Step 5:** Commit `feat(examenes): intentos con sorteo, guardado, entrega y revisión en el servidor`.

### Task 4: Certificación de nivel y desbloqueo

**Files:**
- Modify: `supabase/migrations/20261110000200_intentos.sql` (`aplicar_efectos`) o una nueva `20261110000300_certificaciones.sql` con `curso_cumplido` y `curso_desbloqueado` actualizados
- Create: `supabase/tests/26_certificaciones.test.sql`

**Interfaces:**
- Produces:
  - `aplicar_efectos` emite la certificación al aprobar un examen `nivel`. Es una por curso y origen vigente: si ya hay una vigente, no se duplica.
  - `curso_cumplido(p_curso, p_usuario)` = (lógica actual) **o** existe una certificación `vigente` de ese curso para el usuario.
  - `curso_desbloqueado` usa `curso_cumplido` del nivel anterior, así que hereda la certificación.
- [ ] **Step 1: Test**
  - Aprobar el examen `nivel` del Nivel A del escenario emite 1 certificación vigente con `vence_at` = `emitida_at` + `vigencia_meses`.
  - El Nivel B queda desbloqueado aunque haya pasos de A sin ver.
  - ase2 no ve la certificación de ase1; lider1 sí.
  - Insert directo en `certificaciones` → 42501.
- [ ] **Step 2:** FAIL.
- [ ] **Step 3:** Implementar.
- [ ] **Step 4:** PASS.
- [ ] **Step 5:** Commit `feat(examenes): certificación de nivel al aprobar el examen final`.

### Task 5: Cola de corrección

**Files:**
- Create: `supabase/migrations/20261110000400_correccion.sql`
- Create: `supabase/tests/27_correccion.test.sql`

**Interfaces:**
- Produces:
  - `puede_corregir(p_intento uuid) returns boolean`. El usuario es líder, coordinador, director o admin, está activo y no es el dueño del intento. Además: para el líder y el coordinador, `intentos.sede_id = mi_sede()`; el director y el admin corrigen cualquier sede.
  - `cola_correccion() returns table(intento_id uuid, examen_titulo text, asesor text, entregado_at timestamptz, correccion_vence_at timestamptz, vencida boolean, tomado_por text, tomado_por_mi boolean, libres_pendientes int)`. Lista los `pendiente_correccion` que puedo corregir y no estoy por ver como dueño, ordenados por `correccion_vence_at`. `tomado_por` es null si nadie lo tomó o si pasaron más de 24 h desde `tomado_at`.
  - `tomar_correccion(p_intento) returns void`. Error `'ya lo tomó otra persona'` si `corrector_id` es otro y `tomado_at > now() - 24 h`.
  - `soltar_correccion(p_intento) returns void`, solo si lo tengo yo.
  - `respuestas_a_corregir(p_intento) returns table(respuesta_id uuid, pregunta_id uuid, enunciado_md text, rubrica_md text, puntaje_max int, texto_libre text, puntaje numeric, devolucion_md text)`, solo para quien lo tiene tomado.
  - `corregir_respuesta(p_respuesta uuid, p_puntaje numeric, p_devolucion text) returns void`, con `0 <= puntaje <= puntaje_max` (error `'puntaje inválido'`).
  - `cerrar_correccion(p_intento) returns table(nota int, aprobado boolean)`. Error `'faltan respuestas'` si queda alguna libre sin puntaje. Calcula la nota, cierra y llama a `aplicar_efectos`.
- [ ] **Step 1: Test** (con el examen libre del escenario):
  - ase1 entrega.
  - `cola_correccion` como lider1 lo muestra; como un coordinador de T-Roca, no; como ase1 (dueño, que además no tiene el rol), no.
  - Toma lider1. coordS intenta tomar y recibe `'ya lo tomó otra persona'`.
  - Con `tomado_at` corrido 25 h atrás, coordS puede tomarlo.
  - `corregir_respuesta` con un puntaje mayor al máximo da `'puntaje inválido'`.
  - `cerrar_correccion` sin corregir todo da `'faltan respuestas'`. Corregido todo, el intento queda `cerrado` con la nota calculada.
  - Un líder que rindió el examen no ve su propio intento en la cola.
  - Con `correccion_vence_at` en el pasado, la fila sale `vencida = true`.
- [ ] **Step 2:** FAIL.
- [ ] **Step 3:** Implementar.
- [ ] **Step 4:** PASS. Regenerar los tipos.
- [ ] **Step 5:** Commit `feat(examenes): cola de corrección por sede`.

### Task 6: Examen de ubicación

**Files:**
- Create: `supabase/migrations/20261110000500_ubicacion.sql`
- Create: `supabase/tests/28_ubicacion.test.sql`

**Interfaces:**
- Produces:
  - `habilitar_ubicacion(p_usuario uuid) returns void`.
    - Pueden hacerlo coordinador, director o admin con `puede_ver_usuario(p_usuario)`.
    - El destino tiene que ser un asesor activo que no la haya rendido.
    - Escribe `experiencia_previa = true` y `ubicacion_habilitada_por = auth.uid()`.
    - Errores: `'sin permiso'` y `'ya rendida'`.
  - `estado_ubicacion() returns table(habilitada boolean, rendida boolean, bloque_actual int, intento_en_curso uuid, niveles_acreditados int[])`
  - `iniciar_ubicacion() returns uuid`.
    - Requiere estar habilitado y no haberla rendido (error `'no habilitada'`).
    - Retoma el bloque en curso. Si no hay ninguno, inicia el bloque siguiente al último aprobado (1 si no hay).
    - Las preguntas salen de los módulos del curso de `nivel_orden = bloque`, con `cantidad_preguntas` del examen `ubicacion`.
  - En `aplicar_efectos`, para un intento de ubicación:
    - aprobado: certificación `ubicacion` de ese nivel, y si `bloque = 3`, `ubicacion_rendida_at = now()`;
    - desaprobado: `ubicacion_rendida_at = now()`.
- [ ] **Step 1: Test**:
  - ase1 `iniciar_ubicacion` sin habilitar da `'no habilitada'`.
  - aseR → `habilitar_ubicacion(ase1)` da `'sin permiso'`. coordS lo habilita sin error.
  - ase1 aprueba el bloque 1: certificación de Nivel A (8) con origen `ubicacion`, y el Nivel B queda desbloqueado.
  - Al iniciar de nuevo recibe un intento con `bloque_nivel = 2` (si no hay un curso de nivel 2 en el escenario, la ubicación termina y queda `rendida`; usar los niveles 8 y 9 del escenario como bloques 1 y 2: ruling en el ledger).
  - Reprobar un bloque deja `ubicacion_rendida_at` escrito, y un nuevo `iniciar_ubicacion` da `'no habilitada'`.
  - `habilitar_ubicacion` sobre alguien que ya la rindió da `'ya rendida'`.
- [ ] **Step 2:** FAIL.
- [ ] **Step 3:** Implementar. Los bloques se toman como los niveles publicados en orden (1.º, 2.º y 3.º por `nivel_orden`), no por número fijo.
- [ ] **Step 4:** PASS. Regenerar los tipos.
- [ ] **Step 5:** Commit `feat(examenes): examen de ubicación por bloques`.

### Task 7: Rendir un examen (pantallas del asesor)

**Files:**
- Modify: `app/(app)/examenes/page.tsx`: lista con `mis_examenes()` y una tarjeta de ubicación si `estado_ubicacion().habilitada && !rendida`.
- Create:
  - `app/(app)/examenes/[id]/page.tsx`: portada con preguntas, nota mínima, tiempo e intentos restantes, y el botón "Empezar", "Continuar" o el estado.
  - `app/(app)/examenes/acciones.ts`: `empezar(examenId)`, `empezarUbicacion()`, `guardar(intentoId, respuesta)` y `entregar(intentoId)`.
  - `app/(app)/examenes/intento/[id]/page.tsx` y `app/(app)/examenes/intento/[id]/rendir.tsx` (cliente).
  - `app/(app)/examenes/intento/[id]/resultado/page.tsx`
- Modify: `app/(app)/estudiar/[curso]/[item]/page.tsx`. Un ítem `examen` con `examen_id` muestra el título, la nota mínima y el enlace "Ir al examen" (`/examenes/{examen_id}`), además del estado aprobado o no.

**Interfaces:**
- Consumes: las RPC de las Tareas 3 y 6, y `lib/dominio/examenes.ts`.
- Produces:
  - `empezar` redirige a `/examenes/intento/{id}`. Los errores se traducen a frases cortas:
    - `'en espera'` → "Podés volver a intentarlo el {fecha}.";
    - `'ya aprobado'` → "Ya lo aprobaste.";
    - `'sin preguntas'` → "Este examen todavía no tiene preguntas.";
    - `'no disponible'` → "Completá lo anterior para rendirlo.".
  - `guardar` devuelve `{ ok }` o el error `'tiempo agotado'` → "Se terminó el tiempo.".
- Pantalla de rendir (cliente):
  - Una pregunta por pantalla, con una barra de puntos numerados (navegable, que marca las respondidas) y los botones "Anterior" y "Siguiente".
  - Reloj regresivo si hay `vence_at`; al llegar a 0 entrega solo.
  - Cada cambio se guarda al momento, con el indicador "Guardado" o "Guardando…".
  - Controles por tipo:
    - opción múltiple: checkboxes si hay más de una correcta posible, y si no, radios. Como la cantidad de correctas no se revela, son siempre checkboxes, con la indicación corta "Marcá todas las correctas" (ruling).
    - V/F y escenario: radios. Los escenarios y las simulaciones muestran el contexto o el caso arriba.
    - ordenar: una lista con los botones "Subir" y "Bajar" por ítem (accesible, sin arrastrar).
    - libre: un textarea.
  - "Entregar" pide confirmación (`confirm` nativo, con la cantidad sin responder) y redirige a resultado.
- Resultado:
  - Con el intento cerrado: la nota grande, "Aprobado" o "No aprobado" y la revisión pregunta por pregunta. Las correctas se marcan con ✓ en verde y lo que respondió mal en rojo. Muestra la explicación y "Estudiá esto" → `/repositorio/articulo/{articulo_fuente_id}` (usar la ruta de artículo existente).
  - Pendiente de corrección: "Pendiente de corrección".
  - Ubicación aprobada con bloque siguiente: el botón "Seguir con el Nivel N".

- [ ] **Step 1:** Implementar las páginas y las acciones.
- [ ] **Step 2:** `npm run typecheck && npm run lint`. Capturas en 1440 y 390 de la portada, de rendir (una pregunta de cada tipo) y del resultado.
- [ ] **Step 3:** Commit `feat(examenes): portada, rendir y resultado del examen`.

### Task 8: Gestión del banco y de los exámenes

**Files:**
- Create:
  - `app/(app)/contenido/preguntas/page.tsx`: lista con filtros de categoría, módulo, tipo y estado, y el botón "Nueva pregunta".
  - `app/(app)/contenido/preguntas/[id]/page.tsx` (`nueva` = alta)
  - `app/(app)/contenido/preguntas/formulario.tsx` (cliente: los campos cambian según el tipo; opciones dinámicas, marca de correcta y orden con Subir/Bajar)
  - `app/(app)/contenido/preguntas/acciones.ts` (`guardarPregunta` con zod `esquemaPregunta`: guarda la pregunta y reemplaza sus opciones con la RPC `guardar_pregunta(p_datos jsonb) returns uuid`, que corre en una sola transacción y se agrega en la migración de esta tarea)
  - `app/(app)/contenido/casos/page.tsx`, `app/(app)/contenido/casos/[id]/page.tsx`: caso con título y contexto, y sus preguntas de simulación en orden, con un alta que precarga el tipo `simulacion` y el `caso_id`.
  - `app/(app)/contenido/examenes/page.tsx`, `app/(app)/contenido/examenes/[id]/page.tsx` y `formulario.tsx`: configuración con `esquemaExamen`, que muestra "N preguntas disponibles" según la RPC `contar_pozo(p_examen)`.
  - `supabase/migrations/20261110000600_gestion_examenes.sql`: `guardar_pregunta` y `contar_pozo`.
  - `supabase/tests/29_gestion_examenes.test.sql`
- Modify:
  - `app/(app)/contenido/page.tsx`: suma los accesos a Preguntas, Casos y Exámenes.
  - `app/(app)/contenido/cursos/formularios.tsx`: el paso `examen` elige el examen (select de exámenes publicados que el curso puede usar) y vuelve a ofrecer "Aprobar".

**Interfaces:**
- `guardar_pregunta(p_datos jsonb) returns uuid`:
  - es `security invoker`, así que la RLS decide;
  - hace upsert de la pregunta y el reemplazo de sus opciones de forma atómica;
  - devuelve el id;
  - error `'pregunta en uso'` si se cambia el tipo de una pregunta que ya aparece en intentos.
- `contar_pozo(p_examen uuid) returns int`: preguntas publicadas del pozo, solo para editores.
- [ ] **Step 1: Test `29_gestion_examenes.test.sql`**
  - coordS crea con `guardar_pregunta` una V/F de su sede, con 2 opciones.
  - Editarla con 3 opciones reemplaza las anteriores: quedan 3 filas.
  - aseR no puede editarla (42501, o 0 filas y excepción).
  - `contar_pozo` del examen de módulo del escenario devuelve 3.
  - Cambiar el tipo de una pregunta usada en un intento da `'pregunta en uso'`.
- [ ] **Step 2:** FAIL.
- [ ] **Step 3:** Implementar la migración y las pantallas.
- [ ] **Step 4:** PASS, más `npm run typecheck && npm run lint`.
- [ ] **Step 5:** Commit `feat(examenes): gestión del banco de preguntas, casos y exámenes`.

### Task 9: Pantallas de corrección y de ubicación (gestión)

**Files:**
- Create:
  - `app/(app)/equipo/correcciones/page.tsx`: la cola, con las columnas Examen, Asesor, Entregado, Plazo ("Vencida" en rojo) y Estado, y el botón Tomar, Seguir o Soltar.
  - `app/(app)/equipo/correcciones/[id]/page.tsx`: las respuestas libres con su rúbrica, y para cada una un campo de puntaje (0..máximo) y la devolución. Termina con "Cerrar corrección".
  - `app/(app)/equipo/correcciones/acciones.ts`
  - `app/(app)/equipo/ubicacion/page.tsx`: los asesores visibles (`puede_ver_usuario`) con el estado de su ubicación (Sin habilitar, Habilitada, Rendida con niveles) y el botón "Habilitar" para coordinador, director y admin.
  - `app/(app)/equipo/layout.tsx`: pestañas Consignas, Correcciones y Ubicación. Ubicación solo se muestra para coordinador o superior.
- Modify: `lib/dominio/roles.ts`: Equipo apunta a `/equipo/consignas` (sin cambios) y el contador de la barra no cambia (ruling: la cola se ve dentro de Equipo).

- [ ] **Step 1:** Implementar.
- [ ] **Step 2:** `npm run typecheck && npm run lint`, más capturas.
- [ ] **Step 3:** Commit `feat(examenes): corrección y habilitación de ubicación`.

### Task 10: Seed y E2E

**Files:**
- Modify: `supabase/seed.sql`
  - Un examen `nivel` para el Nivel 1 con 6 preguntas "(ejemplo)": 2 de opción múltiple, 1 V/F, 1 de escenario, 1 de ordenar y una simulación de 2 preguntas en un caso. Nota mínima 80, 3 intentos y sin tiempo.
  - Reemplazar el ítem examen del Nivel 2 por uno con `requisito 'aprobar'` y un examen `nivel` del Nivel 2 con 3 preguntas, una de ellas libre.
  - Un examen de categoría "Plataformas (ejemplo)" con tiempo límite de 10 minutos.
  - El examen `ubicacion` global con 3 preguntas por bloque.
  - `asesor2.nqn@` con `experiencia_previa = true` y la ubicación habilitada por el coordinador de servicio.
- Create: `e2e/examenes.spec.ts`
- Modify: `e2e/estudiar.spec.ts` si el Nivel 1 suma un paso de examen (actualizar el recorrido o dejar el examen como último paso, con requisito `aprobar` y aprobarlo en el E2E).

- [ ] **Step 1: Escribir `e2e/examenes.spec.ts`**
  - El asesor abre el examen de Plataformas: ve "Disponible", empieza, responde todas bien (las respuestas se conocen por el seed), entrega y ve "Aprobado" con nota 100 y la revisión con ✓.
  - Responde mal una del examen del Nivel 1 → "No aprobado". La revisión muestra la explicación y "Estudiá esto". Al volver a la portada quedan 2 intentos.
  - El asesor rinde el Nivel 2 (con la pregunta libre) → "Pendiente de corrección". lider.nqn ve el intento en `/equipo/correcciones`, lo toma, pone puntaje y cierra. El asesor ve la nota.
  - asesor2 ve la tarjeta de ubicación, aprueba el bloque 1, ve "Seguir con el Nivel 2" y en `/estudiar` el Nivel 2 aparece desbloqueado.
  - asesor.roca no ve el intento de Neuquén en la cola (no tiene acceso a `/equipo/correcciones`: 404).
- [ ] **Step 2:** `npx supabase db reset` y la suite completa (pgTAP, unitarios, typecheck, lint y Playwright) → todo verde.
- [ ] **Step 3:** Commit `feat(examenes): seed de ejemplo y E2E de exámenes`.
