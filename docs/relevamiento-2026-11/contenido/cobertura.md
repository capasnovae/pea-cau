# Cobertura y calidad del contenido de PEA

Relevamiento hecho sobre `relevamiento/` (reglamento + La Nube) y `contenido/lecciones/` (40 lecciones). Alcance CAU: grado y pregrado, ED, EDH y PD. Fecha de revisión: 12/11/2026.

## 0. Antes de empezar: el inventario no coincide

- `relevamiento/README.md` e `indice.json` hablan de **101 páginas** (52 + 49), pero en disco hay **126** (52 + 74). Hay 25 archivos de La Nube que no están en el índice ni en el README: `becas-siglo-21`, `calendario-2026-ed-edh`, `calendario-2026-p-pd`, `calendario-academico-distancia`, `calendario-academico-presencial`, `calendario-de-tramites`, `calendario-tramites-2026`, `como-empadronarse-en-klarway`, `condicion-cursado-ed`, `condicion-cursado-presencialidad-distribuida`, `condiciones-de-cursado-presencial`, `condiciones-de-cursado`, `defensa-oral`, `directores-de-carrera`, `documentacion`, `eximicion-idiomas`, `inscripcion-a-examenes`, `materias-map`, `modulo0`, `requisitos-tecnicos-edusoft`, `requisitos-tecnicos-klarway`, `revision-de-examen`, `test-de-autorregulacion-del-aprendizaje`, `tp-modalidad-presencial`, `uso-de-espacios`.
- `scripts/importar-relevamiento.mts` lee el directorio, no el índice: el seed carga **125 artículos** (saltea solo `ebook-21`). Coordinación va a ver 24 artículos más de los que dice el README.
- Cuatro lecciones dependen de páginas que no están indexadas: 35 (`ln-inscripcion-a-examenes`), 37 (`ln-defensa-oral`), 38 (`ln-eximicion-idiomas`) y 39 (`ln-modulo0`).
- Recomendación: regenerar `indice.json` y el README desde el directorio antes de que coordinación empiece a validar.

## 1. Temas sin lección

Temas que están en el relevamiento, que entran en el alcance del CAU y que aparecen en consultas frecuentes, pero que no tienen lección (o la lección existente cubre solo la regla del reglamento y no el trámite concreto que ve el estudiante).

