# Relevamiento de aprendizaje, simulaciones y reinscripción · noviembre 2026

Base: las 40 lecciones de `contenido/lecciones`, sus fuentes, el motor de exámenes y prácticas, y el seed de preguntas. La parte de técnicas de retención se apoya en marcos conocidos (entrevista motivacional, asesoramiento apreciativo, desescalada); no se hizo búsqueda web en esta pasada y **todo lo que toca políticas de la Universidad queda marcado para validar**.

## 1. Diagnóstico

**Lo que está bien**
- Las lecciones son cortas, con ejemplos en la voz del alumno y con la excepción derivada a la fuente.
- El Probalo da corrección inmediata con explicación y es obligatorio para cumplir el paso.
- El motor ya tiene tipos ricos: cuadro para clasificar, ordenar pasos, formulario simulado y simulación encadenada.

**Lo que falta para que se aprenda y no se olvide**

| # | Problema | Ejemplo | Efecto |
| --- | --- | --- | --- |
| 1 | **La mayoría de los Probalo piden recordar un dato, no decidir.** | "¿Cuál es el máximo del plan que se reconoce por equivalencias? 50 / 70 / 100" | Se acierta leyendo el renglón de arriba; no prepara para la consulta real |
| 2 | **Verdadero/Falso sobra.** 23 de las 54 preguntas son V/F: 50% de acierto al azar. | "El Aula Virtual es Canvas. V/F" | Infla el avance sin medir nada |
| 3 | **No hay repaso.** Terminada la lección, el tema no vuelve hasta el final del nivel o la recertificación. | — | A las semanas se olvida la mayor parte |
| 4 | **No hay mezcla de temas.** Cada Probalo pregunta solo lo de su lección. | — | En el mostrador las consultas llegan mezcladas |
| 5 | **Los tipos ricos casi no se usan en las lecciones.** Todo es opción única o V/F. | "Condiciones de aprobación" pide un cuadro; "Inscribirse a exámenes" pide ordenar pasos | Se desaprovecha lo que ya existe |
| 6 | **Los ejemplos muestran la respuesta, no el razonamiento.** | "Tengo 6 y 6, ¿puedo promocionar?" → respuesta | No enseña qué preguntar antes de responder (modalidad, tipo de materia, correlativas) |
| 7 | **No hay práctica con las herramientas.** El asesor aprende qué decir, pero no dónde hacer clic en el Portal o el CRM. | — | El primer contacto con el sistema real es con un alumno delante |
| 8 | **No hay práctica de conversación.** Reinscripción, deuda, enojo: nada lo entrena. | — | Es justo donde más diferencia hace un buen asesor |

**Antes → después (misma lección, misma fuente)**

> Antes: *vf: Para regularizar hay que aprobar al menos 3 de los 4 TP con 5 o más.*
>
> Después (caso): *Lucía cursa una MIA en EDH. Tiene TP1: 8, TP2: sin entregar, TP3: 6, TP4: 7, y los parciales con 5 y 7. ¿Qué le decís?*
> - Que promociona → no: en MIA el TP no entregado es 0 y no llega a 3 de 4 con 7.
> - **Que queda regular y rinde final de 30 preguntas** → correcto: 3 de 4 TP con 5 o más y parciales con 5 o más.
> - Que queda libre → no: cumple la regularidad.
> - Que puede rehacer el TP2 → no: en MIA cada TP se entrega una sola vez.
>
> Cada opción incorrecta es un error real y lleva su propia explicación.

## 2. Capa interactiva (en orden de impacto)

### 2.1 Repaso diario espaciado — M
- **Qué hace el asesor:** al entrar ve "Repaso de hoy: 5 preguntas, 2 minutos". Son preguntas de lecciones ya hechas, mezcladas.
- **Cómo elige:** cada pregunta tiene una "caja" por asesor (1, 3, 7, 16, 35 días). Si acierta, sube de caja; si falla, vuelve a la primera. Primero las vencidas, después las que falló en exámenes.
- **Puntaje:** racha de días y porcentaje de dominio por tema, visible en el perfil y en el panel.
- **Datos:** tabla `repaso (usuario, pregunta, caja, proxima_fecha, aciertos, fallos)`. Reusa las preguntas de práctica y `practica_intentos`.
- **Autoría:** ninguna; se alimenta de los Probalo.

