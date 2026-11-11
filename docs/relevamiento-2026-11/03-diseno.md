# 03 · Diseño visual, movimiento y transiciones

Relevamiento del 11/11/2026 sobre la rama `etapa-9-recertificacion`. Solo lectura: no se tocó código de producto.

**Cómo se hizo.** Se recorrió la app real en `localhost:3000` con Playwright (Chromium) en Pixel 7 (412×839) y en 1440×900, con los usuarios semilla. Se midieron además desborde a 360 px, tamaños táctiles, foco por teclado, CLS, tiempos de navegación, contraste de tokens, `prefers-reduced-motion` y `prefers-color-scheme: dark`.

**Capturas.** Todas están en
`/tmp/claude-0/-home-user-pea/728633b8-e936-5bae-9af9-c9b70c33adcc/scratchpad/diseno/`
(en adelante `S/`). Prefijo `m-` = Pixel 7, `d-` = 1440×900, `m360-` = 360 px. Sufijo `-full` = página completa. Los scripts (`cap.mjs`, `flujo.mjs`, `flujo2.mjs`, `medir.mjs`, `menus.mjs`) están en la misma carpeta.

**Huella que dejó el relevamiento en la base compartida** (uso normal, nada borrado): como `admin@pea.local` se respondió el Probalo de "Inscripción a materias (ejemplo)" y se rindió un intento de "Plataformas (ejemplo)" (25 %, no aprobado; intento `ade58c15-…`). Al abrir ítems como asesor se marcaron "vistos".

---

## 0. Veredicto

La base es buena y coherente: una sola familia tipográfica, índigo consistente, tarjetas blancas sobre fondo lila muy claro, CLS 0 en todas las pantallas medidas y navegación entre secciones en ~170–240 ms. No hay nada "roto" a simple vista, salvo dos cosas puntuales (ver 1.1).

Lo que la separa de un producto premium:

1. **No hay movimiento.** En todo `app/` y `components/` hay 2 usos de `transition` (el botón y nada más), 0 `@keyframes`, 0 `animate-*`, 0 `loading.tsx`, 0 skeletons, 0 `ViewTransition`. Cada cambio de pantalla es un corte seco.
2. **Los momentos que importan no existen.** Acertar un Probalo, terminar una lección, aprobar un examen, ganar una insignia o subir de nivel se resuelven con un cambio de color y un `✓` de texto. No hay rachas.
3. **El sistema de diseño es implícito.** 17 tokens de color, pero ~90 hex sueltos en componentes (dos rojos distintos, por ejemplo), 12 radios distintos, 18 tamaños de letra, 3 estilos de pestañas, 76 `<select>` nativos, íconos mezclados con glifos Unicode (`✓ ✗ ☆ ← ‹ × ↑ ▸`).
4. **Sin marca.** El logo es el texto "PEA", el favicon es el de Next y `public/` tiene los SVG de la plantilla.
5. **Sin modo oscuro** y sin regla de `prefers-reduced-motion` (hoy no hace falta porque no hay movimiento; va a hacer falta).

---

## 1. Diagnóstico

### 1.1 Defectos concretos (arreglar antes que cualquier pulido)

| # | Hallazgo | Evidencia |
|---|---|---|
| D1 | **La barra "Siguiente" tapa el Probalo en celular.** Es `fixed bottom-24` y queda encima de la devolución y de los botones "Otra vez / Otra pregunta", que no se pueden leer ni tocar sin pelear con el scroll. | `S/m-flujo-probalo-mal.png`, `S/m-flujo-probalo-bien.png`, `S/m-flujo-leccion.png` · `components/leccion/acciones-leccion.tsx` |
| D2 | **"Siguiente" en gris pizarra parece deshabilitado.** En cursos que no son de nivel el color cae en `#475569`; el botón principal de la pantalla pierde todo protagonismo. | `S/d-flujo-probalo-bien.png` · `lib/dominio/leccion.ts` (`colorNivel`) |
| D3 | **`/contenido` desborda horizontalmente en celular** (+186 px a 412, +238 px a 360): la fila de pestañas no hace scroll propio y arrastra a toda la página. Además lista todo sin paginar (≈15 000 px de alto). | `S/m-admin-contenido.png`, `S/m360-contenido.png` |
| D4 | **Bordes de campos casi invisibles.** `--border` sobre blanco da 1,24:1 y sobre el fondo 1,16:1; WCAG 1.4.11 pide 3:1 para el contorno de un control. Los inputs se leen como "manchas blancas". | `S/m-anon-ingresar.png`, `S/d-admin-usuarios.png` |
| D5 | **Foco por teclado sin estilo propio.** Salvo `Button` e `Input`, todo usa el anillo por defecto del navegador (1 px, oscuro), que sobre la barra lateral `#1e1b4b` casi no se ve. No hay enlace "Saltar al contenido" y hay 10–11 tabulaciones antes de llegar a la página. | `S/d-foco-sidebar.png`, salida de `medir.mjs` |
| D6 | **Menús con `<details>`** ("Más" y "Cuenta"): aparecen sin transición, no cierran al tocar afuera ni con Esc, no tienen fondo atenuado y en celular "Más" se abre como un popover chico pegado a la derecha, encima del contenido. | `S/m-menu-mas.png`, `S/m-menu-cuenta.png` · `components/nav/menu-principal.tsx`, `panel-cuenta.tsx` |
| D7 | **Dos rojos y colores fuera de tokens.** `--destructive` es `#b42318` pero el código usa `#b91c1c` 24 veces y `#fef2f2` 7 veces; el ámbar del contador (`#f59e0b`), el durazno del avatar (`#ffd9a8`), el índigo oscuro de la barra (`#1e1b4b`, 7 veces) y los colores de nivel viven como literales. | `grep` de hex en `app/` y `components/` |
| D8 | **Peso 500 no se usa bien.** Se pide a Google Fonts pero `font-medium` aparece 25 veces contra 152 `semibold`, 104 `bold` y 109 `extrabold`: todo "grita" parecido. La fuente se carga con `<link>` bloqueante en vez de `next/font`. | `app/layout.tsx` |
| D9 | **Objetivos táctiles chicos.** Avatar de cuenta 32×32, pestañas 36 px de alto, "Ver todas / Mis cursos / CSV" 20 px de alto, flechas del calendario 35×40, chips "Todos / Solo atrasados" 32 px, "Quitar" del editor 26×32, radios y checks 20×20 (salvados solo cuando el `label` envuelve). | salida de `medir.mjs` |
| D10 | **`window.confirm` nativo** para eliminar y promover contenido; rompe por completo la estética. | `app/(app)/contenido/cursos/formularios.tsx:402`, `components/contenido/boton-promover.tsx:24` |

### 1.2 Por pantalla

**Bienvenida** — `S/m-anon-bienvenida.png`, `S/d-anon-bienvenida.png`
- Lo mejor de la app: el sendero N1→N4 en escritorio ya es una idea de marca. En celular desaparece y queda un bloque oscuro con texto.
- Las tarjetas de rol usan un radio nativo a la izquierda más un ícono: doble indicador. La tarjeta entera debería ser el control (borde + fondo suave + tilde).
- "Ingresar" queda chico y alineado a la izquierda; en celular el botón principal debe ir a ancho completo.
- Hay un hueco vacío de ~120 px entre el bloque oscuro y el título en celular.

**Ingresar** — `S/m-anon-ingresar.png`, `S/d-anon-ingresar.png`
- Rompe con Bienvenida: desaparece el panel oscuro y queda una tarjeta flotando en gris. Deberían compartir el mismo marco.
- La marca es una línea de texto índigo ("PEA · Perfil Evolutivo de Asesor"). Campos sin borde visible (D4). Sin ícono de mostrar contraseña, sin estado de carga en el botón.