| # | Tema | Archivo(s) fuente | Por qué importa en el mostrador (consulta típica) | Prioridad | Curso |
|---|---|---|---|---|---|
| 1 | Despegue 21 / Introducción a la Vida Universitaria (IVU) y primeros pasos del ingresante | `lanube/tuprimersemestre.md`, `reglamento/2-1-carreras-de-pregrado-y-grado.md` | "¿Tengo que ir al CAU antes de empezar?" Es obligatoria, se hace una sola vez en el CAU o sede y la organiza el propio CAU. Ninguna lección la menciona. | Alta | Ingreso (nuevo) |
| 2 | Carga del legajo en Digital Admin, plazos y casos especiales (actualización de datos, cambio de género, Fonoaudiología, ciclos de complementación) | `lanube/documentacion.md` | "¿Cómo subo el analítico?", "Me rechazaron el DNI de Mi Argentina", "Quiero cambiar mi nombre en el sistema". La lección 13 explica la regla del reglamento (presentar en el CAU) pero no el trámite digital que describe La Nube. | Alta | Ingreso |
| 3 | Ingreso de mayores de 25 sin secundario completo | `reglamento/2-2-...` §2.2.4, `lanube/documentacion.md` (Estudiantes +25) | Consulta de aspirante: "No terminé el secundario, ¿puedo anotarme?". Requisitos, documentación, carta y plazo de 45 días hábiles. | Alta | Ingreso |
| 4 | Asistencia, Open Class y reincorporación (ED y PD) | `reglamento/3-1-modalidades-de-cursado.md` (asistencia, tolerancia de 15 min, reincorporación en ED y en PD), `lanube/modalidad-ed.md`, `lanube/presencialidad-distribuida.md` | "Falté a dos Open Class, ¿pierdo la materia?", "Llegué tarde". La reincorporación es distinta en ED (automática, da solo Regular) y en PD (con justificativos). La lección 02 solo da el 75%. | Alta | Cursado |
| 5 | Ajustes razonables: exámenes en el CAU con acompañamiento y tiempo extendido | `reglamento/3-1-...`, `reglamento/4-5-...` §4.5.4 y §4.5.6 (RCS 933/2021) | El CAU tiene una obligación propia: estos estudiantes rinden "sin excepción" en el CAU, acompañados por personal del CAU. "Tengo certificado de discapacidad, ¿cómo rindo?" La lección 02 lo menciona en una línea. | Alta | Normas y acompañamiento |
| 6 | Generar y pagar tickets en ePagos; matrícula de PENDIENTE a HABILITADA; inscripción paso a paso | `lanube/inscripcion-a-materias.md`, `lanube/app-siglo-21.md` | "Pagué y no me puedo inscribir", "¿Qué ticket genero?", "¿El idioma cuenta en el paquete?". Las lecciones 03, 10 y 11 dan las reglas pero no el paso a paso. | Alta | Aranceles |
| 7 | Becas por postulación: tipos, porcentajes, requisitos, horas de retribución, pedido antes de pagar | `lanube/becas-siglo-21.md`, `reglamento/14-3-becas-y-beneficios.md` | "¿Qué becas hay y cuánto descuentan?", "Ya pagué, ¿me aplican la beca?" (no). La lección 12 es genérica: no da tipos, porcentajes ni las horas semanales (10, 8 o 4) que exige la beca. | Alta | Aranceles |
| 8 | Beneficios: cómo pedirlos (Consulta Alumnos, 5 días hábiles), Persistencia a la Graduación y Garantía de Adaptación | `lanube/becas-y-beneficios.md`, `reglamento/14-3-...` (beneficios, Persistencia, Garantía de Adaptación) | "Me fue mal en todo el primer semestre, ¿pierdo lo que pagué?" (Garantía de Adaptación: reconoce matrícula y aranceles, una vez, hasta 2 años). "Me faltan 2 materias, ¿hay descuento?". Ninguna lección lo cubre. | Alta | Aranceles |
| 9 | Equivalencias: trámite online, con regla y sin regla, estados y plazos | `lanube/equivalencias.md` | Consulta muy frecuente de aspirantes con estudios previos: "¿Cuánto tarda?", "Me quedó como regular condicional, ¿qué significa?". La lección 06 da solo la regla del reglamento, que además contradice a La Nube (ver contradicciones 11 y 12). | Alta | Trámites |
| 10 | Seguimiento del título: etapas (validación, legalización, despacho), SIDCer, retiro en Campus, envío al CAU, constancia de egreso, certificado de título en trámite | `lanube/proceso-de-titulacion.md` | "¿Cuándo sale mi título?", "¿Me lo mandan al CAU?", "Necesito una constancia para el colegio profesional". El CAU recibe los títulos que se envían. La lección 08 solo dice "hasta 120 días". | Alta | Egreso |
| 11 | Idiomas: placement test (extensión de Klarway en Chrome), English Discoveries, niveles al 70%, inscripción desde la segunda matrícula, licencia de 12 meses, Portugués | `lanube/idiomas.md`, `reglamento/4-5-...` §4.5.11 C | "No puedo hacer el placement", "¿Cuándo me anoto a Inglés?", "Rendí el nivel y no avanzo". La lección 25 resume la regularidad en dos líneas. | Media | Evaluación |
| 12 | TPs por tipología: Valoración de Tiempo de Entrega, Camino de Dominio, foros obligatorios de MIA y MIP (si no participó, el TP vale 1) | `lanube/trabajos-practicos.md`, `lanube/tipos-de-materias.md`, `lanube/condicion-cursado-*.md` | "Entregué el TP2 y me pusieron 1" (no participó del foro). La lección 20 no menciona la nota 1 ni el Camino de Dominio. | Media | Evaluación |
| 13 | Seminario Final y CAE: cursado, elección de producto y línea temática (no se cambia), plazo de corrección de 10 días, estados de la CAE en el Portal | `lanube/seminariofinal.md`, `lanube/cae.md`, `reglamento/12-2-...` | "¿Dónde veo cómo va mi CAE?", "¿Puedo cambiar el tema?". La lección 29 cubre la regla, no la operatoria. | Media | Egreso |
| 14 | EFIP: inscripción (6 días, aceptación automática, no se anula), sedes, etapas del examen, EFIP Ágil, EFIP I Diferenciado (Abogacía) | `lanube/efip.md` | "¿Dónde rindo el EFIP?", "¿Qué es el EFIP Ágil?". La lección 26 da la regla, no la logística. | Media | Evaluación |
| 15 | Práctica Profesional y Práctica Solidaria: organización asignada, Digital Admin, seguro, encuentros, cronograma | `lanube/practica-profesional.md`, `lanube/practica-solidaria.md`, `reglamento/4-2-...` §4.2.2.6, `reglamento/4-4-...` | "¿Quién me consigue la organización?", "¿Tengo seguro?". La lección 25 resume solo las condiciones. | Media | Evaluación |
| 16 | Materias electivas y créditos (4 créditos = 1 electiva; Idiomas y Práctica Solidaria no cuentan; créditos por ayudantía, voluntariado o capitanía deportiva) | `lanube/materias-electivas.md`, `reglamento/6-1-...` §6.1.6 A, `lanube/ayudantias.md`, `lanube/salud-y-deportes.md`, `lanube/sustentabilidad-social.md` | "¿Cuántas electivas tengo que hacer?", "¿El voluntariado me suma?". Es requisito para el EFIP II y para el título; ninguna lección lo explica. | Media | Cursado |
| 17 | Articulaciones pregrado-grado y doble titulación | `reglamento/6-1-...` §6.1.6 B y §6.1.7 | "Terminé la tecnicatura, ¿cuánto me reconocen para la licenciatura?". La lección 08 solo nombra el tema. | Media | Trámites |
| 18 | Calendario de trámites del año (cambio de modalidad, beneficios, becas) | `lanube/calendario-tramites-2026.md` | "¿Hasta cuándo pido el cambio de modalidad?". Hoy las fechas están sueltas dentro de las lecciones 05 y 12. Conviene una lección propia que se actualice una vez por año. | Media | Trámites |
| 19 | E-book 21 y biblioteca (primer ingreso por formulario, 72 h hábiles; horarios y mails de biblioteca) | `lanube/aprendizaje-para-la-vida.md` (bloque E-book), `lanube/canales-de-contacto.md`, `reglamento/13-2-...` | "No puedo entrar al E-book". La única instrucción está dentro de la página de APLV, que está fuera de alcance; la página propia de E-book está vacía. | Media | Plataformas |
| 20 | Materias MAP y acuerdo pedagógico | `lanube/materias-map.md` | "¿Dónde están las consignas del TP2?" (en el Acuerdo Pedagógico). | Baja | Evaluación |
| 21 | Mesas especiales de examen (solo carreras de grado presenciales, por lo tanto en el CAU aplica a PD) | `reglamento/4-5-...` §4.5.10 | "Me queda una sola materia, ¿puedo pedir una mesa?". Hay que pedirla con 30 días hábiles de diferencia respecto del turno. | Baja | Evaluación |
| 22 | Directores de carrera y encuentros virtuales | `lanube/directores-de-carrera.md`, `lanube/encuentros-con-directores.md` | Derivación académica. La lección 33 lo nombra en una línea. | Baja | Normas y acompañamiento |
| 23 | Klarway: estados del empadronamiento (aprobado, rechazado, en revisión, hasta 24 h hábiles) y requisitos técnicos | `lanube/como-empadronarse-en-klarway.md`, `lanube/requisitos-tecnicos-klarway.md` | "Me figura en revisión, ¿puedo rendir?". Conviene ampliar la lección 32. | Baja | Plataformas |
| 24 | Firma digital y validación de documentos | `reglamento/1-6-firma-digital.md` | "¿Me sirve impreso el certificado digital?" (no). | Baja | Trámites |
| 25 | Pasantías, ayudantías y certificados por competencias | `reglamento/7-1-...`, `reglamento/9-1-...`, `reglamento/8-2-...`, `lanube/ayudantias.md` | Consultas esporádicas. Alcanza con el artículo publicado. | Baja | No requiere lección |