### 2.2 Casos de decisión en el Probalo — M (contenido)
- Reescribir los Probalo como mini casos (como el ejemplo de arriba), con explicación por opción.
- Usar el cuadro, ordenar pasos y el formulario donde corresponde.
- **Datos:** `opciones.explicacion` (hoy la explicación es una sola por pregunta).
- Regla de autoría: como máximo un V/F por lección, y solo para un error muy común.

### 2.3 Simulador de pantallas — L
Un motor único que reproduce cualquier herramienta a partir de una descripción, sin programar cada una.
- **Qué hace el asesor:** recibe una consigna ("Inscribí a Marcos al final de Derecho Privado del 12/12") y la resuelve sobre una réplica de la pantalla: hace clic, completa campos, elige opciones. Tiene modo guiado (resalta dónde ir) y modo libre (sin ayuda, con tiempo).
- **Cómo se describe un escenario:** un JSON con pantallas, cada una con su imagen o maqueta, zonas clicables, campos y la acción que dispara cada una; más los pasos esperados y los errores típicos con su devolución.
- **Puntaje:** pasos correctos, clics de más, tiempo, y si pidió pistas.
- **Datos:** `simuladores (id, herramienta, titulo, definicion jsonb, estado)` y `simulador_intentos (usuario, simulador, pasos jsonb, puntaje, duracion)`.
- **Autoría sin programar:** un editor donde se sube la captura, se dibujan las zonas y se escribe la consigna.
- **Herramientas:**
  - Portal de Estudiantes (inscripción a materias y a exámenes): se puede armar ya con maquetas propias a partir de las guías de La Nube.
  - Klarway (registro y rendir): ídem.
  - Canvas del alumno: ídem.
  - **HubSpot y BC: esperan las capturas reales** (Claude in Chrome). El motor queda listo para cargarlas.
- **Cuidado de marca:** las réplicas son maquetas neutras de la estructura, sin logos ni estilos de terceros.

### 2.4 Conversaciones simuladas — L
- **Qué hace el asesor:** chatea con un alumno ficticio (enojado por una cuota, quiere dejar, faltó a un final). En cada turno elige entre 3 respuestas o escribe la suya.
- **Versión 1 (sin IA):** árbol de decisiones escrito a mano; cada opción suma o resta en una rúbrica (escucha, claridad, exactitud de la norma, cierre) y cambia el ánimo del alumno, que se ve en pantalla.
- **Versión 2 (con IA, Etapa 10):** el alumno responde libremente según su ficha y la IA puntúa con la misma rúbrica; un líder revisa las de puntaje bajo.
- **Datos:** `conversaciones_sim (id, titulo, persona jsonb, arbol jsonb, rubrica jsonb)` e intentos con el recorrido.
- **Autoría:** editor de árbol con vista previa; plantillas por tipo de caso.

### 2.5 Juegos de 3 minutos — S/M
- **¿Regular, promociona o libre?** Notas al azar y se decide contra reloj.
- **¿A quién derivo?** Consultas que se arrastran al área correcta (cuando esté la lista de derivaciones).
- **Ordená el trámite:** pasos mezclados.
- Se generan solos a partir de las reglas ya cargadas; puntaje propio y racha.

### 2.6 Audio y video al estilo NotebookLM — M
- **Dónde suman:** una introducción de 2 a 3 minutos por curso ("qué vas a poder resolver"), los temas con mucho contexto (EVA 21, cambio de modalidad) como diálogo entre dos voces para escuchar en el viaje, y los casos de conversación como ejemplo actuado bueno y malo.
- **Dónde no:** normas con números y fechas (cambian y hay que regrabar), y pasos de sistemas (ahí va el simulador).
- **Producción barata:** guion a partir de la lección → voz sintética en español rioplatense → placas con los puntos clave y subtítulos. Cada pieza guarda su guion y su fuente para regenerarla cuando cambie la norma.
- **Requisito:** una cuenta de un servicio de voz (decisión y costo del dueño). Sin eso se puede dejar el guion y el reproductor listos.

## 3. Curso nuevo: Retención y reinscripción

**Línea ética, explícita en el curso:** el objetivo es que el alumno tome una buena decisión con información completa. No se inventa urgencia, no se promete lo que el reglamento no da, no se oculta el costo y se respeta un "no".