**Tablero (inicio)** — `S/m-as-inicio-full.png`, `S/d-as-inicio.png`, `S/m-roca-inicio-full.png`
- Los tres contadores muestran `0` en naranja, rojo y verde: color de alarma sobre un cero. El color solo debe aparecer cuando el número es > 0.
- La tarjeta "Mi progreso" es la protagonista y está bien; le falta vida (barra animada, porcentaje que cuenta, lección siguiente nombrada).
- En escritorio el contenido usa 2 columnas pero deja la mitad inferior vacía; no hay racha, ni "próximo vencimiento", ni insignia siguiente.
- "Sin consignas pendientes.", "Sin novedades.", "Sin equipo asignado.": tres estados vacíos de texto gris idénticos.

**Estudiar (lista)** — `S/m-as-estudiar.png`, `S/d-as-estudiar.png`
- La tarjeta de curso tiene una cabecera de color plana de 96 px sin contenido: se siente a plantilla (y es el rasgo más "Canvas" de la app). Conviene reemplazarla por un anillo de progreso + ícono del nivel sobre un degradé sutil.
- Curso bloqueado = misma tarjeta al 60 % de opacidad: el texto verde lavado queda con poco contraste.
- La tabla "Todos los cursos" repite lo mismo que las tarjetas de arriba; la estrella de favorito es el glifo `☆`.
- En escritorio las tarjetas quedan de 256 px con media pantalla vacía a la derecha.

**Curso** — `S/m-as-curso-full.png`, `S/d-as-curso.png`, `S/m-flujo-curso-lecciones.png`
- Buen esqueleto (cabecera de color, módulos, pasos). Faltan: línea de progreso que una los pasos, estado "siguiente" destacado, duración por paso.
- Las aclaraciones "Marcar como hecho · completá lo anterior" bajo cada paso son texto explicativo repetido; alcanza con el candado.
- En escritorio la barra de progreso mide 1 030 px de ancho por 8 px de alto: desproporcionada.

**Lección y Probalo** — `S/m-as-leccion.png`, `S/d-as-leccion.png`, `S/m-flujo-leccion.png`, `S/m-flujo-probalo-mal.png`, `S/m-flujo-probalo-bien.png`, `S/d-flujo-probalo-bien.png`
- Los bloques "En 30 segundos / Así llega al CAU / Ojo con / Fuente" son el mejor contenido de la app; visualmente son cuatro títulos en mayúsculas iguales. Cada bloque merece su ícono y su tratamiento.
- En escritorio el texto corre a 1 070 px de ancho (≈150 caracteres por línea) y "Siguiente" mide 1 072 px. Hace falta un ancho de lectura de 680–720 px.
- Probalo: la devolución aparece de golpe; el `✓ ¡Bien!` y `✗ Todavía no` son texto con glifo. Las opciones no muestran cuál era la correcta en la propia fila. Es **el** momento para animar (ver 3.3).
- La barra de pasos segmentada de arriba no anima al avanzar. El botón cerrar es una `×` de texto.
- D1 y D2 viven acá.

**Exámenes (lista y portada)** — `S/m-as-examenes.png`, `S/m-as-examen-portada.png`, `S/d-as-examen-portada.png`, `S/m-roca-examen-portada.png`
- Portada correcta y sobria. Cuatro tarjetas de dato iguales; "Para aprobar 80 %" debería destacarse.
- El chip "Disponible" tiene dos tamaños distintos entre lista y portada.
- Mucho vacío debajo; "Empezar" en escritorio mide 768 px.

**Rendir** — `S/m-flujo-examen-p1.png`, `S/d-flujo-examen-p2-marcada.png`, `S/m-flujo-examen-revisar.png`, `S/m-flujo-examen-dialogo-salir.png`
- Modo foco bien resuelto (sin navegación). El título se trunca ("Plataformas (ejem…") porque compite con "Guardado", el reloj y "Salir".
- Cambiar de pregunta es un corte seco; debería deslizar en la dirección del avance.
- "Ordenar" usa flechas `↑ ↓` de texto; "Clasificar" y "Formulario" usan `<select>` nativos.
- El diálogo aparece sin transición ni desenfoque; está implementado a mano en `rendir.tsx` (con trampa de foco propia) y no es reutilizable.
- "Guardado" no da señal visual al guardar (un punto que late alcanzaría).

**Resultado** — `S/m-flujo-resultado.png`, `S/d-flujo-resultado.png`
- No aprobado = bloque rojo sólido `#b91c1c` a toda la tarjeta con "25 %" en 60 px. Es castigador para una herramienta de formación; el rojo pleno debería reservarse para errores del sistema.
- Aprobado = el mismo bloque en verde, sin ninguna celebración, sin insignia, sin "subiste a Nivel 2".
- La revisión pregunta por pregunta es clara y es un punto fuerte. Los `✗ / ✓` son glifos.

**Perfil** — `S/m-as-perfil-full.png`, `S/d-as-perfil.png`, `S/m-roca-perfil-full.png`, `S/d-roca-perfil.png`
- La insignia es un círculo plano con "N1" y borde blanco: no se siente como un logro. Las no obtenidas no se muestran (no hay "lo que viene").
- Cuatro estados vacíos seguidos ("Sin insignias todavía." …) hacen que el perfil nuevo parezca una pantalla de errores.
- El chip de nivel es un botón-píldora enorme que no es botón.
- "Datos" es una lista de definición prolija; el teléfono y "Avisos por email" quedan como tarjetas sueltas. El check de avisos debería ser un interruptor.
- En celular la fila del certificado se rompe en tres líneas con los botones desalineados (`S/m-roca-perfil-full.png`).

**Calendario** — `S/m-as-calendario.png`, `S/d-as-calendario.png`
- Escritorio: grilla limpia; los eventos se truncan a 10 caracteres ("09:00 Jornad…") con celdas de 112 px casi vacías.
- Celular: lista de agenda correcta, pero sin día de la semana ni marca de "hoy". La leyenda ocupa una tarjeta entera.
- Flechas `‹ ›` de texto, 35 px de ancho.

**Bandeja** — `S/m-as-bandeja.png`, `S/d-as-bandeja-hilo.png`, `S/m-as-bandeja-hilo.png`, `S/m-as-bandeja-nueva.png`
- Es la única pantalla a sangre completa (sin el ancho máximo del resto): se siente otra app. El patrón lista + detalle está bien.
- El filtro es un `<select>` nativo al lado del título. Los avatares usan otro color (menta) que el avatar propio (durazno): sin regla.
- El hilo es una burbuja sola en un mar gris; sin agrupación por día.

**Avisos y Actualizaciones** — `S/m-roca-avisos.png`, `S/d-roca-avisos.png`, `S/m-roca-actualizaciones.png`, `S/d-roca-actualizacion.png`, `S/m-as-actualizaciones.png`
- Avisos: lista sin ícono por tipo ni marca de no leído; "Marcar todo como leído" flota suelto.
- Actualización: tarjeta de 1 070 px con una línea de texto; el botón secundario "Rendir el mini examen" tiene borde de 2 px índigo, distinto del secundario del sistema.
- Vacío de Actualizaciones: una línea de texto.

**Repositorio y artículo** — `S/m-as-repositorio-full.png`, `S/d-as-repositorio.png`, `S/d-as-repo-categoria.png`, `S/d-as-articulo.png`, `S/m-as-articulo-full.png`
- Diez tarjetas de categoría idénticas, sin ícono ni color; siete dicen "0 artículos". Las vacías deberían ir atenuadas o al final.
- Las descripciones de categoría son listas largas de palabras clave (texto explicativo que el dueño no quiere).
- Artículo: ancho de lectura sin límite, título en peso 600 (el resto de la app usa 800), enlaces "En esta sección" sin jerarquía.

**Organigrama** — `S/m-as-organigrama-full.png`, `S/d-as-organigrama-full.png`
- Es un listado, no un organigrama: sin líneas ni avatares. "CAU Bariloche 0 equipos" ×5 no aporta.
- Termina con "Qué hace cada puesto": diez párrafos explicativos. Va en contra de la preferencia del dueño; mover a Ayuda o a un globo por puesto.