Fuera de esta lista quedaron a propósito: posgrado, P y PH, Medicina (curso de nivelación, presencial), APLV y las páginas institucionales.

## 2. Páginas fuera de alcance o que no conviene publicar

### 2.1 Fuera de alcance (solo P, PH o posgrado)

| Archivo | Motivo | Recomendación |
|---|---|---|
| `reglamento/2-3-carreas-de-posgrado.md` | Posgrado | No publicar |
| `reglamento/11-1` a `11-6` (6 archivos) | Capítulo de posgrado completo (la readmisión de 11-6 es solo de posgrado) | No publicar |
| `reglamento/12-3-trabajo-final-de-posgrado-maestrias.md` | Posgrado | No publicar |
| `reglamento/12-4-trabajo-final-de-posgrado-especializaciones.md` | Posgrado | No publicar |
| `lanube/posgrado-presencial.md`, `lanube/posgrado-virtual.md` | Posgrado | No publicar |
| `lanube/aprendizaje-para-la-vida.md` | Formación continua (APLV) con contacto de posgrado. Antes de descartarla, rescatar el bloque de E-book 21 (tema 19). | No publicar |
| `lanube/modalidad-presencial.md`, `lanube/modalidad-presencial-home.md` | Solo P y PH | No publicar |
| `lanube/condiciones-de-cursado-presencial.md` | Solo P (casi igual a la de PD) | No publicar |

### 2.2 Mezclan alcance (publicar recortando o con aviso)

| Archivo | Problema | Recomendación |
|---|---|---|
| `reglamento/3-1-modalidades-de-cursado.md` | Incluye P y PH | Publicar con aviso: "En el CAU aplica PD, ED y EDH" |
| `reglamento/4-5-sitema-de-evaluacion-...md` | Mezcla MP-PH; la tabla de MIP no incluye PD en el oral (ver contradicción 6) | Publicar con aviso |
| `reglamento/5-1-calendario-academico.md`, `5-2-inscripcion-a-materias.md` | Secciones de P y PH; numeración rota ("3.3.2" dentro del 5.1) y referencia cruzada a un "Apartado 3.2.2" que no existe | Publicar con aviso |
| `reglamento/14-4-normas-arancelarias.md` | §14.4.7 es de posgrado | Publicar con aviso (recortar 14.4.7) |
| `reglamento/2-4-...-extranjeros.md` | Bloque "Programas de posgrado" | Publicar con aviso |
| `reglamento/4-4-vinculacion-y-extension.md` | Mitad institucional (investigación); la otra mitad (Práctica Solidaria, PAT, PIC, SEC) sirve | Publicar con aviso |
| `reglamento/13-2-normas-de-comportamiento-de-biblioteca.md` | Bibliotecas de sede; sirve solo para "no deber libros" antes de una baja | Publicar con aviso |
| `reglamento/14-6-tratamiendo-de-datos-personales.md` | Cesión de datos a bancos; uso bajo en el mostrador. Además el título tiene un error ("Tratamiendo") | Publicar con aviso y corregir el título |
| `lanube/documentacion.md` | Incluye "Documentación para Posgrado" y tiene enlaces rotos (ver 2.5) | Publicar con aviso (recortar posgrado) |
| `lanube/inscripcion-a-examenes.md` | Incluye PH; los plazos de inscripción a parciales son fechas de 2026 | Publicar con aviso |
| `lanube/tp-modalidad-presencial.md` | P, PH y PD juntas | Publicar con aviso: "en el CAU, solo PD" |
| `lanube/practica-profesional.md`, `lanube/practica-solidaria.md` | Fechas de TP del 2° semestre de 2026; Práctica Profesional no tiene sección para PD | Publicar con aviso |
| `lanube/tuprimersemestre.md` | Describe las 5 modalidades | Publicar con aviso: "en el CAU, ED, EDH y PD" |

### 2.3 Institucionales sin uso en el mostrador