| Módulo | Lecciones | Simulación |
| --- | --- | --- |
| 1. Escuchar primero | Preguntas abiertas; reflejar lo que dice; resumir antes de proponer (OARS) | "No sé si sigo" |
| 2. Entender el motivo real | Los cuatro motivos (plata, tiempo, rendimiento, dudas con la carrera); qué preguntar en cada uno | Clasificar 8 frases de alumnos por motivo |
| 3. Proponer opciones reales | Cambio de modalidad, menos materias, becas y beneficios, plan de pagos, Gabinete de Bienestar, tutores | Armar un plan con 3 datos del alumno |
| 4. Objeciones frecuentes | "No me da el tiempo", "es caro", "me fue mal", "me cambio a otra" | Árbol con las cuatro |
| 5. Alumno con deuda | Qué puede y qué no puede prometer el asesor; cómo decirlo sin culpar | "Debo dos cuotas y quiero rendir" |
| 6. Enojo y desescalada | Escuchar, reconocer, disculparse por la experiencia, resolver o derivar, confirmar | Reclamo por una nota no cargada |
| 7. Cierre y seguimiento | Próximo paso concreto con fecha; registrar en el CRM; contacto proactivo antes del cierre de inscripción | Redactar el seguimiento |

**Lección de muestra: "Escuchar antes de ofrecer"**
- *En 30 segundos:* Antes de proponer algo, preguntá y repetí con tus palabras lo que entendiste. · La primera razón que da el alumno casi nunca es la única. · Una pregunta abierta empieza con qué, cómo o contame.
- *Así llega al CAU:* "Creo que este cuatrimestre no me anoto." → "Contame qué te está frenando." (no: "¿Sabías que hay una beca?")
- *Ojo con:* Ofrecer un descuento antes de entender el motivo. · Preguntar "¿por qué?" suena a reproche; mejor "¿qué pasó?".
- *Probalo (caso):* un alumno dice "es mucha plata"; se eligen dos preguntas para entender si el problema es el monto, el momento o la duda de seguir.

**Conversación de muestra: "No me da el tiempo"**
1. Alumna: "Trabajo ocho horas y tengo un nene. No llego."
   - A. "Te entiendo, pero si dejás perdés la regularidad." → ánimo baja; devolución: empezaste por la consecuencia.
   - **B. "Suena agotador. ¿Qué materia te está costando más sostener?"** → ánimo sube; reconoce y abre.
   - C. "¿Probaste organizarte mejor?" → ánimo baja; suena a juicio.
2. Alumna: "Las que tienen Open Class, no llego al CAU."
   - **A. "¿Te sirve que veamos cómo sería cursar en EDH, todo en la plataforma?"** → opción real; validar condiciones del pase.
   - B. "Podés faltar igual." → incorrecto: en ED hay asistencia.
3. Cierre: acordar un paso con fecha ("Te mando hoy los requisitos y hablamos el jueves") y registrarlo.

**A validar con la Universidad:** qué beneficios y planes de pago puede ofrecer un asesor, qué puede prometer sobre deuda, guiones o frases que la institución exige, y el registro obligatorio en el CRM.

## 4. Paquetes de trabajo

| Paquete | Contenido | Tamaño | Depende de |
| --- | --- | --- | --- |
| A1 Repaso diario | Tabla, selección espaciada, pantalla de repaso, racha, dominio por tema | M | — |
| A2 Probalo como casos | Explicación por opción; reescritura de los 54 Probalo; uso de cuadro, ordenar y formulario | M | — |
| A3 Motor de simulador | Definición JSON, reproductor guiado y libre, puntaje, editor de zonas | L | — |
| A4 Simuladores del alumno | Portal (materias y exámenes), Klarway y Canvas con maquetas propias | M | A3 |
| A5 Conversaciones | Motor de árbol, rúbrica, ánimo, editor; 6 conversaciones | L | — |
| A6 Curso Retención y reinscripción | 7 módulos, unas 20 lecciones y sus simulaciones | M | A5; validación de la Universidad |
| A7 Juegos de 3 minutos | Tres juegos generados de las reglas | M | — |
| A8 Audio y video | Guiones, reproductor, piezas por curso | M | Cuenta de un servicio de voz |
| A9 Simuladores de HubSpot y BC | Escenarios con capturas reales | M | A3; capturas del dueño |

A1, A2, A3, A5 y A7 no comparten archivos y pueden avanzar en paralelo.

## 5. Preguntas para el dueño
1. ¿Los simuladores pueden usar maquetas propias "parecidas" o tienen que ser capturas reales de cada sistema?
2. ¿Qué puede ofrecer un asesor en una charla de reinscripción (beneficios, planes de pago, excepciones)?
3. ¿Audio y video con voz sintética está bien, o tiene que ser una voz de la institución?
4. ¿El repaso diario es obligatorio (cuenta para el nivel) o voluntario con racha?