**Panel de equipo** — `S/d-admin-panel.png`, `S/m-admin-panel-full.png`, `S/d-lider-panel.png`
- Cuatro KPI como número suelto: sin tendencia, sin comparación, sin gráfico.
- El avance por asesor es "0 %" en texto a la derecha: pide una barra. "Por categoría" es una fila con un guion.
- No hay un solo gráfico en todo el panel. Los enlaces "CSV" son texto de 20 px de alto.
- Chips "Sin actividad / Vence pronto" bien, pero con un tercer estilo de chip.

**Contenido y editor** — `S/d-admin-contenido.png`, `S/m-admin-contenido.png`, `S/d-admin-cursos.png`, `S/d-admin-curso-editor.png`, `S/d-admin-preguntas-full.png`
- Tercer estilo de pestañas (segmentado con borde). Subtítulo explicativo "Artículos, recursos y campañas que podés editar.".
- Una tarjeta por artículo, sin búsqueda, filtros ni paginación.
- El editor usa `<details>` con el triángulo nativo, "(leccion)" en crudo, "Eliminar" como texto rojo suelto.

**Admin · Usuarios** — `S/d-admin-usuarios.png`, `S/m-admin-usuarios.png`, `S/d-admin-rutas.png`
- El formulario "Invitar a alguien" ocupa toda la primera pantalla antes de la lista; debería ser un botón que abre una hoja.
- Cada usuario es una tarjeta alta con `<select>` de rol + "Desactivar" + `<details>`: en escritorio hace falta una tabla densa (40–44 px por fila).
- Rutas: 281 nodos de texto de 12 px; la matriz no se lee en celular.

**Verificar** — `S/m-anon-verificar-codigo.png`, `S/d-anon-verificar-codigo.png`, `S/m-anon-verificar-invalido.png`
- Es la cara pública de PEA y se ve genérica: una tarjeta con un chip "Vigente". Para ser creíble necesita el logo, un sello, el nombre de la institución emisora y el código con formato (`59AD-85EB-E3`).

### 1.3 Transversales

| Tema | Estado |
|---|---|
| Escala tipográfica | 18 tamaños en uso (10, 11, 12, 13, 13.8, 14, 15, 16, 17, 18, 19.2, 20, 22, 24, 26, 30, 32, 44, 60 px). `text-sm` 269 veces. Títulos de página con pesos distintos (600 en Usuarios, Contenido y artículos; 800 en el resto). |
| Espaciado | Sin escala declarada; conviven `p-3.5`, `p-4`, `p-5`, `p-6`, `gap-2.5`. Ritmo vertical entre secciones irregular (16–28 px). |
| Radios | 12 valores: `rounded-2xl` 66, `xl` 55, `full` 32, `lg` 31, `3xl` 18, `[20px]` 6, `[14px]` 3, y sueltos `[18px] [10px] [3px] md`. |
| Elevación | Una sola sombra (`--shadow-suave`, casi imperceptible) más `shadow-lg` y `shadow-xl` de Tailwind en 7 lugares. No hay niveles. |
| Color | 17 tokens, sin rampas. ~90 hex literales; 52 `text-white` y 9 `bg-white` que rompen el modo oscuro. |
| Contraste (calculado) | Texto bien: muted/fondo 6,19 · muted/tarjeta 6,61 · primario/fondo 5,88 · blanco/primario 6,29 · éxito/suave 5,21 · aviso/suave 4,88 (justo) · barra lateral 10,72 · blanco sobre N2/N3/N4 5,47 / 5,18 / 6,04. Mal: borde/tarjeta **1,24**, borde/fondo **1,16**, placeholder ≈ **2,5**. |
| Íconos | 11 íconos propios de trazo 2 px para navegación (bien) + 5 SVG sueltos + glifos Unicode en ~30 lugares. |
| Componentes | `Button` con 4 variantes y **un solo tamaño**; al menos 15 botones hechos a mano con `min-h-12 rounded-2xl`. 3 pestañas, 3 chips, 76 `<select>` nativos, 6 `<details>`, 1 diálogo artesanal, 2 `confirm()`. |
| Estados de carga | 0 `loading.tsx`, 0 `error.tsx`, 0 `not-found.tsx` propios, 0 skeletons. Los botones pasan a "Guardando…" en texto. |
| Movimiento | 2 `transition`. Nada más. |
| `prefers-reduced-motion` | Sin regla (ni `motion-safe` ni media query). |
| Modo oscuro | No existe: sin `color-scheme`, sin `theme-color`, tokens solo claros (`S/d-dark-inicio.png` es idéntica a la clara). |
| CLS | 0,000 en inicio, estudiar, perfil, panel y repositorio. Conservar. |
| Escritorio | Barra de 92 px + columna de 1 072 px. Con 11 ítems (admin) la barra no entra en 900 px de alto y hace scroll interno. Densidad baja en pantallas de gestión. |
| 360 px | Sin desbordes salvo `/contenido` (D3). |
| Texto explicativo | Subtítulos de Organigrama y Contenido, descripciones del Repositorio, "Qué hace cada puesto", aclaraciones bajo cada paso del curso, "Vacío: no vence.". |

---

## 2. Sistema de diseño propuesto

Principio: **mismo carácter (índigo, redondeado, Plus Jakarta Sans), más disciplina**. Todo sale de tokens en `app/globals.css`; ningún componente escribe un hex.

### 2.1 Tipografía

Se mantiene Plus Jakarta Sans, cargada con `next/font/google` (autoalojada, sin `<link>` bloqueante), pesos 400, 500, 600, 700, 800. Números con `font-variant-numeric: tabular-nums` en contadores, relojes, tablas y porcentajes.

| Token | Tamaño / interlínea | Peso | Tracking | Uso |
|---|---|---|---|---|
| `--text-display` | 48 / 52 px | 800 | −0,03em | Nota del resultado, número grande de celebración |
| `--text-h1` | 28 / 34 px (celular 24 / 30) | 800 | −0,02em | Título de página (uno por pantalla) |
| `--text-h2` | 20 / 28 px | 700 | −0,015em | Título de sección |
| `--text-h3` | 17 / 24 px | 700 | −0,01em | Título de tarjeta, enunciado |
| `--text-body` | 16 / 24 px | 400 | 0 | Lectura (lección, artículo) |
| `--text-ui` | 14 / 20 px | 500 | 0 | Interfaz, tablas, botones chicos |
| `--text-caption` | 13 / 18 px | 500 | 0 | Metadatos |
| `--text-micro` | 12 / 16 px | 600 | +0,01em | Chips, etiquetas de navegación |
| `--text-overline` | 11 / 16 px | 700 | +0,08em, mayúsculas | Rótulos ("EN 30 SEGUNDOS") |

Reglas: 800 solo en `display` y `h1`; 700 para títulos; 600 para énfasis y botones; 500 para interfaz; 400 para lectura. Se eliminan 10, 13.8, 15, 17 (salvo h3), 19.2, 22, 26, 32 y 44 px. Ancho de lectura: `max-width: 68ch` en lección y artículo.

### 2.2 Espaciado y grilla

Base 4 px. Escala permitida: **4, 8, 12, 16, 20, 24, 32, 40, 48, 64**. Se dejan de usar los medios pasos (`2.5`, `3.5`).

| Uso | Valor |
|---|---|
| Margen lateral de página | 16 px celular · 32 px tablet · 40 px escritorio |
| Entre secciones | 32 px (24 en celular) |
| Título de sección → contenido | 12 px |
| Relleno de tarjeta | 20 px (16 en celular) · 24 px en tarjetas destacadas |
| Entre tarjetas de una lista | 12 px |
| Fila de lista | alto mínimo 56 px; tabla densa de escritorio 44 px |
| Objetivo táctil | mínimo 44×44 px (48 para la acción principal) |
| Ancho máximo | 1 120 px páginas · 720 px lectura y examen · 480 px formularios de acceso |

