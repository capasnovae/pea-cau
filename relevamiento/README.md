# Relevamiento de contenido

Contenido público de Siglo 21 relevado para PEA (spec §12). Todo entra a PEA como **artículo en borrador** con el aviso "A validar", la URL de origen y la fecha de extracción. Coordinación lo revisa y lo publica.

- **Fuentes:** [Reglamento institucional](https://contenidos.21.edu.ar/microsites/reglamento/) y [La Nube](https://www.lanube.21.edu.ar/).
- **Extraído:** 2026-11-08 · 101 páginas.
- **Sin datos de alumnos:** son páginas públicas para estudiantes.

## Cómo se regenera

1. `node scripts/relevamiento/recorrer.js relevamiento` recorre los dos sitios con Playwright (de a una página, con pausas) y guarda un Markdown por página en `relevamiento/<sitio>/`, con título, fuente, fecha, categoría sugerida y estado "a validar". Después de regenerar, revisar los títulos de la primera sección de cada capítulo y sacar la página `5-1-inscripcion-a-materias` (enlace roto del sitio).
2. `node --experimental-strip-types scripts/importar-relevamiento.mts` → genera `supabase/seed-relevamiento.sql`.
3. `npx supabase db reset` carga `seed.sql` y después `seed-relevamiento.sql` (artículos con prefijo `rg-` y `ln-`; no pisa nada existente).

En el reglamento, cada capítulo es un artículo y sus secciones quedan como artículos hijos.

## Pendiente

- **Ebook 21** (La Nube): la página no tiene texto (solo imágenes o un visor); no se importó.
- **Simulador de Condición** (La Nube): es una herramienta interactiva; se importó solo el texto que la acompaña.
- **HubSpot y BC:** se relevan con Claude in Chrome en una sesión local, con la sesión iniciada; mismas reglas (sin datos de alumnos, "a validar", URL y fecha).
- El acceso rápido "Inscripción al cursado" del reglamento apunta a una página inexistente (`?put=5-1-inscripcion-a-materias`, muestra la portada); se usó la sección 5.1 "Calendario académico".
- Revisar la categoría sugerida de cada página de La Nube antes de publicar.

## Índice

### Reglamento (52)

- [Sobre la Universidad](reglamento/1-1-sobre-la-universidad.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-1-sobre-la-universidad)
- [Misión y valores](reglamento/1-2-mision-y-valores.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-2-mision-y-valores)
- [Autoridades y funciones](reglamento/1-3-autoridades-y-funciones.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-3-autoridades-y-funciones)
- [Domicilio legal](reglamento/1-4-domicilio-legal.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-4-domicilio-legal)
- [Modificaciones al reglamento](reglamento/1-5-modificaciones-al-reglamento.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-5-modificaciones-al-reglamento)
- [Firma digital](reglamento/1-6-firma-digital.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-6-firma-digital)
- [Consideraciones generales](reglamento/10-1-consideraciones-generales.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=10-1-consideraciones-generales)
- [Proyectos de investigación](reglamento/10-2-proyectos-de-investigacion.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=10-2-proyectos-de-investigacion)
- [Consideraciones generales](reglamento/11-1-consideraciones-generales.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-1-consideraciones-generales)
- [Requisitos de admisión](reglamento/11-2-requisitos-de-admision.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-2-requisitos-de-admision)
- [Condiciones de cursado](reglamento/11-3-condiciones-de-cursado.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-3-condiciones-de-cursado)
- [Condiciones de aprobación de materias](reglamento/11-4-condiciones-de-aprobacion-de-materias.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-4-condiciones-de-aprobacion-de-materias)
- [Escala de notas](reglamento/11-5-escala-de-notas.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-5-escala-de-notas)
- [Readmisión de estudiantes](reglamento/11-6-readmision-de-estudiantes.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-6-readmision-de-estudiantes)
- [Condiciones para la graduación](reglamento/12-1-condiciones-para-la-graduacion.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-1-condiciones-para-la-graduacion)
- [Trabajo final de graduación](reglamento/12-2-trabajo-final-de-graduacion.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-2-trabajo-final-de-graduacion)
- [Trabajo final de posgrado maestrías](reglamento/12-3-trabajo-final-de-posgrado-maestrias.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-3-trabajo-final-de-posgrado-maestrias)
- [Trabajo final de posgrado especializaciones](reglamento/12-4-trabajo-final-de-posgrado-especializaciones.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-4-trabajo-final-de-posgrado-especializaciones)
- [Proceso de titulación](reglamento/12-5-proceso-de-titulacion.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-5-proceso-de-titulacion)
- [Colación](reglamento/12-6-colacion.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-6-colacion)
- [Régimen general de sanciones](reglamento/13-1-regimen-general-de-sanciones.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=13-1-regimen-general-de-sanciones)
- [Normas de comportamiento de biblioteca](reglamento/13-2-normas-de-comportamiento-de-biblioteca.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=13-2-normas-de-comportamiento-de-biblioteca)
- [Planes de estudio](reglamento/14-1-planes-de-estudio.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-1-planes-de-estudio)
- [Cambios de modalidad](reglamento/14-2-cambios-de-modalidad.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-2-cambios-de-modalidad)
- [Becas y beneficios](reglamento/14-3-becas-y-beneficios.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-3-becas-y-beneficios)
- [Normas arancelarias](reglamento/14-4-normas-arancelarias.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-4-normas-arancelarias)
- [Solicitud de baja](reglamento/14-5-solicitud-de-baja.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-5-solicitud-de-baja)
- [Tratamiendo de datos personales](reglamento/14-6-tratamiendo-de-datos-personales.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-6-tratamiendo-de-datos-personales)
- [Carreras de pregrado y grado](reglamento/2-1-carreras-de-pregrado-y-grado.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-1-carreras-de-pregrado-y-grado)
- [Documentación obligatoria y complementaria](reglamento/2-2-documentacion-obligatoria-y-complementaria.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-2-documentacion-obligatoria-y-complementaria)
- [Carreras de posgrado](reglamento/2-3-carreas-de-posgrado.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-3-carreas-de-posgrado)
- [Documentación obligatoria y complementaria para extranjeros](reglamento/2-4-documentacion-obligatoria-y-complementaria-extranjeros.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-4-documentacion-obligatoria-y-complementaria-extranjeros)
- [Requisitos para cursado](reglamento/2-5-requisitos-para-cursado.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-5-requisitos-para-cursado)
- [Modalidades de cursado](reglamento/3-1-modalidades-de-cursado.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=3-1-modalidades-de-cursado)
- [Cambios de modalidad](reglamento/3-2-cambios-de-modalidad.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=3-2-cambios-de-modalidad)
- [Estructura académica](reglamento/4-1-estructura-academica.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-1-estructura-academica)
- [Diseño curricular](reglamento/4-2-diseno-curricular.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-2-diseno-curricular)
- [Métodos y didácticas](reglamento/4-3-metodos-y-didacticas.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-3-metodos-y-didacticas)
- [Vinculación y extensión](reglamento/4-4-vinculacion-y-extension.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-4-vinculacion-y-extension)
- [Sistema de evaluación de los aprendizajes EVA 21](reglamento/4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21)
- [Calendario académico](reglamento/5-1-calendario-academico.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-1-calendario-academico)
- [Inscripción a materias](reglamento/5-2-inscripcion-a-materias.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-2-inscripcion-a-materias)
- [Inscripción a materias de verano](reglamento/5-3-inscripcion-a-materias-de-verano.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-3-inscripcion-a-materias-de-verano)
- [Cambios de cátedra](reglamento/5-4-cambio-de-catedra.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-4-cambio-de-catedra)
- [Sistema de equivalencias para todas las modalidades](reglamento/6-1-sistema-de-equivalencias-para-todas-las-modalidades.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=6-1-sistema-de-equivalencias-para-todas-las-modalidades)
- [Régimen de pasantías](reglamento/7-1-regimen-de-pasantias.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=7-1-regimen-de-pasantias)
- [Centros de excelencia](reglamento/8-1-centros-de-excelencia.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-1-centros-de-excelencia)
- [Certificados por competencias](reglamento/8-2-certificados-por-competencias.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-2-certificados-por-competencias)
- [ComunidadNET](reglamento/8-3-comunidadnet.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-3-comunidadnet)
- [Árbol de la convivencia](reglamento/8-4-arbol-de-la-convivencia.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-4-arbol-de-la-convivencia)
- [Destacados 21](reglamento/8-5-destacados-21.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-5-destacados-21)
- [Sistema de ayudantía de alumnos y adscripción](reglamento/9-1-sistema-de-ayundatia-de-alumnos-y-adscripcion.md) · [fuente](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=9-1-sistema-de-ayundatia-de-alumnos-y-adscripcion)

### Modalidades (5)

- [Educación Distribuida](lanube/modalidad-ed.md) · [fuente](https://www.lanube.21.edu.ar/modalidad-ed)
- [Educación Distribuida Home](lanube/modalidad-edh.md) · [fuente](https://www.lanube.21.edu.ar/modalidad-edh)
- [Presencial](lanube/modalidad-presencial.md) · [fuente](https://www.lanube.21.edu.ar/modalidad-presencial)
- [MODALIDAD PRESENCIAL HOME | La Nube 21](lanube/modalidad-presencial-home.md) · [fuente](https://www.lanube.21.edu.ar/modalidad-presencial-home)
- [Presencial Distribuida](lanube/presencialidad-distribuida.md) · [fuente](https://www.lanube.21.edu.ar/presencialidad-distribuida)

### Trámites (10)

- [CAE](lanube/cae.md) · [fuente](https://www.lanube.21.edu.ar/cae)
- [Calendario académico](lanube/calendario-academico.md) · [fuente](https://www.lanube.21.edu.ar/calendario-academico)
- [Colaciones 2026](lanube/colaciones-2026.md) · [fuente](https://www.lanube.21.edu.ar/colaciones-2026)
- [Correlativas | La Nube 21](lanube/correlativas.md) · [fuente](https://www.lanube.21.edu.ar/correlativas)
- [EFIP | La Nube 21](lanube/efip.md) · [fuente](https://www.lanube.21.edu.ar/efip)
- [EQUIVALENCIAS | La Nube 21](lanube/equivalencias.md) · [fuente](https://www.lanube.21.edu.ar/equivalencias)
- [OBTENE TU TITULO | La Nube 21](lanube/proceso-de-titulacion.md) · [fuente](https://www.lanube.21.edu.ar/proceso-de-titulacion)
- [CURSADO Seminario Final](lanube/seminariofinal.md) · [fuente](https://www.lanube.21.edu.ar/seminariofinal)
- [SIMULADOR DE CONDICIÓN | La Nube 21](lanube/simulador-de-condicion.md) · [fuente](https://www.lanube.21.edu.ar/simulador-de-condicion)
- [TRABAJOS PRÁCTICOS | La Nube 21](lanube/trabajos-practicos.md) · [fuente](https://www.lanube.21.edu.ar/trabajos-practicos)

### Aranceles y pagos (2)

- [Becas Y Beneficios | La Nube 21](lanube/becas-y-beneficios.md) · [fuente](https://www.lanube.21.edu.ar/becas-y-beneficios)
- [Inscripción a materias](lanube/inscripcion-a-materias.md) · [fuente](https://www.lanube.21.edu.ar/inscripci%C3%B3n-a-materias)

### Plataformas (5)

- [APP SIGLO 21 | La Nube 21](lanube/app-siglo-21.md) · [fuente](https://www.lanube.21.edu.ar/app-siglo-21)
- [Aula Virtual Canvas | La Nube 21](lanube/aula-virtual.md) · [fuente](https://www.lanube.21.edu.ar/aula-virtual)
- [Ebook 21 | La Nube 21](lanube/ebook-21.md) · [fuente](https://www.lanube.21.edu.ar/ebook-21) — *sin texto*
- [Klarway](lanube/klarway.md) · [fuente](https://www.lanube.21.edu.ar/klarway)
- [Portal de Estudiantes | La Nube 21](lanube/portal-de-estudiantes.md) · [fuente](https://www.lanube.21.edu.ar/portal-de-estudiantes)

### Oferta académica (9)

- [Aprendizaje para la Vida (APLV)](lanube/aprendizaje-para-la-vida.md) · [fuente](https://www.lanube.21.edu.ar/aprendizaje-para-la-vida)
- [IDIOMAS | La Nube 21](lanube/idiomas.md) · [fuente](https://www.lanube.21.edu.ar/idiomas)
- [Materias Electivas| La Nube 21](lanube/materias-electivas.md) · [fuente](https://www.lanube.21.edu.ar/materias-electivas)
- [POSGRADO PRESENCIAL | La Nube 21](lanube/posgrado-presencial.md) · [fuente](https://www.lanube.21.edu.ar/posgrado-presencial)
- [POSGRADO VIRTUAL | La Nube 21](lanube/posgrado-virtual.md) · [fuente](https://www.lanube.21.edu.ar/posgrado-virtual)
- [PRÁCTICA PROFESIONAL | La Nube 21](lanube/practica-profesional.md) · [fuente](https://www.lanube.21.edu.ar/practica-profesional)
- [PRÁCTICA SOLIDARIA | La Nube 21](lanube/practica-solidaria.md) · [fuente](https://www.lanube.21.edu.ar/practica-solidaria)
- [Tipos de Materias](lanube/tipos-de-materias.md) · [fuente](https://www.lanube.21.edu.ar/tipos-de-materias)
- [Universitarios 21 | La Nube 21](lanube/universitarios21.md) · [fuente](https://www.lanube.21.edu.ar/universitarios21)

### Atención y derivaciones (5)

- [CANALES DE CONTACTO | La Nube 21](lanube/canales-de-contacto.md) · [fuente](https://www.lanube.21.edu.ar/canales-de-contacto)
- [Directores de Carrera](lanube/encuentros-con-directores.md) · [fuente](https://www.lanube.21.edu.ar/encuentros-con-directores)
- [Gabinete de Bienestar| La Nube 21](lanube/gabinete-de-bienestar-1.md) · [fuente](https://www.lanube.21.edu.ar/gabinete-de-bienestar-1)
- [SOY INGRESANTE | La Nube 21](lanube/teacompanamos.md) · [fuente](https://www.lanube.21.edu.ar/teacompa%C3%B1amos)
- [Tutores Virtuales](lanube/tutoresvirtuales.md) · [fuente](https://www.lanube.21.edu.ar/tutoresvirtuales)

### Institucional (13)

- [Actividades disciplinares](lanube/actividades-disciplinares.md) · [fuente](https://www.lanube.21.edu.ar/actividades-disciplinares)
- [Arte y cultura](lanube/arte-y-cultura.md) · [fuente](https://www.lanube.21.edu.ar/arte-y-cultura)
- [Ayudantias | La Nube 21](lanube/ayudantias.md) · [fuente](https://www.lanube.21.edu.ar/ayudantias)
- [EMPRENDIMIENTO E INNOVACIÓN | La Nube 21](lanube/ce-emprendimiento-innovacion.md) · [fuente](https://www.lanube.21.edu.ar/ce-emprendimiento-innovacion)
- [Comunidad Net| La Nube 21](lanube/comunidad-net.md) · [fuente](https://www.lanube.21.edu.ar/comunidad-net)
- [Desarrollo](lanube/desarrollo-y-proposito.md) · [fuente](https://www.lanube.21.edu.ar/desarrollo-y-prop%C3%B3sito)
- [EGRESADOS | La Nube 21](lanube/egresados.md) · [fuente](https://www.lanube.21.edu.ar/egresados)
- [EMPLEABILIDAD | La Nube 21](lanube/empleabilidad.md) · [fuente](https://www.lanube.21.edu.ar/empleabilidad)
- [INTERNACIONALIZACIÓN | La Nube 21](lanube/internacionalizacion.md) · [fuente](https://www.lanube.21.edu.ar/internacionalizacion)
- [Investigación](lanube/investigacion.md) · [fuente](https://www.lanube.21.edu.ar/investigacion)
- [Salud y Deportes](lanube/salud-y-deportes.md) · [fuente](https://www.lanube.21.edu.ar/salud-y-deportes)
- [SUSTENTABILIDAD SOCIAL | La Nube 21](lanube/sustentabilidad-social.md) · [fuente](https://www.lanube.21.edu.ar/sustentabilidad-social)
- [SOY INGRESANTE | La Nube 21](lanube/tuprimersemestre.md) · [fuente](https://www.lanube.21.edu.ar/tuprimersemestre)