| Archivo | Recomendación |
|---|---|
| `reglamento/1-1`, `1-2`, `1-3`, `1-4`, `1-5` | No publicar |
| `reglamento/4-1-estructura-academica.md`, `4-3-metodos-y-didacticas.md` | No publicar |
| `reglamento/8-1`, `8-3`, `8-4`, `8-5` | No publicar |
| `reglamento/10-1`, `10-2` (investigación) | No publicar |
| `lanube/actividades-disciplinares.md`, `arte-y-cultura.md`, `desarrollo-y-proposito.md`, `investigacion.md`, `internacionalizacion.md`, `empleabilidad.md`, `ce-emprendimiento-innovacion.md`, `comunidad-net.md` | No publicar (en su mayoría son newsletters de Experiencias 21) |
| `lanube/egresados.md` | Contiene un enlace OAuth con parámetro de sesión. Conviene llevar el contacto de egresados a la página de titulación | No publicar; fusionar el contacto con `proceso-de-titulacion` |
| `lanube/uso-de-espacios.md` | Normas de convivencia de Sede Campus; enlaces que apuntan a la misma página | No publicar |
| `lanube/salud-y-deportes.md`, `lanube/sustentabilidad-social.md` | Lo único útil es el crédito por electiva (capitanía deportiva, voluntariado) | Fusionar con `materias-electivas` |

### 2.4 Vacías, casi vacías, con contenido equivocado u obsoletas

| Archivo | Problema | Recomendación |
|---|---|---|
| `lanube/ebook-21.md` | Sin texto (el importador ya la saltea) | No publicar |
| `lanube/simulador-de-condicion.md` | Solo trae una frase; la herramienta no se puede relevar | No publicar (o fusionar con condiciones de materias como enlace) |
| `lanube/calendario-de-tramites.md` | **Contenido equivocado**: es un fragmento sobre "internships". El importador lo carga igual porque supera los 80 caracteres | No publicar; usar `calendario-tramites-2026` |
| `lanube/calendario-academico.md` | Índice de botones sin datos (incluye Cervantes y Martillero) | Fusionar con `calendario-2026-ed-edh` |
| `lanube/requisitos-tecnicos-edusoft.md` | Obsoleta: pide Flash Player 18, Windows 7 e Internet Explorer 10 | No publicar hasta que se actualice |
| `reglamento/11-3-condiciones-de-cursado.md` | 200 caracteres (además es de posgrado) | No publicar |

### 2.5 Duplicadas y enlaces rotos

| Archivo | Problema | Recomendación |
|---|---|---|
| `reglamento/14-2-cambios-de-modalidad.md` | Copia casi textual de `3-2-cambios-de-modalidad.md` | Fusionar con 3-2 |
| `lanube/condiciones-de-cursado.md` (EDH) y `lanube/condicion-cursado-ed.md` | Casi idénticas; la única diferencia relevante es que la de EDH no dice "sólo MEC" en la Valoración de Tiempo de Entrega. Las dos perdieron los requisitos de cada condición (estaban en imágenes) | Fusionar en "Condiciones de materias ED/EDH" y completar los requisitos desde el reglamento 4.5.8 |
| `lanube/calendario-academico-distancia.md` | Se superpone con `calendario-2026-ed-edh` | Fusionar |
| `lanube/calendario-academico-presencial.md` | Se superpone con `calendario-2026-p-pd` (P y PD) | Fusionar |
| `lanube/revision-de-examen.md` | Repite el reglamento 4.5.7 B | Fusionar con 4-5 (lección 23) |
| `lanube/directores-de-carrera.md` y `lanube/encuentros-con-directores.md` | El mismo tema en dos páginas; la tabla de directores tiene celdas vacías (por ejemplo Contador Público) | Fusionar, con aviso de que los datos cambian |
| `lanube/teacompanamos.md` y `lanube/tuprimersemestre.md` | Las dos se titulan "SOY INGRESANTE" con contenido distinto; `tuprimersemestre` está categorizada como "institucional" cuando es onboarding | Renombrar y recategorizar |
| `lanube/documentacion.md` | Enlaces a `?put=2-1-condiciones-de-ingreso-y-admision` y `?put=2-2-documentacion-obligatoria`: esos slugs no existen en el reglamento actual. "Mirá el paso a paso en Digital Admin" apunta a la misma página | Corregir los enlaces |
| `lanube/cae.md` | Enlaza a `www.reglamento.21.edu.ar/trabajo-final`, un dominio distinto al del reglamento relevado (no verificado) | Verificar |
| `relevamiento/README.md` | Acceso a `?put=5-1-inscripcion-a-materias` (enlace roto ya conocido) | Ya documentado |

No verifiqué los enlaces en línea: lo marcado se basa en los slugs relevados.

### 2.6 Datos que vencen

No hay montos en ningún archivo (aranceles, tasas y matrícula aparecen sin valores). Las fechas que vencen son estas:

| Archivo | Dato que vence | Recomendación |
|---|---|---|
| `lanube/calendario-2026-ed-edh.md`, `calendario-2026-p-pd.md`, `calendario-tramites-2026.md` | Calendario 2026 completo; en semanas falta el de 2027 | Publicar con aviso y fecha de vencimiento (31/12/2026) |
| `lanube/calendario-academico-distancia.md`, `calendario-academico-presencial.md` | 2° semestre de 2026 | Fusionar (ver 2.5) |
| `lanube/inscripcion-a-examenes.md` | "Primer Parcial: hasta el 18 de octubre", "hasta el 14 de agosto" | Publicar con aviso |
| `lanube/colaciones-2026.md` | Actos del 17 al 19/11/2026: **vence en una semana** | No publicar (o publicar hasta el 19/11 y despublicar) |
| `lanube/encuentros-con-directores.md`, `lanube/teacompanamos.md` | "Encuentros 2026", "segundo semestre 2026" | Publicar con aviso |
| `lanube/directores-de-carrera.md` | Nombres y mails de personas | Publicar con aviso |
| `lanube/ayudantias.md` | "Próxima convocatoria 2027" | Publicar con aviso |
| `lanube/becas-y-beneficios.md` | "Actualizado al 2026" | Publicar con aviso |
| `lanube/modulo0.md` | "Inicio de Cursado: 18 de febrero" (sin año) | Publicar con aviso |
| `lanube/canales-de-contacto.md` | Horarios de biblioteca | Publicar con aviso |

### 2.7 Lecciones con fechas que vencen o con la fuente mal indicada

- Las lecciones **04, 05, 12 y 15** tienen fechas de 2026 escritas en el texto (cambio de cátedra, cambio de modalidad, beneficios, calendario). En todas el campo `fuente` es una página del reglamento, pero el dato sale de los calendarios de La Nube. Hay que sacar las fechas a una lección anual (tema 18) o citar el calendario como fuente.
- La lección **01** (fuente `rg-2-5`) da "Windows 10 o superior, o Mac Monterrey 12.6.3": ese dato sale de `requisitos-tecnicos-klarway`, no de 2-5.
- Las lecciones **22 y 35** se contradicen entre sí (ver contradicción 2), y también las **18 y 24** (ver contradicción 4).

**Totales de la sección 2**: 43 páginas para **no publicar** (15 fuera de alcance, 23 institucionales, 3 vacías o con contenido equivocado, 1 obsoleta, 1 vencida) y 9 para **fusionar**.

## 3. Contradicciones

Formato: **reglamento (rg)** frente a **La Nube (ln)**, o entre páginas de un mismo sitio. Entre paréntesis, la lección que toma partido o que hay que corregir.

1. **Asistencia al CAU en EDH.**
   rg `3-1`: "el cursado de estas materias no requiere asistencia al CAU".
   ln `modalidad-edh`: "4 Encuentros en el Centro de Apoyo Universitario (CAU)". La propia ln `tuprimersemestre` dice: "Todo el cursado se realiza desde casa, sin necesidad de asistir al CAU". Parece un copiado de la página de ED. (La lección 02 sigue al reglamento.)

2. **Inscripción a parciales en ED/EDH.**
   rg `4-5` §4.5.5: "Examen Parcial: hasta 24 (veinticuatro) horas antes de la fecha del examen. Esta inscripción no se puede anular ni modificar en ningún caso."
   ln `inscripcion-a-examenes` y `calendario-academico-distancia`: "Desde la primera semana de cursado vas a poder inscribirte tanto al Parcial 1 como al Parcial 2" y "Si no realizás la inscripción dentro del plazo correspondiente, el sistema asignará automáticamente una fecha para rendir". (La lección 22 sigue al rg y la 35 sigue a ln: un asesor que hace las dos recibe dos respuestas distintas.)

3. **Plazo para anular la inscripción al recuperatorio o integrador.**
   rg `4-5` §4.5.5: "podrán anular la inscripción al menos con 48 (cuarenta y ocho) horas antes del examen".
   ln `condicion-cursado-ed`, `condiciones-de-cursado` y `condicion-cursado-presencialidad-distribuida`: "hasta 48 horas hábiles antes".

4. **Promocionar con una correlativa pendiente.**
   ln `correlativas`: "Es posible promocionar una materia correlativa, siempre y cuando su correlativa anterior sea aprobada dentro de los 60 días de finalizada la materia".
   rg `4-5` §4.5.8: "En caso de incumplimiento del régimen de correlatividades previas de la materia al finalizar el cursado, la materia adquiere la condición de Regular". El reglamento no prevé ningún plazo de 60 días. (La lección 18 incluye los 60 días; la 24 dice que sin correlativas queda Regular.)

5. **Valoración de Tiempo de Entrega en MAP.**
   rg `4-5` §4.5.8 (MAP): "reducirá 5 puntos por cada día de demora", es decir, aplica a MEC y a MAP.
   ln `trabajos-practicos`, `condicion-cursado-ed` y `condicion-cursado-presencialidad-distribuida`: "Valoración de Tiempo de Entrega (sólo para materias MEC)". (La lección 20 sigue al rg.)

6. **Oral en el final para MIP en PD.**
   rg `4-5`, tablas de MEC, MIA y MAP: "Examen oral (solo en Modalidad P, PH y PD)". La tabla de MIP dice: "Examen oral (solo en Modalidad P y PH)".
   ln `condicion-cursado-presencialidad-distribuida`: "en caso de aprobarlo pasarás a una instancia Oral", sin excepción para MIP. (La lección 24 da por buena la tabla de MIP.)

7. **Constancia de título en trámite.**
   rg `2-2`: "puede presentar un certificado o constancia de estudios o título en trámite [...] Este certificado tiene una validez de 1 (un) año".
   ln `documentacion`: "toda constancia de analítico o título en trámite no es válida para constatar tus estudios". (La lección 13 sigue al rg.)

