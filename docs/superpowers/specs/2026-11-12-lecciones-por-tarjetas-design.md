# Diseño · Lecciones por tarjetas, videos con Revideo y Klarway para CEO

Fecha: 2026-11-12. Pedido por la dueña de PEA.

## Por qué

Las lecciones de hoy se leen como un recorte del reglamento o de La Nube: viñetas sueltas ("En 30 segundos", "Así llega al CAU", "Ojo con"), sin hilo y sin la sensación de que alguien te está enseñando. La dueña quiere lecciones que **enseñen**: que tengan coherencia, ejemplos y un poco de interacción, que se entiendan rápido desde el celular y que se recuerden. Delegó en nosotros la forma; eligió:

- **Formato nuevo por tarjetas**, combinando las tres cosas que se le propusieron: tarjetas con un caso, texto en el tono de un compañero que te explica (con ejemplos) y un video corto.
- **Videos con Revideo** (gratis, licencia MIT; Remotion se descartó porque la organización necesitaría licencia de empresa). **La duración de cada video depende de lo que se explique**, no es fija.
- **Klarway para el subrol CEO**: como Klarway puede fallar, sumar tips para resolver sus problemas, con video donde ayude.

## Objetivos

1. Las 40 lecciones pasan al formato por tarjetas, reescritas a partir del contenido ya revisado contra las fuentes (`docs/relevamiento-2026-11/contenido/`), sin perder las correcciones ni el Probalo nuevo.
2. Un asesor recorre una lección en 3 a 6 minutos desde el celular, tarjeta por tarjeta, y responde el Probalo en el medio del recorrido, no al final como un examen.
3. Cada lección tiene un video corto fabricado con Revideo desde el contenido de sus tarjetas, guardado fijo en PEA.
4. Un módulo nuevo de Klarway para CEO: fallas frecuentes, cómo se resuelven y cuándo derivar.

## No objetivos

- El organizador tipo carpetas (arrastrar, mover, editar en el lugar) es el **proyecto siguiente**. Acá no hay editor visual de tarjetas: las lecciones se escriben en Markdown en `contenido/lecciones/` y se importan, como hoy.
- No se publica nada en el sitio sin que la dueña lo revise (ver "Cómo se entrega").
- Voz en los videos: queda para después (ver "Voz").

## Anti-objetivos (sería un fracaso aunque funcione)

- Que siga pareciendo una copia del reglamento: texto largo, lenguaje normativo, sin caso.
- Tarjetas que solo parten el mismo texto en pedazos.
- Contenido fuera de alcance (solo grado y pregrado, EDH, ED y PD) o sin fuente.
- Videos que repiten la lección palabra por palabra o que duran más que leerla.

## Restricciones (vigentes en el proyecto)

- Alcance del CAU: grado y pregrado, modalidades EDH, ED y PD. P, PH y posgrado, solo para aclarar que no aplica.
- Todo lo relevado queda **en borrador y "A validar"**, con su fuente. Nada inventado: cada afirmación tiene respaldo en `relevamiento/` (o, para Klarway, en una fuente citada).
- Textos mínimos en la interfaz: nada de párrafos explicativos de la app.
- Sin datos personales de alumnos; los casos usan nombres inventados.
- Mobile first, tokens del sistema de diseño, modo oscuro, `prefers-reduced-motion`.
- Las lecciones publicadas no se pisan al importar (el importador ya solo actualiza borradores).

## Enfoques considerados

1. **Formato nuevo por tarjetas (elegido).** Cada lección es una secuencia de tarjetas con tipos fijos. Se reescriben las 40. El futuro editor del organizador trabajará sobre estas tarjetas.
2. Mantener los bloques actuales y reescribir solo el texto: más rápido, pero sigue siendo una ficha y no resuelve el problema.
3. Página libre con piezas interactivas intercaladas: más flexible, pero difícil de editar para la dueña y de validar.

Video: **Revideo** (MIT, mantenido, render sin interfaz a MP4) frente a Remotion (licencia paga para la organización) y a "capturas de pantalla + ffmpeg" (gratis pero sin animación). Se eligió Revideo.

## La lección por tarjetas

Un asesor ve una tarjeta por vez (deslizar o "Siguiente"), con una barra de pasos arriba. Orden típico:

| # | Tipo | Qué tiene | Interacción |
|---|---|---|---|
| 0 | `video` | El video de la lección (opcional si todavía no se fabricó) | Reproducir; se puede saltear |
| 1 | `caso` | Una persona y su consulta, en su voz, y por qué canal llega (mostrador, teléfono, WhatsApp) | — |
| 2 | `preguntar` | "Antes de responder, ¿qué le preguntás?": 3 a 5 opciones; algunas son las preguntas clave | Marcar las que harías; se revela cuáles importan y por qué |
| 3–5 | `idea` | Una idea por tarjeta: título corto + 1 o 2 párrafos breves en tono de compañero + un ejemplo concreto | — |
| — | `probalo` | Una de las preguntas del Probalo de la lección (por posición) | Responder; corrección con explicación por opción (ya existe) |
| — | `ojo` | El error más común y cómo evitarlo | — |
| último | `cierre` | El caso del principio resuelto, lo que hay que recordar en una línea y la fuente | — |