Escritorio: barra lateral de 88 px (igual estructura que hoy) con opción de expandir a 232 px con etiquetas a la derecha a partir de 1 280 px; así entran los 11 ítems de admin sin scroll.

### 2.3 Radios

| Token | Valor | Uso |
|---|---|---|
| `--radius-xs` | 6 px | Chips cuadrados, celdas, `code` |
| `--radius-sm` | 10 px | Inputs, botones chicos, ítems de menú |
| `--radius-md` | 14 px | Botones, opciones de respuesta |
| `--radius-lg` | 20 px | Tarjetas |
| `--radius-xl` | 28 px | Hojas, diálogos, tarjeta protagonista |
| `--radius-full` | 999 px | Píldoras, avatares, barras |

Regla de anidado: radio interior = radio exterior − relleno (mínimo 6 px).

### 2.4 Elevación

Sombras teñidas de índigo oscuro, nunca gris neutro.

```css
--shadow-1: 0 1px 2px rgb(30 27 75 / .06), 0 1px 1px rgb(30 27 75 / .04);            /* tarjeta en reposo */
--shadow-2: 0 2px 4px rgb(30 27 75 / .06), 0 6px 16px rgb(30 27 75 / .08);           /* tarjeta al pasar, barra fija */
--shadow-3: 0 4px 8px rgb(30 27 75 / .08), 0 16px 32px rgb(30 27 75 / .12);          /* menú, popover, navegación inferior */
--shadow-4: 0 8px 16px rgb(30 27 75 / .10), 0 32px 64px rgb(30 27 75 / .18);         /* diálogo, hoja */
--shadow-brand: 0 6px 20px rgb(79 70 229 / .28);                                     /* botón principal destacado */
```

En oscuro las sombras se reemplazan por superficie más clara + borde de 1 px (`--border`); `--shadow-*` pasa a `0 0 0 1px var(--border)` salvo `--shadow-4`, que conserva `0 24px 64px rgb(0 0 0 / .5)`.

### 2.5 Color

**Rampa índigo (marca)**

| 50 | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900 | 950 |
|---|---|---|---|---|---|---|---|---|---|---|
| `#eef2ff` | `#e0e7ff` | `#c7d2fe` | `#a5b4fc` | `#818cf8` | `#6366f1` | `#4f46e5` | `#4338ca` | `#3730a3` | `#312e81` | `#1e1b4b` |

**Rampa neutra (gris con tinte violeta)**

| 0 | 50 | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900 | 950 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `#ffffff` | `#f6f6fb` | `#eeeef5` | `#e3e3ee` | `#c9c9d9` | `#8a8aa3` | `#6b6b82` | `#56566b` | `#3d3d52` | `#2a2a40` | `#1a1a2e` | `#0f0f1a` |

**Tokens semánticos** (lo único que usan los componentes)

| Token | Claro | Oscuro | Nota de contraste |
|---|---|---|---|
| `--bg` | `#f6f6fb` | `#0f0f1a` | |
| `--surface` | `#ffffff` | `#16162a` | |
| `--surface-2` (hundida) | `#f6f6fb` | `#1d1d36` | |
| `--surface-3` (elevada) | `#ffffff` | `#23234a` | |
| `--fg` | `#1a1a2e` | `#ececf4` | 16,2:1 en oscuro |
| `--fg-muted` | `#56566b` | `#a3a3bd` | 6,63 claro · 7,22 oscuro |
| `--fg-subtle` | `#6b6b82` | `#9494ad` | 5,18 · 6,00 |
| `--border` | `#e3e3ee` | `#2e2e48` | divisores, decorativo |
| `--border-control` | `#8a8aa3` | `#8a8aa8` | 3,36 · 5,31 → cumple 3:1 en campos |
| `--primary` | `#4f46e5` | `#a5a0ff` | 6,29 con blanco · 8,22 sobre fondo oscuro |
| `--primary-hover` | `#4338ca` | `#c7c4ff` | |
| `--primary-fg` | `#ffffff` | `#0f0f1a` | 8,22 |
| `--primary-soft` | `#eef2ff` | `#23214a` | |
| `--primary-soft-fg` | `#4338ca` | `#c7c4ff` | 7,07 · 9,20 |
| `--success` / `-soft` | `#047857` / `#ecfdf5` | `#34d399` / `#0f2a22` | 5,21 · 9,24 |
| `--warning` / `-soft` | `#b54708` / `#fffaeb` | `#fb923c` / `#2e1c0d` | 5,20 · 7,85 |
| `--danger` / `-soft` | `#b42318` / `#fef3f2` | `#f87171` / `#2e1414` | 6,05 · 6,42 |
| `--gold` / `-soft` | `#f59e0b` / `#fffbeb` | `#fbbf24` / `#2b2209` | texto sobre oro siempre `--neutral-900` (7,94) |
| `--nav-bg` | `#1e1b4b` | `#0b0b16` | |
| `--nav-fg` / `--nav-fg-active` | `#c7d2fe` / `#ffffff` | igual | 10,72 |
| `--ring` | `#4f46e5` | `#a5a0ff` | |
| `--overlay` | `rgb(26 26 46 / .5)` | `rgb(0 0 0 / .6)` | |

Un solo rojo (`--danger`); `#b91c1c` y `#fef2f2` desaparecen. El "no aprobado" usa `--danger-soft` de fondo con texto `--danger`, nunca el rojo pleno a toda la tarjeta.

**Niveles** (pasan de `lib/dominio/leccion.ts` a tokens; `colorNivel` devuelve nombres de variable)

| Nivel | `--nivel-n` | `-soft` | `-fg` | Oscuro (`--nivel-n`) |
|---|---|---|---|---|
| 1 Base | `#4f46e5` | `#eef2ff` | `#3730a3` | `#a5a0ff` |
| 2 Operativo | `#0f766e` | `#f0fdfa` | `#115e59` | `#2dd4bf` |
| 3 Avanzado | `#c2410c` | `#fff7ed` | `#9a3412` | `#fb923c` |
| 4 Referente | `#be185d` | `#fdf2f8` | `#9d174d` | `#f472b6` |
| Capacitación | `#6d28d9` | `#f5f3ff` | `#5b21b6` | `#c4b5fd` |

"Capacitación" deja de caer en gris pizarra (D2) y deja de compartir el magenta del nivel 4.

**Datos (gráficos del panel)**: serie única `--primary`; comparación `--neutral-300`; positivo/negativo `--success` / `--danger`; categorías en este orden: `#4f46e5`, `#0f766e`, `#c2410c`, `#be185d`, `#6d28d9`, `#0369a1`.

**Modo oscuro**: se activa con `@media (prefers-color-scheme: dark)` sobre `:root:not([data-theme="light"])` y con `:root[data-theme="dark"]`; `color-scheme: light dark` en `html` y dos `theme-color` en `viewport`. Como hoy hay 52 `text-white` y 9 `bg-white`, el modo oscuro se habilita recién cuando cada paquete termina su limpieza de literales (ver hoja de ruta).

### 2.6 Componentes (reglas)