8. **Cómo se presenta el legajo.**
   rg `2-2` §2.2.1: "deberá presentarse en la Sede o Centro de Apoyo Universitario (CAU) [...] presentando la documentación en original y copia".
   ln `documentacion`: "Para cargar tu documentación de legajo de manera digital y autogestiva deberás utilizar la plataforma Digital Admin". (La lección 13 sigue al rg.)

9. **Plazo del legajo en los ciclos de complementación.**
   rg `2-2` §2.2.3: "deberá ser presentada dentro del primer año de cursado. Como excepción, en la carrera de Escribanía [...] seis (6) meses".
   ln `documentacion`: "debe ser presentada dentro del primer semestre de cursado".

10. **Requisitos para mayores de 25.**
    rg `2-2` §2.2.4: "tener completo, como mínimo, el tercer año del nivel secundario y posean experiencia laboral vinculada con la carrera".
    ln `documentacion`: "El requisito básico es que cuentes con CBU completo, o que hayas cursado y aprobado hasta 3er año [...] o 9 años cursados". No menciona la experiencia laboral.

11. **Regular por equivalencia.**
    rg `6-1` §6.1.3: "La Universidad en ningún caso otorgará un reconocimiento parcial o el otorgamiento de la condición de regular por equivalencia".
    ln `equivalencias`: "se te van a otorgar las equivalencias como regular condicional debiendo completar la documentación antes de la 9° semana". (La lección 06 sigue al rg.)

12. **Plazo de las equivalencias.**
    rg `6-1`: "se gestiona en un plazo de 45 (treinta) días hábiles": el número y la palabra no coinciden.
    ln `equivalencias`: "el plazo de resolución de tu solicitud será de 3 días hábiles" (con regla) y "30 días hábiles" (sin regla).

13. **Beneficio Persistencia a la Graduación.**
    rg `14-3`: "aplica sobre los aranceles semestrales, excluyendo la matricula semestral" y da "una disminución del 30%", con promedio 8.
    ln `becas-y-beneficios`: "Beneficio en Matrícula [...] aguardar la aplicación automática del 50% de descuento" cuando solo resta el EFIP II o la Defensa Oral.

14. **Excepción al EFIP II para la Defensa Oral.**
    rg `12-2` §12.2.5: "a excepción de aquellas carreras que sean Ciclos de Complementación Curricular".
    ln `defensa-oral`: "excepto en la Licenciatura en Educación, donde no se exige este requisito". (La lección 37 lo esquiva con "consultá la fuente".)

15. **Nota final del TFG.**
    rg `12-2` §12.2.5: "será el resultado de la ponderación de la calificación de la etapa de Seminario final y CAE y la etapa de Defensa Oral".
    ln `seminariofinal`: "La nota final será la que obtengas en tu Defensa Oral". (La lección 29 sigue al rg.)

16. **Anulación de la inscripción al EFIP.**
    rg `4-5` §4.5.5: "hasta 6 (seis) días CORRIDOS anteriores [...] pudiendo anular su solicitud hasta 7 (siete) días CORRIDOS antes". Es incoherente en sí: se puede inscribir hasta el día 6 pero anular solo hasta el 7.
    ln `efip`: "La ACEPTACIÓN [...] se realizará automáticamente a los 6 días de CORRIDO" y "Una vez aceptada la mesa de examen, NO SE PUEDE ANULAR". (La lección 22 da 6 y 7.)

17. **Vencimiento del TP2 de las prácticas.**
    rg `4-5` §4.5.11: Práctica Solidaria y Práctica Profesional vencen en "SEMANA 6 | SEMANA 8 | SEMANA 12 | SEMANA 15".
    ln `practica-solidaria` y `practica-profesional`: "9° Semana - 28/09/2026" para el TP2. (La lección 25 dice semanas 6, 8, 12 y 15.)

18. **Asistencia en Práctica Profesional para PD.**
    rg `4-5` §4.5.11 B: "75% de asistencia [...] aplica únicamente para Modalidad Presencial y Presencial Home".
    rg §4.5.11 A (Práctica Solidaria): "solo aplica para Modalidad Presencial, Presencial Home y Presencial Distribuida".
    ln `practica-profesional` no tiene sección para PD. No queda claro qué rige para PD.

19. **Requisitos de la Práctica Profesional.**
    rg `4-5` §4.5.11 B: "Realización de 250 horas de práctica [...] nota mayor o igual a 7 (siete)".
    ln `practica-profesional`, "Requisitos de aprobación": solo pide 3 TP con el TP4 aprobado (y 75% en P y PH). Omite las horas y la nota de la organización.

20. **Materia virtual en ED: optativa u obligatoria.**
    rg `3-1`: "Quienes cursen carreras de Grado pueden, además, cursar en cada subperíodo 1 (una) materia íntegramente virtual".
    ln `modalidad-ed`: "A pesar de cursar bajo la modalidad ED, vas a tener que cursar materias en modalidad EDH".

21. **Dónde rinde parciales el pregrado en ED/EDH** (contradicción dentro del reglamento).
    rg `4-5` §4.5.12 (pregrado, "MP, PH, PD, ED y EDH"): "Las instancias de exámenes parciales, recuperatorios o integradores se rinden en la Sede de cursado, en día y horario definido a tal fin en el Calendario Académico".
    rg `3-1` (ED y EDH): "pudiendo ser rendidos dentro de la sede de cursado o en el lugar que cada estudiante determine".