Reglas:
- Entre 5 y 10 tarjetas; el Probalo (2 o 3 preguntas, como hoy) va **intercalado**, no al final.
- La lección se cumple como hoy: si tiene Probalo, hay que acertar todas sus preguntas.
- Límites de texto por tarjeta (los valida la base): títulos ≤ 80, párrafos ≤ 500 por tarjeta, consulta del caso ≤ 300, opciones de `preguntar` ≤ 120 con su porqué ≤ 200.
- Se conserva el campo de fuente (`articulo_id`) y el Probalo como preguntas (`preguntas.item_id`).

### Cómo se guarda

`items.leccion` (jsonb) pasa a `{ "version": 2, "tarjetas": [ … ] }`. `leccion_valida` acepta la versión 2. La versión 1 (bloques de hoy) sigue siendo válida mientras dure la transición, y la vista muestra la que corresponda.

### Cómo se escribe

Markdown en `contenido/lecciones/NN-*.md`, una sección por tarjeta (`## caso`, `## preguntar`, `## idea: Título`, `## probalo 1`, `## ojo`, `## cierre`, `## video`). El importador (`lib/lecciones/importar.ts`) lo convierte a la versión 2 y lo valida con las mismas reglas que la base.

## Videos con Revideo

- Un proyecto Revideo dentro del repositorio (`video/`), con escenas reutilizables por tipo de tarjeta: portada, caso (chat o mostrador), idea (título + frase clave + ejemplo), "ojo", cierre. Estética del sistema de diseño (índigo, Plus Jakarta Sans, logo Sendero).
- **El guion sale de las tarjetas** de la lección; no se escribe aparte. Cada escena dura lo que lleva leer su texto en pantalla (por cantidad de palabras, con mínimo y máximo por escena), así que el video dura lo que se hable.
- Se fabrica desde acá con un comando (`npm run videos`), a MP4. Se prueba contra la base local; al sitio se sube **solo cuando la dueña aprueba la carga**, a un bucket privado de Supabase Storage `videos`, y la lección lo muestra con un enlace firmado, como los recursos.
- En pantalla van el caso, el título y una **frase clave** de cada idea (campo propio de la tarjeta `idea`) y el cierre: no el texto completo de la lección.
- Subtítulos/texto en pantalla siempre (se ve sin sonido).

### Voz

Sin voz en esta etapa: texto en pantalla y música suave libre de derechos (o silencio). Las voces sintéticas gratuitas que funcionan sin internet (por ejemplo Piper) necesitan descargar modelos de hosts que la sesión hoy no permite; se retoma si la dueña lo pide.

## Klarway para CEO

- Fuentes: `relevamiento/lanube/klarway.md`, `como-empadronarse-en-klarway.md`, `requisitos-tecnicos-klarway.md` y el Régimen de sanciones (faltas en exámenes). Para las fallas, que La Nube no cubre, **soluciones típicas buscadas en internet** (decisión de la dueña): ayuda pública de Klarway y documentación oficial de Windows y macOS sobre permisos de cámara y micrófono, cerrar programas que usan la cámara (Administrador de tareas / Monitor de actividad), navegador y conexión. Cada tip lleva su fuente citada y queda "A validar"; nada sin fuente.
- Derivación: el área **Sistemas Q** (cargada por la dueña en Áreas de derivación) resuelve "inconvenientes de Klarway"; las lecciones dicen cuándo derivar ahí y qué datos juntar antes.
- Lecciones previstas (por tarjetas, con video donde ayude): empadronamiento rechazado o en revisión; micrófono o cámara que no funcionan (permisos en Windows y en Mac, otro programa usando la cámara, Administrador de tareas / Monitor de actividad); el examen no abre (navegador, app, versión del sistema); se cortó la conexión en pleno examen; chequeo de requisitos antes de la mesa; lista de control del CEO para el día del examen. La cantidad final depende de lo que tenga fuente citable.
- Ubicación (**decidida por la dueña**): un curso **aparte**, "Gestión de exámenes (CEO)", con el módulo "Klarway: fallas y soluciones", asignado por ruta al subrol CEO. **No va dentro de Plataformas**: Klarway se sigue explicando en Plataformas (lección 32) y el curso CEO se ocupa de resolver fallas. La dueña podrá moverlo después con el organizador.

## Datos de partida (verificado el 2026-11-12)

- En producción los 7 cursos siguen **en borrador** y no hay avance de nadie (0 intentos de práctica): el importador puede reemplazar las lecciones por la versión 2 sin perder progreso.
- Dos preguntas del Probalo fueron editadas a mano en producción (lecciones 01 y 02). Antes de cargar, se le muestra a la dueña la diferencia (a mano, no como función de la app) y decide.
- Preguntas que no estén ubicadas por una tarjeta `probalo N` (por ejemplo, agregadas desde la app o de una sede) se muestran antes del cierre, para que la lección siempre se pueda completar.

## Cómo se entrega

1. Lecciones nuevas y videos en una rama, con pruebas (importador, validación en la base, vista de tarjetas, E2E del recorrido).
2. Se le muestra a la dueña una lección completa de muestra (capturas y el video) antes de convertir las 40.
3. Con su visto bueno se convierten todas; se le pasa un resumen y **no se carga al sitio hasta que ella diga**. Al cargar, las 2 preguntas que editó a mano en producción se le muestran antes de pisarlas.

## Lo que queda al constructor

- Diseño visual fino de cada tipo de tarjeta y de las escenas del video, dentro del sistema de diseño.
- Detalle del formato Markdown de cada tipo de tarjeta y de sus validaciones.
- Reglas exactas de duración por escena (palabras por segundo, mínimos y máximos).
- Cómo se navega entre tarjetas (deslizar y botones), cómo se guarda en qué tarjeta quedó cada asesor.