| Componente | Regla |
|---|---|
| **Botón** | Variantes: `primario`, `secundario` (superficie + `--border-control`), `suave` (`--primary-soft`), `fantasma`, `peligro`. Tamaños: `sm` 36 px / 14 px, `md` 44 px / 15 px, `lg` 52 px / 16 px. Radio `md`. Peso 600. Estado `cargando`: spinner de 16 px reemplaza al ícono, el texto no cambia y el ancho no salta. Presión: `scale(.97)`. En celular la acción principal de la pantalla va a ancho completo; en escritorio nunca supera 320 px. Los ~15 botones hechos a mano pasan a `Button`. |
| **Campo** | 44 px, radio `sm`, borde `--border-control`, foco: borde `--primary` + anillo de 3 px `--primary` al 25 %. Error: borde `--danger` + mensaje de 13 px con ícono. `Select` propio (lista en popover; en celular hoja inferior) para filtros y formularios cortos; nativo solo en formularios largos de admin. Interruptor para booleanos de preferencia. |
| **Tarjeta** | `--surface`, radio `lg`, `--shadow-1`. Variante `interactiva`: al pasar `--shadow-2` y `translateY(-2px)`; al presionar `scale(.99)`. Variante `destacada` (color de nivel). No anidar tarjeta dentro de tarjeta: adentro se usa `--surface-2` sin sombra. |
| **Chip / estado** | Un solo componente: 24 px, radio `full`, 12 px / 600, con punto o ícono de 12 px opcional. Tonos: `neutro`, `primario`, `exito`, `aviso`, `peligro`, `oro`, `nivel-n`. Reemplaza `Badge`, los chips del panel y los estados de examen. |
| **Pestañas** | Un solo estilo: subrayado con **indicador que se desliza** entre pestañas. En celular con scroll horizontal propio y difuminado en los bordes. Variante `segmentado` solo para filtros de 2–3 opciones. Reemplaza `components/tablero/pestanas.tsx`, `app/(app)/equipo/pestanas.tsx`, `app/(app)/admin/pestanas.tsx`, `components/contenido/nav-examenes.tsx` y las de `/contenido`. |
| **Diálogo / hoja** | Sobre `<dialog>` nativo (foco, Esc e inercia gratis). Escritorio: centrado, 440 px, radio `xl`. Celular: hoja inferior con agarradera, radio superior `xl`. Reemplaza el `Dialogo` de `rendir.tsx` y los dos `window.confirm`. |
| **Menú / popover** | Atributo `popover` nativo (cierra afuera y con Esc). Reemplaza los `<details>` de "Más" y "Cuenta". En celular "Más" es una hoja inferior con grilla de íconos. |
| **Progreso** | Barra 8 px, radio `full`, pista `--surface-2` (o blanco al 25 % sobre color). Anillo de 44 / 64 / 96 px para cursos y perfil. Siempre con `role="progressbar"`. |
| **Avatar** | 24 / 32 / 40 / 64 px. Color derivado del nombre entre 6 pares fijos de la paleta de niveles; el propio siempre índigo. |
| **Lista / tabla** | Celular: filas de 56 px dentro de una tarjeta. Escritorio en gestión: tabla densa de 44 px, encabezado pegajoso, acciones al pasar el cursor. |
| **Estado vacío** | Ícono de 40 px en círculo `--primary-soft` + una frase de hasta 4 palabras + una acción opcional. Sin párrafos. En perfil, las secciones vacías se colapsan en una sola fila. |
| **Toast** | Abajo al centro en celular (sobre la navegación), abajo a la derecha en escritorio; 4 s; para "Guardado", "Copiado", errores de acción. Hoy no existe. |
| **Foco** | Regla global: `:focus-visible { outline: 2px solid var(--ring); outline-offset: 2px; }`; sobre fondos oscuros, `outline-color: #fff`. Enlace "Saltar al contenido" como primer elemento. |

### 2.7 Íconos

**Sin dependencia nueva.** Un único `components/ui/icono.tsx` que amplía el actual `components/nav/iconos.tsx`: grilla 24, trazo 2 px, extremos y uniones redondeados, `currentColor`, tamaños 16 / 20 / 24. Variante rellena solo para el ítem activo de navegación y para estados (tilde, cruz, estrella, candado).

Lista mínima (≈40): los 11 de navegación, más `tilde`, `cruz`, `mas`, `flecha-izq/der/arriba/abajo`, `chevron-izq/der/abajo`, `candado`, `estrella`, `campana`, `sobre`, `buscar`, `filtro`, `descargar`, `enlace-externo`, `reloj`, `calendario`, `video`, `documento`, `rayo` (En 30 segundos), `mensaje` (Así llega al CAU), `alerta` (Ojo con), `libro` (Fuente), `trofeo`, `llama` (racha), `medalla`, `ojo`, `ojo-tachado`, `papelera`, `lapiz`, `arrastrar`, `mas-horizontal`, `salir`.

Regla: **ningún glifo Unicode como ícono** (`✓ ✗ ☆ ★ ← → ‹ › × ↑ ↓ ▸`). Los trazados pueden tomarse de Lucide (licencia ISC) copiando solo los que se usan. Si más adelante se prefiere no mantenerlos a mano, `lucide-react` es el reemplazo directo (mismo trazo, se importa ícono por ícono), pero hoy no se justifica.

---

## 3. Sistema de movimiento

### 3.1 Qué soporta esta versión de Next (verificado)

Fuente: `node_modules/next/dist/docs/01-app/02-guides/view-transitions.md`, `…/03-api-reference/02-components/link.md`, `…/04-functions/use-router.md`, y los exports reales de `react@19.3.0`.

- `import { ViewTransition, addTransitionType } from 'react'` existe en React 19.3 (comprobado en `node_modules`). **Funciona en App Router sin ninguna opción de configuración.**
- Las navegaciones de ruta son Transitions, así que `<ViewTransition>` se activa solo al navegar. También lo activan `<Suspense>` y `useDeferredValue`; un `setState` común no.
- `<Link transitionTypes={['nav-forward']}>` (desde v16.2) y `router.push(href, { transitionTypes })` etiquetan la navegación; `enter` / `exit` aceptan un objeto por tipo.
- El envoltorio va **en cada `page.tsx`, no en el layout** (los layouts persisten y no disparan `enter` / `exit`).
- `name` igual en origen y destino = morph de elemento compartido. Solo se forma el par si el destino renderiza en el mismo commit (página precargada); si cae en un `loading.tsx`, el contenido entra con su animación `enter`.
- Con `default="none"` hay que dejar `share` explícito o el par deja de morfear.
- El "atrás" del navegador no lleva tipo: no desliza (sí morfea).
- Recomendado por la guía: `::view-transition { pointer-events: none; }` y anclar el encabezado con `viewTransitionName`.
- Sin soporte del navegador, la app funciona igual sin animar (Chromium 125+, Safari y Firefox recientes).

### 3.2 Tokens

```css
--dur-1: 90ms;    /* presión, hover */
--dur-2: 160ms;   /* salidas, fundidos, chips */
--dur-3: 240ms;   /* entradas, pestañas, popovers */
--dur-4: 380ms;   /* hojas, diálogos, morph, barras de progreso */
--dur-5: 700ms;   /* celebraciones, conteo */

--ease-out:    cubic-bezier(0.22, 1, 0.36, 1);     /* entradas: rápido y frena */
--ease-in:     cubic-bezier(0.4, 0, 1, 1);         /* salidas */
--ease-in-out: cubic-bezier(0.65, 0, 0.35, 1);     /* movimientos dentro de pantalla */
--ease-spring: linear(0, 0.36 9%, 0.87 20%, 1.08 29%, 1.12 35%, 1.06 46%, 0.99 60%, 1);  /* rebote suave, solo logros */
```

Reglas:
1. Solo se animan `transform`, `opacity`, `clip-path` y `filter`. Nunca `width`, `height`, `top` ni `margin` (se conserva el CLS 0).
2. La salida dura dos tercios de la entrada. Lo que el usuario dispara responde en menos de 100 ms.
3. Desplazamientos cortos: 8–12 px en listas, 24–40 px entre rutas. Nada cruza la pantalla.
4. El rebote (`--ease-spring`) se reserva para logros; la interfaz de trabajo usa `--ease-out`.
5. Nada en bucle, salvo skeletons y el punto de "guardando".
6. Escalonado de listas: 30 ms por ítem, tope de 8 ítems (240 ms en total).

### 3.3 Tabla de animaciones

MR = comportamiento con `prefers-reduced-motion: reduce`.