22. **Promoción indirecta en verano** (dentro del reglamento).
    rg `4-5` §4.5.9: la Promoción Indirecta pide "3 de 4 TP´s aprobados con nota 5 o más" y "2 parciales aprobados con nota 5 o más", es decir, lo mismo que la Regularidad.
    §4.5.8 pide "4 de 4 TP´s [...] con nota 7 o más" y parciales con 5 o 6. (La lección 16 no menciona la promoción indirecta.)

23. **Matrícula en P/PH/PD** (dentro del reglamento).
    rg `14-4` §14.4.1: "Matrícula 1er semestre: abarca turnos de examen de febrero-marzo y julio-agosto" y "Matrícula 2do semestre: abarca turnos de examen de agosto y diciembre". Agosto queda en las dos. (La lección 10 solo da las fechas de distancia: el CAU no tiene la regla de PD.)

24. **Tickets en PD** (dentro del reglamento).
    rg `14-4` §14.4.2: el título dice "MODALIDAD PRESENCIAL (P) y PRESENCIAL DISTRIBUIDA (PD)", pero el texto dice "Quienes cursen en la Modalidad Presencial (P) tendrán la opción de generar [...] tickets por 1, 3, 4 y 6". (La lección 10 lo aplica a PD.)

25. **Actividades áulicas en MAP** (dentro del reglamento).
    rg `4-5` §4.5.8: "Para quienes se encuentren inscriptos en la Modalidad Presencial, Presencial Home, Educación Distribuida Home y Presencial Distribuida, y cursen [...] MAP, el cuerpo docente propondrá actividades evaluativas de proceso en los entornos áulicos". Incluye EDH, que no tiene aula, y deja afuera a ED: probable error.

26. **Inscripción a parciales cuatrimestrales** (dentro de La Nube).
    ln `inscripcion-a-examenes`: "Primer Parcial: hasta el 14 de agosto. Segundo Parcial: hasta el 4 de septiembre", con el cursado empezando el 03/08.
    ln `tipos-de-materias` (MIP): "SEGUNDO PARCIAL - De la semana 10 a la 17". No cierran entre sí.

27. **Horario de acreditación en la colación** (dentro de La Nube).
    ln `colaciones-2026`: "Pregrado debe estar 1h30 antes de la hora estipulada" y, en "Información clave", "Presentate 2 horas antes del horario publicado para tu acto".

28. **Dominio del usuario institucional.**
    ln `egresados`: "necesitas tu usuario @soysiglo.edu.ar".
    ln `portal-de-estudiantes` y `aula-virtual`: "N.USUARIO@soysiglo.21.edu.ar".

Menores (no las cuento): la CAE se llama "Comisión Asesora CAE" en ln `seminariofinal` y "Comisión Académica Evaluadora" en el resto; el CAU aparece como "Centro de Aprendizaje Universitario" en ln `proceso-de-titulacion`; hay tres caminos distintos en el Portal para ver correlativas (`correlativas`, `inscripcion-a-materias`, `practica-profesional`); y hay dos "Módulo 0" distintos (`modulo0`, de materias troncales, y el del Seminario Final).

**Total: 28 contradicciones.** De ellas, 20 son entre el reglamento y La Nube o entre lecciones, y 8 son internas de un mismo sitio.

## 4. Temas que el relevamiento NO cubre

Preguntas para que coordinación consiga la fuente oficial. No tienen respuesta en el material.

**Reinscripción y continuidad**
1. ¿Cómo y cuándo se reinscribe un estudiante de un semestre al siguiente? ¿Hay un período de reinscripción distinto del de inscripción a materias?
2. ¿Cómo retoma un estudiante de grado o pregrado que estuvo inactivo uno o más períodos? (La readmisión relevada, 11-6, es solo de posgrado; 14-1 habla de migración de plan pero no del trámite.)
3. ¿Existe licencia o pausa académica? ¿Qué pasa con la regularidad y la matrícula?
4. ¿Cómo se pide un cambio de CAU (sin cambiar de modalidad)? El reglamento solo dice que es "exclusiva responsabilidad de cada estudiante contactar al CAU de destino".
5. ¿Cómo se pide un cambio de carrera dentro de la misma modalidad, y cuáles son sus plazos?

**Deuda, pagos y montos**
6. ¿Hay planes de pago o refinanciación de deuda? ¿Quién los otorga y cómo se piden?
7. ¿Qué recargo por mora se aplica y cómo se calcula? (14-4 dice que "puede tener recargo", sin valores.)
8. ¿Cuáles son los medios de pago aceptados en ePagos y cuánto tarda cada uno en acreditarse? (Solo aparece "72 horas hábiles" en general.)
9. ¿Dónde consulta el CAU los montos vigentes de matrícula, aranceles, materias extra, verano, tasa de equivalencias y tasa de graduación? No hay ningún monto en el relevamiento.
10. ¿Qué promociones están vigentes y dónde se publican? ("Chequeá tu correo con frecuencia" no sirve en el mostrador.)
11. ¿Qué pasa con la deuda cuando se pide la baja a mitad de semestre? ¿Se puede pedir la baja con deuda? (14-5 exige no tener deuda.)
12. ¿Cómo funciona el "Beneficio Persistencia a la Graduación" en matrícula (50%), que no figura en el reglamento?