| # | Dónde | Qué pasa | Técnica | Duración / curva | MR |
|---|---|---|---|---|---|
| 1 | Navegación entre secciones (barra lateral, navegación inferior) | Fundido cruzado del contenido con 8 px de subida; la barra y el encabezado quedan fijos | `<ViewTransition>` en cada `page.tsx` + `viewTransitionName` en `nav` y `header` | sale 160 ms `ease-in`, entra 240 ms `ease-out` | Fundido de 120 ms sin desplazamiento |
| 2 | Entrar a un detalle (curso → lección, lista → examen, categoría → artículo, hilo de bandeja) | El contenido se desliza 32 px hacia la izquierda; al volver con el enlace "← …", hacia la derecha | `<Link transitionTypes={['nav-forward' \| 'nav-back']}>` + clases `::view-transition-old/new(.nav-forward)` | 160 ms salida + 380 ms entrada `ease-in-out` | Fundido de 120 ms |
| 3 | Tarjeta de curso → cabecera del curso; "Mi progreso" → cabecera | La tarjeta de color crece hasta ser la cabecera | `<ViewTransition name={'curso-' + id} share="morph" default="none">` en origen y destino | 380 ms `ease-in-out` | Sin morph; fundido |
| 4 | Pestañas (Tablero/Cursos, Artículos/Recursos, Equipo, Admin) | El subrayado se desliza a la pestaña nueva; el contenido hace fundido | Indicador con `viewTransitionName` propio + `<ViewTransition key={pestaña}>` en el contenido | 240 ms `ease-out` | Cambio instantáneo |
| 5 | Carga de página | Skeleton con la forma real; al llegar el dato, el skeleton baja y se va y el contenido sube | `loading.tsx` por sección + `<ViewTransition exit="slide-down">` / `enter="slide-up"` (receta de la guía) | sale 160 ms, entra 240 ms con 160 ms de espera | Fundido |
| 6 | Skeleton | Brillo que recorre el bloque | CSS: `background-position` en degradé, `@keyframes` | 1,4 s lineal, infinito | Bloque quieto al 60 % de opacidad |
| 7 | Listas (cursos, exámenes, avisos, asesores) | Los ítems entran escalonados con 8 px de subida | CSS: `@starting-style` + `transition-delay: calc(var(--i) * 30ms)` | 240 ms `ease-out` | Sin escalonado ni desplazamiento |
| 8 | Botón | Presión: escala .97; cargando: spinner | CSS `:active` + `transition: transform` | 90 ms `ease-out` | Sin escala; el spinner pasa a tres puntos estáticos |
| 9 | Tarjeta interactiva | Al pasar: sube 2 px y gana sombra; al presionar: .99 | CSS, solo dentro de `@media (hover: hover)` | 160 ms `ease-out` | Solo cambia la sombra |
| 10 | Diálogo | El fondo se atenúa; la caja entra con escala .96 → 1 y fundido | `<dialog>` + `@starting-style` + `transition-behavior: allow-discrete`; `::backdrop` animado | 240 ms `ease-out`; sale en 160 ms | Fundido de 120 ms |
| 11 | Hoja inferior (celular: "Más", filtros, selects, invitar usuario) | Sube desde abajo | Igual que 10 con `translateY(100%)` | 380 ms `ease-out`; sale en 240 ms `ease-in` | Fundido |
| 12 | Popover (cuenta, selects en escritorio) | Escala .96 → 1 desde su origen, con fundido | Atributo `popover` + `@starting-style` | 160 ms `ease-out` | Fundido |
| 13 | Barra de progreso | Se llena desde el valor anterior | CSS: `transform: scaleX()` con `transform-origin: left`; valor por variable | 380 ms `ease-out` (700 ms al completar al 100 %) | Salto directo |
| 14 | Pasos de la lección | El segmento actual se llena al avanzar | CSS `scaleX` como 13 | 380 ms `ease-out` | Salto directo |
| 15 | Opción de respuesta | Al elegir: el borde se colorea y el tilde aparece con escala | CSS `transition` sobre borde, fondo y `scale` del indicador | 160 ms `ease-out` | Solo color |
| 16 | **Probalo acertado** | La opción elegida pulsa en verde (1 → 1,03 → 1), el tilde se dibuja, el panel de devolución sube 12 px; el contador "1/1" salta | CSS: `@keyframes` de pulso; `stroke-dashoffset` para el tilde; `@starting-style` para el panel | pulso 380 ms `ease-spring`; tilde 240 ms; panel 240 ms `ease-out` | Sin pulso ni dibujo: color y panel con fundido |
| 17 | **Probalo fallado** | La opción elegida hace un vaivén horizontal corto (±6 px, 3 veces), se marca en rojo suave y **la correcta se ilumina en verde**; el panel sube | CSS `@keyframes` de vaivén | 320 ms `ease-in-out` | Sin vaivén: solo color y panel |
| 18 | **Lección terminada** | El último segmento se llena, aparece un tilde grande dibujado dentro de un círculo que crece y un estallido de 10 partículas; "Siguiente" pasa a ser el botón protagonista | CSS: círculo con `scale` + `stroke-dashoffset`; partículas = 10 `<span>` con `@keyframes` y variables de ángulo | 700 ms en total; círculo `ease-spring` | Tilde y círculo aparecen con fundido; sin partículas |
| 19 | Cambio de pregunta en examen | La pregunta sale hacia la izquierda y entra la siguiente desde la derecha (al revés con "Anterior") | `startTransition` + `addTransitionType('nav-forward' \| 'nav-back')` + `<ViewTransition key={preguntaId}>` | 240 ms `ease-in-out` | Fundido de 120 ms |
| 20 | "Guardado" en examen | Punto que late mientras guarda; tilde breve al terminar | CSS `@keyframes` de opacidad | 1 s en bucle solo mientras guarda | Texto "Guardando…" sin latido |
| 21 | Reloj del examen | En el último minuto cambia a tono de aviso con un pulso suave cada 10 s | CSS | 380 ms | Solo cambia el color |
| 22 | **Examen aprobado** | El porcentaje cuenta de 0 a la nota, el anillo se dibuja hasta la nota, aparece "Aprobado" con rebote y cae confeti con los colores de los niveles | Conteo: hook propio con `requestAnimationFrame` (25 líneas). Anillo: `stroke-dashoffset`. Confeti: componente propio en `<canvas>` (≈70 líneas, 80 partículas, se desmonta solo) | conteo 700 ms `ease-out`; confeti 1,8 s | Número final directo, anillo completo, sin confeti; queda el sello estático |
| 23 | Examen no aprobado | El porcentaje cuenta, el anillo se dibuja en tono neutro; sin vaivén ni rojo pleno; aparece "Estudiá esto" como acción principal | Igual que 22, sin confeti | 700 ms | Valores finales directos |
| 24 | **Insignia desbloqueada** | Hoja o diálogo con la insignia que entra girando 180° en Y con rebote, brillo que la recorre una vez y halo que se expande | CSS: `rotateY` + `scale` con `ease-spring`; brillo = degradé con `background-position`; halo = `box-shadow` animado por `opacity` sobre un pseudo-elemento | 700 ms + brillo 900 ms | Fundido; sin giro, brillo ni halo |
| 25 | **Subida de nivel** | En el sendero N1→N4, el tramo hasta el nuevo nivel se dibuja y el nodo nuevo late una vez; el chip de nivel cambia de color con morph | SVG `stroke-dashoffset` + `<ViewTransition name="chip-nivel">` | 900 ms `ease-in-out` | Estado final directo |
| 26 | Racha | La llama crece y vuelve (1 → 1,2 → 1) cuando suma un día; el número cuenta +1 | CSS `@keyframes` + hook de conteo | 380 ms `ease-spring` | Sin escala |
| 27 | Conteo en el panel (KPI) | Los números suben desde 0 la primera vez que entran en pantalla | Hook `useConteo` (rAF + `IntersectionObserver`), `tabular-nums` para que no baile el ancho | 700 ms `ease-out` | Valor final directo |
| 28 | Barras y gráficos del panel | Las barras crecen desde la base, escalonadas | CSS `scaleY` / `scaleX` + `transition-delay` | 380 ms `ease-out`, 30 ms entre barras | Sin crecimiento |
| 29 | Contador de la campana y de la bandeja | Aparece con un rebote corto cuando cambia | CSS `@keyframes` con `key` = número | 240 ms `ease-spring` | Sin rebote |
| 30 | Toast | Sube 12 px con fundido; se va con fundido | CSS `@starting-style` | 240 ms / 160 ms | Fundido |
| 31 | Favorito | La estrella se rellena con escala 1 → 1,25 → 1 | CSS | 240 ms `ease-spring` | Solo relleno |
| 32 | Acordeones (editor, organigrama) | Se abren con altura animada | CSS `interpolate-size: allow-keywords` + `::details-content`; donde no haya soporte, abre sin animar | 240 ms `ease-out` | Instantáneo |

### 3.4 `prefers-reduced-motion` (regla global)

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 1ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 1ms !important;
    scroll-behavior: auto !important;
  }
  .mr-fundido { transition: opacity 120ms linear !important; }   /* excepción explícita */
  ::view-transition-group(*), ::view-transition-old(*), ::view-transition-new(*) {
    animation-duration: 120ms !important;
    animation-delay: 0s !important;
    animation-name: mr-fade !important;       /* solo opacidad, sin desplazamiento */
  }
}
```

Criterio: con movimiento reducido **no desaparece la información, desaparece el desplazamiento**. Se conservan los fundidos de 120 ms; se eliminan deslizamientos, escalas, rebotes, vaivenes, confeti y bucles. El confeti y las partículas directamente no se montan (`matchMedia` en el componente). Hace falta una prueba E2E con `reducedMotion: 'reduce'` que verifique que resultado, Probalo e insignia muestran su estado final.

### 3.5 Dependencias

**Ninguna obligatoria.** Todo lo anterior sale con CSS, la API nativa de `<dialog>` / `popover` y `ViewTransition` de React, que ya viene con Next 16.

| Tentación | Decisión | Motivo |
|---|---|---|
| `framer-motion` / `motion` (≈35–50 kB gzip) | No | `ViewTransition`, `@starting-style` y `linear()` cubren entradas, salidas, morph y rebote. |
| `canvas-confetti` (≈6 kB gzip) | No, salvo que se quiera ahorrar el trabajo | 70 líneas propias alcanzan y se cargan con `next/dynamic` solo en resultado e insignia. Si se prefiere no mantenerlo, es la única dependencia razonable, importada de forma diferida. |
| Librería de gráficos (Recharts ≈ 100 kB) | No | El panel necesita barras, anillos y una línea chica: SVG a mano con tokens. |
| `lucide-react` | Opcional | Ver 2.7. |
| Radix / shadcn | No | `<dialog>` y `popover` nativos resuelven foco, Esc y cierre al tocar afuera. |

Cambio de carga, no de dependencia: pasar la fuente a `next/font/google`.

---

## 4. Logo: tres direcciones

Hoy no hay logo. Requisitos: relacionado con aprender, propio (ni Canvas ni Siglo 21), legible a 16 px (favicon) y a 22 px en la barra lateral, y que funcione en una tinta. Las tres se dibujan sobre una grilla de 32×32 dentro de un cuadrado redondeado índigo (`rx="9"`, `#4f46e5`), con el símbolo en blanco. Logotipo: "PEA" en Plus Jakarta Sans 800, tracking −0,02em, a la derecha del símbolo con 8 px de separación.

### A · "Sendero" (recomendada)

Cuatro puntos que crecen y suben en diagonal, unidos por un trazo punteado: los cuatro niveles del perfil evolutivo. Retoma la ilustración N1→N4 que ya existe en Bienvenida, así que la marca nace de algo que el producto ya dice. Es además el recurso animable por excelencia (el tramo se dibuja al subir de nivel).

```svg
<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
  <rect width="32" height="32" rx="9" fill="#4f46e5"/>
  <path d="M7 23.5C10.5 23.5 10.5 20 13 19.5S16.5 15.5 19 14.5S22.5 10.5 25 8.5"
        fill="none" stroke="#fff" stroke-opacity=".5" stroke-width="1.5"
        stroke-linecap="round" stroke-dasharray="0.1 3.2"/>
  <circle cx="7"  cy="23.5" r="2.25" fill="#fff" fill-opacity=".55"/>
  <circle cx="13" cy="19.5" r="2.75" fill="#fff" fill-opacity=".7"/>
  <circle cx="19" cy="14.5" r="3.25" fill="#fff" fill-opacity=".85"/>
  <circle cx="25" cy="8.5"  r="4"    fill="#fff"/>
</svg>
```

Variantes: a 16 px se quita el trazo punteado y quedan los cuatro puntos. En una tinta, las opacidades pasan a 100 % y los puntos se diferencian solo por tamaño. Versión a color (para Bienvenida y certificado): los cuatro puntos toman `--nivel-1…4` sobre fondo `#1e1b4b`.

### B · "Señalador"

Una P mayúscula geométrica cuyo palo termina en el corte en V de un señalador de libro: letra inicial + marcar por dónde vas. Es la más sobria y la que mejor resiste tamaños chicos.

```svg
<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
  <rect width="32" height="32" rx="9" fill="#4f46e5"/>
  <!-- P: palo de 5 px de ancho (x 10–15), panza semicircular de radio 6; base con muesca en V -->
  <path d="M10 7H18A6 6 0 0 1 18 19H15V25.5L12.5 23L10 25.5Z" fill="#fff"/>
  <!-- contraforma de la panza -->
  <path d="M15 11.5H18A1.5 1.5 0 0 1 18 14.5H15Z" fill="#4f46e5"/>
</svg>
```

Variantes: sin contenedor, la P en índigo sobre claro. El corte en V puede animarse (el señalador "cae" 4 px al cargar).

### C · "Libro que abre"

Un libro abierto visto de frente, de trazo, con una chispa de cuatro puntas que sale del lomo hacia arriba: leer y que algo se encienda. Es la más literal y la más cálida, pero también la más cercana a un ícono genérico de biblioteca.

```svg
<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
  <rect width="32" height="32" rx="9" fill="#4f46e5"/>
  <!-- libro: dos páginas simétricas que se juntan en el lomo (x = 16) -->
  <path d="M16 14.5C13.5 12.6 10.5 12.2 7 12.8V24C10.5 23.4 13.5 23.8 16 25.7C18.5 23.8 21.5 23.4 25 24V12.8C21.5 12.2 18.5 12.6 16 14.5Z"
        fill="none" stroke="#fff" stroke-width="2" stroke-linejoin="round"/>
  <path d="M16 14.5V25.7" stroke="#fff" stroke-width="2" stroke-linecap="round"/>
  <!-- chispa de 4 puntas centrada en (16, 7), radio 3,5 -->
  <path d="M16 3.5L17 6L19.5 7L17 8L16 10.5L15 8L12.5 7L15 6Z" fill="#fbbf24"/>
</svg>
```

Variantes: en una tinta la chispa va en blanco. A 16 px se elimina la línea del lomo.

**Recomendación:** A. Es la única que cuenta lo que PEA tiene de propio (evolución por niveles), ya está sembrada en la pantalla de bienvenida y le da al sistema de movimiento su gesto de firma. B queda como alternativa si se busca algo más institucional.

Entregables de marca: `components/marca/logo.tsx` (símbolo y símbolo + texto, tamaños 20 / 28 / 40), `app/icon.svg`, `app/apple-icon.png` (180 px), `theme-color`, y borrar los SVG de plantilla de `public/`. El mismo símbolo va en el PDF del certificado y en `/verificar`.

---

## 5. Hoja de ruta por paquetes

Cada paquete es dueño exclusivo de sus archivos. **P0 va primero y solo**; P1 a P6 pueden correr en paralelo sobre P0; P7 cierra.

Convenciones para todos: nada de hex en componentes; nada de glifos como íconos; cada carpeta de ruta agrega su `loading.tsx` y envuelve su `page.tsx` con la receta de transición de P0; toda animación respeta la regla global de movimiento reducido; texto mínimo.