**Derivación y atención**
13. ¿Qué consultas resuelve el CAU y cuáles deriva? ¿A qué área (Consulta Alumnos, tutores, director de carrera, Gabinete, Centro de Sustentabilidad Social, Área TFG, Egresados)?
14. ¿Qué tipificaciones de Consulta Alumnos existen y cuál corresponde a cada trámite? (Solo aparecen algunas: "Becas y Beneficios", "Envío de título", "Constancia de egreso u oficio", "Certificado de título en trámite".)
15. ¿Cuáles son los plazos de respuesta de Consulta Alumnos y del chat con el Asesor Institucional?
16. ¿Cómo se registra y se escala un reclamo? ¿Hay libro de quejas o un circuito formal, y con qué plazos?
17. ¿Qué datos puede dar el asesor por teléfono o WhatsApp, y cómo valida la identidad? ¿Puede informar a familiares? (14-6 trata solo la cesión a bancos.)
18. ¿Cuáles son los horarios de atención del CAU y los protocolos de mostrador, teléfono y WhatsApp?
19. ¿Quién da soporte técnico de Klarway, Canvas, Portal, Edusoft y Digital Admin, y por qué canal?

**Casos especiales**
20. ¿Qué situaciones abarca la Resolución CS 535/2017 (excepciones de asistencia y ausencia) y cómo se acreditan?
21. ¿Cuál es el procedimiento para solicitar ajustes razonables (RCS 933/2021)? ¿Quién lo tramita y qué tiene que hacer el CAU para acompañar al estudiante en el examen?
22. ¿Cómo se inscribe un menor de edad?
23. ¿Cuál es el trámite concreto para pedir la Garantía de Adaptación?

**Certificados y oferta**
24. ¿Cómo se piden el certificado de alumno regular y el analítico parcial? ¿Cuánto tardan y cuánto cuestan?
25. ¿Qué carreras se dictan en cada modalidad en el CAU (en particular en PD)? ¿Dónde se consulta la oferta por CAU?
26. ¿Cómo es el proceso de inscripción del aspirante paso a paso (preinscripción, primer pago, alta de usuario)?
27. ¿Qué cubre el seguro de la Práctica Profesional y la Práctica Solidaria? (Las páginas tienen la sección "¿Cuento con un Seguro?" sin texto.)

**Fechas del año próximo**
28. ¿Cuándo salen los calendarios académico y de trámites 2027 y las fechas de EFIP 2027?

## 5. Propuesta de cursos

Las lecciones nuevas se numeran desde la 41. Se agrega un curso de **Ingreso** que toma el módulo homónimo de Cursado, porque concentra las consultas de aspirantes e ingresantes. "Ampliar N" significa sumar a una lección existente sin crear una nueva.

| Curso | Módulos | Lecciones existentes | Lecciones nuevas propuestas |
|---|---|---|---|
| **Ingreso** (nuevo) | Antes de empezar · Legajo · Primer semestre | 01, 13, 14, 19, 39 | 41 Despegue 21 (IVU) y primeros pasos · 42 Legajo en Digital Admin: plazos y casos especiales · 43 Ingreso de mayores de 25 |
| **Plataformas del estudiante** | Portal y aula · Exámenes online · Biblioteca | 30, 31, 36 · 32, 35 · — | 44 E-book 21 y biblioteca · ampliar 32 (estados del empadronamiento, requisitos técnicos) |
| **Cursado y modalidades** | Modalidades · Inscripción y calendario · Plan de estudios | 02 · 03, 04, 15, 16 · 17, 18 | 45 Asistencia, Open Class y reincorporación (ED y PD) · 46 Materias electivas y créditos |
| **Evaluación (EVA 21)** | Trabajos y exámenes · Aprobación · Materias especiales | 20, 21, 22, 23 · 24 · 25, 26, 38 | 47 Entregas por tipología: Valoración de Tiempo de Entrega, Camino de Dominio y foros · 48 Idiomas: placement, niveles y portugués · 49 EFIP: inscripción, sedes, EFIP Ágil · 50 Práctica Profesional y Solidaria en la práctica · 51 Materias MAP y acuerdo pedagógico (baja) · 52 Mesas especiales en PD (baja) |
| **Trámites** | Trámites académicos · Fechas del año · Documentos | 05, 06, 07 · — · — | 53 Equivalencias: trámite online y estados · 54 Articulaciones y doble titulación · 55 Calendario de trámites del año · 56 Firma digital (baja) |
| **Aranceles, becas y pagos** | Aranceles y pagos · Becas y beneficios | 10, 11 · 12 | 57 Generar y pagar tickets; habilitar la matrícula · 58 Becas por postulación: tipos, porcentajes y retribución · 59 Beneficios: cómo pedirlos, Persistencia y Garantía de Adaptación |
| **Egreso** | Trabajo final · Título y colación | 28, 29, 37 · 08, 09 | 60 Seminario Final y CAE en el Portal · 61 Seguimiento del título, envío al CAU y constancias · ampliar 37 (tasa y visado, PD) |
| **Normas y acompañamiento** | Normas · Acompañamiento y derivación | 27 · 33, 34, 40 | 62 Ajustes razonables y exámenes acompañados en el CAU · 63 Directores de carrera (baja) · 64 Mapa de derivación (cuando coordinación consiga la fuente; ver sección 4) |

**Prioridad alta** (10 lecciones): 41, 42, 43, 45, 53, 57, 58, 59, 61 y 62.

Antes de escribir lecciones nuevas, hay que resolver las contradicciones que tocan lecciones existentes: 2 (lecciones 22 y 35), 4 (18 y 24), 6 (24), 7 y 8 (13), 11 (06), 14 (37), 16 (22) y 17 (25).