### P0 · Fundaciones (bloqueante)

Dueño de: `app/globals.css`, `app/layout.tsx`, `components/ui/**` (existentes y nuevos), `lib/dominio/leccion.ts` (solo `COLOR_NIVEL` / `colorNivel`), `lib/utils/**`.

1. Tokens de la sección 2 (tipo, espaciado, radios, sombras, color claro y oscuro, niveles) y de la 3.2 (duraciones y curvas). Alias temporales de los nombres viejos (`--muted`, `--card`, …) para no romper a nadie.
2. Fuente con `next/font`, `color-scheme`, `theme-color`, foco global, enlace de salto, regla de movimiento reducido, clases de View Transitions (`nav-forward`, `nav-back`, `slide-up`, `slide-down`, `morph`) y `::view-transition { pointer-events: none }`.
3. Primitivos en `components/ui/`: `button` (tamaños + cargando), `input` / `select` / `interruptor`, `card` (variantes), `chip` (reemplaza `badge`), `pestanas`, `dialogo` (diálogo + hoja), `popover`, `progreso` (barra + anillo), `avatar`, `icono`, `vacio`, `skeleton`, `toast`, `transicion-pagina` (envoltorio de `ViewTransition`), `conteo` (hook + componente), `confeti`, `tilde-animado`.
4. Página interna `/ayuda/estilo` no es parte de este paquete; si se quiere un catálogo, va en P7.

Criterio de salida: la app se ve igual o mejor sin tocar ninguna página; `grep` de `#[0-9a-f]{6}` en `components/ui` = 0.

### P1 · Marco, navegación, acceso y marca

Dueño de: `components/nav/**`, `components/marca/**` (nuevo), `app/(app)/layout.tsx`, `app/(examen)/layout.tsx`, `app/(auth)/**`, `app/verificar/**`, `app/page.tsx`, `app/icon.svg`, `app/apple-icon.png`, `app/favicon.ico`, `public/**`, `app/not-found.tsx`, `app/error.tsx`, `app/(app)/loading.tsx`.

- Logo A en barra lateral, encabezado de celular, acceso y verificación. Favicon.
- Barra lateral con indicador activo que se desliza; navegación inferior con indicador; "Más" como hoja inferior; "Cuenta" como popover (D6). Encabezado de celular pegajoso con desenfoque.
- Bienvenida e Ingresar con el mismo marco; sendero visible también en celular; tarjetas de rol como control único; botón a ancho completo.
- `/verificar`: sello, logo, código con formato.
- Anclaje de `nav` y `header` en las transiciones (animación 1).

### P2 · Aprender (inicio, cursos, lección, Probalo)

Dueño de: `app/(app)/inicio/**`, `app/(app)/estudiar/**`, `components/leccion/**`, `components/tablero/**`.

- D1 y D2. Ancho de lectura. Bloques de lección con ícono y tratamiento propio.
- Tarjeta de curso nueva (anillo de progreso, sin franja vacía); morph tarjeta → cabecera (animación 3).
- Probalo con animaciones 15–17; lección terminada (18); barra de pasos (14).
- Tablero: contadores sin color en cero, conteo, tarjeta de progreso viva, racha (si el dato existe; si no, dejar el hueco preparado y pedirlo a quien lleve datos).
- `loading.tsx` de inicio, lista, curso y lección.

### P3 · Exámenes

Dueño de: `components/examen/**`, `app/(examen)/**`, `app/(app)/examenes/**`.

- Diálogo del examen sobre el primitivo de P0. Controles de ordenar / clasificar / formulario con primitivos (sin flechas de texto ni `<select>` nativo).
- Deslizamiento entre preguntas (19), indicador de guardado (20), reloj (21).
- Resultado: anillo + conteo + confeti al aprobar (22); no aprobado en tono suave con "Estudiá esto" como acción principal (23).
- Portada: jerarquía de datos, botón con ancho acotado.

### P4 · Perfil y logros

Dueño de: `app/(app)/perfil/**`, `components/perfil/**`.

- Insignia rediseñada (medalla con relieve por nivel, estados obtenida / bloqueada / perdida) y vitrina con las que faltan.
- Hoja de insignia desbloqueada (24) y subida de nivel con el sendero (25). Expone `<InsigniaDesbloqueada>` para que P3 la dispare desde el resultado (P3 solo la importa).
- Estados vacíos colapsados; fila de certificado que no se rompa en celular; interruptor para avisos por email.

### P5 · Comunicación y consulta

Dueño de: `app/(app)/bandeja/**`, `app/(app)/avisos/**`, `app/(app)/actualizaciones/**`, `app/(app)/calendario/**`, `app/(app)/consignas/**`, `app/(app)/repositorio/**`, `app/(app)/recursos/**`, `app/(app)/buscar/**`, `app/(app)/organigrama/**`, `app/(app)/ayuda/**`, `components/repositorio/**`, `components/markdown.tsx`.

- Bandeja dentro del mismo marco que el resto; filtro con primitivo; avatares con regla de color.
- Avisos con ícono por tipo y marca de no leído; vacíos con el primitivo.
- Calendario: "hoy" y día de la semana en celular, eventos legibles en escritorio, flechas con ícono.
- Repositorio: categorías con ícono y color, vacías atenuadas, descripciones recortadas a una línea; artículo con ancho de lectura y título en `h1`.
- Organigrama: árbol real con avatares; "Qué hace cada puesto" pasa a Ayuda o a globos.

### P6 · Gestión (equipo, contenido, admin)

Dueño de: `app/(app)/equipo/**`, `app/(app)/contenido/**`, `app/(app)/admin/**`, `components/contenido/**`.

- D3 y D10. Pestañas únicas. Tablas densas en escritorio; filas-tarjeta en celular.
- Panel: KPI con conteo (27) y variación; barra de avance por asesor; barras por categoría (28); "CSV" como botón con ícono.
- Usuarios: invitar en hoja; lista como tabla con acciones al pasar.
- Contenido: búsqueda, filtros y paginación; editor con acordeones (32) y arrastre para ordenar.

### P7 · Cierre y control de calidad

Dueño de: `e2e/diseno.spec.ts` (nuevo), `docs/diseno/**` (nuevo), `app/(app)/ayuda/estilo/**` si se decide el catálogo.

- Activar el modo oscuro (quitar el candado de `data-theme`) cuando `grep` de `text-white|bg-white|#[0-9a-f]{6}` en `app/` y `components/` dé 0 fuera de `components/ui`.
- Pruebas: capturas de referencia por pantalla en claro y oscuro; recorrido con `reducedMotion: 'reduce'`; desborde a 360 px; objetivos táctiles ≥ 44 px; contraste de tokens; foco visible en cada control.
- Quitar los alias temporales de tokens de P0.

### Orden y prioridad

| Prioridad | Qué | Paquete |
|---|---|---|
| 1 | D1, D2, D3 (defectos visibles) | P2, P6 (pueden salir antes de P0 como arreglos puntuales) |
| 2 | Tokens, primitivos, foco, movimiento reducido, recetas de transición | P0 |
| 3 | Probalo, lección terminada, resultado de examen, insignia | P2, P3, P4 |
| 4 | Marca, navegación, acceso, verificación | P1 |
| 5 | Skeletons y transiciones de ruta en todas las secciones | P1–P6 (cada uno lo suyo) |
| 6 | Panel con datos visuales, tablas densas | P6 |
| 7 | Comunicación y consulta | P5 |
| 8 | Modo oscuro activado y pruebas visuales | P7 |

Puntos de contacto entre paquetes (los únicos): P3 importa `<InsigniaDesbloqueada>` de P4; todos importan de `components/ui` (P0) y nadie más lo edita; `colorNivel` cambia de firma en P0 y sus consumidores (P2, P4, P6) se adaptan en su propio paquete gracias a los alias.
