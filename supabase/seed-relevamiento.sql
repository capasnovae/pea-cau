-- Generado por scripts/importar-relevamiento.mts a partir de relevamiento/. No editar a mano.

-- Contenido público relevado; todo queda en borrador y marcado "A validar".

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 1, $pea0$rg-capitulo-1$pea0$,
        $pea0$Capítulo 1: La universidad$pea0$, $pea0$En el presente capítulo se establece el origen de la Universidad Siglo 21, su misión y valores, quiénes son las autoridades institucionales y sus correspondientes funciones, el establecimiento de l…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-1-sobre-la-universidad el 2026-11-08. Revisalo antes de publicar.

En el presente capítulo se establece el origen de la Universidad Siglo 21, su misión y valores, quiénes son las autoridades institucionales y sus correspondientes funciones, el establecimiento de l…$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 2, $pea0$rg-capitulo-2$pea0$,
        $pea0$Capítulo 2: Condiciones de ingreso y admisión$pea0$, $pea0$En el presente capítulo, se establecen las condiciones de ingreso y admisión para aquellas personas que deciden iniciar su recorrido académico en carreras de Grado, Pregrado y Posgrado en la Univer…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-1-carreras-de-pregrado-y-grado el 2026-11-08. Revisalo antes de publicar.

En el presente capítulo, se establecen las condiciones de ingreso y admisión para aquellas personas que deciden iniciar su recorrido académico en carreras de Grado, Pregrado y Posgrado en la Univer…$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 3, $pea0$rg-capitulo-3$pea0$,
        $pea0$Capítulo 3: Modalidades de cursado$pea0$, $pea0$En el presente capítulo se describen las diferentes modalidades de cursado que ofrece la Universidad para el cursado de su oferta académica. Como así también las reglas para los cambios entre las d…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=3-1-modalidades-de-cursado el 2026-11-08. Revisalo antes de publicar.

En el presente capítulo se describen las diferentes modalidades de cursado que ofrece la Universidad para el cursado de su oferta académica. Como así también las reglas para los cambios entre las d…$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 4, $pea0$rg-capitulo-4$pea0$,
        $pea0$Capítulo 4: Modelo académico - academia 21$pea0$, $pea0$En el presente capítulo se desarrolla el Modelo Académico,modelo institucional que se constituye bajo una mirada formativa integral con un enfoque pedagógico que sienta sus bases en dos pilares fun…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-1-estructura-academica el 2026-11-08. Revisalo antes de publicar.

En el presente capítulo se desarrolla el Modelo Académico,modelo institucional que se constituye bajo una mirada formativa integral con un enfoque pedagógico que sienta sus bases en dos pilares fun…$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 5, $pea0$rg-capitulo-5$pea0$,
        $pea0$Capítulo 5: Inscripción al cursado$pea0$, $pea0$La organización del año académico se define anualmente de acuerdo a los Calendarios Académicos de cada Modalidad de Estudio; es decir los documentos que señalan hitos importantes de cursado, desde…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-1-calendario-academico el 2026-11-08. Revisalo antes de publicar.

La organización del año académico se define anualmente de acuerdo a los Calendarios Académicos de cada Modalidad de Estudio; es decir los documentos que señalan hitos importantes de cursado, desde…$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 6, $pea0$rg-capitulo-6$pea0$,
        $pea0$Capítulo 6: Equivalencias, pasantías, ayudantías y créditos$pea0$, $pea0$En el presente capítulo se establecen las consideraciones generales para la solicitud de reconocimientos de materias cursadas en la Universidad, como así también en otras instituciones educativas.…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=6-1-sistema-de-equivalencias-para-todas-las-modalidades el 2026-11-08. Revisalo antes de publicar.

En el presente capítulo se establecen las consideraciones generales para la solicitud de reconocimientos de materias cursadas en la Universidad, como así también en otras instituciones educativas.…$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 7, $pea0$rg-capitulo-7$pea0$,
        $pea0$Capítulo 7: Pasantías$pea0$, $pea0$En el presente capítulo se aborda el régimen de pasantías vigente en la Universidad.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=7-1-regimen-de-pasantias el 2026-11-08. Revisalo antes de publicar.

En el presente capítulo se aborda el régimen de pasantías vigente en la Universidad.$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 8, $pea0$rg-capitulo-8$pea0$,
        $pea0$Capítulo 8: Centros de excelencia$pea0$, $pea0$En el presente capítulo se abordan los centros de excelencia de la Universidad, como así también los certificados en competencias que cada estudiante puede alcanzar con el cursado de su carrera de…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-1-centros-de-excelencia el 2026-11-08. Revisalo antes de publicar.

En el presente capítulo se abordan los centros de excelencia de la Universidad, como así también los certificados en competencias que cada estudiante puede alcanzar con el cursado de su carrera de…$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 9, $pea0$rg-capitulo-9$pea0$,
        $pea0$Capítulo 9: Sistema de ayudantía de alumnos y adscripción$pea0$, $pea0$En el presente capítulo se aborda el Sistema de Ayudantías que los estudiantes pueden realizar para complementar el cursado de su carrera, como así también el de adscripción una vez que hayan final…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=9-1-sistema-de-ayundatia-de-alumnos-y-adscripcion el 2026-11-08. Revisalo antes de publicar.

En el presente capítulo se aborda el Sistema de Ayudantías que los estudiantes pueden realizar para complementar el cursado de su carrera, como así también el de adscripción una vez que hayan final…$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 10, $pea0$rg-capitulo-10$pea0$,
        $pea0$Capítulo 10: Investigación$pea0$, $pea0$En el presente capítulo se establecen el desarrollo de la labor de investigación en el ámbito Académico como una apuesta de mejora continua de la calidad educativa de la comunidad.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=10-1-consideraciones-generales el 2026-11-08. Revisalo antes de publicar.

En el presente capítulo se establecen el desarrollo de la labor de investigación en el ámbito Académico como una apuesta de mejora continua de la calidad educativa de la comunidad.$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 11, $pea0$rg-capitulo-11$pea0$,
        $pea0$Capítulo 11: Posgrado$pea0$, $pea0$En el presente capítulo se establecen las consideraciones generales para el cursado de posgrados: requisitos de admisión, documentación de ingreso, readmisión de estudiantes y readmisión de estudia…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-1-consideraciones-generales el 2026-11-08. Revisalo antes de publicar.

En el presente capítulo se establecen las consideraciones generales para el cursado de posgrados: requisitos de admisión, documentación de ingreso, readmisión de estudiantes y readmisión de estudia…$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 12, $pea0$rg-capitulo-12$pea0$,
        $pea0$Capítulo 12: Graduación$pea0$, $pea0$En el presente capítulo se establecen las consideraciones generales para la graduación de carreras de pregrado, grado y posgrado.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-1-condiciones-para-la-graduacion el 2026-11-08. Revisalo antes de publicar.

En el presente capítulo se establecen las consideraciones generales para la graduación de carreras de pregrado, grado y posgrado.$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 13, $pea0$rg-capitulo-13$pea0$,
        $pea0$Capítulo 13: Régimen disciplinario$pea0$, $pea0$La Universidad Siglo 21 espera de toda su comunidad educativa un gran compromiso para el desarrollo de una sociedad más justa y equitativa, velando por una formación profesional integra, basada en…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=13-1-regimen-general-de-sanciones el 2026-11-08. Revisalo antes de publicar.

La Universidad Siglo 21 espera de toda su comunidad educativa un gran compromiso para el desarrollo de una sociedad más justa y equitativa, velando por una formación profesional integra, basada en…$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), null, 14, $pea0$rg-capitulo-14$pea0$,
        $pea0$Capítulo 14: Gestiones administrativas$pea0$, $pea0$En el presente capítulo se establecen las gestiones administrativas de la Universidad, la política de$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-1-planes-de-estudio el 2026-11-08. Revisalo antes de publicar.

En el presente capítulo se establecen las gestiones administrativas de la Universidad, la política de$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-1$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-1-1-sobre-la-universidad$pea0$,
        $pea0$Sobre la Universidad$pea0$, $pea0$La Universidad Siglo 21 es una institución sin fines de lucro, autorizada a funcionar mediante el Decreto de la Presidencia de la Nación N.° 90/95.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-1-sobre-la-universidad el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 1 | LA UNIVERSIDAD

En el presente capítulo se establece el origen de la Universidad Siglo 21, su misión y valores, quiénes son las autoridades institucionales y sus correspondientes funciones, el establecimiento de la firma digital y la constitución del domicilio legal de la Universidad.

### 1.1 SOBRE LA UNIVERSIDAD

La Universidad Siglo 21 es una institución sin fines de lucro, autorizada a funcionar mediante el Decreto de la Presidencia de la Nación N.° 90/95.

Decreto del Poder Ejecutivo Nacional N.° 1598

La Universidad se constituyó así en la primera universidad privada de la provincia de Córdoba y la sexta del país en obtener esta categoría desde la implementación del sistema de evaluación en 1996.

La gestión académica y la conducción de las carreras y programas se encuentran a cargo de áreas especializadas, organizadas según la disciplina o la formación en gestión educativa.

Por su parte, la gestión administrativa adopta un modelo de organización único, en el cual cada sector presta servicios a las distintas modalidades de estudio, que comprenden pregrado, grado y posgrado.

1$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-1-sobre-la-universidad$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-1$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 2, $pea0$rg-1-2-mision-y-valores$pea0$,
        $pea0$Misión y valores$pea0$, $pea0$La Universidad Siglo 21 admite estudiantes sin distinción de raza, color, sexo, orientación sexual, religión, nacionalidad, ideología, capacidad física, edad o situación económica, y no admite ning…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-2-mision-y-valores el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 1 | LA UNIVERSIDAD

### 1.2 MISIÓN Y VALORES

La Universidad Siglo 21 admite estudiantes sin distinción de raza, color, sexo, orientación sexual, religión, nacionalidad, ideología, capacidad física, edad o situación económica, y no admite ninguna forma de discriminación.

La única selección que la Universidad considera justificada es aquella que permite elegir a los mejores aspirantes sobre la base de méritos académicos y actitudes morales, y, con los mismos criterios, a los mejores docentes e investigadores.

De acuerdo con su Estatuto, la finalidad esencial y específica de la Universidad Siglo 21 es:

- Proporcionar formación científica, profesional, humanística y técnica en el más alto nivel.
- La investigación científica y el desarrollo del conocimiento humano, las artes y las ciencias teniendo como objetivo el perfeccionamiento humano integral.
- La extensión hacia la comunidad donde se desenvuelve, contribuyendo como actor social a mejorar permanentemente las condiciones de vida de la sociedad, extendiéndose a todo el territorio argentino.
- Contribuir a la preservación de la cultura nacional y al desarrollo de las actitudes y valores que requiere la formación de individuos responsables, con conciencia ética y solidaria, reflexiva, crítica, capaces de comprometer lo mejor de sí en mejorar la calidad de vida, afianzar el respeto al medio ambiente, a las instituciones republicanas y a la vigencia del orden democrático.
- Propender al mejoramiento permanente de la calidad en la educación, en la investigación y en la extensión, autoevaluando y sometiendo a evaluación externa todas las instancias institucionales.

#### MISIÓN

Formar líderes emprendedores que contribuyan a aumentar la eficiencia y competitividad de las organizaciones públicas y privadas donde se desempeñen. Líderes capaces de asumir posiciones de responsabilidad en la creación y distribución de la riqueza, con la aspiración última de que la región sea cada vez más desarrollada, ética, solidaria y equitativa.

Desarrollar alternativas para lograr un acceso masivo a la educación superior, manteniendo elevados niveles de excelencia.

Resolver, a través de institutos, programas y proyectos de investigación los problemas que la región le demande a la Universidad.

#### VALORES

- LAICA  La Universidad Siglo 21 es no confesional, admite estudiantes de todo tipo de creencia religiosa.
- DEMOCRÁTICA  La Universidad Siglo 21 concibe al sistema democrático de gobierno en la sociedad como el más adecuado al desarrollo de los pueblos y al resguardo de las libertades individuales y los derechos humanos. En tal convicción, no admite en sus aulas ni en su personal ideologías fundamentalistas o terroristas que atenten contra el orden institucional mediante métodos antidemocráticos.
- TRASCENDENTE  La Universidad Siglo 21 concibe su misión independiente de la coyuntura o de la realidad circunstancial del presente. Proyecta su función en el largo plazo trascendiendo los límites generacionales de sus fundadores y de sus autoridades ocasionales.

1$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-2-mision-y-valores$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-1$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 3, $pea0$rg-1-3-autoridades-y-funciones$pea0$,
        $pea0$Autoridades y funciones$pea0$, $pea0$Universidad Siglo 21 consolida equipos de profesionales preparados que tienen como función llevar adelante la gestión y organización como casa de altos estudios. Los mismos son:$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-3-autoridades-y-funciones el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 1 | LA UNIVERSIDAD

### 1.3 AUTORIDADES Y FUNCIONES

Universidad Siglo 21 consolida equipos de profesionales preparados que tienen como función llevar adelante la gestión y organización como casa de altos estudios. Los mismos son:

- Consejo Superior Universitario: Tiene la función de la definición de políticas académicas y de investigación y el control dentro de su ámbito de competencia. Es presidido por el Rectorado, o en su defecto, por los Vicerrectorados.  Está integrado por el/la Rector/a, Vicerrectores/as, Secretarios/as, Directores de Carrera y dos delegados/as designados/as por el Consejo de Administración.
- Rectorado
- Secretarías dependientes del Rectorado
- Vicerrectorados
- Secretarías dependientes de Vicerrectorados.
- Consejo Honorario Académico (CHA): asesora al Consejo Superior Universitario respecto al aseguramiento de los más altos estándares en la enseñanza, becas, investigación y la protección de la libertad académica de la Universidad.  Integrado por académicos de vasta formación y trayectoria, sesiona una vez al año.
- Consejo de Directores de Carrera: integrado por los Directores de todas las carreras de pregrado, grado y posgrado de la Universidad. Bajo la coordinación del Vicerrectorado de Asuntos Académico, analiza todas aquellas cuestiones y  problemas que resultan comunes a sus funciones, proponiendo las soluciones necesarias.

La estructura de la Universidad se encuentra establecida en el estatuto y pueden consultarse las autoridades vigentes en el sitio web institucional.

1$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-3-autoridades-y-funciones$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-1$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 4, $pea0$rg-1-4-domicilio-legal$pea0$,
        $pea0$Domicilio legal$pea0$, $pea0$La Universidad Siglo 21 fija su domicilio legal para la recepción de notificaciones fehacientes en: CALLE DE LOS LATINOS N°8555, Bº LOS BOULEVARES, CP. 5008, CÓRDOBA, ARGENTINA.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-4-domicilio-legal el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 1 | LA UNIVERSIDAD

### 1.4 DOMICILIO LEGAL

La Universidad Siglo 21 fija su domicilio legal para la recepción de notificaciones fehacientes en: **CALLE DE LOS LATINOS N°8555, Bº LOS BOULEVARES, CP. 5008, CÓRDOBA, ARGENTINA.**

1$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-4-domicilio-legal$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-1$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 5, $pea0$rg-1-5-modificaciones-al-reglamento$pea0$,
        $pea0$Modificaciones al reglamento$pea0$, $pea0$El Reglamento Institucional de la Universidad Siglo 21 se aprueba anualmente por Resolución de Consejo Superior.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-5-modificaciones-al-reglamento el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 1 | LA UNIVERSIDAD

### 1.5 MODIFICACIONES AL REGLAMENTO

El Reglamento Institucional de la Universidad Siglo 21 se aprueba anualmente por Resolución de Consejo Superior.

Constituye un cuerpo normativo indispensable para regular los distintos trámites y actividades de la Institución, facilitando a los operadores criterios seguros de administración y a los estudiantes una garantía de sus derechos y
 obligaciones.

Está compuesto por normas generales y particulares y se complementa con las Resoluciones de Consejo Superior y Resoluciones Rectorales vigentes, que rigen la vida institucional de la Universidad.

La Universidad se reserva el derecho de realizar cambios operativos sobre lo reglamentado en sus diferentes normas, si ello implica un mejoramiento en el proceso académico de las personas inscriptas, como así también la modificación de
 fechas de comienzos en los procesos que se inician con los períodos académicos, informando los mismos a través de los medios habituales de comunicación vigentes.

1$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-5-modificaciones-al-reglamento$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-1$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 6, $pea0$rg-1-6-firma-digital$pea0$,
        $pea0$Firma digital$pea0$, $pea0$Mediante Resolución del Consejo Superior N° 494/2016 y Resolución del Consejo Superior Nº 716/2019 la Universidad Siglo 21 ha adoptado el uso de Firma digital para todos los documentos de uso inter…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-6-firma-digital el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 1 | LA UNIVERSIDAD

### 1.6 FIRMA DIGITAL

Mediante [Resolución del Consejo Superior N° 494/2016](https://contenidos.21.edu.ar/microsites/reglamento/assets/pdf/res.c.s.n494.16.firma-digital.pdf) y [Resolución del Consejo Superior Nº 716/2019](https://contenidos.21.edu.ar/microsites/reglamento/assets/pdf/rcs-716-2019-01072020124131.pdf) la Universidad Siglo 21 ha adoptado el uso de Firma digital para todos los documentos de uso interno y externo que sean susceptibles de emitirse digitalmente, bajo el marco de la Ley Nacional N° 25506 del año 2001 sus decretos reglamentarios emitidos por el Poder Ejecutivo Nacional N° 2628/2002 y N° 724/2006 y las Decisiones Administrativas 5/2007 y 927/2014.

Aquella documentación que sea emitida por la Universidad con Firma Digital podrá ser compartida por la persona interesada tantas veces como lo necesite, con las entidades que se la requieran, pero siempre a través de medios digitales. En caso de imprimirse, el documento emitido con Firma digital pierde su validez como "original".

Quienes reciban documentación con Firma digital de las autoridades de Universidad Siglo 21 podrán verificar la validez de las firmas en el siguiente link: [http://validar.encodesa.com.ar/](http://validar.encodesa.com.ar/)

1$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=1-6-firma-digital$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-10$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-10-1-consideraciones-generales$pea0$,
        $pea0$Consideraciones generales$pea0$, $pea0$Las actividades de investigación se encuentran reguladas por el protocolo marco para el desarrollo de la investigación, aprobado mediante Resolución del Consejo Superior N° 936/2021 y 961/2021.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=10-1-consideraciones-generales el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 10 | INVESTIGACIÓN

En el presente capítulo se establecen el desarrollo de la labor de investigación en el ámbito Académico como una apuesta de mejora continua de la calidad educativa de la comunidad.

### 10.1 CONSIDERACIONES GENERALES

Las actividades de investigación se encuentran reguladas por el protocolo marco para el desarrollo de la investigación, aprobado mediante Resolución del Consejo Superior N° [936/2021](https://contenidos.21.edu.ar/microsites/reglamento/assets/pdf/rcs-936-protocolo-marco-para-el-desarrollo-de-la-investigacion-resolucion.pdf) y [961/2021](https://contenidos.21.edu.ar/microsites/reglamento/assets/pdf/rcs-96121-adenda-protocolo-de-investigacion-resolucion-2.pdf).

La investigación en Universidad Siglo 21 se lleva adelante en el marco de la Secretaría de Investigación, que tiene como objetivos:

- Generación de Conocimiento. No es posible cumplir con la misión de la Universidad y sus más altos objetivos organizacionales, si sus recursos humanos dedicados a las labores de docencia, no se vinculan con actividades de investigación. La producción de conocimiento y la comunicación y divulgación deben ser aprovechadas para incentivar espacios de aprendizaje basados en problemas, diagnósticos y propuestas, que potencialmente puedan incidir en la dinámica socio-económica del país y la región.
- Comunicación y Divulgación Científica. Divulgar a la comunidad universitaria y al público en general, el conocimiento científico producto de los proyectos de investigación promovidos y avalados por la Secretaría de Investigación y Transferencia Científica, mediante la planificación y ejecución de eventos científicos, el mantenimiento y actualización de recursos para la investigación y las publicaciones científicas propiamente dichas.
- Promoción y Desarrollo Científico. Acorde con el Sistema Nacional de Innovación, orientamos acciones tendientes a materializar la articulación y el fortalecimiento de lazos con diferentes organizaciones del sector científico y productivo, lo que favorece la posibilidad de potenciar la asociatividad de los grupos de investigación y la generación de consorcios cofinanciados.

10$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=10-1-consideraciones-generales$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-10$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 2, $pea0$rg-10-2-proyectos-de-investigacion$pea0$,
        $pea0$Proyectos de investigación$pea0$, $pea0$La Secretaría de Investigación y Transferencia Científica de la Universidad, llamará anualmente a concurso para la incorporación de nuevos proyectos de investigación, de conformidad con las líneas…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=10-2-proyectos-de-investigacion el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 10 | INVESTIGACIÓN

### 10.2 PROYECTOS DE INVESTIGACIÓN

La Secretaría de Investigación y Transferencia Científica de la Universidad, llamará anualmente a concurso para la incorporación de nuevos proyectos de investigación, de conformidad con las líneas estratégicas propuestas por los comités de expertos, aprobadas por la Secretaría General

Académica y de Desarrollo. En este proceso, se incentivará la participación de docentes, alumnos y egresados de la Universidad, de todas las carreras, sedes y modalidades.

Existe un llamado anual para presentar nuevos proyectos, con bases y condiciones preestablecidas que la Secretaría de Investigación dará a conocer en cada convocatoria. El proyecto presentado pasará por un tribunal evaluador el cual podrá admitir o desestimar el proyecto.

Una vez que el proyecto es admitido y aprobado deberá presentar de manera periódica los requerimientos y reportes evolutivos del mismo, de acuerdo al arbitraje dispuesto por la Secretaría de Investigación.

La Universidad se reserva las definiciones de los ejes temáticos de diversas áreas del saber, considerados estratégicos.

Se establecen cinco categorías de proyectos de investigación:

- **Proyectos Tipo I**  Son financiados por la universidad con monto anual, asignado mensualmente al director del proyecto de investigación, quien será responsable de ejecutar el presupuesto previsto. Este tipo de proyecto demanda una dedicación semanal de diez (10) horas por parte del equipo, pudiendo cumplir con sus tareas fuera de la Universidad. Tienen una duración de un año con posibilidad de ser renovados, en virtud de la evaluación favorable del informe anual de investigación elaborado por la Comisión de Evaluación.
- **Proyectos Tipo II**  Destinados a investigadores en formación. Estos proyectos, aunque cuentan con el aval institucional, no reciben financiamiento para su desarrollo. No obstante, la Universidad brinda apoyo económico por un monto fijo anual, destinado a la adquisición de productos o servicios requerido para el desarrollo del proyecto de investigación o la divulgación de los resultados. Requieren de una dedicación semanal de cinco (05) horas por parte del equipo, pudiendo cumplir con sus tareas fuera de la Universidad, según previo acuerdo con la Dirección de Investigación. Como en el caso de los proyectos Tipo I, tienen una duración de un año con posibilidad a ser renovados, en virtud de la evaluación favorable del informe anual de investigación elaborado por la Comisión de Evaluación.
- **Proyectos Internacionales.**  Destinado a proyectos y/o equipos de investigación consolidados. Incluyen la participación, sin excepción, de un docente/investigador de una universidad extranjera, con formación académica acorde a la línea de investigación que se propone. Los proyectos internacionales son financiados por la Universidad con un monto fijo anual, destinado a promover el intercambio entre investigadores. Exigen una dedicación de veinte (20) horas semanales, pudiendo cumplir con sus tareas fuera de la universidad, según previo acuerdo con la Dirección de Investigación. Tendrán un año de duración.
- **Proyectos Interinstitucionales**.  Destinados a proyectos y/o equipos de investigación consolidados. Incluyen la participación de al menos un docente perteneciente a la Universidad Siglo 21, quien presenta el proyecto. Son financiados por la universidad con monto anual asignado al director del proyecto de investigación, responsable de ejecutar el presupuesto previsto.
- **Proyectos Part Time**.  La financiación es al investigador part time responsable. Se financia con un monto anual, asignado mensualmente al director del proyecto de investigación. Este tipo de proyecto demanda una dedicación semanal de 20 horas por parte del equipo, pudiendo cumplir con sus tareas fuera de la Universidad, según previo acuerdo con la Dirección de Investigación.

10$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=10-2-proyectos-de-investigacion$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-11$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-11-1-consideraciones-generales$pea0$,
        $pea0$Consideraciones generales$pea0$, $pea0$Cada programa cuenta con un Reglamento especial a cada carrera, será aplicable subsidiariamente el presente reglamento.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-1-consideraciones-generales el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 11 | POSGRADO

En el presente capítulo se establecen las consideraciones generales para el cursado de posgrados: requisitos de admisión, documentación de ingreso, readmisión de estudiantes y readmisión de estudiantes.

### 11.1 CONSIDERACIONES GENERALES

Cada programa cuenta con un Reglamento especial a cada carrera, será aplicable subsidiariamente el presente reglamento.

11$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-1-consideraciones-generales$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-11$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 2, $pea0$rg-11-2-requisitos-de-admision$pea0$,
        $pea0$Requisitos de admisión$pea0$, $pea0$Las admisiones de cada estudiante en cada programa están sujetos al cumplimiento de cada programa.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-2-requisitos-de-admision el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 11 | POSGRADO

### 11.2 REQUISITOS DE ADMISIÓN

Las admisiones de cada estudiante en cada programa están sujetos al cumplimiento de cada programa.

Sin perjuicio de los requisitos establecidos en cada reglamento en particular, será necesario como requisito mínimo para la admisión de la persona aspirante. [Ver 2.2. CARRERAS DE POSGRADO](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-2-carreas-de-posgrado).

11$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-2-requisitos-de-admision$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-11$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 3, $pea0$rg-11-3-condiciones-de-cursado$pea0$,
        $pea0$Condiciones de cursado$pea0$, $pea0$Para quienes se encuentren cursando un posgrado bajo la Modalidad Presencial, deberán cumplimentar con un 75% de asistencia obligatoria.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-3-condiciones-de-cursado el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 11 | POSGRADO

### 11.3 CONDICIONES DE CURSADO

Para quienes se encuentren cursando un posgrado bajo la Modalidad Presencial, deberán cumplimentar con un 75% de asistencia obligatoria.

11$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-3-condiciones-de-cursado$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-11$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 4, $pea0$rg-11-4-condiciones-de-aprobacion-de-materias$pea0$,
        $pea0$Condiciones de aprobación de materias$pea0$, $pea0$El cursado de las materias programáticas implica las siguientes actividades académicas:$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-4-condiciones-de-aprobacion-de-materias el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 11 | POSGRADO

### 11.4 CONDICIONES DE APROBACIÓN DE MATERIAS

#### A) MATERIAS PROGRAMÁTICAS

El cursado de las materias programáticas implica las siguientes actividades académicas:

- **Actividad Práctica 1 y 2 (AP1 y AP2)**: Individual. Puede presentarse en dos intentos dentro de la fecha de entrega estipulada. Se aprueba con nota 4 (cuatro) o más. Se conserva la nota más alta obtenida.
- **Actividad Práctica 3 (AP3)**: Trabajo grupal. Puede presentarse en un único intento dentro de la fecha de entrega estipulada. Se aprueba con nota 4 (cuatro) o más. No posee instancia de recuperatorio
- **Actividad Práctica 4 (AP4)**: Trabajo grupal. Puede presentarse en un único intento dentro de la fecha de entrega estipulada. Se aprueba con nota 4 (cuatro) o más. Posee una instancia de recuperatorio según calendario académico.

Quienes se encuentren inscriptos a cursar materias programáticas, para aprobar la materia deberán:

- Aprobar la Actividad Práctica Nº 4 con una nota igual o mayor a 4 (cuatro).
- Obtener un promedio de las notas correspondientes a las AP1, AP2, AP3 y AP4 igual o mayor a 4 (cuatro).
- Cumplimentar con el 75% de asistencia, siempre que la modalidad de cursado así lo establezca.

#### B) MATERIAS DE PROCESO

El cursado de las materias de proceso implica las siguientes actividades académicas:

- **Actividad Práctica 1 (AP1)**: Actividad a desarrollar, individual. Se aprueba con nota 4 (cuatro) o más. No cuenta con opción de recuperatorio.
- **Actividad Práctica 2 (AP2)**: Actividad a desarrollar continuidad de la AP 1, individual. Se aprueba con nota 4 (cuatro) o más. No cuenta con opción de recuperatorio.
- **Actividad Práctica 3 (AP3)**: Actividad a desarrollar continuidad de la AP 2, individual. Se aprueba con nota 4 (cuatro) o más. No cuenta con opción de recuperatorio.
- **Actividad Práctica 4 (AP4)**: Actividad a desarrollar continuidad de la AP 1, 2 y 3, individual. Se aprueba con nota 4 (cuatro) o más. Posee una instancia de recuperatorio según calendario académico.

Quienes se encuentren inscriptos a cursar materias de procesos, para aprobar la materia deberán:

- Aprobar la Actividad Práctica 4 con una nota igual o mayor a 4 (cuatro).
- Obtener un promedio de las notas obtenidas en las AP1, AP2, AP3 y AP4 igual o mayor a 4 (cuatro).
- Cumplimentar con el 75% de asistencia, siempre que la modalidad de cursado así lo establezca.

11$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-4-condiciones-de-aprobacion-de-materias$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-11$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 5, $pea0$rg-11-5-escala-de-notas$pea0$,
        $pea0$Escala de notas$pea0$, $pea0$La conversión de notas utilizada para trasladar los puntos que se obtienen en las Actividades Prácticas, a una nota para el acta que forma parte de su analítico e historial académico se guiara conf…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-5-escala-de-notas el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 11 | POSGRADO

### 11.5 ESCALA DE NOTAS

La conversión de notas utilizada para trasladar los puntos que se obtienen en las Actividades Prácticas, a una nota para el acta que forma parte de su analítico e historial académico se guiara conforme a lo establecido en la siguiente tabla:

| EXAMEN ► | TRABAJO PRÁCTICO |
| --- | --- |
| NOTA ▼ | ▼ |
| 10 | 95 a 100% |
| 9 | 90 a 94% |
| 8 | 81 a 89% |
| 7 | 76 a 80% |
| 6 | 70 a 75% |
| 5 | 60 a 69% |
| 4 | 50 a 59% |
| 3 | 30 a 49% |
| 2 | 20 a 29% |
| 1 | 0 a 19% |

11$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-5-escala-de-notas$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-11$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 6, $pea0$rg-11-6-readmision-de-estudiantes$pea0$,
        $pea0$Readmisión de estudiantes$pea0$, $pea0$Quienes se encuentren inscriptos en un posgrado, y por cualquiera circunstancia no concluyeren sus estudios y deseen retomarlos con la finalidad de concluirlos, podrán ser readmitidos a la carrera…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-6-readmision-de-estudiantes el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 11 | POSGRADO

### 11.6 READMISIÓN DE ESTUDIANTES

Quienes se encuentren inscriptos en un posgrado, y por cualquiera circunstancia no concluyeren sus estudios y deseen retomarlos con la finalidad de concluirlos, podrán ser readmitidos a la carrera aquellos estudiantes que habiendo cursado de manera incompleta las materias correspondientes al plan de estudio de una carrera de Posgrado en la Universidad Siglo 21, adeuden materias y/o sólo el Trabajo Final Integrador y se les haya vencido el plazo de prórroga que prevé el Reglamento del Posgrado que pretenden culminar.

Deberán:

- Presentar CV actualizado y carta dirigida a la Dirección del Posgrado solicitando la readmisión a la carrera.
- Cumplimentar las instancias que a criterio de experto defina el Director de la Carrera para ser readmitido.
- Abonar el importe correspondiente a la matriculación y aranceles en las fechas indicadas a tal efecto.
- Cursar y aprobar las materias que adeude del plan de estudio vigente en el que es readmitido y el Taller de Trabajo Final (o la que en un futuro la reemplace).
- Realizar y presentar el Trabajo Final Integrador en el término máximo de 12 meses a partir de la fecha de readmisión.

Plazo de readmisión:

Especializaciones: 1 año desde la aprobación del pedido de readmisión

Maestrías: 2 años desde la aprobación del pedido de readmisión

11$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=11-6-readmision-de-estudiantes$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-12$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-12-1-condiciones-para-la-graduacion$pea0$,
        $pea0$Condiciones para la graduación$pea0$, $pea0$En la Universidad Siglo 21 es requisito, para el egreso en todas las carreras, el cumplimentar con un proceso general e integral de evaluación. Esta instancia le permite al estudiante demostrar las…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-1-condiciones-para-la-graduacion el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 12 | GRADUACIÓN

En el presente capítulo se establecen las consideraciones generales para la graduación de carreras de pregrado, grado y posgrado.

### 12.1 CONDICIONES PARA LA GRADUACIÓN

En la Universidad Siglo 21 es requisito, para el egreso en todas las carreras, el cumplimentar con un proceso general e integral de evaluación. Esta instancia le permite al estudiante demostrar las competencias institucionales y específicas adquiridas y competencias desarrolladas durante sus estudios.

- En carreras de pregrado esta instancia se lleva adelante en la asignatura “Integración Profesional-Estudio del Caso”.
- En carreras de grado, el alumno debe presentar y aprobar en una instancia de Defensa Oral un “Trabajo Final de Graduación” (TFG).
- En programas de posgrado, deberá aprobar un Trabajo Final en el caso de las Especializaciones o Maestrías Profesionales o una Tesis en el caso de las Maestrías Académicas, conforme la normativa vigente para cada posgrado.

**En todas las instancias, las referencias bibliográficas deben ser citadas bajo los criterios metodológicos de las Normas A.P.A. La omisión de dicha prescripción se considera una falta pasible de sanción, conforme el régimen disciplinario vigente para las situaciones de Plagio.**

Para quienes cursen carreras de grado, deberán aprobar su TFG en un plazo máximo de 18 (dieciocho) meses contados a partir de la obtención de la regularidad del "Seminario Final". Transcurrido este plazo sin que el alumno haya egresado, aprobando su TFG, adquiere la condición de LIBRE en la materia Seminario Final, debiendo recursar la materia para elaborar un nuevo TFG.

Para las carreras de posgrado, se aplican los criterios de evaluación establecidos en el Reglamento de cada programa.

12$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-1-condiciones-para-la-graduacion$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-12$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 2, $pea0$rg-12-2-trabajo-final-de-graduacion$pea0$,
        $pea0$Trabajo final de graduación$pea0$, $pea0$Quienes deseen obtener su título de grado, independientemente de la modalidad de estudio, deben cumplimentar un proceso general e integral de evaluación, denominado “Trabajo Final de Graduación” (T…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-2-trabajo-final-de-graduacion el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 12 | GRADUACIÓN

### 12.212.2. TRABAJO FINAL DE GRADUACIÓN (TFG)

#### A) LINEAMIENTOS GENERALES

Quienes deseen obtener su **título de grado**, independientemente de la modalidad de estudio, deben cumplimentar un proceso general e integral de evaluación, denominado “Trabajo Final de Graduación” (TFG).

Se espera que, en su TFG, el estudiante integre y aplique los conocimientos adquiridos durante sus estudios y que demuestre el nivel de criterio profesional que ha conseguido desarrollar.

El TFG debe ser desarrollado por el alumno en forma individual para poner de manifiesto su capacidad para desarrollar proyectos profesionales o bien para crear conocimiento; de acuerdo a la tipología de trabajo seleccionada y la metodología elegida **.**

#### B) ETAPAS DEL TRABAJO FINAL DE GRADUACIÓN

El proceso integral de evaluación del TFG se estructura en 3 (tres) etapas:

- **ETAPA 1: Seminario Final**  Quienes cursan la materia “Seminario Final de Grado”. Esta materia forma parte de la currícula de todas las carreras y se cursa en el último semestre. La finalidad de esta etapa es que cada estudiante diseñe y desarrolle su TFG bajo el asesoramiento del profesor/tutor a cargo de la materia.
- **ETAPA 2: Comisión Académica Evaluadora**   Quienes han regularizado la materia Seminario Final de Grado, se le asigna una CAE (Comisión Académica Evaluadora), conformada por profesores expertos del banco de evaluadores de TFG. Esta comisión tendrá por función evaluar el TFG pudiendo:    Realizar recomendaciones de mejora  Solicitar ajustes y modificaciones  Desaprobar el TFG    En el caso de que la CAE haya solicitado ajustes y modificaciones, deberá presentar su TFG con las indicaciones solicitadas por la CAE en el tiempo estipulado para ello. Si se incumpliera o no satisficiera los ajustes solicitados la CAE podrá reprobar el TFG, quedando la materia Seminario Final en condición de LIBRE, debiendo recursar la materia para elaborar un nuevo TFG.  En caso de que se cumplimentaran de manera satisfactoria las recomendaciones de la CAE será reconfirmada su condición de regularidad del SF y quedará habilitado para Defensa Oral
- **ETAPA 3: Defensa Oral**   Superada la etapa anterior, es habilitado a “defensa oral”, instancia en la que se debe exponer verbalmente su producción escrita frente al tribunal evaluador.

#### C) SEMINARIO FINAL

#### ASPECTOS GENERALES PARA TODAS LAS MODALIDADES

#### Objetivos y Metodología

Los objetivos generales de la materia son:

- Fomentar la visión global e integradora.
- Estimular la capacidad de resolución.
- Generar ideas, propuestas, productos y/o proyectos desde una perspectiva integral y herramientas teóricas y metodológicas, tanto en el campo de aplicación como de la investigación.

Este seminario busca generar las competencias profesionales claves, como son la visión estratégica, la autogestión y la comunicación. Durante el cursado se trabajan las siguientes competencias institucionales:

- Innovación y creatividad en las propuestas de aplicación: para eso cada estudiante debe conocer el panorama actual de la profesión, acciones, métodos, etc.
- Investigación: teoría de la disciplina y casuística, de modo que pueda elaborarse una propuesta innovadora basada en paradigmas.
- Comunicación Escrita (redacción del texto y presentación de informe según el tipo del trabajo final de grado) y Oral.

En el marco de cada carrera, se le presentan a cada estudiante las opciones de tipos de producciones como así también las líneas temáticas estratégicas para el desarrollo de su trabajo final de grado, dentro de las cuales podrá realizar su elección. Para cada tipo de producción la materia presenta contenido y objetos de aprendizaje colaborativos, específicos para cada tipo de producción, para que desarrolle de forma progresiva su TFG.

Las líneas temáticas y los tipos de producción disponibles para cada carrera estarán definidas de acuerdo a las competencias que los alumnos desarrollan a lo largo del cursado, de manera tal que cada estudiante pueda desarrollar su TFG de forma satisfactoria poniendo en práctica dichas competencias.

Respecto al desarrollo de la misma, se trabaja de manera operativa y sistematizada, volcando en rúbricas los resultados del proceso y con los instrumentos adecuados para el seguimiento de tareas que permiten cumplir con los objetivos propuestos para cada entrega.

- **ASPECTOS PARTICULARES DE LA MODALIDAD PRESENCIAL (Presencial, Presencial Home y Presencial Distribuida)**  **Condiciones de Cursado y Evaluación**    Para quienes se encuentran cursando en la Modalidad Presencial (en todas de sus submodalidades) cursan el Seminario Final complementando presencialidad y virtualidad (a través de la Plataforma Multimedia).  Se requiere el 75% de asistencia a clases.  Se regulariza con entregas parciales de acuerdo al cronograma previsto por cada docente de Seminario Final (SF) y con la entrega total al finalizar el cursado. En caso de no cumplir con los plazos preestablecidos, el alumno no alcanza la regularidad, debiendo reinscribirse a la misma. SIN EXCEPCIÓN: no hay prórrogas. ([Ver Condiciones de Aprobación materia de Procesos 3.5.11.](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21#cap4-5-11))
- **ASPECTOS PARTICULARES DE LA MODALIDAD DISTANCIA (ED y EDH)**  **Condiciones de Cursado y Evaluación**    Cursarán la materia Seminario Final de su carrera, a través de los medios dispuestos por la Universidad a tal fin.  Se regulariza cumplimentando las consignas de entrega de avance del trabajo administradas por el Profesor/Tutor a cargo de la materia, conforme lo establecido en las condiciones de aprobación de acuerdo a la Modalidad Distancia. En caso de no cumplir con los plazos preestablecidos, el alumno no alcanza la regularidad, debiendo reinscribirse a la misma. SIN EXCEPCIÓN: no hay prórrogas. ([Ver Condiciones de Aprobación materia de Procesos 3.5.11.](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21#cap4-5-11))

| Modalidad | Presencial Home y Presencial | ED | EDH |
| --- | --- | --- | --- |
| Cursado | Aula Presencial y Aula Virtual (Plataforma multimedia) | Aula Virtual (Plataforma multimedia) |  |
| Asistencia | 75% | No requiere |  |

#### 12.2.4 COMISIÓN ACADÉMICA EVALUADORA (CAE)

El trabajo aprobado en el módulo 4 del Seminario Final es presentado a una CAE (conformada por profesores expertos de la carrera) los cuales se expedirán sobre el trabajo dentro del plazo de 60 días corridos. Esta comisión tendrá por función evaluar el TFG pudiendo realizar recomendaciones de mejora para la instancia de Defensa Oral, solicitar ajustes y modificaciones o desaprobar el TFG.

Como resultado de la evaluación que realice la CAE se pueden presentar tres situaciones:

- Que el trabajo presentado cumpla con lo esperado para dicha instancia quedando habilitado a Defensa Oral.
- Que la CAE indique ajustes del TFG por parte del estudiante, en cuyo caso se le hace llegar un acta rúbrica con el detalle de las recomendaciones, indicándole el plazo en el cual deberá entregar una nueva versión modificada de su Trabajo Final. En caso de que no se cumpla con dicha entrega dentro del plazo de 30 días corridos, o la misma no responda a lo indicado por la CAE la materia Seminario Final quedará desaprobada debiendo el alumno recursar la materia para confección de un nuevo TFG.
- Que la CAE considere que el TFG no está en condiciones de ser aprobado para Defensa Oral. En caso de presentarse esta situación se deberán reunir los integrantes de la CAE, el profesor de Seminario Final y la Dirección de la Carrera para el análisis y dictamen final. En el caso de confirmarse lo observado por la CAE, la materia Seminario Final será desaprobada debiendo el alumno recursar la materia para elaborar un nuevo TFG. Caso contrario se requerirán ajustes del TFG por parte del estudiante, siguiendo el proceso detallado en el punto anterior.

#### 12.2.5 DEFENSA ORAL (DO)*

A partir de la habilitación a Defensa Oral, deberá cumplir con todos requisitos administrativos que se exigen para esta instancia, y que son informados al alumno al iniciar

el proceso de TFG. Asimismo, se deberán cumplir con las siguientes condiciones:

• Obtener el visado académico del analítico por parte de la Secretaría de Organización Académica de la Universidad Siglo 21 acreditando que tiene aprobadas todas las materias

que componen la currícula de su carrera.

• Para alumnos de EDH y ED, haber aprobado el EFIP II, a excepción de aquellas carreras que sean Ciclos de Complementación Curricular para las que no es exigible la instancia

de EFIP II.

• Deberá inscribirse, a través de la plataforma virtual, a la mesa de Defensa Oral dentro de un plazo máximo de 30 (treinta) días corridos a partir de la habilitación a

Defensa Oral por parte de la CAE y del cumplimiento de los requisitos académico.

El Área de TFG debe velar para que todos estos requisitos se cumplan, a fin de autorizar la constitución de la mesa examinadora correspondiente

El Examen Oral Final se estructura en dos instancias:

• La primera, en la que se procede a la presentación oral del TFG.

• La segunda, en la que el Comité de Evaluación puede plantear preguntas sobre aspectos abordados en la presentación oral. En esta segunda etapa se evalúan diferentes

aspectos previstos en la rúbrica diseñada para la instancia.

El Tribunal deberá comunicar el resultado de la evaluación al estudiante y devolver fortalezas y debilidades observadas en el Examen Oral, destacando así la instancia de

aprendizaje que representa esta etapa de evaluación.

La calificación final que asigne el Tribunal de Evaluación será el resultado de la ponderación de la calificación de la etapa de Seminario final y CAE y la etapa de Defensa

Oral debiendo ambas instancias estar aprobadas.

La escala de notas utilizadas para la calificación final está comprendida entre 4 (cuatro) y 10 (diez), para todas las modalidades de cursado.

En caso de que la calificación final sea menor a cuatro, la materia Seminario Final se desaprueba debiendo recursar la materia para elaborar un nuevo TFG.

Nota: Todas las defensas orales se desarrollan en la Sede Campus de la Universidad Siglo 21. Para casos particulares, la Universidad se reserva el derecho de otorgar excepciones.

12$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-2-trabajo-final-de-graduacion$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-12$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 3, $pea0$rg-12-3-trabajo-final-de-posgrado-maestrias$pea0$,
        $pea0$Trabajo final de posgrado maestrías$pea0$, $pea0$El proceso de elaboración, presentación, evaluación y aprobación del Trabajo Final de Maestría se ajustará a los requisitos previstos por la Resolución Nº 160/2011 del Ministerio de Educación y a l…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-3-trabajo-final-de-posgrado-maestrias el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 12 | GRADUACIÓN

### 12.3 TRABAJO FINAL DE POSGRADO: MAESTRÍAS

El proceso de elaboración, presentación, evaluación y aprobación del Trabajo Final de Maestría se ajustará a los requisitos previstos por la Resolución Nº 160/2011 del Ministerio de Educación y a lo establecido en el reglamento de cada carrera, según se indica a continuación:

#### A) SOBRE EL PROYECTO DE TRABAJO FINAL DE MAESTRÍA

Una vez que el alumno ha cursado y aprobado las materias METODOLOGÍA DE LA INVESTIGACIÓN (PARTE I) y METODOLOGÍA DE LA INVESTIGACIÓN (PARTE II) o la que en el futuro las reemplace debe comenzar con la producción de su Trabajo final de Maestría.

#### B) CONSIDERACIONES GENERALES

Al momento de emprender la producción del Trabajo Final de Maestría, el maestrando deberá presentar ante el Director de la Carrera el Proyecto de Trabajo Final aprobado de las materias mencionadas en párrafo anterior.

Para poder avanzar con la producción del Trabajo final de Maestría, el maestrando deberá presentar el proyecto al director de carrera a fines de ser aprobado junto con el perfil de director propuesto.

#### C) CONTENIDO DEL TRABAJO FINAL DE MAESTRÍA

- Debe ser de carácter individual.
- Debe permitir evidenciar la integración de aprendizajes realizados en el proceso formativo y dar cuenta del conocimiento sobre el tema elegido.
- Debe ser redactado en lengua española.
- Debe seguir, la estructura en base a la tipología de trabajo elegida ya sea: Plan de Negocios, Plan de Intervención/Innovación o Plan de investigación.
- Debe respetar lo indicado por los estándares definidos en las normas APA (American Psychological Association), sistema único de cita utilizado por esta Institución. 6) Su defensa será oral y pública, realizada en lengua española.

#### D) SOBRE EL DIRECTOR DEL TRABAJO FINAL DE MAESTRÍA

- Es obligatoria la figura de Director en el trabajo final de Maestría. Es facultad del alumno proponer un director para el desarrollo de su tesis.
- El perfil del director propuesto será aprobado o rechazado por el Director de Carrera según lo dispuesto en el reglamento de cada carrera. El Director del Trabajo Final de Maestría, deberá poseer como mínimo una formación de posgrado equivalente a la ofrecida por la Carrera ya sea en universidades argentinas o extrajeras.

#### E) REQUISITOS A ENVIAR PARA APROBACIÓN DE TEMA Y DIRECTOR

- Archivo en soporte digital (PDF) del proyecto de tesis
- Carta de aceptación del director
- CV del director para analizar el perfil propuesto.
- Carta de No plagio firmada

#### F) PLAZO DE ENTREGA DEL PROYECTO DE TRABAJO FINAL

La presentación de la documentación relativa al Proyecto de Trabajo Final deberá realizarse dentro del plazo de los dos (2) meses de haber culminado el cursado, METODOLOGÍA DE LA INVESTIGACIÓN, prorrogable por el período que autorice el Director de la Carrera, por única vez, a solicitud del alumno. En caso de incumplimiento de este requisito, el alumno deberá recursar la asignatura.

#### G) PROCESO DE EVALUACIÓN DEL TRABAJO FINAL DE MAESTRÍA

Habiendo obtenido la aprobación final del Director del Trabajo Final de Maestría, el estudiante podrá avanzar, junto con el apoyo de su director, con la producción de su trabajo final de Maestrías

Una vez finalizada la producción de tesis, siempre dentro del plazo máximo previsto para la duración de la carrera, deberá solicitar la conformación de un Tribunal Evaluador. Previa solicitud de la persona interesada, con causal fundada avalada por su director de tesis, el Director de la Carrera podrá conceder una prórroga de hasta doce (12) meses como máximo, para la presentación y aprobación del Trabajo Final toda vez que se encuentre excedido el plazo máximo previsto para la duración de la carrera.

#### H) TRIBUNAL EVALUADOR DEL TRABAJO FINAL DE MAESTRÍA

- El Tribunal será integrado por tres docentes que detenten el título de Magister o superior, siendo al menos uno (1) de ellos externo a la Universidad, pudiendo ser de nacionalidad argentina o extranjero con probado dominio de la lengua española.
- El Tribunal será designado por el Coordinador, bajo la supervisión del Director de la Carrera, dentro de los 30 días inmediatos posteriores a la presentación del Trabajo Final de Maestría en condiciones de ser evaluada.
- La designación del Tribunal será comunicada al alumno. El alumno dispondrá de un plazo de hasta 5 (cinco) días hábiles para impugnar, si lo considera, algún miembro del tribunal con causa debidamente fundamentada, lo que quedará sujeto a consideración del Director de la carrera.

#### I) RESULTADOS DE LA EVALUACIÓN DEL TRIBUNAL EVALUADOR DEL TRABAJO FINAL DE MAESTRÍA

El tribunal expedirá su evaluación mediante Rubrica Unificada, en la cual se verá plasmada la evaluación de los tres miembros del tribunal mediante votos fundados. En caso de disidencias, se tomará como resolución el voto de la mayoría, pudiendo ser las siguientes:

- Habilitado a Defensa oral: El alumno cuenta con 30 días para solicitar al área de trabajo final mesa de defensa oral de tesis.
- Habilitado a Defensa Oral con Observaciones: El alumno se encuentra habilitado, pero debe, antes de solicitar mesa de defensa oral, realizar las modificaciones solicitadas por el tribunal. Estas modificaciones serán evaluadas en la instancia de Defensa Oral.
- Reelaboración de Observaciones: El alumno cuenta con 30 días para realizar las modificaciones solicitadas por el tribunal evaluador y enviar el Trabajo Final nuevamente a fin de ser evaluado por el mismo tribunal.
- Reprobado: En caso de no aprobación del Trabajo Final de Maestría, el maestrando dispondrá de doce (12) meses para presentar un nuevo Trabajo Final de Maestría, debiendo respetar todos los pasos, requisitos y demás exigencias previstas en el presente reglamento desde la etapa de presentación del Proyecto del Trabajo Final ante el Director de Carrera en adelante.

#### J) APROBACIÓN DEL TRABAJO FINAL DE MAESTRÍA

Es requisito indispensable, para la aprobación del Trabajo Final de Maestría, transcurrir por la instancia de Defensa Oral.

- En caso de habilitación a defensa del Trabajo Final de Maestría, se designará fecha para la instancia de Defensa Oral. El acto de defensa será público, siendo el Área de Trabajo Final junto con el tribunal, quienes fijarán la fecha y hora de la misma notificando al maestrando, y al tribunal. Se otorga al alumno un plazo máximo de treinta (30) días solicitar la instancia mencionada.
- El Tribunal de Trabajo Final presidirá la defensa oral y pública del candidato a magíster. El acto será avalado por el Director de la carrera y/o el Coordinador Académico de la misma.
- En el acto de la defensa el maestrando expondrá los aspectos relevantes de su trabajo en un tiempo no mayor a 35 minutos. A continuación, el tribunal podrá realizar las preguntas que se consideren pertinentes relativas al tema expuesto. Posteriormente y en el mismo acto, una vez terminada la defensa, el tribunal dará al alumno la devolución correspondiente y la calificación final que merece tanto el trabajo escrito realizado como la presentación.
- La defensa oral, según la siguiente escala: Sobresaliente (10), Distinguido (9), Muy Bueno (8), Bueno (7) y Desaprobado (6 o menos). De lo anterior surge que el Trabajo Final se aprueba necesariamente con 7 (siete) o más puntos.

12$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-3-trabajo-final-de-posgrado-maestrias$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-12$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 4, $pea0$rg-12-4-trabajo-final-de-posgrado-especializaciones$pea0$,
        $pea0$Trabajo final de posgrado especializaciones$pea0$, $pea0$El proceso de elaboración, presentación, evaluación y aprobación del Trabajo Final de Especialización se ajustará a los requisitos previstos por lo establecido en el reglamento de cada carrera.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-4-trabajo-final-de-posgrado-especializaciones el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 12 | GRADUACIÓN

### 12.4 TRABAJO FINAL DE POSGRADO: ESPECIALIZACIONES

El proceso de elaboración, presentación, evaluación y aprobación del Trabajo Final de Especialización se ajustará a los requisitos previstos por lo establecido en el reglamento de cada carrera.

#### A. SOBRE EL PROYECTO DE TRABAJO FINAL DE ESPECIALIZACIÓN

Una vez que ha cursado y aprobado la/las materia/s Taller de Trabajo Final (según corresponda al reglamento de cursado de cada especialización) o la que en el futuro las reemplace, debe comenzar con la producción de su Trabajo final de Especialización, no es obligatorio el perfil de Director de Tesis, queda a criterio de cada alumno contar, o no, con la figura.

#### B. CONSIDERACIONES GENERALES

Al momento de emprender la producción del Trabajo Final de Especialización, el alumno deberá presentar ante el Director de la Carrera el Proyecto de Trabajo Final aprobado de las materias mencionadas en párrafo anterior.

Para poder avanzar con la producción del Trabajo final de Especialización, el alumno deberá presentar el proyecto al director de carrera a fines de ser aprobado.

#### C. CONTENIDO DEL TRABAJO FINAL DE ESPECIALIZACIÓN

- Debe ser de carácter individual.
- Debe permitir evidenciar la integración de aprendizajes realizados en el proceso formativo y dar cuenta del conocimiento sobre el tema elegido.
- Debe ser redactado en lengua española.
- Debe respetar lo indicado por los estándares definidos en las normas APA (American Psychological Association – Versión 7), sistema único de cita utilizado por esta Institución.

#### D. REQUISITOS A ENVIAR PARA APROBACIÓN DE TEMA:

- Archivo en soporte digital (PDF) del proyecto de tesis
- Carta de No plagio firmada

#### E. PLAZO DE ENTREGA

La presentación de la documentación relativa al Proyecto de Trabajo Final deberá realizarse dentro del plazo de los dos (2) meses de haber culminado el cursado, de la/las materia/as Taller de Trabajo final, prorrogable por el período que autorice el Director de la Carrera, por única vez, a solicitud del alumno. En caso de incumplimiento de este requisito, el alumno deberá recursar la asignatura.

#### F. PROCESO DE EVALUACIÓN DEL TRABAJO FINAL DE ESPECIALIZACIÓN

Habiendo obtenido la aprobación final del Director del Trabajo Final de Especialización, el alumno podrá avanzar con la producción de su Trabajo final de Especialización

Una vez finalizada la producción de tesis, siempre dentro del plazo máximo previsto para la duración de la carrera, deberá solicitar Tribunal Evaluador.

Previa solicitud del alumno, con causal fundada, el Director de la Carrera podrá conceder una prórroga de hasta doce (12) meses como máximo, para la presentación y aprobación del Trabajo Final toda vez que se encuentre excedido el plazo máximo previsto para la duración de la carrera.

#### G. TRIBUNAL EVALUADOR DEL TRABAJO FINAL DE ESPECIALIZACIÓN

- El Tribunal será integrado por dos a tres docentes que detenten el título de Especialista o superior, siendo al menos uno (1) de ellos externo a la Universidad, pudiendo ser de nacionalidad argentina o extranjero con probado dominio de la lengua española.
- El Tribunal será designado por el Coordinador, bajo la supervisión del Director de la Carrera, dentro de los 30 días inmediatos posteriores a la presentación del Trabajo Final de Especialización en condiciones de ser evaluada.
- La designación del Tribunal será comunicada al alumno. Este dispondrá de un plazo de hasta 5 (cinco) días hábiles para impugnar, si lo considera, algún miembro del tribunal con causa debidamente fundamentada, lo que quedará sujeto a consideración del Director de la carrera.

#### H. RESULTADOS DE LA EVALUACIÓN

El tribunal expedirá su evaluación mediante Rubrica Unificada, en la cual se verá plasmada

la evaluación de los tres miembros del tribunal mediante votos fundados. En caso de disidencias, se tomará como resolución el voto de la mayoría, pudiendo ser las siguientes:

- Aprobado: Se le informara la resolución con la Rubrica que contiene la evaluación del tribunal y nota asignada.
- Reelaboración de Observaciones: El alumno cuenta con 30 días para realizar las modificaciones solicitadas por el tribunal evaluador y enviar el Trabajo Final nuevamente a fin de ser evaluado por el mismo tribunal.
- Reprobado: En caso de no aprobación del Trabajo Final de Especializaciones, el maestrando dispondrá de doce (12) meses para presentar un nuevo Trabajo Final de Especialización, debiendo respetar todos los pasos, requisitos y demás exigencias previstas en el presente reglamento desde la etapa de presentación del Proyecto del Trabajo Final ante el Director de Carrera en adelante.

#### I. APROBACIÓN DEL TRABAJO FINAL DE ESPECIALIZACIÓN

- El trabajo final de Especialización será aprobado según la siguiente escala: Sobresaliente (10), Distinguido (9), Muy Bueno (8), Bueno (7) y Desaprobado (6 o menos). De lo anterior surge que el Trabajo Final se aprueba necesariamente con 7 (siete) o más puntos.
- Una vez aprobado el alumno, es notificado con la rúbrica correspondiente que contiene la evaluación y resolución del tribunal consignando la nota obtenida.

12$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-4-trabajo-final-de-posgrado-especializaciones$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-12$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 5, $pea0$rg-12-5-proceso-de-titulacion$pea0$,
        $pea0$Proceso de titulación$pea0$, $pea0$El proceso de titulación para personas egresadas de Posgrado, Grado y Pregrado (excepto personas egresadas por mecanismos de articulación o título intermedio) se inicia una vez que el estudiante ha…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-5-proceso-de-titulacion el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 12 | GRADUACIÓN

### 12.5 PROCESO DE TITULACIÓN

El proceso de titulación para personas egresadas de Posgrado, Grado y Pregrado (excepto personas egresadas por mecanismos de articulación o título intermedio) se inicia una vez que el estudiante ha cumplido con todos los requisitos exigidos por la Universidad y por la Normativa Provincial y Nacional aplicable, para obtener el título respectivo.

En aquellas carreras que así lo prevén, la persona inscripta podrá solicitar la emisión de título intermedio, trámite que se iniciará a requerimiento del estudiante, siempre que haya cumplido con lo exigido en la Resolución de aprobación de la carrera, para la titulación intermedia.

Para las personas egresadas por cualquier mecanismo de Articulación o Doble titulación el proceso de titulación se inicia una vez que ha finalizado el trámite de reconocimiento de estudios requerido para adquirir la condición de Egresado.

En todos los casos, la persona solicitante deberá abonar la tasa por el trámite administrativo correspondiente a la gestión de su título de Posgrado, Grado, Pregrado o Intermedio.

Conforme al Artículo 40 de la Ley de Educación Superior, el plazo para la emisión del diploma, siempre que se encuentren cumplidos los requisitos de documentación obligatoria del legajo, es de 120 días corridos desde que el legajo adquiere la condición de Egresado.

12$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-5-proceso-de-titulacion$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-12$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 6, $pea0$rg-12-6-colacion$pea0$,
        $pea0$Colación$pea0$, $pea0$Conforme lo establece la Resolución Rectoral N° 2380/2016 la Colación es el acto académico mediante el cual se realiza el reconocimiento a quienes culminaron un plan de estudio académico, habiendo…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-6-colacion el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 12 | GRADUACIÓN

### 12.6 COLACIÓN

Conforme lo establece la Resolución Rectoral N° 2380/2016 la Colación es el acto académico mediante el cual se realiza el reconocimiento a quienes culminaron un plan de estudio académico, habiendo cumplido con todos los requisitos exigidos por la Universidad y por la Ley para obtener el título respectivo.

Anualmente participan en cada colación las personas egresadas de carreras de pregrado, grado y posgrado desde el 01 de septiembre del año anterior hasta el 31 de agosto inclusive del año en curso. En el caso de pregrado, por cuestiones de distancia el evento alcanza únicamente a los egresados que correspondan a CAU Córdoba y Rio IV, aunque la Universidad podría disponer ampliar el alcance si lo considera conveniente.

La Colación de Grado abarca también a los ciclos de complementación curricular; no contempla los títulos intermedios ni las dobles titulaciones, salvo que el egresado haya gestionado equivalencias.

La Colación de Pregrado incluye a quienes hayan egresado por articulación.

Pueden colacionar quienes hayan cumplimentado todos los requisitos exigidos para el otorgamiento de su título, es decir que aquellos que hayan finalizado su plan de estudios, pero adeuden cualquier documentación requerida para la emisión del título no podrán participar de la ceremonia.

La participación en el evento de colación no implica la recepción del título definitivo, ya que durante la ceremonia se hace entrega de un diploma simbólico, quedando supeditada la entrega del título oficial a los procesos que disponga la Universidad a tal efecto, en cumplimiento de la normativa vigente.

12$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-6-colacion$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-13$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-13-1-regimen-general-de-sanciones$pea0$,
        $pea0$Régimen general de sanciones$pea0$, $pea0$Las disposiciones que regulan el régimen general de sanciones y que serán aplicables a toda la comunidad educativa se encuentran establecidas por Resolución de Consejo Superior 1050/2022, siendo ap…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=13-1-regimen-general-de-sanciones el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 13 | RÉGIMEN DISCIPLINARIO

La Universidad Siglo 21 espera de toda su comunidad educativa un gran compromiso para el desarrollo de una sociedad más justa y equitativa, velando por una formación profesional integra, basada en valores. La institución persigue la excelencia educativa y que tal excelencia guarde una importante relación con el crecimiento y el desarrollo de personas humanamente plenas con un alto nivel de acatamiento a las normas y al respeto, no solo a las personas que integran esta gran familia universitaria, sino también, a sus instalaciones y bienes. Por ello, y como norma general y operativa se establece que, cualquier actitud reñida con estos principios, podrá ser sancionada en los términos y por los procedimientos establecidos en este reglamento.

### 13.1 RÉGIMEN GENERAL DE SANCIONES

Las disposiciones que regulan el régimen general de sanciones y que serán aplicables a toda la comunidad educativa se encuentran establecidas por [Resolución de Consejo Superior 1050/2022](https://contenidos.21.edu.ar/microsites/reglamento/assets/pdf/rcs-105022-reglamento-de-medidas-disciplinarias-resolucion.pdf), siendo aplicables a todo el alumnado desde su inscripción hasta la entrega final de su título. Abarcando a todas las carreras y cursos que esta Casa de Altos Estudios dicte; sean carreras de Pregrado, Grado, Posgrados y/o Aprendizaje Para la Vida, con completa independencia de la condición, modalidad o plan de estudio que cada uno de ellos detenten.

El Vicerrectorado de Gestión Institucional será el órgano de aplicación del presente régimen disciplinario, pudiendo delegar en la Secretaría de Organización Académica el impulso y tramitación del proceso de sanciones y la instrucción de sumario.

Se establecen las siguientes faltas como conductas sancionables, las cuales se encuentran clasificadas, según el nivel de lesividad:

#### FALTAS LEVES

Serán conductas pasibles de ser determinadas como faltas leves:

- Incumplimiento de las prescripciones determinadas por el Reglamento Institucional para la presentación a rendir un examen.
- Incumplimiento de la obligatoriedad de rendir de manera presencial en su Sede o Centro de Apoyo Universitario (CAU) en donde el estudiante se encuentre inscripto para dar su examen, siempre que la modalidad de cursado así lo determine.
- Comportamiento indebido, insultos, agravios, agresiones o violencia de cualquier tipo, cuya gravedad sea leve, siempre que ello no configure una falta mayor, por parte de estudiantes en el marco de comunicaciones mantenidas personalmente o por cualquier vía con personal codocente, estudiantes, cuerpo docente, autoridades de la Universidad y/o personal de Centros de Apoyo Universitario.
- Desobediencia a las directivas impartidas por autoridad universitaria y/o personal de Centros de Apoyo Universitario (CAU), fundadas en normas institucionales.
- Actitudes o expresiones emanadas por cualquier vía, que ofendan las buenas costumbres y las normas de convivencia.
- Manipulación del sistema de marcación de asistencia.
- Situaciones de copia en Trabajos Prácticos, Actividades Prácticas Integradoras, Trabajos de Proceso, Trabajos Integradores o cualquier otra actividad académica, cuando se compruebe que un/a alumno/a o un grupo de estudiantes, ha/n presentado un trabajo práctico o cualquier otra evaluación, sea de realización individual o grupal, con copia inferior al cincuenta por ciento de las actividades.
- Cuando, una vez iniciada la instancia evaluativa, la persona inscripta a rendir un examen parcial, recuperatorio, integrador y/o final, lea en voz alta y audible, los enunciados o consignas del examen.
- Cuando, una vez iniciada una instancia evaluativa; momento a partir del cual se encuentra prohibido el uso del teclado; se advierta, sea por el sonido de las teclas o por la imagen captada por la cámara, que la persona inscripta se encuentra utilizándolo.
- Cuando se evidencie en una instancia evaluativa por parte de la persona inscripta, un desplazamiento sostenido y reiterado de su mirada hacia los costados, o hacia arriba y/o abajo, la cual debe encontrarse enfocada únicamente en la pantalla del examen.
- Cuando, una vez iniciada una instancia evaluativa, la persona inscripta a rendir apague o reduzca voluntariamente, el volumen del micrófono del dispositivo.
- Cuando, una vez iniciada una instancia evaluativa, la persona inscripta a rendir apague o reduzca voluntariamente, la iluminación del ambiente, imposibilitando la auditoría del examen.
- Cuando, una vez iniciada la instancia evaluativa, la persona que se encuentra rindiendo un examen se encuentre utilizando cualquier tipo de auricular o similar.
- Cuando, iniciada una instancia de examen, se desactive, apague la cámara, mueva y/o se obstruya la imagen captada por la cámara, de manera tal que se imposibilite o dificulte parcialmente el monitorio del examen.
- Cuando, iniciada una instancia de examen, la cámara no muestre la totalidad del rostro de la persona inscripta, imposibilitando o dificultando parcialmente el monitoreo del examen.

#### FALTAS GRAVES

Serán conductas pasibles de ser determinadas como faltas graves:

- Generación de una situación que provoque desorden en el ámbito de la Universidad y que afecte el normal desenvolvimiento o desarrollo de la vida universitaria, y/o causare o pudiese causar daños sobre los bienes de la Universidad.
- Comportamiento indebido, insultos, agravios, agresiones o violencia de cualquier tipo, siempre que ello no configure una falta mayor, por parte de estudiantes en el marco de comunicaciones mantenidas personalmente o por cualquier vía con personal codocente, estudiantes, cuerpo docente, autoridades de la Universidad y/o personal de Centros de Apoyo Universitario.
- Cualquier manifestación en forma verbal o por escrito, a través de redes sociales de la Universidad y/o por cualquier otro medio, que implique un agravio al buen nombre y/o honor de esta Universidad y/o de los Centros de Apoyo Universitario y/o a su personal, en el marco del desempeño profesional.
- Inobservancia de los procesos académicos y/o administrativos reglamentados por la Universidad con la finalidad de cursar o rendir sin encontrarse habilitado para ello.
- Situaciones de copia en Trabajos Prácticos, Actividades Prácticas Integradoras, Trabajos de Proceso, Trabajos Integradores o cualquier otra actividad, cuando se compruebe que un/a alumno/a o un grupo de estudiantes, ha/n presentado un trabajo práctico o cualquier otra evaluación, sea de realización individual o grupal, con copia superior al cincuenta por ciento (50%) de las actividades.
- Compartir y/o publicar por cualquier vía, material relacionado al contenido de exámenes, actividades prácticas, trabajos prácticos o cualquier otro contenido con tinte académico con el propósito facilitar a otros estudiantes actividades o información referida a procesos evaluativos.
- Comportamiento indebido por parte de estudiantes en el marco de una instancia de examen: realizar captura de pantalla, fotografiar y/o documentar por cualquier medio material pertinente el contenido del examen, para sí y/o para terceros y/o hacerse de este tipo de material por cualquier vía con el propósito de beneficiarse de algún modo, y toda otra actitud desarrollada en igual sentido.
- Cuando, iniciada la instancia de examen, se desactive, apague la cámara, mueva, inhiba la cámara, se obstruya la imagen captada por la cámara, y/o no se visualice el rostro del alumno al momento del desarrollo del examen, de manera tal que se imposibilite totalmente el monitorio del examen.
- Cuando, durante el desarrollo del examen, en cualquier momento desde su inicio hasta su finalización, se reconozca la presencia de más de una persona, cualquiera sea la naturaleza y duración de esa intromisión.
- Cuando se adviertan gesticulaciones, señas o diálogos con terceras personas ajenas a la instancia evaluativa, durante la realización de la misma.
- Cuando durante la instancia de examen, la persona inscripta se ausente sin aviso ni notificación previa y no haya presencia física del mismo por más de treinta (30) segundos.
- Cuando se advierta, durante la instancia de examen, la existencia de una o más voces ajenas a la de la persona inscripta que se encuentra rindiendo.
- Cuando se evidencie la utilización de libros, apuntes, resúmenes, o cualquier otro material de lectura durante la instancia de examen.
- Cuando, durante la instancia del examen, se verifique la utilización de cualquier otro dispositivo electrónico ajeno a los medios autorizados y necesarios para efectuar la examinación (teléfono celular, Tablet, reloj inteligente, etc.).
- Cuando, durante la instancia del examen, se verifique la utilización de otros softwares no autorizados y dicha constancia quede documentada en la pantalla principal del examen.
- Cuando se advierta, que el examen fue abierto y/o comenzado fuera de sede, y la persona inscripta se presente a finalizar el mismo en la sede en la cual se inscribió para rendir su examen.
- La presencia de dos o más anomalías configuradas como falta leve, en simultáneo durante la misma instancia evaluativa.
- Reincidencia en la comisión de una infracción ya castigada con sanción leve.

#### FALTAS MUY GRAVES

Serán conductas pasibles de ser determinadas como faltas muy graves:

- Reemplazar o ser reemplazado por otra persona al momento de dar un examen, o en la producción de cualquier tipo de actividad evaluable. Se contemplarán dentro de este supuesto aquellos casos en que se detecte que la persona inscripta a rendir un examen se encuentra logueada para dar el examen virtual en dos conexiones de distinta locación de manera simultánea.
- Encomendar a un tercero, a título gratuito u oneroso, la confección de cualquier tipo de trabajo de elaboración propia; sean Trabajos Prácticos, Trabajos Finales, Tesis, Trabajo Final de graduación y/o cualquier otro trabajo académico.
- Cualquier tipo de actitud que implique agresión física al personal codocente, alumnado, cuerpo docente, autoridades de la Universidad y/o personal de los Centros de Apoyo Universitarios.
- Cualquier intento de vulnerar, modificar, adulterar, etc. el sistema de seguridad del Campus Virtual y/o cualquier otro sistema informático y/o plataforma tecnológica utilizado por la Universidad.
- Reincidencia en la comisión de una infracción ya castigada con sanción grave.

#### FALTAS GRAVÍSIMAS

Serán conductas pasibles de ser determinadas como faltas gravísimas:

- Presentación de documentos falsos o adulterados para el cumplimiento de los requisitos exigidos para el ingreso a la Universidad y/o cualquier otro trámite administrativo en la Universidad.
- Manifestación de datos falsos que sean exigidos en carácter de declaración jurada.
- Falsificación y/o adulteración de actas de examen y otros instrumentos con el objetivo de acreditar haber regularizado o aprobado una materia, curso o carrera.
- Reincidencia en la comisión de una infracción ya castigada con sanción muy grave.

#### SITUACIÓN DE PLAGIO

El plagio será sancionado con una escala especifica de sanción ya que configura una deshonestidad académica y engaña en su buena fe a la comunidad educativa en general.

El alumnado, debe presentar todo tipo de trabajo o actividad que le encomiende el cuerpo docente bajo Normas APA – Versión 7 (American Psychological Association), sistema único de citas utilizado por la Universidad.

Se configura el Plagio cuando una persona que se encuentra cursando una carrera de Pregrado, Grado, Posgrado y/o programas de formación continua, incumpla lo establecido en el párrafo precedente en la presentación de todo tipo de trabajo, sean Trabajos de Proceso, Trabajos Prácticos, Trabajos Finales, Trabajos integradores y/o cualquier otro trabajo que debe ser de elaboración propia, y pretenda hacer pasar como propias obras o materiales de otros autores y/o copie información sin referenciar adecuadamente las fuentes, sean diseños, proyectos, tesis profesionales, publicaciones académicas, libros, marcas u otras producciones de autores.

Siempre que se incluya una idea, una frase ajena, un párrafo o una obra completa y no se indique de manera explícita el origen de la misma, ni se cite a la fuente original de la cual está tomada la información, aún si dicha omisión fuera resultado del desconocimiento de quien la presenta como propia

#### ESCALA

Se definen, las siguientes categorías de plagio según su gravedad:

- **Plagio Leve:** cuando el trabajo que presente plagio tenga un desarrollo significativo del estudiante, es decir que los contenidos no citados conforme al artículo precedente sean aislados, no sustanciales y no se evidencie que han sido utilizados para expresar postura propia ni conclusiones.
- **Plagio Grave:** cuando el trabajo presente plagio parcial en párrafos continuos o discontinuos y se evidencie la utilización de ideas ajenas para expresar la toma de postura propia, denotando ello que no se trata de una mera omisión aislada de citas, sino que se toman como propios razonamientos ajenos.
- **Plagio Muy Grave**: cuando el trabajo presente plagio parcial de tal envergadura que no se observe desarrollo intelectual significativo del estudiante, es decir que el trabajo sea, en todo su contenido sustancial, el resultado de copiar textos de otras fuentes que no han sido citadas o no lo han sido correctamente, de manera tal que se evidencie por parte del estudiante la intención de “disimular” el plagio mediante el cambio de conectores o copiando como citas propias, las citas referenciadas por la persona autora original de los contenidos plagiados.
- **Plagio Gravísimo:** Cuando el trabajo que debió ser presentado por el estudiante como elaboración de su autoría, pertenezca íntegramente a otro autor.

Ante la comisión de infracciones contempladas anteriormente o que conlleven a una transgresión de los valores y misión de esta Casa de Altos Estudios, La sanción que se aplique debe guardar proporción con la gravedad de la falta cometida, su reiteración, los antecedentes del estudiante y los daños que haya causado, de conformidad a lo establecido en los apartados siguientes:

- **Llamado de atención:** Procede el Llamado de Atención cuando la persona sumariada cometa las faltas contempladas en “Faltas Leves” y la comisión de Plagio Leve. En estos casos, cuando el Llamado de atención se establezca como sanción disciplinaria ante un incumplimiento en instancia académica y/o plagio leve, se aplicará, de manera accesoria la calificación de cero (0) en la actividad correspondiente.
- **Apercibimiento**: Procede el Apercibimiento cuando la persona sumariada cometa las faltas contempladas en “Faltas Graves” y la comisión de Plagio Grave. En estos casos, cuando el Apercibimiento se establezca como sanción disciplinaria ante un incumplimiento en instancia académica y/o plagio leve, se aplicará, de manera accesoria la calificación de cero (0) en la actividad correspondiente y la condición de Libre en la materia.
- **Suspensión**: Procede la Suspensión cuando la persona sumariada cometa las faltas contempladas en “Faltas Muy Graves” y la comisión de Plagio Muy Grave. Esta sanción además de conllevar, como pena accesoria la calificación de cero (0) en la actividad correspondiente, y la condición de Libre en la asignatura, tendrá como consecuencia principal, la pérdida temporal por parte del alumno, de su condición de tal, no pudiendo llevar adelante ningún tipo de actividad académica en la Universidad, desde la fecha de ejecución de la penalidad. Esta suspensión académica podrá extenderse hasta el plazo de 1 (un) año calendario, contando a partir de la fecha en la que se comunique la sanción impuesta. El plazo de suspensión se establecerá conforme criterios de razonabilidad y en proporción a la falta cometida.
- **Expulsión**: Procede la Expulsión cuando la persona sumariada cometa las “Faltas Gravísimas” contempladas y en la comisión de Plagio Gravísimo. Esta sanción implicará la pérdida definitiva e irrevocable de la condición de alumno de la Universidad y la comunicación de la sanción a todo el Sistema Universitario Nacional.

#### REGISTRACIÓN DE LA SANCIÓN

Todas las sanciones, con excepción del Llamado de Atención que solo constará en el legajo que tiene cada estudiante en la institución, será registradas en el certificado analítico del estudiante.

#### REINCIDENCIA

Será reincidente quien, registrando en su legajo una sanción firme, incurriere en una nueva falta. En este caso, podrá aplicarse una sanción más severa, o inclusive de naturaleza distinta a la sanción prevista para la primera infracción, conforme lo establezca el presente reglamento.

#### AGRAVANTES

Si quien comete cualquiera de las faltas descriptas en el presente reglamento desempeña la función de codocente, cuerpo docente, autoridades de la Universidad y/o personal de Centros de Apoyo Universitario, se considerará un agravante y será ponderado por el Vicerrectorado de Gestión Institucional al momento de determinar la sanción aplicable, pudiendo aplicar una sanción más severa a la prevista.

13$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=13-1-regimen-general-de-sanciones$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-13$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 2, $pea0$rg-13-2-normas-de-comportamiento-de-biblioteca$pea0$,
        $pea0$Normas de comportamiento de biblioteca$pea0$, $pea0$Está estrictamente prohibido:$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=13-2-normas-de-comportamiento-de-biblioteca el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 13 | RÉGIMEN DISCIPLINARIO

### 13.2 NORMAS DE COMPORTAMIENTO DE BIBLIOTECA

#### 13.2.1 NORMAS EN BIBLIOTECA PRESENCIAL

Está estrictamente prohibido:

- Actos de conducta indebida o de falta de respeto.
- Ingresar con comida y bebidas.
- El uso de fósforos y encendedores.
- Realizar juegos de azar.
- Alterar el orden en todos sus aspectos.
- Fotografiar materiales disponibles en la Biblioteca.
- Retirar material de la Biblioteca sin en el consentimiento del personal.
- Mutilar y/o dañar cualquier material de la Biblioteca.
- Movilizar y/o retirar mobiliario sin autorización del personal.

**Nota:**Está permitido el acceso al establecimiento con bolsos, mochilas y carteras, salvo en el caso de que al momento del ingreso se activarán las alarmas de seguridad.

Además, son considerados delitos de derecho común susceptible de cometerse en perjuicio del patrimonio de la Biblioteca, los siguientes casos:

- Mora en la devolución del material prestado con incumplimiento de la intimación formal realizada por Biblioteca para su restitución: retención indebida, artículo 173, inc. 2, Código Penal.
- Mutilación o deterioro intencional de material: daño agravado por el objeto y por el lugar donde se encuentra, art. 163, inc. 7, Código Penal.

#### 13.2.2 RESPONSABILIDADES Y SANCIONES

Todo usuario debe hacerse responsable por la integridad del material que consulte. Por la demora en la devolución del mismo se aplican las siguientes sanciones:

- Por cada día de atraso, corresponde 1 (una) semana de suspensión.
- El límite máximo de tolerancia en cuanto a cantidad de suspensiones es 3 (tres).
- Excedido este límite el usuario queda suspendido automáticamente por el año lectivo de Biblioteca y la Coordinación General de Biblioteca y Proyecto Editorialeleva una nota al Vicerrectorado de Gestión Institucional a fin de poner en conocimiento sobre la situación del mismo.
- Durante el período de sanción el usuario está habilitado únicamente para realizar consulta en sala.
- La Coordinación General de Biblioteca y Proyecto Editorial evalúa casos puntuales de mora, dejando a su criterio la aplicación de sanciones extraordinarias.
- Si el material, en el momento de la devolución, se encuentra con partes deterioradas o faltantes, se presume que el usuario que lo devuelve es el autor de dicha mutilación o deterioro, por lo que deberá suplantar dicho material por un nuevo ejemplar o títulos similar en el caso de que el libro no se encuentre en el mercado. La Coordinación General de Biblioteca y Proyecto Editorial evaluará el caso y sugerirá la reposición del mismo.
- El usuario, al retirar el material, debe expresar su disconformidad respecto al estado del mismo, al igual que el personal de Biblioteca debe advertir si al momento de entregarlo se encuentra en malas condiciones.
- En caso de extravíos o daño del material, el usuario está obligado a la reposición de dicho material, en el plazo estipulado. En caso de que el material se encuentre agotado en cualquiera de las plazas, la Coordinación General de Biblioteca y Proyecto Editorial puede aceptar la reposición mediante otro material de similar temática y costo, de acuerdo a la recomendación del Tutor de la carrera implicada.
- La reposición del material mutilado, deteriorado o extraviado no excusa la falta del usuario, quien debe cumplir con las sanciones que le correspondan por el atraso.

#### 13.2.3 PRÉSTAMOS Y CIRCULACIÓN DE MATERIAL

#### TIPOS DE PRÉSTAMO

- **Consulta en sala: p**ueden acceder todos los usuarios que quieren consultar los fondos bibliográficos de la Biblioteca de la Universidad, puesto que el sistema de consulta es de estantería abierta.
- **Préstamos a domicilio**: la cantidad máxima de material a retirar es de 5 (cinco) ejemplares por un máximo de 7 (siete) días corridos en el caso de alumnos y 14 días corridos en el caso de docentes.
- **Préstamos Ebook 21**: Los usuarios podrán descargar el ebook por un tiempo determinado según los permisos editoriales. Una vez vencido el plazo de préstamo el archivo caducará o desaparecerá de la PC o dispositivo electrónico del usuario. Esta estrictamente prohibido hacer copia, imprimir o decodificar el material descargado, salvo de la cantidad de páginas que figuren como legales y permitidas por el proveedor.
- **Préstamos intersedes**: Se podrá solicitar material que esté disponible en otra Sede (Campus o Rio IV). En tal caso, el material será solicitado por el bibliotecario y el préstamo para el usuario será con los mismos plazos y formas que el préstamo a domicilio.
- **Préstamos Interbibliotecarios**: En el marco del Acuerdo de Bibliotecas Universitarias de Córdoba (ABUC), los usuarios podrán solicitar material de otras bibliotecas, cuyo préstamo será realizado por el bibliotecario de la Sede ajustándose a las normativas de cada Biblioteca.
- **Préstamo condicional**: En caso de ser solicitado el material, por otro usuario, se puede interrumpir el plazo de préstamo o la renovación.

#### 13.2.4 DEVOLUCIONES

Pueden efectuarse personalmente o a través de un tercero, dentro del plazo estipulado. Y el material deberá estar en perfectas condiciones. Cualquier incumplimiento podrá dar lugar a las sanciones mencionadas en el punto 3.12.1.

#### 13.2.5 RENOVACIONES

El usuario puede solicitar una extensión del préstamo vía mail, por teléfono o personalmente. La renovación debe realizarse el día anterior al vencimiento de la fecha de devolución.

Pueden concederse hasta 3 (tres) renovaciones. Las renovaciones siempre están condicionadas al tipo de material. Si es de bibliografía básica, o está siendo muy solicitado, puede no concederse la renovación.

#### 13.2.6 RESERVAS

- El usuario puede reservar material con 1 (un) día de anticipación o dentro del mismo día en que se realizara el préstamo.
- Pueden realizarse por teléfono, mail o personalmente.
- Cumplida las 24hs de la reserva, el material vuelve a estar disponible, salvo que el usuario comunicara por mail o por teléfono la extensión de la reserva.
- No se realizarán reservas a los usuarios que cuenten con antecedentes de mora.

13$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=13-2-normas-de-comportamiento-de-biblioteca$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-14$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-14-1-planes-de-estudio$pea0$,
        $pea0$Planes de estudio$pea0$, $pea0$Todas las carreras y los planes de estudios son aprobados por el Consejo Superior, para su posterior presentación al Ministerio de Educación de la Nación. Sus aprobaciones definitivas se realizan m…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-1-planes-de-estudio el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 14 | GESTIONES ADMINISTRATIVAS

En el presente capítulo se establecen las gestiones administrativas de la Universidad, la política de

becas y aranceles de todas las carreras y modalidades de cursado.

### 14.1 PLANES DE ESTUDIO

Todas las carreras y los planes de estudios son aprobados por el Consejo Superior, para su posterior presentación al Ministerio de Educación de la Nación. Sus aprobaciones definitivas se realizan mediante Resoluciones Ministeriales y se establecen así las condiciones que deben satisfacer al alumnado para alcanzar sus títulos. Se define, también, el número de créditos que se deben cubrir para obtener un título.

Los créditos de cada materia son equivalentes a la cantidad de horas semanales que tiene la asignatura.

Es política de la Universidad Siglo 21, regulada por Resolución Rectoral 2821/2018, mantener actualizados sus planes de estudio, pudiendo producirse modificaciones sobre los mismos durante el transcurso del dictado de las diferentes carreras, en función de los procesos de autoevaluación y/o acreditación por los cuales atraviesen las diferentes ofertas académicas. En tal caso quienes cursen en la universidad deben considerar que:

- Al entrar en vigencia un nuevo plan de estudios, el plan anterior podrá ser conservado por un período de tiempo igual al de la duración teórica de la carrera más un año. Finalizado dicho período se dará por finalizado el dictado de las materias correspondientes al anterior plan de estudios.
- La universidad se reserva el derecho de migrar al nuevo plan de estudios vigente a quienes, habiendo iniciado el cursado de la carrera con un plan anterior, no haya concluido sus estudios dentro del período de mantención del plan no vigente, mencionado en el punto 1.
- Quienes resultaren transferidos al nuevo plan de estudios, como consecuencia de lo establecido en el punto 2, deberán realizar todas las materias comprendidas en el nuevo plan vigente, aunque éstas no hayan estado comprendidas en el plan de estudios originario.
- La Universidad otorgará la equivalencia directa y automática de aquellas materias del plan no vigente que también se encuentren contempladas en el nuevo plan de estudios. Las materias aprobadas en el plan anterior, que no pertenecen al nuevo plan, podrán ser consideradas como electivas en el plan nuevo.
- Cuando entra en vigencia un nuevo plan de estudios y responda a la necesidad de adecuar el plan vigente a los estándares mínimos requeridos en el marco de un proceso de autoevaluación, la Universidad podrá determinar la migración de los/as alumnos/as que se encuentre cursando la carrera con un plan anterior, al nuevo plan de estudios, sin considerar el período de conservación del plan anterior, establecido en punto 1.
- Siempre que, en el marco de la normativa institucional vigente, se realice migración de los/as alumnos/as de un plan no vigente a un nuevo plan de estudios, la Universidad establecerá un plan de transición mediante el cual se determinen los mecanismos operativos que se utilizarán para la desactivación del plan no vigente y los alcances de la migración de los/las estudiantes a un nuevo plan, atendiendo al grado de avance de las diferentes cohortes de manera tal que no exista dilación en la titulación.
- Lo establecido en los puntos 1 y 2 alcanzará también a quienes han permanecido inactivos (sin actividad académica) por más de un período de cursado, y por ello no han finalizado la carrera dentro del plazo establecido; quien quisiera retomar el cursado será migrado al plan vigente de la carrera, sin posibilidad de continuar el cursado en su plan de origen.

14$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-1-planes-de-estudio$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-14$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 2, $pea0$rg-14-2-cambios-de-modalidad$pea0$,
        $pea0$Cambios de modalidad$pea0$, $pea0$Podrán solicitar cambios de Modalidad, de Carrera, o de otra índole en los períodos definidos para cada tipo de gestión en el calendario de trámites publicado anualmente por la Secretaría de Organi…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-2-cambios-de-modalidad el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 14 | GESTIONES ADMINISTRATIVAS

### 14.2. CAMBIOS DE MODALIDAD

#### 14.2.1. GENERALIDADES

Podrán solicitar cambios de Modalidad, de Carrera, o de otra índole en los períodos definidos para cada tipo de gestión en el calendario de trámites publicado anualmente por la Secretaría de Organización Académica. Para ello deberá cumplir con las condiciones y requisitos vigentes al momento del cambio.

Si bien para realizar el cambio de modalidad/carrera, no es necesario tener Universitario 21 aprobado, como tampoco es requisito tener materias aprobadas del plan de estudios, quien se encuentre interesado deberá previamente verificar la condición en que quedarán sus materias al realizarse el pase.

Las materias regularizadas en la modalidad/carrera de origen, que pasen en la misma condición a la modalidad/carrera destino se rinden, en todos los casos, bajo las condiciones de calificación y metodología de evaluación de la modalidad de destino.

Las materias aprobadas y reprobadas pasan en igual condición a la nueva modalidad. Lo mismo ocurre con las sanciones disciplinarias que pueda registrar el alumno.

Siempre que se realice un cambio a modalidad ED (cualquiera sea la modalidad origen), o que se realice un cambio de CAU, será exclusiva responsabilidad de cada estudiante contactar al CAU de destino para asegurar su lugar en el mismo ya que no en todos los CAUs se ofrecen todas las carreras o todas las materias.

#### 14.2.2. CONDICIONES PARA EL CAMBIO DE MODALIDAD/CARRERA

Para quienes deseen realizar un cambio de modalidad/carrera deberán encontrarse en la siguiente condición:

- Cumplir las condiciones de ingreso de la nueva modalidad.
- Presentar libre deuda administrativa.
- No estar inscripto a una mesa de examen final.
- No tener una nota de examen final faltante o pendiente de carga.
- Para el cambio de modalidad es requisito no haber realizado más de 2 (dos) pases entre diferentes modalidades (PH/MP/PD a ED/EDH o viceversa).
- Para el cambio entre sub-modalidades presenciales, será requisito que la persona solicitante haya permanecido al menos un cuatrimestre completo de cursado en su modalidad de origen.
- Tener completa la documentación obligatoria del legajo.
- Haber aceptado al momento del pase las condiciones del presente reglamento y expresamente las condiciones académicas y administrativas de la nueva modalidad que se encuentren vigentes.

#### 14.2.3. REGULARIDAD Y CURSADO DE LAS MATERIAS

Cuando un cambio de modalidad implique la actualización del plan de estudios la persona solicitante deberá cursar las materias que corresponden al nuevo plan en la modalidad destino, aun cuando ello signifique cursar nuevas materias que no estaban contenidas en el plan de origen, aplicándose lo establecido en la sección 14.1 Planes de Estudio.

En tal sentido, será responsabilidad de cada estudiante que solicite cambio de modalidad, interiorizarse sobre la vigencia de su plan de estudios actual, antes de realizar el pase.

Respecto a la condición que adoptan las materias al realizarse el pase, dependerá de la condición que la misma tenga en la modalidad de origen, aplicándose las siguientes reglas:

**Reglas comunes a todos los cambios de modalidad:**

- Las materias que se encuentran en estado “cursando” pierden dicha condición, quedando en condición “Libre por Pase” en la modalidad destino.
- Las materias en condición “Libre por Nota”, en todos los casos de pases, se pierde, quedando en estado “Libre por Pase” que implica recursar la materia.
- Las materias en condición Regular, en todos los casos, conservan el mismo estado en la modalidad destino, debiendo rendir cada estudiante bajo las condiciones de evaluación de la modalidad de destino.
- Las materias en condición Aprobado, en todos los casos, conservan el mismo estado en la modalidad destino.

#### 14.2.4. RESPECTO DE LAS MATERIAS DE UNIVERSITARIO 21

Quien realiza un cambio de modalidad y/o carrera y tenga las materias de Universitario 21 aprobadas mantiene tal condición en la modalidad de carrera/destino.

Para el resto de las condiciones se aplicarán las mismas reglas que para las materias curriculares del plan de estudio, conforme lo establecido en la sección precedente.

Las materias de Universitario 21 en condición “regular” mantienen el estado en caso de pase de modalidad y/o carrera.

#### 14.2.5. RESPECTO DE LAS MATERIAS DE PROCESO

La condición de las Materias de Proceso se mantiene o se pierde según lo detallado a continuación:

- Las materias de proceso que se encuentran en estado “cursando” pierden dicha condición, quedando en condición “Libre por Pase” en la modalidad destino.
- Las materias de proceso en estado APROBADO en la modalidad de origen conservan esa condición en la modalidad de destino.
- Las materias de proceso en estado REGULAR en la modalidad de origen conservan esa condición en la modalidad destino.
- La condición de las materias Seminario de Práctica o Seminario de Planificación y Control de Gestión se pierde frente a un pase entre modalidades y sub-modalidades, solo se conserva la condición de REGULAR en los casos que se realice un pase de sub-modalidad ED a EDH o viceversa.

- Estudiante Presencial (P), Presencial Home (PH.) y Presencial Distribuida (PD) que tenga el Seminario de Práctica/Seminario de Planificación y Control de Gestión en estado REGULAR por adeudar materias correlativas deberá aprobar las materias correlativas para poder adquirir la condición de Aprobado antes de hacer pase de modalidad a otra sub-modalidad o modalidad.
- Estudiante ED/EDH que tenga el Seminario de Práctica/Seminario de Planificación y Control de Gestión en estado REGULAR deberá rendir el examen EFIP I para aprobar la materia antes de hacer el pase a modalidad Presencial (MP) o Presencial Home (PH), aun cuando posea 21 o más materias aprobadas, de lo contrario perderá la regularidad debiendo recursar y aprobar la materia en la nueva modalidad.

**Nota:** La condición REGULAR del SEMINARIO FINAL se mantiene en todos los casos.

#### 14.2.6. RESPECTO DE LOS IDIOMAS

Si la persona solicitante ha cursado materias de idiomas, y las mismas se encuentran en estado “regular” o “cursando”, al realizar el pase pierde ambas condiciones y acepta la nueva propuesta de formación en idiomas de la Universidad mediante la Plataforma Multimedia de idiomas.

Debe cursar y finalizar sus idiomas extranjeros a través de la plataforma Multimedia, de acuerdo a lo previsto en el presente Reglamento. Sólo conserva el estado de las materias “APROBADAS”.

#### 14.2.7. RESPECTO DEL EFIP (EXAMEN FINAL INTEGRADOR PRESENCIAL) I Y II

Características, cursado, examen EFIP I y II, ver Capítulo 3.5.11.

**EFIP I**

Pase de Modalidad Presencial (PH, PD y P) a Modalidad Distancia (MD).

Si al momento del pase, tiene 21 (veintiuno) o más materias aprobadas en Modalidad Presencial, sea por promoción, examen final o equivalencia (se contabilizan cada uno de los niveles de idiomas aprobados y no se contabilizan materias electivas, ni materias Universitarios 21) que corresponden al primer tramo de la carrera, se exime de rendir EFIP I en modalidad distancia.

En las carreras que no tienen módulo cursado de EFIP I, el Seminario de Práctica o Seminario de Planificación y Control de Gestión debe estar dentro de las 21 materias aprobadas al momento de realizarse el pase para que se aplique la eximición, caso contrario el alumno deberá cursar la materia y rendir el EFIP I en la modalidad destino.

Pase de Modalidad Distancia (MD) a Modalidad Presencial (PH, PD y P).

Si al momento del pase, tiene 21 (veintiuno) o más materias aprobadas en modalidad distancia, sea por promoción, examen final o equivalencia, que correspondan al primer tramo de la carrera (sin contabilizar materias electivas, ni materias de CN o Universitario 21), debe rendir EFIP I antes de efectuar el pase.

En ambos casos, se entiende por “primer tramo de la Carrera” al conjunto de materias curriculares comprendidas en el primer y el tercer año del Plan de Estudios (del 1º al 6º semestre).

**EFIP II**

Pase de Modalidad Presencial (PH, PD y P) a Modalidad Distancia (MD).

Si al momento del pase, tiene pendiente aprobar 5 (cinco) o más materias del último año de su carrera (sin contemplar el Seminario Final), al pasar a modalidad distancia deberá rendir EFIP II.

Pase de Modalidad Distancia (MD) a Modalidad Presencial (PH, PD y P).

El pase se podrá realizar siempre que la persona solicitante haya aprobado hasta 4 (cuatro) materias, sea por promoción, examen final o equivalencia del último año de su carrera (sin contemplar Seminario Final) en modalidad distancia, resultando eximido de EFIP II al realizarse el pase.

En caso de superar esa cantidad de materias aprobadas en modalidad distancia, no se podrá realizar el pase de modalidad, debiendo el alumno finalizar el cursado en su modalidad actual.

En ambos casos, la aprobación de EFIP II es condición previa para realizar la defensa oral del Trabajo Final de Graduación (TFG) y obtener el título de grado que otorga la Universidad, en la modalidad de destino.

En aquellos casos en que corresponde la eximición de EFIP I o II, dicha eximición se limita a los mismos y no se hace extensiva al cumplimiento de las demás correlatividades establecidas de acuerdo al Plan de Estudios de la carrera.

| Modalidad Origen | Modalidad Destino | 1er al 6to semestre | Condición EFIP I |
| --- | --- | --- | --- |
| Presencial | Distancia | 21 o más materias aprobadas en Presencial incluido el Seminario de Práctica / Seminario de Práctica y Control de Gestión | Eximido de EFIP I |
| Hasta 20 materias aprobadas en Presencial | Rinde EFIP I |  |  |
| Distancia | Presencial | 21 o más materias aprobadas en Distancia | Rinde EFIP I |
|  |  | Hasta 20 materias aprobadas en Presencial | Eximido EFIP I |
| Modalidad Origen | Modalidad Destino | 7mo al 8vo semestre | Condición EFIP II |
| Presencial | Distancia | Restan aprobar 5 o más materias en Distancia después del pase | Rinde EFIP II |
| Restan aprobar 4 o menos materias en Distancia después del pase | Eximido EFIP II |  |  |
| Distancia | Presencial | 5 o más materias aprobadas en Distancia | Inhibido de hacer pase de modalidad |
| Hasta 4 materias aprobadas en Distancia | Eximido EFIP II |  |  |

14$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-2-cambios-de-modalidad$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-14$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 3, $pea0$rg-14-3-becas-y-beneficios$pea0$,
        $pea0$Becas y beneficios$pea0$, $pea0$Las ayudas económicas para estudiantes que otorga la Universidad se asignarán de acuerdo con las normas y criterios establecidos por Resolución del Consejo Superior N° 1040/2022, debiendo estar sus…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-3-becas-y-beneficios el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 14 | GESTIONES ADMINISTRATIVAS

### 14.3. BECAS Y BENEFICIOS

#### 14.3.1. CONSIDERACIONES GENERALES

Las ayudas económicas para estudiantes que otorga la Universidad se asignarán de acuerdo con las normas y criterios establecidos por Resolución del Consejo Superior N° 1040/2022, debiendo estar sus requisitos y dictámenes de otorgamiento presididos por criterios de justicia, transparencia, equidad y objetividad, teniendo por finalidad facilitar la iniciación y prosecución de los estudios de los alumnos de la Universidad Siglo 21.

La Universidad Empresarial Siglo 21 denomina:

- **Ayudas económicas:** a las diferentes tipologías de apoyo monetario con fines académicos que permiten a sus destinatarios cubrir el costo de rubros inherentes a su formación superior, capacitación, especialización y/o perfeccionamiento. Se consideran ayudas económicas a las Becas y Beneficios, quedando excluidas de dicha categoría las denominadas “promociones” que implican el mejoramiento en las condiciones regulares de pago y pueden ofrecerse a los estudiantes en función de diferentes condiciones que son a exclusivo criterio de la Universidad, con la finalidad de incentivar la continuidad académica.
- **Beca**: al apoyo económico que se otorga con la finalidad de facilitar el acceso y/o continuidad de estudio universitario a aquellos alumnos que demuestran un buen nivel académico, regularidad en su estudio y que carecen de recursos económicos suficientes. Las becas, pueden ser parciales o totales y siempre están asociadas al mérito; para su otorgamiento se tendrá especialmente en cuenta el rendimiento y regularidad académica del becario.
- **Beneficio:** a una mejora económica que se brinda a los estudiantes sobre el costo de sus estudios, en razón de encontrarse en determinada situación o poseer determinada cualidad a la cual el beneficio se encuentra condicionado. Se otorgan teniendo en cuenta circunstancias diversas, sin consideración de las condiciones académicas; con excepción de los Beneficios a la Comunidad Educativa, en los que el rendimiento académico determinado en cada caso es obligatorio para acceder al mismo.

Se denomina **Promoción** al mejoramiento en las condiciones regulares de pago y se puede ofrecer a los estudiantes en función de diferentes condiciones que son a exclusivo criterio de la Universidad, con la finalidad de incentivar la continuidad académica.

En todos los casos las ayudas económicas (becas y beneficios) son válidas por un semestre; entran en vigencia desde su otorgamiento y por ningún motivo tienen carácter retroactivo. Su renovación para un nuevo semestre será a requerimiento del interesado siempre que se mantengan las condiciones que lo habilitan para acceder a las mismas y estará sujeta a la aprobación por parte de la Universidad, constituyendo un beneficio personal e intransferible.

Las diferentes Ayudas Económicas (becas y beneficios) no son acumulables entre sí y resultan incompatibles con cualquier otro tipo de ayuda económica que reciba el solicitante, de entidades públicas o privadas. En caso de calificar para más de una categoría de ayuda, se aplicará aquella que sea más provechosa para el estudiante. Las promociones, en cambio, sí pueden resultar acumulables con alguna de las categorías de becas o beneficios, según los criterios que se hayan definido para su aplicación, aplicándose siempre, primero el descuento correspondiente a la beca o beneficio y luego, la promoción.

La aplicación de ayudas económicas para estudiantes de Ciclos de Complementación curricular se regirá siempre por las reglas establecidas en este reglamento, quedando restringida expresamente la posibilidad de otorgar becas o beneficios al 100% o cualquier otra beca o beneficio excepcional o extraordinaria.

#### 14.3.2. ESPECIFICACIONES DEL TRÁMITE DE LAS AYUDAS

#### ECONÓMICAS

****

Las solicitudes de Becas deberán ser presentadas por las personas interesadas cumpliendo los requisitos previstos para cada categoría en el presente reglamento. Las solicitudes de becas que presenten deficiencias o se encuentren incompletas en el cumplimiento de los requisitos definidos serán rechazadas.

Los plazos de postulación y evaluación serán los siguientes:

Primer semestre:

- Apertura de postulaciones: 1 de Octubre del año anterior.
- Cierre de postulaciones: 1 de Enero del año de cursado.
- Fecha máxima de Confirmación del resultado a brindar por la Universidad: 1 de Febrero del año de cursado.

Segundo semestre:

- Apertura de postulaciones: 1 de Abril del año de cursado.
- Cierre de postulaciones: 1 de Julio del año de cursado.
- Fecha máxima de Confirmación del resultado a brindar por la Universidad: 20 de Julio del año de cursado.

La Universidad publicará anualmente, las distintas Becas definidas en el presente reglamento, con el detalle completo de sus requisitos y la documentación a cumplimentar, de manera tal que las personas interesadas cuenten con la toda la información necesaria para realizar su postulación dentro del plazo definido para cada semestre.

La persona interesada deberá indicar en la solicitud la beca a la que desea aspirar y adjuntar toda la documentación correspondiente a cada caso. Los datos e información consignados en las solicitudes de Ayuda Económica tendrán el carácter de declaración jurada y su falsedad hará pasible al firmante de las sanciones administrativas, académicas, civiles y penales que pudieran corresponderle.

Finalizado el período de admisión de las postulaciones, la Universidad informará a las personas solicitantes el resultado final de su postulación en los siguientes 20 días corridos, a través del correo electrónico institucional.

La presentación de la solicitud importará el conocimiento y aceptación del presente Reglamento y el compromiso de cumplimiento de las obligaciones que de él resulten. La permanencia de las condiciones que hubieren justificado el otorgamiento de la Ayuda Económica será condición indispensable para el mantenimiento de la misma.

La Universidad podrá constatar y auditar por muestreo las informaciones suministradas en las solicitudes, pudiendo requerir, en caso que lo considere necesario, mayor información por parte de los solicitantes o consultas a organismos públicos o empleadores con la finalidad de certificar las constancias presentadas.

Si se comprobare que un estudiante ha obtenido una ayuda económica (beca o beneficio) mediante información o documentación falsa, se suspenderá inmediatamente su aplicación, quedando su titular obligado a la inmediata restitución de la suma que se le hubiere liberado, quedando inhabilitado de manera definitiva para acceder a becas y/o beneficios por parte de la Universidad.

#### 14.3.3. OBLIGACIONES Y DERECHOS DE LOS ESTUDIANTES

Las personas beneficiarias deberán informar a la Secretaría de Organización Académica cualquier variación en su situación económica o en su condición de estudiante. El incumplimiento de esta obligación se considerará una falta que podría ser pasible de una medida disciplinaria conforme el régimen de sanciones vigente.

En caso de solicitar renovación, los estudiantes podrán continuar gozando de la beca en la medida en que cumplan con las condiciones establecidas y se encuentren dentro del orden de mérito que establece el Vicerrectorado de Gestión Institucional. La adjudicación de la misma estará condicionada a la disponibilidad de cupo y a la conducta del alumno, quedando inhabilitados para recibir Beca quienes posean una sanción disciplinaria en firme.

#### 14.3.4. LAS CATEGORÍAS DE AYUDA ECONÓMICA

Las Ayudas Económicas que brinda la Universidad son:

**BECAS ACADÉMICAS**

- Beca por Alto Rendimiento Académico.
- Becas para el mejor promedio de cada Colegio Secundario.
- Proyectos Institucionales.

**BECAS DE AYUDA ECONÓMICA**

a.Becas para talentos en situación vulnerable.

**BECAS SOCIALES**

- Beca la Universidad es Posible.
- Beca CAU Maldonado.
- Beca Abra Pampa.
- Beca CAU Asunción.
- Beca Ex Combatiente o Veteranos de Guerra de Malvinas e Hijos.

**BENEFICIOS**

- Beneficio a Ingreso y/o Incentivo al Rendimiento Académico.
- Beneficios por familiar directo e hijos de egresados.
- Beneficios por Segunda Carrera.
- Beneficio por Doble Titulación.
- Beneficios por convenio con Empresas o Instituciones Amigas.
- Beneficios a la Comunidad Educativa.
- Beneficios para alumnos deportistas federados.
- Beneficios para proveedores estables.
- Beneficio para egresados de Institutos que funcionan como CAU.
- Beneficio Persistencia a la Graduación.
- Garantía de Adaptación.
- Seguro de continuidad.

#### 14.3.5. DISPOSICIONES PARTICULARES

#### A) DE LAS BECAS

El Vicerrectorado de Gestión Institucional establecerá, para cada semestre, los cupos disponibles para el otorgamiento de cada categoría de Becas, las cuales serán asignadas por orden de presentación de la solicitud cumplimentando todos los requisitos de cada tipo de beca conforme a lo establecido en este Reglamento. Asimismo, serán valoradas las solicitudes de acuerdo al orden de mérito en función del rendimiento académico y la condición socioeconómica de la persona solicitante, según la tipología de la que se trate.

El cupo establecido para cada semestre no obliga al Vicerrectorado de Gestión Institucional a agotar todos los cupos disponibles, pero sí estará compelido a no superar la cantidad de becas establecidas para cada categoría, quedando a su exclusivo criterio la aprobación de su otorgamiento, resultando sus dictámenes vinculantes e inapelables.

Para aspirar a una Beca Académica se deberá presentar la siguiente documentación:

- Personas Ingresantes:    DNI (frente y dorso).o Analítico de estudios secundarios legalizado.   Carta manuscrita del solicitante explicando por qué considera ser merecedor de la beca.

- Personas Reinscriptas:    DNI (frente y dorso).  En su primera postulación: Carta manuscrita del solicitante explicando por qué considera ser merecedor de la beca.

El desempeño académico de cada estudiante será determinado teniendo en cuenta su promedio, contemplando aplazos y la regularidad académica.

El desempeño académico mínimo requerido para cualquier otorgamiento de Beca es un promedio general de 8 (ocho) incluyendo aplazos, como así también no poseer sanciones graves, muy graves o gravísimas firmes en su legajo.

Las personas beneficiarias deberán informar a la Secretaría de Organización Académica cualquier variación en su situación económica o en su condición de estudiante. El incumplimiento de esta obligación se considerará una falta que podría ser pasible de una medida disciplinaria conforme el régimen de sanciones vigente.

En caso de solicitar la renovación, las personas interesadas podrán continuar gozando de la beca en la medida en que cumplan con las condiciones establecidas y se encuentren dentro del orden de mérito que establece el Vicerrectorado de Gestión Institucional. La adjudicación de la misma estará condicionada a la disponibilidad de cupo y a la conducta de la persona solicitante, quedando inhabilitados para recibir una Beca quienes posean una sanción disciplinaria firme.

Las personas solicitantes que hayan sido beneficiarias con una beca académica o económica, sin distinción de modalidad de estudio, deberán retribuir la ayuda recibida mediante la realización de tareas de la Universidad que le sean asignadas durante el semestre, conforme a la siguiente metodología.

Las personas beneficiarias con becas del 70% de aranceles deberán cumplir 10 horas semanales de apoyo a las actividades de la Universidad; con un 50%, 8 horas; y con 30%, 4 horas.

Tales actividades no implicarán relación laboral alguna.

En todos los casos será el Vicerrectorado de Gestión Institucional el encargado de asignar a la persona becada las funciones que deberá desarrollar durante el semestre, las cuales podrán ser presenciales (para estudiantes de Córdoba y Ciudad Autónoma de Buenos Aires) o remotas (para estudiantes del resto del país) y serán notificadas expresamente a la persona solicitante durante la primera semana del período lectivo correspondiente.

El Vicerrectorado de Gestión Institucional tendrá a cargo el control y el seguimiento en el cumplimiento de las funciones que se le asignaren al becario. El incumplimiento a las tareas asignadas, sin justa causa, autorizará a la Universidad a dejar sin efecto la beca, o, en su caso, según las circunstancias evaluar la procedencia de otra categoría de ayuda económica que no requiera el cumplimiento de horas.

#### BECAS ACADÉMICAS

#### BECAS POR ALTO RENDIMIENTO ACADÉMICO

Podrán aplicar a esta beca quienes aspiren a cursar una carrera de Grado o Pregrado, en cualquiera de las modalidades de estudio. Se considerará para su otorgamiento haber obtenido como promedio requerido el correspondiente al último año de cursado del Nivel Medio, incluyendo aplazos, el cual deberá ser igual o mayor a 8 (ocho).

La regularidad académica requiere el haber finalizado sus estudios secundarios dentro de los últimos 5 (cinco) años anteriores a su postulación.

Asimismo, podrán aspirar a esta beca aquellas personas que se encuentran cursando una carrera de Grado o Pregrado, en cualquiera de las modalidades de estudio. Para acceder a esta beca, la persona aspirante deberá cumplimentar un promedio igual o mayor a 8 (ocho) incluyendo aplazos, durante el último semestre de cursado.

Se establece como regularidad académica mínima para aplicar a la beca el haber aprobado al menos 2 (dos) materias en el período anterior a la fecha de aplicación.

En el caso de resultar aprobada la solicitud por parte del Vicerrectorado de Gestión Institucional, la beca consistirá en una disminución del 30% sobre los aranceles generados para el semestre, quedando excluido del descuento de cualquier otro rubro o concepto

#### BECAS AL MEJOR PROMEDIO DE CADA ESCUELA SECUNDARIA

Podrán aspirar a esta beca todas aquellas personas que aspiren a ingresar a una carrera de Grado o Pregrado, en cualquier modalidad de estudio, y acrediten:

- Ser estudiante del último curso de estudios de nivel medio o polimodal de cualquier institución o haber egresado con el título correspondiente de alguna de dichas instituciones en el año inmediatamente anterior para el cual aplique a la beca.
- Haber tenido en esos estudios, durante el último año de cursado, un promedio académico no inferior a 8 (ocho) puntos, incluyendo aplazos.
- Haber tenido una trayectoria académica sobresaliente, requisito que deberá ser acreditado mediante la recomendación de la persona a cargo de la Dirección del Colegio o equivalente, de la institución.
- Haber sido reconocido como mejor promedio de la promoción, lo cual deberá ser acreditado mediante el certificado emitido por la Institución.

La beca consistirá en una disminución del 50% sobre los aranceles generados para el semestre, quedando excluido del descuento de cualquier otro rubro o concepto.

La renovación de la beca estará sujeta a la mantención de las condiciones de cada tipología de beca.

#### BECAS POR PROYECTOS INSTITUCIONALES

Estas son otorgadas por la Universidad en el marco de sus actividades académicas especiales, eventos académicos o programas de incentivo académico, quedando a su criterio la aplicación, porcentajes y condiciones de renovación.

Todo otorgamiento de este tipo de Becas deberá ser formalizado mediante Resolución Rectoral.

#### BECAS ECONÓMICAS

#### BECAS PARA TALENTOS EN SITUACIONES DE VULNERABILIDAD

Podrán aspirar a esta beca todas las personas aspirantes a cursar carreras de grado y pregrado, en cualquier modalidad de estudios, que acrediten:

- Ser estudiantes del último curso de estudios de nivel medio o polimodal en cualquier institución educativa de nivel medio del país, o haber egresado con el título correspondiente de alguna de dichas instituciones.
- Haber obtenido durante el último año de cursado de los estudios secundarios o polimodal, un rendimiento académico sobresaliente con promedio no inferior a 8 (ocho) puntos.
- No tener, al momento de aplicar a la beca ninguna materia en situación de rendir coloquio o en condición de libre.
- Haber tenido una trayectoria académica sobresaliente, requisito que deberá ser acreditado mediante la recomendación de la persona a cargo de la Dirección del Colegio y al menos dos docentes de la institución.
- Pertenecer a un grupo vulnerable social o económicamente, situación que deberá ser comprobable.

Quien sea estudiante reinscripto en una carrera de Grado o Pregrado podrá aspirar a esta beca, siempre que hubiera obtenido durante el último semestre de cursado, un rendimiento académico sobresaliente con promedio no inferior a 8 (ocho) puntos y haber aprobado al menos 2 (dos) materias en dicho período, no poseer sanciones académicas graves, muy graves o gravísimas.

Se deberá presentar la siguiente documentación, para que la Universidad pueda acreditar la situación de vulnerabilidad económica:

- Los ingresos del grupo familiar.
- Los egresos del grupo familiar.
- La cantidad de integrantes del grupo familiar menores de edad y las personas con discapacidad.
- La condición de actividad del principal perceptor de ingresos del grupo familiar, priorizando aquellos que se encuentren desocupados o subocupados.
- La situación jurídica del inmueble que habilita la persona postulante, priorizándose los supuestos en que el inmueble no sea propio o se encuentre hipotecado.
- El nivel de instrucción alcanzado por los padres.
- La cobertura de salud de la persona solicitante.
- El lugar de procedencia de la persona solicitante.
- Hoja de vida del postulante.
- Carta manuscrita del postulante explicando los motivos por los cuales considera merecer la beca
- Carta de recomendación de un referente externo (no familiar) que brinde referencias sobre su desempeño en ámbitos profesionales, laborales o académicos.

A los efectos de determinar quiénes serán las personas adjudicatarias de estas becas, se realizará una ponderación de los aspectos evaluables, de acuerdo a los siguientes parámetros de calificación:

- Hoja de vida: 30% del total.
- Referencias Académicas: 30% del total.
- Exposición de motivos y evaluación de su situación personal: 40% del total.

La beca consistirá en:

- Una bonificación del 50% (cincuenta) sobre los conceptos de matrícula y aranceles a quienes cuenten con un promedio de 8 (ocho) o superior y situación de vulnerabilidad económica verificada, durante el semestre para el que se postula.
- Una bonificación del 70% (setenta) sobre los conceptos de matrícula y aranceles a quienes acrediten una situación de vulnerabilidad económica verificada y de acuerdo al orden de mérito y evaluación que realice la Universidad, a su absoluto criterio y definición, durante el semestre para el que se postula.

La mantención de la beca estará sujeta al cumplimiento de las condiciones establecidas en el artículo anterior por las cuales fue otorgada la beca, y además deberá:

- Aprobar todas las materias del plan de estudio dentro del período de regularidad establecido por el reglamento institucional para la modalidad de cursado.
- Cumplir con lo establecido en el Artículo 23 de la presente resolución.
- No poseer sanciones disciplinarias tipificadas como graves, muy graves o gravísimas, conforme al Régimen Disciplinario vigente.

#### BECAS SOCIALES

#### BECAS LA UNIVERSIDAD ES POSIBLE

Podrán acceder a esta beca las personas aspirantes a cursar carreras de Grado o Pregrado de todas las modalidades de estudio que cuenten con el aval de una ONG que será responsable del acompañamiento de la persona solicitante a lo largo de su vida académica.

Para que se considere acreditada tal condición se requiere que la solicitud de la beca sea realizada de manera directa por la ONG que apoya a la persona beneficiaria, a través de una carta dirigida a la Universidad, adjuntando la documentación que permita conocer los motivos de su recomendación, el desempeño académico anterior del solicitante, los antecedentes laborales si los tuviera y/o situación económica actual del postulante y su grupo familiar.

El beneficio consiste en una disminución del 100% en la matrícula y aranceles de la carrera que curse la persona solicitante. Encontrándose limitado al cupo que anualmente la Universidad establezca.

La renovación de la beca para cada semestre de cursado estará sujeta a un grado de avance que consista en la aprobación anual de al menos el 50% de las materias de su plan de estudios.

#### BECAS CAU MALDONADO

Podrán acceder a esta beca estudiantes que residan de forma permanente dentro del ejido comprendido por los barrios: Campo de la Ribera, Barrio Maldonado, Müller, Renacimiento, Colonia Lola y su zona de influencia de la ciudad de Córdoba y aspiren a cursar carreras de Grado o Pregrado en Modalidad Distancia.

Las personas solicitantes deberán acreditar:

- Domicilio en zona de influencia, mediante certificado de domicilio y un impuesto/servicio a nombre de la persona solicitante o familiar directo.

El beneficio consiste en una disminución del 100% en la matrícula y aranceles durante la duración de la carrera que cada estudiante curse. Encontrándose limitado al cupo que anualmente la Universidad establezca.

La renovación de la beca para cada semestre de cursado estará sujeta a un grado de avance que consista en la aprobación anual de al menos el 30% de las materias de su plan de estudios. El comité que realiza el acompañamiento, liderado por el Centro de Sustentabilidad, podrá decidir la renovación del beneficio, aunque no se cumpliere la condición de renovación en caso de que existan antecedentes que así lo justifiquen.

#### BECAS CAU ABRA PAMPA

Podrán acceder a esta beca estudiantes qué siendo originarios de la localidad de Abra Pampa, provincia de Jujuy, cursen su carrera en el Centro de Apoyo Universitario Warma de la misma ciudad.

El beneficio consiste en una disminución del 100% en la matrícula y aranceles durante la duración de la carrera que cada estudiante curse, aplicando únicamente para las carreras de Abogacía, Contador Público, Licenciatura en Administración de Empresas, Licenciatura en Administración

Agraria, Tecnicatura en Seguridad e Higiene Laboral, y Martillero, Corredor Público y Corredor Inmobiliario. Encontrándose limitado al cupo que anualmente la Universidad establezca.

La renovación de la beca para cada semestre de cursado estará sujeta a un grado de avance que consista en la aprobación anual de al menos el 30% de las materias de su plan de estudios. El comité que realiza el acompañamiento, liderado por el Centro de Sustentabilidad, podrá decidir la renovación del beneficio, aunque no se cumpliere la condición de renovación en caso de que existan antecedentes que así lo justifiquen.

#### BECAS CAU ASUNCIÓN

Podrán acceder a esta beca estudiantes que residan de forma permanente dentro del ejido Comuna de Asunción (Mendoza) y aspiren a cursar carreras de Grado o Pregrado en Modalidad Distancia. Las personas solicitantes deberán acreditar:

- Domicilio en zona de influencia, mediante certificado de domicilio y un impuesto/servicio a nombre de la persona solicitante o familiar directo.

El beneficio consiste en una disminución del 100% en la matrícula y aranceles durante la duración de la carrera que cada estudiante curse. Encontrándose limitado al cupo que anualmente la Universidad establezca.

La renovación de la beca para cada semestre de cursado estará sujeta a un grado de avance que consista en la aprobación anual de al menos el 30% de las materias de su plan de estudios. El comité que realiza el acompañamiento, liderado por el Centro de Sustentabilidad, podrá decidir la renovación del beneficio, aunque no se cumpliere la condición de renovación en caso de que existan antecedentes que así lo justifiquen.

#### BECA EXCOMBATIENTE O VETERANOS DE GUERRA DE MALVINAS E HIJOS

Se entiende por Ex combatiente o Veterano de Guerra de Malvinas a todos los ex soldados conscriptos, personal de Ofíciales, Suboficiales y Soldados de las Fuerzas Armadas y Fuerzas de Seguridad, que fueron destinados y/o entrado efectivamente en combate en las acciones bélicas llevadas a cabo en las jurisdicciones del Teatro de Operaciones Malvinas (TOM: desde el 2 hasta el 7 de abril de 1982) y del Teatro de Operaciones del Atlántico Sur (TOAS: desde el 7 de abril hasta el 14 de junio de 1982 ), y civiles que se encontraban cumpliendo funciones de servicio y/o apoyo, en los lugares en que se desarrollaron estas acciones.

Podrán ser adjudicatarios de la beca por Ex combatiente o Veterano de Guerra de Malvinas aquellas personas y sus familiares directos, que aspiren a cursar o se encuentren cursando carreras de Grado o Pregrado, en cualquiera de sus modalidades, que acrediten:

- La persona interesada deberá acreditar su inscripción en la Nómina de Veteranos de

Guerra de Malvinas, dependiente del Ministerio de Defensa de la República Argentina.

- En caso de solicitar el beneficio un familiar directo, deberá acreditar el vínculo directo con el Ex combatiente o Veterano de Guerra de Malvinas, mediante partida de nacimiento o libreta de familia.
- Haber obtenido un promedio con aplazos no inferior a 8 (ocho) puntos en las materias rendidas hasta ese momento.
- No contar con más de 2 (dos) aplazos.
- No haber merecido sanciones.

La beca consistirá en una disminución del 20% en el concepto de aranceles semestrales de la carrera que el alumno curse, quedando excluido del descuento de cualquier otro rubro o concepto. La renovación de esta beca estará sujeta a los cupos que establezca el Vicerrectorado de Gestión Institucional.

#### BECAS EXTRAORDINARIAS

Cualquier beca que no se encuentre contemplada anteriormente sólo podrá ser dispuesta y aprobada

por Presidencia y Rectorado de la Universidad, mediante acto administrativo correspondiente.

#### B) DE LOS BENEFICIOS

El otorgamiento de beneficios no está sujeto a la disponibilidad sino al cumplimiento de las condiciones requeridas para cada tipología

#### BENEFICIO DE INGRESO

Podrán aspirar al beneficio de ingreso, que representa un 10% de descuento sobre concepto de arancel semestral, todas aquellas personas solicitantes que ingresen a carreras de grado o pregrado, en cualquiera de sus modalidades y acrediten:

Ser estudiante del último curso de estudios de nivel medio o polimodal de cualquier institución del país o haber egresado con el título correspondiente de alguna de dichas instituciones.

Haber tenido en esos estudios un excelente rendimiento académico con promedio no inferior a siete (7) puntos, incluidos aplazos.

#### INCENTIVO AL RENDIMIENTO ACADÉMICO

Gozarán de este incentivo las personas cursantes de carreras de Grado y Pregrado, en cualquier modalidad, que cumplan los siguientes requisitos de rendimiento académico:

- Estudiantes de carreras de Grado que hayan aprobado 5 (cinco) o más materias en un mismo legajo, durante el período definido para cada semestre y con un promedio igual o mayor a 7 (siete).
- Estudiantes de carreras de Pregrado que hayan aprobado 4 (cuatro) o más materias en un mismo legajo, durante el período definido para cada semestre y con un promedio igual o mayor a 7 (siete).

Para el cálculo del promedio establecido en el artículo precedente, se tendrán en cuenta las notas de la totalidad de materias rendidas y/o aprobadas por promoción en cada uno de los períodos definidos a tal efecto, quedando excluidas las materias aprobadas de Universitarios 21 y las materias aprobadas por equivalencias externas e internas.

El incentivo consistirá en una disminución del 10% sobre los aranceles generados para el semestre inmediato posterior a cada período definido, quedando excluido del descuento cualquier otro rubro o concepto. Una vez cumplidos los requisitos y condiciones, será de aplicación automática, no siendo necesario el pedido de aplicación del mismo.

#### BENEFICIO POR FAMILIAR DIRECTO E HIJO DE EGRESADO

Se puede acceder a este beneficio en los siguientes casos:

- Cuando se encuentren inscriptos como estudiantes regulares en un mismo período más de un integrante del grupo familiar, sean esposos, padres, hijos o hermanos. Gozarán del beneficio todos los integrantes del grupo familiar, con excepción del miembro con el DNI más bajo.
- Aquellos estudiantes cuyo/a esposo/a, padre, madre, hijo/a o hermano/a haya egresado con un título de Grado de esta Universidad.

Para acceder al beneficio, la persona interesada deberá acreditar el vínculo mediante el certificado correspondiente (partida de nacimiento, libreta de familia, libreta de matrimonio, etc.).

El beneficio de familiar directo consiste en una disminución gradual y proporcional a la cantidad de miembros que se encuentren inscriptos, el cual será del 20% sobre aranceles del segundo miembro del grupo familiar, 30% sobre aranceles del tercer miembro del grupo familiar, 40% sobre aranceles del cuarto miembro del grupo familiar y 50% aranceles del quinto miembro del grupo familiar siendo este último el tope de otorgamiento.

Si la persona aspirante cursa 2 o más carreras, el beneficio aplica a todos los legajos, pudiendo alcanzar a carreras de Grado, Pregrado, Ciclos de Complementación Curricular y Posgrados (Maestrías y/o Especializaciones).

#### BENEFICIO POR SEGUNDA CARRERA

Pueden acceder a este beneficio aquellas personas egresadas de carreras de Universidad Siglo 21 de carreras de Grado o Pregrado que se encuentren cursando una segunda carrera en esta Universidad o bien estudiantes de Grado o Pregrado que se encuentren cursando dos o más carreras simultáneamente.

El beneficio consiste en una disminución del 20% sobre los aranceles semestrales de la segunda carrera. Aplica para carreras de Grado, Pregrado, Ciclos de Complementación Curricular y Posgrado (Maestría y/o Especializaciones).

Este beneficio no es aplicable para Doble Titulación.

#### BENEFICIO PARA PERSONAS EGRESADAS DE CARRERAS DE GRADO DE LA UNIVERSIDAD SIGLO 21.

Pueden acceder a este beneficio aquellas personas egresadas de carreras de Grado o Ciclos de Complementación de la Universidad Siglo 21 que cursaren una nueva carrera Grado o Posgrado en esta Universidad.

El beneficio consiste en una disminución del 30% sobre aranceles, para personas egresadas de carreras de Grado que continúen su formación profesional en una segunda carrera de Grado y/o Posgrado (Maestrías y/o Especializaciones).

Este beneficio, se incrementará a una disminución del 40% sobre aranceles, para las personas egresadas de carreras de Grado de la Universidad Siglo 21, que continúen su formación profesional en segundas carreras de Grado y/o Posgrados (Maestrías y/o Especializaciones), y previamente a su otorgamiento, hayan desarrollado y cumplimentado tareas de adscripción en docencia y/o investigación por el plazo mínimo de un año (1 año). La misma deberá encontrarse debidamente acreditada mediante acto administrativo correspondiente, manteniendo siempre un promedio de notas de 8 o más incluyendo aplazos, y no tenga sanciones.

Este beneficio no es aplicable para Doble Titulación.

#### BENEFICIO POR DOBLE TITULACIÓN

Pueden acceder a este beneficio quienes se encuentren cursando simultáneamente dos carreras de Grado que articulan por Doble Titulación.

El beneficio consiste en la bonificación de la matrícula para la carrera con la cual se articula, es decir que la persona beneficiaría abona sólo una matrícula para el semestre de cursado correspondiente. Cuando el beneficiario ya se haya egresado de la primera carrera de la doble titulación, se le aplicará el beneficio de la segunda carrera hasta que finalice la Doble Titulación.

#### BENEFICIO POR CONVENIOS CON EMPRESAS O INSTITUCIONES AMIGAS

Podrán gozar de este beneficio aquellas personas que se encuentren alcanzadas por algún convenio mantenido entre la Universidad y Empresas, Colegios u otras instituciones, siempre que cumplan con las condiciones que se establezcan a tal fin.

Para el caso de empresas amigas, podrán ser beneficiarios quienes trabajen y sean personal estable de alguna de las entidades con las que la Universidad mantiene convenio, situación que deberá acreditarse mediante la presentación de recibo de haberes.

El beneficio consistirá en una disminución del porcentaje acordado con cada empresa o institución amiga, sobre los aranceles semestrales de la carrera que curse la persona beneficiaria. Aplica para carreras de Grado, Pregrado, Ciclos de Complementación Curricular y Posgrados (Maestrías y Especializaciones).

#### BENEFICIO A LA COMUNIDAD EDUCATIVA

Podrán acceder al beneficio de comunidad educativa quienes se encuentren en las siguientes condiciones:

- Ser Docente, Directivo o Co-docente de la Universidad o de empresas relacionadas.
- Ser Familiar Directo (hijo/padre/cónyuge/hermano) de Docente, Directivo o Co-docente de la Universidad.
- Ser Coordinador, Tutor de Aprendizaje Universitario (TAP) o Personal de Informes de un Centro de Apoyo Universitario.
- No tener sanciones académicas.

A los efectos de determinar si se otorga el beneficio de comunidad educativa, se tendrá en cuenta que se trate de empleados estables, es decir no eventuales, independiente de la antigüedad que posean en la Universidad o Centros de Aprendizaje.

El beneficio de la comunidad se aplicará, según el promedio con aplazos obtenido por el beneficiario, de acuerdo a las siguientes disposiciones:

Para las personas contempladas en el inciso a.:

- Promedio igual o mayor a 7: Disminución del 75% sobre los conceptos de aranceles de carreras de Grado y Pregrado y conceptos de articulación.
- Promedio menor a 7: Disminución del 50% sobre los conceptos de aranceles de carreras de Grado y Pregrado y conceptos de articulación.

Para las personas contemplados en los incisos b y c:

- Promedio igual o mayor a 7: Disminución del 50% sobre los conceptos de aranceles de carreras de Grado y Pregrado.
- Promedio menor a 7: No aplica el beneficio.

Quienes se encuentren contemplados en el beneficio de doble titulación podrán acceder a un 50% de descuento sobre el arancel de Cursos correspondientes a la oferta de Cloud 21 (sin partner). Solo docentes, directivos y co-docentes podrán solicitar el beneficio para carreras de Posgrado o Extragrado en Modalidad Presencial o Blend, siendo en este caso aplicable un porcentaje de descuento del 20% sobre aranceles. En caso de dictarse el Posgrado o Extragrado en Modalidad Distancia será aplicable un porcentaje de descuento del 50% sobre aranceles.

Sin perjuicio de ellos, la Universidad podrá anualmente hacer convocatorias, con cupos determinados, otorgando un porcentaje superior con el cumplimiento de los requisitos que se establezcan en cada caso.

Quienes se encuentren en condiciones de acceder al Beneficio de Comunidad Educativa conforme a lo establecido deberán solicitar su aplicación en los plazos establecidos a tal efecto en caso de que correspondiera deberán acreditar el vínculo de familiar directo mediante las certificaciones pertinentes.

#### DEL BENEFICIO PARA ALUMNOS DEPORTISTAS

Podrán gozar de este beneficio únicamente aquellas personas ingresantes o reinscriptas de carreras de Grado o Pregrado en cualquier modalidad, que se encuentren federados en alguna asociación o federación deportiva nacional, situación que deberán acreditar presentando la documentación que certifique tal condición.

El beneficio consistirá en una disminución del 10% sobre los aranceles generados para el semestre, rigiendo al respecto lo normado por la presente Resolución.

La persona beneficiaria deberá permitir la difusión de imágenes en redes sociales de la Universidad como promoción y difusión de las diferentes actividades deportivas realizadas por la persona beneficiaria.

#### BENEFICIO PARA PROVEEDORES ESTABLES

Podrán acceder a este beneficio aquellas personas que trabajen o sean familiares directos de personal permanente de alguna de las entidades que son proveedores estables de la Universidad, es decir, aquellos que tengan una vinculación duradera, quedando excluidos los proveedores que prestan servicios de manera eventual. A los efectos de determinar si la persona interesada aplica al beneficio, se considera personal permanente los empleados que no sean eventuales, independientemente la antigüedad que posean.

Las personas interesadas en acceder a este beneficio deberán acreditar su condición de empleado mediante la presentación de recibo de haberes. Adicionalmente se deberá presentar constancia que acredite el vínculo para el caso de familiares directos.

El beneficio consistirá en una disminución del 20% sobre los aranceles semestrales que curse la persona beneficiaria. Aplica para carreras de Grado, Pregrado, Ciclos de Complementación Curricular y Posgrados (Maestrías y Especializaciones).

#### BENEFICIO PARA EGRESADOS DE INSTITUTOS CAU

Podrán acceder a este beneficio quienes acrediten ser estudiantes del último curso de estudios de nivel medio o polimodal de cualquier institución secundaria del país que funcione activamente como Centro de Apoyo Universitario.

El beneficio consistirá en una disminución del 10% sobre los aranceles semestrales de carreras de Grado.

#### BENEFICIO AMIGOS REFERIDOS

Podrán acceder al beneficio de amigo referidos aquellas personas aspirantes que mencionen en su inscripción o sean referidas por estudiantes de la Universidad Siglo 21.

El beneficio consistirá en una disminución para la persona aspirante del 10% sobre conceptos de aranceles del primer semestre de cursado y de un descuento del 5% sobre los aranceles del segundo semestre de su cursado.

La posibilidad de ser mencionado como estudiante referente por una persona aspirante se limita al máximo de 3 oportunidades.

Este beneficio se encuentra sujeto al cupo que asigne semestralmente el Vicerrectorado de Gestión Institucional, pudiendo el mismo deshabilitarse el beneficio por agotamiento del mismo.

#### BENEFICIO POR PERSISTENCIA A LA GRADUACIÓN

Este beneficio aplica para estudiantes de carreras de grado y pregrado de cualquier modalidad de estudio, a los cuales les reste por cursar hasta dos (2) asignaturas del plan de estudio.

El beneficio aplica sobre los aranceles semestrales, excluyendo la matricula semestral, materias de verano, Universitarios 21, derechos de exámenes y trámites en general.

El otorgamiento de este beneficio es excluyente de otro tipo de beneficios/becas, no así de promociones.

Es requisito necesario para la aplicación del beneficio que la persona solicitante no posea sanciones académicas, y que además cuente con un promedio de nota 8 (ocho) incluyendo aplazos en su legajo.

Cumpliendo con las condiciones establecidas en los alcances del presente reglamento, las personas beneficiarias pueden hacer uso de este beneficio en (1) una única oportunidad

Consideraciones específicas del beneficio para carreras de Grado y Pregrado:

- Estudiantes a quienes les reste 1 (una) o 2 (dos) asignaturas por cursar, le corresponde una disminución del 30% sobre el valor del arancel.

#### C) GARANTÍA DE ADAPTACIÓN

Consiste en la posibilidad de comenzar nuevamente la carrera inicialmente elegida por la persona aspirante u otra carrera, en la misma modalidad de estudio o diferente, a todo alumno que durante su primer semestre de cursado no se haya “adaptado” a la Universidad y por ello no haya alcanzado la aprobación de ninguna de las materias del primer semestre. Aplica a todas las modalidades de estudio.

El beneficio que se otorga es el reconocimiento de la matrícula y aranceles que haya abonado la persona ingresante al momento de inscribirse por primera vez.

Se aplica únicamente a las personas inscriptas que no han avanzado del primer semestre y por una única vez.

Podrán acceder a este beneficio quienes se hayan inscripto al primer semestre de cursado de carreras de Grado y Pregrado, sin alcanzar la aprobación de ninguna de las materias del plan de estudio durante ese período. Podrán solicitar la garantía de adaptación hasta 2 años después de su matriculación inicial, siempre que no haya solicitado anteriormente otra Garantía de Adaptación. La aceptación de la Garantía de Adaptación implicará la pérdida de la condición de las materias que haya logrado regularizar la persona solicitante durante el primer semestre de cursado, de manera tal que se comienza nuevamente la carrera desde cero, con la excepción de las materias regularizadas y/o aprobadas de Universitario 21, las cuales mantendrán la condición alcanzada.

#### D) SEGURO DE CONTINUIDAD

Podrán acceder a este beneficio aquellas personas que se encuentren cursando carreras de Grado o Pregrado en Modalidad ED, EDH o PH y acrediten:

- Haber estado matriculados y arancelados en la carrera en el semestre inmediatamente anterior al de la solicitud del beneficio.
- Haber tenido una contratación la persona solicitante o su cónyuge una relación laboral formal y haber sido desvinculado. Este requisito debe ser acreditado mediante notificación de despido y constancia de baja laboral de AFIP.

El beneficio, que será otorgado por única vez, consistirá en el reconocimiento de todos los conceptos que la persona haya abonado en el semestre inmediatamente anterior de cursado.

14$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-3-becas-y-beneficios$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-14$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 4, $pea0$rg-14-4-normas-arancelarias$pea0$,
        $pea0$Normas arancelarias$pea0$, $pea0$Al tomar la decisión de inscribirse y adherir a cualquiera de los planes de cursado y pago semestral (tickets por paquetes de materias), debe saber que, por ningún motivo, se reintegra dinero a qui…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-4-normas-arancelarias el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 14 | GESTIONES ADMINISTRATIVAS

### 14.4. NORMAS ARANCELARIAS PARA GRADO Y PREGRADO

#### CONSIDERACIONES GENERALES

- Al tomar la decisión de inscribirse y adherir a cualquiera de los planes de cursado y pago semestral (tickets por paquetes de materias), debe saber que, por ningún motivo, se reintegra dinero a quienes no completan el cursado por causas personales, mientras el servicio educativo haya sido prestado por la Universidad.
- El hecho de abandonar los estudios y no utilizar los recursos colaborativos no exime al alumnado del pago de matrícula y/o aranceles. Dichos conceptos sólo se reintegran en caso de que la persona no pueda inscribirse a cursar ninguna materia por causas imputables a la Universidad.
- Quienes se encuentren cursando cualquier carrera y/o modalidad y adquieran la condición de “Libre”, sea por motivos académicos o como consecuencia de la aplicación de una medida disciplinaria, no podrán reclamar el reembolso de los conceptos abonados anticipadamente por el período de cursado, cuando el mismo no se hubiera completado, debiendo, en caso de querer continuar sus estudios, abonar nuevamente el ticket que correspondiere.
- Al realizarse el pago de matrícula y/o aranceles a través de medios de financiación (tarjeta de crédito, orden de débito, etc.), siempre que tal modalidad se encuentre habilitada, se compromete el pago de los conceptos correspondientes al valor de un período completo de prestación de servicios, no pudiendo exigir el reintegro de cuotas o pagos parciales pendientes, por la no utilización de los servicios comprometidos.
- En aquellos casos que decida desistir del servicio prestado por la Universidad, determinando así la rescisión del Contrato, debe comunicar su decisión por cualquiera de los medios de contacto habilitados a tal fin (consulta web, 0810, mesas de atención), no teniendo derecho a exigir la devolución de suma de dinero alguna bajo ningún concepto, en virtud de entenderse que durante el semestre comprometido la Universidad ha organizado y coordinado la prestación de los servicios para cumplir el dictado de clases y lo acordado con el alumno al momento de inscribirse; y continuará prestándolos hasta su finalización.
- Quienes deseen suspender su cursado, podrán realizarlo sin que ello implique una modificación en el estado de regularidad de sus materias. Al retomar su vida académica, para poder realizar la inscripción al semestre o rendir las materias regularizadas, deben, como mínimo, cancelar previamente la deuda por tickets del período en que se regularizaron dichas materias.
- Quienes no presenten actividad académica por más de 1 (un) año calendario, adquieren el estado de "baja administrativa", debiendo matricularse nuevamente para adquirir la condición de estudiante.

#### CONCEPTOS ARANCELARIOS

#### 14.4.1. MATRÍCULA

Para poder rendir exámenes parciales, finales o la Defensa Oral de su Seminario Final es requisito necesario que la matricula se encuentre paga y activa, siendo la misma de una duración semestral.

#### Modalidad Presencial (P), Presencial Home (PH) y Presencial Distribuida (PD)

- Matrícula 1er semestre: abarca turnos de examen de febrero-marzo y julio-agosto
- Matrícula 2do semestre: abarca turnos de examen de agosto y diciembre

#### Modalidad Distancia

- Matrícula 1er semestre: desde el 1 de enero al 31 de julio
- Matrícula 2do semestre: desde el 1 de agosto al 31 de diciembre

#### 14.4.2. ARANCELES DE CURSADO

Quienes deseen cursar materias en los periodos habilitados, deberán contar con los aranceles del periodo abonados y no deberán poseer deuda alguna. La modalidad de pago es por paquete de materias, según la carrera y/o modalidad.

#### CARRERAS DE GRADO MODALIDAD PRESENCIAL (P) y PRESENCIAL DISTRIBUIDA (PD)

Quienes cursen en la Modalidad Presencial (P) tendrán la opción de generar y abonar diferentes opciones de tickets por 1 (una) materia, 3 (tres) materias, 4 (cuatro) materias y 6 (seis) materias, pudiendo combinarlos, según la cantidad de materias que tengan habilitadas para cursar y hasta el máximo permitido de 8 (ocho) materias por semestre de cursado.

Aplica esta norma arancelaria también para la carrera de Tecnicatura Universitaria en Enfermería.

#### CARRERAS DE GRADO MODALIDAD PRESENCIAL HOME (PH), Y DISTANCIA (ED Y EDH)

Quienes cursen en la Modalidad Presencial Home (PH) y Distancia (ED y EDH) tendrán la opción de generar y abonar tickets por paquetes de materias, según los esquemas siguientes:

|  | CARRERAS DE GRADO (+) | CARRERAS DE PREGRADO (*) |  |  |
| --- | --- | --- | --- | --- |
|  | Hasta 3 (tres) materias | Hasta 6 (seis) materias | Hasta 2 (dos) materias | Hasta 4 (cuatro) materias |
| Inscripción en el Subperíodo A | Ticket A | Arancel por semestre completo (Ticket A + Ticket B) | - | Arancel por semestre completo (Ticket A + Ticket B) |
| Inscripción en el Subperíodo B | Ticket B | Ticket B |  |  |

(*) Aplica esta norma arancelaria para quienes se encuentren cursando los Ciclos de Complementación cuyo plan de estudios contemple el cursado de 6 materias semestrales.

|  | CICLOS DE COMPLEMENTACIÓN (*) ESCRIBANÍA – LICENCIATURA EN EDUCACIÓN | PREGRADO PROCURADOR (*) |  |  |
| --- | --- | --- | --- | --- |
|  | Hasta 2 (dos) materias | Hasta 4 (cuatro) materias | Hasta 3 (tres) materias | Hasta 5 (cinco) materias |
| Inscripción en el Subperíodo A | - | Arancel por semestre completo (Ticket A + Ticket B) | - | Arancel por semestre completo (Ticket A + Ticket B) |
| Inscripción en el Subperíodo B | Ticket B | Ticket B |  |  |

(*) Quienes se encuentren cursando una carrera de pregrado o ciclo de complementación curricular (MD), no cuentan con la opción de generar arancel único para inscribirse en el subperíodo A, deberán abonar semestre completo si cursa materias en el subperíodo A.

#### 14.4.3. NORMAS ARANCELARIAS DE MATERIAS EXTRAS (PH, ED y EDH)

Quienes se encuentren habilitados a cursar materias adicionales y decidan cursar asignaturas extra a las contempladas en el paquete de materias cuyo/s tickets generó y abonó, deberán asumir el pago del arancel correspondiente, según corresponda:

- Carreras de grado: 1/6 del arancel A+B
- Carreras de pregrado: 1/4 del arancel A+B

En materias extras no aplican beneficios o becas sobre aranceles que el alumno pueda tener vigentes en su legajo.

#### 14.4.4. NORMAS ARANCELARIAS DEL PERIODO DE CURSADO DE VERANO

Quienes estando habilitados se inscriban a materias en el periodo excepcional de cursado de verano que se dicta entre los meses de febrero y marzo, deberán abonar un arancel individual por cada materia. El pago del arancel deberá realizarse antes del comienzo de cursado y como plazo máximo el de finalización de periodo de cursado.

No aplican beneficios o becas sobre los aranceles de las materias que se cursen en el periodo de verano.

#### 14.4.5. MEDIOS Y PLAZO DE PAGO

Quienes deseen cursar materias en la Universidad, deberán generar sus tickets a través de las plataformas de autogestión que brinda la Universidad y realizar el pago de sus conceptos, por los medios habilitados a tal fin, considerando que el plazo de acreditación estimado es de 72 horas hábiles de efectuado.

Por ello, es responsabilidad de cada estudiante:

- Realizar el pago con la antelación necesaria para inscribirse al cursado de materias y/o rendir exámenes.
- Verificar las materias habilitadas para inscribirse al cursado y las opciones de tickets disponibles (por paquete de materias) antes de realizar el pago.
- Resguardar el comprobante de pago para acreditar la transacción.

#### 14.4.6. ALUMNOS CON DEUDA

Quienes registren deuda de períodos anteriores, no podrán pagar la matrícula y/o aranceles del período actual sin antes cancelar el período adeudado. Hasta que no se regularice la situación administrativa, tampoco se podrán abonar tasas correspondientes al pago de trámites. Por este motivo, todo pago que realicen por cualquier concepto se imputará primero a cubrir el monto de la deuda que registre, pudiendo la Universidad aplicar recargo por mora sobre el monto adeudado.

En caso de que se produzca el rechazo de un pago cualquier motivo, la Universidad notificará e intimará al estudiante para la regularización de la deuda en un plazo determinado. Si no se regulariza la situación en dicho plazo, se procederá a su baja administrativa

#### 14.4.7. RÉGIMEN DE PAGO PARA ALUMNOS DE POSGRADO Y PROGRAMAS DE FORMACIÓN CONTINUA

Para las carreras de posgrado y programas de educación continua deberán regirse por las normas generales establecidas en el presente reglamento y lo establecido de manera específica en el Reglamento correspondiente a cada carrera/programa.

14$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-4-normas-arancelarias$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-14$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 5, $pea0$rg-14-5-solicitud-de-baja$pea0$,
        $pea0$Solicitud de baja$pea0$, $pea0$Para realizar la cancelación de su matrícula deberá la persona interesada contactarse con la Mesa de Atención de Alumnos para la gestión del trámite, o bien realizarlo a través de las herramientas…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-5-solicitud-de-baja el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 14 | GESTIONES ADMINISTRATIVAS

### 14.5. SOLICITUD DE BAJA

Para realizar la cancelación de su matrícula deberá la persona interesada contactarse con la Mesa de Atención de Alumnos para la gestión del trámite, o bien realizarlo a través de las herramientas de autogestión disponibles en su portal de estudiante. **Es requisito para el otorgamiento de la baja que la persona solicitante no adeude libros en la biblioteca y no registre deuda contable, ni ninguno de los estados que se derivan de ello, a saber: baja administrativa, y/o inhabilitación académica.**

El alumnado tiene la posibilidad de renunciar a la regularidad de las asignaturas aun cuando se encuentra dentro de la vigencia de dicho estado.

No se realiza reintegro de dinero ni cancelación de deuda generada en concepto de pago de aranceles semestrales por el otorgamiento de la baja académica, salvo razones institucionales debidamente justificadas y aprobadas por el Vicerrectorado de Gestión Institucional.

14$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-5-solicitud-de-baja$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-14$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 6, $pea0$rg-14-6-tratamiendo-de-datos-personales$pea0$,
        $pea0$Tratamiendo de datos personales$pea0$, $pea0$Ámbito de aplicación. El presente apartado regula el tratamiento y, en su caso, la cesión de los datos personales de los estudiantes de la Universidad, en el marco de las relaciones académicas, ins…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-6-tratamiendo-de-datos-personales el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 14 | GESTIONES ADMINISTRATIVAS

### 14.6. TRATAMIENTO DE DATOS PERSONALES.

**Ámbito de aplicación.** El presente apartado regula el tratamiento y, en su caso, la cesión de los datos personales de los estudiantes de la Universidad, en el marco de las relaciones académicas, institucionales y administrativas que los vinculan con la misma, conforme a la normativa vigente en materia de protección de datos personales.

**Consentimiento.** El tratamiento y la cesión de datos personales por parte de la Universidad requerirá el consentimiento previo, expreso e informado del estudiante. Dicho consentimiento será otorgado mediante la aceptación expresa del presente Reglamento Institucional y/o a través de los mecanismos específicos que la Universidad disponga a tal efecto. La Universidad deberá contar con un registro verificable que permita acreditar la aceptación o el rechazo del consentimiento por parte del estudiante.

**Responsable del tratamiento.** La Universidad será responsable del tratamiento de los datos personales de los estudiantes en los términos de la Ley N.º 25.326, su normativa complementaria y las disposiciones de la Agencia de Acceso a la Información Pública, debiendo garantizar su confidencialidad, seguridad y uso conforme a las finalidades autorizadas.

**Datos personales objeto de tratamiento y cesión.** La Universidad podrá ceder datos personales de los estudiantes exclusivamente a entidades bancarias y/o financieras con las que mantenga convenios institucionales vigentes, y únicamente en la medida en que dichos datos resulten estrictamente necesarios para la evaluación de factibilidad crediticia, el eventual otorgamiento y/o la administración de beneficios crediticios o financieros ofrecidos en el marco de dichos convenios. En ningún caso se cederán datos personales excesivos, no pertinentes o no relacionados con la finalidad autorizada, ni datos sensibles en los términos de la normativa vigente.

**Finalidad.** La cesión de datos personales tendrá como finalidad exclusiva permitir a la entidad bancaria o financiera evaluar la elegibilidad del estudiante y, en su caso, ofrecerle beneficios crediticios o financieros vinculados a los convenios institucionales celebrados con la Universidad. Queda expresamente prohibido el uso de los datos personales para finalidades distintas a las aquí previstas sin un nuevo consentimiento previo, expreso e informado del titular de los datos.

**Obligaciones de las entidades receptoras.** Las entidades bancarias o financieras que reciban datos personales deberán:

a) Tratar los datos exclusivamente conforme a la finalidad autorizada; 

 b) Cumplir con la Ley N.º 25.326, su normativa complementaria y las disposiciones de la autoridad de aplicación; 

 c) Implementar medidas técnicas y organizativas adecuadas para garantizar la seguridad y confidencialidad de los datos; 

 d) Abstenerse de ceder, comunicar o transferir los datos a terceros no autorizados.

**Responsabilidad del tratamiento.** La Universidad no será responsable por el tratamiento posterior que realicen las entidades receptoras, siempre que la cesión se haya efectuado conforme a la normativa vigente, a los convenios suscriptos y a lo dispuesto en el presente Reglamento, sin perjuicio de las acciones que pudieran corresponder frente a incumplimientos de dichas entidades.

**Restricción de contacto.** Las entidades bancarias o financieras no podrán contactar directamente a los estudiantes con fines comerciales o promocionales, salvo que: a) la primera comunicación haya sido canalizada por la Universidad, o b) el estudiante haya manifestado de manera expresa e inequívoca su voluntad de ser contactado por la entidad.

**Derechos de los titulares de los datos.** Los estudiantes podrán ejercer los derechos de acceso, rectificación, actualización, supresión y revocación del consentimiento, conforme a la Ley N.º 25.326, a través de los canales institucionales habilitados por la Universidad. La revocación del consentimiento no tendrá efectos retroactivos.

**Normativa aplicable.** El tratamiento y la cesión de datos personales se regirán por la normativa vigente en la República Argentina en materia de protección de datos personales.

14$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-6-tratamiendo-de-datos-personales$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-2$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-2-1-carreras-de-pregrado-y-grado$pea0$,
        $pea0$Carreras de pregrado y grado$pea0$, $pea0$El sistema de ingreso a carreras de grado y pregrado, cualquiera sea su modalidad de dictado, implica que cada aspirante (una vez realizada la inscripción a la carrera) debe:$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-1-carreras-de-pregrado-y-grado el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 2 | CONDICIONES DE INGRESO Y ADMISIÓN

En el presente capítulo, se establecen las condiciones de ingreso y admisión para aquellas personas que deciden iniciar su recorrido académico en carreras de Grado, Pregrado y Posgrado en la Universidad Siglo 21. Asimismo, se indica la documentación obligatoria a completar en el legajo de cada estudiante.

### 2.1 CARRERAS DE PREGRADO Y GRADO

El sistema de ingreso a carreras de grado y pregrado, cualquiera sea su modalidad de dictado, implica que cada aspirante (una vez realizada la inscripción a la carrera) debe:

- Abonar la matrícula y los aranceles
- Presentar la documentación obligatoria para el legajo
- Cursar “Introducción a la Vida Universitaria”
- Aprobar las materias de Universitario 21

| Abonar la Matrícula y los Aranceles | Presentar la documentación obligatoria para el Legajo | Cursar “Introducción a la Vida Universitaria” | Aprobar Universitario 21 |
| --- | --- | --- | --- |
| Es requisito indispensable para realizar cualquier tipo de trámite en la Universidad, para inscribirse a materias y para rendir exámenes finales, tener activa la matrícula y abonar los aranceles según corresponda. La persona inscripta que registre deuda del período anterior no puede pagar la matrícula del período actual sin antes cancelar el período anterior. Ver más sobre Normas Arancelarias en: Gestión Administrativa (Ver apartado 14.3) | Solicitud de inscripción: completar la solicitud con los datos solicitados con carácter de declaración jurada. Fotocopia Frente y dorso de DNI. Copia legalizada del Certificado de Estudios Secundario Completo. Ver más sobre Documentación y Requisitos en el presente Capítulo (Apartado 2.3) | El cursado es obligatorio para todas las modalidades y carreras. Se cursa presencial en la Sede o CAU en que está inscripto cada estudiante. En esta instancia se adquieren los conocimientos para el uso de plataformas y condiciones de cursado. Ver más sobre Introducción a la Vida Universitaria en el capítulo 3. “Universitario 21 (Apartado 3.2.1) | Se deberán cursar y aprobar las asignaturas: “Aprender en el Siglo 21” y “Tecnología, Humanidades y Modelos Globales”. Ver más sobre Universitario 21 en el capítulo 3 (Apartado 3.2.1) |

Quienes cuenten con cinco (5) materias o más aprobadas en su legajo, ya sea por reconocimiento de materias o por el cursado y aprobación de materias, serán eximidos del cursado de las materias de Universitarios 21, conforme a lo establecido por la Resolución del Consejo Superior N° 1256/2026.

#### Curso de Nivelación e Ingreso a la carrera de Medicina

El Curso de Nivelación y Examen de Admisión a Medicina es obligatorio para toda persona aspirante y constituye condición previa para integrar el orden de mérito de ingreso. Comprende las materias Fundamentos de Física, Fundamentos de Química y Fundamentos de Biología, con dictado bajo modalidad a distancia, con dos encuentros sincrónicos, con una duración de cuatro (4) semanas y evaluación final presencial mediante examen final de veinte (20) preguntas por asignatura.

Para la aprobación de cada materia se requiere una calificación mínima de cinco (5) puntos. Finalizada la evaluación, la Universidad realizará la auditoría de exámenes, resolverá las solicitudes de revisión dentro de los plazos previstos y publicará las calificaciones definitivas.

Las personas aspirantes que aprueben las tres materias accederán a una entrevista personal evaluada mediante rúbrica, cuyo puntaje integrará el promedio para la confección del orden de mérito, el que será publicado con carácter provisorio, sujeto a impugnación formal y posterior emisión del orden definitivo.

El orden de mérito definitivo constituirá el único instrumento válido para la asignación de los cupos establecidos por la Universidad y mantendrá su vigencia hasta el inicio del Curso de Nivelación siguiente.

2$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-1-carreras-de-pregrado-y-grado$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-2$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 2, $pea0$rg-2-2-documentacion-obligatoria-y-complementaria$pea0$,
        $pea0$Documentación obligatoria y complementaria$pea0$, $pea0$La Universidad Siglo 21 solicita a cada nuevo ingresante documentación obligatoria y complementaria para la apertura de sus legajos. A continuación, se detallan los requisitos a tener en cuenta.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-2-documentacion-obligatoria-y-complementaria el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 2 | CONDICIONES DE INGRESO Y ADMISIÓN

#### 2.2 DOCUMENTACIÓN OBLIGATORIA Y COMPLEMENTARIA

La Universidad Siglo 21 solicita a cada nuevo ingresante documentación obligatoria y complementaria para la apertura de sus legajos. A continuación, se detallan los requisitos a tener en cuenta.

#### 2.2.1 CONSIDERACIONES GENERALES

Será requisito indispensable contar con el legajo completo.

Para ello, cada estudiante deberá presentarse en la Sede o Centro de Apoyo Universitario (CAU) que le corresponda, acreditando su identidad y presentando la documentación en original y copia.

Una vez certificada la copia como fiel por una autoridad competente —personal autorizado del CAU o de la Sede, juez de paz, registro civil (no secretaría del juzgado) o escribano público—, el/la estudiante deberá remitir dicha documentación en formato digital a la Universidad, a través de los canales que se habiliten a tal efecto.

#### 2.2.2 DOCUMENTACIÓN OBLIGATORIA PARA CARRERAS DE GRADO Y PREGRADO

La Universidad Siglo 21 requiere la siguiente documentación para la habilitación académica de los alumnos.

- **Solicitud de Inscripción Completa:**  Debe constar la fecha y la firma certificada de la persona ingresante.
- **Copia de frente y dorso de documento que acredite identidad:**  Solo se aceptará DNI vigente; no es válido el DNI digital. En el caso de personas ingresantes extranjeras, será aceptado el pasaporte vigente. En caso de no presentarse dicha documentación bajo las condiciones indicadas, se considerará no válida.
- **Copia de documentación que acredite estudios secundarios completos:**  La persona ingresante debe presentar, al menos, uno de los siguientes documentos:    Certificado Analítico Secundario legalizado*. (No es válido el Libro Matriz, salvo que el mismo sea legible y especifique localidad y provincia, nombre de la institución educativa, título secundario obtenido y año de egreso).  Título secundario legalizado* (frente y dorso).    *Dicha documentación podrá estar legalizada por la autoridad educativa competente, según la jurisdicción, por Escribano Público o por autoridad competente de la institución emisora.
- **2 (dos) fotos color 3x3.**
- **Ficha médica.**

**Documentación provisoria:**

**Certificado de estudios en trámite:** Si la persona aspirante ha finalizado sus estudios secundarios, pero aún no cuenta con el analítico, puede presentar un certificado o constancia de estudios o título en trámite en el que conste que **no adeuda materias**. Este certificado tiene una validez de 1 (un) año desde la fecha de emisión, pudiendo ser presentado por única vez. En caso de no presentarse el documento definitivo dentro de dicho plazo, esta documentación quedará sin validez académica.

**Importante:** La documentación obligatoria para las carreras de grado deberá ser presentada dentro del primer año y medio de cursado. En caso de incumplimiento o de cumplimiento parcial, la persona ingresante no podrá reinscribirse al cuarto período de cursado. Para las carreras de pregrado, la documentación deberá presentarse dentro del primer año de ingreso; de no cumplirse este requisito o de cumplirse de manera parcial, la persona ingresante no podrá reinscribirse al tercer período de cursado.

#### 2.2.3 DOCUMENTACIÓN OBLIGATORIA PARA CICLOS DE COMPLEMENTACIÓN CURRICULAR

Para las carreras de Escribanía, Licenciatura en Educación, Licenciatura en Gerontología, Licenciatura en Emprendimiento, Licenciatura en Administración de Servicios de Salud, Licenciatura en Desarrollo de Negocios Inmobiliarios, Licenciatura en Psicopedagogía (CCC) y Profesorado Universitario para el Nivel Secundario y Superior, es necesario poseer estudios superiores previos.

Podrán acreditar la carga horaria de la carrera mediante:

- Copia legalizada del Plan de Estudios, donde se detalla la cantidad de horas reloj cursadas.
- Constancia de horas reloj cursadas emitida por la institución de origen. Si es copia, debe estar legalizada.
- Copia legalizada de la Resolución Ministerial mediante la cual se aprobó el título, donde se detalle la cantidad de horas de cursada.

**IMPORTANTE:** Para los Ciclos de Complementación Curricular, la documentación obligatoria deberá ser presentada dentro del primer año de cursado. Como excepción, en la carrera de Escribanía la documentación deberá completarse dentro de los primeros seis (6) meses desde la inscripción. En caso de incumplimiento o cumplimiento parcial de los requisitos del legajo, la persona ingresante no podrá reinscribirse al período de cursado siguiente.

| Escribanía | Licenciatura en Educación | Licenciatura en Gerontología | Licenciatura en Emprendimiento | Licenciatura en Administración de Servicios de Salud | Profesorado Universitario para el Nivel Secundario y Superior | Licenciatura en Desarrollo de Negocios Inmobiliarios | Licenciatura en Psicopedagogía (CCC) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Es condición excluyente poseer título de Abogado otorgado por Universidad autorizada. Su duración no puede ser inferior a cuatro años y 2.600 horas reloj de cursado. R.M. 1479/2021 | Es condición excluyente poseer título de Profesor/a otorgado por Institución autorizada. Su duración no puede ser inferior a dos años y 1.200 horas reloj de cursado. R.M. 1155/2021 | Es condición excluyente poseer título de Enfermero, Trabajador Social, Terapista Ocupacional, Técnico en Gerontología y/o Técnico Universitario en Acompañamiento, cuidado y asistencia al adulto mayor; otorgado por institución autorizada, con duración de al menos 2 años y carga horaria no inferior a 1600hs reloj de cursado. R.M. 78/2018 | Es condición excluyente poseer título de Técnico Universitario otorgado por institución autorizada, con duración de al menos 2 años y carga horaria no inferior a 1400hs reloj, conforme lo contemplado taxativamente en la Resolución Ministerial que otorga reconocimiento oficial de cursado. R.M. 1372/2021 | Es condición excluyente poseer título de Técnico Universitario otorgado por institución autorizada, con duración de al menos 2 años y carga horaria no inferior a 1400hs reloj de cursado, conforme lo contemplado taxativamente en la Resolución Ministerial que otorga reconocimiento oficial. R.M. 136/2022 | Es condición excluyente poseer Título de Nivel Superior en carreras de 4 años o más y con una carga horaria mínima de 2600 horas reloj de cursado. El mismo deberá estar otorgado por Institución autorizada. R.M. 46/2022 | Es condición excluyente poseer título de Técnico Universitario otorgado por institución autorizada, con duración de al menos 2 años y carga horaria no inferior a 1400hs reloj, conforme lo contemplado taxativamente en la Resolución Ministerial que otorga reconocimiento oficial de cursado. RM. 2935/2023 | Es condición excluyente poseer título de Psicopedagogo o Técnico Universitario otorgado por institución autorizada, con duración de al menos 2 años y carga horaria no inferior a 1400hs reloj, conforme lo contemplado taxativamente en la Resolución Ministerial que otorga reconocimiento oficial de cursado. R.M. 283/2025 |

2.2.4 DOCUMENTACIÓN OBLIGATORIA PARA PERSONAS INGRESANTES MAYORES DE 25 AÑOS CON SECUNDARIO INCOMPLETO (RES. REC. 539/2009)

La Universidad Siglo 21, en cumplimiento del artículo 7 de la Ley N.º 24.521, ofrece la posibilidad de ingresar a carreras de pregrado y/o grado a personas mayores de 25 años que no hayan finalizado sus estudios secundarios, siempre que cumplan con las condiciones reglamentadas a tal fin.

Mediante resolución propia, la Universidad otorga esta opción a quienes acrediten tener completo, como mínimo, el tercer año del nivel secundario y posean experiencia laboral vinculada con la carrera universitaria que desean cursar.

Las personas aspirantes podrán inscribirse en la carrera elegida una vez realizado el trámite correspondiente y obtenida la aprobación de la Universidad mediante resolución rectoral.

Para la realización del mismo, deberá presentar la siguiente documentación:

- Nota dirigida al Rectorado de la Universidad en la que determine los antecedentes que, conforme a lo indicado en el Art. 7 de la Ley de Educación Superior, justificarían su pedido. La misma deberá ser firmada por la persona aspirante de puño y letra.
- Documentación que acredite sus antecedentes mediante certificado emitido por la institución educativa correspondiente y debidamente legalizado; Curriculum Vitae y certificados que acrediten la experiencia laboral relacionada a la carrera elegida.
- Fotocopia de frente y dorso del DNI vigente que acredite la edad.

La documentación debe ser enviada o presentada según lo establecido en el apartado **2.2.1. CONSIDERACIONES GENERALES** del presente capítulo. El plazo total del proceso es de 45 (cuarenta y cinco) días hábiles.

2$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-2-documentacion-obligatoria-y-complementaria$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-2$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 3, $pea0$rg-2-3-carreas-de-posgrado$pea0$,
        $pea0$Carreras de posgrado$pea0$, $pea0$Para carreras de Posgrado las condiciones generales de ingreso son:$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-3-carreas-de-posgrado el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 2 | CONDICIONES DE INGRESO Y ADMISIÓN

#### 2.3 CARRERAS DE POSGRADO

Para carreras de Posgrado las condiciones generales de ingreso son:

- Ser graduado/a universitario en una universidad argentina o extranjera, con título de grado o de nivel superior no universitario —carrera universitaria de cuatro (4) años de duración como mínimo—.
- Aprobar una entrevista de admisión y, en caso de que el/la Director/a lo considere necesario, un examen de admisión.
- Poseer como mínimo 2 (dos) años de experiencia laboral previa.
- En aquellos posgrados que por su orientación así lo requieran, contar con dominio de lecto comprensión del idioma inglés en un nivel B1 (Marco Común Europeo).
- Cursar y aprobar, con carácter obligatorio, el Ciclo Nivelador en aquellas carreras que incluyen esta actividad en su reglamento.
- Afrontar los aranceles previstos para la carrera.

Adicionalmente, pueden existir condiciones particulares de ingreso, las que se consignan en el reglamento específico de cada programa y que la persona aspirante a cursar un Posgrado debe leer y firmar al momento de la inscripción. El cumplimiento de los requisitos de ingreso deberá acreditarse mediante la documentación obligatoria y complementaria prevista en cada reglamento.

#### 2.3.1 DOCUMENTACIÓN OBLIGATORIA PARA POSGRADOS

Será requisito para cursar cualquier posgrado en la Universidad contar con la siguiente documentación:

- Presentar carta al Director/a indicando los motivos de su solicitud de admisión a la carrera.
- Presentar original y acompañar fotocopia de documento de identidad argentino o visa que autorice su residencia en el país.
- Presentar original y acompañar fotocopia del título universitario debidamente legalizada por el organismo competente.
- Acompañar curriculum vitae actualizado del postulante, debidamente firmado.
- Acompañar dos fotos color tipo carnet del postulante para la conformación del legajo correspondiente.
- Presentar certificado de estudios que avale su formación y dominio de lecto comprensión en idioma inglés, si correspondiere.
- Completar y firmar el “Formulario de Solicitud de Admisión”.

**IMPORTANTE:** La documentación obligatoria para Posgrados deberá ser presentada dentro del primer año de cursado. En caso de incumplimiento o cumplimiento parcial de la documentación del legajo, la persona ingresante no podrá reinscribirse al próximo período de cursado.

2$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-3-carreas-de-posgrado$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-2$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 4, $pea0$rg-2-4-documentacion-obligatoria-y-complementaria-extranjeros$pea0$,
        $pea0$Documentación obligatoria y complementaria para extranjeros$pea0$, $pea0$Las personas que hayan finalizado el Nivel Medio en el extranjero y deseen acceder a estudios superiores en la República Argentina deben convalidar su título ante las autoridades educativas naciona…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-4-documentacion-obligatoria-y-complementaria-extranjeros el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 2 | CONDICIONES DE INGRESO Y ADMISIÓN

#### 2.4 DOCUMENTACIÓN OBLIGATORIA PARA ESTUDIANTES EXTRANJEROS

#### CONVALIDACIÓN DEL SECUNDARIO

Las personas que hayan finalizado el Nivel Medio en el extranjero y deseen acceder a estudios superiores en la República Argentina deben convalidar su título ante las autoridades educativas nacionales. La convalidación es un requisito obligatorio y excluyente para la emisión del título final de la carrera, y es documentación obligatoria para la admisión definitiva en la carrera.

La información actualizada sobre el procedimiento se encuentra disponible en los siguientes enlaces oficiales:

- Países con Convenio
- Países sin Convenio

#### MATERIAS POR EQUIVALENCIA DE ESTUDIOS EN EL EXTRANJERO

La persona aspirante que haya estudiado en el extranjero alguna carrera de grado, pregrado o posgrado y que desee proseguir sus estudios en la Universidad Siglo 21 puede presentar Solicitud de Equivalencias.

Los requisitos son los siguientes:

- Presentar la documentación académica legalizada de acuerdo con la legislación vigente en el país emisor (certificación consular o apostilla de La Haya).
- En caso de que la documentación se encuentre redactada en idioma extranjero, debe ser previamente traducida al español por un Traductor Público Nacional que, salvo en el caso de Brasil, deberá estar inscripto en el Registro Público de Traductores.

La persona aspirante que presente equivalencias de una universidad en el extranjero y que, además, haya finalizado el secundario en el extranjero, debe obligatoriamente convalidar su título secundario conforme a la normativa argentina y según lo descripto precedentemente.

#### ACCESO A CARRERAS QUE REQUIERAN TÍTULO DE GRADO PREVIO

Quienes deseen acceder a un programa que requiera título de grado previo y cuenten con un título de grado obtenido en una universidad extranjera deberán convalidarlo o revalidarlo (según corresponda) conforme a la normativa vigente. Esta disposición también aplica a las carreras de grado que exigen la posesión de un título de grado previo.

En estos casos, y a diferencia del título secundario, no se podrá comenzar a cursar sin la presentación de la convalidación o revalidación correspondiente. Asimismo, podrá requerirse la presentación del certificado de estudios secundarios debidamente convalidado, bajo los requisitos anteriormente descriptos.

Para convalidar o revalidar un título universitario, se deberá acceder al siguiente enlace: **Convalidación Título**.

#### PROGRAMAS DE POSGRADO

La norma general establece que, para cursar una carrera de posgrado en la República Argentina, la persona interesada que posea un título de grado obtenido en el extranjero deberá convalidarlo o revalidarlo (según corresponda) conforme a la normativa vigente al momento del trámite.

Sin embargo, de acuerdo con lo expresado en la Resolución Ministerial N.º 416/00, las universidades podrán reconocer estudios de grado aprobados en el extranjero exclusivamente a los efectos de la prosecución de estudios de posgrado en la República Argentina, siempre que la currícula del programa no requiera el ejercicio profesional.

#### RESIDENCIA MIGRACIONES

Es requisito obligatorio la obtención de la residencia otorgada por la Dirección Nacional de Migraciones para poder estudiar en la República Argentina. Será responsabilidad de la persona interesada asesorarse previamente en el consulado o embajada de su país de origen.

A los efectos de la correcta realización del trámite, el Centro de Internacionalización de la Universidad facilitará al alumnado extranjero ingresante la correspondiente Constancia de Inscripción electrónica, generada a través del sitio web de la Dirección Nacional de Migraciones (DNM).

La Dirección Nacional de Migraciones extenderá una residencia precaria y solicitará a la persona inscripta acreditar su avance académico transcurridos los primeros 6 o 12 meses —según la duración de la formación académica— mediante la presentación de un certificado analítico parcial y un certificado de estudiante regular, ambos legalizados por el Ministerio de Educación y por el Ministerio del Interior, Obras Públicas y Vivienda.

La persona que se encuentre cursando una carrera de grado o pregrado deberá presentar obligatoriamente su DNI argentino durante el primer año de ingreso. La persona que curse una carrera de posgrado podrá presentar como documentación que acredite su identidad el DNI argentino o el pasaporte.

Para mayor información sobre requisitos, documentación necesaria, plazos y procedimientos de residencia, se deberá ingresar al sitio web de la Dirección Nacional de Migraciones.

2$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-4-documentacion-obligatoria-y-complementaria-extranjeros$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-2$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 5, $pea0$rg-2-5-requisitos-para-cursado$pea0$,
        $pea0$Requisitos para cursado$pea0$, $pea0$Para el cursado de todas las opciones de carreras y modalidades de la institución es condición fundamental contar con:$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-5-requisitos-para-cursado el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 2 | CONDICIONES DE INGRESO Y ADMISIÓN

### 2.5. Requisitos para cursado

Para el cursado de todas las opciones de carreras y modalidades de la institución
 es condición fundamental contar con:

- Disponibilidad de conexión a Internet para acceder al material educativo y a las  actividades evaluativas que se requieran para su aprobación. Si la persona aspirante  o reinscripta no contara con acceso a internet, deberá informarlo a la Universidad  para que esta tome conocimiento y se manifieste sobre la viabilidad de su admisión  y/o continuidad en el cursado.
- Es requisito indispensable que todos los estudiantes proporcionen un correo  electrónico válido y actualizado al momento de su inscripción o actualización de  datos. Este correo será considerado el canal oficial de comunicación de la  Universidad, a través del cual se enviarán todas las notificaciones, avisos  importantes y demás comunicaciones institucionales. Es responsabilidad del  estudiante mantener su correo electrónico actualizado durante todo el periodo  de cursado para asegurar la recepción oportuna de la información relevante.
- Disponibilidad de equipo portátil (Notebook/Netbook) que cumpla las características  técnicas necesarias, para aquellos casos en que el alumnado deba presentarse a rendir  exámenes virtuales y/o para aquellas materias que requieran para su cursado la  utilización de software especiales sin los cuales el alumnado no pueda desarrollar  los contenidos contemplados en el programa.      **Sistema operativo: Windows**    Versión del sistema: Windows 10 o superior  Procesador: Intel Core i3 o superior – 64 bits, 4 GB de RAM  Cámara y micrófono – Conexión a Internet        **Sistema operativo: Mac**    Versión del sistema: Monterrey 12.6.3 o superior  Procesador: Intel Core i3 / M1 o superior – 64 bits, 4 GB de RAM  Cámara y micrófono – Conexión a Internet
- En aquellas carreras y/o materias que, por su naturaleza, requieran la utilización  de ambo o chaquetilla para el cursado, se considerará como condición indispensable  que el alumnado disponga del mismo para la asistencia a clase, siendo responsable  cada estudiante de su adquisición.
- La permanencia del alumnado estará sujeta al cumplimiento de las normas  administrativas y del régimen disciplinario, es decir, que no pese sobre la persona  sanción que lo inhiba académica o administrativamente.
- La expulsión en cualquier otra Universidad o Instituto de Educación Superior con  reconocimiento oficial inhabilita a la persona sumariada a cursar en esta casa de  estudios, salvo resolución del Rectorado de la Universidad Siglo 21.

2$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-5-requisitos-para-cursado$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-3$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-3-1-modalidades-de-cursado$pea0$,
        $pea0$Modalidades de cursado$pea0$, $pea0$La Universidad Siglo 21 dicta Carreras de Pregrado, Grado, Posgrado y Extragrado en sus diferentes modalidades:$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=3-1-modalidades-de-cursado el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 3 | MODALIDADES DE CURSADO

En el presente capítulo se describen las diferentes modalidades de cursado que ofrece la Universidad para el cursado de su oferta académica. Como así también las reglas para los cambios entre las distintas modalidades.

### 3.1 MODALIDADES DE CURSADO

La Universidad Siglo 21 dicta Carreras de Pregrado, Grado, Posgrado y Extragrado en sus diferentes modalidades:

#### 3.1.1. Modalidad presencial

La Universidad Siglo 21 ofrece, entre sus modalidades de cursado, la Modalidad
 Presencial. En esta propuesta el estudiantado participa de una combinación de
 contextos de aprendizaje, a partir de un modelo flexible que promueve experiencias
 educativas híbridas y el uso de estrategias didácticas de aula invertida.

Las actividades curriculares se organizan en cuatro módulos, cada uno de los cuales
 se desarrolla en forma semestral o bimestral, según la submodalidad de cursado. Las
 clases comienzan en la fecha de inicio del calendario académico; sin embargo, las
 instancias presenciales se ajustan al calendario específico de clases, por lo que su
 comienzo puede ser posterior. Las actividades en aula se estructuran en tres momentos
 prediseñados por el o la docente responsable.

Esta modalidad está dirigida a quienes optan por una formación con cursado y
 dedicación principalmente presencial, tanto en aulas como en laboratorios
 experimentales.

#### Características del cursado – carreras de pregrado y grado

Todas las asignaturas se desarrollan bajo una modalidad de cursado blend, que combina
 la presencialidad con la virtualidad y permite ampliar los límites del aula física.
 Se realizan encuentros presenciales en aulas que se complementan con recursos
 tecnológicos, de modo que el aprendizaje, la enseñanza y la interacción entre
 estudiantes y docentes puedan producirse de manera simultánea en distintos espacios
 y tiempos.

Esta modalidad se concibe como un entorno interactivo que otorga un papel central al
 estudiante en la construcción del conocimiento y reconoce al cuerpo docente como
 facilitador y guía del proceso de enseñanza-aprendizaje. El diseño de cada clase se
 sustenta en la participación activa del alumnado, fomenta el trabajo colaborativo,
 promueve la aplicación práctica de los contenidos, favorece la autoevaluación y
 contempla una evaluación permanente, participativa y reflexiva.

Cada clase presencial se organiza en tres módulos de cuarenta minutos. Todas las
 materias cuentan con el respaldo del Sistema de Aprendizaje Multimedial (SAM), en el
 cual cada estudiante aborda diferentes objetos de aprendizaje y desarrolla los
 Trabajos Prácticos correspondientes. Las consultas académicas a los docentes pueden
 realizarse tanto en el espacio físico del aula como a través del SAM de cada materia.

La carga horaria presencial varía según la submodalidad. Para quienes cursan en
 Modalidad Presencial (P) o Modalidad Presencial Distribuida (PD), el porcentaje de
 presencialidad es del setenta por ciento como mínimo. Para quienes se encuentren
 inscriptos en la Modalidad Presencial Home (PH), el porcentaje mínimo es del cincuenta
 por ciento. En todos los casos, dicho porcentaje puede incrementarse de acuerdo con
 las características específicas de cada carrera.

Esta modalidad comprende tres sub-modalidades:

- Sub-modalidad Presencial Home (PH)
- Sub-modalidad Presencial (P)
- Sub-modalidad Presencial Distribuida (PD)

A continuación, se resume en un cuadro las diferentes modalidades y sus
 características:

| Modalidad | Presencial |  |  |
| --- | --- | --- | --- |
| Sub-Modalidad | Presencial | Presencial Home | Presencial Distribuida |
| Características de Cursado | Esta modalidad combina en todas sus asignaturas la presencialidad con la virtualidad en un entorno áulico mediado por tecnologías. Las materias se cursan durante un cuatrimestre y con el 70% o más de la carga horaria de manera presencial. Las clases presenciales se cursan de lunes a sábados en horarios diurnos y/o nocturnos, debiendo el alumno cumplir con un 75% de asistencia. | Esta modalidad combina en todas sus asignaturas la presencialidad con la virtualidad en un entorno áulico mediado por tecnologías. Las materias programáticas se cursan durante un bimestre, las materias de proceso son de cursado cuatrimestral, con el 50% de la carga horaria de manera presencial. Las clases presenciales se cursan de lunes a sábados en horarios diurnos y/o nocturnos, debiendo el alumno cumplir con un 75% de asistencia. | Esta modalidad combina en todas sus asignaturas la presencialidad mediante actividades sincrónicas en un entorno áulico mediado por tecnologías que garantiza al alumnado la participación sincrónica en un entorno áulico garantizado por la Universidad. Las materias se cursan durante un cuatrimestre y con el 50% o más de la carga horaria de manera presencial en los Centros de Aprendizajes Universitarios. Las clases presenciales se cursan de lunes a sábados en horarios diurnos y/o nocturnos, debiendo el alumno cumplir con un 75% de asistencia. |
| Modalidad de Evaluación | Ver apartado 4.5 |  |  |
| Entornos/ Sedes de Cursado | Aula Presencial en sedes - Plataforma Multimedia SAM | Aula Presencial en sedes - Plataforma Multimedia SAM | Aula Presencial en Centros de Apoyo Universitario- Plataforma Multimedia - SAM |

#### A. Sub-modalidad Presencial (P.)

En la sub-modalidad Presencial (P.) todas las materias programáticas, de proceso y
 electivas se cursan cuatrimestralmente, de acuerdo al calendario académico definido
 para la modalidad y con las condiciones definidas para la sub-modalidad.

#### B. Sub-modalidad Presencial Home (PH)

En la sub-modalidad Presencial Home (PH) las Materias de Exploración y Conceptualización
 (MEC) y Materias de Integración y Aplicación (MIA) y Materias Electivas se cursan
 bimestralmente, con una asistencia obligatoria del 75%.

En el caso de las Materias cuya tipología sea de Intervención Profesional (MIP) o
 Materias de Proceso, el cursado se desarrolla durante un semestre que comprende 2 (dos)
 sub períodos (A y B), con una asistencia obligatoria del 75%. (Ver apartado Tipología
 de materias 4.2.2.3.)

Las materias de idiomas, independientemente de la submodalidad en la cual se encuentre
 cada estudiante, se cursan de acuerdo a lo detallado en el apartado correspondiente
 del Reglamento.

#### C. Sub-modalidad Presencial Distribuida (PD)

En la sub-modalidad Presencial Distribuida (PD) todas las materias programáticas, de
 proceso y electivas se cursan cuatrimestralmente mediante actividades sincrónicas en
 un entorno áulico mediado por tecnologías, de acuerdo al calendario académico definido
 para la modalidad y con las condiciones definidas para la sub-modalidad.

#### Asistencia

Se debe cumplir con una asistencia mínima y obligatoria del 75% a las clases
 programadas de las materias presenciales. El tiempo máximo de tolerancia para el
 ingreso a clases es de 15 (quince) minutos. Vencido dicho plazo, se considera un
 ausente en la materia.

#### Reincorporación

En caso de que la asistencia sea inferior al 75%, deberá justificar sus inasistencias
 en forma fehaciente y por motivos que revelen causa mayor, presentando documentación
 que acredite dichas condiciones.

- En caso de enfermedad grave: presentar certificado médico.
- Por razones laborales: presentar el certificado de trabajo correspondiente que  justifique la actividad laboral. El mismo debe presentarse en hoja oficial, con sello  y firma autorizada, especificando días y horarios de trabajo.
- Por mérito académico: cumplir las condiciones académicas y administrativas para la promoción de la materia.

Nota: Las situaciones contempladas y reguladas de manera especial en la Resolución
 del Consejo Superior 535/2017 y modificatorias configuran casos de excepción a las
 reglas generales de asistencia.

#### Clases de consulta

La Universidad ofrece la opción de que el docente responsable de la materia pueda
 coordinar con su grupo de estudiantes clases de consulta. Estas se pueden fijar en
 día y horario diferente al de cursado habitual de la asignatura (siempre que el encuentro
 sea dentro del horario de funcionamiento de la sede y durante el desarrollo del calendario
 académico vigente). La asistencia a las mismas es de carácter optativo.

#### 3.1.2 MODALIDAD DISTANCIA

Es la modalidad concebida por la Universidad Siglo 21 para quienes que, por trabajo u otras circunstancias no disponen del tiempo para asistir a clases en forma regular. Toma las mejores prácticas de la educación a distancia y de la
 educación presencial, permitiendo estudiar la carrera elegida de manera virtual, con un sistema innovador para el aprendizaje.

Esta modalidad comprende las siguientes sub modalidades:

- Sub Modalidad Educación Distribuida (ED)
- Sub Modalidad Educación Distribuida Home (EDH)

A continuación, se resume en un cuadro las diferentes modalidades y sus características:

| Modalidad | Distancia |  |
| --- | --- | --- |
| Sub-Modalidad | Educación Distribuida | Educación Distribuida Home |
| Características de Cursado | El cursado se realiza a través de la Plataforma Multimedia con apoyo de un Equipo Docente. En las fechas determinadas por el calendario académico cada estudiante asiste a un Centro de Apoyo Universitario (CAU) para presenciar una Open Class y realizar actividades colaborativas, bajo la coordinación de un Tutor Dinamizador, debiendo cumplir con un 75% de asistencia a las Open Class. | Las asignaturas se cursan a través de la Plataforma Multimedia en un entorno áulico que integra estrategias multimediales, diseño de didácticas y herramientas comunicacionales, con apoyo de un Equipo Docente. |
| Modalidad de Evaluación | Ver Capítulo 4.5 |  |
| Entornos/ Sedes de Cursado | Plataforma Multimedia - Open Class en Centros de Apoyo Universitario (CAU) | Plataforma Multimedia |

#### A) SUB- MODALIDAD EDUCACIÓN DISTRIBUIDA (ED) CARRERAS DE GRADO Y PREGRADO

Las asignaturas de Carreras de Grado y Pregrado que adoptan la modalidad ED cuentan con un docente que acompaña y guía el cursado a partir de la mediación tecnológica y pedagógica a través de SAM. Además, cada estudiante asiste a su CAU o Sede en las fechas establecidas por el calendario de cursado ED, para un encuentro presencial por módulo.

En estos encuentros presenciales se llevará adelante la Open Class, un espacio de construcción de conocimiento colaborativo entre pares bajo la coordinación de un Tutor dinamizador. Este Tutor Dinamizador moderará la Open Class y acompañará a cada estudiante en su proceso de aprendizaje.

La Universidad se reserva el derecho de instrumentar cambios en las actividades colaborativas y su obligatoriedad, como así también en el diseño instruccional de la propuesta curricular y pedagógica, siempre que dichos cambios conlleven a la mejora de los procesos académicos, la experiencia y el aprendizaje del alumnado.

En cada subperíodo, que consta de un cursado de 9 semanas, el estudiante puede cursar hasta 2 (dos) materias con asistencia al Centro de Apoyo Universitario (CAU). La asistencia por materia es cada 2 (dos) semanas, es decir, una Open Class por cada módulo de estudio.

Quienes cursen carreras de Grado pueden, además, cursar en cada subperíodo 1 (una) materia íntegramente virtual a través del SAM, sin asistencia al CAU. Para estas materias, tanto el cursado como la modalidad de evaluación, se rige por lo definido para la Modalidad Educación Distribuida Home.

Las instancias evaluativas, parciales y finales, se rinden a través del sistema de evaluación on line, con el uso del sistema de validación de identidad y monitoreo de la Universidad, pudiendo ser rendidos dentro de la sede de cursado o en el lugar que cada estudiante determine. Las instancias son grabadas y posteriormente auditadas, pudiendo aplicarse las sanciones establecidas en el régimen disciplinario vigente.

Quienes requieran ajustes razonables conforme al Protocolo de Prácticas Educativas Inclusivas (Resolución del Consejo Superior Nº 933/2021) deberán rendir de manera obligatoria en su Sede o Centro de Apoyo Universitario, vedando cualquier posibilidad de rendir en su domicilio particular. Debiendo rendir acompañado del personal del CAU o el que este específicamente le asigne.

IMPORTANTE: Cuando en el Centro de Apoyo Universitario no se llegue al mínimo de 5 estudiantes ingresantes en el periodo o sub-período en la misma carrera o por el nivel de avance, la Universidad se reserva la potestad de pasar a quienes se encuentren en la Modalidad de cursado ED a la Modalidad EDH

Quienes cursen en esta modalidad de estudios, deben cumplir con una asistencia mínima y obligatoria del 75% a las Open Class, siendo 15 (quince) minutos el tiempo máximo de tolerancia para el ingreso a clase.

**Nota:** Las situaciones contempladas y reguladas de manera especial en la Resolución del Consejo Superior 535/2017 y modificatorias configuran casos de excepción a las reglas generales de asistencia.

**REINCORPORACIÓN**

En caso de que la asistencia sea menor al 75%, pero tenga al menos 1 (una) asistencia, puede acceder a la reincorporación automática si cumple todas las condiciones académicas y administrativas requeridas para la promoción de la materia. Esta reincorporación otorga a la persona solicitante la condición de Regular, aunque no habilita la Promoción.

#### B) SUB- MODALIDAD EDUCACIÓN DISTRIBUIDA HOME (EDH) CARRERAS DE GRADO Y PREGRADO

Las asignaturas de Carreras de Grado y Pregrado que se dictan en modalidad EDH se cursan íntegramente a través del SAM. Esta plataforma se constituye en un entorno áulico mediado por tecnologías, donde la persona inscripta elige su propio recorrido de aprendizaje a través de diferentes tipos de actividades, que promueven el aprendizaje autónomo, reflexivo, colaborativo y de transferencia.

La Universidad se reserva el derecho de instrumentar cambios en las actividades colaborativas y su obligatoriedad, como así también en el diseño instruccional de la propuesta pedagógica, siempre que dichos cambios conlleven a la mejora de los procesos académicos, la experiencia y el aprendizaje del alumnado.

Quienes optan por la modalidad EDH cursan todas las materias de su carrera a través del SAM con acompañamiento y guía de un equipo docente. Por ende, el cursado de estas materias no requiere asistencia al CAU. Tanto las evaluaciones parciales como finales se rinden a través del sistema de evaluación on line, con el uso del sistema de validación de identidad y monitoreo de la Universidad, pudiendo ser rendidos dentro de la sede de cursado o en el lugar que cada estudiante determine. Las instancias son grabadas y posteriormente auditadas, pudiendo aplicarse las sanciones establecidas en el régimen disciplinario vigente.

Quienes requieran ajustes razonables conforme al Protocolo de Prácticas Educativas Inclusivas

(Resolución del Consejo Superior Nº 933/2021) deberán rendir de manera obligatoria en su Sede o Centro de Apoyo Universitario, quedando prohibido cualquier posibilidad de rendir en un domicilio particular.

#### C) CLASES DE APOYO (ED Y EDH)

Durante el desarrollo del subperíodo, en fechas y horarios definidos institucionalmente la Universidad podrá disponer, encuentros sincrónicos mediados por tecnologías y coordinados por un Profesor Experto de la materia. Estas clases podrán ser implementadas antes de las instancias evaluativas correspondientes al primer y segundo parcial, como apoyo para le resolución de los Trabajos Prácticos o cuando los docentes consideren oportuno para el proceso de aprendizaje, según la particularidad de cada materia y sus contenidos. La dinámica se implementará bajo el modelo de aula invertida, es decir, que las personas participantes deberán asistir a las mismas habiendo previamente transitado los contenidos y actividades propuestos para los módulos desarrollados y/o a ser evaluados. La asistencia a estos espacios es de carácter opcional, sin embargo, se recomienda participar en ellos con el objetivo de fortalecer tanto los contenidos abordados como los vínculos entre los estudiantes y el cuerpo docente.

3$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=3-1-modalidades-de-cursado$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-3$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 2, $pea0$rg-3-2-cambios-de-modalidad$pea0$,
        $pea0$Cambios de modalidad$pea0$, $pea0$Podrán solicitar cambios de Modalidad, de Carrera, o de otra índole en los períodos definidos para cada tipo de gestión en el calendario de trámites publicado anualmente por la Secretaría de Organi…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=3-2-cambios-de-modalidad el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 3 | MODALIDADES DE CURSADO

### 3.2 CAMBIOS DE MODALIDAD

#### 3.2.1 GENERALIDADES

Podrán solicitar cambios de Modalidad, de Carrera, o de otra índole en los períodos definidos para cada tipo de gestión en el calendario de trámites publicado anualmente por la Secretaría de Organización Académica. Para ello deberá cumplir con las condiciones y requisitos vigentes al momento del cambio.

Si bien para realizar el cambio de modalidad/carrera, no es necesario tener Universitario 21 aprobado, como tampoco es requisito tener materias aprobadas del plan de estudios, quien se encuentre interesado deberá previamente verificar la condición en que quedarán sus materias al realizarse el pase.

Las materias regularizadas en la modalidad/carrera de origen, que pasen en la misma condición a la modalidad/carrera destino se rinden, en todos los casos, bajo las condiciones de calificación y metodología de evaluación de la modalidad de destino.

Las materias aprobadas y reprobadas pasan en igual condición a la nueva modalidad. Lo mismo ocurre con las sanciones disciplinarias que pueda registrar el alumno.

Siempre que se realice un cambio a modalidad ED (cualquiera sea la modalidad origen), o que se realice un cambio de CAU, será exclusiva responsabilidad de cada estudiante contactar al CAU de destino para asegurar su lugar en el mismo ya que no en todos los CAUs se ofrecen todas las carreras o todas las materias.

#### 3.2.2 CONDICIONES PARA EL CAMBIO DE MODALIDAD/CARRERA

Para quienes deseen realizar un cambio de modalidad/carrera deberán encontrarse en la siguiente condición:

- Cumplir las condiciones de ingreso de la nueva modalidad.
- Presentar libre deuda administrativa.
- No estar inscripto a una mesa de examen final.
- No tener una nota de examen final faltante o pendiente de carga.
- Para el cambio de modalidad es requisito no haber realizado más de 2 (dos) pases entre diferentes modalidades (PH/MP/PD a ED/EDH o viceversa).
- Para el cambio entre sub-modalidades presenciales, será requisito que la persona solicitante, haya permanecido al menos un cuatrimestre completo de cursado en su modalidad de origen.
- Tener completa la documentación obligatoria del legajo.
- Haber aceptado al momento del pase las condiciones del presente reglamento y expresamente las condiciones académicas y administrativas de la nueva modalidad que se encuentren vigentes.

#### 3.2.3 REGULARIDAD Y CURSADO DE LAS MATERIAS

Cuando un cambio de modalidad implique la actualización del plan de estudios la persona solicitante deberá cursar las materias que corresponden al nuevo plan en la modalidad destino, aun cuando ello signifique cursar nuevas materias que no estaban contenidas en el plan de origen, aplicándose lo establecido en la sección [14.1 Planes de Estudio](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=14-1-planes-de-estudio). En tal sentido, será responsabilidad de cada estudiante que solicite cambio de modalidad, interiorizarse sobre la vigencia de su plan de estudios actual, antes de realizar el pase.

Respecto a la condición que adoptan las materias al realizarse el pase, dependerá de la condición que la misma tenga en la modalidad de origen, aplicándose las siguientes reglas:

**Reglas comunes a todos los cambios de modalidad:**

- Las materias que se encuentran en estado “cursando” pierden dicha condición, quedando en condición “Libre por Pase” en la modalidad destino.
- Las materias en condición “Libre por Nota”, en todos los casos de pases, se pierde, quedando en estado “Libre por Pase” que implica recursar la materia.
- Las materias en condición Regular, en todos los casos, conservan el mismo estado en la modalidad destino, debiendo rendir cada estudiante, bajo las condiciones de evaluación de la modalidad de destino.
- Las materias en condición Aprobado, en todos los casos, conservan el mismo estado en la modalidad destino.

#### 3.2.4 RESPECTO DE LAS MATERIAS DE UNIVERSITARIO 21

Quien realiza un cambio de modalidad y/o carrera y tenga las materias de Universitario 21 aprobadas mantiene tal condición en la modalidad de carrera/destino. Para el resto de las condiciones se aplicarán las mismas reglas que para las
 materias curriculares del plan de estudio, conforme lo establecido en la sección precedente.

Las materias de Universitario 21 en condición “regular”, mantienen el estado en caso de pase de modalidad y/o carrera.

#### 3.2.5 RESPECTO DE LAS MATERIAS DE PROCESO

La condición de las Materias de Proceso se mantiene o se pierde según lo detallado a continuación:

- Las materias de proceso que se encuentran en estado “cursando” pierden dicha condición, quedando en condición “Libre por Pase” en la modalidad destino.
- Las materias de proceso en estado APROBADO en la modalidad de origen conservan esa condición en la modalidad de destino.
- Las materias de proceso en estado REGULAR en la modalidad de origen conservan esa condición en la modalidad destino
- La condición de las materias Seminario de Práctica o Seminario de Planificación y Control de gestión se pierden frente a un pase entre modalidades y sub-modalidades, solo se conserva la condición de REGULAR en los casos que se realice un pase de sub-modalidad ED a EDH o viceversa

- Estudiante Presencial (P), Presencial Home (PH.) y Presencial Distribuida (PD) que tenga el Seminario de Práctica/Seminario de Planificación y Control de Gestión en estado REGULAR por adeudar materias correlativas deberá aprobar las materias correlativas para poder adquirir la condición de Aprobado antes de hacer pase de modalidad a otra sub-modalidad o modalidad.
- Estudiante ED/EDH que tenga el Seminario de Práctica/Seminario de Planificación y Control de Gestión en estado REGULAR deberá rendir el examen EFIP I para aprobar la materia antes de hacer el pase a modalidad Presencial (MP) o Presencial Home (PH), aun cuando posea 21 o más materias aprobadas, de lo contrario perderá la regularidad debiendo recursar y aprobar la materia en la nueva modalidad.

**Nota: La condición REGULAR del SEMINARIO FINAL se mantiene en todos los casos.**

#### 3.2.6 RESPECTO DE LOS IDIOMAS

Si la persona solicitante ha cursado materias de idiomas, y las mismas se encuentran en estado “regular” o “cursando”, al realizar el pase pierde ambas condiciones y acepta la nueva propuesta de formación en idiomas de la Universidad mediante la Plataforma Multimedia de idiomas.

Debe cursar y finalizar sus idiomas extranjeros a través de la plataforma Multimedia, de acuerdo a lo previsto en el presente Reglamento. Sólo conserva el estado de las materias “APROBADAS”.

#### 3.2.7 RESPECTO DEL EFIP (EXAMEN FINAL INTEGRADOR PRESENCIAL) I Y II

Características, cursado, examen EFIP I y II, ver [Capítulo 4.5](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21#cap4-5)

### EFIP I

**Pase de Modalidad Presencial (PH, PD y P) a Modalidad Distancia (MD)**.

Si al momento del pase, tiene 21 (veintiuno) o más materias aprobadas en Modalidad Presencial, sea por promoción, examen final o equivalencia (se contabilizan cada uno de los niveles de idiomas aprobados y no se contabilizan materias electivas, ni materias Universitarios 21) que corresponden al primer tramo de la carrera, se exime de rendir EFIP I en modalidad distancia. En las carreras que No tienen módulo cursado de EFIP I, el Seminario de Práctica o Seminario de Planificación y Control de Gestión debe estar dentro de las 21 materias aprobadas al momento de realizarse el pase para que se aplique la eximición, caso contrario el alumno deberá cursar la materia y rendir el EFIP I en la modalidad destino.

**Pase de Modalidad Distancia (MD) a Modalidad Presencial (PH, PD y P)**.

Si al momento del pase, tiene 21 (veintiuno) o más materias aprobadas en modalidad distancia, sea por promoción, examen final o equivalencia, que correspondan al primer tramo de la carrera (sin contabilizar materias electivas, ni materias de CN o Universitario 21), debe rendir EFIP I antes de efectuar el PASE.

En ambos casos, se entiende por “primer tramo de la Carrera” al conjunto de materias curriculares comprendidas en el primer y el tercer año del Plan de Estudios (del 1º al 6º semestre).

### EFIP II

**Pase de Modalidad Presencial (PH, PD y P) a Modalidad Distancia (MD)**.

Si al momento del pase, tiene pendiente aprobar 5 (cinco) o más materias del último año de su carrera (sin contemplar el Seminario Final), al pasar a modalidad distancia deberá rendir EFIP II.

**Pase de Modalidad Distancia (MD) a Modalidad Presencial (PH, PD y P)**.

El pase se podrá realizar siempre que la persona solicitante haya aprobado hasta 4 (cuatro) materias, sea por promoción, examen final o equivalencia del último año de su carrera (sin contemplar Seminario Final) en modalidad distancia, resultando eximido de EFIP II al realizarse el pase. En caso de superar esa cantidad de materias aprobadas en modalidad distancia, NO se podrá realizar el pase de modalidad, debiendo el alumno finalizar el cursado en su modalidad actual.

En ambos casos, la aprobación de EFIP II es condición previa para realizar la defensa oral del Trabajo Final de Graduación (TFG) y obtener el título de grado que otorga la Universidad, en la modalidad de destino.

En aquellos casos en que corresponde la eximición de EFIP I o II, dicha eximición se limita a los mismos y no se hace extensiva al cumplimiento de las demás correlatividades establecidas de acuerdo al Plan de Estudios de la carrera.

| Modalidad Origen | Modalidad Destino | 1er al 6to semestre | Condición EFIP I |
| --- | --- | --- | --- |
| Presencial | Distancia | 21 o más materias aprobadas en Presencial incluido el Seminario de Práctica/ Seminario de Práctica y Control de Gestión | Eximido de EFIP I |
| Hasta 20 materias aprobadas en Presencial | Rinde EFIP I |  |  |
| Distancia | Presencia | 21 o más materias aprobadas en Distancia | Rinde EFIP I |
| Hasta 20 materias aprobadas en Presencial | Eximido EFIP I |  |  |
| Modalidad Origen | Modalidad Destino | 7mo al 8vo semestre | Condición EFIP II |
| Presencial | Distancia | Restan aprobar 5 o más materias en Distancia después del pase | Rinde EFIP II |
| Restan aprobar 4 o menos materias en Distancia después del pase | Eximido EFIP II |  |  |
| Distancia | Presencial | 5 o más materias aprobadas en Distancia | Inhibido de hacer pase de modalidad |
| Hasta 4 materias aprobadas en Distancia | Eximido EFIP II |  |  |

3$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=3-2-cambios-de-modalidad$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-4$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-4-1-estructura-academica$pea0$,
        $pea0$Estructura académica$pea0$, $pea0$La estructura académica no solo se concibe como un medio para alcanzar los objetivos del Modelo Académico, sino que se erige como el cimiento sobre el cual se construye una educación que trasciende…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-1-estructura-academica el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 4 | MODELO ACADÉMICO - ACADEMIA 21

En el presente capítulo se desarrolla el **Modelo Académico,**modelo institucional que se constituye bajo una mirada formativa integral con un enfoque pedagógico que sienta sus bases en dos pilares fundamentales que definen su identidad educativa: La Educación Positiva y el Modelo de Aprendizaje por Competencias.

La Educación Positiva es un enfoque educativo que se focaliza en fomentar el desarrollo integral de los estudiantes. De este modo, su objetivo no se limita únicamente al crecimiento académico, sino que abarca también aspectos emocionales, sociales y personales. Desde esta perspectiva, se busca nutrir las fortalezas y habilidades personales de los estudiantes para que logren un buen rendimiento académico, bienestar y crecimiento personal. Para lograr este propósito, nuestro modelo académico no se limita a la simple inclusión de lineamientos generales o contenidos de estudio. La Educación Positiva constituye un pilar transversal que orienta todos los elementos que conforman el modelo académico de la universidad.

Por su parte, el enfoque de Aprendizaje Basado en Competencias se centra en el desarrollo de habilidades prácticas y competencias específicas, trascendiendo la mera transmisión de conocimientos teóricos. Este enfoque tiene como objetivo preparar a los estudiantes para aplicar lo aprendido en situaciones del mundo real y abordar de manera efectiva los desafíos futuros. Se trata de un pilar transversal de nuestro modelo académico, ya que a partir del mismo se elaboran los diseños instruccionales y propuestas de intervención que abogan al desarrollo de competencias profesionales específicas, profesionales genéricas e institucionales.

Los pilares definidos son transversales a otros importantes componentes del modelo: el Diseño curricular, los Métodos y didácticas, el sistema de evaluación “Eva21” y la vinculación e investigación. Conjuntamente cada uno de estos componentes permiten generar una experiencia educativa enriquecedora e integral que permite preparar a los estudiantes para enfrentar los desafíos de un mundo dinámico y en constante evolución.

En el siguiente apartado se desarrollará; Estructura Académica, Universitarios 21, Diseño curricular, Métodos y didácticas, Eva21 y Vinculación e Investigación.

### 4.1 4.1. ESTRUCTURA ACADÉMICA

La estructura académica no solo se concibe como un medio para alcanzar los objetivos del Modelo Académico, sino que se erige como el cimiento sobre el cual se construye una educación que trasciende la simple transmisión de conocimientos. En este contexto, la Universidad Siglo 21 se compromete a mantener una estructura académica robusta, adaptable y colaborativa, con el propósito de fomentar una formación integral y enriquecedora para sus estudiantes. Esta estructura proporciona el marco esencial para una coordinación efectiva entre las diversas direcciones de carrera.

Por esta razón, la estructura académica de la Universidad Siglo 21 contempla la figura del Decano como autoridad académica, desempeñando un papel crucial al definir los lineamientos estratégicos y colaborar estrechamente con los Directores de Carrera en la elaboración y ejecución del diseño curricular. La institución cuenta con cinco Decanatos formalizados según la Resolución de la Comisión Superior (RCS) N° 479/2015: Decanato de Ciencias Aplicadas, Decanato de Ciencias del Derecho, Decanato de Ciencias Humanas y Sociales, Decanato de Ciencias de la Salud y Decanato de Ciencias de la Administración y Management.

Desde cada decanato se desarrolla una visión integral y se definen los aspectos cruciales del diseño curricular, estableciendo así un entramado con los equipos de Directores de Carrera que facilita su implementación efectiva. Este enfoque colaborativo y transversal garantiza una ejecución coherente y efectiva de los lineamientos académicos, reflejando el compromiso de la institución con la excelencia educativa y la capacidad de adaptación a las demandas cambiantes del entorno educativo.

4$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-1-estructura-academica$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-4$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 2, $pea0$rg-4-2-diseno-curricular$pea0$,
        $pea0$Diseño curricular$pea0$, $pea0$El diseño curricular de una universidad se refiere al proceso de planificación y organización de los programas académicos y de estudio. Este diseño busca establecer la estructura, secuencia y conte…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-2-diseno-curricular el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 4 | MODELO ACADÉMICO - ACADEMIA 21

### 4.2 DISEÑO CURRICULAR

El diseño curricular de una universidad se refiere al proceso de planificación y organización de los programas académicos y de estudio. Este diseño busca establecer la estructura, secuencia y contenido de los cursos y programas de manera coherente y efectiva para cumplir con los objetivos educativos y las metas institucionales. A continuación, se describe el diseño curricular de la Universidad Siglo 21, el cual involucra una descripción del sistema de ingreso, la estructura curricular y la tipología de materias.

#### 4.2.1 SISTEMA DE INGRESO: UNIVERSITARIO 21

" **UNIVERSITARIO 21**” constituye el sistema de Ingreso a la Universidad para todos aquellos inscriptos en carreras de Grado o Pregrado. Su objetivo es guiar a los estudiantes durante el primer tramo de sus estudios, proporcionándoles una inducción efectiva y una introducción al modelo académico facilitando la adaptación y el progreso de cada estudiante en sus primeros pasos en la Universidad.

Este espacio cuenta con un módulo denominado Introducción a la Vida Universitaria y dos materias que se cursan en el primer semestre de la carrera, según la modalidad de estudio elegida. Las materias son: “Aprender en el Siglo 21” y “Tecnología, Humanidades y Modelos Globales”. En el caso de Posgrados, remitirse al Reglamento de cada Programa.

#### 4.2.1.1 INTRODUCCIÓN A LA VIDA UNIVERSITARIA

El módulo “Introducción a la Vida Universitaria” es el primer hito académico que debe cumplir quien ingrese a carreras de Grado o Pregrado, previo al inicio del cursado de su carrera.

El módulo “Introducción a la Vida Universitaria” busca aportar valor y significado a la experiencia de ser estudiante Siglo21, a través de aquellos componentes que se consideran fundamentales para la construcción del sentido de pertenencia y de una experiencia memorable vinculada a su trayecto formativo. En esta propuesta se le brinda al estudiante herramientas para conocer cómo funciona la Universidad, el modelo de cursado elegido, el sistema de evaluación, los accesos y el uso de las plataformas informáticas con las que trabajará a lo largo de toda su carrera.

En la Modalidad Presencial (P), Presencial Home (PH) y Presencial Distribuida (PD) deben asistir a “Introducción a la Vida Universitaria” para recibir la bienvenida como estudiantes de la institución, en la sede y/o Centro de Apoyo Universitario en la cual cursarán su carrera y en la fecha asignada de acuerdo al cronograma de su modalidad de estudio.

En la Modalidad Distancia, ya sea Educación Distribuida (ED) o Distribuida Home (EDH) deben asistir a “Introducción a la Vida Universitaria” para recibir la bienvenida como estudiantes de la institución en el Centro de Apoyo Universitario (CAU). Cada estudiante debe consultar en el CAU la fecha y horario asignada para participar de este hito académico y coordinar con el CAU el registro de la asistencia. Es obligación del CAU dictar esta introducción a todas las personas ingresantes en la semana posterior a la inscripción.

**IMPORTANTE: La “Introducción a la Vida Universitaria” es requisito obligatorio para todas las modalidades de estudio que tiene la Universidad.**

#### 4.2.1.2 MATERIAS UNIVERSITARIO 21

UNIVERSITARIO 21 contempla dos materias que se integran, durante el primer semestre, al cursado de todas las carreras de grado o pregrado, cualquiera sea la modalidad de estudio elegida por cada estudiante. Es decir, que durante su primer cuatrimestre o bimestre de cursado (según corresponda) el alumnado deberá cursar las 2 (dos) materias:

- **Aprender en el Siglo 21**: La propuesta principal de este espacio curricular se centra en brindar herramientas que permitan orientar a cada estudiante en el inicio de su relación con la Universidad. Temas transversales a la vida académica como la autorregulación del aprendizaje, autogestión, autoconfianza y el desarrollo de competencias blandas y socioemocionales son parte constitutiva de la materia. En ella se desarrollan específicamente competencias institucionales que profundizan en la construcción de nuevos hábitos de estudios y así contar con herramientas concretas para transitar su recorrido académico.
- **Tecnología, Humanidades y modelos Globales:** A partir de un marco conceptual enmarcado en los cambios y las dinámicas que los procesos tecnológicos como los fenómenos de globalización han propuesto en nuestra vida, la materia propone potenciar competencias vinculadas a las habilidades y desafíos que el contexto actual demanda a las diferentes profesiones. Tecnología, Humanidades y modelos Globales se constituye, en un espacio que permitirá al estudiantado comprender desde el inicio de su cursado, el impacto que tendrá su desarrollo profesional en el contexto laboral.

Las materias de Universitario 21 contienen elementos claves que facilitan y promueven el proceso de adaptación de los estudiantes a la Universidad, de manera que su realización y aprobación se considera fundamental. Es por ello que su diseño, está pensado para ser transitado al inicio de su trayectoria.

**IMPORTANTE**: Cada estudiante puede promocionar y aprobar exámenes finales de las materias curriculares del 1°, 2° y 3° cuatrimestre de su plan de estudio, aunque no tenga las materias de UNIVERSITARIO 21 aprobadas. **Es condición necesaria para poder inscribirse a cursar materias del 4° cuatrimestre de su plan de estudios, tener aprobadas dichas materias.**

#### 4.2.1.3 ESPECIFICACIONES DE UNIVERSITARIO 21

Estarán exentos de cursar las materias de UNIVERSITARIO 21 en los siguientes casos:

- Ingresantes a Ciclos de Complementación Curricular (Escribanía, Licenciatura en Educación, Licenciatura en Gerontología, Licenciatura en Emprendimiento, Licenciatura en Administración de Servicios de Salud, Licenciatura en Psicopedagogía CCC, y Profesorado Universitario para el Nivel Secundario y Superior) o Articulación con Institución Cervantes.
- Ingresantes que inicien el cursado de una nueva oferta académica de Grado o Pregrado, sea por cambio de carrera, segunda carrera o articulación, y ya posean el Curso de Nivelación o Universitario 21 aprobado en una carrera anterior o ya se hayan egresado de su carrera anterior de Siglo 21.
- Ingresantes que inicien el cursado de una nueva oferta académica de Grado o Pregrado, sea por cambio de carrera o segunda carrera y ya posean al menos dos materias aprobadas en un Ciclo de complementación curricular de la oferta de Siglo 21.
- Ingresantes que inicien su cursado en una nueva Oferta Académica de Grado o Pregrado y que hayan realizado el trámite de reconocimiento de materias por equivalencias externas, cuando se les hayan otorgado cinco (5) materias o más en su legajo de destino.
- Estudiantes que cuenten con cinco (5) materias o más aprobadas en su legajo, ya sea por reconocimiento de materias por equivalencias o por su cursado y aprobación en la Universidad.

Las personas no contempladas en las situaciones anteriores, que ingresen a la Universidad deberán cursar las materias Aprender en el Siglo 21 y Tecnología, Humanidades y Modelos Globales.

#### 4.2.1.4 MODALIDAD DE CURSADO, EVALUACIÓN Y VIGENCIA

Las materias de UNIVERSITARIO 21 se cursan y evalúan con idénticas reglas y condiciones que las materias curriculares correspondientes al plan de estudios de cada carrera, conforme la Modalidad en que cursa cada estudiante, lo mismo aplica para la condición de aprobación y vigencia de la regularidad. Remitimos a lo detallado en las secciones correspondientes de acuerdo a la Modalidad de cursado optada.

#### 4.2.1.5 RECURSADO O REINSCRIPCIÓN DE UNIVERSITARIO 21

Cuando se deba recursar o reinscribirse a una o ambas materias de UNIVERSITARIO 21, deberá hacerlo según las condiciones vigentes al momento de la reinscripción.

#### 4.2.2 ESTRUCTURA CURRICULAR

El Aprendizaje por Competencias es un pilar del Modelo Académico, por lo cual la estructura curricular de los planes de estudio y programas en la Universidad Siglo 21 cuentan con diseños que apuntan específicamente al desarrollo de competencias. Estas competencias pueden ser institucionales, genéricas o específicas para la formación profesional del alumnado. Las competencias institucionales representan habilidades, conocimientos y actitudes consideradas fundamentales para todos los graduados, alineadas con la misión y valores de la institución. Ejemplo de éstas competencias son la gestión del conocimiento, la acción emprendedora o la actuación colaborativa en ecosistemas de bienestar. Por otro lado, las competencias genéricas apuntan a desarrollar habilidades aplicables a diversas disciplinas y contextos, como por ejemplo, el pensamiento crítico, la gestión de proyectos o la gestión de la comunicación. En contraste, las competencias específicas están directamente relacionadas con la disciplina o área de estudio particular del estudiante, enfocándose en conocimientos técnicos y habilidades especializadas.

La diferenciación entre competencias institucionales, genéricas y específicas, genera una estructura curricular que involucra materias sello, matriciales y programáticas. Las materias sello, compartidas por todos los programas de estudio, cumplen la función de fomentar los valores identitarios y las competencias institucionales propias de la Universidad. Por otro lado, las materias matriciales, concebidas con contenidos transversales a diversas disciplinas, tienen como objetivo la adquisición y fortalecimiento de competencias profesionales genéricas e institucionales. Finalmente, las materias programáticas, específicas para cada disciplina, proporcionan contenidos y experiencias prácticas diseñadas para la formación concreta de cada titulación. A continuación, se describe en profundidad cada una de ellas.

#### 4.2.2.1 MATERIAS SELLO

Son aquellas que son compartidas por todos los programas de estudio y que promueven los valores identitarios y competencias institucionales de la Universidad Siglo 21. Su característica, además de fomentar el trabajo colaborativo al integrar al estudiantado de diferentes titulaciones, es brindar las herramientas y conocimientos que se consideran imprescindibles para desarrollar habilidades emprendedoras, destrezas técnicas y tecnológicas y una formación humanista con perspectiva global. Tal es el caso de las materias Desarrollo Emprendedor, Emprendimientos Universitarios, Grupo y Liderazgo, Práctica Solidaria e Idioma Extranjero.

#### 4.2.2.2 MATERIAS MATRICIALES

Son aquellas que poseen contenidos transversales a diferentes disciplinas. En este caso, su objetivo es la adquisición y desarrollo de competencias profesionales genéricas e institucionales, fomentando el trabajo colaborativo al integrar al estudiantado de diferentes titulaciones y la inter y transdisciplina a partir de la construcción de un conocimiento colectivo en base a materiales, didácticas y prácticas que permitan la confluencia de disciplinas complementarias.

Las materias matriciales reúnen estudiantes de distintas carreras y promueven el trabajo interdisciplinario mediante materiales y metodologías compartidas. En última instancia, las materias matriciales no solo enriquecen el bagaje académico de los estudiantes, sino que también cultivan habilidades de trabajo en equipo, pensamiento crítico y una comprensión más holística de los desafíos contemporáneos, preparándolos para enfrentar situaciones complejas en su futuro profesional con una perspectiva multidisciplinaria.

#### 4.2.2.3 MATERIAS PROGRAMÁTICAS

Incluyen materias propias y específicas a cada formación disciplinar. Sus contenidos y
 experiencias prácticas responden a una titulación concreta, brindando y promoviendo la
 adquisición de conocimientos y el logro de competencias que debe poseer el alumnado
 para su futuro ejercicio profesional y que les confieren un dominio de saberes que les
 son particulares y propios a su formación.

Al centrarse en aspectos particulares de una disciplina, las materias programáticas
 permiten a los estudiantes adquirir una comprensión profunda y especializada de los
 principios, teorías y prácticas asociadas con su campo de estudio. De esta manera,
 las materias programáticas contribuyen a conferir a los estudiantes un dominio sólido
 de saberes específicos a su formación, preparándolos de manera óptima para destacarse
 en su área profesional y responder de manera efectiva a los desafíos y demandas del
 entorno laboral.

#### TIPOLOGÍA DE MATERIAS PROGRAMÁTICAS SEGÚN NIVEL DE COMPETENCIA

El Modelo Académico contempla la necesidad de ofrecer a los estudiantes una progresión
 coherente e incremental en el desarrollo de competencias a lo largo de su formación
 académica. Por este motivo, dentro de la estructura de las materias programática y de
 acuerdo al nivel de competencias que desarrollan se pueden distinguir las siguientes
 tipologías de materias:

- A. Materias de Exploración y Conceptualización (MEC)*
- B. Materias de Integración y Aplicación (MIA)*
- C. Materias de Intervención Profesional (MIP)*
- D. Materias de Aplicación Preprofesional (MAP)*

#### A. Materias de Exploración y Conceptualización (MEC)

Las Materias de Exploración y Conceptualización están diseñadas para proporcionar al
 alumnado experiencias de aprendizaje significativas y orientadas al desarrollo de
 competencias genéricas y vinculadas esencialmente a comprender, mostrar entendimiento
 básico de hechos e ideas a la hora de encontrar información, recordar información,
 relevar datos y conceptos básicos.

También se incluye un Foro de Evaluación de Pares para fomentar la interacción entre
 compañeros, con un constante feedback de parte del cuerpo docente, promoviendo así
 el diálogo y la mejora continua.

Esta tipología de materia cuenta con una carga horaria de entre 2 (dos) y 3 (tres)
 horas semanales y tiene una duración bimestral o cuatrimestral, según la modalidad
 de estudios.

#### B. Materias de Integración y Aplicación (MIA)

Las Materias de Integración y Aplicación (MIA) buscan proporcionar al alumnado un
 espacio dinámico y colaborativo donde puedan integrar y reflexionar sobre sus
 conocimientos. Además, ofrecen la oportunidad de aplicar y consolidar sus saberes a
 través de instancias de debate e interacción en foros, con el objetivo de promover el
 desarrollo de competencias profesionales específicas con énfasis en examinar, identificar
 causas y aplicar el conocimiento en situaciones prácticas y contextos diversos.

Las actividades propuestas en las materias MIA requieren de un proceso de comprensión
 y desarrollo de mayor complejidad cognitiva y tienen la particularidad de contar con
 trabajos prácticos con consignas abiertas, que posibilitan un enfoque práctico y
 crítico y, al mismo tiempo, una evaluación más detallada y personalizada por parte
 de los docentes.

Esta tipología de materia cuenta con una carga horaria de 4 (cuatro) a 6 (seis) horas
 semanales y tiene una duración bimestral o cuatrimestral, según la modalidad de
 estudios.

#### C. Materias de Intervención Profesional (MIP)

Las Materias de Intervención Profesional (MIP) representan un componente esencial del
 plan de estudios que busca proporcionar al estudiantado un espacio de aplicación
 práctica de sus conocimientos, orientado a la creación de soluciones profesionales
 efectivas. El énfasis en la evaluación crítica y la capacidad de proponer soluciones
 innovadoras contribuye al desarrollo integral de competencias esenciales para su
 futura labor profesional vinculadas a procesos cognitivos de mayor complejidad como
 crear, proponer y evaluar.

A partir de consignas abiertas de progresiva complejidad y a través del intercambio
 en foros, estas materias se distinguen por orientar sus instancias evaluativas hacia
 la creación de soluciones o propuestas que integren los conocimientos específicos de
 la formación profesional con situaciones hipotéticas o reales del mundo social y
 productivo.

Las MIP cuentan con una carga horaria de 6 (seis) o más horas semanales y están
 diseñadas exclusivamente para cursarse de manera cuatrimestral en todas las modalidades
 de estudio.

#### D. Materias de Aplicación Preprofesional (MAP)

Las materias de Aplicación Preprofesional (MAP) constituyen una tipología innovadora
 dentro del diseño curricular propuesto. Dicha tipología está orientada a promover el
 desarrollo progresivo de competencias profesionales específicas a través de prácticas
 preprofesionales en entornos reales o simulados. Estas materias están alineadas con
 el modelo de aprendizaje basado en competencias y tienen como propósito principal
 facilitar la integración teórico-práctica desde los primeros años de formación académica.

Las MAP están diseñadas para desarrollar competencias profesionales específicas a
 través de tres niveles de intervención:

- **Intervención Básica:** primer acercamiento a la práctica preprofesional,  mediante observación de situaciones reales o simuladas de bajo riesgo, sin vinculación  con proyectos de extensión u organizaciones. Metodología de aula invertida con  actividades específicas.
- **Intervención Intermedia:** aplicación de conocimientos en contextos  reales, participación en comunidades de práctica, elaboración de diagnósticos y  participación en proyectos de extensión como PAT, PIC y SEC.
- **Intervención Avanzada:** aplicación de competencias desarrolladas  en áreas disciplinares específicas, resolución de problemas reales, vinculación  efectiva con organizaciones públicas, privadas, ONG u organismos gubernamentales.  Carga horaria de 4 a 8 horas semanales según nivel de intervención, cursado  bimestral o cuatrimestral.

IMPORTANTE: Al inscribirse al cursado, el alumnado podrá visualizar la tipología
 a la que corresponde cada materia. La inscripción implica el conocimiento y aceptación
 de las condiciones de cursado y aprobación de la tipología, según corresponda.

#### 4.2.2.4 MATERIAS ELECTIVAS

Además de las materias sello, matriciales y programáticas nuestro Modelo Académico incorpora materias que poseen contenidos y competencias considerados de interés y complemento académico para las distintas titulaciones. Estas materias permiten la profundización de temas ya previstos en la formación, pero incorporando nuevas perspectivas que amplían los alcances de la titulación, o bien sobre la adquisición de competencias que el alumnado valore de relevancia para su perfil profesional.

Quienes cursen carreras de grado deben cumplir con créditos en materias electivas según la cantidad que determina cada plan de estudio, siendo ésta una actividad curricular que complementa el proceso de enseñanza-aprendizaje y que es **requisito exigible para la obtención del título de grado.**

Se pueden cursar y aprobar para la obtención de créditos, asignaturas de otras carreras que no pertenecen a la currícula, siempre que se encuentren habilitadas como electivas por definición de la Dirección de cada carrera, y siempre que se dicten en la misma modalidad de cursado. Quienes no posean Idioma Extranjero en su plan de estudios, no pueden optar por cursar y aprobar contenidos de idiomas como materias electivas.

La Universidad también podrá, mediante acto administrativo, establecer el reconocimiento de materias electivas por la realización de actividades extracurriculares que se consideren complementarias de la formación curricular y que promuevan el desarrollo de competencias en espacios que trascienden el aula.

El período de apertura en el cual se pueden cursar las materias electivas será el que corresponda a la carrera de origen. Los alumnos de Modalidad Educación Distribuida deben realizar las materias electivas con cursado virtual sin asistencia presencial.

#### 4.2.2.5 MATERIAS DE PROCESO

Durante el transcurso de las materias sello, matriciales y programáticas los estudiantes van adquiriendo y desarrollando competencias. No obstante, para el pleno desarrollo de las competencias, se requiere de horas prácticas donde los estudiantes puedan aplicar las competencias adquiridas en contextos reales o simulados. Esto tiene lugar en las asignaturas denominadas de proceso y en instancias evaluativas integradoras en los diferentes tramos académicos de la carrera (ver sección EVA 21).

Las Materias de Proceso tienen la finalidad de integrar los contenidos específicos y las competencias profesionales, vinculando los conocimientos con la realidad práctica, a partir del análisis global de situaciones simuladas y/o de la inmersión en organizaciones donde se pone en juego la transferencia y aplicación de conocimientos teóricos a la realidad.

El cursado de estas materias permite la evolución en el desarrollo del pensamiento teórico y profesional del alumnado, llevando a cabo un acercamiento real al ejercicio de la profesión, la toma de decisiones, y la búsqueda de soluciones innovadoras a problemas complejos.

#### 4.2.2.6 MATERIAS DE PROCESO DE CARRERAS DE GRADO

#### PRÁCTICA PROFESIONAL

La Práctica Profesional (PP) es una materia de integración curricular vinculada a la praxis
 académica, en la cual el estudiantado transita una experiencia de formación a través de
 la vinculación directa con su contexto profesional real. Integra ejes temáticos transversales
 y de actualización, tales como la inclusión social, derecho al trabajo, igualdad de
 oportunidades, condiciones de empleabilidad frente a la edad, educación, formación profesional, etc.

Dicha práctica brinda al estudiante un espacio donde se combinan y aplican conocimientos
 adquiridos a lo largo de la carrera en una realidad concreta. La propuesta curricular recorre
 un entorno de aprendizajes híbridos – virtualidad y presencialidad – que favorece al
 desarrollo de competencias específicas, ancladas en su formación profesional.

En este sentido, la materia tiene como objetivo maximizar el aprendizaje del estudiantado
 integrando las competencias profesionales específicas y conocimientos adquiridos para
 la identificación y análisis de oportunidades en el ámbito profesional, formulando
 propuestas fundamentadas y sustentables para la organización o institución. Al mismo tiempo,
 promueve el desarrollo de habilidades humanas tales como empatía, trato personal,
 reconocimiento de las demás personas y trabajo en equipo.

El recorrido de esta materia se constituye como una de las propuestas más desafiantes
 y relevantes del plan curricular del alumnado, ya que representa la aplicación directa
 de los conocimientos adquiridos a lo largo de su carrera, así como también un espacio
 de vinculación interdisciplinaria que enriquece la proyección profesional futura en
 el marco de una práctica supervisada.

#### Diseño Instruccional

La asignatura PP es una materia de cursado cuatrimestral y obligatorio, que puede
 transitarse en modalidades presencial o a distancia, dependiendo de la modalidad de cursado
 de la carrera. Está compuesta por cuatro (4) módulos con una propuesta curricular
 asociada al desarrollo de competencias profesionales específicas que se recorren de manera
 paulatina y de progresiva complejidad.

La asignatura transita por contextos de aprendizajes híbridos: un contexto virtual a
 través del Sistema de Aprendizaje Multimedial (SAM), un contexto presencial y un contexto
 profesional real. En este último, como contexto experiencial profesional, el estudiantado
 debe cumplimentar 250 (doscientas cincuenta) horas de práctica organizacional,
 debiendo realizar entre 20 y 25 horas semanales para asegurar el cumplimiento de las mismas
 en el periodo de cursado establecido según su modalidad.

Quienes se inscriban al cursado de la materia Práctica Profesional deberán realizar un
 taller preparatorio previo al comienzo de su cursado. Finalizado el mismo, el estudiante
 podrá:

- Solicitar a la Universidad la asignación de una Organización para llevar a cabo su Práctica Profesional.
- Proponer a la Universidad una Organización para llevar a cabo su Práctica Profesional,  que deberá ser aprobada dentro de los 4 días hábiles de realizada la propuesta. En caso  de rechazo, deberá realizar una nueva propuesta o solicitar la asignación de la Organización  por parte de la Universidad, considerando los requisitos de la organización y/o tutor organizacional.
- En caso de proponer una organización y faltasen datos, la persona solicitante podrá  cumplimentarlos hasta el comienzo del periodo de cursado; de lo contrario, se le asignará  una organización por parte de la Universidad.
- Manifestar una incompatibilidad de concurrencia para realizar la Práctica Profesional,  debidamente acreditada mediante documentación. Los únicos casos contemplados son  privación de la libertad o tareas habituales del empleo actual vinculadas a la carrera,  que conforme a la normativa vigente no puedan realizarse fuera del ámbito laboral.

De manera excepcional, los estudiantes con incompatibilidad de concurrencia no deberán
 asistir presencialmente a una organización y el docente asignará tareas simuladas con
 carga horaria equivalente a las 250 horas de la instancia organizacional.

Los estudiantes que no hayan realizado el taller obligatorio preparatorio, la Universidad
 les preasignará una organización, pudiendo aceptarla o proponer otra que deberá ser aprobada.
 Excepcionalmente, cuentan con 7 días adicionales para proponer una organización; pasado
 ese plazo, deberán realizar la propuesta en la primera semana de cursado, caso contrario
 quedarán en condición de LIBRE. (Art. 13 Res.Rec. Nº 3810/20)

#### Condiciones para la organización

Para definir una institución u organización, las mismas deberán cumplir con las siguientes condiciones:

- Deben ser organizaciones con personería jurídica o un profesional independiente, presentando copia actualizada de Constancia de Inscripción en ARCA.
- Las tareas abordadas deben estar relacionadas con el perfil de carrera del estudiante.
- La organización debe brindar un referente institucional que acompañe al estudiante, vinculado con el personal docente, cumpliendo requisitos formales. Para carreras del Art. 43 de la Ley de Educación Superior, el referente debe tener formación académica y profesional acorde.
- Los estudiantes de carreras del Art. 43 deben realizar la práctica profesional de manera presencial.
- Para la carrera de Contador Público, el tutor deberá acompañar el título profesional.
- La organización debe firmar convenio marco y convenios anexos siempre que corresponda.

#### Pautas adicionales

- **Organización familiar:** Para autorizar el cursado en organizaciones familiares o propias,  el referente no debe ser un familiar directo ni subordinado del estudiante.
- **Organización donde preste servicios:** puede proponerse siempre y cuando cumpla  con las condiciones establecidas y el referente sea un superior a cargo.

#### Requisitos de documentación

- Todos los estudiantes deberán presentar a través del SAM o plataforma designada  el Convenio Marco (Art.19 Res.Rec. Nº 3810/20) firmado por ellos y el responsable legal  de la organización, indicando fecha de inicio y finalización, días y horarios para  cumplir las 250 horas. La entrega del convenio firmado presupone el inicio de la  instancia organizacional.
- Los estudiantes con inicio tardío deberán asegurar en el convenio las 250 horas de práctica  profesional dentro del plazo establecido.
- La supervisión de la Práctica Profesional la realiza el cuerpo docente a cargo y  un interlocutor interno designado por la organización, sin excepciones por experiencia  laboral previa del estudiante.
- Presentar Convenio Marco y Anexo hasta la fecha de presentación del Trabajo Práctico 1  según el calendario académico de cada modalidad de estudio.

En la sección de EVA 21 se detallan las condiciones de aprobación.

#### PRÁCTICA SOLIDARIA

Todos los planes de estudio de grado, independientemente de la modalidad de cursado, incluyen la materia Práctica Solidaria como una instancia obligatoria para todos los estudiantes. Esta experiencia puede cursarse a partir del tercer cuatrimestre y no tiene costo para el alumnado, lo que demuestra la flexibilidad y el compromiso que la Universidad tiene con esta materia.

La Práctica Solidaria se funda en la participación activa de los estudiantes en organizaciones sociales, donde realizarán tareas comunitarias que le permitirán acceder a un espacio de integración y aplicación de competencias en un contexto no tradicional de aprendizaje que completa su proceso de formación. El objetivo es claro: la materia Práctica Solidaria, se constituye en un pilar del modelo académico, que concibe la formación en valores, con conciencia ética y solidaria, como elementos indisociables de la formación profesional.

Con el propósito de impactar en su comunidad, cada alumno deberá buscar una organización de su interés en donde realizar la práctica; en caso de no contar con una organización desde la Universidad se le brindará una para que pueda llevar a cabo su cursado.

El cursado en las organizaciones sociales cuenta con el acompañamiento y supervisión del cuerpo docente, que no solo guía el proceso en la organización, sino que también supervisa las actividades realizadas por cada estudiante a través del SAM.

Esta asignatura busca no solo complementar la formación profesional del estudiantado, sino también desarrollar en ellos la Responsabilidad Social (RS) que les compete como ciudadanos y futuros líderes sociales. A través de esta experiencia formativa, se pretende que el alumno desarrolle una experiencia continua, permanente y sistemática de inserción y vinculación con diferentes situaciones sociales en las que están en juego la preocupación profunda por el hombre y su ambiente.

Es importante subrayar que la Práctica Solidaria no es una Práctica Profesional, ya que no implica la vinculación directa o la generación de espacios estrechamente relacionados con su disciplina de estudio del estudiante. Su enfoque está en promover valores, actitudes y habilidades sociales que contribuyan al desarrollo integral de los individuos en su rol de ciudadanos comprometidos.

La asignatura comprende dos instancias de aprendizaje:

- En espacios áulicos (SAM y/o aula presencial, según modalidad) en los que se realiza el acompañamiento de la práctica en el terreno.
- En contextos organizacionales específicos. Se trata de una práctica in situ en una organización de la sociedad civil validada por el cuerpo docente, en la cual el alumno debe cumplir al menos 3 (tres) horas semanales de servicio comunitario durante 16 semanas.

Para quienes cursen en la Modalidad Presencial y Presencial Home la vinculación con la organización donde se desarrolla la Práctica Solidaria está a cargo del Centro de Sustentabilidad Social y el seguimiento se realiza a través del SAM por los Docentes de la materia. Además, estos estudiantes deben participar de la realización de 4 (cuatro) encuentros sincrónicos en donde se brindan los lineamientos para el desarrollo de la Práctica.

Para quienes cursen en la Modalidad Distancia (ED y EDH) la selección de una organización social para realizar la Práctica Solidaria corresponde a cada estudiante, siendo el cuerpo docente a cargo de la materia el encargado de validar la pertinencia de la organización y del proyecto social en el que la persona inscripta propone realizar su práctica.

La supervisión de la Práctica Solidaria la realiza el cuerpo docente de la materia (designado por la Universidad) y una persona que actuará de Interlocutor Interno (designado por la organización), debiendo cada estudiante presentar la evaluación de desempeño realizada por la organización como una de las condiciones para adquirir la aprobación de la materia.

En la sección de EVA 21 se detallan las condiciones de aprobación.

#### TRABAJO FINAL DE GRADUACIÓN

Para obtener su título toda persona inscripta en una carrera de Grado deberá cumplimentar con un proceso general e integral de evaluación, denominado Trabajo Final de Graduación (TFG). El Trabajo Final de Grado permite a cada estudiante demostrar que ha logrado asimilar las destrezas necesarias para evaluar y llevar a cabo su disciplina. Se espera que, en su trabajo, utilice los conocimientos adquiridos durante sus estudios y que demuestre el nivel de criterio profesional que ha conseguido desarrollar.

En el Trabajo Final de Grado, cada estudiante pondrá de manifiesto su capacidad para desarrollar proyectos profesionales o bien para crear conocimiento, con lo adquirido en sus estudios y de acuerdo a la tipología de trabajo seleccionada y al tópico y metodología elegida.

El cursado de la materia Trabajo Final de Grado cuenta con las siguientes instancias:

- **Primera etapa:** Cursado de la asignatura Seminario Final a través del cual desarrolla su Proyecto de Trabajo Final de Grado. A tal efecto responde a consignas de entrega de avances del trabajo administradas por el cuerpo docente a través de la Tutoría que se realice durante el período de cursado de la asignatura.
- **Segunda etapa:** finalizado el cursado de la materia, se designa una Comisión Asesora y Evaluadora (CAE) constituida por dos miembros como mínimo, tomados del banco de evaluadores de Trabajo Final de Grado. El CAE tiene como objetivo potenciar y evaluar el producto logrado por el alumnado, concentrándose en las sugerencias y propuestas de mejora para ser presentadas en la Defensa Oral. El CAE, está conformado por docentes de la Universidad que acrediten un currículum con experiencia y antecedentes profesionales de relevancia en los últimos diez años. Cumple la función de guía y asesoramiento en el Trabajo Final de Grado.
- **Tercera etapa**: aprobado Trabajo Final de Grado, el alumno estará en condiciones de solicitar la realización de la Defensa Oral, que se realiza en la Sede Campus sita en la Ciudad de Córdoba, en una instancia de evaluación sincrónica docente-estudiante. [(Ver apartado 12.2.2.)](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=12-2-trabajo-final-de-graduacion#cap12-2-2)

#### SEMINARIO DE PRÁCTICA

La materia Seminario de Práctica, es una materia de proceso que tiene como objetivo integrar contenidos específicos de las materias nodales del plan curricular, promoviendo con su cursado, el desarrollo de competencias profesionales específicas evidenciadas en la resolución de las actividades evaluativas propuestas. Aquí, el análisis, la fundamentación oral y escrita y la postura crítica de fundamentos y argumentaciones adquieren una relevancia preponderante.

En las carreras en las que el Seminario de Práctica o el Seminario de Planificación y Control de Gestión formen parte del plan de estudios, la acción educativa se desarrolla a través del SAM, bajo contextos profesionales simulados vinculadas a las didácticas institucionales: Aprendizaje Basado en Caso o Aprendizaje Basado Problemas, dependiendo de la carrera. En estos espacios curriculares, si bien la incorporación de nuevos conceptos también está presente, el foco central comienza a colocarse, en la aplicación e interrelación de conceptos, análisis crítico para dar respuesta y soluciones profesionales concretas en el contexto real o simulado propuesto.

#### • Diseño Instruccional

Los Seminarios de Práctica y Seminarios de planificación y Control, integran y profundizan los ejes temáticos modales de las materias que forman parte del plan de estudio de la carrera, con un abordaje didáctico transversal impactando de manera directa en cada uno de contenidos desarrollados.

La materia se compone de cuatro (4) módulos, cada uno de ellos cuenta con un trabajo práctico y una actividad práctica. Los trabajos prácticos, como instancia evaluativa de proceso, apunta a la aplicación de conocimientos de manera paulatina y progresiva en complejidad, dando lugar al desarrollo de competencias profesionales específicas y genéricas, al mismo tiempo que promueve la argumentación oral y escrita y posicionamiento crítico para su resolución. Las actividades prácticas permiten al estudiantado hacer un recorrido metacognitivo y de diagnóstico de los conocimientos adquiridos.

El cursado de esta materia puede ser presencial o virtual, dependiendo de la modalidad de cursado de la carrera.

#### INTEGRACIÓN PROFESIONAL: ESTUDIO DEL CASO

Las carreras que incluyen en su plan de estudio esta asignatura tienen como objetivo principal desarrollar competencias profesionales específicas. En este sentido, se propone un recorrido de cursado con una propuesta didáctica vinculada a el Aprendizaje Basado en Caso, el cual pretende, a partir de situaciones reales, vincular al alumnado con el análisis crítico, aplicación de conocimiento.

En estos espacios curriculares, el foco central se encuentra en el diagnóstico del caso, la aplicación e interrelación de conceptos creando posibles soluciones problemática planteada.

#### IDIOMA EXTRANJERO

En la Universidad Siglo 21, las Carreras de Grado contemplan en sus planes de estudio como obligatorio, el aprendizaje y cursado de Idioma Extranjero. La propuesta se centra específicamente en los Idiomas Inglés y Portugués.

#### IDIOMA INGLÉS:

Quedan exceptuadas de su cursado las siguientes carreras:

- Abogacía
- Contador Público
- Diseño Gráfico
- En Publicidad

La mayoría de las Carreras de grado que constituyen la oferta académica de la Universidad Siglo 21, a excepción de las mencionadas anteriormente, presentan la obligatoriedad del cursado de Idioma Inglés. Transitar por este recorrido permite al estudiantado abordar una variedad de lecciones con ejercicios prácticos que les ayudarán a mejorar las cuatro habilidades esenciales del idioma: escuchar, leer, hablar y escribir.

Esta propuesta curricular con actividades interactivas desde la escritura y comunicación oral promueven experiencias de aprendizajes que permiten el desarrollo de competencias necesarias para el manejo del idioma.

El cursado, estará vinculado en primera instancia, a la realización de un Test nivelatorio que ubicará a cada estudiante en el nivel correspondiente a su conocimiento y manejo del idioma. Su finalidad será evaluar el nivel previo de conocimientos, habilidades y competencias de los estudiantes antes de comenzar el curso.

Desde el Modelo Academia 21, la propuesta de test permite abordar la personalización del aprendizaje, ligada a reconocer fortalezas y debilidades de cada estudiante, agruparlo en distintos niveles asegurando la paridad de conocimientos entre compañeros y dando marco a un espacio de aprendizaje colaborativo, como la medición del progreso de cada estudiante, ya que la propuesta supone un avance paulatino en diversos niveles, con progresiva complejidad que implica un enfoque gradual y secuenciado en el desarrollo de habilidades y conocimientos. La medición del progreso se convierte en una herramienta clave para evaluar cómo los estudiantes avanzan a lo largo de estos niveles y adaptar la enseñanza en consecuencia.

#### Modalidad de Cursado:

- El cursado se da en Modalidad 100% Virtual a través de Plataforma SAM.

Una vez que la materia Impacta en el SAM, el estudiante podrá:

- Ingresar a la plataforma de estudio designada para su curso.
- Contactarse con su profesor experto, quien estará disponible para abordar inquietudes y acompañar el proceso de aprendizaje del estudiantado.

La propuesta académica vincula el desarrollo de las 4 macro habilidades de la lengua:

- Comprensión lectora:

Cada nivel de aprendizaje está asociado a lecciones que proveen al estudiante de diferentes tipos de textos que les permite practicar y reforzar la lectura comprensiva.

- Comprensión Auditiva por medio de Videos:

El uso de video provee la posibilidad de ver y escuchar situaciones reales, entonación ritmo de la conversación y tipos de acentos británicos y americanos. Esta práctica permite la comprensión del idioma en un sentido amplio donde intervienen elementos que salen del texto y proporcionan a los estudiantes herramientas para la comprensión del idioma en situaciones de uso cotidiano.

- Comprensión Oral:

El uso de videos es una herramienta muy importante para el desarrollo de la comprensión oral ya que no sólo se expone al estudiante a la escucha de un dialogo, sino que por medio del video puede detectar intensión de los participantes por medio de la lectura de gestos, lenguaje corporal, etc. De esta manera se fortalece un aprendizaje integral y holístico del idioma.

- Escritura:

Desde el SAM, se abordan dos enfoques para trabajar el proceso de escritura: como Producto y como Proceso. Cuando se propone un trabajo desde el Producto, la propuesta consiste en tomar un texto modelo, y repetir su estructura. Cuando se propone un trabajo con foco en el Proceso, se abordan textos de carácter discursivo y/o narrativo, los cuales se centran en el desarrollo gradual y continuo de entregas de múltiples borradores por parte de los estudiantes, donde se van aplicando diversas técnicas de escritura.

#### Test o Prueba de Nivelación

El Placement Test, o Test de ubicación, es un examen único en el cual los estudiantes demuestran su conocimiento del idioma inglés. Este examen determinará el nivel correspondiente del estudiante según los resultados obtenidos. En caso de no alcanzar la regularidad de la materia dentro del periodo de cursado, se pierde el avance obtenido, debiendo rendir nuevamente el Test de Nivelación.

- Niveles Disponibles:  A partir de la realización del Test, los niveles establecidos son:
- Nivel Inicial.
- Niveles Básico con una estratificación de: Nivel Básico 1, 2 y 3.
- Nivel Intermedio con una estratificación de: Nivel Intermedio 1, 2 y 3.
- Nivel Avanzado, cada una estratificación de: Nivel 1, 2 y 3.  La plataforma cuenta con 10 niveles en total, donde a partir del resultado del test, cada estudiante se ubicará en el nivel correspondiente.
- Contenido de Cada Nivel:  Cada nivel dentro del curso de idioma inglés está estructurado en segmentos que abarcan ejercicios de expresión oral, comprensión auditiva, lectura comprensiva, gramática y vocabulario. Cada nivel consta de 8 unidades temáticas. Estos segmentos están diseñados para proporcionar un enfoque integral en el desarrollo de habilidades lingüísticas claves.
- Criterios de Avance por Nivel:  Quienes deben realizar Placement Test (Prueba de Ubicación) pueden quedar ubicados en alguno de los 10 niveles que se ofrecen en la plataforma educativa.  Cada nivel cursado y regularizado tiene un Final denominado “Course Test” dentro de la misma plataforma. Debe ser aprobado con un mínimo del 70% para que se habilite el nivel siguiente y poder continuar el cursado. El paso de un nivel a otro implica que las actividades que contiene cada lección dentro de cada nivel deben tener un avance y aprobación del 70% y pueden repetirse hasta alcanzar dicho requisito que habilita el nivel siguiente.

IMPORTANTE: El Placement Test (Test de Ubicación) es obligatorio y se realizará una sola vez antes del inicio del cursado de la materia. En caso de no alcanzar la regularidad de la materia, deberá comenzar nuevamente el cursado de la plataforma desde el inicio, perdiendo todo avance que haya logrado obtener previamente, debiendo realizar nuevamente el Placement Test. Los participantes dispondrán de un límite de 2 horas para completar la prueba, requiriendo un entorno adecuado, conexión estable y suficiente tiempo.

- Periodos de Inscripción:  Las inscripciones se realizan durante todo el año, sin embargo, la materia solo tiene inicio en los períodos de Marzo y Agosto, La cohorte de Marzo finaliza a fines de Febrero del año siguiente y la de Agosto lo hace a fines de Julio del siguiente año.   Las licencias tienen una duración de un año calendario contabilizado según el semestre en el que el alumno comienza el cursado.
- Condiciones de Aprobación:  El cursado de Idiomas, no contempla bajo sus condiciones de aprobación la instancia de Promoción. Logrando cumplimentar las instancias evaluativas correspondientes, se podrá lograr la condición de Regularidad, para luego rendir un Examen Final Integrador.   **• Regularidad:**El estudiante alcanzará la regularidad de dos maneras:
- Al cumplimentar la aprobación de 6 niveles de manera consecutiva con nota de 70% o más.
- Al cumplimentar la aprobación del último nivel Advanced 3 (Avanzado Nivel 3). Luego de 72 hs. Hábiles el estudiante podrá chequear en Perfil 21 que la condición haya cambiado a REGULAR. En caso de que no suceda, deberás solicitar la carga a su Profesor Virtual por la mensajería del SAM o a través de Consulta Alumno.   **• Examen Final:**Dicha instancia se rinde de forma presencial en el CAU. Consta de 50 preguntas de múltiple opción, y debe aprobarse con nota mínima de 4. Se evalúan los contenidos estudiados en la plataforma: Gramática, Vocabulario, y Lectura comprensiva.

IMPORTANTE: No se puede utilizar durante el examen diccionarios, glosarios, listados de verbos o cualquier otro elemento similar.

#### EXIMICIÓN DEL CURSADO DE IDIOMA INGLÉS:

Quedan eximidos del cursado de idioma de Ingles aquellos estudiantes que:

- Se encuentren ubicado por Placement Test o Test de Ubicación, en Advanced 3 se exime del cursado en la plataforma Edusoft y queda habilitado para el examen final integrador por Sistema Q.
- Al solicitar eximición cuenta con un título universitario o terciario de validez nacional: Título de Licenciado en inglés, Profesor o Traductor de inglés con el respaldo del Ministerio de Educación de la Nación Argentina (títulos oficiales).
- Presenten Certificaciones Internacionales siempre y cuando correspondan a un nivel B2 o superior según el Marco Común Europeo de Referencia para las Lenguas que se acreditan y validan en la Resolución del Consejo Superior Nº1094/2023

#### IDIOMA PORTUGUÉS

Dentro de la propuesta académica de la Universidad Siglo 21, en las Carreras de:

- Licenciatura en Gestión Turística.
- Licenciatura en Comercio Internacional.
- Licenciatura en Administración Hotelera.

En función del perfil definido para el egresado, dichas carreras mencionadas anteriormente incorporan, además del idioma inglés, el cursado del Idioma Portugués.

**Condiciones de Cursado**

El cursado se centra en dos espacios Curriculares: Portugués Avanzado I y Portugués Avanzado II. Ambos espacios son correlativos entre sí, por lo que se deberá aprobar Portugués Avanzado I para luego cursar Portugués Avanzado II.

El cursado de Portugués, es correlativo al cursado de Idioma Inglés. Es decir, los estudiantes que pertenecen a las carreras antes mencionadas deberán aprobar en primera instancia Idioma Inglés, para luego cumplimentar el cursado de Idioma Portugués.

Portugués Avanzado I y II se cursan a través del SAM, de manera bimestral para todas las modalidades y su cursado es 100% virtual.

Ambas materias son de tipología MEC, por lo que se rige por las condiciones de cursado y aprobaciones propias de esta tipología. [(Ver apartado 3.2.2.3.)](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=3-2-cambios-de-modalidad#cap3-2-2-3)

**EXIMICIÓN DEL CURSADO DE IDIOMA PORTUGUÉS:**

Quedan eximidos del cursado de portugués a aquellos estudiantes que:

- Presenten el "Certificacado de Proficiencia em Lingua Portuguesa para Estrangeiros (CelpeBras). Este Certificado es otorgado por el Ministerio de Educación de Brasil a extranjeros-no nativos de Brasil. Se certifican los niveles: intermedio, intermedio superior, avanzando y avanzado superior. En ambos casos, deben cumplir los requisitos y procedimientos establecidos para la solicitud de equivalencias.

4$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-2-diseno-curricular$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-4$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 3, $pea0$rg-4-3-metodos-y-didacticas$pea0$,
        $pea0$Métodos y didácticas$pea0$, $pea0$El Modelo Académico contempla métodos y didácticas de aprendizaje, las cuales refieren a estrategias, métodos y enfoques pedagógicos utilizados por los docentes para facilitar el proceso de enseñan…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-3-metodos-y-didacticas el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 4 | MODELO ACADÉMICO - ACADEMIA 21

### 4.3 MÉTODOS Y DIDÁCTICAS

El Modelo Académico contempla métodos y didácticas de aprendizaje, las cuales refieren a estrategias, métodos y enfoques pedagógicos utilizados por los docentes para facilitar el proceso de enseñanza y aprendizaje. Estas prácticas educativas buscan optimizar la adquisición de conocimientos y competencias por parte de los estudiantes. El modelo Academia 21, busca garantizar mediante una serie de didácticas institucionales el desarrollo de competencias independientemente de los estilos de enseñanza y tipos de contenido dictados por los docentes. De esta manera, se definen cinco estrategias didácticas institucionales: Aprendizaje basado en fenómenos y datos, Aprendizaje basado en Reto, Aprendizaje Basado en Problemas, Aprendizaje basado en Proyectos y Aprendizaje basado en Método de casos. A continuación, se describen cada una de ellas.

#### Didácticas Institucionales:

**Aprendizaje basado en fenómenos y datos:** Es un enfoque pedagógico que se centra en el estudio de fenómenos del mundo real, utilizando un conjunto de datos reales o simulados como parte integral del proceso de enseñanza y aprendizaje. para facilitar la comprensión y aplicación de conceptos académicos. En lugar de aprender conceptos de forma aislada, el estudiantado se involucra en la investigación y exploración de situaciones, problemas o eventos de la vida real.

**Aprendizaje basado en Reto:**Es un enfoque pedagógico que se centra en la presentación de desafíos o problemas complejos al estudiantado con el objetivo de motivar el aprendizaje y promover el desarrollo de habilidades específicas. Se promueve que los estudiantes enfrentan situaciones que requieren la aplicación de conocimientos, el análisis crítico y la resolución de problemas. La metodología de este aprendizaje se basa en retos reales, es decir que provee condiciones y motivación para incorporar nuevos conocimientos y reforzar aquellos ya conocidos en relación con sus profesiones dentro de las comunidades que habitan.

**Aprendizaje basado en problemas**: Es un enfoque pedagógico que coloca problemas concretos y desafiantes en el centro del proceso de aprendizaje. En lugar de comenzar con la presentación de información teórica, los estudiantes se enfrentan a un problema o situación compleja que requiere la adquisición de conocimientos y habilidades específicas para su resolución.

**Aprendizaje Basado en Proyectos:**Es un enfoque pedagógico que utiliza proyectos como la unidad central para organizar y facilitar el aprendizaje. Pone énfasis en la aplicación práctica del conocimiento a través de la planificación, diseño y ejecución de proyectos significativos. Se propone que los estudiantes trabajen de manera activa, puedan planear, implementar y evaluar proyectos que tienen aplicación en el mundo real más allá del aula.

**Aprendizaje Basado en Método de Casos:**Es un enfoque pedagógico que se caracteriza por utilizar situaciones reales que transcurren en nuestra sociedad, vinculando de esta manera al alumnado con el análisis de casos reales aplicados en distintas instituciones, empresas, industrias, como parte del entramado productivo. Proporciona a los estudiantes, la oportunidad de enfrentarse a problemas complejos de manera similar a como lo harían en sus futuras carreras profesionales.

La combinación de estas metodologías se propone como garante del lineamiento pedagógico y con los objetivos de desarrollo de competencias. Cada una de estas didácticas aporta una dimensión única al proceso de aprendizaje, desde la resolución de problemas prácticos hasta la aplicación activa de conocimientos en contextos del mundo real. Reconociendo que los estudiantes construyen su conocimiento a través de la interacción activa con la información y la aplicación práctica de lo aprendido, estas didácticas fomentan un aprendizaje significativo y de aplicación práctica, lo que garantiza una experiencia educativa integral, diversa y contextualizada.

La integración de las didácticas mencionadas no solo garantiza una variedad de enfoques pedagógicos, sino que también se adapta de manera efectiva a la diversidad de estilos de aprendizaje y necesidades individuales.

4$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-3-metodos-y-didacticas$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-4$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 4, $pea0$rg-4-4-vinculacion-y-extension$pea0$,
        $pea0$Vinculación y extensión$pea0$, $pea0$La importancia de la vinculación y la investigación adquiere un valor estratégico y esencial que se alinea estrechamente con los principios fundamentales que guían a la Universidad Siglo 21 y su pr…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-4-vinculacion-y-extension el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 4 | MODELO ACADÉMICO - ACADEMIA 21

### 4.4 VINCULACIÓN Y EXTENSIÓN

La importancia de la vinculación y la investigación adquiere un valor estratégico y esencial que se alinea estrechamente con los principios fundamentales que guían a la Universidad Siglo 21 y su propuesta académica. El modelo no solo imparte conocimientos teóricos, sino que se concibe como un ecosistema dinámico que busca la formación integral de los estudiantes, la generación de conocimiento pertinente y la contribución activa al progreso de la sociedad.

En esta línea, la vinculación con la comunidad y el mundo productivo permite al estudiantado contextualizar sus aprendizajes, enfrentarse a desafíos reales y desarrollar competencias que van más allá de la teoría.

Por su parte, la investigación se concibe como un motor para la innovación y el progreso sostenible.

La generación de nuevo conocimiento contribuye al avance de las disciplinas académicas y proporciona respuestas a los problemas contemporáneos, impulsando así un compromiso institucional con la mejora continua y la excelencia.

#### 4.4.1 VINCULACIÓN

La Universidad Siglo 21 cuenta con una sólida política de extensión y vinculación, coordinada por la Secretaría de Extensión, Vinculación e Impacto. Su objetivo principal es fortalecer los lazos entre la institución y la sociedad para garantizar la calidad e impacto de los proyectos y programas desarrollados, con la meta última de contribuir como actor social a mejorar las condiciones de vida de la sociedad.

La institución asume la responsabilidad primordial de cultivar profesionales comprometidos, críticos y conscientes de la realidad social. En consecuencia, integra en la estructura curricular materias y actividades que destacan la extensión como un componente esencial tanto en la función docente como en la formación integral del estudiante. La formación extensionista se posiciona como un fundamento esencial de la responsabilidad profesional, ética y social en todos los ámbitos del ejercicio profesional, consolidándose como un contenido disciplinar para nuestros egresados.

#### PRÁCTICA SOLIDARIA

La participación de los estudiantes en la materia de proceso "Práctica Solidaria" les proporciona un contacto directo con realidades que los instan a adoptar una perspectiva socialmente comprometida basada en los conocimientos adquiridos durante su paso por la Universidad. De esta manera se forman profesionales capaces de situarse "con el otro y no frente al otro". Este enfoque busca fomentar la conciencia de un diagnóstico auténtico que integre diversos saberes, incluso aquellos que no suelen encontrarse en las aulas y laboratorios.

#### ASIGNATURAS CON ENFOQUE DE RESPONSABILIDAD SOCIAL Y SUSTENTABILIDAD

En el contexto de la implementación del Modelo de Aprendizaje Basado en Competencias, donde la sustentabilidad se destaca como un diferencial en el perfil de egreso de la Universidad, se han incorporado en las mallas curriculares materias que tienen como objetivo desarrollar contenidos y competencias relacionadas con la sustentabilidad.

A través de esta iniciativa, se busca no sólo “educar en” Sustentabilidad sino principalmente “formar para” la misma, introduciendo competencias para ello de forma transversal para que el estudiante aprenda a tomar decisiones y realizar acciones desde criterios sostenibles.

Es importante resaltar la presencia de asignaturas específicas y electivas directamente relacionadas con los Objetivos de Desarrollo Sostenible (ODS); a saber: Responsabilidad Social, Derechos Humanos, Mediación Comunitaria y Cultura de Paz, Estudios de Género para la Formación Profesional y Ética y Responsabilidad Social Empresarial.

#### PROYECTOS ACADÉMICOS TRANSVERSALES (PAT)

Los PAT representan un medio de conexión entre el ámbito académico y el entorno social desde una perspectiva dialéctica. En este espacio, se entrelazan intervenciones y conocimientos de docentes, estudiantes y actores sociales, promoviendo así un enfoque colaborativo que enriquece la formación académica y contribuye activamente al entorno social circundante.

Estos proyectos se desarrollan en el contexto de las materias, partiendo de un proceso activo de identificación de demandas comunitarias y un diseño dinámico de dispositivos de prevención/intervención. Estas actividades establecen espacios curriculares que amalgaman diversas perspectivas transversales para abordar problemáticas sociales, económicas y productivas. Estos espacios fortalecen el vínculo entre la Universidad y la comunidad desde el aula, no solo fomentando la formación de profesionales comprometidos, críticos y sensibles a la realidad social, sino también contribuyendo a mejorar la calidad de vida de sectores vulnerables mediante intervenciones disciplinares e interdisciplinares que abordan integralmente la complejidad y multicausalidad de la realidad social en todo el país.

Los PAT se llevan a cabo durante el período de cursado de las materias correspondientes, con una carga horaria mínima de cuatro (4) horas reloj semanales adicionales, aunque esta carga puede variar según las particularidades de cada proyecto. En casos excepcionales, la duración puede extenderse para dar respuesta a demandas sociales específicas. En todos los casos, la carga horaria de los PAT se suma al tiempo dedicado al cursado regular de la materia, tanto para docentes como para los alumnos participantes.

La convocatoria se realizará al menos una vez al año para la presentación de los proyectos. En esta instancia se disponibilizará a la Comunidad Educativa las necesidades relevadas en los distintos actores sociales, como punto de partida para la elaboración de los Proyectos. No obstante, los docentes/investigadores podrán sugerir otras propuestas de intervención en función de la detección de otras demandas a ser abordadas.

Los Proyectos presentados serán evaluados por una Comisión integrada por el Centro de Excelencia, los Directores de Carrera y los Decanos.

En la evaluación se considerará la adecuación a las líneas prioritarias, el impacto social del Proyecto, la pertenencia a la materia/carrera y la factibilidad de concreción. Cabe señalar que los criterios de evaluación podrán ser actualizados en función de los requerimientos de la Comisión Evaluadora.

Aquellos proyectos que no resulten aprobados o requieran modificaciones, serán remitidos a los responsables a fin de que tomen conocimiento.

En un plazo máximo de 30 días de finalizado el PAT, el Director del Proyecto deberá presentar un informe final El mismo debe describir los resultados alcanzados en función del cronograma de actividades previstas y detallar el desempeño y cumplimiento de las obligaciones de cada participante.

La comisión evaluadora analizará el informe del Proyecto Académicos Tranversales (PAT) y procederán a la certificación de las actividades de quienes hayan cumplido con la totalidad de las obligaciones requeridas.

Aquellos directores que no hubieran cumplido con las exigencias establecidas en el Proyecto, podrán verse imposibilitados de presentarse en próximas convocatorias.

#### PROYECTOS DE INTERVENCIÓN COMUNITARIA (PIC)

Los PIC refuerzan el compromiso con la extensión al promover convocatorias para proyectos extensionistas financiables, en los cuales participan ayudantes alumnos, adscriptos, docentes, investigadores y co-docentes. Estos proyectos nacen desde una perspectiva federal, inclusiva y democrática, con el objetivo de desarrollarse en cualquier lugar del país y se centran prioritariamente en acciones de fortalecimiento social alineadas con los principios y valores de la Universidad.

En los PICs, se facilita la convergencia de varias carreras, permitiendo un abordaje interdisciplinario de las problemáticas, generando respuestas más complejas a las demandas sociales. Su duración en el tiempo posibilita intervenir en asuntos que requieren un desarrollo más amplio o una solución a mayor escala.

Tienen una duración de un año, con posibilidad de renovación o transformación en Servicios de Extensión en el ámbito de Vincula 21 debido a su impacto. Requieren una carga horaria mínima de cuatro (4) horas reloj semanales, detalladas en el cronograma de actividades, y son dirigidos por un Director del Proyecto, quien debe ser docente/investigador de la Universidad. Cuentan con el financiamiento, soporte y evaluación por parte de la Universidad.

La convocatoria se realizará al menos una vez al año para la presentación de los proyectos. En esta instancia se disponibilizará a la Comunidad Educativa las necesidades relevadas en los distintos actores sociales, como punto de partida para la elaboración de los Proyectos. No obstante, los docentes/investigadores podrán sugerir otras propuestas de intervención en función de la detección de otras demandas a ser abordadas.

Los Proyectos serán evaluados por una comisión integrada por el Centro de Excelencia, Directores de Carrera y Decanos. En la evaluación de los Proyectos se considerará la adecuación a las líneas prioritarias, el impacto social del Proyecto, la pertinencia a la carrera y la factibilidad de concreción. En función de la evaluación los PIC podrán ser: aprobados con financiamiento, aprobados sin financiamiento o rechazados. En todos los casos, los Directores serán informados sobre la evaluación.

En un plazo máximo de 30 días de finalizado el PIC, el Director del Proyecto deberá presentar un informe final. El mismo debe describir los resultados alcanzados en función del cronograma de actividades previstas y detallar el desempeño y cumplimiento de las obligaciones de cada participante.

La comisión evaluadora analizará el informe del PIC y procederán a la certificación de las actividades de quienes hayan cumplido con la totalidad de las obligaciones requeridas.

Aquellos directores que no hubieran cumplido con las exigencias establecidas en el Proyecto, podrán verse imposibilitados de presentarse en próximas convocatorias.

#### SERVICIOS DE EXTENSIÓN COMUNITARIA (SEC)

El programa de Servicio de Extensión Comunitaria (SEC) de la Universidad Siglo 21 responde a demandas sociales específicas mediante intervenciones interdisciplinarias. Se centra en proporcionar servicios y asesoramiento profesional gratuito a la comunidad y a profesionales nóveles. A diferencia de otros programas, no se enmarca en una materia específica y no sigue un proceso anual predeterminado; surge de la demanda y se mantiene mientras continúe existiendo.

A los efectos de su desarrollo se conforman seis (6) líneas prioritarias de Servicios de Extensión Comunitaria estables, en consistencia con las líneas extensionistas definidas por los Decanatos, bajo las siguientes denominaciones:

- Acceso a la Justicia.
- Promoción del Empleo y Emprendimientos.
- Salud y Desarrollo Humano.
- Acceso a la Educación.
- Soluciones Tecnológicas de Impacto Social.
- Acción por el Medio Ambiente y Energías Renovables.

Cada uno de los SEC articularán en su seno proyectos y actividades de acuerdo al tipo definido junto a la Dirección de Carrera, de intervención e impacto en la comunidad en un eje estratégico para la política de extensión de la Universidad.

Los SEC se sostienen en el tiempo mientras exista demanda y cuentan con asignación presupuestaria que garantice el desarrollo de cada uno de los servicios definidos por la institución.

Los SEC han sido diseñados para que los programas y proyectos desarrollados en su marco tengan continuidad en el tiempo; es por ello, que no existe una fecha institucionalizada de inicio del SEC, mientras que se establece una duración mínima de dos años en su planificación original, perdurando mientras exista la demanda/necesidad.

#### PROGRAMA DE VOLUNTARIADO UNIVERSITARIO - VOLUNTARIOS 21

Se trata de un programa institucionalizado de voluntariado universitario que busca ser un puente entre las necesidades sociales y los estudiantes voluntarios de todo el país. Siguiendo la Ley de Voluntariado Social (Ley 25.855), la universidad se compromete a formar líderes solidarios, fomentando actividades sin fines de lucro y regulando las relaciones entre voluntarios y organizaciones.

Los voluntarios en Siglo 21 participan activamente en acciones solidarias, desarrollando habilidades sociales y contribuyendo a la formación de competencias cívicas. El programa se potencia como un facilitador entre estudiantes, egresados, docentes y co-docentes comprometidos y organizaciones aliadas. Las acciones incluyen voluntariado territorial, apoyo escolar, promoción de derechos humanos, entre otros.

El Centro de Sustentabilidad Social, responsable del programa, realiza convocatorias anuales para abordar las demandas comunitarias y promover la participación. Las condiciones para participar incluyen una dedicación semanal de al menos 4 (cuatro) horas, supervisión por un referente y, en caso de ser necesario, las formaciones que se definan.

#### 4.4.2 INVESTIGACIÓN

La Universidad Siglo 21 posee un gran compromiso en la formación de egresados que sean agentes de cambio en sus comunidades y por ello destaca la importancia de la investigación en su modelo académico. En la actual era del conocimiento, donde la ciencia y la técnica impulsan el desarrollo de los países, la investigación se convierte en un elemento esencial para el aprendizaje del estudiante y el desarrollo de competencias vinculadas a la generación de nuevos conocimientos basados en la ciencia.

En esta línea, la Secretaría de Investigación estructura su gestión alrededor de tres procesos fundamentales que buscan impulsar una investigación de calidad, comunicar los resultados de manera efectiva y promover el desarrollo continuo de la investigación en la universidad; a saber: la

Generación de Conocimiento; la Comunicación y Divulgación Científica; y la Promoción y el Desarrollo Científico.

#### TIPOLOGÍA DE PROYECTOS

La institución ha establecido tres tipos de proyectos de investigación: Tipo I, Tipo II e Internacionales, todos liderados por un director encargado de coordinar las actividades del equipo. Cada proyecto debe contar con al menos dos docentes asumiendo roles de docentes-investigadores, dos estudiantes de grado o posgrado como ayudantes-alumnos, y dos egresados como adscriptos.

**Proyectos Tipo I:**son financiados por la Universidad, requieren una dedicación de 10 horas semanales, tienen una duración de un año con posibilidad de renovación y son evaluados para determinar la continuidad.

**Proyectos Tipo II:** están destinados a la formación de nuevos investigadores y respaldados por la Secretaría de Investigación, reciben apoyo económico anual para eventos académicos y requieren una dedicación de 5 horas semanales, con posibilidad de renovación.

**Proyectos Internacionales:** involucran a un docente/investigador de una universidad extranjera, son financiados por la Universidad y exigen una dedicación de 20 horas semanales, con una duración de un año sin opción de renovación. Estos proyectos buscan fomentar la colaboración internacional en investigación. La estructura y criterios buscan cumplir con la recomendación de la evaluación externa para incentivar la participación de alumnos y docentes en proyectos de investigación.

**Proyectos Interinstitucionales:** Destinados a proyectos y/o equipos de investigación consolidados. Incluyen la participación de al menos un docente perteneciente a la Universidad Siglo 21, quien presenta el proyecto. Son financiados por la universidad con monto anual asignado al director del proyecto de investigación, responsable de ejecutar el presupuesto previsto.

**Proyectos Part Time:** La financiación es al investigador part time responsable. Se financia con un monto anual, asignado mensualmente al director del proyecto de investigación. Este tipo de proyecto demanda una dedicación semanal de 20 horas por parte del equipo, pudiendo cumplir con sus tareas fuera de la Universidad, según previo acuerdo con la Dirección de Investigación.

4$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-4-vinculacion-y-extension$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-4$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 5, $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$,
        $pea0$Sistema de evaluación de los aprendizajes EVA 21$pea0$, $pea0$En la presente sección se establecen las consideraciones generales del modelo de evaluación adoptado por la Universidad Siglo 21. Se describen las actividades evaluativas que cada estudiante realiz…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21 el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 4 | MODELO ACADÉMICO - ACADEMIA 21

### 4.5 SISTEMA DE EVALUACIÓN DE LOS APRENDIZAJES: EVA 21

En la presente sección se establecen las consideraciones generales del modelo de evaluación adoptado por la Universidad Siglo 21. Se describen las actividades evaluativas que cada estudiante realizará para obtener la regularidad y/o aprobación de sus materias a lo largo de su cursado, como así también las distintas instancias evaluativas a lo largo de su trayecto como estudiante.

#### INTRODUCCIÓN

En la Universidad Siglo 21 la evaluación es un pilar esencial para asegurar la formación integral y el desarrollo de competencias. En este contexto, la implementación de evaluaciones de término y de proceso se erige como un componente fundamental para garantizar la eficacia y la equidad en la valoración del rendimiento estudiantil. Estas evaluaciones no solo son un reflejo de la excelencia académica, sino que también constituyen herramientas estratégicas para el mejoramiento continuo de los programas educativos y el fortalecimiento de la calidad institucional.

El sistema de evaluación de los aprendizajes -EVA21 aboga por la implementación de un sistema de evaluación robusto, sustentado en la combinación equilibrada de evaluaciones de término y de proceso, su diseño adopta una composición caracterizada por diversidad de momentos, etapas e instrumentos variados que reaseguran procesos complejos. Tal enfoque se alinea con la visión de la universidad de ofrecer una educación de calidad, enfocada no solo en la transmisión de conocimientos, sino también en el desarrollo integral de habilidades y competencias pertinentes al mundo laboral y social.

En este sentido, la evaluación debe observarse desde dos perspectivas: una mirada horizontal que analiza los componentes e instrumentos de evaluación propias de cada asignatura, y una mirada hortical que analiza los componentes y etapas de evaluación a lo largo de toda la carrera. Ambos enfoques se abordan desde el Modelo de Aprendizaje por Competencias.

- Desde la perspectiva horizontal, en el marco de cada asignatura, los parciales 1º y 2º y los exámenes finales permiten la medición de primer nivel respecto de los contenidos de cada materia programática adquiridos por el alumnado.  Estas evaluaciones de término se complementan en cada materia por las evaluaciones de proceso mediante la realización de trabajos prácticos en las que se trabaja la transferencia y construcción de alternativas de solución a diversas problemáticas propias del ejercicio de cada disciplina.
- Desde una perspectiva hortical, en el marco de las distintas etapas académicas que contienen instancias de evaluación a lo largo de la carrera, existen las materias de proceso y los Exámenes Finales Integradores Presenciales (EFIP I y II) y como instancias centrales de integración y desarrollo de competencias. En estas instancias el alumnado, resuelve problemas situados, desarrollan la argumentación escrita y oral e incluso incorporan en algunas instancias evaluativas la construcción con sus pares.  De esta manera, a lo largo de su carrera, el estudiantado es evaluado de manera integral teniendo en cuenta aspectos disciplinares, conceptuales, competencias institucionales, genéricas y específicas; garantizando así la calidad de los aprendizajes.

#### CONSIDERACIONES GENERALES

- En las diferentes instancias evaluativas se contemplan todos los temas comprendidos en el PROGRAMA de la materia, basándose principalmente en la **bibliografía obligatoria,**complementando con los objetos de aprendizajes que se disponibilizan en el SAM.
- La obtención de la Bibliografía obligatoria está a cargo de cada estudiante, excluyendo a la Universidad de la obligación de proveerla.
- Todos los trabajos prácticos deberán ser realizados por cada estudiante de manera individual, salvo en aquellos casos en los cuales por diferentes motivos puedan ser realizados de manera colaborativa. El incumplimiento de esta normativa puede implicar sanciones disciplinarias.
- Todos los exámenes realizados mediante el sistema de evaluación de la Universidad podrán ser auditados a los efectos de garantizar el cumplimiento de las normas establecidas en este Reglamento Institucional. Cualquier incumplimiento podrá dar lugar a la aplicación del régimen disciplinario.
- La Universidad se reserva el derecho de instrumentar cambios en las actividades evaluativas y/o colaborativas y en su obligatoriedad; como así también en el diseño instruccional de la propuesta pedagógica, siempre que dichos cambios conlleven a la mejora de los procesos académicos, la experiencia y el aprendizaje del alumnado.

#### 4.5.1 ACTIVIDADES EVALUATIVAS DE PROCESO

Dentro del SAM, cada materia contiene 4 (cuatro) módulos. Cada módulo se compone de trabajos prácticos y actividades prácticas. Las mismas se detalladas a continuación.

#### TRABAJOS PRÁCTICOS (TPS):

Cada TP focaliza sobre los principales ejes temáticos del módulo y valora la presentación en tiempo y forma. La realización de los 4 (cuatro) TPs son de carácter obligatorio, siendo condición la aprobación de al menos 3 (tres) de ellos para obtener la regularidad de la asignatura. Se constituyen como evaluaciones de proceso puesto que cada uno de los trabajos se presentan como unidades que permiten de manera gradual incrementar la complejidad de análisis y aplicaciones.

La nota mínima de aprobación es 5 (cinco) o 50 (cincuenta) puntos.

#### MATERIAS DE EXPLORACIÓN Y CONCEPTUALIZACIÓN (MEC)

En esas materias, la nota de los Trabajos Prácticos estará compuesta por la actividad académica realizada y por el cumplimiento fecha límite de presentación. Podrán, sin embargo, presentarse los TP´s hasta la fecha de cierre de las actividades del SAM, el incumplimiento del plazo de presentación de la actividad en tiempo y forma restará 5 puntos por cada día de demora. En ningún caso la afectación al puntaje por incumplimiento del plazo de presentación afectará la nota mínima de 50 puntos o nota de aprobación 5.

Al mismo tiempo, en las materias de tipo MEC, los TPs podrán rehacerse de manera ilimitada en caso de no haber aprobado, dentro de los plazos estipulados en el cronograma de vencimiento del SAM, **tomándose como válida y definitiva la última nota obtenida en la última fecha de presentación**.

#### MATERIAS DE INTEGRACIÓN Y APLICACIÓN (MIA) Y MATERIAS DE INTEGRACIÓN PROFESIONAL (MIP)

En estas materias el trabajo práctico podrá ser presentado por única vez dentro de la fecha establecida por calendario académico.

**Las notas de los 4 TP´s se promedian junto con las notas obtenidas en los exámenes parciales, para el cálculo de la nota final de la asignatura. Es potestad del cuerpo docente la aplicación de una nota de proceso a los fines de ser promediada con los TPs y notas de exámenes. La falta de presentación de un trabajo práctico implicará nota Cero (0) en la entrega y será promediable con las notas del resto de las entregas.**

La presentación tardía de los TPs, una vez cumplida su fecha de vencimiento / entrega establecida en el calendario académico de cada período y comunicada en el SAM, implica el incumplimiento de la presentación en tiempo y forma. En esta situación, se pierde la posibilidad de realizar el o los TPs, dependiendo de lo establecido en cada tipología de materia.

Es importante que el estudiantado ingrese al SAM para verificar que las notas de los Trabajos Prácticos queden registradas en el sistema.

#### MATERIAS DE APLICACIÓN PREPROFESIONAL (MAP)

En esas materias, la nota de los Trabajos Prácticos estará compuesta por la actividad académica realizada y por el cumplimiento de la fecha límite de presentación. Podrán, sin embargo, presentarse los TP´s hasta la fecha de cierre de las actividades del SAM, el incumplimiento del plazo de presentación de la actividad en tiempo y forma restará 5 puntos por cada día de demora. En ningún caso la afectación al puntaje por incumplimiento del plazo de presentación afectará la nota mínima de 50 puntos o nota de aprobación 5.

Al mismo tiempo, en las materias de tipo MAP, los TPs podrán rehacerse de manera ilimitada en caso de no haber aprobado, dentro de los plazos estipulados en el cronograma de vencimiento del SAM, tomándose como válida y definitiva la última nota obtenida en la última fecha de presentación.

Por otro lado, en las materias de tipo MAP existirán (además de los TPs) dos actividades evaluativas preprofesionales de carácter obligatorio. La primera vinculada a los contenidos teóricos de los Módulos de lecturas 1 y 2 y el recorrido realizado hasta el momento en la práctica preprofesional. La segunda actividad, estará vinculada a los Módulos de lectura 3 y 4 y al cierre integral de la práctica preprofesional. Ambas actividades evaluativas preprofesionales serán abiertas, a desarrollar, y corregidas por el/la docente mediante una rúbrica de evaluación con niveles y criterios específicos para cada una de ellas.

En aquellos casos donde la distancia geográfica dificulte el desarrollo presencial de la práctica preprofesional, la Universidad se reserva la potestad de complementar la actividad requerida mediante la implementación de tareas y recursos ofrecidos a través de plataformas tecnológicas, asegurando la consecución de los objetivos de la práctica.

IMPORTANTE: En todas aquellas actividades que la cantidad de veces de presentación sea ilimitada, deberá realizarse la entrega dentro de las fechas programadas en el calendario académico, para cada TP.

- Actividades Prácticas (AP):

Permiten que el estudiantado puede ejercitar y repasar los principales contenidos del módulo. Su realización es de carácter opcional y le sirven a cada estudiante para auto diagnosticar su nivel de aprendizaje.

#### 4.5.2 ACTIVIDADES EVALUATIVAS DE TÉRMINO

#### EXÁMENES PARCIALES

Los exámenes parciales se rinden por escrito a través de un sistema on line bajo un formato de opción múltiple y tienen como objetivo valorar el conocimiento y comprensión de los estudiantes sobre ciertos temas disciplinares. En el primer Examen Parcial se toman los contenidos del módulo 1 y del módulo 2 del programa de la materia, mientras que en el segundo Examen Parcial se toman los contenidos del módulo 3 y del módulo 4. En estas instancias se evalúan los contenidos presentes en el SAM y aquellos correspondientes a la Bibliografía Obligatoria que se detalla en el programa.

Cada Parcial consta de 20 (veinte) preguntas y se aprueba con una nota mínima de 5 (cinco), equivalente a responder correctamente por lo menos 9 (nueve) preguntas.

Quienes cursen en la Modalidad Distancia – ED/EDH deben inscribirse para rendir sus parciales en las fechas publicadas para tal fin, en su plataforma de gestión. Deben rendir el parcial 1 en una de las fechas comprendidas entre la semana 1 (uno) y 4 (cuatro) de cursado, y el parcial 2 entre las semanas 5 (cinco) y 8 (ocho).

En la Modalidad Presencial, Presencial Home y Presencial Distribuida los exámenes parciales, recuperatorios e integradores, se rinden por escrito a través de un sistema on line en la sede y/o Centro de Apoyo Universitario de cursado, en día y horario correspondiente al cursado de la materia. Cada estudiante debe presentarse a rendir con Notebook, de acuerdo a lo establecido en el [apartado 4.5.4](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21#cap4-5-4). Condiciones para rendir exámenes.

#### EXÁMENES RECUPERATORIOS

Quienes, han obtenido nota menor a 5 (cinco) en uno de los Parciales; o han estado ausentes en alguno de ellos, pueden recuperarlo rindiendo un Examen Recuperatorio, pudiendo acceder a la Promoción Directa, Promoción Indirecta o Regularidad de la materia si cumplen con el resto de las condiciones necesarias.

Asimismo, quienes hayan aprobado uno de los parciales con nota mayor o igual a 7 (siete) y han aprobado el otro examen parcial con nota menor a 7 (siete), pueden recuperar este último examen, para acceder a la Promoción Directa o Regularidad de la materia.

Los temas a desarrollar en dicho Examen Recuperatorio corresponden a los contenidos del Parcial que es recuperado: contenidos del Parcial 1 o Parcial 2, según corresponda. El Examen Recuperatorio es de 20 (veinte) preguntas y se aprueba con un mínimo de 9 (nueve) respuestas correctas. La nota de aprobación es de 5 (cinco).

**Siempre la nota del Recuperatorio reemplaza a la nota del parcial de origen, sea menor o mayor.**

**IMPORTANTE: no se puede recuperar un examen parcial con nota igual o mayor a 7 (siete).**

#### EXÁMENES INTEGRADORES

Quienes hayan desaprobado ambos parciales o se encontrasen ausentes, o una combinación de ambas situaciones, podrán rendir un examen integrador pudiendo acceder a la Promoción Directa, Promoción Indirecta o Regularidad de la materia si cumplen el resto de las condiciones necesarias.

Asimismo, pueden acceder a esta instancia quienes han aprobado ambos parciales con notas 5 (cinco) o 6 (seis) con la intención de acceder al estado de Promoción Directa o Indirecta de la materia si cumplen el resto de las condiciones necesarias.

El examen Integrador es 30 (treinta) preguntas, y en el mismo se desarrollan los temas correspondientes al Parcial 1 y al Parcial 2. La nota de Aprobación del Integrador es 5 (cinco), pero será necesario alcanzar por lo menos la nota 7 (siete) para acceder a la Promoción Directa de la materia. La calificación obtenida en el Integrador siempre reemplaza la nota de los parciales.

| Nota Parcial 1 | Nota Parcial 2 | Examen a rendir | Condición Máxima a obtener* |
| --- | --- | --- | --- |
| Menor a 5 o Ausente | Mayor o igual a 5 | Recuperatorio Parcial 1 o Integrador | Promoción Directa / Promoción Indirecta (*) |
| Regular |  |  |  |
| Mayor o igual a 5 | Menor a 5 o Ausente | Recuperatorio Parcial 2 o Integrador | Promoción Directa / Promoción Indirecta (*) |
| Regular |  |  |  |
| 5 ó 6 | Mayor o igual a 7 | Recuperatorio Parcial 1 | Promoción Directa |
| Regular |  |  |  |
| Mayor o igual a 7 | 5 o 6 | Recuperatorio Parcial 2 | Promoción Directa |
| Regular |  |  |  |
| 5 o 6 | 5 o 6 | Integrador | Promoción Directa |
| Menor a 5 o Ausente | Menor a 5 o Ausente | Integrador | Promoción Directa / Promoción Indirecta |
| Regular |  |  |  |

(*) Para obtener la condición máxima de Regular o Promoción, el alumno deberá cumplir con la aprobación de los TP´s requeridos y el % de la asistencia si la modalidad así lo requiere.

#### 4.5.3 EVALUACIÓN FINAL Y APROBACIÓN DE MATERIAS

| CONDICIONES GENERALES |  |  |  |  |
| --- | --- | --- | --- | --- |
| EXAMEN | PROMOCIÓN DIRECTA | PROMOCIÓN INDIRECTA | REGULAR | LIBRE POR NOTA |
| Escrito a través de plataforma On Line | Eximido TODAS LAS MODALIDADES | Eximido TODAS LAS MODALIDADES | 30 preguntas | 50 preguntas |
| ORAL | Eximido TODAS LAS MODALIDADES | Eximido TODAS LAS MODALIDADES | Rinde si Aprueba el examen escrito online MP/PH/PD | Rinde si Aprueba el examen escrito online MP/PH/PD |
| Nota de aprobación | Promedio de parciales y notas de los 4 TP´s + Nota de Proceso (*) MP/PH/PD | Promedio de parciales y notas de los 4 TP´s + Nota de Proceso (*) MP/PH/PD | 4 (cuatro), equivale a 14 respuestas correctas TODAS LAS MODALIDADES | 4 (cuatro), equivale a 24 respuestas correctas TODAS LAS MODALIDADES |
| Vigencia | No aplica | No aplica | 18 meses | 3 meses |
| Oportunidades | No aplica | No aplica | 3 aplazos y/o ausentes | 1 aplazo y/o ausente |
| Excepción |  | Idiomas |  |  |

*La Nota de Proceso aplica únicamente quienes cursen en la Modalidad Presencial, Presencial Home y Presencial Distribuida.

** Para quienes cursen en la Modalidad P., PH y PD, el plazo de 3 meses comprende el turno inmediatamente posterior a la finalización del cursado. No abriéndose mesas por fuera del calendario académico establecido.

#### ESCALA DE NOTAS PARA EXÁMENES PARCIALES, RECUPERATORIOS, INTEGRADORES Y FINALES

Las siguientes escalas de notas se aplican en los exámenes Parciales y Finales.

| TIPO ► | Parcial y recuperatorio | Integrador | Final Regular | Final Libre por Nota |
| --- | --- | --- | --- | --- |
| EXAMEN ► | 20 preguntas | 30 preguntas | 30 preguntas | 50 preguntas |
| ESCALA ► | Aritmética | Aritmética | Logarítmica | Logarítmica |
| NOTA ▼ | ▼ | ▼ | ▼ | ▼ |
| 10 | 19-20 | 28-29-30 | 29-30 | 48-49-50 |
| 9 | 17-18 | 25-26-27 | 27-28 | 45-46-47 |
| 8 | 15-16 | 22-23-24 | 25-26 | 42-43-44 |
| 7 | 13-14 | 19-20-21 | 23-24 | 38-39-40-41 |
| 6 | 11-12 | 16-17-18 | 20-21-22 | 34-35-36-37 |
| 5 | 9-10 | 13-14-15 | 17-18-19 | 29-30-31-32-33 |
| 4 | 7-8 | 10-11-12 | 14-15-16 | 24-25-26-27-28 |
| 3 | 5-6 | 7-8-9 | 10-11-12-13 | 17-18-19-20-21-22-23 |
| 2 | 3-4 | 4-5-6 | 5-6-7-8-9 | 10-11-12-13-14-15-16 |
| 1 | 1-2 | 1-2-3 | 1-2-3-4 | 1-2-3-4-5-6-7-8-9 |

#### 4.5.4 INSCRIPCIÓN A EXÁMENES

#### CONDICIONES Y PAUTAS PARA RENDIR EXÁMENES (PARCIALES, RECUPERATORIOS, INTEGRADORES, FINALES)

Serán requisitos para encontrarse habilitado a rendir cualquier tipo de examen:

- Tener DNI vigente para acreditar identidad.
- Tener abonada la matrícula del período académico en curso, según corresponda (Ver apartado 14.4. Normas arancelarias).
- Rendir de manera presencial en la Sede o CAU, siempre que la modalidad de cursado así lo establezca.  Quienes requieran ajustes razonables conforme al Protocolo de Prácticas Educativas Inclusivas  (Resolución del Consejo Superior Nº 933/2021) deberán rendir sin excepción en su Sede o Centro  de Apoyo Universitario, quedando prohibido rendir en un domicilio particular.
- Quienes cuenten con ajustes razonables, conforme al Protocolo de Prácticas Inclusivas, deberán  rendir acompañados sin excepción por personal del Centro de Apoyo Universitario y/o la persona  que este determine.
- Estar inscripto fehacientemente a una mesa de examen y/o tener mesa de examen programada y  aceptada según calendario académico de cursado (parciales presenciales y ED), de acuerdo al tipo  de examen del que se trate.
- Contar con Notebook/Netbook o equipo portátil que cumpla las características técnicas que la  Universidad indique siempre que la modalidad de cursado, el tipo de examen y/o el turno  seleccionado lo requieran (navegador institucional instalado, sistema operativo compatible,  batería cargada con autonomía suficiente para rendir examen, etc.).
- Cumplir el horario establecido para el inicio del examen, teniendo para ello una tolerancia  máxima de 15 minutos, que no implicarán la extensión de la duración del turno del examen.
- Aceptar, a través del Campus, siempre que el examen sea escrito online, los términos  establecidos como condición para el inicio de cada examen.

#### Pautas generales de conducta durante los exámenes

Se espera que, durante cualquier examen, quienes rindan mantengan un comportamiento acorde
 a la realización de una instancia evaluativa universitaria, respetando las siguientes normas de conducta:

- Responder las consignas y/o realizar las actividades previstas en el examen de manera individual  y sin la utilización de apuntes, bibliografía o cualquier material de estudio al alcance de la vista,  salvo cuando estuviere expresamente autorizado. Actitudes como desviar la mirada del examen,  gesticular o hablar podrán considerarse faltas pasibles de sanción.
- Sólo se podrá disponer del programa de la materia, sin anotaciones de ningún tipo, siempre que  la instancia evaluativa sea supervisada de manera presencial por docentes y/o personal competente.
- Sólo se podrá hacer uso de elementos permitidos para rendir cuando el programa de la materia lo permita expresamente.
- No podrán utilizarse celulares, tablets, cámaras fotográficas, pantallas secundarias ni cualquier otro dispositivo ajeno a la instancia evaluativa.
- Durante la instancia de examen escrito online, sólo deberá abrirse la pantalla del explorador en el cual se realiza el examen, quedando estrictamente prohibido abrir otras páginas o navegadores en simultáneo.

**IMPORTANTE:** La detección de cualquier irregularidad que implique el incumplimiento
 de estas pautas podrá configurar una falta pasible de sanción, dando lugar a la anulación del examen
 y/o la aplicación de una medida disciplinaria. (Ver apartado 13.1)

#### 4.5.5 4.5.5 INSCRIPCIÓN A EXÁMENES DE ACUERDO A LA MODALIDAD DE ESTUDIO

#### Modalidad MP-PH

Quienes se encuentren cursando en la Modalidad PH, P. y PD no deberán realizar la inscripción a los exámenes parciales, para los casos en que requieran rendir un examen final, pueden inscribirse a FINALES hasta 4 (cuatro) días CORRIDOS antes de la fecha y horario publicados para el examen, pudiendo anular su inscripción antes que la misma sea ACEPTADA, es decir, 8 (ocho) días CORRIDOS antes de la fecha de examen solicitada.

**• Examen Recuperatorio/Integrador:** Quienes deseen acceder al examen recuperatorio o integrador de una materia, deberán realizar la inscripción al examen que deseen acceder hasta 24 (veinticuatro) horas antes de la fecha del examen y podrán anular la inscripción al menos con 48 (cuarenta y ocho) horas antes del examen.

IMPORTANTE: Quienes se inscriban a rendir un Examen Recuperatorio o Examen Integrador, y no se presenten a rendir, el examen será calificado con nota cero (0), aplicándose la nota para el cálculo final de la materia.

#### Modalidad Distribuida- Modalidad Distribuida Home (ED/EDH)

Quienes cursen en la Modalidad a Distancia (Educación Distribuida o Educación Distribuida Home) pueden inscribirse, según la disponibilidad de turnos de examen que tenga la SEDE/CAU, de acuerdo al siguiente detalle:

- **Examen Parcial**: hasta 24 (veinticuatro) horas antes de la fecha del examen. Esta inscripción no se puede anular ni modificar en ningún caso.
- **Examen Recuperatorio/Integrador**: Quienes deseen acceder al examen recuperatorio o integrador de una materia, deberán realizar la inscripción al examen que deseen acceder hasta 24 (veinticuatro) horas antes de la fecha del examen y podrán anular la inscripción al menos con 48 (cuarenta y ocho) horas antes del examen.
- **Examen Final**: Quienes deban inscribirse a rendir exámenes finales, deberán realizarlo con al menos 4 (cuatro) días CORRIDOS de anticipación y podrán anular dicha inscripción antes que el pedido sea ACEPTADO, es decir, 8 (ocho) días CORRIDOS antes de la fecha de examen solicitada.

IMPORTANTE: Quienes se inscriban a rendir un Examen Recuperatorio o Examen Integrador, y no se presenten a rendir, el examen será calificado con nota cero (0), aplicándose la nota para el cálculo final de la materia.

Quienes cursan Materias Virtuales pueden solicitar Mesa de Examen Final una vez que se encuentre cargada la CONDICIÓN alcanzada al finalizar el bimestre de cursado.

- **Inscripción para rendir EFIP I y EFIP II**: El calendario de fechas para rendir estas instancias se publica a través de Cartelera del Portal de estudiante al inicio de cada año lectivo.  La inscripción para acceder al EFIP I y EFIP II se debe realizar hasta 6 (seis) días CORRIDOS anteriores a la fecha de la prueba, pudiendo anular su solicitud hasta 7 (siete) días CORRIDOS antes de la fecha de examen solicitada.  Quien se inscriba a rendir EFIP I o EFIP II será informado con antelación sobre el horario en que debe presentarse a rendir el examen, mientras que el horario de finalización del mismo dependerá de la cantidad de alumnos que se encuentren ese día presentes para rendir.

IMPORTANTE: Para ambos exámenes la persona solicitante debe tener su matrícula activa y cumplir con las condiciones detalladas en el apartado correspondiente.

 Para EFIP II debe tener previamente aprobado el visado de su analítico y no poseer deuda.

#### 4.5.6 TIEMPO DE DURACIÓN DE EXAMEN

| Parciales y Recuperatorio | Integradores | Finales |
| --- | --- | --- |
| 40 minutos | 60 minutos | 90 minutos |

IMPORTANTE: El tiempo del examen podrá extenderse por el Centro de Sustentabilidad Social para aquellas personas que requieran ajustes razonables conforme al Protocolo de Prácticas Educativas Inclusivas. [Resolución del Consejo Superior Nº 933/2021.](https://contenidos.21.edu.ar/microsites/reglamento/assets/pdf/rcs-933-21-protocolo-practicas-educativas-inclusivas-resolucion.pdf)

#### 4.5.7 DÍAS DE EXÁMENES

Quienes cursan en Modalidades Virtuales (ED-EDH) pueden rendir sus Exámenes Finales los días y horarios publicados por cada Sede o Centro de Apoyo Universitario, haciendo la inscripción en la Mesa Examinadora correspondiente. La ausencia al turno de examen inscripto se cuenta como una oportunidad de examen y se descuenta de la cantidad de veces que el alumno puede presentarse.

Para quienes se encuentren cursando en la Modalidad Presencial (P., PH y PD), los exámenes parciales, recuperatorios y/o integradores, se rendirán en los días y horarios de cursado de la materia. En el caso de los exámenes finales, se establecerán y publicarán en su portal de estudiante las fechas para que pueda inscribirse a rendir.

IMPORTANTE: Quienes se inscriban a rendir un Examen Recuperatorio o Examen Integrador, y no se presenten a rendir, el examen será calificado con nota cero (0), aplicándose la nota para el cálculo final de la materia.

#### A) AUSENCIA A UN EXAMEN PARCIAL / RECUPERATORIO / INTEGRADOR / FINAL

La inasistencia a un Examen Parcial / Recuperatorio / Integrador / Final, tanto de materias Presenciales como Virtuales, por razones personales, laborales, médicas, paro de transporte público, o por participación en eventos de la carrera, no autoriza a la reprogramación del examen.

Por la inasistencia le corresponde un “Ausente” en el examen. En caso de Examen Final, significa además la pérdida de una de las tres posibilidades que tiene el alumno para rendir el Final de la materia antes de quedar Libre.

Nota: Las situaciones contempladas y reguladas de manera especial en la Resolución del Consejo Superior 535/2017 y modificatorias configuran casos de excepción a esta regla general.

#### B) PEDIDO DE REVISIÓN DE EXAMEN

Si al finalizar el Examen quien se encuentra rindiendo considera que alguna pregunta no ha sido evaluada de manera correcta, el sistema habilita la “solicitud de revisión” de las preguntas en el mismo momento del examen.

Los plazos de los que dispone para pedir la revisión una vez finalizado su examen son los siguientes:  Examen Parcial: 10 (diez) minutos.

 Examen Final: 15 (quince) minutos.

Esta es la única instancia en la que se puede ejecutar esta acción, por lo que cumplida la misma, no hay otra vía de revisión. A tal fin, y para que el pedido se efectivice, debe completar todos los datos que el sistema le requiere sin excepción. Caso contrario el pedido es nulo.

El plazo de respuesta del pedido de revisión es de 15 días y la resolución quedará sujeta a las siguientes condiciones:

Si el examen revisado está APROBADO, se analizará si corresponde la aplicación de un cambio en la calificación obtenida, de acuerdo a la escala de notas vigente en el presente Reglamento. Si el examen revisado está DESAPROBADO, se analizará, según la problemática identificada, si corresponde la aplicación de un cambio de calificación o si se otorga la posibilidad de rendir nuevamente la instancia de examen.

IMPORTANTE: La resolución de cualquier situación que no se encuentre expresamente contemplada en este Reglamento quedará sujeta al análisis de las diferentes áreas académicas de la Institución.

#### 4.5.8 CONDICIONES DE APROBACIÓN

Las condiciones de aprobación aplican tanto para modalidades presenciales o a distancia. La diferencia aplicará solo en aquellos casos en los que cambien los plazos de vencimientos de acuerdo a cada modalidad, o la obligatoriedad de asistencia.

En caso de incumplimiento del régimen de correlatividades previas de la materia al finalizar el cursado, la materia adquiere la condición de Regular, debiendo rendir un examen final de manera obligatoria para adquirir la condición de Aprobado.

#### Condiciones de las materias de Exploración y Conceptualización (MEC)

| TIPOLOGÍA DE MATERIA | P/PH/PD/ED/EDH | REGULARIDAD | PROMOCIÓN DIRECTA | PROMOCIÓN INDIRECTA | LIBRE POR NOTA | LIBRE |
| --- | --- | --- | --- | --- | --- | --- |
| MEC | TP | 3 de 4 TP´s aprobados con nota 5 o más aprobados de acuerdo a las fechas de entrega (*) | 3 de 4 TP´s aprobados con nota 7 o más aprobados de acuerdo a las fechas de entrega (*) | 4 de 4 TP´s aprobados con nota 7 o más aprobados de acuerdo a las fechas de entrega (*) | No alcanza condiciones de regularidad. | No alcanza condiciones de Regularidad/Libre por Nota |
| PARCIALES | Dos parciales aprobados con nota de 5 o más, pudiendo mediar recuperatorio/integrador | Dos parciales aprobados con nota de 7 o más, pudiendo mediar recuperatorio/integrador | Dos parciales aprobados con nota de 5 o 6, pudiendo mediar recuperatorio/integrador |  |  |  |
| ASISTENCIA (No aplica para submodalidad EDH) | 75% | 75% | 75% |  |  |  |
| FINAL | Examen de 30 preguntas online + Examen oral (solo en Modalidad P, PH y PD) | Materia aprobada | Materia aprobada | Examen de 50 preguntas online + Examen oral (solo en Modalidad P, PH y PD) | Debe recursar la materia |  |
| CORRELATIVIDADES |  | Correlativas aprobadas. | Correlativas aprobadas. |  |  |  |
| NOTA DE APROBACIÓN | Nota obtenida en el examen final | Promedio de parciales y notas de los 4 TP´s + Nota de Proceso (Modalidad Presencial) | Promedio de parciales y notas de los 4 TP´s + Nota de Proceso (Modalidad Presencial) | Nota obtenida en el examen final | No corresponde |  |

(*) Para materias de **cursado bimestrales** los TP´s deberán aprobarse:

- TPs 1 y 2 semana 5.
- TPs 3 y 4 semana 8.

En las materias cuya tipología sea de Exploración y Conceptualización (MEC), la nota de los Trabajos Prácticos será compuesta por la actividad académica y por el cumplimiento fecha límite de presentación de la actividad. Podrán, sin embargo, presentarse los TP´s hasta la fecha de cierre de las actividades en el SAM. El incumplimiento del plazo de presentación de dicha instancia evaluativa, en tiempo y forma, reducirá 5 puntos por cada día de demora.

En ningún caso, la nota por incumplimiento de valoración de tiempo de entrega será menor a 50% o menor a 5 (cinco).

Para quienes se encuentren inscriptos en la Modalidad Presencial, Presencial Home y Presencial Distribuida, y cursen materias cuya tipología sea de Exploración y Conceptualización (MEC), el cuerpo docente propondrá actividades evaluativas en los entornos áulicos, que junto a la calificación obtenida de los Trabajos Prácticos (TPs) darán como promedio la nota final.

#### Condición de las materias de Integración y Aplicación (MIA)

| TIPOLOGÍA DE MATERIA | P/PH/PD/ED/EDH | REGULARIDAD | PROMOCIÓN DIRECTA | PROMOCIÓN INDIRECTA | LIBRE POR NOTA | LIBRE |
| --- | --- | --- | --- | --- | --- | --- |
| MIA | TP | 3 de 4 TP´s aprobados dentro de la fecha de vencimiento con nota 5 o más. + Participación en foros | 3 de 4 TP´s aprobados dentro de la fecha de vencimiento con nota 7 o más. + Participación en foros | 4 de 4 TP´s aprobados dentro de la fecha de vencimiento con nota 7 o más. + Participación en foros | No alcanza condicio nes de regularidad. | No alcanza condiciones de Regularidad/Libre por Nota |
| PARCIALES | Dos parciales aprobados con nota de 5 o más, pudiendo mediar recuperatorio/integrador | Dos parciales aprobados con nota de 7 o más, pudiendo mediar recuperatorio/integrador | Dos parciales aprobados con nota de 5 o 6, pudiendo mediar recuperatorio/integrador |  |  |  |
| ASISTENCIA (No aplica para submodalidad EDH) | 75% | 75% | 75% |  |  |  |
| CORRELATIVIDADES |  | Correlativas aprobadas. | Correlativas aprobadas. |  |  |  |
| FINAL | Examen de 30 preguntas online + Examen oral (solo en Modalidad P, PH y PD) | Materia aprobada | Materia aprobada | Examen de 50 preguntas online + Examen oral (solo en Modalidad P, PH y PD) | Debe recursar la materia |  |
| NOTA DE APROBACIÓN | Nota obtenida en el examen final | Promedio de parciales y notas de los 4 TP´s + Nota de Proceso (Modalidad Presencial) | Promedio de parciales y notas de los 4 TP´s + Nota de Proceso (Modalidad Presencial) | Nota obtenida en el examen final | No corresponde |  |

Dentro de las materias MIA, se incorporan en los trabajos prácticos (TP2 y TP3) FOROS DE DISCUSIÓN GRUPAL con el fin de promover espacios colaborativos y de debate crítico entre pares.

La participación en estos escenarios es de condición OBLIGATORIA.

IMPORTANTE: Si bien la participación en los FOROS DE DISCUSIÓN es grupal, la realización de los de los trabajos prácticos es **INDIVIDUAL.**

#### Condición de las Materias de Intervención Profesional (MIP)

| TIPOLOGÍA DE MATERIA | P/PH/PD/ED/EDH | REGULARIDAD | PROMOCIÓN DIRECTA | PROMOCIÓN INDIRECTA | LIBRE POR NOTA | LIBRE |
| --- | --- | --- | --- | --- | --- | --- |
| MIP | TP | 3 de 4 TP´s aprobados dentro de la fecha de vencimiento con nota 5 o más. Siendo obligatorio aprobar el 4º TP con nota de 5 o más + Participación en foros | 3 de 4 TP´s aprobados dentro de la fecha de vencimiento con nota 7 o más. Siendo obligatorio aprobar el 4º TP con nota de 5 o más. + Participación en foros | 4 de 4 TP´s aprobados dentro de la fecha de vencimiento con nota 7 o más. Siendo obligatorio aprobar el 4º TP con nota de 5 o más. + Participación en foros | No alcanza condiciones de regularidad. | No alcanza condiciones de Regularidad/Libre por Nota |
| PARCIALES | Dos parciales aprobados con nota de 5 o más, pudiendo mediar recuperatorio/integrador | Dos parciales aprobados con nota de 7 o más, pudiendo mediar recuperatorio/integrador | Dos parciales aprobados con nota de 5 o 6, pudiendo mediar recuperatorio/integrador |  |  |  |
| ASISTENCIA (No aplica para submodalidad EDH) | 75% | 75% | 75% |  |  |  |
| CORRELATIVIDADES |  | Correlativas aprobadas. | Correlativas aprobadas. |  |  |  |
| FINAL | Examen de 30 preguntas online+ Examen oral (solo en Modalidad P y PH) | Materia aprobada | Materia aprobada | Examen de 50 preguntas online + Examen oral (solo en Modalidad P y PH) | Debe recursar la materia |  |
| NOTA DE APROBACIÓN | Nota obtenida en el examen final | Promedio de parciales y notas de los 4 TP´s + Nota de Proceso (Modalidad Presencial) | Promedio de parciales y notas de los 4 TP´s + Nota de Proceso (Modalidad Presencial) | Nota obtenida en el examen final | No corresponde |  |

Dentro de las materias MIP, se incorporan en los trabajos prácticos (TP1 y TP3) FOROS DE DISCUSIÓN GRUPAL con el fin de promover espacios colaborativos y de debate crítico entre pares.

La participación en estos escenarios es de condición OBLIGATORIA.

IMPORTANTE: Si bien la participación en los FOROS DE DISCUSIÓN es grupal, la realización de los de los trabajos prácticos es INDIVIDUAL.

#### Condiciones de las Materias de Aplicación Preprofesional (MAP)

| TIPOLOGÍA DE MATERIA | P/PH/PD/ED/EDH | REGULARIDAD | PROMOCIÓN DIRECTA | PROMOCIÓN INDIRECTA | LIBRE POR NOTA | LIBRE |
| --- | --- | --- | --- | --- | --- | --- |
| MAP | TP | 3 de 4 TP´s aprobados con nota 5 o más aprobados de acuerdo a las fechas de entrega (*) | 3 de 4 TP´s aprobados con nota 7 o más aprobados de acuerdo a las fechas de entrega (*) | 4 de 4 TP´s aprobados con nota 7 o más aprobados de acuerdo a las fechas de entrega (*) | No alcanza condiciones de regularidad. | No alcanza condiciones de Regularidad/Libre por Nota |
| PARCIALES | Dos parciales aprobados con nota de 5 o más, pudiendo mediar recuperatorio/integrador | Dos parciales aprobados con nota de 7 o más, pudiendo mediar recuperatorio/integrador | Dos parciales aprobados con nota de 5 o 6, pudiendo mediar recuperatorio/integrador |  |  |  |
| ASISTENCIA (No aplica para submodalidad EDH) | 75% | 75% | 75% |  |  |  |
| FINAL | Examen de 30 preguntas online + Examen oral (solo en Modalidad P, PH y PD) | Materia aprobada | Materia aprobada | Examen de 50 preguntas online + Examen oral (solo en Modalidad P, PH y PD) | Debe recursar la materia |  |
| CORRELATIVIDADES |  | Correlativas aprobadas. | Correlativas aprobadas. |  |  |  |
| NOTA DE APROBACIÓN | Nota obtenida en el examen final | Promedio de parciales y notas de los 4 TP´s + Nota de Proceso (Modalidad Presencial) | Promedio de parciales y notas de los 4 TP´s + Nota de Proceso (Modalidad Presencial) | Nota obtenida en el examen final | No corresponde |  |

(*) Para materias de **cursado bimestrales**los TP´s deberán aprobarse:

- TPs 1 y 2: semana 5.
- TPs 3 y 4: semana 8.

(*) Para materias de **cursado cuatrimestrales**los TP´s deberán aprobarse:

- TPs 1 y 2: semana 8.
- TPs 3 y 4: semana 15.

En las materias cuya tipología sea de Aplicación Preprofesional (MAP), la nota de los Trabajos Prácticos será compuesta por la actividad académica y por el cumplimiento de la fecha límite de presentación de la actividad. Podrán, sin embargo, presentarse los TP´s hasta la fecha de cierre de las actividades en el SAM. El incumplimiento del plazo de presentación de dicha instancia evaluativa, en tiempo y forma, reducirá 5 puntos por cada día de demora.

En ningún caso, la nota por incumplimiento de valoración de tiempo de entrega será menor a 50% o menor a 5 (cinco).

Para quienes se encuentren inscriptos en la Modalidad Presencial, Presencial Home, Educación Distribuida Home y Presencial Distribuida, y cursen materias cuya tipología sea de Aplicación Preprofesional (MAP), el cuerpo docente propondrá actividades evaluativas de proceso en los entornos áulicos, que junto a la calificación obtenida de los Trabajos Prácticos (TPs) darán como promedio la nota final.

#### 4.5.9 CONDICIÓN AL FINALIZAR CURSADO DE VERANO

La condición final de la materia que adquieren quienes cursen en este período, se rige conforme lo detallado en el siguiente cuadro:

| CONDICIONES DE APROBACIÓN MATERIAS DE VERANO |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- |
| ACTIVIDAD | REGULARIDAD | PROMOCIÓN DIRECTA | PROMOCIÓN INDIRECTA | LIBRE POR NOTA | LIBRE |
| TP | 3 de 4 TP´s aprobados con nota 5 o más | 3 de 4 TP´s aprobados con nota 7 o más | 3 de 4 TP´s aprobados con nota 5 o más | No cumple condiciones | No cumple condiciones |
| PARCIALES | 2 parciales aprobados con nota 5 o más (Puede mediar Recuperatorio o Integrador) | 2 parciales aprobados con nota 7 o más (Puede mediar Recuperatorio o Integrador) | 2 parciales aprobados con nota 5 o más (Puede mediar Recuperatorio o Integrador) |  |  |
| CORRELATIVIDADES |  | Correlativas aprobadas. | Correlativas aprobadas. |  |  |
| FINAL | Examen de 30 preguntas | Materia aprobada | Materia aprobada | Examen de 50 preguntas | Debe recursar la materia |
| NOTA DE APROBACIÓN | Nota obtenida en el examen final | Promedio de parciales y notas de los 4 TP´s + Nota de Proceso (Modalidad Presencial) | Promedio de parciales y notas de los 4 TP´s + Nota de Proceso (Modalidad Presencial) | Nota obtenida en el examen final | No corresponde |

#### 4.5.10 MESAS ESPECIALES DE EXAMEN (RES.REC.291/06)

La creación de mesas especiales de Exámenes Finales sólo es válida para quienes cursan Carreras de Grado de las Modalidades Presencial, Presencial Home y Presencial Distribuida. Estas mesas son creadas fuera del período de las fechas previstas como turnos de exámenes pautadas por Calendario. (ver Régimen General de Sanciones, capítulo 13. apartado 1.)

Las condiciones de solicitud son:

- Que la mesa se solicite para la última materia de la carrera.
- Que el Trabajo Final de Graduación se encuentre en condiciones de Defensa Oral.

El período para receptar la solicitud de creación de la mesa especial debe tener una diferencia con los turnos de exámenes del calendario académico no inferior a 30 (treinta) días hábiles; de lo contrario, el alumno debe utilizar las fechas pautadas dentro del calendario académico.

La factibilidad de abrir la mesa queda supeditada a la Universidad y los docentes que evalúan la materia.

#### 4.5.11 EVALUACIÓN DE MATERIAS DE PROCESO

Todas las materias de Proceso, sin distinción de modalidad, están elaboradas bajo un diseño instruccional dentro del SAM, con 4 (cuatro) las actividades evaluables. Estas deben ser realizadas por cada estudiante de manera individual. El incumplimiento de esa prescripción puede ser sancionable.

Se adquiere la condición de Regular y/o Aprobado en sus materias de proceso de acuerdo a las reglas descriptas seguidamente:

#### • MODALIDAD PRESENCIAL (P./ PH / PD)

| EVALUACIÓN MATERIAS DE PROCESO GRADO MODALIDAD P Y PH |  |  |  |
| --- | --- | --- | --- |
| MODALIDAD | MATERIA | CONDICIÓN AL FINALIZAR CURSADO | NOTA APROBACIÓN |
| PH, P y PD | Seminario de Práctica | Aprobado: Tener aprobados 3 TPs con nota de 5 o más, siendo obligatorio aprobar el TP4. 75 % de asistencia a clases presenciales Correlativas aprobadas. | La nota final es el promedio de los 4 TP´s de la materia. El promedio nunca puede ser inferior a 4 en las materias. |
| Regular*: Tener aprobados 3 TPs, con nota de 5 o más, siendo obligatorio aprobar el TP4. 75 % de asistencia a clases presenciales Cuando no están aprobadas las correlativas. |  |  |  |
| Seminario de Planificación y Control de Gestión |  |  |  |
| Práctica Profesional |  |  |  |
| Práctica Solidaria |  |  |  |
| Seminario Final | Regular*: Tener aprobados 3 TPs, con nota de 5 o más, siendo obligatorio aprobar el TP4) 75 % de asistencia | Rinde Defensa Oral |  |

#### • MODALIDAD DISTANCIA (ED/EDH)

| EVALUACIÓN MATERIAS DE PROCESO GRADO MODALIDAD ED Y EDH |  |  |  |
| --- | --- | --- | --- |
| MODALIDAD | MATERIA | CONDICIÓN AL FINALIZAR CURSADO | NOTA APROBACIÓN |
| EDH / ED | Seminario de Práctica | Regular: Tener aprobados 3 TPs, con nota de 5 o más, siendo obligatorio aprobar el TP4) | La nota de aprobación es la obtenida en EFIP I |
| Seminario de Planificación y Control de Gestión |  |  |  |
| Módulo de Cursado EFIP | Regular |  |  |
| Práctica Profesional | Aprobado Tener aprobados 3 TPs con nota de 5 o más, siendo obligatorio aprobar el TP4. Correlativas aprobadas. Regular*: Tener aprobados 3 TPs, con nota de 5 o más, siendo obligatorio aprobar el TP4) Cuando no están aprobadas las correlativas. | La nota final es el promedio de los 4 TP´s de la materia. El promedio nunca puede ser inferior a 4 en las materias. |  |
| Práctica Solidaria | Aprobado Tener aprobados 3 TPs con nota de 5 o más, siendo obligatorio aprobar el TP4. |  |  |
| Seminario Final | Regular*: Tener aprobados 3 TPs, con nota de 5 o más, siendo obligatorio aprobar el TP4. | Rinde Defensa Oral |  |

Las materias de Proceso no pueden ser promocionadas ni rendidas en condición de libre por nota. Tanto en carreras de grado como de pregrado, cuando el estudiante no cumple con las condiciones de regularidad o de aprobación, según corresponda al finalizar el cursado, la materia adquiere la condición de Libre, debiendo recursarse en su totalidad.

*NOTA: En aquellas materias de proceso en que la nota de aprobación se obtiene sin rendir evaluación oral, la condición de APROBADA está sujeta a la aprobación y cumplimiento de su régimen de correlatividades. Si al finalizar el cursado, las correlativas previas no están aprobadas, la materia queda en estado REGULAR por un plazo máximo de 18 (dieciocho) meses. Si en dicho plazo no aprueba sus correlativas, la materia queda en estado LIBRE, y debe recursarla.

IMPORTANTE: El vencimiento de cada actividad evaluable se producirá en todos los casos, el domingo a las 23:59 horas de la semana correspondiente indicada en el cronograma.

#### A) PRÁCTICA SOLIDARIA

Para aprobar la materia es obligatorio cumplimentar con las siguientes condiciones:

• Cumplir con el 75% de asistencia a clases presenciales (solo aplica para Modalidad Presencial, Presencial Home y Presencial Distribuida)

• cumplir con el total de la carga horaria acordada con la organización y la obtención de una nota mayor o igual a 5 en la evaluación de desempeño de la misma.

• Aprobar 3 (tres) de los 4 TP´s disponibilizados en SAM, siendo obligatorio aprobar el TP Nº 4 con nota de 5 o más.

A continuación, se detalla el esquema de vencimiento de cada actividad evaluable, según el calendario de la modalidad de cursado.

| MATERIAS DE PROCESO GRADO | ACTIVIDADES EVALUABLES PLATAFORMA MULTIMEDIA |  |  |  |  |
| --- | --- | --- | --- | --- | --- |
| MATERIA | TP1 | TP2 | TP3 | TP4 |  |
| TODAS LAS MODALIDADES | PRACTICA SOLIDARIA | SEMANA 6 | SEMANA 8 | SEMANA 12 | SEMANA 15 |

IMPORTANTE: La nota final de aprobación de la asignatura será la correspondiente al promedio de los 4 TP´s, siendo obligatorio un promedio mínimo de 4 para aprobar la materia. No hay instancia de examen final.

#### B) PRÁCTICA PROFESIONAL

Para aprobar la materia es obligatorio cumplimentar con las siguientes condiciones:

• 75% de asistencia a los encuentros presenciales, aplica únicamente para Modalidad Presencial y Presencial Home)

• Realización de 250 horas de práctica en una organización, que deberán estar respaldadas por la planilla de asistencia correspondiente y la obtención de una nota mayor o igual a 7 (siete) de la evaluación de desempeño de la organización.

• Aprobar 3 (tres) de los 4 TP´s de la Plataforma Multimedia, siendo necesario aprobar el TP 4 con nota de 5 (cinco) o más.

• tener aprobadas la/s materia/s correlativa/s. En caso de no cumplir con esta condición, la Práctica Profesional adquiere estado Regular hasta tanto se aprueben la o las materias correlativas. En caso de no aprobarse las materias correlativas dentro del plazo de vigencia de la Regularidad (18 meses), dicha condición se pierde, debiendo recursar la materia.

A continuación, se detalla el esquema de vencimiento de cada actividad evaluable, según el calendario de la modalidad de cursado.

| MATERIAS DE PROCESO GRADO | ACTIVIDADES EVALUABLES PLATAFORMA MULTIMEDIA |  |  |  |  |
| --- | --- | --- | --- | --- | --- |
| MATERIA | TP1 | TP2 | TP3 | TP4 |  |
| TODAS LAS MODALIDADES | PRACTICA PROFESIONAL | SEMANA 6 | SEMANA 8 | SEMANA 12 | SEMANA 15 |

#### C) IDIOMAS

Quienes cursen la materia Idiomas dispondrán del Sistema de Aprendizaje Multimedia de Idiomas habilitado por un año calendario. Si el cursado inicia en el primer semestre, la plataforma permanecerá habilitada hasta la finalización del segundo semestre; si inicia en el segundo semestre, permanecerá habilitada hasta la finalización del primer semestre del año siguiente.

#### Desarrollo del cursado

Al iniciar, el estudiante debe realizar un Placement Test, disponible en una única oportunidad, que determinará el nivel de idioma a partir del cual corresponde cursar.

El criterio que habilita a rendir el Examen Final Integrador será la aprobación del nivel 6 o del curso Avanzado 3. .

En las modalidades Presencial, Presencial Home y Presencial Distribuida, se exige además la asistencia mínima al 75% de los encuentros presenciales establecidos en el calendario académico.

#### Regularidad

El estudiante obtiene la condición de Regular en todos los niveles de idioma previstos en su plan de estudios cuando:

• Aprueba seis niveles consecutivos con nota mínima de 70%, o • Aprueba el nivel Avanzado 3.

Quienes logren esta condición quedan habilitados para rendir el Examen Final Integrador durante un plazo de 18 meses.

La regularidad se pierde si el estudiante desaprueba o no se presenta al examen integrador en tres oportunidades, consecutivas o alternadas, debiendo cursar nuevamente la materia.

#### Examen Final Integrador

Consta de 50 preguntas de opción múltiple y requiere una calificación mínima de 4 para aprobar. Evalúa contenidos de gramática, vocabulario y comprensión lectora.

La nota obtenida en este examen se replicará en todos los niveles de idioma inglés contemplados en el plan de estudios.

#### Excepciones y reinicios

Quienes, en el Placement Test inicial, alcancen directamente el nivel Avanzado 3, quedarán exceptuados de cursar los niveles previos y podrán rendir directamente el examen integrador, sin otras actividades ni encuentros presenciales.

Si el estudiante no alcanza la regularidad en el año de cursado, se pierde todo el avance obtenido y deberá reiniciar la materia desde el comienzo.

Para poder cursar el último semestre de la carrera, es obligatorio tener aprobados todos los niveles de idioma extranjero.

En aquellas carreras cuyo perfil profesional requiere una mayor exigencia en idiomas, el cursado de Portugués exige como requisito previo la aprobación del Examen Integrador de Inglés.

El plan de estudios contempla dos niveles: Portugués Avanzado I (Idioma Extranjero VII) y Portugués Avanzado II (Idioma Extranjero VIII). Ambos se desarrollan en la Plataforma Multimedia bajo la tipología de Materia de Exploración y Conceptualización (MEC). Existe correlatividad entre los niveles, por lo que no pueden cursarse de manera

simultánea.

Para obtener la regularidad en cada nivel, el estudiante debe aprobar las actividades evaluativas establecidas: dos parciales (con posibilidad de recuperatorio y/o integrador) y tres de los cuatro Trabajos Prácticos de la Plataforma Multimedia, con nota mínima de cinco (5), siendo obligatoria la aprobación del TP4. Una vez alcanzada la regularidad, deberá inscribirse y rendir el examen final del nivel correspondiente. El examen final del segundo nivel de portugués solo podrá rendirse una vez aprobado el examen final del primer nivel.

La regularidad alcanzada tiene una vigencia de dieciocho (18) meses desde la finalización del cursado, durante los cuales el estudiante cuenta con hasta tres oportunidades para rendir el examen final de cincuenta preguntas.

IMPORTANTE: No se puede utilizar durante el examen diccionarios, glosarios, listados de verbos o cualquier otro elemento similar. Quienes cumplan las condiciones previstas en el Régimen de Reconocimiento de estudios (RCS N° 1094/2023 y complementarias), podrán solicitar la eximición del cursado de inglés y/o portugués, según corresponda, alcanzando dicha eximición a todos los niveles del idioma eximido que estén contemplados en la currícula de la carrera.

#### 4.5.12 EVALUACIÓN PARA CARRERAS DE PREGRADO (MP, PH, PD, ED y EDH)

Las instancias de exámenes parciales, recuperatorios o integradores se rinden en la Sede de cursado, en día y horario definido a tal fin en el Calendario Académico.

| MATERIAS DE PROCESO PREGRADO | ACTIVIDADES EVALUABLES PLATAFORMA MULTIMEDIA |  |  |  |
| --- | --- | --- | --- | --- |
| TP1 | TP2 | TP3 | TP4 |  |
| INTEGRACIÓN PROFESIONAL: ESTUDIO DEL CASO | SEMANA 4 | SEMANA 8 | SEMANA 12 | SEMANA 16 |
| SEMINARIO DE PRACTICA PROFESIONAL |  |  |  |  |

| EVALUACIÓN MATERIAS DE PROCESO PREGRADO |  |  |  |
| --- | --- | --- | --- |
| MODALIDAD | MATERIA | ESTADO | NOTA APROBACIÓN |
| MP, PH, PD, ED Y EDH | Integración Profesional: Estudio del Caso | Aprobado: ·TP N°4 aprobado con nota de 5 o más ·2 de los TPs 1, 2 o 3 con nota de 5 o más ·Correlativas aprobadas. Regular: ·TP N°4 aprobado con nota de 5 o más ·2 de los TPs 1, 2 o 3 con nota de 5 o más ·Cuando las correlativas no están aprobadas. | La nota final es el promedio de los 4 TP´s de la materia. El promedio nunca puede ser inferior a 4 en las materias. |
| Seminario de Práctica Profesional |  |  |  |

#### 4.5.13 EXÁMENES FINAL INTEGRADOR PRESENCIAL - EFIP I Y EFIP II

Los Exámenes Finales Integradores Presenciales (EFIP) I y II, son parte del modelo académico de Educación a Distancia adoptado por la Universidad Siglo 21. Estas instancias evaluativas, como parte del proceso de implementación de la opción pedagógica, tiene como objetivo principal obtener una visión cuantitativa y cualitativa de la integración y aplicación de los conocimientos y competencias que el estudiantado debe desarrollar para su formación profesional.

Estos exámenes son de carácter obligatorio y forman parte del Sistema Integral de Evaluación, cumpliendo las garantías exigidas por la normativa vigente.

Se aplican **exclusivamente** para aquellas personas inscriptas en **Carreras de Grado** de la Modalidad a Distancia (ED y EDH), excluyendo Ciclos de Complementación Curricular y Carreras de Pregrado. **Es una instancia sincrónica con docente que se rinde ante un Tribunal Evaluador.**

Se concederá la autorización para que los estudiantes puedan rendir los exámenes EFIP I y/o EFIP II haciendo uso de recursos tecnológicos, **bajo el criterio exclusivo de la Universidad**. En esta situación, la instancia de examen será grabada, reservando su uso únicamente a la Universidad con fines internos, con el objetivo de asegurar la calidad académica y el cumplimiento de las normativas vigentes.

Ante la imposibilidad fáctica y permanente de cualquiera de las personas inscriptas para trasladarse a la ciudad de Córdoba u otro centro evaluador descentralizado para rendir el examen final integrador presencial (EFIP), debidamente acreditada ante la Universidad, a exclusivo criterio de la Universidad, se podrá autorizar que el alumnado asista a un CAU para realizar el examen EFIP I y/o EFIP II mediante el uso de tecnología, estando el Tribunal Evaluador en Sede Campus.

Se considerará imposibilidad fáctica permanente aquella que perdure como mínimo durante el término de un año calendario, contado desde la fecha de la acreditación de tal imposibilidad ante la universidad. Las fechas y modalidades del examen, en su caso, serán dispuestas por la Universidad mediante Resolución Rectoral.

#### A) MÓDULO DE CURSADO - EFIP I

El Módulo de Cursado EFIP I está previsto como un espacio académico de preparación para el examen. En las carreras que se defina la no obligatoriedad del Módulo de cursado, el mismo es de cursado optativo por lo tanto queda a criterio de cada estudiante el uso que haga del servicio académico asociado al mismo (trabajos prácticos, lecturas, videos, etc.). Ahora, se recomienda el cursado del módulo y realización de cada una de las actividades que lo componen ya que promueven la profundización de los contenidos y el desarrollo de competencias que se requiere el estudiantado evidencie en la etapa de evaluación presencial.

Es requisito para poder inscribirse a rendir el EFIP I, que cada estudiante se inscriba al Módulo de cursado.

Los contenidos del Módulo de cursado EFIP I son establecidos por la Dirección de la Carrera, quien procurará la integración curricular respecto del perfil profesional del alumno, revisando un conjunto de temas incluidos en las asignaturas troncales del plan de estudio de la carrera.

La Universidad podrá definir la incorporación del Módulo cursado de EFIP I en aquellas carreras que actualmente no lo contemplan, respetando las características detalladas.

Las condiciones para obtener la Regularidad de la materia son:

- 3 de 4 TP´s aprobados con nota de 5 o más.
- 4º TP aprobado con nota de 5 o más
- 75% de asistencia en Modalidad ED, siempre que la materia se dicte en dicha modalidad.

#### B) EFIP I

El EFIP I es de carácter obligatorio cuando la persona inscripta se encuentra cursando a través de la Modalidad Distancia una carrera de Grado y como condición previa para obtener el Título Intermedio en aquellas carreras que este está previsto en el Plan de Estudios.

En el desarrollo del EFIP I se cumplen dos instancias de evaluación:

- **Integración curricular** de la carrera respecto a su perfil profesional
- **Producción oral y escrita de las materias de Idioma Extranjero**. Toda persona inscripta a EFIP I debe rendir esta última instancia si la carrera que está cursando incluye materias de Idiomas Extranjeros en su currícula.

Quienes cuenten con el Examen Integrador de Idioma aprobado (cursado por la plataforma Multimedia) o haya sido eximido del cursado de Idiomas conforme lo establecido en el apartado [Eximición de idioma extranjero](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=3-5-reconocimiento-de-estudios), será eximido de rendir el módulo de idioma en el EFIP I. Esta eximición no aplica a quienes hayan cursado y aprobado los contenidos de idiomas extranjeros con el sistema vigente hasta 2012 inclusive.

#### CONSIDERACIONES GENERALES

- El examen EFIP I se aprueba con nota de 4 (cuatro) a 10 (diez) siendo la calificación resultante igual al promedio simple de las notas de las dos instancias de evaluación, excepto en el caso de las carreras cuya currícula no incluye Idiomas extranjeros, en cuyo caso la nota del EFIP I será igual a la nota de la evaluación de Integración curricular.
- La aprobación de las 2 (dos) instancias, tanto Integración Curricular como Módulo de Idioma, es necesaria para la aprobación del EFIP I. Ambas instancias deben ser aprobadas en el mismo turno de examen, correspondiendo aplazo en el examen si una de las dos es desaprobada.
- La instancia de Integración curricular contempla una evaluación escrita y otra oral sobre los contenidos establecidos por la Dirección de la Carrera.
- Puede rendir EFIP I hasta un máximo de tres veces. En caso de resultar reprobado (o ausente) en las tres alternativas de examen de una o de ambas instancias del mismo, podrá:
- - Inscribirse nuevamente al Módulo de cursado EFIP I, aun cuando sea facultad del alumno tomar el apoyo académico que implica su cursada.

- De igual manera, el alumnado cuyas carreras no contemplen el Módulo de Cursado EFIP I en caso de resultar reprobado (o ausente) en las tres alternativas de examen de una o de ambas instancias del mismo, deberán recursar la materia Seminario de Práctica o Seminario de Planificación y Control de Gestión, según corresponda.
- La aprobación de las materias Seminario de Práctica y Seminario de Planificación y Control, no otorgan la aprobación de EFIP I, debiendo el alumno rendir EFIP I.

#### CONDICIONES DE CURSADO MÓDULO DE EFIP I

Para aquellas carreras que cuenten con las materias Seminario de Práctica o Planificación y Control de gestión cada estudiante deberá cumplir para poder inscribirse a su cursado con el plan de correlatividades de la carrera:

- Materias que debe tener en condición Regular.
- Materias que debe tener en condición Aprobada.

Para aquellas carreras que cuenten con el Módulo de Cursado de EFIP I, cada estudiante deberá cumplir para poder inscribirse a su cursado con el plan de correlatividades al Examen EFIP I

#### CONDICIONES PARA RENDIR EFIP I

Para poder inscribirse para Rendir el examen final de EFIP I cada estudiante deberá:

- Tener en condición Regular la materia Seminario de Práctica o Seminario de Planificación y Control de Gestión, de acuerdo a la currícula de su carrera. En aquellas carreras que se establezca el Módulo de Cursado EFIP I, deberá encontrarse la materia en condición Cursando o Regular.
- Deberá tener APROBADAS todas las materias que establezcan el plan de correlatividades de su carrera.

#### CONDICIONES PARA CURSAR LAS MATERIAS DEL 7mo y 8vo CUATRIMESTRE.

Para quienes se encuentren cursando una carrera de grado en la Modalidad Distancia, como regla, deberán contar con el Examen EFIP I en condición de Aprobado para poder cursar y aprobar las materias del 7mo y 8vo cuatrimestre.

En aquellos casos en los cuales EFIP I sea una correlativa directa de una materia del 7mo y 8vo cuatrimestre, podrá cursar la asignatura de los semestres 7 y 8, pero no podrá aprobar la materia, debiendo rendir el examen final una vez que apruebe el EFIP I.

En todos los casos, cada estudiante deberá cumplir con el plan de correlatividades que la carrera contemple:

- Materias que debe tener regular.
- Materias que deba tener aprobadas.
- EFIP I, en aquellos casos que sea correlatividad directa.

Sin haber aprobado el EFIP I, no podrá inscribirse a cursar la materia Seminario Final.

| CONDICIONES PARA APROBAR MATERIAS DEL 7MO Y 8VO SEMESTRE |  |
| --- | --- |
| Abogacía y Contador Público | Otras carreras |
| La aprobación de materias del 7mo y 8vo semestre sea por promoción o examen final, se regirá por lo establecido en el plan de correlatividades de cada carrera, quedando supeditadas a la aprobación del EFIP I, sólo aquellas materias que tengan correlatividad directa con el examen final integrador. Ver R.R. 4851.2021 | Será condición para aprobar por promoción o examen final cualquier materia posterior al sexto semestre de la carrera tener el EFIP I en estado APROBADO |

#### C) EFIP II

El EFIP II es de carácter obligatorio y su aprobación es condición previa para rendir el Trabajo Final de Graduación y obtener el Título de Grado que otorga la Universidad. En el desarrollo del EFIP II se evalúa la integración curricular de la carrera respecto del perfil profesional del alumnado.

Para acceder al EFIP II, el alumnado debe tener aprobadas todas las materias correspondientes al plan curricular de su carrera, incluyendo la Práctica Solidaria y los créditos exigidos en Materias Electivas para el plan de estudios vigente, y debe tener el Seminario Final en estado Regular.

El EFIP II contempla una evaluación escrita y otra oral sobre los contenidos establecidos por la Dirección de Carrera. El alumnado tiene a su disposición el temario o programa a evaluar en esta instancia de examen, dentro del Portal del Estudiante de la Universidad.

El alumnado que aprueba el examen comprensivo escrito pasa a continuación a la instancia oral.

Este examen oral consiste en una evaluación complementaria de los temas centrales abordados en la instancia escrita, así como eventualmente de otros temas referidos a aspectos nodales de la carrera.

Se puede rendir el EFIP II durante el período de tiempo en que desarrolla el proceso de los coloquios con la Comisión Académica Evaluadora (CAE) del Trabajo Final de Graduación.

En caso de que algunas de las instancias (escrita u oral) del EFIP II no sean satisfactorias, será desaprobado, y deberá rendirlo nuevamente. Quien no aprueba el EFIP II no puede realizar la Defensa Oral del Trabajo Final de Graduación.

La nota mínima con la que se aprueba el EFIP II es 4 (cuatro) y la máxima 10 (diez).

IMPORTANTE: Tanto el EFIP I como el EFIP II son presenciales y se rinden ante un Tribunal Evaluador. A exclusivo criterio de la Universidad, se podrá autorizar que el alumnado asista a un CAU para realizar el examen EFIP I y/o EFIP II mediante el uso de tecnología, estando el Tribunal Evaluador en Sede Campus.

4$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-5$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-5-1-calendario-academico$pea0$,
        $pea0$Calendario académico$pea0$, $pea0$La organización del año académico se define anualmente de acuerdo a los Calendarios Académicos de cada Modalidad de Estudio; es decir los documentos que señalan hitos importantes de cursado, desde…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-1-calendario-academico el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 5 | INSCRIPCIÓN AL CURSADO

### 5.1 CALENDARIO ACADÉMICO

La organización del año académico se define anualmente de acuerdo a los Calendarios Académicos de cada Modalidad de Estudio; es decir los documentos que señalan hitos importantes de cursado, desde las fechas de inscripción a las materias hasta los plazos para rendir exámenes y actividades calificables.

Es menester que el estudiantado conozca y consulte regularmente esta información, ya que constituye una guía fundamental para una planificación estratégica y una gestión eficaz del tiempo, garantizando el cumplimiento oportuno de cada actividad académica.

El esquema definido para cada calendario puede sufrir modificaciones de un año a otro en función de los feriados, situaciones específicas o disposiciones institucionales. Estos cambios se reflejan en el calendario académico definido por la Universidad para cada período lectivo.

Se publican anualmente en el Portal de estudiante. Es responsabilidad de cada estudiante conocer las distintas instancias del año y prever la inscripción a materias y distintos tipos de exámenes.

Para revisar el calendario académico, el alumnado lo tendrá disponible en el Portal de estudiante para consultarlo y descargar su versión digital.

La Universidad pone a disposición del alumnado el calendario académico completo, antes del inicio de clases. El alumnado es responsable de conocer las fechas límites para la presentación de los Trabajos Prácticos y Foros de Participación de acuerdo a su modalidad de estudios y a la tipología de cursado de la materia.

**FECHAS DE PARCIALES/RECUPERATORIOS/INTEGRADORES - ACLARACIÓN:**Para las modalidades: Presencial, Presencial Home, ED, EDH, siempre que un examen parcial, recuperatorio o integrador coincida con un Feriado Nacional o Provincial, será programado para el sábado inmediato posterior o para la semana siguiente a la prevista originariamente, pudiendo la Secretaría de Organización Académica disponer una solución diferente siempre que la planificación del calendario académico lo requiera. Igual determinación se aplicará en caso de reprogramarse un examen por cuestiones de fuerza mayor.

Para quienes cursen en la Modalidad Presencial Distribuida, siempre que un examen parcial, recuperatorio o integrador coincida con un Feriado Nacional, será programado para el sábado inmediato posterior o para la semana siguiente a la prevista originariamente, pudiendo la Secretaría de Organización Académica disponer una solución diferente siempre que la planificación del calendario académico lo requiera. Igual determinación se aplicará en caso de reprogramarse un examen por cuestiones de fuerza mayor.

#### 5.1.1 CALENDARIOS ACADÉMICOS MODALIDAD PRESENCIAL

**SUB-MODALIDAD PRESENCIAL (P.) Y PRESENCIAL DISTRIBUIDA (PD): CARRERAS DE GRADO**

El Calendario está organizado en 2 (dos) semestres de 16 semanas, con la siguiente planificación:

- Período de **1ros Parciales:** Semanas 7 y 8.
- Período de **2dos Parciales:** Semanas 14 y 15.
- Período de **Recuperatorios:**
- Período de **Finales:** instancia de exámenes en los meses de marzo - julio y diciembre durante los meses de regularidad de la materia (18 meses después de finalizado su cursado)

**SUB-MODALIDAD PRESENCIAL (MP): CARRERAS DE PRE-GRADO**

El año académico está organizado en 2 (dos) semestres. Cada semestre se divide en dos subperíodos de 9 (nueve) semanas. En cada semana de cursado el estudiante asiste a clases conformadas por 3 módulos de 40 minutos.

**SUB-MODALIDAD PRESENCIAL HOME (PH): CARRERAS DE GRADO**

El año académico está organizado en 2 (dos) semestres. Cada semestre se divide en 2 (dos) subperíodos de 9 (nueve) semanas cada uno.

- Período de **1ros Parciales:** Semanas 3 y 4
- Período de **2dos Parciales:** Semanas 7 y 8
- Período de **Recuperatorios:** Semana 9.
- Período de **Finales:** instancia de exámenes en los meses de marzo - julio y diciembre durante los meses de regularidad de la materia (18 meses después de finalizado su cursado)

**Calendario por Subperiodo**

| SEMANA | SEMANA 1 | SEMANA 2 | SEMANA 3 | SEMANA 4 | SEMANA 5 | SEMANA 6 | SEMANA 7 | SEMANA 8 | SEMANA 9 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| CURSADO CLASES PRESENCIALES | C | C |  | C | C | C |  | C |  |
| PARCIALES |  |  | 1° Parcial (Módulos 1 y 2) |  |  |  | 2° Parcial (Módulos 3 y 4) |  | Examen Recuperatorio / Integrador |

Referencias: C = CURSADO

En las carreras que por definición institucional implementa materias de Intervención Profesional (**MIP**) el cursado es **cuatrimestral** y las instancias evaluativas: parciales y finales se desarrollan tal
 como se detalla en la tabla:

| TIPO DE EXAMEN | SEMANA HABILITADA PARA RENDIR |
| --- | --- |
| Primer Examen Parcial | En la 7° y 8° semana de clases. |
| Segundo Examen Parcial | En la 16° y 17° semana de clases |
| Exámenes Recuperatorios y/o Integradores | Semana 18 |
| Exámenes Finales | Instancia de exámenes marzo - julio y diciembre |

#### 3.3.2 CALENDARIO ACADÉMICO MODALIDAD DISTANCIA

#### SUB-MODALIDAD EDUCACIÓN DISTRIBUIDA (ED)

El año académico está organizado en 2 (dos) semestres. Cada semestre se divide en 2 (dos) subperíodos de 9 (nueve) semanas cada uno:

|  | SEMANA 1 | SEMANA 2 | SEMANA 3 | SEMANA 4 | SEMANA 5 | SEMANA 6 | SEMANA 7 | SEMANA 8 | SEMANA 9 |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| CURSADO | Materia A Open Claas | A |  | A |  | A |  | A |  | Examen Recuperatorio Examen Integrador |
| Materia B Open Claas |  | B |  | B |  | B |  | B |  |  |
| Materia C (EDH) |  |  |  |  |  |  |  |  |  |  |
| PARCIALES | Materias con Open Claas | 1° Parcial | 2° Parcial |  |  |  |  |  |  |  |
| Materia EDH | 1° Parcial | 2° Parcial |  |  |  |  |  |  |  |  |

Aquellas materias que se cursen bajo la Sub-modalidad ED/EDH, podrán rendir el primer examen parcial dentro de las semanas 1 a la 4, y el segundo examen parcial de la semana 5 a la 8.

#### SUB-MODALIDAD EDUCACIÓN DISTRIBUIDA HOME (EDH)

El año académico está organizado en 2 (dos) semestres. Cada semestre se divide en 2 (dos) subperíodos de 9 (nueve) semanas cada uno:

| SEMANA | SEMANA 1 | SEMANA 2 | SEMANA 3 | SEMANA 4 | SEMANA 5 | SEMANA 6 | SEMANA 7 | SEMANA 8 | SEMANA 9 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PARCIALES | 1° Parcial | 2° Parcial | Examen Recuperatorio Examen Integrador |  |  |  |  |  |  |

**NOTA:** En las carreras que por definición institucional implementa materias de Intervención Profesional (**MIP**) el cursado es cuatrimestral y las instancias evaluativas: parciales y finales se desarrollan tal como se detalla en la tabla:

| TIPO DE EXAMEN | SEMANA HABILITADA PARA RENDIR |
| --- | --- |
| Primer Examen Parcial | Desde la 1ra a la 8va semana de clases. |
| Segundo Examen Parcial | A partir de la 10ma a la 17va semana de clases |
| Exámenes Recuperatorios y/o Integradores | Semana 18. |
| Exámenes Finales | Al finalizar la semana según calendario académico. |

#### 5.1.3 CALENDARIO DE ENTREGA DE ACTIVIDADES, DE ACUERDO A LA TIPOLOGÍA DE MATERIA Y MODALIDAD

#### MODALIDAD PRESENCIAL

| TIPOLOGÍA DE MATERIAS | MODALIDAD | ACTIVIDADES EVALUABLES PLATAFORMA MULTIMEDIA – TP`S | CANTIDAD DE ENTREGAS |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
|  | TP1 | TP2 | TP3 | TP4 |  |  |
| MIA | PRESENCIAL | S. 5 | S. 8 | S. 10 | S. 15 | ÚNICA |
| PH | S. 4 | S. 5 | S. 7 | S. 8 |  |  |
| PD | S. 5 | S. 8 | S. 10 | S. 15 |  |  |
| MEC | PRESENCIAL | S. 8 | S. 8 | S. 15 | S. 15 | ILIMITADA* |
| PH | S. 5 | S. 5 | S. 8 | S. 8 |  |  |
| PD | S. 8 | S. 8 | S. 15 | S. 15 |  |  |
| MIP | PRESENCIAL | S. 5 | S.9 | S. 12 | S. 15 | ÚNICA |
| PH | S. 5 | S.9 | S. 12 | S. 16 |  |  |
| PD | S. 5 | S.9 | S. 12 | S. 15 |  |  |

Referencias: S. = Semana límite de presentación

#### MODALIDAD DISTANCIA

| TIPOLOGÍA DE MATERIAS | MODALIDAD | ACTIVIDADES EVALUABLES PLATAFORMA MULTIMEDIA – TP`S | CANTIDAD DE ENTREGAS |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
|  | TP1 | TP2 | TP3 | TP4 |  |  |
| MIA | ED / EDH | S. 4 | S. 5 | S. 7 | S. 8 | ÚNICA |
| MEC | ED / EDH | S. 5 | S. 5 | S. 8 | S. 8 | ILIMITADA* |
| MIP | ED / EDH | S. 5 | S. 9 | S. 12 | S. 16 | ÚNICA |

(*) Las Materias de Exploración y Conceptualización (MEC), cuentan con trabajos prácticos que pueden realizarse de manera recurrente hasta la fecha límite de realización establecida por calendario académico (semana 9).

#### MEC - Valoración de Tiempo de Entrega de Trabajos Prácticos:

| FECHA DE INICIO DE PERIODO | LA FECHA DE ENTREGA | FECHA FIN DE PERIODO |
| --- | --- | --- |
| Esta Fecha hace referencia al momento de inicio de Cursado donde se habilitan en el SAM, todas las actividades evaluativas (TP) para realizar. | Esta es la última fecha disponible para entregar el TP antes que se aplique la Valoración de Tiempo de Entrega. La instancia de Valoración de tiempo de entrega, son fechas establecidas por calendario que premia la realización de Tp previo a la instancia de cada parcial. Si el estudiante no realiza su TP para la fecha establecida, se le descontará un 5% de su calificación de TP por día de retraso. No se descontarán más de 50 puntos por entrega de TP fuera de plazo. Esto quiere decir, que la nota final no será menor a 5 a causa de la Valoración de Tiempo de Entrega, por lo que el TP no quedará desaprobado por este motivo. | Esta fecha responde a la finalización del periodo. Es la última instancia habilitada en el SAM, para entregar de Trabajo Practico. . |

#### 5.1.4 CURSADO DE MATERIAS DE VERANO

Existe un período excepcional de cursado para el alumnado, denominado “Verano”. Las materias que se dictan en este período son seleccionadas para que puedan recuperar y completar los periodos anteriores y las condiciones necesarias para inscribirse en el próximo periodo.

Las personas Ingresantes, sin distinción de modalidad, no están habilitados para cursar materias en verano.

Las carreras en las que institucionalmente se haya definido la implementación de tipologías de materias específicas (Ver. Apartado 3.2.2. Tipología de materias) tendrán disponible para inscripción en período de verano únicamente las Materias de Exploración y Conceptualización (MEC) y Materias de Integración y Aplicación (MIA), quedando excluidas las Materias de Intervención Profesional (MIP) y las materias de proceso.

Es importante aclarar que la apertura de una materia de verano implica la inscripción de un cupo de 15 (quince) estudiantes como mínimo. En caso de no completarse, la Universidad podrá decidir no realizar dicha apertura.

Quienes opten por cursar en el período de verano deberán:

- Encontrarse matriculado para el primer semestre del próximo periodo académico y haber abonado el arancel correspondiente a cada una de la/s materia/s que cursa. La matrícula es válida para la inscripción de materias del primer semestre del nuevo año académico.
- Tener regularizada su situación académica (documentación del legajo, encuesta, etc.).
- Respetar el régimen de correlativas de su plan de estudio para la inscripción y/o aprobación de la materia.
- Para las materias del cuarto cuatrimestre, haber aprobado Universitario 21.

Las fechas de las inscripciones a Materias de Verano, su cursado y turnos de exámenes están definidos en el Calendario Académico correspondiente.

Quienes cursen en el periodo de verano tendrán el siguiente esquema para rendir exámenes parciales.

|  | SEMANA 1 | SEMANA 2 | SEMANA 3 | SEMANA 4 | SEMANA 5 |
| --- | --- | --- | --- | --- | --- |
| PARCIALES |  | 1° Parcial |  | 2° Parcial | Examen Recuperatorio |

Para presentar Trabajos Prácticos, deberán respetar el calendario de entregas de acuerdo a la tipología de la materia.

| TIPOLOGÍA DE MATERIAS | ACTIVIDADES EVALUABLES PLATAFORMA MULTIMEDIA – TP`S |  |  |  |
| --- | --- | --- | --- | --- |
|  | SEMANA 1 | SEMANA 2 | SEMANA 3 | SEMANA 4 |
| MIA | TP 1 | TP 2 | TP 3 | TP 4 |
| MEC |  | TP 1 y 2 |  | TP 3 y 4 |

*Referencia: TP = Trabajo Práctico

5$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-1-calendario-academico$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-5$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 2, $pea0$rg-5-2-inscripcion-a-materias$pea0$,
        $pea0$Inscripción a materias$pea0$, $pea0$El período de inscripción a materias está definido y establecido por el Calendario Académico y es publicado para todas las modalidades. Una vez finalizado dicho período, no se podrá proceder a la i…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-2-inscripcion-a-materias el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 5 | INSCRIPCIÓN AL CURSADO

En el presente capítulo se establecen las consideraciones generales para la inscripción al cursado de materias en cada semestre.

### 5.2 INSCRIPCIÓN A MATERIAS

El período de inscripción a materias está definido y establecido por el Calendario Académico y es publicado para todas las modalidades. Una vez finalizado dicho período, no se podrá proceder a la inscripción para cursar materias.

La persona que desee cursar materias, cada semestre deberá:

- Tener regularizada su situación administrativa (aranceles).
- Tener regularizada su situación académica (documentación del legajo, encuesta, etc.).
- Estar matriculado en el semestre en curso.
- Abonar la matrícula y los aranceles e inscribirse a las materias.
- Respetar el régimen de correlativas de su plan de estudio para la inscripción y/o aprobación de la materia.
- Para las materias de cuarto cuatrimestre, haber aprobado Universitario 21.
- Las inscripciones para cursar las materias Práctica Solidaria y Práctica Profesional podrán realizarse hasta el viernes previo al inicio de clases establecido en el calendario académico.

La apertura de materias para inscripción se realiza según el cuatrimestre del plan de estudio al que corresponde cada asignatura, es decir, en el primer semestre/período se abren las materias correspondientes a los cuatrimestres impares mientras que en el segundo semestre/período tienen apertura las materias de los cuatrimestres pares.

Excepcionalmente la Universidad podrá disponer la apertura de materias en un período/semestre distinto o en ambos, quedando, la apertura definitiva de las materias sujeta al cupo mínimo requerido.

En todas las modalidades el alumnado deberá optar por las materias que requieran cursar, en función de la apertura de materias dispuestas, su avance académico y los requisitos de inscripción. Quienes ingresan a cursar una carrera, en cambio, quedan inscriptos al primer semestre automáticamente, contemplando esa primera inscripción las materias de Universitario 21, con excepción de quienes hayan resultado eximidos.

**IMPORTANTE:** La persona adquiere condición de inscripta al semestre sólo cuando haya abonado la matrícula, la cual debe cancelarse antes del inicio de cada período o subperíodo de clases. Del mismo modo, sólo se adquiere la condición de inscripta al cursado de la materia cuando se han abonado los aranceles y se ha realizado la inscripción correspondiente a las materias.

#### 5.2.1 INSCRIPCIÓN A MATERIAS MODALIDAD PRESENCIAL (P) Y PRESENCIAL DISTRIBUIDA (PD)

Quienes se encuentren inscriptos a cursar en la sub-modalidad Presencial (P) y Presencial Distribuida (PD), pueden inscribirse a cursar hasta un máximo de 8 materias siempre que su condición académica de correlatividad se lo permita.

En todos los casos, la inscripción a materias extra implicará el pago de un arancel adicional.

#### 5.2.2 INSCRIPCIÓN A MATERIAS MODALIDAD PRESENCIAL HOME (PH)

Quienes se encuentren inscriptos a cursar en la sub-modalidad Presencial Home, se inscriben a materias por bimestre, a excepción de las materias que por su tipología sean de cursado cuatrimestral.

Se recomienda cursar 6 materias en el semestre completo. Siempre que se cumplan las condiciones académicas exigidas, el alumno podrá cursar hasta 2 (dos) adicionales.

Quienes se inscriban a cursar materias extras, deberán abonar un arancel por cada inscripción realizada.

**En todos los casos, la inscripción a materias extra implicará el pago de un arancel adicional. Los estudiantes ingresantes a la carrera no podrán inscribirse a materias extras.**

#### 5.2.3 INSCRIPCIÓN A MATERIAS MODALIDAD EDUCACIÓN DISTANCIA (ED Y EDH)

- **Para quienes cursen una carrera de Grado** podrán inscribirse a un máximo de 6 (seis) materias en el inicio del primer período de cada semestre, más 2 (dos) materias adicionales, siempre que se cumplan las condiciones académicas de correlatividad. Si se desea inscribir únicamente en el subperíodo B, sólo podrá cursar 1 (una) materia extra. Aplica esta regla para los Ciclos de Complementación Curricular que en su plan de estudios tenga 6 materias por semestre.
- **Para quienes cursen una carrera de Pregrado** podrán inscribirse a un máximo de 4 (cuatro) materias en el inicio del primer período de cada semestre, más 2 (dos) materias adicionales, siempre que se cumplan las condiciones académicas de correlatividad. Si desea inscribir únicamente en el subperíodo B, sólo podrá cursar 1 (una) materia extra.
- **Para quienes cursen la carrera de Procurador** podrán inscribirse a un máximo de 5 (cinco) materias en el inicio del primer período de cada semestre, más 2 (dos) materias adicionales, siempre que se cumplan las condiciones académicas de correlatividad. Si desea inscribirse únicamente en el subperíodo B, sólo podrá cursar 1 (una) materia extra.
- **Para quienes cursen una carrera de Ciclos de Complementación (Licenciatura en Educación y Escribanía)** podrán inscribirse a un máximo de 4 (cuatro) materias en el inicio del primer período de cada semestre, más 2 (dos) materias adicionales, siempre que se cumplan las condiciones académicas de correlatividad. Si desea inscribirse únicamente en el subperíodo B, sólo podrá cursar 1 (una) materia extra.
- **Las personas Ingresantes** a una carrera Modalidad Distancia, con materias aprobadas por equivalencias, o estudiantes que optan por inscribirse a cursar en alguno de los segundos subperíodos de cada semestre (junio u octubre de cada año), sólo pueden inscribirse a cursar las materias ofrecidas en dicho subperíodo, hasta un máximo de 3 asignaturas.

**En todos los casos, la inscripción a materias extras implicará el pago de un arancel adicional. Los estudiantes ingresantes a la carrera no podrán inscribirse a materias extras.**

5$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-2-inscripcion-a-materias$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-5$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 3, $pea0$rg-5-3-inscripcion-a-materias-de-verano$pea0$,
        $pea0$Inscripción a materias de verano$pea0$, $pea0$La inscripción a materias para cursar en período verano está disponible, en todas las modalidades, únicamente para personas que se reinscriban al cursado, quedando excluidas las personas ingresante…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-3-inscripcion-a-materias-de-verano el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 5 | INSCRIPCIÓN AL CURSADO

#### 5.3 INSCRIPCIÓN A MATERIAS DE VERANO

La inscripción a materias para cursar en período verano está disponible, en todas las modalidades, únicamente para personas que se reinscriban al cursado, quedando excluidas las personas ingresantes a carreras.

Podrán inscribirse a cursar hasta un máximo de 4 (cuatro) materias.

5$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-3-inscripcion-a-materias-de-verano$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-5$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 4, $pea0$rg-5-4-cambio-de-catedra$pea0$,
        $pea0$Cambios de cátedra$pea0$, $pea0$Los cambios de cátedra aplican únicamente para quienes se encuentren cursando carreras en la Modalidad Presencial, Presencial Home y Presencial Distribuida se realizan únicamente durante el período…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-4-cambio-de-catedra el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 5 | INSCRIPCIÓN AL CURSADO

### 5.4 CAMBIO DE CÁTEDRA

Los cambios de cátedra aplican únicamente para quienes se encuentren cursando carreras en la Modalidad Presencial, Presencial Home y Presencial Distribuida se realizan únicamente durante el período estipulado por Calendario Académico y siempre que exista superposición de horario de cursado de materias inscriptas, cuando sean materias del mismo semestre

**NOTA:** En caso de que la persona inscripta se encuentre cursando simultáneamente materias de distintos cuatrimestres es importante aclarar que la Universidad **no puede garantizar** que no existan superposiciones de horarios.

Al momento de solicitar un cambio de cátedra, se debe considerar lo siguiente:

- Debe tener pagos los aranceles del semestre.
- Pueden cambiarse solo a cátedras que pertenezcan al mismo turno de cursado.

5$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-4-cambio-de-catedra$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-6$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-6-1-sistema-de-equivalencias-para-todas-las-modalidades$pea0$,
        $pea0$Sistema de equivalencias para todas las modalidades$pea0$, $pea0$La Universidad Siglo 21 reconoce tramos académicos realizados en otras instituciones, lo que implica la sensible tarea de verificar la correspondencia de estudios, no sólo en su contenido, sino tam…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=6-1-sistema-de-equivalencias-para-todas-las-modalidades el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 6 | EQUIVALENCIAS, PASANTÍAS, AYUDANTÍAS Y CRÉDITOS

En el presente capítulo se establecen las consideraciones generales para la solicitud de reconocimientos de materias cursadas en la Universidad, como así también en otras instituciones educativas. Asimismo, se establecen las posibles doble titulaciones que podrían efectuar las personas egresadas de la Universidad.

También se aborda el régimen de pasantías, ayudantías y adscripciones que brinda la Universidad,

### 6.1 SISTEMA DE EQUIVALENCIAS PARA TODAS LAS MODALIDADES

#### 6.1.1 ASPECTOS GENERALES

La Universidad Siglo 21 reconoce tramos académicos realizados en otras instituciones, lo que implica la sensible tarea de verificar la correspondencia de estudios, no sólo en su contenido, sino también en su enfoque, profundidad, metodología de aprendizaje y evaluación, a fin de otorgar a los mismos el efecto jurídico- académico de equipararse a materias, contenidos o estudios aprobados en la propia Institución.

Este proceso comprende también la tarea formal de dejar fehacientemente acreditada la decisión de la Institución de otorgar el reconocimiento y, por su similitud, requiere parecidos resguardos que los que se adoptan para registrar la aprobación de una materia.

La [Res. CS N° 1094/2023](https://contenidos.21.edu.ar/microsites/reglamento/assets/pdf/rcs-651.2018-regimen-de-reconocimiento-de-estudios.pdf), establece los mecanismos de reconocimiento de estudios previos y establece los lineamientos generales a cumplir para su otorgamiento.

Al momento de analizar una solicitud de reconocimiento de materias, se deberán tener en cuenta los siguientes criterios generales:

- Que ello asegure de manera efectiva la formación integral del futuro profesional.
- La existencia de una “razonable equivalencia” entre los estudios cursados y los vigentes, a la fecha de la solicitud, en la Universidad, evaluándose para ello no sólo los contenidos sino también los objetivos de la materia, la bibliografía utilizada y la cantidad de horas de cursada.
- Las características del plan de estudios y especialmente el nivel en el que las materias se encuentran ubicadas en el mismo, el programa de estudios y el sistema de enseñanza.
- Los mecanismos de auto evaluación de la institución de origen y su reconocimiento en el medio.
- La existencia de materias que tengan el mismo nombre o nombre similar NO implica necesariamente que resulten equivalencias en sus contenidos ya que las Universidades tienen autonomía para el diseño de los programas de cada materia, pudiendo diferir la orientación seguida por cada Institución.

#### 6.1.2 TIPOS DE RECONOCIMIENTOS

Según si los estudios que la persona aspirante desea reconocer han sido aprobados en una Institución externa o bien en otra carrera que forma parte de la oferta académica de Siglo 21, se considerarán equivalencias externas o internas respectivamente.

#### 6.1.3 MECANISMOS DE RECONOCIMIENTO

Los mecanismos por los cuales se podrán reconocer equivalencias externas o internas son:

- **Pre-dictamen general**  Este mecanismo de reconocimiento de equivalencia implica la existencia de una Resolución mediante la cual, a propuesta de la Dirección de la Carrera o del área académica especializada, la persona a cargo del Rectorado de la Universidad o la persona en la cual se delegue, reconoce y otorga equivalencias preestablecidas entre una carrera y plan de origen (de Institución externa o de la misma Universidad) a una carrera específica, pudiendo extenderse este reconocimiento a toda la oferta académica vigente. En estos casos el reconocimiento de estudios opera de manera automática para la persona aspirante o estudiante que acredite de manera fehaciente haber aprobado las materias de la carrera origen que sean requeridas para el otorgamiento de equivalencias en la carrera destino, sin necesidad de incorporar un proceso de análisis por parte de la Dirección de Carrera o del área académica especializada.
- **Dictamen individual favorable de la Dirección de la Carrera**  Cuando no existiera un pre-dictamen que apruebe equivalencias preestablecidas para la Institución, carrera y plan de origen del solicitante, la Secretaría de Organización Académica correrá vista a la Dirección de la Carrera y/o al área académica especializada a fin de que realice el análisis de correspondencia de los contenidos  Para el caso de equivalencias internas también se podrán otorgar equivalencias directas por igual denominación de las materias, salvo disposición en contrario.

#### 6.1.4 MECANISMOS EXTERNOS DE EQUIVALENCIAS

#### A) PROCEDIMIENTO DE SOLICITUD DE EQUIVALENCIAS EXTERNAS

Podrán solicitar el reconocimiento de estudios todas aquellas personas aspirantes o estudiantes de carreras de Pregrado, Grado, y Posgrado que hayan aprobado tramos académicos en otra Institución de Nivel Superior o Universitaria, siempre que cumplan con las condiciones establecidas.

Podrán iniciar el trámite en cualquier momento desde que adquiere la calidad de aspirante, con la salvedad de que, en caso de solicitar equivalencias de semestres avanzados, cada estudiante deberá programar el inicio del cursado conforme la apertura de las materias al momento de su inscripción y considerando el plan de correlatividades correspondiente a su carrera.

Asimismo, es responsabilidad de la persona interesada, previamente a la finalización del trámite correspondiente, decidir sobre la inscripción al cursado de materias que pueden luego ser reconocidas por equivalencia, sin que ello signifique devolución de aranceles.

Para iniciar el trámite de reconocimiento de equivalencias externas, el solicitante deberá cumplir con los siguientes requisitos:

Completar la solicitud web, presentando la siguiente documentación de manera digital:

- Fotocopia del frente y dorso del DNI digital actualizado.
- Copia legalizada del Certificado Analítico emitido por la Institución de origen que detalle las materias aprobadas, la fecha de aprobación, calificación obtenida y datos de libro y folio o acta en la cual se registraron.
- Copia legalizada del Plan de Estudios de la carrera.
- Si la escala de notas de la Institución de origen fuera diferente a la de Siglo 21, se deberá acompañar también una nota certificada que dé cuenta de la escala de notas adoptada por dicha Institución.
- Copia legalizada y foliada de los Programas de estudio de las materias solicitadas por equivalencia (en caso de existir un pre-dictamen de equivalencias aprobado por Resolución Rectoral no se exige este requisito).
- Comprobante de pago realizado de solicitud de trámite

Toda documentación que sea emitida con firma digital en los términos de la Ley Nº 25.506 o la que en su futuro la sustituya, deberá cumplir los siguientes requisitos:

- Haber sido creada durante el período de vigencia del certificado digital válido del firmante.
- Ser debidamente verificada por la referencia a los datos de verificación de firma digital indicados en dicho certificado según el procedimiento de verificación correspondiente.
- Que dicho certificado haya sido emitido o reconocido por un certificador licenciado.
- La documentación emitida con firma digital deberá ser remitida sin alteraciones, modificaciones, división del archivo y/o cualquier otra adulteración del mismo, no pudiendo enviar la persona aspirante la documentación impresa. La documentación impresa carece de validez.

Importante: En caso de que una persona aspirante quiera solicitar materias por equivalencias aprobadas en más de una Universidad de origen, deberá presentar la documentación completa correspondiente a las diferentes universidades de origen.

La Universidad dará curso exclusivamente a solicitudes luego de verificar consistencias entre los datos consignados en el formulario web y la documentación respaldatoria y cuya documentación se haya presentado de manera completa y de acuerdo a las condiciones establecidas en el presente reglamento, caso contrario el trámite quedará en estado pendiente hasta que se regularice la documentación y/o datos faltantes.

Al ingresar un trámite, la solicitud se evalúa en relación a las materias aprobadas y solicitadas por cada estudiante. El trámite se gestiona en un plazo de 45 (treinta) días hábiles desde el ingreso de la documentación completa a la Universidad.

En caso de que la persona solicitante quiera ampliar el reconocimiento de estudios solicitado originalmente deberá iniciar un nuevo trámite, completando la documentación requerida para acreditar la aprobación de las materias cuyo reconocimiento no estuvo contemplado en la solicitud de equivalencias anterior.

#### B) EXIMICIÓN DE IDIOMA EXTRANJERO

Podrán solicitar el reconocimiento de las materias correspondientes a Idioma Extranjero los/as alumnos/as que cumplan las condiciones previstas en el Régimen de Reconocimiento de estudios y que se detallan a continuación:

- Tener estudios previos de inglés con certificación Internacional comprobable. Dicha certificación es válida cuando se encuentre entre las comprendidas dentro de las reconocidas por la Universidad en la Resolución del Consejo Superior Nº 1094/2023
- Tener títulos universitarios o terciarios de validez nacional con el rango de Licenciatura, Profesorado o Traducción de Inglés o portugués. En ambos casos, deberán cumplimentar los requisitos establecidos para la solicitud de equivalencias externas, alcanzando la eximición, el total de los niveles de idiomas incluidos en la currícula de cada estudiante, según corresponda de acuerdo a la documentación presentada.

Este reconocimiento será registrado con calificación siete (7) en el analítico de la persona solicitante.

IMPORTANTE: No se otorga reconocimiento por equivalencias de niveles de idioma que hayan sido aprobados en otra Universidad.

#### C) DISPOSICIONES COMPLEMENTARIAS

- **Tasa administrativa:** La Universidad establece como requisito para el inicio de un trámite de reconocimiento de estudios por equivalencias o articulación, el pago de un arancel en concepto de tasa administrativa para la gestión de reconocimiento de estudios. Será potestad de la Universidad bonificar de manera parcial o total dicho arancel.
- **Porcentaje de reconocimiento externo**: El reconocimiento de estudios aprobados en otra Institución no podrá comprender más del setenta por ciento (70%) del plan de estudios de la carrera destino en la Universidad.
- **Reconocimiento parcial:** La Universidad en ningún caso otorgará un reconocimiento parcial o el otorgamiento de la condición de regular por equivalencia.
- **Antigüedad de la equivalencia:** A fin de garantizar la correspondencia y la excelencia académica de los contenidos, la universidad podrá establecer, a los efectos de su reconocimiento, una antigüedad máxima de vigencia de las materias aprobadas en Instituciones externas.
- **Materias exceptuadas del reconocimiento:** La Universidad no otorga el reconocimiento por equivalencia externa de las materias Práctica Solidaria y Práctica Profesional, Seminario Final, las que deberán ser aprobadas, en todos los casos, en Siglo 21. Tampoco se otorgará el reconocimiento por equivalencia externa de la materia Seminario de Práctica o Seminario de Planificación y Control de Gestión cuando la misma corresponda al cursado en modalidad distancia, ya que la aprobación de la misma estará indefectiblemente asociada a la aprobación del examen EFIP I.

IMPORTANTE: No se otorga reconocimiento por equivalencias de niveles de Idiomas aprobados en otra Universidad con la salvedad de lo establecido en el apartado 6.1.4.B) en relación a la eximición total de Idiomas.

#### 6.1.5 MECANISMOS INTERNOS DE RECONOCIMIENTO DE ESTUDIOS

Quienes hayan cursado y/o egresado de esta Casa de Altos Estudios, podrán solicitar el reconocimiento de estudios entre diferentes ofertas de la Universidad, sea por equivalencias internas, doble titulación o articulación. Deberán iniciar el trámite administrativo requerido para ello, conforme los procesos vigentes, debiendo estar finalizado dicho trámite para poder inscribirse a materias que tengan correlatividad en la carrera de destino.

#### 6.1.6 EQUIVALENCIAS INTERNAS

Quienes hayan realizado un cambio de carrera entre diferentes carreras de la Universidad Siglo 21 (Grado, Pregrado y Posgrado) y posean materias aprobadas en el plan de estudio de la carrera de origen que también pertenezcan al plan de estudio de la carrera destino, podrán solicitar el reconocimiento de dicha aprobación en carácter de equivalencias internas.

También podrán solicitar reconocimiento de equivalencias internas quienes hayan iniciado el cursado de otra carrera de la oferta académica (Pregrado, Grado y Posgrado) cuya currícula contemple materias que ya han sido aprobadas como parte del plan de estudios de una carrera anterior.

En todos los casos, el otorgamiento de aprobación por equivalencia interna quedará sujeto a que la materia cuyo reconocimiento se solicita haya sido cursada y aprobada en la Universidad, quedando restringida la posibilidad de otorgar por reconocimiento interno una materia que haya sido aprobada por algún mecanismo de articulación.

#### A) RECONOCIMIENTO DE CRÉDITOS POR MATERIAS ELECTIVAS

Se podrán reconocer créditos por Materias Electivas en las siguientes situaciones:

• Las asignaturas aprobadas en otra carrera de grado o en una carrera de pregrado solo podrán ser reconocidas como electivas cuando el plan de estudios de la carrera de destino las contemple expresamente como tales. En consecuencia, únicamente se reconocerán como créditos electivos aquellas materias que, aun no integrando la currícula obligatoria de la carrera de destino, estén clasificadas como electivas en dicho plan.

• Cuando, al producirse un cambio de plan de estudio (por cualquier mecanismo de pase), el alumno tenga materias aprobadas en el plan anterior, que no pertenecen al nuevo plan, a excepción de los idiomas.

La cantidad de créditos que se reconocen en cada caso serán los definidos para la materia reconocida en el plan de estudio de procedencia. Para que se haga efectivo el otorgamiento de crédito, el alumno debe solicitar el trámite de equivalencias correspondiente.

La Universidad podrá también, a través de los mecanismos formales correspondientes, determinar el reconocimiento de crédito por otras actividades extracurriculares que, por su contenido, naturaleza y duración sean significativas y trascendentes para la formación integral de los estudiantes.

Cada categoría de actividad reconocida otorgará el reconocimiento académico conforme a lo establecido en la Resolución Rectoral Nº 5248/2022, siempre que el alumno haya cumplido los requisitos establecidos en la normativa específica que regula la actividad, y tal condición se haya acreditado mediante certificado, constancia o acto administrativo.

Asimismo, los decanatos de la Universidad podrán establecer el otorgamiento de créditos académicos por la participación de estudiantes en actividades cocurriculares. Cada decanato establecerá mediante resolución rectoral las condiciones para su otorgamiento.

#### B) DOBLE TITULACIÓN

La Universidad podrá aprobar tramos de articulación entre diferentes carreras de la oferta académica, con el objetivo que los estudiantes de una primera carrera puedan obtener también el título de una segunda carrera que tenga raíz común. Las materias reconocidas en la carrera destino y las materias específicas que cada estudiante deba cursar para alcanzar la doble titulación estarán establecidas en la resolución que regule cada articulación por doble titulación, como así también el resto de las condiciones que deban cumplirse para poder acceder al reconocimiento de estudios por esta vía.

Conforme a lo establecido por Resolución del Consejo Superior Nº 1094/2023, queda establecido que siempre que exista una Doble Titulación vigente para la carrera destino, el reconocimiento de estudios se aplicará por el mecanismo de articulación y no mediante el mecanismo de equivalencias internas simples.

Para ello, no será excluyente la generación de un nuevo legajo en la carrera de destino, pudiendo la persona solicitante haber tenido previamente materias aprobadas en la carrera destino, ya sea por cursado, equivalencias externas o equivalencias internas.

Las materias que se otorguen por el mecanismo de Doble Titulación en el legajo de destino o secundario se otorgaran en condición aprobado condicional, debiendo la persona solicitante egresar del legajo de origen o primario a los fines de obtener la aprobación definitiva.

En caso de baja o cambio de carrera de origen, las materias otorgadas por el mecanismo de Doble Titulación se anularán y deberán ser cursadas obligatoriamente en el legajo secundario o de destino. Únicamente, quedarán registradas en el legajo las materias de igual código y denominación que hayan sido aprobadas en el legajo primario o de origen.

No se podrá obtener el título de grado de la segunda carrera otorgada por el mecanismo de Doble Titulación, sin haber egresado de la carrera de origen.

Para acceder a la Doble Titulación, la persona solicitante deberá contar con todas las materias aprobadas desde el primero hasta el cuarto cuatrimestre del legajo de carrera de origen o primario.

Las materias que se reconozcan por el mecanismo de Doble Titulación se otorgarán de la siguiente manera:

- Materias por competencia: se otorgan de manera provisoria un bloque de materias, una vez que la persona solicitante cumplimente con las materias aprobadas del 1ro al 4to cuatrimestre aprobadas.

No podrá replicarse el reconocimiento de las materias obtenidas por competencia en ningún legajo hasta tanto egrese del legajo primario o de origen.

Este reconocimiento será registrado con calificación siete (7) en el analítico de la persona solicitante.

- Materias de igual nombre y código de identificación: se otorgan de manera definitiva en el legajo secundario o de destino. La persona aspirante solo podrá cursar en el legajo primario o de origen las materias que tengan igual nombre y código de identificación. No podrán ser cursadas en el legajo secundario o de destino, sin excepción.
- Materias Electivas: se otorgan de manera definitiva en el legajo secundario o de destino una vez que hayan sido aprobadas las materias en el legajo primario o de origen.
- Seminario Final: se otorgará de manera definitiva una vez que la persona aspirante haya egresado del legajo primario o de origen.
- Materias con distinta denominación, mismo contenido: se otorgan de manera definitiva en el legajo secundario o destino, una vez que la persona aspirante la haya aprobado en el legajo de origen o primario.
- Materias que debe cursar en el legajo secundario o de destino: la persona aspirante deberá cursar y aprobar en el legajo secundario las materias.

En caso de desistir de la carrera de origen y desear continuar con la carrera de destino de la doble titulación, se anularán las materias otorgadas por Doble Titulación, debiendo cursarlas en la carrera de destino. Solo podrán reconocerse por equivalencias simples en la carrera destino las que hayan sido cursadas y aprobadas por el alumno en la carrera de origen.

Las carreras en las que se encuentra reglamentada la Doble Titulación, pudiendo añadirse otras articulaciones que la Universidad considere adecuadas o modificarse las vigentes, son las siguientes:

| Res.N° | Carrera de Origen | Plan | Título a Obtener |
| --- | --- | --- | --- |
| 6027/2023 | Abogacía | 1999/2018/2021 | Lic. en Gestión de Recursos Humanos |
| 6028/2023 | Contador Público | 2018/2021 | Lic. en Comercialización |
| 6029/2023 | Contador Público | 2018/2021 | Lic. en Administración |
| 6030/2023 | Contador Público | 2018/2021 | Lic. en Administración Agraria |
| 6031/2023 | Lic. en Administración | 2006 | Lic. en Comercialización |
| 6032/2023 | Lic. en Administración | 2006 | Contador Público |
| 6033/2023 | Lic. en Administración | 2006 | Lic. en Comercio Internacional |
| 6034/2023 | Lic. en Administración Agraria | 2001/2006 | Lic. en Comercio Internacional |
| 6035/2023 | Lic. en Administración Agraria | 2006/2018 | Contador Público |
| 6036/2023 | Lic. en Administración Hotelera | 2006 | Lic. en Gestión Turística |
| 6037/2023 | Lic. en Comercialización | 2006 | Contador Público |
| 6038/2023 | Lic. en Comercialización | 2006/2007 | Lic. en Administración |
| 6039/2023 | Lic. en Comercialización | 2006/2007 | Lic. en Comercio Internacional |
| 6040/2023 | Lic. en Comercio Internacional | 2005/2006 | Lic. en Administración Agraria |
| 6041/2023 | Lic. en Comercio Internacional | 2006 | Lic. en Administración |
| 6042/2023 | Lic. en Comercio Internacional | 1998/2006 | Lic. en Comercialización |
| 6043/2023 | Lic. en Comercio Internacional | 2006 | Lic. en Logística Global |
| 6044/2023 | Lic. en Logística Global | 2006 | Lic. en Comercio Internacional |
| 6045/2023 | Lic. en Diseño Gráfico | 1998/2006/2007 | Lic. en Publicidad |
| 6046/2023 | Lic. en Gestión de Recursos Humanos | 1998/2006 | Lic. en Relaciones Públicas e Institucionales |
| 6047/2023 | Lic. en Gestión Turística | 2001/2006 | Lic. en Administración Hotelera |
| 6048/2023 | Lic. en Higiene, Seguridad y Medio Ambiente del Trabajo | 2015 | Lic. en Gestión Ambiental |
| 6049/2023 | Lic. en Publicidad | 2006/2007 | Lic. en Diseño Gráfico |
| 6050/2023 | Lic. en Relaciones Públicas e Institucionales | 1998/2006 | Lic. en Gestión de Recursos Humanos |
| 6051/2023 | Abogacía | 2018/2021 | Lic. en Criminología y Seguridad |
| 6052/2023 | Lic. en Gestión Ambiental | 2016/2021 | Lic. en Higiene y Seguridad en el Trabajo |
| 6053/2023 | Lic. en Diseño Industrial | 2007 | Lic. en Diseño De Indumentaria |
| 6054/2023 | Lic. en Administración | 2016/2019 | Actuario |
| 6055/2023 | Lic. en Diseño y Animación Digital | 2017 | Lic. en Diseño Gráfico |
| 6056/2023 | Contador Público | 2021 | Actuario |
| 6057/2023 | Lic. en Diseño Gráfico | 2019 | Lic. en Diseño y Animación Digital |
| 6058/2023 | Lic. en Informática | 2018/2021 | Lic. en Matemática |
| 6059/2023 | Lic. en Ciencia Política y Gobierno | 2021 | Lic. en Relaciones Internaciones |
| 6060/2023 | Lic. en Informática | 2018/2021 | Lic. en Administración de Infraestructura Tecnológica |
| 6061/2023 | Lic. en Relaciones Internacionales | 2015 | Lic. en Ciencia Política y Gobierno |
| 6062/2023 | Lic. en Seguridad Informáticas | 2021 | Lic. en Inteligencia Artificial y Robótica |
| 6063/2023 | Lic. en Informática | 2018/2021 | Lic. en Inteligencia Artificial y Robótica |
| 6064/2023 | Lic. en Inteligencia Artificial y Robótica | 2021 | Lic. en Seguridad Informática |

En caso de emitirse una nueva resolución de doble titulación, para articular carreras que hasta el momento no contemplaban tal mecanismo de reconocimiento de estudios, se podrá aplicar la misma de manera retroactiva; es decir que quienes se encontraren cursando la segunda carrera bajo el régimen de equivalencias simples, podrán solicitar el reconocimiento del tramo completo de doble titulación contemplado en la nueva resolución, sin que ello implique la modificación de las materias ya reconocidas por equivalencia simple.

- **Regulaciones anteriores**  Quienes hayan iniciado el cursado de una carrera por doble titulación, bajo una regulación anterior no vigente se regirán en todos los aspectos alcanzados por la regulación, por la Resolución que se hubiera encontrado vigente al momento de iniciar el cursado de la Doble Titulación.  Si transcurridos 18 meses, a partir de la entrada en vigencia de una nueva Resolución que regule la Doble Titulación derogando una normativa anterior, la persona solicitante se encontrare cursando, le será aplicable la nueva normativa en todos sus efectos.
- **Sobre el EFIP I y EFIP II en la Doble Titulación**  Quienes cursen una carrera por Doble titulación en Modalidad Distancia, la exigencia de rendir los exámenes integradores EFIP I y/o EFIP II estará sujeta a la normativa propia de cada carrera y modalidad.

#### 6.1.7 ARTICULACIÓN ENTRE DIFERENTES PROPUESTAS DE LA UNIVERSIDAD SIGLO 21

La Universidad tiene la potestad de definir, reglamentar y establecer articulaciones directas entre su oferta académica de Grado, Pregrado y Posgrado; pudiendo optar por el reconocimiento de tramos curriculares, materias específicas o créditos, según la correspondencia académica en cada caso.

La propuesta de articulación entre carreras de esta institución educativa, tiene como objetivo promover la formación integral de profesionales, adquiriendo éstos competencias técnicas interdisciplinarias, permitiéndole ampliar el espectro de análisis, fortaleciendo y completando su formación profesional, convirtiéndolos en profesionales altamente competitivos en el mercado laboral.

La Universidad regula las articulaciones entre diferentes carreras de su oferta académica mediante Resolución Rectoral emitida a tal efecto, a través de la cual se establecen los requisitos y condiciones de cada articulación.

En todos los casos de articulación se debe pagar una tasa por el trámite administrativo correspondiente a la gestión.

Las articulaciones que se establezcan en el marco de esta resolución deberán especificar el alcance de la misma indicando la carrera de origen y la de destino de la articulación. Se establecen:

#### a) ARTICULACIONES DE PREGRADO A GRADO

Las articulaciones desde carreras de pregrado hacia carreras de grado están orientadas a quienes hayan egresado de una tecnicatura que deseen continuar sus estudios para alcanzar un título de grado.

Para quienes hayan egresado de carreras de pregrado de la Universidad Siglo 21, el mecanismo de articulación reconocerá todas las materias comprendidas del 1º al 4º cuatrimestre en la carrera de grado.

#### b) ARTICULACIONES DE GRADO A PREGRADO

Las articulaciones desde carreras de grado hacia carreras de pregrado están orientadas a quienes que se encuentren cursando una carrera de grado y deseen obtener, un título de pregrado, como titulación preliminar.

Este mecanismo solo será aplicable a carreras de grado que no posean, según su plan de estudios aprobado, título intermedio.

Para quienes se encuentren cursando carreras de grado y no posean título intermedio, el mecanismo de articulación reconocerá todas las materias comprendidas del 1º al 4º cuatrimestre en la carrera de pregrado. Debiendo cursar las materias restantes al plan de estudio de destino.

#### CONDICIONES PARA SOLICITAR ARTICULACIÓN

#### De Pregrado a Grado

- Para articulaciones internas es condición necesaria haber egresado de una carrera de pregrado de Universidad Siglo 21.
- Para acceder al reconocimiento de estudios por articulación en la carrera de grado será condición que la persona solicitante cumpla los requisitos referentes a cada carrera definidos.
- Tener completa la documentación obligatoria de legajo según lo estipulado por Reglamento Institucional.
- Si la carrera de grado en destino que forma parte de la articulación se cursa en modalidad distancia, los deberán rendir EFIP I y II.
- Quienes opten por el mecanismo de articulación interno/externo, deberán cursar y aprobar todas las materias del 5º cuatrimestre en adelante. Eximiéndose de cursar y cumplimentar en la carrera de grado con los créditos de materias electivas.
- Tener abonado el costo arancelario vigente para el trámite de articulación, según corresponda.

#### De Grado a Pregrado

- Tener completa la documentación obligatoria de legajo según lo estipulado por Reglamento Institucional.
- Encontrarse inscripto en una carrera de grado que no cuenta con título intermedio.
- Haber aprobado, en la carrera de grado, las materias del 1º al 4º semestre requeridas para solicitar articulación con pregrado.
- Tener abonado el costo arancelario vigente para el trámite de articulación, según corresponda.
- Quienes opten por el mecanismo de articulación interno/externo, deberán cursar y aprobar todas las materias del 5º cuatrimestre.

#### ARTICULACIONES VIGENTES

| CARRERA DE ORIGEN ARTICULACIÓN | CARRERA DESTINO ARTICULACIÓN | CURSAR Y APROBAR SEMINARIOS DE ACTUALIZACIÓN | COSTO ARANCELARIO | RESOLUCIÓN RECTORAL |
| --- | --- | --- | --- | --- |
| Tecnicatura en Relaciones Laborales | Licenciatura en Gestión de Recursos Humanos | No | Si | 6388/2024 |
| Tecnicatura Universitaria en Gestión de Clima Laboral en la Organización | Licenciatura en Gestión de Recursos Humanos | No | Si | 6389/2024 |
| Tecnicatura Universitaria en Administración y Gestión de Políticas Públicas | Licenciatura en Ciencia Política y Gobierno | No | Si | 6392/2024 |
| Tecnicatura Universitaria en Administración y Gestión de Políticas Públicas | Licenciatura en Administración Pública | No | Si | 6390/2024 |
| Tecnicatura Universitaria en Gestión Administrativa de los Servicios de Salud | Licenciatura en Administración Pública | No | Si | 6391/2024 |
| Tecnicatura Universitaria en Promoción Comunitaria en Niñez y Adolescencia | Licenciatura en Psicopedagogía | No | Si | 6393/2024 |
| Tecnicatura en Gestión de Empresas Familiares | Licenciatura en Administración | No | Si | 6398/2024 |
| Tecnicatura en Gestión de Servicios de Salud | Licenciatura en Administración | No | Si | 6399/2024 |
| Tecnicatura en Gestión de Empresas Familiares | Licenciatura en Administración Agraria | No | Si | 6394/2024 |
| Tecnicatura Universitaria en Auditorías Ambientales ED/ EDH) | Licenciatura en Gestión Ambiental | No | Si | 6395/2024 |
| Tecnicatura Universitaria en Auditorías Ambientales ED/ EDH) | Licenciatura en Ambiente y Energías Renovables | No | Si | 6396/2024 |
| Tecnicatura en Gestión Contable e Impositiva | Contador Público | Si | Si | 6401/2024 |
| Tecnicatura en Administración y Gestión Tributaria | Contador Público | Si | Si | 6402/2024 |
| Tecnicatura en dirección de Protocolo, Organización de eventos | Licenciatura en Relaciones Públicas e Institucionales | No | Si | 6397/2024 |
| Tecnicatura en Higiene y Seguridad Laboral | Licenciatura en Higiene, Seguridad y Medio Ambiente | No | Si | 6400/2024 |
| Contador Público | Tecnicatura en Gestión Contable e Impositiva | No | Si | 6424/2025 |
| Abogacía | Procurador | Si | Si | 5080/2021 |
| Licenciatura en Higiene, Seguridad y Medio Ambiente | Tecnicatura en Higiene y Seguridad Laboral | No | Si | 6403/2024 |
| Procurador | Abogacía | Si | Si | 5080/2021 |

#### 6.1.8 ARTICULACIÓN CON OTRAS INSTITUCIONES

A los convenios de articulación tienen la finalidad de que estudiantes de otras instituciones externas puedan continuar sus estudios en siglo 21, ya sea para obtener una titulación complementaria o bien para alcanzar un título de grado.

A los fines de la elaboración de un convenio de reconocimiento el Vicerrectorado de Asuntos Académicos define las condiciones sobre las que se otorgan equivalencias, considerando a esos efectos, las características y prestigio de la institución de origen, contenidos y metodología de enseñanza y mecanismos de evaluación de la/s carreras que se articulen.

Todo convenio con una Institución externa deberá ser aprobado en última instancia por Rectorado mediante una resolución emitida a tal efecto, en la cual se establezcan de manera explícita los requisitos y condiciones que deberán cumplir los aspirantes.

Aprobado un convenio de articulación, las personas aspirantes de la institución de origen deben solicitar el reconocimiento a la Universidad Siglo 21, acompañando la documentación prevista en el convenio.

**Modalidad Presencial: Convenios Especiales de Articulación: Institución Cervantes (Res. Rec. 166/05, Res. Rec. 408/08 Y Res. Rec. 831/10)**

Pueden acceder a la articulación las siguientes personas:

- Quienes han aprobado, antes de iniciar el trámite, la totalidad de asignaturas correspondientes a los 3 (tres) primeros cuatrimestres y se han inscripto para el cursado del 4º cuatrimestre en la carrera de Martillero y Corredor Público de Institución Cervantes.
- Quienes han realizado el cursado de todos los cuatrimestres y sólo deban aprobarse asignaturas del 4º cuatrimestre.
- Quienes, a la fecha, son egresados de Institución Cervantes de la Carrera de Martillero y Corredor Público.

#### Proceso de Trámites para articulación:

- **Inicio del Trámite**  La persona solicitante que desea acceder a la articulación debe completar la solicitud de articulación en Institución Cervantes (IC). Una vez efectuada (cuya finalidad es corroborar que las condiciones establecidas se cumplan debidamente), debe presentar la documentación correspondiente y abonar el arancel para dar inicio del trámite de articulación, siendo dicho trámite necesario para luego gestionar su inscripción como alumno de la Universidad Siglo 21.
- **Condiciones Académicas**  La persona solicitante debe cursar la materia “Principios Fundamentales de Derechos Reales”.  La misma es dictada en 5 (cinco) encuentros presenciales, desarrollados durante el período académico en curso. Los días de cursado son los sábados en la Sede que designe la Universidad a tal efecto.
- **Evaluaciones Parciales**  La materia consta de 2 (dos) autoevaluaciones que están a disposición del alumno, a los fines de que pueda medir su rendimiento. Las mismas son de carácter optativo.
- **Evaluación Final**  Para acceder a la evaluación final de la asignatura “Principios Fundamentales de Derechos Reales”, debe tener aprobadas todas de asignaturas de la carrera en Institución Cervantes. Tal situación tiene que ser acreditada mediante la presentación de la certificación oficial correspondiente emitida por Institución Cervantes, antes de la inscripción al examen de la asignatura en cuestión.  El examen es presencial. Quienes han cumplido con un mínimo del 60% de asistencia a los encuentros presenciales, sólo rinden una instancia de examen oral, de lo contrario, la evaluación final es oral y escrita.  Las fechas de exámenes finales se fijan en el turno oficial de exámenes, publicado en el Calendario Académico.
- **Plazos para rendir la materia**  Tendrá cinco (5) turnos de examen para rendir la materia “Principios Fundamentales de Derechos Reales”, siendo el primer turno el correspondiente al año en el que cursó y regularizó la asignatura.  De no aprobar en estas cinco (5) instancias o resultar aplazado en tres oportunidades dentro de este plazo, se debe cursar la asignatura nuevamente.
- **Documentación de Legajo**  Deberá cumplimentar con la documentación obligatoria de legajo solicitada para la admisión a la carrera (ver apartado 2.2. DOCUMENTACIÓN OBLIGATORIA Y COMPLEMENTARIA DE LEGAJO) y adicionalmente deberá presentar el Certificado Analítico OFICIAL y DEFINITIVO emitido por Institución Cervantes, no siendo válido el certificado de título en trámite para dar inicio del proceso de titulación en Siglo 21.

6$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=6-1-sistema-de-equivalencias-para-todas-las-modalidades$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-7$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-7-1-regimen-de-pasantias$pea0$,
        $pea0$Régimen de pasantías$pea0$, $pea0$La pasantía, conforme a la Ley 26.427 y su reglamentación, constituye un conjunto de actividades formativas realizadas por estudiantes en organizaciones públicas o privadas. Estas actividades se vi…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=7-1-regimen-de-pasantias el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 7 | PASANTÍAS

En el presente capítulo se aborda el régimen de pasantías vigente en la Universidad.

### 7.1 RÉGIMEN DE PASANTÍAS

La pasantía, conforme a la Ley 26.427 y su reglamentación, constituye un conjunto de actividades formativas realizadas por estudiantes en organizaciones públicas o privadas. Estas actividades se vinculan con la propuesta académica de la carrera y se reconocen como experiencia pedagógica de alto valor, sin carácter obligatorio.

La implementación, control y evaluación de las pasantías corresponden a las Direcciones de Carrera y a los tutores designados en las organizaciones. Los tutores elaborarán informes de desempeño que se incorporarán al legajo del convenio individual, contemplando conocimientos adquiridos, desempeño y conducta. Asimismo, se establece un mecanismo de control conjunto entre la Universidad y la organización receptora.

Las pasantías tendrán una duración mínima de 2 (dos) meses y máxima de 12 (doce) meses, con posibilidad de renovación por hasta 6 (seis) meses adicionales, alcanzando un total de 18 (dieciocho) meses.

La carga horaria no podrá superar las 20 (veinte) horas semanales, distribuidas de lunes a viernes, con un máximo de 6 (seis) horas 30 (treinta) minutos por jornada. Excepcionalmente, podrán autorizarse actividades en fines de semana o en horario nocturno, con autorización expresa de la Secretaría de Trabajo del Ministerio de Trabajo, Empleo y Seguridad Social.

Las pasantías no constituyen relación laboral. La organización deberá otorgar al pasante:

• Asignación estímulo.

• Cobertura de salud según Ley 23.660 (Obras Sociales).

• Cobertura en el marco de la Ley 24.557 (Riesgos del Trabajo).

#### 7.2.1. REQUISITOS

Podrán acceder a pasantías quienes cumplan con las siguientes condiciones:

• Ser mayor de 18 (dieciocho) años.

• Ser estudiante regular de la Universidad.

• Cursar al menos una materia durante el semestre de la pasantía y mantener la condición de regularidad mientras dure la misma.

• En caso de tener la materia “Seminario Final” en estado regular, se podrá acceder a una pasantía por un plazo máximo de 3 (tres) meses.

#### 7.1.2. PARTICIPACIÓN

Las ofertas vigentes de pasantías se publicarán en el Portal de Empleos de la Universidad, donde los estudiantes podrán postularse. La disponibilidad dependerá de las

necesidades de las empresas, sin requerir la existencia previa de un convenio marco.

La Universidad no interviene en el proceso de selección, pero verificará que los estudiantes postulantes cumplan con los requisitos establecidos.

Los estudiantes también podrán proponer pasantías con empresas no publicadas en el portal, debiendo la organización contactarse con el área correspondiente de la Universidad para gestionar el convenio.

#### 7.1.3. OBLIGACIONES DE LA PERSONA PASANTE

Quienes accedan a pasantías deberán:

• Asistir a la primera entrevista en el horario y lugar pactado.

• Cumplir con asistencia y puntualidad.

• Presentar certificados que justifiquen inasistencias.

• Presentar renuncia con un mes de anticipación, notificando a la Universidad y a la organización.

• Informar a la Universidad cualquier irregularidad detectada en la organización.

7$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=7-1-regimen-de-pasantias$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-8$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-8-1-centros-de-excelencia$pea0$,
        $pea0$Centros de excelencia$pea0$, $pea0$Durante todo su recorrido por la Universidad, los estudiantes vivencian una experiencia de formación integral e integrada. A través de ella desarrollan competencias de emprendimiento e innovación,…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-1-centros-de-excelencia el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 8 | CENTROS DE EXCELENCIA

En el presente capítulo se abordan los centros de excelencia de la Universidad, como así también los certificados en competencias que cada estudiante puede alcanzar con el cursado de su carrera de Grado.

### 8.1 CENTROS DE EXCELENCIA

Durante todo su recorrido por la Universidad, los estudiantes vivencian una experiencia de formación integral e integrada. A través de ella desarrollan competencias de emprendimiento e innovación, sustentabilidad social e internacionalización, ejes todos del propósito institucional y que se materializa a través de las acciones que realizan los Centros de Excelencia Académica.

Entre los cuales encontramos:

- Centro de Emprendimiento e Innovación
- Centro de Sustentabilidad Social
- Centro de Internacionalización

El Centro de Emprendimiento e Innovación, promueve el desarrollo emprendedor a través de la educación emprendedora, el impulso de startups y el fortalecimiento de vínculos. Su principal objetivo es formar tanto líderes emprendedores, potenciando sus competencias de innovación, creatividad y autogestión; como también profesionales capaces de crear y desarrollar proyectos potenciales de abonar nuevas posibilidades. Se desarrollan proyectos de inspiración emprendedora dentro del Ecosistema Emprendedor Nacional; Educación Emprendedora: Programa en competencias, materias sello y Certificado Emprendedor; y Experimentación Emprendedora.

El Centro de Sustentabilidad Social, cuya misión es colaborar en la formación de líderes solidarios, responsables y sensibles a los problemas de los demás, comprometidos con el desarrollo del país y la inclusión social. Tiene por función gestionar convenios con organizaciones sociales de todo el país, coordinar la realización de prácticas solidarias y gestionar los vínculos de la universidad con organizaciones no gubernamentales para la realización de proyectos y actividades junto a ellas.

El Centro de Internacionalización, que tiene por objetivo integrar la dimensión global tanto en experiencias formativas de la universidad, planes de estudios, prácticas curriculares y extracurriculares e investigación, buscando formar líderes con conciencia y competencias globales, capaces de aprovechar las ventajas del intercambio cultural, la globalización y sus herramientas, con una noción universal de solidaridad, ética y equidad.

8$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-1-centros-de-excelencia$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-8$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 2, $pea0$rg-8-2-certificados-por-competencias$pea0$,
        $pea0$Certificados por competencias$pea0$, $pea0$La Universidad fundamenta su Modelo académico en el Aprendizaje basado en Competencias (MAC). Los Centros de Excelencia Académica ofrecen un diferencial en las carreras de grado que le permiten al…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-2-certificados-por-competencias el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 8 | CENTROS DE EXCELENCIA

### 8.2 CERTIFICADOS POR COMPETENCIAS

La Universidad fundamenta su Modelo académico en el Aprendizaje basado en Competencias (MAC). Los Centros de Excelencia Académica ofrecen un diferencial en las carreras de grado que le permiten al alumnado adquirir competencias del saber, del ser y del hacer, diseñadas por el cuerpo académico junto con líderes representantes del mundo productivo y social de la región.

Las Certificaciones en Competencias son un complemento a la carrera de grado por la que cada estudiante puede optar desde su primer año en la Universidad. Cuando la persona se gradúa, recibe además de su título de grado, la certificación por competencias que haya elegido.

Los Certificados de competencias pueden ser:

- **Certificación en Competencias de SUSTENTABILIDAD.**
- **Certificación en Competencias de INTERNACIONALIZACIÓN.**
- **Certificado en Competencias EMPRENDEDORAS.**

De acuerdo a la orientación elegida, la Certificación podrá estar compuesta de:

- Materias curriculares.
- Materias específicas obligatorias de acuerdo a la orientación elegida.
- Práctica Profesional en una organización donde pueda aplicar la orientación escogida.
- Trabajo Final de Graduación que incorpore la orientación elegida en su elaboración.
- Actividades que promuevan al alumno a vivenciar experiencias que permitan la adquisición de las competencias buscadas, de acuerdo a la orientación elegida.

#### 8.2.1 INSCRIPCIÓN A CERTIFICADOS EN COMPETENCIAS

La inscripción al Certificado en Competencias se puede realizar en el mismo momento de inscribirse a la carrera de su elección y durante cualquier momento de su cursado, pero previamente al inicio de la materia Práctica Profesional y el Seminario Final de Graduación, quedando asociado su legajo a la orientación que haya seleccionado.

Para cada carrera se podrá seleccionar un solo Certificado por Competencias. En caso de que la persona se encuentre cursando dos carreras que no guarden relación entre sí, entonces sí podrá tener diferentes certificados en cada carrera.

En caso de que el Certificado por competencias ya no resulte de su interés, la persona cursante tendrá la opción de solicitar la baja de su inscripción en cualquier momento durante el avance de su carrera.

**Nota importante:** Quedan excluidas de los Certificados en Competencias las carreras que se cursan por Doble titulación y los Ciclos de Complementación Curricular ya que no incluyen en la currícula todas las materias que integran los certificados.

#### 8.2.2 CAMBIO DE CERTIFICADO

Los cambios de Certificado podrán realizarse únicamente durante el período de inscripción a materias y siempre que no se haya inscripto, esté cursando o haya aprobado Práctica Profesional y Seminario Final de Graduación, en cuyo caso ya no podrá optar por cambio de orientación.

Si al momento de cambio de Certificado la persona solicitante ya aprobó materias específicas asociadas a su Certificado actual, las mismas quedarán registradas como tal en su Certificado analítico, pero deberá cursar y aprobar las nuevas materias específicas que incluya el nuevo certificado al que se inscribe.

Nota: El otorgamiento de equivalencias de materias que integran los certificados se realiza de acuerdo a la política institucional de equivalencias que se encuentre vigente.

#### 8.2.3 CONDICIÓN DE CERTIFICACIÓN

Es condición necesaria para obtener el “Certificado en Competencias” que la persona cursante obtenga previamente su Título de Grado y que cumpla con todos los requisitos exigidos para completar el Certificado. Si egresa de su carrera de Grado sin haber completado el Certificado, perderá la posibilidad de obtener el Diploma por Competencias.

8$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-2-certificados-por-competencias$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-8$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 3, $pea0$rg-8-3-comunidadnet$pea0$,
        $pea0$ComunidadNET$pea0$, $pea0$ComunidadNET es un espacio de intercambio para que miembros de la Universidad Siglo 21 se vinculen entre sí. Desde cualquier lugar del país y del mundo pueden conectar con otras personas para fomen…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-3-comunidadnet el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 8 | CENTROS DE EXCELENCIA

### 8.3 COMUNIDADNET

ComunidadNET es un espacio de intercambio para que miembros de la Universidad Siglo 21 se vinculen entre sí. Desde cualquier lugar del país y del mundo pueden conectar con otras personas para fomentar el networking, compartir intereses e ideas, formar equipos y desarrollar proyectos innovadores. De esta manera, seguimos construyendo ecosistemas de bienestar para que cada persona se enfoque en su propósito personal, se transforme en líder y así, transforme al mundo.

Un espacio para que cada estudiante potencie su experiencia de aprendizaje, con 10 comunidades que se nutren y transforman de acuerdo al uso que le dan sus miembros.

Las comunidades de las que pueden formar parte son:

- GlobalesNET: enfocada en el desarrollo de proyectos globales con mirada internacional. Un espacio de vinculación “sin fronteras” con personas alrededor del mundo
- ProtagonistasNET: espacio de encuentro para referentes que tiene el objetivo de generar experiencias de mentoreo, cooperación y la creación de acciones de impacto.
- PartnersNET: en esta comunidad pueden participar aquellas personas que necesiten formar equipos para el desarrollo de proyectos estudiantiles iniciativas profesionales o actividades deportivas y culturales.
- EmbajadoresNET: líderes y personas egresadas de diversos sectores trabajarán juntos/as en proyectos y oportunidades que propongan mejoras en las regiones de nuestro país y el mundo. Un espacio de actualización profesional y vinculación empresarial y social.
- InnovadoresNET: un lugar de encuentro para personas innovadoras que quieren desarrollar proyectos de triple impacto.
- Saber+NET: esta comunidad está enfocada en el intercambio intelectual y la generación de propuestas transformadoras entre docentes, investigadores/as, adscriptos/as, etc.
- Voluntarios21: una comunidad pensada y diseñada para estudiantes y personas egresadas que les interesa o participan en actividades de voluntariado.
- Club de Emprendedores: una comunidad pensada para dejar volar tus ideas y proyectos, expandir y desarrollar habilitades en emprendedurismo en conjunto con estudiantes y personas egresadas emprendedoras.
- Comunidad E-sport: espacio para divertirte con juegos y deportes virtuales.
- English talk: comunidad ideal para practicar conversar en inglés y enterarte de todas las novedades de internacionalización.

8$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-3-comunidadnet$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-8$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 4, $pea0$rg-8-4-arbol-de-la-convivencia$pea0$,
        $pea0$Árbol de la convivencia$pea0$, $pea0$Espacio pensado para que estudiantes referentes de cada provincia participen de una actividad conjunta de plantar simbólicamente un árbol como símbolo que nuclea y simboliza los valores fundamental…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-4-arbol-de-la-convivencia el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 8 | CENTROS DE EXCELENCIA

### 8.4 ÁRBOL DE LA CONVIVENCIA

Espacio pensado para que estudiantes referentes de cada provincia participen de una actividad conjunta de plantar simbólicamente un árbol como símbolo que nuclea y simboliza los valores fundamentales de esta Casa de Altos Estudios que representan la identidad democrática, inclusiva, federal y nacional.

El árbol que se cultiva representa el mayor aporte que la comunidad educativa puede hacer para reafirmar la importancia de CON vivir, Vivir en COMPAÑÍA DE OTRO, al lado de otro, contemplándolo, respetándolo, observándolo, reconociéndolo, habilitando genuina y verdaderamente a capacidad de escucha. Convirtiéndose esta figura en un verdadero símbolo de Comunidad, donde las personas pueden vivir de manera pacífica y respetuosa en un mismo espacio, con objetivos comunes.

#### 8.4.1 PARTICIPANTES

La selección de las personas participantes estará a cargo de la Dirección de Centros de Apoyo y Sedes, quienes arbitrará los medios necesarios para su concreción, realizando una convocatoria anual para que el alumnado pueda postularse.

La selección definitiva de los participantes será tomada de forma conjunta por el Vicerrectorado de Asuntos Académicos, Vicerrectorado de Gestión Institucional, Dirección de Marketing y Centros de Apoyo y Sedes.

**Requisitos:**

- Ser estudiante activo de una carrera de Grado, por un período mínimos de 2 (dos) años calendarios, presentando un rendimiento académico con un promedio igual o superior a 7 (siete) puntos.
- No registrar sanciones disciplinarias
- No haber sido seleccionado en ediciones anteriores
- Contar con disponibilidad para viajar dentro del territorio nacional
- En relación a su actividad extracurricular, la persona postulante debe presentar un marcado perfil orientado al compromiso social, destacarse en su actividad laboral y/o deportiva, teniendo un espíritu emprendedor.

8$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-4-arbol-de-la-convivencia$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-8$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 5, $pea0$rg-8-5-destacados-21$pea0$,
        $pea0$Destacados 21$pea0$, $pea0$Destacados 21 nace con la finalidad de galardonar a estudiantes comprometidos, con cualidades innovadoras y representativas de los valores que definen a Siglo 21 como una Universidad laica, inclusi…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-5-destacados-21 el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 8 | CENTROS DE EXCELENCIA

### 8.5 DESTACADOS 21

Destacados 21 nace con la finalidad de galardonar a estudiantes comprometidos, con cualidades innovadoras y representativas de los valores que definen a Siglo 21 como una Universidad laica, inclusiva, trascendente y democrática que forma, capacita y desarrolla profesionales y líderes con compromiso social, mirada global y espíritu emprendedor, capaces de trabajar para el desarrollo de sus comunidades en pos de alcanzar una sociedad más prospera.

Podrán participar de este certamen quienes:

- Sean estudiantes matriculados de alguna Carrera de Grado, en cualquiera de las Modalidades de Estudio y sedes de la Universidad Empresarial Siglo 21. No se contemplan los alumnos de las carreras que son Ciclo de Complementación Curricular.
- Hayan completado al menos 4 semestres de cursado y tengan 20 materias aprobadas en la Universidad Siglo 21 (sin contar equivalencias de otras Universidades).
- Que tengan un promedio igual o mayor a 8 (con aplazos).
- Podrán postularse quienes hayan participado en ediciones anteriores -inclusive aquellos que recibieron menciones especiales- excepto que hayan recibido el premio de Estudiante Destacado.

8$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=8-5-destacados-21$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$reglamento$pea0$), (select id from public.articulos where slug = $pea0$rg-capitulo-9$pea0$ and categoria_id = (select id from public.categorias where slug = $pea0$reglamento$pea0$)), 1, $pea0$rg-9-1-sistema-de-ayundatia-de-alumnos-y-adscripcion$pea0$,
        $pea0$Sistema de ayudantía de alumnos y adscripción$pea0$, $pea0$El objetivo principal de este sistema es promover la formación de futuros docentes e investigadores universitarios, a través de la incorporación de las personas interesadas a una cátedra o a un pro…$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=9-1-sistema-de-ayundatia-de-alumnos-y-adscripcion el 2026-11-08. Revisalo antes de publicar.

## CAPÍTULO 9 | SISTEMA DE AYUDANTÍA DE ALUMNOS Y ADSCRIPCIÓN

En el presente capítulo se aborda el Sistema de Ayudantías que los estudiantes pueden realizar para complementar el cursado de su carrera, como así también el de adscripción una vez que hayan finalizado sus estudios.

### 9.1 SISTEMA DE AYUDANTÍA DE ALUMNOS Y ADSCRIPCIÓN

El objetivo principal de este sistema es promover la formación de futuros docentes e investigadores universitarios, a través de la incorporación de las personas interesadas a una cátedra o a un proyecto de investigación. Al tratarse de actividades formativas facilitadas por la Universidad, su desempeño es ad honorem.

Quienes se desempeñen en el rol de Ayudante Alumno o el de Adscripción son orientados y supervisados por el cuerpo docente o investigador a cuyo cargo está. El mismo contribuye a la formación mediante la transmisión de conocimientos de la materia, técnicas de investigación y experiencias útiles. El Vicerrectorado de Asuntos Académicos, conjuntamente con la Secretaría de Gestión y Evaluación Académica (SGEA) y las Direcciones de las Carreras, se encargan de programar, además, actividades tendientes a complementar dicha formación.

Las personas aspirantes a incorporarse como Ayudantes Alumnos o Adscriptos deberán solicitarlo por escrito a la Secretaría de Gestión y Evaluación Académica (SGEA), acompañando a la solicitud la nómina de sus antecedentes docentes y académicos y los comprobantes que lo justifiquen (CV, Título, DNI y antecedentes).

Recibida la solicitud, la misma se define valorándose los antecedentes presentados y, especialmente, el promedio general, la nota obtenida en la materia a la que se pretende acceder y aquellos antecedentes que demuestren la inclinación por la docencia o la investigación.

En la primera quincena de diciembre de cada año el cuerpo docente o investigador a cargo del Ayudante Alumno o Adscripto debe presentar un informe pormenorizado sobre el cumplimiento de las obligaciones previstas en la Resolución de referencia, las actividades realizadas, el trabajo presentado y su comportamiento general, evaluando en conjunto esas actividades como "deficientes", "suficientes", "buenas", "muy buenas" o "excelentes".

SGEA y las Direcciones de las Carreras informan durante el mismo período sobre las actividades programadas y, cuando las circunstancias así lo aconsejen, sobre la actividad individual de alguno o algunos de los participantes.

En la última quincena de cada año, los Ayudantes Alumnos y los Adscriptos deben presentar un trabajo sobre un tema de interés relacionado con la materia o el proyecto de investigación. En los informes elaborados por SGEA y los directores pueden destacarse el especial valor científico o pedagógico de los trabajos presentados y aconsejarse la publicación de los mismos por la Universidad.

#### A) AYUDANTES ALUMNOS

Pueden acceder a esta categoría los estudiantes que cursan en esta Universidad la carrera vinculada a: la materia elegida o al proyecto de investigación al que pretenden incorporarse, según corresponda.

Excepcionalmente, pueden hacerlo los estudiantes de otras carreras en tanto éstas estén íntimamente relacionadas con la materia o se trate de proyectos multidisciplinarios.

SGEA decide anualmente sobre la continuidad de los Ayudantes Alumnos de sus respectivas áreas, según los informes correspondientes (Artículo 7, Res. C.S. 700/2019). Cuando el Ayudante Alumno ha completado las obligaciones previstas, cualquiera fuera la resolución que se adopte sobre su continuidad, se le otorga un certificado que acredita las tareas cumplidas y la calificación que las mismas merecen.

#### AYUDANTES ALUMNOS DE DOCENCIA: OBLIGACIONES

#### Modalidad Presencial

- Asistir al 80% de las clases en la materia elegida, programadas en el calendario académico.
- Aprobar el módulo de formación para Ayudantes Alumnos en Docencia y cumplir con el 80% de asistencia
- Guardar estricta confidencialidad de los datos y de toda situación vinculada al desarrollo de la ayudantía de alumnos.

#### Modalidad Distancia

- Cumplir con las actividades previstas por el docente.
- Efectuar el seguimiento de las actividades de aprendizaje, comunicaciones y rendimiento en el Sistema de Aprendizaje Multimedial.
- Realizar tres propuestas de intervención en foro
- Seleccionar una publicación, video, paper, artículo de actualidad, etc. vinculado a la materia, que pueda ser trabajado con estudiantes, previa validación.
- Aprobar el módulo de formación para Ayudantes Alumnos en Docencia y cumplir con el 80% de asistencia
- Guardar estricta confidencialidad de los datos y de toda situación vinculada al desarrollo de la ayudantía de alumnos.

#### AYUDANTES ALUMNOS DE INVESTIGACIÓN: OBLIGACIONES

El docente investigador a cargo de la dirección del proyecto de investigación, si aconseja admitir la incorporación del estudiante, de acuerdo al informe previsto en el Artículo 17 de la Res. C.S. 700/2019, debe especificar las tareas que dicho estudiante debe cumplir, indicando de qué forma contribuye a su formación.

La Secretaría de Investigación, al evaluar el dictamen indicado, y en oportunidad de efectuar el seguimiento del proyecto, tiene especialmente en cuenta la contribución a la formación del estudiante en técnicas de investigación que pueden resultar de las tareas propuestas.

Quienes se desempeñen como Ayudante Alumnos en Investigación, deberán:

- Cumplir con el 80% de asistencia (presencial/remota) a las tareas establecidas por la Dirección de la Investigación.
- Aprobar el módulo de formación para Ayudantes Alumnos en Investigación y cumplir con el 80% de asistencia.
- Guardar estricta confidencialidad de los datos y de toda situación vinculada al desarrollo de la ayudantía de alumnos.

Podrán solicitar los créditos académicos quienes hayan participado en un proyecto de investigación como ayudante durante el plazo de un año, pudiendo ser en períodos consecutivos o no consecutivos.

#### 9.1.2 ADSCRIPTOS

Pueden incorporarse como Adscriptos, todas aquellas personas egresadas de una universidad del país o del extranjero con un título equivalente o superior que el que se otorga en la carrera a la que pertenece la materia a la que se adscribe, o se relaciona con la temática del proyecto de investigación al que se incorpora.

Excepcionalmente puede admitirse la adscripción cuando se trata de una carrera distinta, si esta se relaciona íntimamente con la materia a la que se adscribe o el proyecto de investigación es de carácter multidisciplinario.

Recibida la solicitud en las condiciones previstas en el Artículo 29º de la Res. C.S. 700/2019, la misma es resuelta por la Secretaría de Gestión y Evaluación Académica, el Centro de Egresados y Empleabilidad y la Dirección de la Carrera.

Cumplidas las actividades previstas, el Vicerrectorado de Asuntos Académicos dicta una resolución aprobatoria de la Adscripción y entrega al alumno adscripto copia de la misma y un certificado que acredita todas las actividades realizadas por el mismo. Sin perjuicio de ello, la universidad otorga al Adscripto, a su pedido, certificación de las tareas realizadas y copia de los dictámenes producidos.

La adscripción cumplida es considerada, especialmente, entre los antecedentes en los concursos celebrados en esta Universidad y como pauta para designaciones interinas o suplencias.

#### ADSCRIPTOS DE DOCENCIA: OBLIGACIONES

- Asistir al 80% de las clases en la materia elegida, programadas en el calendario académico.
- Aprobar el módulo de formación para Adscriptos en Docencia y cumplir con el 80% de asistencia
- Desarrollar una clase bajo supervisión docente
- Participar de las instancias de evaluación, bajo supervisión docente.

- Cumplir con las actividades previstas por el docente.
- Efectuar el seguimiento de las actividades de aprendizaje, comunicaciones y rendimiento en el Sistema de Aprendizaje Multimedial.
- Realizar seis propuestas de intervención en foro.
- Seleccionar una publicación, video, paper, artículo de actualidad, etc. vinculado a la materia, que pueda ser trabajado con estudiantes, previa validación.
- Diseñar y coordinar 1 (una) actividad de encuentro virtual con estudiantes, bajo supervisión docente, como espacio para ejercitar la aplicación práctica de ciertos contenidos y el entrenamiento de capacidad de argumentación disciplinar.
- Aprobar el módulo de formación para Adscriptos Alumnos en Docencia y cumplir con el 80% de asistencia.
- Guardar estricta confidencialidad de los datos y de toda situación vinculada al desarrollo de la ayudantía de alumnos,

#### 9.1.3 DE LOS ADSCRIPTOS DE INVESTIGACIÓN: OBLIGACIONES

La Dirección del Proyecto que aconseja admitir la incorporación del egresado, debe especificar las tareas que el mismo cumplirá en la ejecución del proyecto, indicando de qué forma las mismas contribuyen a su formación.

Quienes se desempeñen como Adscriptos en Investigación, cualquiera sea su modalidad de cursado, deberán:

- Cumplir con el 80% de asistencia (presencial/remota) a las tareas establecidas por la Dirección de la Investigación.
- Aprobar el módulo de formación para Adscriptos en Investigación y cumplir con el 80% de asistencia.
- Participar en la elaboración de una publicación/documento de divulgación en el marco del Proyecto de Investigación.
- Guardar estricta confidencialidad de los datos y de toda situación vinculada al desarrollo de la ayudantía de alumnos.

9$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=9-1-sistema-de-ayundatia-de-alumnos-y-adscripcion$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-actividades-disciplinares$pea0$,
        $pea0$Actividades disciplinares$pea0$, $pea0$Actividades Disciplinares$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/actividades-disciplinares el 2026-11-08. Revisalo antes de publicar.

Actividades Disciplinares

Llevá tu conocimiento al siguiente nivel

Profundizá tu formación en tu área disciplinar a través de talleres, masterclass y experiencias prácticas diseñadas para potenciar tus habilidades.

Accedé a propuestas que combinan teoría y práctica, donde vas a poder aplicar lo aprendido, trabajar en equipo y desarrollar competencias clave para tu futuro profesional.

Desde espacios creativos hasta instancias técnicas y profesionales, estas actividades te permiten especializarte, explorar nuevos enfoques y sumar valor a tu perfil.

POTENCIÁ TU PERFIL

ACADÉMICO Y PROFESIONAL

Explorá el espacio de Experiencias 21 y descubrí actividades cocurriculares para tu carrera.

Ingresá al Portal de Recomendaciones para conocer cada propuesta y realizá tu inscripción.

Especial

Explorá los Talleres Disponibles

Accedé a talleres diseñados para potenciar tu desarrollo académico y profesional. Filtrá tu carrera y encontrá las oportunidades disponibles para vos.

### SUSCRIBITE

### AL NEWSLETTER

### ¡Sumate a Experiencias 21!

### Enterate antes que nadie de todas las experiencias, actividades y novedades.

 Recibí contenido exclusivo y mantenete al día con todo lo que pasa en Experiencias 21.

SUSCRIBITE ACÁ$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/actividades-disciplinares$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$plataformas$pea0$), null, 0, $pea0$ln-app-siglo-21$pea0$,
        $pea0$APP SIGLO 21 | La Nube 21$pea0$, $pea0$Te damos la bienvenida a la APP Siglo 21.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/app-siglo-21 el 2026-11-08. Revisalo antes de publicar.

#### APP 
SIGLO 21

Te damos la bienvenida a la APP Siglo 21.

Encontrá toda la información que necesitas para aprovechar al máximo tu experiencia universitaria.

Inicio

Logueate

Pantalla Principal

Asistencia

Otras Funciones

Ingresá a la tienda de tu celular y descargá nuestra APP.

#### INICIO

Una vez que abras la APP en tu celular, te van a aparecer estas 4 pantallas.

Primero deberás leer y aceptar los términos y condiciones de la APP.

Luego tendrás 3 pantallas introductorias, que podrás saltar o ir pasando desde el botón Siguiente.

#### LOGUEATE

Ingresá con tus datos de Portal Estudiantes.

Si olvidaste tu contraseña, podes resetearla desde el botón "¿Olvidaste tu contraseña?"

#### PANTALLA PRINCIPAL

#### Tu Legajo

Accedé a los datos de tu cuenta

Registrá tu Asistencia

Consultá tus diferentes Legajos. Si estudias varias carreras, podes ver la info de cada una de ellas.

Revisá tu historial de materias cursadas y aprobadas

Revisá los eventos que tenes programados en tu agenda, clases, horarios y exámenes.

Revisá las todas tus calificaciones

Comunicate con Nosotros

Revisá tus inscripciones a exámenes

Accedé al menú con más opciones

Ingresá a Pago electrónico

#### REGISTRA TU ASISTENCIA

PASO 1

Ingresá al ícono del QR en la parte superior de la pantalla

PASO 2

La primera vez que uses la APP, deberás dar permiso para escanear el QR con la cámara de tu celular.

PASO 3

Escanea el QR que te muestre el profe.

#### OTRAS FUNCIONES

Manejá todo desde tu celu

Revisá la tipología de tus materias

Inscribite a tus exámenes

Inscribite a tus materias

Conocé las novedades$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/app-siglo-21$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$oferta-academica$pea0$), null, 0, $pea0$ln-aprendizaje-para-la-vida$pea0$,
        $pea0$Aprendizaje para la Vida (APLV)$pea0$, $pea0$​​$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/aprendizaje-para-la-vida el 2026-11-08. Revisalo antes de publicar.

#### APLV: Programas de Aprendizaje para la Vida

​​

Estos programas brindan habilidades prácticas y formación continua a través de cursos, certificados y diplomaturas abiertos a todos, sin requisitos previos.

En esta sección encontrarás información sobre requisitos, plan de estudios y beneficios para potenciar tu desarrollo profesional.

¡Explorá cómo APLV

puede ayudarte a alcanzar tus metas!

Programas APLV​

Pre21

Calendario académico​

Documentación

#### Consultá sobre algunos de nuestros programas:

Descubrí propuestas formativas diseñadas para potenciar tus habilidades y ampliar tus oportunidades profesionales.

Diplomatura en Liderazgo Coach

Certificado

en Mindfulness

Certificado en Kinefisiatría Vascular

Diplomatura en Innovación Educativa

Workshop

de Negociación

#### Otros Programas de Aprendizaje para la Vida

#### Accedé a una variedad de cursos virtuales diseñados para potenciar tus habilidades y tu crecimiento personal.

Ingresá acá

#### Pre21

Pre 21 es una propuesta de formación virtual que ofrece herramientas y contenidos clave para impulsar tu desarrollo académico y personal.

Curso Data Science

​​

Curso Liderazgo y Negocios​

Curso Marketing Digital

Curso Innovación y Tendencias Globales

Curso Ser Universitario Hoy​

#### Calendario académico

## Conocé tu
Calendario de APLV

Ingresá acá

#### ¿Qué documentación debo presentar?

#### Fotocopia frente y dorso de DNI actualizado

Debes presentar la fotocopia del frente y dorso de tu DNI.

#### ¿Cómo cargar la documentación?

Para cargar tu documentación de legajo deberás utilizar la plataforma Digital Admin.

#### ¡Conocé los pasos para hacerlo!

#### 1- Creá tu cuenta

#### Ingresar a Digital Admin y creá tu cuenta de usuario completando todos los campos de la derecha.

Ingresá a Digital Admin

En caso de que tengas un usuario y no recuerdes la contraseña, podrás clickear en “Olvidé mi contraseña” y recibirás un acceso al correo electrónico asociado para poder reestablecerla.

#### 2- Ingresá a archivos de legajo

En la barra superior vas a ver una pestaña llamada “Archivos de legajo”. Ingresá allí para poder cargar tu documentación de legajo.

#### 3- Cargá tu documentación

Cargá la documentación de legajo solicitada. Debes adjuntar una copia legible de la primera y segunda hoja del DNI en formato PDF.

#### Preguntas Frecuentes

#### ¿Cuáles son los datos de acceso?

Los datos de accesos se te compartirán por correo al iniciar tu cursado.

#### ¿Cuándo comienzo el cursado?

Para consultar el inicio de tu programa APLV hacé [clic acá](https://www.lanube.21.edu.ar/aprendizaje-para-la-vida).

#### ¿Cuáles son los canales de contacto disponibles?

Ante cualquier consulta relacionada con los Programas de Aprendizaje para la Vida (APLV), podes comunicarte con con [posgrado@soysiglo.edu.ar](mailto:posgrado@soysiglo.edu.ar)

#### Ingresá a E-book 21 y accedé a material bibliográfico

#### ¿Es la primera vez que intentas ingresar a E-book?

Si estás intentando ingresar por primera vez, deberás completar un formulario con tus datos para que se active tu cuenta

Accedé al formulario

Recibirás tus datos de ingreso dentro de las próximas 72hs hábiles.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/aprendizaje-para-la-vida$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-arte-y-cultura$pea0$,
        $pea0$Arte y cultura$pea0$, $pea0$Arte y Cultura$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/arte-y-cultura el 2026-11-08. Revisalo antes de publicar.

Arte y Cultura

Potenciá tu desarrollo

Expresate, explorá y conectá con nuevas formas de ver el mundo. En este espacio encontrás propuestas que impulsan la creatividad y el intercambio cultural en la vida universitaria.

Sumate a experiencias para crear, inspirarte y compartir, mientras ampliás tu mirada y enriquecés tu recorrido académico desde lo artístico.

POTENCIÁ TU PERFIL

ACADÉMICO Y PROFESIONAL

Explorá el espacio de Experiencias 21 y descubrí actividades cocurriculares para tu carrera.

Ingresá al Portal de Recomendaciones para conocer cada propuesta y realizá tu inscripción.

Especial

Explorá nuestros Talleres

Sumá nuevas herramientas a tu formación con talleres diseñados para potenciar tu desarrollo académico y profesional.

### SUSCRIBITE

### AL NEWSLETTER

### ¡Sumate a Experiencias 21!

### Enterate antes que nadie de todas las experiencias, actividades y novedades.

 Recibí contenido exclusivo y mantenete al día con todo lo que pasa en Experiencias 21.

SUSCRIBITE ACÁ$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/arte-y-cultura$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$plataformas$pea0$), null, 0, $pea0$ln-aula-virtual$pea0$,
        $pea0$Aula Virtual Canvas | La Nube 21$pea0$, $pea0$Bienvenido a tu Aula Virtual, CANVAS. Descubrí cómo acceder a tus materias, contactarte con tu docente o presentar tus actividades.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/aula-virtual el 2026-11-08. Revisalo antes de publicar.

#### Aula Virtual (CANVAS)

Bienvenido a tu Aula Virtual, CANVAS. Descubrí cómo acceder a tus materias, contactarte con tu docente o presentar tus actividades.

¿Cómo Ingresar al Aula Virtual?

Recorramos tu Aula Virtual

Comunicarse con el profesor

Actividades en la plataforma

#### ¿Cómo ingresar a tu Aula Virtual (Canvas)?

Para ingresar al Aula Virtual (CANVAS). Podés hacerlo desde el siguiente enlace:

Accedé a CANVAS

#### 1.

Selecciona tu Perfil.

- Una vez que ingreses a la página de inicio, vas a ver dos perfiles: “Soy Estudiante” y “Soy Docente”.
- ​Hacé clic en “Soy Estudiante” para continuar.

#### 2.

Iniciá sesión con tu cuenta institucional.

- Se abrirá una nueva ventana donde deberás ingresar tus datos de acceso.

- En el campo de usuario, escribí tu dirección de correo institucional:

[N.USUARIO@soysiglo.21.edu.ar](mailto:N.USUARIO@soysiglo.21.edu.ar)

- Luego hacé clic en el botón “Siguiente”.

[N.USUARIO@soysiglo.21.edu.ar](mailto:N.USUARIO@soysiglo.21.edu.ar) ​​

- Escribí tu contraseña y presioná “Iniciar sesión” para acceder a tu aula virtual.

​​​

#### ¿Qué pasa si no recuerdo mi contraseña para ingresar?

Si no recordás tu contraseña, hacé clic en el enlace que dice

“Si no conoces o si olvidaste tu contraseña, podés restablecerla desde aquí”. Se abrirá una nueva pestaña para recuperarla.

- O directamente ingresando al siguiente link:

Recuperá tu clave acá

Ingresá tu usuario institucional.

- En el campo de texto, escribí tu usuario sin el @soysiglo.21.edu.ar

Ejemplo: si tu correo es N.USUARIO@soysiglo.21.edu.ar

Ingresá: N.USUARIO

- Luego hacé clic en “Siguiente”.

​N.USUARIO

#### 3.

Confirmá tu correo de recuperación.

- El correo de recuperación es tu mail personal registrado en tu Portal de Estudiantes.

- Si es correcta, hacé clic en “Enviar contraseña”.

mailpersonal@xxxxxxxxxx

#### 4.

Revisá tu mail.

- Vas a recibir un correo con instrucciones para generar una nueva contraseña. Seguí el enlace, creá una nueva clave segura, ¡y listo!

#### Un recorrido por tu Aula Virtual (CANVAS)

Al ingresar, verás un menú en el margen izquierdo. Cada ícono te lleva a una sección distinta del Aula Virtual (CANVAS). ¡Te contamos para qué sirve cada uno!

MENU

CUENTA​​​​

Acá accedés a tu perfil personal​​​

[VER MÁS ACÁ](https://www.lanube.21.edu.ar/aula-virtual)

- ​Cambiar tu foto de perfil.
- Modificar tu correo electrónico.
- Descargar los contenidos de los cursos.
- ​Activá una interfaz de alto contraste para mejorar la accesibilidad visual.

TABLERO

Acá ves tus materias activas

[VER MÁS ACÁ](https://www.lanube.21.edu.ar/aula-virtual)

- Visualizás tus materias activas.
- ​Lista de tareas por hacer.
- Cantidad de tareas pendientes.
- Calificaciones recientes.

CALENDARIO

Podés organizar tus entregas

[VER MÁS ACÁ](https://www.lanube.21.edu.ar/aula-virtual)

- Visualizá actividades por mes, semana o agenda.
- Vencimiento de Trabajos Prácticos.
- Fecha de Parciales y Finales.
- Clases sincrónicas programadas.

BANDEJA DE ENTRADA

Mensajería

- ​Podés comunicarte con docentes y tutores.
- Adjuntá archivos , grabá audios o envía vídeos.

[VER MÁS ACÁ](https://www.lanube.21.edu.ar/aula-virtual)

HISTORIAL

Consultas recientes

- La sección Historial en tu Aula Virtual muestra un registro cronológico de las acciones que realizaste dentro de la plataforma.

AYUDA

Accedé al

soporte

- Encontras respuestas a preguntas frecuentes.
- Guía de Canvas.

#### CUENTA

NOMBRE DE ALUMNO/A

Al hacer clic en el ícono Cuenta, se despliega un menú con accesos a configuraciones y datos personales. A continuación, te explicamos para qué sirve cada ítem:

- Notificaciones
- Perfil
- Archivos
- Configuraciones
- Portafolios electrónicos
- Anuncios globales

IU de contraste alto: Activa una versión de alto contraste del sitio para facilitar la visualización a personas con dificultades visuales o en entornos con poca luz.

#### NOTIFICACIONES

En esta sección, podés personalizar cómo y cuándo recibir notificaciones sobre lo que pasa en tus cursos.

- ¿Qué podés configurar?

1. Tipo de notificación

Podés elegir recibir:

🔔 Notificación inmediata: apenas ocurre el evento.

🗓️ Resumen diario: una vez al día (alrededor de las 18:00 h).

📅 Resumen semanal: una vez por semana (los sábados entre las 22:00 y 0:00).

🚫 Desactivado: no recibir notificación.

2. Categorías que podés configurar

Organizadas por tema, incluyen:

​​

- Actividades del curso.
- Foros de discusión.
- Mensajería.
- Planificación.
- Grupos y Conferencias.
- Alertas.

- Importante

- Los cambios aplican a todos los cursos, a menos que los modifiques desde dentro de un curso específico (esas configuraciones individuales tienen prioridad).
- Asegurate de tener el mail correcto registrado.
- ¡Podés cambiar esto cuantas veces quieras!

#### PERFIL

Esta sección te permite personalizar tu identidad digital dentro de Canvas. Es útil para que tus docentes y compañeros te reconozcan y conozcan un poco más de vos.​

- ¿Qué podés hacer en esta sección?

1. Agregar o cambiar tu imagen de perfil

- Hacé clic en "Editar imagen de perfil" para subir una foto tuya o un avatar que te represente.

2. Editar tu información personal

Hacé clic en "Editar el perfil" y podrás completar:

- Contacto: Podés agregarlos en la pestaña de Configuraciones. Por ejemplo: correo, Google Drive, etc.
- Biografía: Escribí una breve descripción sobre vos. Podés contar qué estudiás, tus intereses, habilidades, etc.
- Enlaces: Agregá links útiles, como tu portafolio personal, redes académicas, blog, etc.

#### ARCHIVOS

En esta sección vas a encontrar todos los archivos que subiste o que están relacionados con tus cursos, organizados automáticamente por carpetas.

#### CONFIGURACIONES

Permite cambiar idioma y zona horaria. También podés vincular servicios externos como Google Drive, Skype o Diigo, y administrar tus tokens de acceso.

En esta sección vas a encontrar opciones claves

1. Descargar los contenidos del curso

Esta herramienta te permite guardar todos los contenidos de tus materias para acceder sin conexión.

Incluye materiales como:

- Archivos PDF
- Páginas
- Tareas
- Foros de discusión
- Exámenes

Haciendo clic en "Generar publicación electrónica", descargás un archivo compatible con lectores ePub, ideal para estudiar desde cualquier lugar, sin necesidad de conexión a internet.

#### PORTAFOLIOS ELECTRONICOS

Los portafolios electrónicos son un lugar donde se pueden mostrar y discutir las presentaciones significativas y experiencias que están sucediendo durante su proceso de aprendizaje.

#### ANUNCIOS GLOBALES

Listado de comunicaciones institucionales visibles para todos los usuarios.

#### TABLERO

Al ingresar en tu Tablero, vas a poder ver todas las materias activas, y también:

- Las tarjetas de cada materia en el que estás inscripto.
- Información del periodo académico.
- Accesos directos a tareas próximas y contenido relevante en la columna “Por hacer”.
- Notificaciones y entregas destacadas a la derecha.

Además, en el lateral derecho encontrarás:

Lista de tareas por hacer:

- Avisos recientes del curso.
- Enlaces a clases, materiales o entregas.
- Calificaciones recientes. Este espacio es clave para organizarte y tener una vista rápida de tu cursado.

#### ¿Cómo recorrer una materia?

Al ingresar en tu Tablero, vas a poder ver todas las materias activas. Aquí vas a encontrar:

PROGRAMA: Detalle de los contenidos de cada módulo. Cita la Bibliografía a utilizar en la materia y los recursos permitidos para rendir.

FOROS: Para el trabajo colaborativo y de comunicación con tus compañeros.

ANUNCIOS: Alertan información clave como el vencimiento de las actividades.

CALIFICACIONES: Podrás visualizar las notas de las actividades.

PARA INGRESAR AL CONTENIDO

DE TU MATERIA HACÉ CLICK EN COMENZAR

Al hacer click en Comenzar, vas a ingresar a los distintos módulos de tu materia. En el costado superior izquierdo, vas a poder ver en qué módulo y materia estás.

LECTURAS: Cada materia posee 4 lecturas interactivas para complementar la bibliografía básica.

En algunos casos contas con audio-lecturas para facilitar tu estudio.

ACTIVIDAD PRÁCTICA: Son actividades auto-evaluativas (sin nota), para que verifiques cómo vas con el estudio.

TRABAJOS PRÁCTICOS: Integra los contenidos del módulo. Contribuye a alcanzar la promoción y regularidad según tus condiciones de cursado.

NAVEGA POR LOS 4 MÓDULOS DE LA MATERIA

#### ¿Qué Actividades tengo en la Plataforma?

En Aula Virtual (Canvas) vas a encontrarte con las siguientes actividades:

TRABAJOS PRÁCTICOS: Integra los contenidos del módulo. Contribuye a alcanzar la promoción y regularidad según tus condiciones de cursado.

ACTIVIDAD PRÁCTICA: Son actividades auto-evaluativas (sin nota), para que verifiques cómo vas con el estudio.

#### Actividades Prácticas

Para continuar con la autoevaluación y acceder al ejemplo de resolución debes entregar el archivo, pero recorda que las AP no se califican.

En la Actividad Práctica, vas a encontrar un caso o situación problemática en el enunciado. Es importante realizar la lectura comprensiva del mismo para resolver la tarea.

#### Guía Conceptual

La Guia conceptual es un elemento que relaciona cada tema que incluye el programa de la materia, con los capítulos de la bibliografía básica y las lecturas de Canvas en dónde se desarrollan.

¡Mirá el vídeo y descubrí qué es y cómo descargar este elemento para facilitar tu estudio!

#### CURSOS

Desde acá accedés directamente a cada una de tus materias activas.

Si ingresas a Todos los cursos, vas a poder ver y acceder a tus cursos actuales como así también a las inscripciones pasadas.

#### CALENDARIO

El calendario de Canvas te ayuda a organizar todas tus entregas, clases y eventos en un solo lugar, diferenciados por color según la materia.

- Planificar tus semanas de estudio.
- Evitar solapamientos entre materias.
- Reforzar tu seguimiento de entregas.
- Mantener en vista tus clases en vivo.

#### Con el Calendario vas a poder:

- ¿Qué podés hacer en el Calendario?

1. Visualizar actividades por mes, semana o agenda. En la parte superior podés elegir cómo querés ver la información:

- Mes: vista general de todos los días.
- Semana: desglose por horarios (ideal para clases sincrónicas)
- Agenda: listado cronológico de todos los eventos próximos.

2. Navegación por fechas​: Usá las flechas o el selector desplegable para moverte entre meses o ir a una fecha puntual.

3. Colores y materias.

En la barra lateral derecha, cada materia aparece con un color distinto. Podés activar o desactivar su visualización para evitar sobrecarga de información.

4. Tipos de eventos visibles:

- Trabajos prácticos (TPs)
- Parciales
- Clases sincrónicas programadas
- Avisos o recordatorios de entrega

Al hacer clic sobre un evento, accedés directamente a la consigna o contenido vinculado.

#### BANDEJA DE ENTRADA

Es el sistema de mensajería interna de Canvas, que te permite comunicarte directamente con docentes, compañeros y tutores, sin salir de la plataforma.

Podes responder los mensajes o directamente redactar uno nuevo.

Es igual que redactar un mail.

- ¿Cómo me comunico con mi Profesor o Tutor?

Sobre la Barra a tu derecha, Hace click en Redactar un nuevo mensaje.

Accedé a los mensajes que te envían tus profesores y enviales las consultas por este medio.

#### Mensaje

Desde Para seleccioná a tu Profesor y en Asunto colocá el tema de tu consulta

Sé lo más específico o específica, en tu consulta y firmá con tu NOMBRE COMPLETO + DNI

También podes adjuntar archivos, grabar audios o enviar vídeos.

Seleccioná la materia por la cual queres consultar.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/aula-virtual$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-ayudantias$pea0$,
        $pea0$Ayudantias | La Nube 21$pea0$, $pea0$La Universidad Siglo 21, a través de la Resolución del Consejo Superior (R.C.S) N° 700/19, establece la posibilidad de formar en docencia a los/as alumnos/as.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/ayudantias el 2026-11-08. Revisalo antes de publicar.

#### Ayudantía en
docencia

#### Transformá tu conocimiento en enseñanza y comenzá a construir tu camino como docente

La Universidad Siglo 21, a través de la Resolución del Consejo Superior (R.C.S) N° 700/19, establece la posibilidad de formar en docencia a los/as alumnos/as.

#### ¿En qué consiste una ayudantía en docencia?

La Ayudantía brinda la posibilidad de formarse en el rol académico a aquellos alumnos que deseen dar sus primeros pasos en la carrera docente.

Al tratarse de actividades formativas facilitadas por la Universidad, su desempeño es ad honorem.

#### Ayudantía en docencia | Requisitos

Ser alumno de la Universidad Siglo 21.

Tener aprobada la materia en la que se realizará la Ayudantía con nota igual o mayor a 7 (siete).

Participar sólo en las materias de la misma modalidad que cursas.

#### Ayudantía en docencia | ¿En qué modalidad se puede realizar?

Las Ayudantías son ofrecidas en todas las modalidades que ofrece la Universidad:

Presencial

Presencial Distribuida

Presencial Home

Educación Distribuida

Educación Distribuida Home

#### Ayudantía en docencia | ¿Qué duración tiene?

Las Ayudantías de alumno en docencia tienen una duración total de un año, debiendo participar en todos los periodos de cursado de la materia.

#### Ayudantía en docencia | ¿Qué beneficios otorga?

La Universidad certifica el desempeño de los Ayudantes alumnos que hayan cumplido en tiempo y forma con los deberes establecidos.

Además, las Ayudantías serán consignadas como suplemento al título universitario y te otorgarán crédito para una materia electiva.

Requisito para obtener créditos: cumplir con 4 periodos (bimestrales o cuatrimestrales, según la modalidad en que se dicte la asignatura en la que cumplas el rol de Ayudante).

#### Ayudantía en docencia | ¿Qué sucede una vez que realizaste la postulación?

1. Una vez cerrada la Convocatoria, se evaluarán las postulaciones, valorándose los antecedentes presentados.

2. Como resultado de la evaluación, recibirás un mail con la asignación a una materia. Deberás responder dentro de las 48 horas, aceptando o rechazando la propuesta. En caso de no resultar seleccionado, también te lo informaremos por este mismo medio.

3. Una vez aceptada la ayudantía, se te generará un legajo y se te indicará los pasos a seguir.

#### ¿Querés conocer más sobre las
Ayudantías y Adscripciones?

#### PRÓXIMA CONVOCATORIA 2027

[Ingresá al micrositio de ayudantías y adscripciones](https://contenidos.21.edu.ar/microsites/ayudantias-y-adscripciones/me-interesa.html)$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/ayudantias$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$aranceles-y-pagos$pea0$), null, 0, $pea0$ln-becas-siglo-21$pea0$,
        $pea0$Becas | La Nube 21$pea0$, $pea0$En Universidad Siglo 21 apostamos a que tengas posibilidad de seguir estudiando, y por eso te ofrecemos becas para ayudarte a cumplir tu propósito.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/becas-siglo-21 el 2026-11-09. Revisalo antes de publicar.

#### BECAS POR POSTULACIÓN

#### INSCRIPCIONES ABIERTAS

En Universidad Siglo 21 apostamos a que tengas posibilidad de seguir estudiando, y por eso te ofrecemos becas para ayudarte a cumplir tu propósito.

MENU

Pasos para la Solicitud

Becas Vigentes

Postulate

#### Pasos para Solicitar una Beca

​​

- Solo se le dará curso a las solicitudes de Beca que presenten la documentación de su legajo de forma completa.

- Si la solicitud no se encuentra completa, se deberá cargar nuevamente.

Si todavía no entregaste la documentación de tu legajo, conocé los requisitos y el procedimiento para presentarla en la sección Documentación de Legajo:

Documentación de Legajo

#### SOLICITUD DE

#### 1

#### BECA

Tené en cuenta la siguiente información antes de solicitar tu beca:

Las Becas se deben solicitar antes de abonar los aranceles. Una vez realizado el pago, no es posible aplicar para una beca.

Deberás cargar la documentación necesaria para el tipo de beca que estés solicitando

Sólo se consideraran las postulaciones que se hayan presentado en tiempo y forma.

#### Confirmación del Otorgamiento

#### 2

La universidad analizará tu pedido y te dará una respuesta.

#comp-me8oyz95 svg [data-color="1"] {fill: #F0F0F0;}
#comp-me8oyz95 svg [data-color="2"] {fill: #002323;}

Primer Semestre: Fecha máxima de confirmación 1 de Febrero del año de cursado

#comp-me8slrxb svg [data-color="1"] {fill: #F0F0F0;}
#comp-me8slrxb svg [data-color="2"] {fill: #002323;}

Segundo Semestre: Fecha máxima de confirmación 20 de Julio del año de cursado

Aquellos estudiantes que resulten seleccionados en el proceso de otorgamiento, deberán realizar retribuciones de apoyo de acuerdo a las siguientes condiciones:

- Las personas beneficiarias con becas del 70% deberán cumplir 10 horas semanales de apoyo a las actividades de la Universidad.
- Las personas beneficiarias con becas del con un 50% deberán cumplir 8 horas semanales de apoyo a las actividades de la Universidad.
- Las personas beneficiarias con becas del 30% deberán cumplir 4 horas semanales de apoyo a las actividades de la Universidad.

Desde la Universidad se pondrán en contacto para informarte qué actividades vas a desarrollar.

#### Seguimiento
de la BECA

#### 3

Durante el desarrollo de la beca deberás registras las horas y actividades asignadas en un formulario que te vamos a compartir cuando se te confirme el detalle de tareas a realizar.

Es muy importante que completes dicho formulario, ya que a partir de él se va a realizar el seguimiento del cumplimiento de las actividades, lo que determinara si la Beca se renueva para el próximo periodo.

#### Becas académicas.

[Alto Rendimiento](https://www.lanube.21.edu.ar/becas-siglo-21#rendimientoacademico)

[Académico](https://www.lanube.21.edu.ar/becas-siglo-21#rendimientoacademico)

[Mejor promedio de cada escuela Secundaria](https://www.lanube.21.edu.ar/becas-siglo-21#ingreso)

Inicio

Características

Requisitos

Documentación

Postulate

### Beca Rendimiento Académico

​Elegiste esforzarte para lograr un desempeño académico sobresaliente y estás buscando llevarlo a su máximo potencial.

En Siglo contamos con una beca que busca impulsar tu talento para que alcances tus objetivos y metas.

### ​Detalles del beneficio

- Destinada a aspirantes o estudiantes de carreras de Grado o Pregrado, en cualquiera de las modalidades de estudio.​

- El beneficio consiste en una disminución del 30% sobre los aranceles del semestre, aplicable solo a esos conceptos (no incluye otros rubros o tasas).

​​​

- La aprobación de la beca está sujeta a la evaluación del Vicerrectorado de Gestión Institucional.

### ​Requisitos para acceder a la beca

Para aspirantes a ingresar a la Universidad:

- Promedio del último año del Nivel Medio igual o mayor a 8 (ocho), incluyendo aplazos.

- Haber finalizado los estudios secundarios dentro de los últimos 5 (cinco) años previos a la postulación.

Para estudiantes ya cursando una carrera:

- Promedio igual o mayor a 8 (ocho), incluyendo aplazos, en el último semestre de cursado.

- Haber aprobado al menos 2 (dos) materias en el período anterior a la fecha de aplicación

- Solo se le dará curso a las solicitudes de Beca que presenten la documentación de su legajo de forma completa.

- Si la solicitud no se encuentra completa, se deberá cargar nuevamente.

Si todavía no entregaste la documentación de tu legajo, conocé los requisitos y el procedimiento para presentarla en la sección Documentación de Legajo:

Documentación de Legajo

### ¿Qué documentos debo presentar?

- Certificado analítico o boletín del último año de Nivel Medio, con promedio final (para aspirantes).​​

- Documento Nacional de Identidad (DNI).

​​

secundaria

Inicio

Características

Requisitos

Documentación

Postulate

### Becas al mejor Promedio de cada Escuela Secundaria

Sabemos todo lo que has logrado, y queremos acompañarte a seguir construyendo tu futuro.

En Siglo, contamos con una beca que reconoce tu esfuerzo y está diseñada para impulsarte a alcanzar tus metas.

- Destinada a personas que aspiren a ingresar a una carrera de Grado o Pregrado, en cualquiera de las modalidades de estudio.

- El beneficio consiste en una disminución del 50% sobre los aranceles del semestre, aplicable únicamente a esos conceptos (no incluye otros rubros o tasas).

- La renovación de la beca estará sujeta al mantenimiento de las condiciones académicas establecidas para esta tipología.

- Ser estudiante del último año del nivel medio o polimodal, o haber egresado en el año inmediatamente anterior a la postulación.

- Haber obtenido, durante el último año de cursado, un promedio académico igual o mayor a 8 (ocho), incluyendo aplazos.

- Poseer una trayectoria académica sobresaliente, acreditada mediante recomendación de la persona a cargo de la Dirección del colegio o equivalente.

- Haber sido reconocido como mejor promedio de la promoción, acreditado con certificado oficial emitido por la institución educativa.

- Solo se le dará curso a las solicitudes de Beca que presenten la documentación de su legajo de forma completa.

- Si la solicitud no se encuentra completa, se deberá cargar nuevamente.

Si todavía no entregaste la documentación de tu legajo, conocé los requisitos y el procedimiento para presentarla en la sección Documentación de Legajo:

Documentación de Legajo

- Certificado analítico o boletín final del último año del Nivel Medio.

- Certificado oficial de “Mejor Promedio de la Promoción”, emitido por la escuela.

- Carta o nota de recomendación firmada por la persona Directora del establecimiento (o equivalente).

- Documento Nacional de Identidad (DNI).

​​

#### Becas económicas.

Talentos en situaciones de vulnerabilidad

Economica

Inicio

Características

Requisitos

Documentación

Evaluación y selección

Postulate

### Beca Situaciones de Vulnerabilidad

- Destinada a aspirantes y estudiantes de carreras de Grado o Pregrado, en cualquiera de las modalidades de estudio.

- Busca reconocer el talento académico de personas que se encuentran en situaciones de vulnerabilidad social o económica.

- El beneficio consiste en una bonificación parcial sobre matrícula y aranceles:

50% de descuento: para quienes acrediten promedio ≥ 8 y situación de vulnerabilidad verificada.

70% de descuento: para quienes acrediten vulnerabilidad económica y sean seleccionados según el orden de mérito y evaluación institucional.

- La mantención de la beca está sujeta al cumplimiento de los requisitos académicos y normativos institucionales vigentes.

Para aspirantes a ingresar:

- Ser estudiante del último año del Nivel Medio o Polimodal, o haber egresado recientemente.

- Promedio igual o mayor a 8 (ocho) durante el último año de cursado, sin materias en condición de libre ni coloquio.

- Contar con trayectoria académica sobresaliente, acreditada mediante recomendación de la Dirección y al menos dos docentes de la institución.

- Pertenecer a un grupo social o económicamente vulnerable, condición comprobable mediante documentación respaldatoria.

Para estudiantes reinscriptos:

- Promedio igual o mayor a 8 (ocho) en el último semestre de cursado.

- Haber aprobado al menos 2 materias en ese período.

- No poseer sanciones académicas o disciplinarias graves, muy graves o gravísimas.

- Solo se le dará curso a las solicitudes de Beca que presenten la documentación de su legajo de forma completa.

- Si la solicitud no se encuentra completa, se deberá cargar nuevamente.

​​​

Si todavía no entregaste la documentación de tu legajo, conocé los requisitos y el procedimiento para presentarla en la sección Documentación de Legajo:

Documentación de Legajo

Académica:

- Certificado analítico o boletín final (para aspirantes).
- Certificado de alumno regular y analítico parcial actualizado (para reinscriptos).
- Cartas de recomendación (Dirección + dos docentes).
- Carta de recomendación externa (no familiar).
- Hoja de vida (CV) y carta manuscrita del postulante explicando los motivos por los cuales considera merecer la beca.

Socioeconómica:

- Comprobantes de ingresos y egresos del grupo familiar.
- Cantidad de integrantes del grupo familiar, especificando menores de edad y personas con discapacidad.
- Condición laboral del principal perceptor de ingresos (prioridad a desocupados o subocupados).
- Situación jurídica del inmueble habitado (prioridad si no es propio o se encuentra hipotecado).
- Nivel educativo de los padres o tutores.
- Cobertura de salud.
- Lugar de procedencia de la persona postulante.
- Documento Nacional de Identidad (DNI).
- Formulario de solicitud de beca completo y firmado.

La Universidad ponderará los siguientes criterios:

- Hoja de vida: 30%

- Referencias académicas: 30%

- Exposición de motivos y evaluación de la situación personal: 40%

#### Plazos de Postulación

Las próximas convocatorias serán publicadas oportunamente.

FORMULARIO DE POSTULACIÓN

Up$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/becas-siglo-21$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$aranceles-y-pagos$pea0$), null, 0, $pea0$ln-becas-y-beneficios$pea0$,
        $pea0$Becas Y Beneficios | La Nube 21$pea0$, $pea0$En Universidad Siglo 21 apostamos a que tengas posibilidad de seguir estudiando, y por eso te ofrecemos beneficios para ayudarte a cumplir tu propósito.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/becas-y-beneficios el 2026-11-08. Revisalo antes de publicar.

### Solicitá tu
Beneficio o Beca

En Universidad Siglo 21 apostamos a que tengas posibilidad de seguir estudiando, y por eso te ofrecemos beneficios para ayudarte a cumplir tu propósito.

Buscador de Becas y Beneficios

Buscador de Organizaciones Amigas

Cómo Solicitar o Renovar un Beneficio o Beca

​​​​​​​

Solo se le dará curso a las solicitudes de Beca que presenten la documentación de su legajo de forma completa. ​​​

Si todavía no entregaste la documentación de tu legajo, conocé los requisitos y el procedimiento para presentarla en la sección Documentación de Legajo:

Documentación de Legajo

#### ¿CÓMO SOLICITO O RENUEVO UNA BECA / BENEFICIO?

Hay dos tipos de becas:

- Algunas se gestionan a través de un formulario de postulación:

Mirá acá toda la información sobre las Becas por Postulación.

- Otras requieren enviar la documentación correspondiente. Para solicitar o renovar una beca o beneficio:

​Deberás enviar tu pedido junto a la documentación respaldatoria a través de Consulta Alumno en la página oficial de la Universidad.

Ingresá desde el botón “Contactanos” en la sección Soy Estudiante

(Área de consulta: Trámites → Tipo de consulta: Becas y Beneficios).

Una vez recibida la solicitud, será analizada y se procederá a la carga de la beca o beneficio. Este proceso puede demorar hasta 5 días hábiles. Te informaremos el resultado por correo electrónico.

Cómo solicitar el Beneficio de Persistencia a la Graduación

Beneficio en Matrícula (solo para carreras de Grado)

No requiere solicitud. Se aplica de forma automática una vez realizada la validación académica.

El sistema lo otorga cuando tenés:

- Todas las materias obligatorias aprobadas.
- El Seminario Final en estado REGULAR.
- Solo te resta rendir EFIP II (modalidad a distancia) y/o la Defensa Oral.

Únicamente deberás generar el ticket de matrícula y aguardar la aplicación automática del 50% de descuento.

Beneficio en Aranceles (carreras de Grado y Pregrado — todas las modalidades)

Debés solicitarlo desde tu Portal Estudiantes, en Gestiones → Beneficio Persistencia a la Graduación.

Recordá leer los Términos y Condiciones para confirmar que cumplís los requisitos, ya que este beneficio solo puede solicitarse una vez.

IMPORTANTE:

Las becas o beneficios se debe solicitar antes de abonar los aranceles. Una vez hecho el pago, no será posible aplicar la beca.

Las Becas y Beneficios no son acumulables entre sí, pero si con promociones vigentes.

CICLOS DE COMPLEMENTACIÓN

No se aplicarán ni renovarán Becas o Beneficios a aquellos estudiantes de Ciclos de Complementación no posean la documentación de legajo Completa.

Para conocer toda la información sobre Documentación de Legajo, ingresa al Reglamento Institucional.

Ir al reglamento

## Buscador de Beneficios y Becas

En esta aplicación podrás consultar las Becas y Beneficios habilitadas.

## Buscador de Organizaciones Amigas

En esta aplicación podrás consultar las Organizaciones Amigas disponibles

Actualizado al 2026$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/becas-y-beneficios$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-cae$pea0$,
        $pea0$CAE$pea0$, $pea0$MENU$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/cae el 2026-11-08. Revisalo antes de publicar.

#### Te damos la
Bienvenida a la segunda etapa de tu proceso
CAE (Comisión Académica Evaluadora)

MENU

#### ¿EN QUÉ PARTE DEL PROCESO ME ENCUENTRO?

02

ASIGNACIÓN DE LA

CAE

​Estás en la segunda etapa. Cuando regularizas la materia Seminario Final de Grado, se te asigna una Comisión Académica Evaluadora (se habilita automáticamente una vez que el Tutor considere que el proyecto alcanzó el 100% de realización).

IMPORTANTE:

El plazo de evaluación de tu CAE es de 60 días a partir de la asignación de tu docente.

La CAE tiene por función evaluar el Trabajo Final de Grado (TFG) pudiendo:

#### 1. Realizarte recomendaciones de mejora:

​En caso de que cumplas de manera satisfactoria las recomendaciones de la CAE, será reconfirmada tu condición de regularidad del Seminario Final y quedarás habilitado a Defensa Oral.

#### 2. Solicitarte ajustes y modificaciones:

Se te indicará qué modificaciones y/o agregados debes hacer, además del plazo en el cual tendrás que entregar una nueva versión modificada de tu Trabajo Final.

En caso de que no cumplas con dicha entrega dentro del plazo de 30 días corridos o la misma no responda a lo indicado por la CAE, la materia Seminario Final quedará desaprobada y deberás recursar la materia para confección de un nuevo TFG.

#### 3. Desaprobar el TFG:

Si la CAE considera que el trabajo no está en condiciones de ser aprobado para Defensa Oral, tendrás que reunirte con los integrantes de la CAE, el profesor de Seminario Final y la Dirección de la carrera para un análisis y dictamen final.

Si se confirma lo observado por la CAE, la materia Seminario Final será desaprobada y tendrás que recursar la materia para elaborar un nuevo TFG.

En caso de reevaluarse la decisión, se te requerirán ajustes en tu TFG, siguiendo el proceso detallado en el punto anterior.

#### ¿Cuándo Comienza?

Cuando regularices la materia SEMINARIO FINAL (y la materia figure de esa manera en tu Portal de Estudiantes), la universidad te asignara una CAE (Comisión Académica de Evaluación) para tu TFG.

#### ¿Cómo ver el estado de mi trabajo final de graduación (TFG)?

En tu Portal de Estudiantes, podrás ver el estado de tu CAE.

Ingresá al botón de CAE.

Tené en cuenta que este botón se activa únicamente cuando te encontrás en esta instancia.

Aquí podrás revisar:

- El docente titular experto asignado y el docente CAE
- El detalle de las entregas y en qué proceso se encuentra la corrección.

Los estados posibles son:

- Pendiente de revisión: el docente aún debe realizar la corrección de tu entrega.
- Pendiente de re-entrega: debes hacer correcciones y adjuntarlas nuevamente.
- Aprobado.

Además de ver el estado de tu CAE, tendrás la posibilidad de adjuntar el archivo con las correcciones en caso de que te lo soliciten.

​Una vez APROBADA la entrega, desde el portal del estudiante se puede ver la leyenda del proceso CAE aprobado:

[Ingresá acá y conocé más sobre este tema](https://www.reglamento.21.edu.ar/trabajo-final)

[REGLAMENTO INSTITUCIONAL](https://www.reglamento.21.edu.ar/trabajo-final)

Up$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/cae$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-calendario-2026-ed-edh$pea0$,
        $pea0$Calendario académico 2026 · Distancia (ED y EDH)$pea0$, $pea0$Texto extraído del PDF oficial. Las fechas cambian cada año.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/descargas/calendarios-2026/5-calendario-academico-2026-ed-edh-arccnbcod-0030.pdf el 2026-11-09. Revisalo antes de publicar.

## Calendario académico 2026 · Distancia (ED y EDH)

Texto extraído del PDF oficial. Las fechas cambian cada año.

```
PLANIFICÁ TU CURSADO
Modalidad Distancia (ED+EDH)
  CALENDARIO ACADÉMICO 2026
  CALENDARIO ACADÉMICO 2026
  Modalidad Distancia (ED+EDH)
  PRIMER SEMESTRE - SUB PERÍODO 1A
 Comienzo de clases: 16/03/2026
 Inscripción a materias hasta: 29/03/2026
  EVENTO  DESDE  HASTA  NOVEDADES
 1° Semana  16/3/2026  21/3/2026
  23/03 - Feriado turístico
 2° Semana  23/3/2026  28/3/2026  24/03 - Día Nacional de la Memoria por la Verdad y la Justicia
  02/04 - Día del Veterano y de los Caídos en la Guerra de Malvinas
 3° Semana  30/3/2026  4/4/2026  02/04 - Jueves Santo
  03/04 - Viernes Santo
 4° Semana  6/4/2026  11/4/2026
 5° Semana  13/4/2026  18/4/2026
 6° Semana  20/4/2026  25/4/2026
 7° Semana  27/4/2026  2/5/2026  01/05 - Día del Trabajador
 8° Semana  4/5/2026  9/5/2026
 9° Semana (Recuperatorio-Integrador)  11/5/2026  16/5/2026
  ACTIVIDADES CALIFICABLES
  Tipo de  Semanas  EN
Modalidad  Período  TP1  TP2  TP3  TP4
  materia  TP  PERIODO
  MEC  5-8  13/4/2026  13/4/2026  4/5/2026  4/5/2026  16/5/2026
Distancia  MAP  1A  5-8  13/4/2026  13/4/2026  4/5/2026  4/5/2026  16/5/2026
  MIA  4-5-7-8  6/4/2026  13/4/2026  27/4/2026  4/5/2026
  CALENDARIO ACADÉMICO 2026
  PRIMER SEMESTRE - SUB PERÍODO 1B
 Comienzo de clases: 18/05/2026
 Inscripción a materias hasta: 31/05/2026
  EVENTO  DESDE  HASTA  NOVEDADES
 1° Semana  18/5/2026  23/5/2026
 2° Semana  25/5/2026  30/5/2026  25/05 - Día de la Revolución de Mayo
 3° Semana  1/6/2026  6/6/2026
 4° Semana  8/6/2026  13/6/2026
  15/06 - Paso a la Inmortalidad del Gral. Don Martín Miguel de
 5° Semana  15/6/2026  20/6/2026  Güemes (17/06)
  20/06 - Paso a la Inmortalidad del Gral. Manuel Belgrano
 6° Semana  22/6/2026  27/6/2026
 7° Semana  29/6/2026  4/7/2026
  09/07 - Día de la Independencia
 8° Semana  6/7/2026  11/7/2026  10/07 - Feriado turístico
 9° Semana (Recuperatorio-Integrador)  13/7/2026  18/7/2026
  ACTIVIDADES CALIFICABLES
  Tipo de  Semanas  EN
Modalidad  Período  TP1  TP2  TP3  TP4
  materia  TP  PERIODO
  MEC  5-8  15/6/2026  15/6/2026  6/7/2026  6/7/2026  18/7/2026
Distancia  MAP  1B  5-8  15/6/2026  15/6/2026  6/7/2026  6/7/2026  18/7/2026
  MIA  4-5-7-8  8/6/2026  15/6/2026  29/6/2026  6/7/2026
  CALENDARIO ACADÉMICO 2026
  PRIMER SEMESTRE - TUTORÍAS CUATRIMESTRALES
 Comienzo de clases: 16/03/2026
 Inscripción a materias hasta: 29/03/2026
  EVENTO  DESDE  HASTA  NOVEDADES
 1° Semana  16/3/2026  21/3/2026
  23/03 - Feriado turístico
 2° Semana  23/3/2026  28/3/2026  24/03 Día Nacional de la Memoria por la Verdad y la Justicia
  02/04 - Día del Veterano y de los Caídos en la Guerra de Malvinas
 3° Semana  30/3/2026  4/4/2026  02/04 - Jueves Santo
  03/04 - Viernes Santo
 4° Semana  6/4/2026  11/4/2026
 5° Semana  13/4/2026  18/4/2026
 6° Semana  20/4/2026  25/4/2026
 7° Semana  27/4/2026  2/5/2026  01/05 - Día del Trabajador
 8° Semana  4/5/2026  9/5/2026
 9° Semana  11/5/2026  16/5/2026
 10° Semana  18/5/2026  23/5/2026
 11° Semana  25/5/2026  30/5/2026  25/05 - Día de la Revolución de Mayo
 12° Semana  1/6/2026  6/6/2026
 13° Semana  8/6/2026  13/6/2026
 14° Semana  15/6/2026  20/6/2026  15/06 - Paso a la Inmortalidad del Gral. Don Martín Miguel de Güemes.(17/06)
  20/06 - Paso a la Inmortalidad del Gral. Manuel Belgrano
 15° Semana  22/6/2026  27/6/2026
 16° Semana  29/6/2026  4/7/2026
  09/07 - Día de la Independencia
 17° Semana  6/7/2026  11/7/2026  10/07 - Feriado turístico
 18° Semana (Recuperatorio-Integrador-MIP)  13/7/2026  18/7/2026
  ACTIVIDADES CALIFICABLES
Modalidad  Tipo de  Semanas
  Período  TP1  TP2  TP3  TP4
  materia  TP
  Cuatrimest
Distancia  MIP  5-9-12-6  13/4/2026  11/5/2026  1/6/2026  29/6/2026
  al
  CALENDARIO ACADÉMICO 2026
  SEGUNDO SEMESTRE - SUB PERÍODO 2A
 Comienzo de clases: 03/08/2026
 Inscripción a materias hasta: 16/08/2026
  EVENTO  DESDE  HASTA  NOVEDADES
 1° Semana  3/8/2026  8/8/2026
 2° Semana  10/8/2026  15/8/2026
 3° Semana  17/8/2026  22/8/2026  17/08 - Paso a la Inmortalidad del Gral. José de San Martín
 4° Semana  24/8/2026  29/8/2026
 5° Semana  31/8/2026  5/9/2026
 6° Semana  7/9/2026  12/9/2026
 7° Semana  14/9/2026  19/9/2026
 8° Semana  21/9/2026  26/9/2026  21/09 - Día del Estudiante
 9° Semana (Recuperatorio-Integrador)  28/9/2026  3/10/2026  30/09 - Día del Patrono de la ciudad de Córdoba (este feriado
  SOLO aplica para sede Cba)
  ACTIVIDADES CALIFICABLES
  Tipo de  Semanas  EN
Modalidad  Período  TP1  TP2  TP3  TP4
  materia  TP  PERIODO
  MEC  5-8  31/8/2026  31/8/2026  21/9/2026  21/9/2026  3/10/2026
Distancia  MAP  2A  5-8  31/8/2026  31/8/2026  21/9/2026  21/9/2026  3/10/2026
  MIA  4-5-7-8  24/8/2026  31/8/2026  14/9/2026  21/9/2026
  CALENDARIO ACADÉMICO 2026
  SEGUNDO SEMESTRE - SUB PERÍODO 2B
 Comienzo de clases: 05/10/2026
 Inscripción a materias hasta: 18/10/2026
  EVENTO  DESDE  HASTA  NOVEDADES
 1° Semana  5/10/2026  10/10/2026
 2° Semana  12/10/2026  17/10/2026  12/10 - Día del Respeto a la Diversidad Cultural
 3° Semana  19/10/2026  24/10/2026
 4° Semana  26/10/2026  31/10/2026
 5° Semana  2/11/2026  7/11/2026
 6° Semana  9/11/2026  14/11/2026
 7° Semana  16/11/2026  21/11/2026
 8° Semana  23/11/2026  28/11/2026  23/11 - Día de la Soberanía Nacional (20/11)
 9° Semana (Recuperatorio-Integrador)  30/11/2026  5/12/2026
  ACTIVIDADES CALIFICABLES
  Tipo de  Semanas  EN
Modalidad  Período  TP1  TP2  TP3  TP4
  materia  TP  PERIODO
  MEC  5-8  2/11/2026  2/11/2026  23/11/2026  23/11/2026  5/12/2026
Distancia  MAP  2B  5-8  2/11/2026  2/11/2026  23/11/2026  23/11/2026  5/12/2026
  MIA  4-5-7-8  26/10/2026  2/11/2026  16/11/2026  23/11/2026
  CALENDARIO ACADÉMICO 2026
  SEGUNDO SEMESTRE - TUTORÍAS CUATRIMESTRALES
 Comienzo de clases: 03/08/2026
 Inscripción a materias hasta: 16/08/2026
  EVENTO  DESDE  HASTA  NOVEDADES
 1° Semana  3/8/2026  8/8/2026
 2° Semana  10/8/2026  15/8/2026
 3° Semana  17/8/2026  22/8/2026  17/08 - Paso a la Inmortalidad del Gral. José de San Martín
 4° Semana  24/8/2026  29/8/2026
 5° Semana  31/8/2026  5/9/2026
 6° Semana  7/9/2026  12/9/2026
 7° Semana  14/9/2026  19/9/2026
 8° Semana  21/9/2026  26/9/2026  21/09 - Día del Estudiante
  30/09 - Día del Patrono de la ciudad de Córdoba (este feriado SOLO
 9° Semana  28/9/2026  3/10/2026  aplica para sede Cba)
 10° Semana  5/10/2026  10/10/2026
 11° Semana  12/10/2026  17/10/2026  12/10 - Día del Respeto a la Diversidad Cultural
 12° Semana  19/10/2026  24/10/2026
 13° Semana  26/10/2026  31/10/2026
 14° Semana  2/11/2026  7/11/2026
 15° Semana  9/11/2026  14/11/2026
 16° Semana  16/11/2026  21/11/2026
 17° Semana  23/11/2026  28/11/2026  23/11 - Día de la Soberanía Nacional (20/11)
 18° Semana (Recuperatorio-Integrador-MIP)  30/11/2026  5/12/2026
  ACTIVIDADES CALIFICABLES
Modalidad  Tipo de  Semanas
  Período  TP1  TP2  TP3  TP4
  materia  TP
  Cuatrimestr
Distancia  MIP  5-9-12-16  31/8/2026  28/9/2026  19/10/2026  16/11/2026
  al
```$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/descargas/calendarios-2026/5-calendario-academico-2026-ed-edh-arccnbcod-0030.pdf$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-calendario-2026-p-pd$pea0$,
        $pea0$Calendario académico 2026 · Presencial y Presencial Distribuida (P y PD)$pea0$, $pea0$Texto extraído del PDF oficial. Las fechas cambian cada año.$pea0$, $pea0$> **A validar:** contenido relevado de https://contenidos.21.edu.ar/descargas/calendarios-2026/3-calendario-academico-2026-p-pd.pdf el 2026-11-09. Revisalo antes de publicar.

## Calendario académico 2026 · Presencial y Presencial Distribuida (P y PD)

Texto extraído del PDF oficial. Las fechas cambian cada año.

```
PLANIFICÁ TU CURSADO
Modalidad Presencial (P.) y Presencial Distribuida (PD)
  CALENDARIO ACADÉMICO 2026
  CALENDARIO ACADÉMICO 2026
  PRIMER SEMESTRE
  Comienzo de clases: 16/03/2026
  Inscripción a materias hasta: 29/03/2026
  Cambio de cátedra: del 16/03/2026 al 20/03/2026
  EVENTO  DESDE  HASTA  NOVEDADES
  1° Semana  16/3/2026  21/3/2026
  23/03 - Feriado turístico
  2° Semana  23/3/2026  28/3/2026  24/03 - Día Nacional de la Memoria por la Verdad y la Justicia
  02/04 - Día del Veterano y de los Caídos en la Guerra de Malvinas
  3° Semana  30/3/2026  4/4/2026  02/04 - Jueves Santo
  03/04 - Viernes Santo
  4° Semana  6/4/2026  11/4/2026
  5° Semana  13/4/2026  18/4/2026
  6° Semana  20/4/2026  25/4/2026
  7° Semana (1º Parcial)  27/4/2026  2/5/2026  01/05 - Día del Trabajador
  8° Semana (1º Parcial)  4/5/2026  9/5/2026
  9° Semana  11/5/2026  16/5/2026
  10° Semana  18/5/2026  23/5/2026
  11° Semana  25/5/2026  30/5/2026  25/05 - Día de la Revolución de Mayo
  12° Semana  1/6/2026  6/6/2026
  13° Semana  8/6/2026  13/6/2026
  14° Semana (2º Parcial)  15/6/2026  20/6/2026  15/06 - Paso a la Inmortalidad del Gral. Don Martín Miguel de Güemes (17/06)
  20/06 - Paso a la Inmortalidad del Gral. Manuel Belgrano
  15° Semana (2º Parcial)  22/6/2026  27/6/2026
  16° Semana (Recuperatorio/Integrador)  29/6/2026  4/7/2026
NOTA:
* Fechas de parciales que correspondan a días feriados pueden reprogramarse para el sábado anterior o posterior de semana de parciales.
*Se pueden programar fechas de parciales en semana posterior a la institucional.
  ACTIVIDADES CALIFICABLES
  1° semestre
  Tipo de  Semanas  FIN DE
Modalidad  Período  TP1  TP2  TP3  TP4
  materia  TP  PERIODO
  MEC  8-15  4/5/2026  4/5/2026  22/6/2026  22/6/2026  4/7/2026
  MAP  8-15  4/5/2026  4/5/2026  22/6/2026  22/6/2026  4/7/2026
  1°
Presencial
  semestre
  MIA  5-8-10-15  13/4/2026  4/5/2026  18/5/2026  22/6/2026
  MIP  5-9-12-15  13/4/2026  11/5/2026  1/6/2026  22/6/2026
  CALENDARIO ACADÉMICO 2026
  SEGUNDO SEMESTRE
  Comienzo de clases: 03/08/2026
  Inscripción a materias hasta: 16/08/2026
  Cambio de cátedra: del 03/08/2026 al 15/08/2026
  EVENTO  DESDE  HASTA  NOVEDADES
  1° Semana  3/8/2026  8/8/2026
  2° Semana  10/8/2026  15/8/2026
  3° Semana  17/8/2026  22/8/2026  17/08 - Paso a la Inmortalidad del Gral. José de San Martín
  4° Semana  24/8/2026  29/8/2026
  5° Semana  31/8/2026  5/9/2026
  6° Semana  7/9/2026  12/9/2026
  7° Semana (1º Parcial)  14/9/2026  19/9/2026
  8° Semana (1º Parcial)  21/9/2026  26/9/2026  21/09 - Día del Estudiante
  30/09 - Día del Patrono de la ciudad de Córdoba (este feriado
  9° Semana  28/9/2026  3/10/2026  SOLO aplica para sede Cba)
  10° Semana  5/10/2026  10/10/2026
  11° Semana  12/10/2026  17/10/2026  12/10 - Día del Respeto a la Diversidad Cultural
  12° Semana  19/10/2026  24/10/2026
  13° Semana  26/10/2026  31/10/2026
  14° Semana (2º Parcial)  2/11/2026  7/11/2026
  11/11 - Día de la Fundación de Cuidad de Rio IV (este feriado
  15° Semana (2º Parcial)  9/11/2026  14/11/2026  SOLO aplica para sede Río IV).
  16° Semana (Recuperatorio/Integrador)  16/11/2026  21/11/2026
NOTA:
* Fechas de parciales que correspondan a días feriados pueden reprogramarse para el sábado anterior o posterior de semana de parciales.
*Se pueden programar fechas de parciales en semana posterior a la institucional.
  ACTIVIDADES CALIFICABLES
  2° semestre
  Tipo de  Semanas  FIN DE
Modalidad  Período  TP1  TP2  TP3  TP4
  materia  TP  PERIODO
  MEC  8-15  21/9/2026  21/9/2026  9/11/2026  9/11/2026  21/11/2026
  MAP  8-15  21/9/2026  21/9/2026  9/11/2026  9/11/2026  21/11/2026
  1°
Presencial
  semestre
  MIA  5-8-10-15  31/8/2026  21/9/2026  5/10/2026  9/11/2026
  MIP  5-9-12-15  31/8/2026  28/9/2026  19/10/2026  9/11/2026
  CALENDARIO ACADÉMICO 2026
  Modalidad Presencial (P.) y Presencial Distribuida (PD)
  EXÁMENES FINALES
  TURNO FEBRERO-MARZO
INSCRIPCIÓN A FINALES  DESDE 26/1/2026
EXÁMENES  DESDE 2/2/2026 HASTA 7/3/2026
  TURNO JULIO-AGOSTO
INSCRIPCIÓN A FINALES  DESDE 29/6/2026
EXÁMENES  DESDE 6/7/2026 HASTA 1/8/2026
  TURNO NOVIEMBRE-DICIEMBRE
INSCRIPCIÓN A FINALES  DESDE 18/11/2026
EXÁMENES  DESDE 23/11/2026 HASTA 19/12/2026
```$pea0$, 'global', 'borrador', $pea0$https://contenidos.21.edu.ar/descargas/calendarios-2026/3-calendario-academico-2026-p-pd.pdf$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-calendario-academico-distancia$pea0$,
        $pea0$CALENDARIO ACADÉMICO ED-EDH | La Nube 21$pea0$, $pea0$Descargá tu calendario$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/calendario-acad%C3%A9mico-distancia el 2026-11-09. Revisalo antes de publicar.

#### Calendario modalidad Distancia ED - EDH
Inicio de cursado segundo semestre: 03/08/2026

Descargá tu calendario

¿Cuándo se rinden los parciales?

¿Cuándo se entregan los TPs?

Sincronizá tus vencimientos

Calendario de trámites

#### Mirá el Calendario Completo

Descargá tu calendario acá

#### ¿Cuándo se entregan los Trabajos Prácticos?

Periodo 2B: Materias Bimestrales

Segundo Semestre: Materias Cuatrimestrales

#### Inscripción a parciales

Novedades: Ahora podés inscribirte desde el inicio del cursado al Primer y al Segundo Parcial, eligiendo la fecha y la franja horaria que prefieras dentro de los plazos establecidos.

### ​​

### Plazos para inscribirte:

### ​

- Primer Parcial: hasta el 18 de octubre.

- Segundo Parcial: hasta el 10 de noviembre.

Si no realizás la inscripción dentro del plazo correspondiente, el sistema asignará automáticamente una fecha para rendir.

#### Calendario de Trámites

#### Conocé el
Calendario de Trámites

#### Descargalo acá

#### Sincronizá tus vencimientos en tu Calendario de Google

Descargá este archivo e importalo en tu calendario de Google, para incluir los vencimientos en tu agenda personal.

Materias MEC

Materias MIP

Materias MIA

### Mirá el tutorial

### Si no sabés cómo hacerlo$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/calendario-acad%C3%A9mico-distancia$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-calendario-academico-presencial$pea0$,
        $pea0$CALENDARIO ACADÉMICO PRESENCIAL | La Nube 21$pea0$, $pea0$Descargá tu calendario$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/calendario-academico-presencial el 2026-11-09. Revisalo antes de publicar.

#### Calendario Modalidad Presencial y Presencial Distribuida
Inicio de cursado segundo semestre: 03/08/2026

Descargá tu calendario

¿Cuándo se rinden los parciales?

¿Cuándo se entregan los TPs?

Calendario de trámites

#### Mirá el Calendario Completo

Descargá tu calendario acá

#### ¿Cuándo se entregan los Trabajos Prácticos?

Segundo Semestre

#### ¿Cuándo se rinden los parciales?

No tenés que realizar la inscripción a los exámenes parciales, ya que se gestiona de forma automática. Consultá la información en tu Portal Estudiantes.

Segundo Semestre

#### 2do Parcial

#### Desde el 02/11 hasta el 14/11

Podés consultar la fecha de tus parciales en tu Portal Estudiantes, dentro de la sección Exámenes.

#### Fechas exámenes finales

Recordá que deberás realizar tu inscripción, con al menos 4 (cuatro) días CORRIDOS de anticipación según la disponibilidad de turnos de examen que tenga el CAU o Sede.

Mirá como inscribirte a los exámenes finales acá:

Inscripción a finales

#### Calendario de Trámites

#### Conocé el
Calendario de Trámites

#### Descargalo acá$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/calendario-academico-presencial$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-calendario-academico$pea0$,
        $pea0$Calendario académico$pea0$, $pea0$El Calendario Académico es una herramienta clave que te ayudará a planificar y organizar tu cursado. Podrás:$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/calendario-academico el 2026-11-08. Revisalo antes de publicar.

#### CALENDARIO ACADÉMICO

El Calendario Académico es una herramienta clave que te ayudará a planificar y organizar tu cursado. Podrás:

- Organizar tu tiempo.

- Visualizar fechas importantes, como por ejemplo entregas de trabajos prácticos, parciales, comienzo y fin de periodos, semanas de recuperatorios y más. ​

- Tenerlo a la vista y consultarlo regularmente es una estrategia eficaz para mantenerte enfocado y optimizar tu rendimiento académico.​​

## Calendarios 2026

Consultá el calendario según tu modalidad o tipo de cursado.

#### MODALIDAD
DISTANCIA

#### MODALIDAD
PRESENCIAL HOME

#### CALENDARIO
CERVANTES

#### CALENDARIO
TRAMITES

#### MODALIDAD
PRESENCIAL

#### MODALIDAD
PRESENCIAL DISTRIBUIDA

#### CALENDARIO
MATERIAS DE PROCESO

#### CALENDARIO
MARTILLERO PRESENCIAL$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/calendario-academico$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-calendario-de-tramites$pea0$,
        $pea0$CALENDARIO DE TRAMITES$pea0$, $pea0$En la Universidad Siglo 21 entendemos las internships como experiencias de pasantías con un impacto significativo en el ámbito global. Esta dimensión internacional puede manifestarse a través de d$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/post/calendario-de-tramites el 2026-11-09. Revisalo antes de publicar.

En la Universidad Siglo 21 entendemos las internships como experiencias de pasantías con un impacto significativo en el ámbito global. Esta dimensión internacional puede manifestarse a través de d

### Comentarios$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/post/calendario-de-tramites$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$atencion-y-derivaciones$pea0$), null, 0, $pea0$ln-canales-de-contacto$pea0$,
        $pea0$CANALES DE CONTACTO | La Nube 21$pea0$, $pea0$¡Comunicate con nosotros!$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/canales-de-contacto el 2026-11-08. Revisalo antes de publicar.

#### CANALES DE CONTACTO

¡Comunicate con nosotros!

Estamos cada vez más cerca tuyo. Revisá todos los canales que tenemos disponibles para responder tus dudas.

Menu

Consultas Académicas

Consultas Administrativas

Biblioteca

#### Consultas Académicas

### Directores de Carrera

Consultá el listado de directores de Carrera de cada decanato y su mail de contacto:

#### Ingresá acá

### Profesores

Podés contactarte con tus profesores desde la mensajería de tu Aula Virtual (CANVAS). Si no conocés cómo hacerlo, mirá el siguiente vídeo:

#### Consultas Administrativas

### Centros de Apoyo Universitario (CAU)

Buscá en el mapa de Sedes y Centros los datos para comunicarte con tu CAU.

chat virtual

### Consulta Alumnos

Desde esta ventana vas a poder elegir chatear con un asesor o dejar una consulta por escrito

Para realizar una consulta escrita hacelo en la etiqueta Consultar, seleccioná el legajo por el cual querés realizar la consulta y hace clic en el botón continuar.

#### Tu usuario

#### Tus legajos

Desplegá el campo "Título de tipificación" y seleccioná el motivo de tu consulta. Luego, completá el campo de descripción con los detalles de tu caso y, si lo necesitás, adjuntá un archivo relacionado. Una vez listo, hacé clic en el botón "Enviar". La respuesta te llegará por mail una vez que el caso sea resuelto.

### Chatea con un Asesor Institucional

Podés contactarte con un Asesor Institucional en el momento. Atenderá tus consultas y te brindará orientación personalizada.

#### Biblioteca

### Campus Córdoba

Lunes a Viernes de 8 a 20 hs.

[biblioteca@ues21.edu.ar](mailto:biblioteca@ues21.edu.ar)

### Río Cuarto

Lunes, Miércoles y Viernes de 11 a 20 hs.

Martes y Jueves de 9 a 18 hs.

[bibliotecariocuarto@ues21.edu.ar](mailto:bibliotecariocuarto@ues21.edu.ar)

#### Quiero contactarme con otros/as estudiantes

Sumate a ComunidadNET, una aplicación para que despegues y aterrices en nuevas conexiones y potencies tu desarrollo.

#### Ir a ComunidadNET

Up$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/canales-de-contacto$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-ce-emprendimiento-innovacion$pea0$,
        $pea0$EMPRENDIMIENTO E INNOVACIÓN | La Nube 21$pea0$, $pea0$Desde la Universidad potenciamos tus competencias de innovación, creatividad y autogestión. Impulsamos profesionales capaces de crear y desarrollar proyectos que abran nuevas posibilidades, generan…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/ce-emprendimiento-innovacion el 2026-11-08. Revisalo antes de publicar.

### Formamos líderes
emprendedores

Desde la Universidad potenciamos tus competencias de innovación, creatividad y autogestión. Impulsamos profesionales capaces de crear y desarrollar proyectos que abran nuevas posibilidades, generando verdaderos cambios sociales, económicos y de impacto positivo en el medioambiente.

POTENCIÁ TU PERFIL

ACADÉMICO Y PROFESIONAL

Explorá el espacio de Experiencias 21 y descubrí actividades cocurriculares para tu carrera.

Ingresá al Portal de Recomendaciones para conocer cada propuesta y realizá tu inscripción.

Especial

#### Ofrecemos programas diseñados para potenciar tus ideas,
¡explorá las convocatorias abiertas y períodos de inscripción!

[CONOCÉ NUESTROS PROGRAMAS](https://www.lanube.21.edu.ar/ce-emprendimiento-innovacion)

Impulso 21

V21

Certificado en Competencias

Comunidad Emprendedora

Competencias y eventos

#### Impulso 21

Programas de acompañamiento emprendedor pensados para cada etapa de tu proyecto: pre-incubación, incubación y aceleración.

Para participar, las iniciativas atraviesan un proceso de selección que permite identificar aquellas que mejor se ajustan al estadio y perfil de cada programa, brindando un acompañamiento más específico y de mayor valor.

#### IMPULSO 21 | INITIATIVE

Impulso 21 Initiative es un programa de preincubación de negocios dirigido a startups y/o emprendimientos de cualquier rubro e industria que se encuentren en fase de contextualización, es decir, aún no en funcionamiento. Si querés completar el proceso de modelado e identificar clientes potenciales, esta oportunidad es perfecta para vos.

Fecha de inicio | 19 de marzo 2026

INSCRIBÍTE ACÁ Y SUMATE A ESTA INICIATIVA

#### IMPULSO 21 | LAUNCH PAD

Impulso 21 Launch Pad es un programa de incubación de negocios dirigido a startups y/o emprendimientos de cualquier rubro o industria que se encuentren en una fase temprana de desarrollo, con una idea de negocio o un proyecto en marcha. Accederás a herramientas prácticas con el objetivo de validar tu negocio y concretar o hacer crecer tus primeras ventas.

Fecha de inicio | 19 de marzo 2026

INSCRIBÍTE ACÁ Y SUMATE A ESTA INICIATIVA

#### IMPULSO 21 | Tech

Impulso 21 Tech programa orientado a emprendimientos de base tecnológica, como apps, software y plataformas, que buscan validar su MVP y comprender el funcionamiento del ecosistema startup, con foco en el desarrollo de proyectos escalables.

INSCRIBÍTE ACÁ Y SUMATE A ESTA INICIATIVA

#### IMPULSO 21 | ACCELERATE

Impulso 21 Accelerate es un programa intensivo de aceleración de startups con alto potencial de crecimiento, diseñado para ayudar a emprendimientos a escalar rápidamente sus negocios. Podrás acceder a:

- Mentorías y Asesoramiento Personalizado
- Acceso a Empresas Sponsors
- Acceso a Ronda de Inversión
- Espacio de trabajo en las instalaciones de la Universidad Siglo 21 para facilitar la colaboración y el networking.
- Talleres y workshops sobre temas relevantes para el crecimiento de startups.

Conexión con el ecosistema emprendedor local e internacional a través de eventos y actividades de la universidad.

Convocatorias abiertas | de marzo a diciembre

Duración del programa | 6 meses

INSCRIBÍTE ACÁ Y SUMATE A ESTA INICIATIVA

#### Suplemento al Título Universitario

Al participar en los programas y cumplir con sus requisitos, podés obtener un Suplemento al Título que reconoce esta experiencia en tu trayectoria académica.

Este reconocimiento se verá reflejado en la 4.ª hoja de tu certificado analítico al momento de graduarte.

#### V21 - Programa de Validación

El programa tiene foco en la validación de producto y mercado, trabajando sobre la identificación de hipótesis clave (problema, cliente, propuesta de valor) y el diseño de experimentos que permitan testearlas de manera concreta y ágil, a través de un proceso de acompañamiento metodológico.

Apertura | abril y agosto

Duración del programa | 2 encuentros teóricos y un día de práctica

Modalidad | presencial

PRÓXIMAMENTE CONVOCATORIA 2026

#### Certificate en Competencias Emprendedoras

Podrás desarrollar habilidades como la creatividad e innovación para generar nuevos emprendimientos, como así también para expandir las capacidades y recursos de organizaciones ya existentes, identificar necesidades de los mercados actuales e iniciar eficientemente nuevos negocios que las resuelvan.

INSCRIBITE ACÁ

[CONOCÉ MÁS](https://informate.21.edu.ar/certificado-en-competencias)

Lunes

Espacio de consultas para inscriptos en Certificados.

16:00 hs

Unirse a sala Teams

ID de reunión: 841 6174 0367 

Código de acceso: 554827

#### Comunidad Emprendedora

#### CLUB DE EMPRENDEDORES 21

El Club Emprendedores 21 es una comunidad virtual que reúne a e estudiantes, egresados/as y docentes emprendedores/as de todo el país y colabora como un equipo que comparte información, conocimientos y experiencias entre sus miembros.

## ​

- Si te interesa la temática emprendedora,
- Tenés una idea de negocio y querés emprender, o ya contas con un emprendimiento funcionando

¡Este espacio es para vos!

Formá parte del Club y recibí beneficios especialmente pensados para potenciarte como emprendedor/a Siglo 21.

#### CLUB
EMPRENDEDORES 21

INSCRIBITE ACÁ

Tu perfil emprendedor nos importa ¡Participá del Relevamiento!

Contanos tu perfil, intereses y necesidades como emprendedor/a. Solo te tomará 5 minutos y nos permitirá acercarte oportunidades personalizadas de capacitación, acompañamiento y networking.

[Completá el custionario acá](https://forms.office.com/pages/responsepage.aspx?id=SIamUCqKnEi3RWQ9TYbR44lFiXSAhz1IjdA7gQxD9ddURUtPUzhDUzc0V0FXME5QNEw4TkdJUkVWNS4u&route=shorturl)

#### Competencias y eventos

#### COMPETENCIA | DESAFÍOS 21

Este programa es una competencia orientada exclusivamente a estudiantes para que desarrollen sus habilidades de innovación, creatividad y trabajo en equipo.

Se lleva a cabo en todos los períodos académicos, según la modalidad (1er y 2do semestre; Período 1A/1B y 2A/2B), con foco en Impacto e Innovación, dentro de las materias: Desarrollo Emprendedor, Emprendimientos Universitarios, Innovación para Nuevos Negocios, Creatividad y Emprendedorismo y Herramientas Digitales para Emprendedores.

Consultas | comunícate con el docente a cargo de la materia

#### EVENTO | FERIA 21

Es la Feria de Emprendimiento e Innovación de la Universidad Siglo 21 y la competencia de emprendimientos más grande de la institución.

Cada año reúne a emprendedores, empresas, instituciones públicas y ONGs de todo el país, generando oportunidades de vinculación, formación y desarrollo profesional.

Durante tres días, emprendimientos de alcance nacional exponen sus proyectos de manera presencial, participan en actividades y son evaluados por un jurado de prestigio, que reconoce a los proyectos más destacados con premios académicos y monetarios.

FERIA 21

Edición 2026

7, 8 y 9 de octubre de 2026 | Campus, Córdoba

Convocatoria abierta hasta el 30 de agosto del 2026

Inscripciones abiertas del 16/07/2026 al 30/08/2026 11:59 PM

Evaluación de solicitudes del 30/08/2026 a 01/09/2026

Selección de candidatos desde el 01/09/2026

Convocatoria cerrada

#### INICIATIVAS ALIADAS DE APOYO | EXPLORER

Es un programa lanzado por Santander, pensado para quienes quieren dar sus primeros pasos en el mundo del emprendimiento, sin necesidad de contar con conocimientos previos en empresas o negocios.

Durante 12 semanas, los participantes trabajan en el desarrollo de una idea que aporte a los Objetivos de Desarrollo Sostenible (ODS 2030), mientras fortalecen habilidades clave que serán útiles en cualquier ámbito profesional.

Además, el programa permite conectar con una comunidad global de jóvenes emprendedores y participar de manera individual o en equipo.

PRÓXIMAMENTE CONVOCATORIA 2026

#### COMPETENCIA | GLOBAL STUDENT CHALLENGE

¿Sos estudiante de grado o posgrado?

¿Tenes una idea de negocio que te gustaría llevar al siguiente nivel?

Entonces, ¡esta oportunidad es para vos!

Global Student Challenge es una competencia internacional diseñada para entrenarte y hacerte experimentar el mundo del emprendimiento con impacto.

Podés ganar premios en efectivo, becas y hasta una semana formativa en Babson College, Estados Unidos. Es una oportunidad para animarse a transformar una idea en un proyecto con proyección global.

PRÓXIMAMENTE CONVOCATORIA 2026

#### PROGRAMA | FIE (Foro Internacional de Emprendedores)

El Foro Internacional de Emprendedores es un programa educativo de alto impacto organizado por la fundación Junior Achievement Córdoba, destinado a jóvenes de entre 16 y 24 años de más de 10 países.

Desde el 26 al 30 de agosto 2025, tendrás la oportunidad de compartir con conferencistas destacados, participar en competencias, talleres prácticos y muchas actividades más para potenciar tus habilidades de liderazgo al máximo.

​¿Te gustaría vivir la experiencia?

Como todos los años, podés participar por una beca completa para asistir al evento sin costo.

Además, también podés acceder a estos beneficios:

- Inasistencias justificadas en clases o actividades académicas
- Aprobación de exámenes (a excepción de exámenes finales)
- Suplemento al título

PARA MÁS INFORMACIÓN INGRESÁ ACÁ

#### EDUCACIÓN EMPRENDEDORA | MATERIAS

Además de los programas cocurriculares, también podés potenciar tu formación desde lo curricular. Contamos con materias especialmente orientadas al perfil emprendedor:

#### MATERIAS | Curriculares

- Desarrollo Emprendedor: Estudiarás los principales desafíos de cada etapa del proceso emprendedor y el rol que todo emprendedor debe asumir para enfrentarlos. Además, adquirirás herramientas prácticas para modelar, validar y presentar tu idea de negocio —como el Business Model Canvas y Lean Startup—, aplicándolas directamente en una propuesta real.

- Emprendimientos Universitarios: Aprenderás a identificar y plantear problemas reales como punto de partida para el desarrollo de emprendimientos. A partir de estos desafíos, aplicarás metodologías que fomentan la generación de soluciones innovadoras y sostenibles.

#### MATERIAS | Electivas

- Innovación para nuevos negocios: Conocerás las tendencias de innovación y pondrás en práctica la creatividad para arribar a nuevas ideas de negocio.

- Herramientas digitales para emprendedores: Analizarás los diferentes modos en que puede aprovecharse las herramientas digitales para posicionar un nuevo emprendimiento, ejercitándote con un proyecto real.

- Formulación y evaluación de proyectos: Aprenderás sobre los principales instrumentos de formulación y evaluación de proyectos de inversión, distinguiendo sus distintos fines.

- Gestión de equipos de alto rendimiento: Conocerás aspectos claves en la conformación y desarrollo de equipos efectivos, a través de la comunicación consciente, gestión de emociones, conformación y coaching de equipos.

- Nuevas Economías: Te permitirá conocer y comprender los fundamentos de los movimientos de Nuevas Economías que están surgiendo a nivel mundial y local con la posibilidad de emprender con propósito y con triple impacto (económico, social y ambiental).

Consultá acá los programas de las materias electivas

[Ir a materias electivas](https://www.lanube.21.edu.ar/materias-electivas)

### ¡Sumate a Experiencias 21!

### Recibí las últimas novedades para descubrir nuevas experiencias.

SUSCRIBITE ACÁ$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/ce-emprendimiento-innovacion$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-colaciones-2026$pea0$,
        $pea0$Colaciones 2026$pea0$, $pea0$"El título que hoy recibís no es la meta final, es la llave maestra para abrir un futuro donde tu propósito transformará el mundo."$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/colaciones-2026 el 2026-11-08. Revisalo antes de publicar.

"El título que hoy recibís no es la meta final, es la llave maestra para abrir un futuro donde tu propósito transformará el mundo."

### COMUNIDAD DE EGRESADOS SIGLO 21

### UN MOMENTO PARA RECORDAR

### BUSCÁ TU CARRERA

¡Llegó el momento de celebrar tu logro! Buscá tu carrera para conocer en qué acto participás e inscribite para ser parte de esta ceremonia tan esperada.

### Carreras de Pregrado

Martes 17 de noviembre

Lugar

Vestimenta

Horarios

Quorum Córdoba Hotel

Elegante sport, sin toga

Presentarse a las 8:30 am

Vestimenta

Horarios

### Carreras de Grado

17, 18 y 19 de noviembre

Lugar

Vestimenta

Horarios

Quorum Córdoba Hotel

Toga y birrete (obligatorio DNI)

Presentarse 2 hs. antes del horario la ceremonia

Distribución de Actos (Consultá a continuación el turno asignado según tu carrera)

Información clave:

- Llegá con tiempo: Presentate 2 horas antes del horario publicado para tu acto. Esos minutos previos son clave para acreditarte, ubicarte y repasar los detalles del ingreso.​

- Documento en mano: Es imprescindible presentar tu DNI físico original para verificar tu identidad.

### ¿Quiénes pueden participar?

Pueden participar quienes se hayan egresado entre el 1 de septiembre de 2025 y el 31 de agosto de 2026, con

documentación de legajo completa. La inscripción previa es necesaria.

Estudiantes que adeuden documentación obligatoria no podrán participar.

### QUORUM CÓRDOBA HOTEL

Salón de Convenciones, Av. La Voz del Interior 7447, Córdoba.

¿Cómo llegar?

Transporte público: Líneas de colectivos 21 y 25 directas.

Estacionamiento privado y gratuito disponible para graduados e invitados.

### Recomendaciones para el día del acto

01

Horarios de acreditación obligatoria

Pregrado debe estar 1h30 antes de la hora estipulada. Grado y Posgrado 2hs antes para acreditación, retiro de toga y networking previo.

02

Documentación requerida

Es obligatorio llevar tu DNI físico (o constancia de trámite en curso con foto) para poder retirar la toga y subir al escenario principal.

03

Acceso a familiares e invitados

Los familiares e invitados deben acreditarse junto con el egresado antes de ingresar al acto. Por eso, es fundamental respetar los horarios de llegada indicados para realizar la acreditación de todos a tiempo. Quienes no puedan asistir podrán acceder a la transmisión digital en directo.

04

Entrega de título definitivo

Durante el acto presencial se hace entrega de un título simbólico. El diploma final con validez legal se retira con turno previo directamente en el Campus Universitario.

### Compartí tu logro con todos

Familiares y seres queridos que no puedan asistir al hotel podrán vivir cada acto en vivo y en directo.

### Acto 1 - Pregrado

Martes 17- 10:00 hs

[Link del acto](https://www.youtube.com/live/-cbUxvxL3N4?si=cQQDESwGPHu_JW2B)

### Acto 4 - Grado

Jueves 19 - 09:00 hs

[Link del acto](https://www.youtube.com/live/_oS-BBwdiFk)

### Acto 2 - Grado

Miércoles 18 - 09:00 hs

[Link del acto](https://www.youtube.com/live/fmm4UvjKZB8)

### Acto 5 - Grado

Jueves 19 - 14:00 hs

[Link del acto](https://www.youtube.com/live/N7S9ljw2VqI)

### Acto 3 - Grado

Miércoles 18 - 15:00 hs

[Link del acto](https://www.youtube.com/live/k0rAwaVVgac)

### Acto 6 - Grado y Posgrado

Jueves 19 - 18:00 hs

[Link del acto](https://www.youtube.com/live/6DLw8QPnQTU)$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/colaciones-2026$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$plataformas$pea0$), null, 0, $pea0$ln-como-empadronarse-en-klarway$pea0$,
        $pea0$¿Cómo registrarse en Klarway?$pea0$, $pea0$Si todavía no completaste tu empadronamiento (registro), seguí los siguientes pasos:$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/post/como-empadronarse-en-klarway el 2026-11-09. Revisalo antes de publicar.

Si todavía no completaste tu empadronamiento (registro), seguí los siguientes pasos:

**Paso 1:**Abrí la app de Klarway en la computadora y seguí los siguientes pasos para completar el registro.

**Paso 2:**Ingresa con tus datos de alumno (usuario, DNI y contraseña).

**Paso 3:**Se abrirá la siguiente ventana:

**Paso 4:**Hacé click en “CONTINUAR” para tomar una foto de tu rostro. Seguí las instrucciones que aparecen en pantalla. Evita que se visualicen otras personas.

**Ubicá tu rostro dentro del círculo delimitado**

**Paso 5:**Hacé click en “CONTINUAR” para tomar una foto de tu DNI o Pasaporte. Ubica al mismo, dentro del recuadro que aparece en pantalla, lo más cerca posible de la cámara.

**Ubicá tu DNI dentro del rectángulo delimitado**

**Paso 6:**Para terminar, hace click en “GUARDAR”. Inmediatamente el estado incompleto del registro cambiará a **registro aprobado** acompañado de una tilde verde.

**Paso 7:**Hace click en “SALIR” para finalizar este paso que realizará por **única vez.**

| Estado del Registro Tu registro puede tener uno de los siguientes estados: ✅ Aprobado: Puedes rendir el examen. ❌ Rechazado: Debes realizar nuevamente el registro. ⏳ En revisión: Debes esperar la validación para poder rendir. ⚠️ Importante: El proceso de validación puede demorar hasta 24 horas hábiles. |
| --- |$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/post/como-empadronarse-en-klarway$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-comunidad-net$pea0$,
        $pea0$Comunidad Net| La Nube 21$pea0$, $pea0$El espacio de Siglo 21 para que potencies tu red de vinculación desde cualquier lugar.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/comunidad-net el 2026-11-08. Revisalo antes de publicar.

#### ComunidadNET!

#### ¡Despegá tu experiencia con

El espacio de Siglo 21 para que potencies tu red de vinculación desde cualquier lugar.

Es una plataforma pensada para promover tu bienestar y la interacción con otros estudiantes, egresados/as y docentes de la Universidad. Su propósito es que puedas fortalecer vínculos, intercambiar experiencias, participar en actividades y colaborar en proyectos.

Podés unirte a comunidades, participar en eventos, dialogar y compartir ideas. Cada comunidad tiene referentes que te acompañan y guían, promoviendo el crecimiento conjunto.

POTENCIÁ TU PERFIL

ACADÉMICO Y PROFESIONAL

Explorá el espacio de Experiencias 21 y descubrí actividades cocurriculares para tu carrera.

Ingresá al Portal de Recomendaciones para conocer cada propuesta y realizá tu inscripción.

#### ¿Cómo loguearse?

Para ingresar, necesitás iniciar sesión con tu cuenta institucional, ya sea desde la app o desde la web.

#### ¿Cómo loguearse en la versión web? (Desde tu computadora o Celular)

#### 1.

Ingresá a ComunidadNET.

INGRESÁ ACÁ

#### 2.

Iniciá sesión con tu cuenta institucional.

- Esta cuenta es proporcionada por la Universidad Siglo 21.
- Si ya estás logueado, el sistema puede ingresarte directamente.

#### 3.

Pantalla de bienvenida.

- Hacé clic en el botón “Engage” que aparece en el costado izquierdo de la pantalla.

#### 4.

Explorá tus comunidades.

- Vas a ver todas las comunidades de las que formás parte.
- También podés usar el botón “Todas las comunidades” para buscar nuevas y unirte a ellas.

#### ¿Cómo loguearse en la versión Movil desde la APP oficial?

¡Descargá la App de ComunidadNET! Disponible en:

[App Store (iOS)](https://www.apple.com/app-store/)Google Play (Android)

Descargá acá

Iniciá sesión con tu cuenta institucional.

- Si es la primera vez, ingresá usuario y contraseña.
- Si ya usás Office 365 en tu celular, posiblemente no sea necesario volver a loguearte.

[NUSUARIO@soysiglo.21.edu.ar](mailto:NUSUARIO@soysiglo.21.edu.ar)

Accedé a tus comunidades

Tocá el botón “Comunidades” para ver las que integrás y explorar nuevas.​

​​¿Querés publicar algo?​

- ​Hacé clic en el botón azul (esquina inferior derecha).
- Elegí la comunidad, escribí tu mensaje o subí una imagen o GIF.

#### ¿Querés participar?

- Unite a las comunidades que te interesen.
- Compartí ideas, recursos, preguntas o propuestas.
- Interactuá con otras personas comentando o reaccionando a publicaciones, ¡y comenzá a participar!

- Tambien podés explorar más comunidades en el botón "Descubrir más comunidades" y conocer otras que pueden interesarte.

#### ¿Qué vas a encontrar en ComunidadNET?

En la sección ComunidadNET vas a acceder a:

Información sobre las comunidades

Tips para aprovechar la plataforma

Noticias de interés

#### Mira el video del
Tutorial Completo

Potenciá tu experiencia de aprendizaje con comunidades que crecen, se nutren y transforman de acuerdo al uso que le den sus miembros.

#### Comunidades

Gaming

Sumate a este espacio de deportes electrónicos para jugar, competir y conectarte con estudiantes y egresados apasionados por los deportes virtuales.

EmbajadoresNET

Líderes y egresados te esperan para cooperar en proyectos y crear oportunidades de mejora a nivel regional y global. Súmate a este espacio.

InnovadoresNet

Si te interesan los proyectos con impacto positivo, conectate con personas afines para impulsar la innovación y el desarrollo sostenible.

GlobalNET

¿Estudiás o trabajas en el exterior o quieres hacerlo? Sumate a esta comunidad para compartir información, consejos y operaciones.

PartnersNET

¿Necesitás un socio/a o equipo? ¡Encontralo en Partners Net! Conectá talentos, formá alianzas estratégicas y transformá ideas en proyectos colectivos.

English talk

Practicá conversación en inglés y enterate de novedades de internacionalización en esta comunidad. Potenciá tus habilidades junto a otros.

Saber+NET

Si sos docente, investigador, mentor o adscripto, sumate a esta comunidad para compartir ideas y crear proyectos con impacto social y científico.

Club de Lectura

Sumergite en historias, compartí interpretaciones y descubrí autores con estudiantes y egresados en esta comunidad literaria.

Conectados 21

Sumate a esta comunidad de apoyo y socialización para conectar con la Siglo 21. Líderes mentores te guiarán en tus primeros pasos en la Universidad.

Vida 21

Impulsá tu crecimiento personal, académico y profesional a través del arte, el deporte, la salud y el desarrollo junto a otros estudiantes en Vida 21.

Empleabilidad

Potenciá tu perfil profesional, desarrollá habilidades y descubrí oportunidades junto a estudiantes y egresados en esta comunidad.

Emprendedores 21

Sumate y desarrollará tus ideas con estudiantes y egresados emprendedores. Conectá con quienes buscan crecer en el emprendedurismo.

Voluntarios21

Comunidad para estudiantes y egresados interesados en voluntariado. Sumate y transformará realidades junto a otros.

ProtagonistasNET

Si destacás inspirando y reflejando los valores de la Universidad, sumate a esta comunidad para potenciarte y crear acciones de impacto.

ComunidadNET

Explorá, conectá y participá según tus intereses. En este espacio encontrarás herramientas para guiarte y aprovechar al máximo tu experiencia digital.

#### Normas de Participación y convivencia.

A continuación, te compartimos qué comportamientos se recomiendan en el grupo para que se interactúe de forma positiva en la comunidad y la convivencia del grupo sea respetuosa y acogedora:

Sé amable y cordial. Para fomentar un entorno agradable debemos tratarnos con respeto. Podés debatir sobre diversos temas siempre que seas cordial con los demás.

Participá siendo relevante. El contenido que compartas debe ser pertinente y de relevancia, atendiendo a los objetivos del grupo. Está prohibido compartir contenido que incluya desnudos, material sexual explícito y/o pornografía. No se permite el spam ni los enlaces irrelevantes.

No uses lenguaje que incita al odio. Asegúrate de que todos se sientan seguros. No se permiten comentarios degradantes sobre raza, religión, cultura, orientación sexual, sexo y/o identidad.

Sé responsable de tus actos. Sos personalmente responsable de tus palabras y tus actos.

Respetá la privacidad de los demás. Para formar parte de los grupos y chats se requiere confianza mutua. Las conversaciones sinceras y abiertas no dejan de ser confidenciales y privadas. Lo que se comparte en el grupo debe permanecer en él.

Sé honesto. No brindes información engañosa o falsa sobre tus cualificaciones, experiencia laboral, afiliaciones y/o logros.

Respetá los derechos ajenos y la ley. Antes de compartir o usar las obras protegidas por derechos de autor, marcas comerciales, información privada o secretos comerciales de otro usuario, asegurate de tener el derecho legal para hacerlo.

Las publicaciones que infrinjan alguna de estas normas no serán aceptadas y publicadas.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/comunidad-net$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$modalidades$pea0$), null, 0, $pea0$ln-condicion-cursado-ed$pea0$,
        $pea0$CONDICIÓN CURSADO EDUCACIÓN DISTRIBUIDA | La Nube 21$pea0$, $pea0$Te damos la bienvenida a este espacio en dónde vas a conocer los requisitos que necesitas para aprobar tus materias y estar un paso más cerca de tu objetivo.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/condicion-cursado-ed el 2026-11-09. Revisalo antes de publicar.

#### ED

#### Condiciones de Materias

Te damos la bienvenida a este espacio en dónde vas a conocer los requisitos que necesitas para aprobar tus materias y estar un paso más cerca de tu objetivo.

Tipología de

Materias

Condiciones de Materias

Valoración de Tiempo de Entrega

#### Condiciones de Materias

#### Elegí la tipología de materia y revisá las condiciones de cursado

#### Cursado Bimestral

#### Promoción Directa

#### ¿Qué necesitás para lograr esta condición?

#### ¿Cómo aprobar la materia?

Alcanzaste la promoción de la materia, por lo que no necesitas rendir un final. 

La calificación final en la materia será el promedio obtenido entre todos los TPs y los parciales, sean estos aprobados en primera instancia o mediando recuperatorio individual o integrador

#### Promoción Indirecta

Alcanzaste la promoción de la materia, por lo que no necesitas rendir un final. 

La calificación final en la materia será el promedio obtenido entre todos los TPs y los parciales, sean estos aprobados en primera instancia o mediando recuperatorio individual o integrador

#### Regularidad

Para aprobar la materia debes rendir un examen final que tendrá 30 preguntas y deberá aprobarse con nota 4 ó más. 

Contas con un límite de hasta 3 instancias para rendir y un plazo máximo de 18 meses. 

Si te inscribiste a la mesa del examen final y no te presentas, se considerará como ausente y se perderá una de las instancias disponibles

#### ¿Cuál es la condición que queda si no se alcanza la Regularidad de la materia?

#### Libre por Nota

La materia quedará en este estado cuando no se cumplan las condiciones de regularidad.

#### Libre

La materia quedará en este estado cuando se hayan utilizado todas las oportunidades para rendir la materia, sin poder aprobar la misma o cuando haya vencido el plazo para rendir el examen final.

IMPORTANTE:

Si te inscribis para rendir un Examen Recuperatorio o Examen Integrador, y no te presentas a rendir, el examen será calificado con nota cero (0), aplicándose la nota para el cálculo final de la materia.

En los casos en que puedas optar por rendir el recuperatorio de un parcial o el integrador, sólo podrás elegir uno de ellos e inscribirte.

Podrás cancelar tu inscripción al recuperatorio o al integrador hasta 48 horas hábiles antes de la fecha de la mesa correspondiente.

#comp-lq1669sq svg [data-color="1"] {fill: #FFA300;}

#### Conocé cómo hacer tus Trabajos Prácticos y Parciales acá

#### Mirá acá cómo entregar tus TPs

#### ¿Cómo se rinden los Parciales?

#### Valoración de Tiempo de Entrega (sólo para materias MEC)

La Valoración de Tiempo de Entrega define los términos y condiciones aplicables cuando los TPs no son entregados dentro del plazo estipulado en el calendario académico.

Esta valoración, será aplicable solamente en el caso de las materias con tipología MEC y consiste en una reducción en la calificación obtenida en el TP entregado fuera de plazo.

Para esto, vas a tener en la plataforma 3 fechas diferentes:

-Fecha de Inicio de Periodo: Es la fecha desde la cual podes realizar tus TPs.

-La Fecha de Entrega: Esta es la última fecha que tenes disponible para entregar el TP sin que se aplique la Valoración de Tiempo de Entrega.

-Fecha Fin de Periodo: Es la última oportunidad que tenes para entregar el TP, ya que luego de esta, el sistema se bloquea y no admite más presentaciones.

Se van a descontar 5 puntos en Canvas por cada día que transcurra entre la Fecha de Entrega y la Fecha en la que presentaste tu TP.

Si presentaste tu TP entre estas fechas, no se aplica la Valoración de Tiempo de Entrega y tu Calificación será la que obtuviste en Canvas.

Si presentaste tu TP entre estas fechas, se aplica la Valoración de Tiempo de Entrega y a tu Calificación se le descontará 5 puntos por día de atraso.

#### Fecha
Inicio Periodo

#### Fecha
de Entrega

#### Fecha
Fin de Periodo

IMPORTANTE:

No se descontaran mas de 50 puntos por entregar tu TP fuera de plazo. Esto quiere decir, que la nota final no será menor a 5 a causa de la Valoración de Tiempo de Entrega, por lo que tu TP no quedará desaprobado por este motivo.

#comp-lq1669tg5 svg [data-color="1"] {fill: #FFA300;}

Up$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/condicion-cursado-ed$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$modalidades$pea0$), null, 0, $pea0$ln-condicion-cursado-presencialidad-distribuida$pea0$,
        $pea0$CONDICIÓN CURSADO PRESENCIAL | La Nube 21$pea0$, $pea0$Te damos la bienvenida a este espacio en dónde vas a conocer los requisitos que necesitas para aprobar tus materias y estar un paso más cerca de tu objetivo.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/condicion-cursado-presencialidad-distribuida el 2026-11-09. Revisalo antes de publicar.

#### PD

#### Condiciones de Materias

Te damos la bienvenida a este espacio en dónde vas a conocer los requisitos que necesitas para aprobar tus materias y estar un paso más cerca de tu objetivo.

mENU

Tipología de

Materias

Condiciones de Materias

Valoración de Tiempo de Entrega

#### ¿Cómo apruebo la materia?

#### Cursado Cuatrimestral

#### Promoción Directa

#### ¿Qué necesitás para lograr esta condición?

• 3 de 4 TPs con nota 7 ó más.

• 2 parciales con nota 7 ó más, sea en instancia de parcial, recuperatorio o integrador.

• 75% de asistencia.

#### ¿Cuáles son los próximos pasos?

Alcanzaste la promoción de la materia, por lo que no necesitas rendir un final.

La calificación final en la materia será el promedio obtenido entre todos los TPs y los parciales, sean estos aprobados en primera instancia o mediando recuperatorio individual o integrador

#### Promoción Indirecta

• 4 de 4 TPs con nota 7 ó más.

• 2 parciales con nota 5 ó 6, sea en instancia de parcial, recuperatorio o integrador.

• 75% de asistencia.

Alcanzaste la promoción de la materia, por lo que no necesitas rendir un final.

La calificación final en la materia será el promedio obtenido entre todos los TPs y los parciales, sean estos aprobados en primera instancia o mediando recuperatorio individual o integrador

#### Regularidad

• 3 de 4 TPs con nota 5 ó más.

• 2 parciales con nota 5 ó más, sea en instancia de parcial, recuperatorio o integrador.

• 75% de asistencia.

Para aprobar la materia debes rendir un examen final que tendrá 30 preguntas y en caso de aprobarlo pasarás a una instancia Oral. La nota de aprobación es 4.

Contas con un límite de hasta 3 instancias para rendir. Podrás rendir este examen en una de las mesas habilitadas dentro de los turnos de exámenes comprendidos en los siguientes 18 meses.

Si te inscribiste a la mesa del examen final y no te presentas, se considerará como ausente y se perderá una de las instancias disponibles.

#### ¿Cuál es la condición que queda si no se alcanza la Regularidad de la materia?

#### Libre por Nota:

La materia quedará en este estado cuando no se cumplan las condiciones de regularidad.

● Este estado habilita la instancia de Final de 50 preguntas y en caso de aprobarlo pasarás a una instancia Oral. El examen se aprueba con nota 4 ó más.

● Podrás rendir este examen en una de las mesas habilitadas dentro de los turnos de exámenes comprendidos en los siguientes 3 meses.

● En caso de no aprobar dentro de ese plazo la materia pasa al estado Libre y deberás recursar la asignatura.

● Si te inscribiste a la mesa del examen final y no te presentas, se considerará como ausente y se perderá la instancia disponible.

#### Libre:

La materia quedará en este estado cuando se hayan utilizado todas las oportunidades para rendir la materia, sin poder aprobar la misma o cuando haya vencido el plazo para rendir el examen final.

• Esta condición implica que se debe recursar la asignatura.

IMPORTANTE:

Si te inscribis para rendir un Examen Recuperatorio o Examen Integrador, y no te presentas a rendir, el examen será calificado con nota cero (0), aplicándose la nota para el cálculo final de la materia.

- En los casos en que puedas optar por rendir el recuperatorio de un parcial o el integrador, sólo podrás elegir uno de ellos e inscribirte.

- Podrás cancelar tu inscripción al recuperatorio o al integrador hasta 48 horas hábiles antes de la fecha de la mesa correspondiente.

#comp-m2xnyapp1 svg [data-color="1"] {fill: #FFA300;}

valoracion tiempo entrega

#### Conocé cómo hacer tus Trabajos Prácticos y Parciales acá

#### Mirá acá cómo entregar tus TPs

#### ¿Cómo se rinden los Parciales?

#### Valoración de Tiempo de Entrega (sólo para Materias MEC)

La Valoración de Tiempo de Entrega define los términos y condiciones aplicables cuando los TPs no son entregados dentro del plazo estipulado en el calendario académico.

Esta valoración, será aplicable solamente en el caso de las materias con tipología MEC y consiste en una reducción en la calificación obtenida en el TP entregado fuera de plazo.

Para esto, vas a tener en la plataforma 3 fechas diferentes:

-Fecha de Inicio de Periodo: Es la fecha desde la cual podes realizar tus TPs.

-La Fecha de Entrega: Esta es la última fecha que tenes disponible para entregar el TP sin que se aplique la Valoración de Tiempo de Entrega.

-Fecha Fin de Periodo: Es la última oportunidad que tenes para entregar el TP, ya que luego de esta, el sistema se bloquea y no admite más presentaciones.

Se van a descontar 5 puntos en Canvas por cada día que transcurra entre la Fecha de Entrega y la Fecha en la que presentaste tu TP.

Si presentaste tu TP entre estas fechas, se aplica la Valoración de Tiempo de Entrega y a tu Calificación se le descontará 5 puntos por día de atraso.

Si presentaste tu TP entre estas fechas, no se aplica la Valoración de Tiempo de Entrega y tu Calificación será la que obtuviste en Canvas.

#### Fecha
Inicio Período

#### Fecha
de Entrega

#### Fecha
Fin de Período

IMPORTANTE:

No se descontarán más de 50 puntos por entregar tu TP fuera de plazo. Esto quiere decir, que la nota final no será menor a 5 a causa de la Valoración de Tiempo de Entrega, por lo que tu TP no quedará desaprobado por este motivo.

#comp-m2xnyaru svg [data-color="1"] {fill: #FFA300;}

#### ¿Cursas materias MAP?

Ingresá y conocé todo sobre el cursado de tus MAP "Materias de Aplicación Pre-Profesional".

Up$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/condicion-cursado-presencialidad-distribuida$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$modalidades$pea0$), null, 0, $pea0$ln-condiciones-de-cursado-presencial$pea0$,
        $pea0$CONDICIÓN CURSADO PRESENCIAL | La Nube 21$pea0$, $pea0$Te damos la bienvenida a este espacio en dónde vas a conocer los requisitos que necesitas para aprobar tus materias y estar un paso más cerca de tu objetivo.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/condiciones-de-cursado-presencial el 2026-11-09. Revisalo antes de publicar.

#### P

#### Condiciones de Materias

Te damos la bienvenida a este espacio en dónde vas a conocer los requisitos que necesitas para aprobar tus materias y estar un paso más cerca de tu objetivo.

mENU

Tipología de

Materias

Condiciones de Materias

Valoración de Tiempo de Entrega

IMPORTANTE:

Las calificaciones de los Trabajos Prácticos (TP) publicadas en tu Aula Virtual (CANVAS) pueden ser ajustadas por tu docente, de acuerdo con el acuerdo pedagógico y tu desempeño en las actividades evaluativas de proceso.

Asimismo, el cuerpo docente podrá asignar una nota de proceso, la cual se promediará junto con las calificaciones de los Trabajos Prácticos y los exámenes. En caso de no presentar un Trabajo Práctico, se registrará una calificación de 0 (cero) para esa entrega, la cual también formará parte del promedio final.

#comp-lews3obs4 svg [data-color="1"] {fill: #FFA300;}

#### Condiciones de Materias

#### Elegí la tipología de materia y revisá las condiciones de cursado

#### Cursado Cuatrimestral

#### Promoción Directa

#### ¿Qué necesitás para lograr esta condición?

#### ¿Cómo aprobar la materia?

Alcanzaste la promoción de la materia, por lo que no necesitas rendir un final. 

La calificación final en la materia será el promedio obtenido entre todos los TPs y los parciales, sean estos aprobados en primera instancia o mediando recuperatorio individual o integrador

#### Promoción Indirecta

Alcanzaste la promoción de la materia, por lo que no necesitas rendir un final. 

La calificación final en la materia será el promedio obtenido entre todos los TPs y los parciales, sean estos aprobados en primera instancia o mediando recuperatorio individual o integrador

#### Regularidad

Para aprobar la materia debes rendir un examen final que tendrá 30 preguntas y en caso de aprobarlo pasarás a una instancia Oral. La nota de aprobación es 4.

Contas con un límite de hasta 3 instancias para rendir. Podrás rendir este examen en una de las mesas habilitadas dentro de los turnos de exámenes comprendidos en los siguientes 18 meses. 

Si te inscribiste a la mesa del examen final y no te presentas, se considerará como ausente y se perderá una de las instancias disponibles

#### ¿Cuál es la condición que queda si no se alcanza la Regularidad de la materia?

#### Libre por Nota

La materia quedará en este estado cuando no se cumplan las condiciones de regularidad.

#### Libre

La materia quedará en este estado cuando se hayan utilizado todas las oportunidades para rendir la materia, sin poder aprobar la misma o cuando haya vencido el plazo para rendir el examen final.

IMPORTANTE:

Si te inscribis para rendir un Examen Recuperatorio o Examen Integrador, y no te presentas a rendir, el examen será calificado con nota cero (0), aplicándose la nota para el cálculo final de la materia.

- En los casos en que puedas optar por rendir el recuperatorio de un parcial o el integrador, sólo podrás elegir uno de ellos e inscribirte.

- Podrás cancelar tu inscripción al recuperatorio o al integrador hasta 48 horas hábiles antes de la fecha de la mesa correspondiente.

#comp-li0nc5493 svg [data-color="1"] {fill: #FFA300;}

valoracion tiempo entrega

#### Conocé cómo hacer tus Trabajos Prácticos y Parciales acá

#### Mirá acá cómo entregar tus TPs

#### ¿Cómo se rinden los Parciales?

#### Valoración de Tiempo de Entrega (sólo para Materias MEC)

La Valoración de Tiempo de Entrega define los términos y condiciones aplicables cuando los TPs no son entregados dentro del plazo estipulado en el calendario académico.

Esta valoración, será aplicable solamente en el caso de las materias con tipología MEC y consiste en una reducción en la calificación obtenida en el TP entregado fuera de plazo.

Para esto, vas a tener en la plataforma 3 fechas diferentes:

-Fecha de Inicio de Periodo: Es la fecha desde la cual podes realizar tus TPs.

-La Fecha de Entrega: Esta es la última fecha que tenes disponible para entregar el TP sin que se aplique la Valoración de Tiempo de Entrega.

-Fecha Fin de Periodo: Es la última oportunidad que tenes para entregar el TP, ya que luego de esta, el sistema se bloquea y no admite más presentaciones.

Se van a descontar 5 puntos en Canvas por cada día que transcurra entre la Fecha de Entrega y la Fecha en la que presentaste tu TP.

Si presentaste tu TP entre estas fechas, se aplica la Valoración de Tiempo de Entrega y a tu Calificación se le descontará 5 puntos por día de atraso.

Si presentaste tu TP entre estas fechas, no se aplica la Valoración de Tiempo de Entrega y tu Calificación será la que obtuviste en Canvas.

#### Fecha
Inicio Período

#### Fecha
de Entrega

#### Fecha
Fin de Período

IMPORTANTE:

No se descontarán más de 50 puntos por entregar tu TP fuera de plazo. Esto quiere decir, que la nota final no será menor a 5 a causa de la Valoración de Tiempo de Entrega, por lo que tu TP no quedará desaprobado por este motivo.

#comp-le601ux31 svg [data-color="1"] {fill: #FFA300;}

Up$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/condiciones-de-cursado-presencial$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$modalidades$pea0$), null, 0, $pea0$ln-condiciones-de-cursado$pea0$,
        $pea0$CONDICIÓN CURSADO EDUCACIÓN DISTRIBUIDA HOME | La Nube 21$pea0$, $pea0$mENU$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/condiciones-de-cursado el 2026-11-09. Revisalo antes de publicar.

mENU

#### EDH

#### Condiciones de Materias

Te damos la bienvenida a este espacio en dónde vas a conocer los requisitos que necesitas para aprobar tus materias y estar un paso más cerca de tu objetivo.

Tipología de

Materias

Condiciones de Materias

Valoración de Tiempo de Entrega

#### Condiciones de Materias

#### Elegí la tipología de materia y revisá las condiciones de cursado

#### Cursado Bimestral

#### Promoción Directa

#### ¿Qué necesitás para lograr esta condición?

#### ¿Cómo aprobar la materia?

Alcanzaste la promoción de la materia, por lo que no necesitas rendir un final. 

La calificación final en la materia será el promedio obtenido entre todos los TPs y los parciales, sean estos aprobados en primera instancia o mediando recuperatorio individual o integrador

#### Promoción Indirecta

Alcanzaste la promoción de la materia, por lo que no necesitas rendir un final. 

La calificación final en la materia será el promedio obtenido entre todos los TPs y los parciales, sean estos aprobados en primera instancia o mediando recuperatorio individual o integrador

#### Regularidad

Para aprobar la materia debes rendir un examen final que tendrá 30 preguntas y deberá aprobarse con nota 4 ó más. 

Contas con un límite de hasta 3 instancias para rendir y un plazo máximo de 18 meses. 

Si te inscribiste a la mesa del examen final y no te presentas, se considerará como ausente y se perderá una de las instancias disponibles

#### ¿Cuál es la condición que queda si no se alcanza la Regularidad de la materia?

#### Libre por Nota

La materia quedará en este estado cuando no se cumplan las condiciones de regularidad.

#### Libre

La materia quedará en este estado cuando se hayan utilizado todas las oportunidades para rendir la materia, sin poder aprobar la misma o cuando haya vencido el plazo para rendir el examen final.

IMPORTANTE:

Si te inscribis para rendir un Examen Recuperatorio o Examen Integrador, y no te presentas a rendir, el examen será calificado con nota cero (0), aplicándose la nota para el cálculo final de la materia.

En los casos en que puedas optar por rendir el recuperatorio de un parcial o el integrador, sólo podrás elegir uno de ellos e inscribirte.

Podrás cancelar tu inscripción al recuperatorio o al integrador hasta 48 horas hábiles antes de la fecha de la mesa correspondiente.

#comp-li0n97pt svg [data-color="1"] {fill: #FFA300;}

#### Conocé cómo hacer tus Trabajos Prácticos y Parciales acá

#### Mirá acá cómo entregar tus TPs

#### ¿Cómo se rinden los Parciales?

#### Valoración de Tiempo de Entrega

La Valoración de Tiempo de Entrega define los términos y condiciones aplicables cuando los TPs no son entregados dentro del plazo estipulado en el calendario académico.

Consiste en una reducción en la calificación obtenida en el TP entregado fuera de plazo.

Para esto, vas a tener en la plataforma 3 fechas diferentes:

-Fecha de Inicio de Periodo: Es la fecha desde la cual podes realizar tus TPs.

-La Fecha de Entrega: Esta es la última fecha que tenes disponible para entregar el TP sin que se aplique la Valoración de Tiempo de Entrega.

-Fecha Fin de Periodo: Es la última oportunidad que tenes para entregar el TP, ya que luego de esta, el sistema se bloquea y no admite más presentaciones.

Se van a descontar 5 puntos en Canvas por cada día que transcurra entre la Fecha de Entrega y la Fecha en la que presentaste tu TP.

Si presentaste tu TP entre estas fechas, se aplica la Valoración de Tiempo de Entrega y a tu Calificación se le descontará 5 puntos por día de atraso.

Si presentaste tu TP entre estas fechas, no se aplica la Valoración de Tiempo de Entrega y tu Calificación será la que obtuviste en Canvas.

#### Fecha
Inicio Periodo

#### Fecha
de Entrega

#### Fecha
Fin de Periodo

IMPORTANTE:

No se descontaran mas de 50 puntos por entregar tu TP fuera de plazo. Esto quiere decir, que la nota final no será menor a 5 a causa de la Valoración de Tiempo de Entrega, por lo que tu TP no quedará desaprobado por este motivo.

#comp-le5z1pjp1 svg [data-color="1"] {fill: #FFA300;}

Up$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/condiciones-de-cursado$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-correlativas$pea0$,
        $pea0$Correlativas | La Nube 21$pea0$, $pea0$Un plan de correlatividades establece el orden en que se deben cursar las materias del plan de estudio.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/correlativas el 2026-11-08. Revisalo antes de publicar.

#### Materias Correlativas

#### ¿QUÉ SON LAS CORRELATIVAS?

Un plan de correlatividades establece el orden en que se deben cursar las materias del plan de estudio.

Para realizar la inscripción a una materia, es necesario tener regular sus correlativas. Para aprobar/promocionar la materia sus correlativas deben estar previamente aprobadas.

Es posible promocionar una materia correlativa, siempre y cuando su correlativa anterior sea aprobada dentro de los 60 días de finalizada la materia. Si no aprobas la materia correlativa anterior en ese plazo, la materia quedará Regular y deberás rendir el examen final.

#### Revisá las Correlativas y Programa de cada Materia

Para conocer si una materia tiene correlativas, deberás ingresar a tu Portal de Estudiantes, hacer click en tu Carrera y revisar el Plan de Estudio.

Si querés ver las correlativas que tiene cada materias, deberás hacer click en Ver Correlativas. Si necesitas ver el programa de la materia, hacé click en Ver Programa.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/correlativas$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-defensa-oral$pea0$,
        $pea0$Defensa Oral | La Nube 21$pea0$, $pea0$Pasos para solicitar Mesa$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/defensa-oral el 2026-11-09. Revisalo antes de publicar.

#### Te damos la
Bienvenida a la tercera etapa de tu proceso
DEFENSA ORAL

Pasos para solicitar Mesa

Asignación fecha Defensa Oral

Evaluación Defensa Oral

Info adicional viaje a Córdoba

IMPORTANTE:

Todas las defensas orales se realizan de manera presencial en el Campus de la Universidad Siglo 21.

#### ¿CÓMO DEBO SOLICITAR MESA PARA RENDIR MI DO?

​​Cuando recibas la aprobación de la Comisión Académica Evaluadora (CAE), quedarás habilitado/a para comenzar con el proceso para la solicitud de tu defensa oral.

​​​

Importante: Si estudiás en modalidad a distancia (modalidad Educación Distribuida ó Educación Distribuida Home), debés tener EFIP II aprobado antes de solicitar la mesa de defensa oral (excepto en la Licenciatura en Educación, donde no se exige este requisito).

#comp-mihuohnh svg [data-color="1"] {fill: #F0F0F0;}

### tasa de graduación

Aboná el arancel para iniciar el proceso.

VER MÁS >

#comp-mihuohob svg [data-color="1"] {fill: #002323;}

### proceso de visado

Controles automáticos de tu legajo.

VER MÁS >

#comp-mihuohol svg [data-color="1"] {fill: #A0EC88;}

### completÁ EL formulario

Enviá tu solicitud de defensa.

VER MÁS >

### asignación de mesa

Recibí tu fecha para rendir.

VER MÁS >

#comp-mihuohp11 svg [data-color="1"] {fill: #002323;}

### INSTANCIA EVALUATIVA
FINAL

Presentá tu defensa final en el Cmpus de la Universidad.

VER MÁS >

IMPORTANTE:

Recordá que debés tener la matrícula del semestre en curso abonada tanto al momento de iniciar el proceso de visado analítico como al momento de rendir tu defensa oral.​​

#### TASA DE GRADUACIÓN

Los egresados de carreras de GRADO y CICLOS DE COMPLEMENTACION (Excepto Escribanía) cualquiera sea la modalidad, deberán abonar la Tasa de Graduación para llevar adelante el VISADO previo a rendir la DEFENSA ORAL*.

*(para alumnos DISTANCIA no es necesario abonar la TASA previo a rendir el EFIP II, ya que la validación académica para rendir EFIP II es automática)

Una vez regularizado el Seminario Final y aprobado por la CAE, se genera automáticamente un ticket de graduación que lo veras reflejado en Pago Electrónico.

Es obligatorio abonar la Tasa de Graduación para que pueda iniciar el proceso de visado.

¿Que contempla la TASA de GRADUACION?

- Constancia de egreso o certificado de titulación en trámite (a requerimiento del interesado)
- Gestión del diploma y certificado analítico oficial digital y en papel de seguridad, con la respectiva legalización ministerial.
- Opción de envío del título a CAU (para aquellos egresados que son de otras ciudades/provincias).
- Invitación al acto de colación para el egresado e invitados (la cantidad de invitados te será comunicada por correo institucional)
- Acceso a evento de colación.

#### PROCESO DE VISADO

El Visado para Defensa Oral es la constancia que indica que no adeudas ninguna materia de tu currícula y que cumplís con los visados de Documentación, Administrativo, Biblioteca y CAE, según tu nivel de estudio.

El proceso comienza de manera automática una vez abonada la Tasa de Graduación, siempre y cuando cumplas con los requisitos académicos:

#comp-mij0a3j3 svg [data-color="1"] {fill: #002323;}

Requisitos:​

Alumno Presencial y PH: todas las materias aprobadas + electivas + Seminario Final en condición de regular.

Alumno ED y EDH: todas las materias aprobadas + electivas + EFIP II aprobado + Seminario Final en condición de regular.

#comp-mij0b6vz svg [data-color="1"] {fill: #002323;}

El visado consta de 4 controles:

Documentación: verificación del legajo y datos personales.

Administrativo: libre deuda.

Biblioteca: control de publicaciones o préstamos.

CAE: validación académica final.

Además. también se va a realizar el ​ Visado CAE (Comisión Académica Evaluadora), donde se validará según corresponda, que el Trabajo Final presentado esté aprobado.

#comp-mij0bkwn svg [data-color="1"] {fill: #002323;}

Tené en cuenta lo siguiente:

- No debés solicitar el visado, el proceso se inicia solo.
- Vas recibiendo mails en la casilla de mail registrada durante cada etapa del visado.
- Cuando finaliza el trámite, llega un correo de confirmación.
- Una vez iniciado el trámite de tu visado, podrás consultar el estado en tu Portal de Estudiantes, en la sección Exámenes.

El trámite puede demorar hasta 10 días hábiles para finalizar y puedas avanzar con la solicitud de mesa de defensa oral.

No es necesario que te contactes con la Universidad para iniciar con el proceso de visado ya que inicia de manera automática. A medida que el proceso avance, vas a recibir notificaciones a tu correo electrónico que informaste en tus datos personales en tu Portal de Estudiantes.

#### FORMULARIO DE SOLICITUD DE MESA

IMPORTANTE:

Si cursas en la modalidad virtual ED o EDH, te recordamos que deberás tener aprobado tu EFIP II para poder acceder a la defensa oral

Si no completás el formulario, no podremos avanzar con la coordinación de tu mesa de examen.

En este formulario debés cargar el link al documento final de tu Trabajo Final de Grado, asegurándote de que corresponda a la última versión actualizada (o corregida, en caso de que así lo haya solicitado la CAE).

COMPLETÁ EL FORMULARIO DE SOLICITUD DE MESA AQUÍ

Una vez solicitada la fecha para la Defensa Oral, la misma ya no puede anularse.

#### ¿Cuándo me asignan la fecha de mi Defensa Oral?

El Área de TFG autorizará la constitución de la mesa examinadora correspondiente, teniendo un plazo de 10 días hábiles para la coordinación, Empiezan a transcurrir desde el momento que solicitaste la mesa cumpliendo con TODOS los requisitos mencionados anteriormente.

En caso de que adeudes algún requisito, la mesa NO se coordinará hasta que regularices tu situación. 

Transcurrido el plazo te enviaremos vía mail la citación formal con la fecha y hora de tu defensa oral, una vez que recibas el mail deberás responder el mismo confirmando tu asistencia.

Recomendaciones para el día de la Defensa Oral

Recordá el día de tu defensa oral traer tu DNI y presentarte en Bedelía del edificio ARCOR

#### ¿Cómo se evalúa mi Defensa Oral?

El Examen Oral Final se estructura en dos instancias:

- PROCEDES A LA PRESENTACIÓN ORAL DEL TRABAJO FINAL DE GRADO (TFG).

- Tu exposición debe durar unos 35 minutos, luego los docentes cuentan con 10 minutos para realizar preguntas y observaciones.

- No lleves notebook ni pendrive. Asegurate de tener tu presentación (en Prezi, PowerPoint o Canva) guardada en tu correo electrónico, para poder abrirla desde la PC del aula.

- La presentación debe ser un apoyo visual, con títulos, esquemas y puntos clave. Evitá sobrecargarla con texto. Usa la presentación para reforzar tu discurso, no para leerla.

- Habla con seguridad, utilizá vocabulario técnico y demostrá confianza en tu dominio del tema.

2. EL COMITÉ DE EVALUACIÓN PUEDE PLANTEARTE PREGUNTAS SOBRE ASPECTOS ABORDADOS EN LA PRESENTACIÓN ORAL.

El comité hará preguntas basadas en tu presentación. Durante esta segunda parte, se evaluarán:

- La calidad y creatividad de los recursos tecnológicos utilizados.

- El dominio del tema tratado en el Trabajo Final de Grado.

- La integración de los conocimientos adquiridos a lo largo de la Carrera y su aplicación en el trabajo final.

- La solidez y fundamentación de tus respuestas ante las preguntas del tribunal.

Al final del examen, los docentes te informarán la calificación obtenida y te entregarán el acta de la Defensa Oral, la cual se cargará en el sistema el mismo día, dando inicio al proceso de titulación.​

#### ¿Es tu primera vez en el campus?

#### Conocé todo lo que necesitas
saber para venir

¡ES UN MOMENTO ÚNICO Y QUE JAMÁS OLVIDARÁS, ¡Vivilo con plena felicidad!

Es importante que disfrutes este momento y que puedas vivirlo con tranquilidad, confianza y orgullo por todo el camino recorrido hasta ahora. Llegar hasta acá no fue casualidad: es el resultado de tu esfuerzo, tu constancia y tu compromiso.

Recordá que este no es un examen más; es el último paso para convertirte en profesional. Por eso, es fundamental que transmitas una actitud segura, sólida y coherente durante tu exposición, demostrando no solo lo que aprendiste, sino también cómo sos capaz de aplicar ese conocimiento en un contexto real.

Imaginá que quien te está escuchando es un cliente, un jefe o una organización que te convocó porque valora tu mirada y confía en tu propuesta. Pensá tu presentación desde ese lugar: como una oportunidad para mostrar tu capacidad, tu criterio y tu potencial profesional.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/defensa-oral$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-desarrollo-y-proposito$pea0$,
        $pea0$Desarrollo$pea0$, $pea0$Desarrollo$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/desarrollo-y-prop%C3%B3sito el 2026-11-08. Revisalo antes de publicar.

Desarrollo

Impulsamos profesionales con mirada crítica y compromiso

En este espacio encontrás propuestas pensadas para acompañar tu crecimiento personal y profesional a lo largo de tu vida académica. Vas a adquirir nuevas herramientas, fortalecer tus habilidades y ganar confianza para alcanzar tus objetivos.

Cada experiencia suma valor a tu formación, amplía tus conocimientos y te prepara para enfrentar nuevos desafíos con mayor autonomía.

POTENCIÁ TU PERFIL

ACADÉMICO Y PROFESIONAL

Explorá el espacio de Experiencias 21 y descubrí actividades cocurriculares para tu carrera.

Ingresá al Portal de Recomendaciones para conocer cada propuesta y realizá tu inscripción.

Sumá un diferencial a tu titulo

Accedé a talleres que fortalecen tus competencias y amplían tus conocimientos.

Al completar estos talleres obtenés suplemento al título, un reconocimiento académico que suma valor real a tu formación y puede marcar la diferencia en tu perfil profesional.

### SUSCRIBITE

### AL NEWSLETTER

### ¡Sumate a Experiencias 21!

### Enterate antes que nadie de todas las experiencias, actividades y novedades.

 Recibí contenido exclusivo y mantenete al día con todo lo que pasa en Experiencias 21.

SUSCRIBITE ACÁ$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/desarrollo-y-prop%C3%B3sito$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$atencion-y-derivaciones$pea0$), null, 0, $pea0$ln-directores-de-carrera$pea0$,
        $pea0$Directores de Carrera$pea0$, $pea0$Ciencias de la Administración y Management$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/post/directores-de-carrera el 2026-11-09. Revisalo antes de publicar.

**Ciencias de la Administración y Management**

Decana****Dra. Analía Nievas

| Carrera | Director | Mail |  |  |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |
| Actuario | Nicolás Quaglia | nicolas.quaglia@ues21.edu.ar |  |  |
| Contador Público |  |  |  |  |
| Lic en Logística Global | Gabriela Vázquez | Gabriela.Vazquez@ues21.edu.ar |  |  |
| Lic. En Administración | Marcelo Lesta | marcelo.lesta@ues21.edu.ar |  |  |
| Lic. En Administración Agraria | Esteban Papallini | esteban.papalini@ues21.edu.ar |  |  |
| Lic. en Administración de Servicios de Salud | Pilar Maure | pilar.maure@ues21.edu.ar |  |  |
| Lic. En Administración Hotelera | Maximiliano Perez | maximiliano.perez@ues21.edu.ar |  |  |
| Lic. en Ambiente y Energías Renovables | Gabriel Imwinkelried | gabriel.imwinkelried@ues21.edu.ar |  |  |
| Lic. En Comercialización - Marketing | Luciana Mudry | luciana.mudry@ues21.edu.ar |  |  |
| Lic. En Comercio Internacional | Gabriela Vázquez | Gabriela.Vazquez@ues21.edu.ar |  |  |
| Lic. en Emprendimiento | Marcelo Lesta | marcelo.lesta@ues21.edu.ar |  |  |
| Lic. En Gestión Ambiental | Gabriel Imwinkelried | gabriel.imwinkelried@ues21.edu.ar |  |  |
| Lic. En Gestión de Recursos Humanos | Marcelo Lesta | marcelo.lesta@ues21.edu.ar |  |  |
| Lic. En Gestión Turística | Maximiliano Perez | maximiliano.perez@ues21.edu.ar |  |  |
| Licenciatura en Finanzas | Nicolás Quaglia | nicolas.quaglia@ues21.edu.ar |  |  |
| Licenciatura en Inteligencia de Negocios Digitales | Nicolás Quaglia | nicolas.quaglia@ues21.edu.ar |  |  |
| Tec en Gestión Administrativas de Servicios de Salud | Pilar Maure | pilar.maure@ues21.edu.ar |  |  |
| Tec. En Administración y Gestión Tributaria |  |  |  |  |
| Tec. En Dirección de Equipos de venta | Luciana Mudry | luciana.mudry@ues21.edu.ar |  |  |
| Tec. En Gestión Contable e impositiva |  |  |  |  |
| Tec. En Gestión de Empresas Familiares | Pilar Maure | pilar.maure@ues21.edu.ar |  |  |
| Tec. En Marketing y Publicidad Digital | Luciana Mudry | luciana.mudry@ues21.edu.ar |  |  |
| Tec. En Relaciones Laborales | Marcelo Lesta | marcelo.lesta@ues21.edu.ar |  |  |
| Tec. Univ. En Gestión del Clima Laboral de la Organización | Marcelo Lesta | marcelo.lesta@ues21.edu.ar |  |  |
| Tec. Univ. En Gestión y Auditorías Ambientales | Gabriel Imwinkelried | gabriel.imwinkelried@ues21.edu.ar |  |  |
| Tec. Univ. En Recursos Turísticos | Maximiliano Perez | maximiliano.perez@ues21.edu.ar |  |  |

**Ciencias del Derecho**

Decano****Ab. Paula Alladio

| Carrera | Director | Mail |
| --- | --- | --- |
|  |  |  |
| Abogacía | Ab. Guadalupe Virasoro | guadalupe.virasoro@ues21.edu.ar |
| Escribanía | Escr. Federico Miguel | federico.miguel@ues21.edu.ar |
| Lic en Criminología y Seguridad | Javier Chilo | javier.chilo@ues21.edu.ar |
| Lic. en Desarrollo de Negocios Inmobiliarios | Sebastián Nini | sebastian.nini@ues21.edu.ar |
| Martillero, Corredor Público y Corredor Inmobiliario | Sebastián Nini | sebastian.nini@ues21.edu.ar |
| Procurador | Ab. Guadalupe Virasoro | guadalupe.virasoro@ues21.edu.ar |
| Tec. En investigación de la escena del crimen | Javier Chilo | javier.chilo@ues21.edu.ar |
| Tecnicatura Universitaria En Administración Y Auditoría de Propiedad horizontal​ | Sebastián Nini | sebastian.nini@ues21.edu.ar |

**Ciencias Aplicadas**

Decano Carlos Ramonda

| Carrera | Director | Mail |
| --- | --- | --- |
|  |  |  |
| Ingeniería en Innovación y Desarrollo | Sergio Fritz | sergio.fritz@ues21.edu.ar |
| Ingeniería en Software | Luis Bravo | luis.bravo@ues21.edu.ar |
| Ingeniería en Transportes y Caminos |  |  |
| Lic en Publicidad | Dis. Gráf. Fernanda Vincenti | Fernanda.Vincenti@ues21.edu.ar |
| lic. en Administración de Infraestructura Tecnológica | Sergio Fritz | sergio.fritz@ues21.edu.ar |
| Lic. en Bioinformática | Lic. Martina Ceballos | martina.ceballos@ues21.edu.ar |
| lic. en Ciencias de Datos | Lic. Marcos Augusto Ugarte | marcos.ugarte@ues21.edu.ar |
| Lic. En Diseño de Indumentaria y Textil | Candelaria Urrere Pon | candelaria.urrerepon@ues21.edu.ar |
| Lic. En Diseño Gráfico | Dis. Gráf. Fernanda Vincenti | Fernanda.Vincenti@ues21.edu.ar |
| Lic. En Diseño Industrial | Santiago Cantera | Santiago.Cantera@ues21.edu.ar |
| Lic. en Diseño y Animación Digital | Roberto Benedetti | Roberto.Benedetti@ues21.edu.ar |
| Lic. en Gestión de la Información | Sergio Fritz | sergio.fritz@ues21.edu.ar |
| Lic. en Hidrocarburos y Geociencias | Marcela Maldonado | Marcela.Maldonado@ues21.edu.ar |
| Lic. en Higiene, Seguridad y Medio ambiente del Trabajo | Mgter. Matías Andrés Aparicio | Matias.Aparicio@ues21.edu.ar |
| Lic. En Informatica | Luis Bravo | luis.bravo@ues21.edu.ar |
| lic. en Inteligencia Artificial y Robótica | Sergio Fritz | sergio.fritz@ues21.edu.ar |
| lic. en Matemática | Mónica Campos | monica.campos@ues21.edu.ar |
| lic. en Seguridad Informática | Lic. Emanuel Vilas | emmanuel.vilas@ues21.edu.ar |
| Tec. En Higiene y Seguridad Laboral | Mgter. Matías Andrés Aparicio | Matias.Aparicio@ues21.edu.ar |
| Tec. Univ. En Diseño y Animación Digital | Roberto Benedetti | Roberto.Benedetti@ues21.edu.ar |
| Tec. Univ. En Diseño y Desarrollo de Videojuegos | Fernando Córdoba | cordoba.fernando@ues21.edu.ar |
| Tec. Univ. En Hidrocarburos y Geo ciencias | Marcela Maldonado | Marcela.Maldonado@ues21.edu.ar |
| Tec. Univ. En Redes Informáticas y Telecomunicaciones | Ing. Sergio Fritz | sergio.fritz@ues21.edu.ar |
| Tecnicatura Universitaria en Gestión de Moda | Lic. Candelaria Urrere Pon | candelaria.urrerepon@ues21.edu.ar |

**Ciencias Humanas y Sociales**

Decana Eugenia Scocco

| Carrera | Director | Mail |
| --- | --- | --- |
| Licenciatura en Relaciones Internacionales | ​Paola Ninci | paola.ninci@ues21.edu.ar |
| Licenciatura en Ciencia Política y Gobierno | Paola Ninci | paola.ninci@ues21.edu.ar |
| Licenciatura en Administración Pública | Paola Ninci | paola.ninci@ues21.edu.ar |
| Tecnicatura Universitaria en Administración y Gestión de Políticas Públicas | Paola Ninci | paola.ninci@ues21.edu.ar |
| Licenciatura en Relaciones Públicas e Institucionales | Lic. Guadalupe Altamirano | guadalupe.altamirano@ues21.edu.ar |
| Tecnicatura Universitaria en Dirección de Protocolo, Organización de Eventos y Relaciones Públicas | Lic. Guadalupe Altamirano | guadalupe.altamirano@ues21.edu.ar |
| Licenciatura en Periodismo | Lic. Celina Morgan | celina.morgan@ues21.edu.ar |
| ​Licenciatura en Educación | Mgter. Débora Brocca | debora.brocca@ues21.edu.ar |
| Licenciatura en Psicopedagogía | Mgter. Débora Brocca | debora.brocca@ues21.edu.ar |
| Tecnicatura en Responsabilidad y Gestión Social | Mgter. Evangelina Pérez | evangelina.perez@ues21.edu.ar |
| Licenciatura en Antropología Organizacional | Mgter. Evangelina Pérez | evangelina.perez@ues21.edu.ar |
| Tecnicatura Universitaria en Promoción Comunitaria en Niñez y Adolescencia | Mgter. Evangelina Pérez | evangelina.perez@ues21.edu.ar |

**Ciencias de la Salud**

Decano Diego Federico Baenas

| Carrera | Director | Mail |
| --- | --- | --- |
| Lic en Kinesiología y Fisioterapia | Med esp. Marcela La Villa | marcela.lavilla@ues21.edu.ar |
| Licenciatura en Nutrición | Laura Sánchez Salamanca / Directora Interina | laura.sanchez@ues21.edu.ar |
| Lic. en Gerontología | Mgtr Gabriela Gallo | gabriela.gallo@ues21.edu.ar |
| Lic. En Psicología | Azpilicueta, Ana Estefania | ana.azpilicueta@ues21.edu.ar |
| Lic. en Terapia Ocupacional y Desarrollo Humano | Lic. Milva Gonzalez | milva.gonzalez@ues21.edu.ar |
| Licenciatura en producción de Bioimágenes | Lic. Danilo Catalfamo | danilo.catalfamo@ues21.edu.ar |
| Licenciatura En instrumentación Quirúrgica ​ | Lic Cecilia Ludueña | cecilia.luduena@ues21.edu.ar |
| Tec Universitaria en Enfermeria | Lic Maria Isabel Morales | morales.maria@ues21.edu.ar |
| Lic. en Fonoaudiología | Lic. Daina Rojos | daina.rojos@ues21.edu.ar |
| Tecnicatura Universitaria En Atención Prehospitalaria de emergencias​ | Lic Carlos Lopez Bigott | carlos.lopez@ues21.edu.ar |

### Comentarios$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/post/directores-de-carrera$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-documentacion$pea0$,
        $pea0$DOCUMENTACIÓN | La Nube 21$pea0$, $pea0$Contar con tu legajo completo es un requisito obligatorio para continuar con tus estudios. En esta sección vas a encontrar qué documentación debés presentar y los plazos establecidos por el reglame…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/documentacion el 2026-11-09. Revisalo antes de publicar.

#### Documentación de Legajo

Contar con tu legajo completo es un requisito obligatorio para continuar con tus estudios. En esta sección vas a encontrar qué documentación debés presentar y los plazos establecidos por el reglamento académico.

Documentación Obligatoria

Estudiante

+ 25 años

¿Cómo entregar la Documentación?

Cambio de Género

Plazos de entrega

Estudiante Extranjero

#### Documentación obligatoria para Carreras de Grado y Pregrado

A continuación, vas a encontrar la documentación que debés presentar para completar tu legajo.

Deberás cargarla en Digital Admin. ¿No sabés cómo cargar los archivos? [Mirá el paso a paso en Digital Admin.](https://www.lanube.21.edu.ar/documentacion)

#### Solicitud de Inscripción Completa

Debes [descargar acá](https://www.lanube.21.edu.ar/_files/ugd/cf0a7a_3215ab2df4f64536b0febc420fa4d153.pdf) tu ficha de inscripción. Posteriormente firmala y escanéala.

#### Frente y dorso de tu DNI actualizado

Debes presentar la foto del frente y dorso de tu DNI.

No se aceptarán DNI descargados desde la aplicación Mi Argentina, ya que dichos documentos carecen del dato de localidad/provincia de nacimiento.

#### Certificado de Estudios Secundario Completo – Legalizada

Debes enviar, al menos, una de las siguientes documentaciones:

- Certificado Analítico de estudios secundarios. (No es válido el Libro Matriz, salvo que el mismo sea legible y especifique localidad y provincia, nombre de la Institución educativa, título secundario obtenido y año de egreso).

- Título Secundario (frente y dorso).

IMPORTANTE:

Tanto el Certificado Analítico como el Titulo del secundario deben estar legalizados por la autoridad educativa competente, según la jurisdicción, por Escribano Público o por autoridad competente de la Institución emisora. En ambos casos es requisito obligatorio que contenga el promedio. Además, necesitamos que consigne los siguientes datos: título obtenido, año y lugar de egreso, y nombre de la institución.

#### Ficha medica

Deberás completar y firmar esta ficha médica con un profesional matriculado. No se aceptan certificados de buena salud ni otros formatos que no sean el modelo oficial. [Descargá tu ficha médica acá](https://drive.google.com/file/d/14wStZwRmDFRJKO5wkkYwSSCcGW3HDp9G/view?usp=sharing).

#### Foto a color

Tendrás que enviar una foto actualizada, que te muestre de manera frontal y sobre un fondo liso.

#### Carrera de Fonoaudiología: Apto Fonoaudiológico

Se incorpora como requisito de inscripción el Apto Fonoaudiológico, junto con la Audiometría Tonal, realizados por un/a fonoaudiólogo/a con informe, firma, sello y matrícula. La ficha debe descargarse y presentarse completa al momento de la inscripción. Este requisito forma parte de una política de prevención y acompañamiento, y es condición necesaria para acceder a las prácticas clínicas. [Descargá acá la ficha](https://www.lanube.21.edu.ar/_files/ugd/cf0a7a_c0ab5526aa9a43d694b9b0fb943b3e62.pdf).

#### Ciclos de Complementación Curricular

En algunas Carreras, además debes presentar adicionalmente la siguiente documentación:

- Escribanía

Fotocopia legalizada del título de Abogado o analítico oficial final completo (frente y dorso con sellos y/o etiquetas ministeriales). Siendo esta una carrera de Grado, su duración en años no puede ser inferior a cuatro años y 2600 horas reloj mínimas.

Consultá la resolución acá

- Licenciatura en Educación

Fotocopia legalizada del frente y el dorso del título de profesor + certificación de 1200 horas reloj (Plan de estudios, resolución ministerial o certificado emitido por la institución).

La constancia de 1200hs puede estar en los siguientes documentos:

- Certificado Analítico del profesorado que consigne cantidad de horas reloj,
- Copia legalizada del Plan de Estudios del profesorado, donde se detalla la cantidad de horas reloj cursadas.
- Constancia de hora reloj cursadas emitida por la Institución de origen. Si es copia, debe estar legalizada.
- Copia legalizada de la Resolución Ministerial mediante la cual se aprobó el Profesorado donde se detalle la cantidad de horas de cursada.

Consultá la resolución acá

- Licenciatura en Psicopedagogía

Fotocopia legalizada del frente y dorso del título con reconocimiento oficial y validez nacional, otorgado por institución autorizada, con una duración mínima de 2 años y una carga horaria no inferior a 1400 horas reloj.

Se admitirán los siguientes títulos:

- Psicopedagogo/a
- Profesor/a en Psicopedagogía
- Profesor/a en Ciencias de la Educación
- Profesor en Psicología
- Profesor Superior en Psicopedagogía
- Técnico/a Superior en Psicopedagogía
- Técnico/a Universitario/a en Psicopedagogía
- Técnico en Psicopedagogía
- Técnica Universitaria en Psicopedagogía
- Asistente en Psicopedagogía
- Asistente Psicopedagógico/a
- Asistente Psicopedagógico Universitario
- Auxiliar Psicopedagógico

Consultá la resolución acá

- Licenciatura en Gerontología

Fotocopia legalizada del frente y dorso del título de Enfermero, Trabajador Social, Terapista Ocupacional, Técnico en Gerontología y/o Técnico Universitario en Acompañamiento, cuidado y asistencia al adulto mayor. El mismo deberá estar otorgado por institución autorizada, con duración de al menos 2 años y carga horaria no inferior a 1600hs reloj. Si no indica la cantidad de horas cursadas, se podrán acreditarlas con una constancia emitida por la institución de origen o con copia legalizada de la Resolución Ministerial que aprueba el título y detalle las horas.

Consultá la resolución acá

- Licenciatura en Emprendimiento

Es condición necesaria poseer título de Técnico/a Universitario/a otorgado por institución autorizada, con duración de al menos 2 años y carga horaria no inferior a 1400hs reloj, conforme lo contemplado taxativamente en la Resolución Ministerial que otorga reconocimiento oficial. Si no indica el número de horas cursadas, se puede acreditar el cumplimiento de las horas mediante una constancia expedida por la institución de origen o con una copia legalizada de la Resolución Ministerial que aprobó el título, en la que se detallen dichas horas.

Consultá la resolución acá

- Profesorado para el Nivel Secundario y Superior

Es condición necesaria poseer Título de Nivel Superior en carreras de 4 años o más y con una carga horaria mínima de 2600 horas reloj. Si el Título no acredita la carga horaria podrá acreditarlas mediante una constancia emitida por la Institución de origen o copia legalizada de la Resolución Ministerial mediante la cual se aprobó el Título donde se detalle la cantidad de horas cursadas. Si no indica el número de horas cursadas, se puede acreditar el cumplimiento de las horas mediante una constancia expedida por la institución de origen o con una copia legalizada de la Resolución Ministerial que aprobó el título, en la que se detallen dichas horas.

Consultá la resolución acá

- Licenciatura en Desarrollos de Negocios Inmobiliarios

Es necesario tener título de Técnico en:

- Tecnicatura en Martillero y corredor público y similares (dos años y medio de duración)
- Técnico en corretaje inmobiliario
- Técnico en emprendedorismo
- Técnico en administración de empresas.
- Técnico en gestión contable e impositiva.
- Procurador

El mismo deberá estar otorgado por Institución autorizada, con duración de al menos 2 años y carga horaria no inferior a 1400 horas reloj.

Si no indica el número de horas cursadas, se puede acreditar el cumplimiento de las horas mediante una constancia expedida por la institución de origen o con una copia legalizada de la Resolución Ministerial que aprobó el título, en la que se detallen dichas horas.

Consultá la resolución acá

- Licenciatura en Administración de Servicios de la Salud

Es condición necesaria poseer título de Técnico/a Universitario/a otorgado por institución autorizada, con duración de al menos 2 años y carga horaria no inferior a 1400hs reloj, conforme lo contemplado taxativamente en la Resolución Ministerial que otorga reconocimiento oficial. Si no indica el número de horas cursadas, se puede acreditar el cumplimiento de las horas mediante una constancia expedida por la institución de origen o con una copia legalizada de la Resolución Ministerial que aprobó el título, en la que se detallen dichas horas.

Consultá la resolución acá - Modalidad Distancia

Consultá la resolución acá - Modalidad Presencial

#### ¿Cómo actualizar tus datos personales?

Ingresá a tu Portal de Estudiantes y en Más opciones, hacé click en Actualizar tus Datos Personales.

#### ¿Cómo entregar la documentación?

Para cargar tu documentación de legajo de manera digital y autogestiva deberás utilizar la plataforma Digital Admin. Esta plataforma también la vas a utilizar cuando curses las materias Práctica Profesional y Práctica Solidaria.

¡Utilizá las flechas y conocé el paso a paso para cargar tu documentación de legajo!

#### Ingresar a Digital Admin y creá tu cuenta de usuario completando todos los campos de la derecha.

Ingresá a Digital Admin

En caso de que tengas un usuario y no recuerdes la contraseña, podrás clickear en “Olvidé mi contraseña” y recibirás un acceso al correo electrónico asociado para poder reestablecerla.

#### Creá tu cuenta

1

IMPORTANTE:

Te recordamos que toda constancia de analítico o título en trámite no es válida para constatar tus estudios. Por lo tanto, te recomendamos aguardar a contar con el documento final para su carga.

Además, recordá que toda esta documentación deberá contemplar lo siguiente:

- Debe estar legalizada por autoridades competentes como se detalla cada ítem,
- Debe ser escaneada y presentada en formato PDF, adjuntando un archivo por documento.
- En caso de que envíes la documentación con firma digital, deberás enviar también el enlace validador de dicha firma.

- Si estás buscando realizar la actualización de tus datos personales, si sos un alumno +25 o si tu trámite de titulación está frenado por adeudar documentación de legajo, los documentos solicitados deberán enviarse por Consulta Alumnos.

- Si estás en tu proceso de visado y adeudas documentación, la misma te será solicitada una vez iniciado el proceso.

#### Plazos de presentación

Plazos para la presentación de la documentación obligatoria:

- En las Carreras de Grado, la documentación debe ser presentada dentro del primer año y medio de cursado.
- En las Carreras de Pregrado, el plazo es de un año desde el ingreso.
- En Carreras de Ciclos de Complementación Curricular debe ser presentada dentro del primer semestre de cursado.

Por reglamentación académica el incumplimiento total o parcial en la presentación del legajo impedirá la reinscripción al cuarto período (en Grado) o al tercer período (en Pregrado).

En caso de que hayas podido inscribirte a los períodos indicados y aún adeudes documentación obligatoria:

- Para Carreras de Grado, no podrás avanzar con el proceso de visado de documentación previo a la Defensa Oral.
- Para Carreras de Pregrado y Grado, no se iniciará el proceso de Titulación hasta que completes tu legajo.

#### Estudiantes Extranjeros

#### Documentación necesaria

Los estudiantes extranjeros que cursen una Carrera de manera completa en la universidad, deben presentar:

- Título Secundario Convalidado en Argentina / Estudios Parciales Universitarios Legalizados. Debe enviarse junto al analitico secundario del país de origen

- Fotocopia de pasaporte

- Visa de Estudiante

- Para mayor información sobre el procedimiento de convalidación, se puede ingresar a los siguientes enlaces:

Países con Convenio

Países sin Convenio

Los estudiantes extranjeros que cursen una Carrera de manera completa en la universidad, deben presentar:

- Título Secundario Convalidado en Argentina / Estudios Parciales Universitarios Legalizados. Debe enviarse junto al analitico secundario del país de origen

- Fotocopia de pasaporte

- Visa de Estudiante

- Para mayor información sobre el procedimiento de convalidación, se puede ingresar a los siguientes enlaces:

Países con Convenio

Países sin Convenio

#### Documentación para Posgrado

#### Documentación requerida

POSGRADOS – Aprendizaje para la Vida (APLV) | Modalidad Presencial

- Ficha de Inscripción completa descárgala acá.
- Fotocopia de DNI (frente y dorso).
- Fotocopia legalizada del Título de Grado.
- CV actualizado.
- 2 fotos tipo carnet.
- Carta de aceptación del reglamento descárgala acá.

Información complementaria

- Para corroborar las Condiciones, Admisión y Permanencia de ingreso, [clic acá.](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-1-condiciones-de-ingreso-y-admision)

- Para consultar la documentación requerida para alumnos extranjeros, [clic acá.](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=2-2-documentacion-obligatoria)

Importante: títulos obtenidos en el extranjero

La norma general establece que, para cursar una carrera de posgrado en la República Argentina, la persona interesada que posea un título de grado obtenido en el extranjero deberá convalidarlo o revalidarlo (según corresponda), conforme a la normativa vigente al momento del trámite.

No obstante, de acuerdo con lo expresado en la Resolución Ministerial N.º 416/00, las universidades podrán reconocer estudios de grado aprobados en el extranjero exclusivamente a los efectos de la prosecución de estudios de posgrado en la República Argentina, siempre que la currícula del programa no requiera el ejercicio profesional.

#### Estudiantes +25 años

Si tenes más de 25 años y posees el secundario incompleto podes ser alumno de la Universidad. El requisito básico es que cuentes con CBU completo, o que hayas cursado y aprobado hasta 3er año de secundario, o 9 años cursados y completos desde el inicio de 1er grado.

#### ¿Qué documentación debo presentar?

- Fotocopia de 1º y 2º hoja de DNI.

- Fotocopia legalizada del analítico.

- Curriculum Vitae actualizado, con teléfono de contacto.

- Fotocopia de certificados de cursos realizados, extras al secundario, si los tuvieras.

- Carta a la Rectora de la Universidad solicitando el ingreso, comentando los motivos por los cuales queres empezar una carrera y por qué eligís esa carrera específica. Te invitamos a descargar un modelo para que puedas realizar tu carta.

Modelo de carta

#### ¿Cómo envío la documentación en este caso?

En el caso particular de alumnos mayores a 25 años sin secundario completo, la documentación se debe adjuntar a través de nuestros canales de contacto virtuales.

Canales de contacto Virtuales

#### Actualización de datos por cambio de género

En Siglo 21 valoramos la diversidad, la inclusión y el respeto. Es por eso que queremos que tu nombre en las plataformas de la Universidad, sea acorde a la identidad de género con la que te autopercibis.

Existen dos posibles situaciones:

- Realizaste el cambio registral:

Es decir, que solicitaste la modificación de tus datos en el Registro Nacional de Personas, por lo que contas con un DNI acorde a tu identidad autopercibida.

¿Qué debo presentar?

En este caso, te solicitamos que nos adjuntes copia de frente y dorso de tu DNI vigente, partida de nacimiento rectificada y el siguiente formulario en formato PDF mediante “Consulta Alumnos”.

Descargá el Formulario

Tu identidad será modificada en todas las plataformas, incluso en la emisión de todo documento académico y administrativo (certificados, analítico, título, facturas, etc.).

- No realizaste el cambio registral:

Es decir, no solicitaste la modificación de tu DNI, pero te autopercibis con una identidad distinta a la que figura en tu documento.

¿Qué debo presentar?

En este caso, te solicitamos que nos adjuntes el siguiente formulario en formato PDF mediante “Consulta Alumnos”.

Descargá el Formulario

Tu identidad será modificada en todas las plataformas, pero toda documentación oficial emitida por la Universidad será confeccionada a partir de los datos indicados en el documento nacional de identidad vigente.

IMPORTANTE:

Si ya iniciaste el trámite en el Registro Nacional de las Personas o tenés pensado comenzarlo en un futuro, recorda enviarnos una imagen de frente y dorso de tu nuevo DNI.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/documentacion$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-efip$pea0$,
        $pea0$EFIP | La Nube 21$pea0$, $pea0$El EFIP (Examen Final Integrador Presencial) es una instancia obligatoria para alumnos de Carreras de grado a distancia, donde se deben acreditar presencialmente los conocimientos adquiridos durant…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/efip el 2026-11-08. Revisalo antes de publicar.

#### EFIP
Examen Final Integrador Presencial

El EFIP (Examen Final Integrador Presencial) es una instancia obligatoria para alumnos de Carreras de grado a distancia, donde se deben acreditar presencialmente los conocimientos adquiridos durante la Carrera.

- EFIP I: evalúa contenidos de los primeros años.
- EFIP II: evalúa contenidos del último año.​

Permite demostrar de forma cuantitativa y cualitativa la integración y transferencia de los aprendizajes obtenidos.

EFIP I

Taller de EFIP

EFIP II

Pasos para la Inscripción

Abogacía y Contador Público​

Dónde de rinde

Programas

Modalidad de Examen

​Este es un espacio académico para que te prepares, por lo que te recomendamos que aproveches al máximo esta experiencia navegando los trabajos prácticos, lecturas y videos.

#### EFIP l
Examen Final Integrador Presencial

El EFIP I es una instancia integración curricular. El programa de este examen incluye el contenido de las materias troncales del primer tramo de tu carrera (1° al 6° semestre).El examen se compone de un examen escrito y uno oral. La aprobación de las dos instancias es necesaria para la aprobación del EFIP I.

Es condición previa contar con EFIP I, en aquellas carreras en las cuales está previsto en el Plan de estudios, para la obtención de un título Intermedio.

Cursado y regularización

Requisitos

#### ¿Cómo es su cursado y regularización?

#### Para las Carreras de Abogacía, Contador Público y Licenciatura en Relaciones Internacionales

El Módulo de EFIP I requiere de inscripción obligatoria. Este módulo se cursa de manera BIMESTRAL con apertura en los períodos A y B. Las entregas de Trabajos Prácticos son optativas.

#### Para el resto de las Carreras.

Es una materia de PROCESO que se habilita en TODOS los periodos "A" (Marzo y Agosto). De cursado CUATRIMESTRAL.

Se cursa a través de tu Aula Virtual (Canvas) y para adquirir la regularidad, es necesario que apruebes 2 de 3 de los primeros TP y el 4° TP es de aprobación obligatoria. La nota de aprobación de cada TP es 5 (cinco).

La regularidad dura 18 de meses y cuenta con 3 oportunidades para rendir el Examen Final Integrador.

#### ¿Cuáles son los requisitos para rendir EFIP I?

Carreras con Módulo Cursado de EFIP I:

- Tener APROBADAS las materias correlativas Previas al examen EFIP I

- Tener el Módulo de Cursado EFIP I en estado Cursando o Regular.

Carreras con Seminario de Práctica / Planificación y Control de gestión:

- Tener APROBADAS TODAS las materias que establezca el Plan de Correlativas de su carrera.
- Tener REGULAR el Seminario de Práctica o el Seminario de Planificación y Control de Gestión.

Tener la matrícula activa.

Respetar los 6 días de anticipación a la mesa publicada.

#### EFIP 1: Diferenciado Abogacía

El EFIP I Diferenciado es una modalidad para la Carrera de Abogacía

¿En que consiste?

Si obtuviste 7 o más como calificación final en las siguientes materias: ​

- Derecho Constitucional
- Bases del Derecho Privado
- Contratos
- Teoría General del Proceso
- Derecho Penal Parte General.

No deberán realizar la instancia escrita tradicional del EFIP.​

#### Desafíos de tu carrera

#### Ciclo de bienestar y preparación para EFIP

Te invitamos a participar del ciclo de EFIP especialmente diseñado para acompañarte en este momento clave.​​

​​​

#### EFIP II
Examen Final Integrador Presencial

Es un examen integrador obligatorio solo para los alumnos de carreras de grado de la Modalidad a Distancia. El programa de este examen, incluye el contenido de las materias troncales del último tramo de tu carrera (7° y 8° semestre)

El EFIP II es uno de los requisitos para obtener tu Titulo de Grado

El EFIP II no se cursa, por lo que para poder acceder al examen deberás tener aprobadas TODAS las materias correspondientes a la currícula de tu Carrera, incluyendo la Práctica Solidaria y los créditos exigidos en Materias Electivas para el plan de estudios vigente, y debes tener el Seminario Final en estado Regular

#### ¿Cuáles son los requisitos para rendir el EFIP II?

Para poder rendir el EFIP II, tenés que tener aprobadas todas las materias correspondientes al plan de estudios de tu Carrera, incluyendo la Práctica Solidaria y los créditos exigidos en materias electivas; a su vez, tu Seminario Final debe estar en estado Regular.

Tener la matrícula activa.

Tener la materia seminario final en condición de regular.​​

Respetar los 6 días de anticipación a la mesa publicada.

#### Descargá el programa de tu Carrera

En el caso de no encontrar el programa de tu Carrera, comunícate con tu Director/a de Carrera.

Directores de Carrera

#### ¿Cuál es la modalidad del Examen?

Cada instancia evaluativa consta de dos etapas de exámenes: Examen escrito y Examen oral.

​​

- La instancia ORAL es una evaluación complementaria de los temas centrales abordados en la instancia escrita.
- La nota de aprobación es 4 (CUATRO)

#### Etapas de la Evaluación:

#### Presentación: Presentación del tribunal, del caso y encuadre del exámen. (5 minutos)

#### Lectura del Caso: Lectura individual del caso presentado. (15 minutos)

#### Trabajo Colaborativo: Debate del caso en grupo de 5 estudiantes. (10 minutos)

Producción Individual: Abordaje invidual del caso a través de las respuestas a las preguntas críticas. (30/60 minutos) 60 minutos en el caso de carreras como Informática, Animación Digital y Publicidad.

Evaluación Oral: Trabajo grupal, juego de roles, desarrollo de la oralidad. Lo realiza en conjunto, cada grupo + tribunal docente. (30 minutos / grupo).

Corrección: Tiempo para corrección de la producción escrita por parte de los docentes. 10 alumnos / docente. (45 minutos).

Devolución: El TAP le devolverá la nota de manera individual a cada estudiante luego de finalizada la sesión.​ El docente da una devolución individual de la evaluación. (10 minutos).

Nota Final: La nota final del examen supone superar ambas instancias: producción individual escrita y la instancia grupal. ​

#### Inscripción a EFIP

Deberás realizar la inscripción a través de Portal de Estudiantes con al menos 6 días de anticipación a la fecha del examen.

Ingresá a Portal de Estudiantes

1.Accedé a la plataforma. En la sección exámenes y seleccioná la opción + Nueva inscripción.

​​​

Las mesas que visualizás en este apartado son las únicas disponibles, no contamos con otro medio para su habilitación. Tené siempre en cuenta que se crean las mesas con un cupo determinado.

2.Selecciona la pestaña EFIP. Desde aquí podrás inscribirte a EFIP I o EFIP II, dependiendo del grado de avance en tu carrera. A la derecha, el formulario “Resumen de inscripción” se irá auto-completando con los datos que vayas ingresando para realizar la inscripción al examen.

3.Seguí los mismos pasos que realizás para inscribirte a cualquier examen.

Revisá los pasos acá

La ACEPTACIÓN del pedido de mesa de examen se realizará automáticamente a los 6 días de CORRIDO antes de la fecha de examen.

Una vez aceptado el pedido de mesa de examen, recibirás un correo electrónico con información importante de cara al turno de examen.

IMPORTANTE: ​

Para anular el pedido de mesa de examen, accedé desde la opción Exámenes a la pestaña

"A Rendir" luego hace clic en la cruz que se encuentra a la izquierda "Anular pedido".

Una vez aceptada la mesa de examen, NO SE PUEDE ANULAR.

#### ¿Dónde puedo rendir mi EFIP?

El Examen Final Integrador Presencial (EFIP) se rinde de manera presencial.

Podrás inscribirte en las Sedes y/o los Centros de Apoyo Universitario (CAU) del listado que vas a encontrar más abajo. Estos centros están ubicados a lo largo y ancho del país, para que puedas rendir más cerca de tu casa.

#### Información adicional a tener en cuenta si venís a Córdoba a Rendir en Campus

Transporte público:

La línea de colectivo que ingresa a Campus de la Universidad es GRUPO FAM línea 21 y 25. Te compartimos los horarios de circulación y las paradas referentes del centro:

Consulta los horarios y paradas acá

Avión:

Dentro del predio del aeropuerto encontrarás la parada de la línea 25 que te cruza a campus. Es importante que cuentes con la tarjeta red bus que se consigue en cualquier punto de carga o la tarjeta sube con carga indispensable para cubrir el boleto.

Auto:

Este es el link de google maps para que llegues directo

Consulta el camino acá

Acreditación:

Cuando ingreses a Campus, deberás dirigirte a recepción del edificio Arcor, para tu acreditación.

¿Vas a visitar la Sede Campus?

#### Conocé cómo habitar los espacios de la Universidad

Ingresá acá

#### EFIP ÁGIL

Una modalidad para rendir EFIP I y II, aplicable únicamente a las carreras de Abogacía y Contador Público.

Se desarrolla en tres encuentros a lo largo de una semana y durante todo el proceso trabajás sobre el mismo caso y con el mismo equipo docente.

#### ¿Cómo funciona?

Se desarrolla en tres encuentros a lo largo de una semana y durante todo el proceso trabajás sobre el mismo caso, en duplas y con el mismo equipo docente.

01 — Presentación del caso

Modalidad: Virtual · Obligatorio

- Los docentes presentan y contextualizan el caso, recuperan los marcos conceptuales necesarios y explican desde el inicio los criterios con los que se evaluará el examen.
- Se presentan las duplas de estudiantes con las que trabajaras en la resolución del caso.​
- Comienza el análisis colaborativo del caso.

02 — Construcción de la propuesta

Modalidad: Virtual · Obligatorio

Presentás la propuesta que elaboraste junto con tu dupla y participás de un espacio de intercambio oral.

El docente te guía mediante preguntas para revisar los fundamentos, detectar aspectos a mejorar y ajustar la propuesta según los criterios de evaluación.

03 — Evaluación oral

Modalidad: Presencial · Obligatorio

Presentás de manera individual tu propuesta de resolución final y justificás las decisiones adoptadas integrando los contenidos de las materias del EFIP I o EFIP II.

La evaluación se realiza con la misma rúbrica presentada en el primer encuentro

#### Lo que necesitas saber antes de inscribirte

#### Encuentro de consulta

Vas a contar con encuentros de consulta para resolver dudas relacionadas con tu participación en EFIP Ágil.

​​

Mirá la presentación de la directora de la carrera de Abogacía Guadalupe Virasoro y enterate de todo lo nuevo que trae EFIP Ágil. Descubrí cómo vas a trabajar sobre un mismo caso a lo largo de la semana y preparate para rendir con mayor acompañamiento.

#### Información a tener en cuenta$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/efip$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-egresados$pea0$,
        $pea0$EGRESADOS | La Nube 21$pea0$, $pea0$Somos una gran Comunidad de Egresados y Egresadas de Siglo 21, a través de la cual buscamos generar una red en conjunto que nos potencie como profesionales transformadores de entornos.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/egresados el 2026-11-08. Revisalo antes de publicar.

#### EGRESADOS 21

#### DIRECCIÓN DE EGRESADOS Y RELACIONES CON LA COMUNIDAD

Somos una gran Comunidad de Egresados y Egresadas de Siglo 21, a través de la cual buscamos generar una red en conjunto que nos potencie como profesionales transformadores de entornos.

Nuestro propósito como Dirección es crear espacios de networking, brindar acceso a las mejores oportunidades laborales, ser puente y generar la sinergia de vínculos entre las organizaciones, estudiantes y egresados con el objetivo final de buscar el crecimiento social y económico del país, a través de la profesionalización de las personas.

Estado de tu Titulo

Proceso de titulación

Eventos con Egresados

Contacto

Actualmente somos más de 90.000 egresados y egresadas que conformamos esta Comunidad, quienes nos identificamos por tener la misma visión del mundo: como una real y auténtica oportunidad.

Somos profesionales comprometidos con su prójimo y comprometidos con la sociedad. Tenemos valor para enfrentar las injusticias, las desigualdades, respondemos a la altura de nuestros valores éticos e institucionales y tenemos gran conciencia social.

Somos Siglo 21, profesionales que promovemos el diálogo, somos inclusivos y ayudamos a delinear un mundo mucho más sustentable.

#### Reviví los encuentros más importantes que compartimos con nuestros egresados

### Te contamos como fue el desayuno de egresados

1 min de lectura

#### Contacto

Para consultas académicas (plan, cursado, finales, certificados, equivalencias o títulos), te pedimos que las gestiones por estos canales:

- [Consulta Alumnos](https://login.microsoftonline.com/7c6a9009-d5aa-4490-91cb-37d7fec82497/oauth2/v2.0/authorize?response_type=code&client_id=453e3e2d-893b-4afe-b377-c54168b79c97&scope=api://oauth/prod.read&state=dEFrx8IrSKfvVKacMUraOOmQjvDSIQbqq0OeM7BC75w%3D&redirect_uri=https://contactanos.21.edu.ar/unplugged-crm-zendesk/api/login/oauth2/code/siglo21) (necesitas tu usuario @soysiglo.edu.ar)
- [Egresados21@ues21.edu.ar](mailto:Egresados21@ues21.edu.ar)$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/egresados$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-empleabilidad$pea0$,
        $pea0$EMPLEABILIDAD | La Nube 21$pea0$, $pea0$Empleabilidad$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/empleabilidad el 2026-11-08. Revisalo antes de publicar.

Empleabilidad

Somos el puente entre vos y el mundo laboral

Trabajamos para construir alianzas estratégicas con organizaciones y empresas, tanto a nivel

nacional como internacional, con el objetivo de brindarte las mejores oportunidades para

desarrollarte en el mundo laboral y productivo.

POTENCIÁ TU PERFIL

ACADÉMICO Y PROFESIONAL

Explorá el espacio de Experiencias 21 y descubrí actividades cocurriculares para tu carrera.

Ingresá al Portal de Recomendaciones para conocer cada propuesta y realizá tu inscripción.

### Impulsá tu Carrera
Pasantías, programas y becas

Descubrí programas, pasantías y experiencias profesionales diseñadas para potenciar tus competencias y vincularte con empresas de manera efectiva.

Pasantías rentadas​

[Internships](https://www.lanube.21.edu.ar/internacionalizacion)​

[Training for International Students](https://www.lanube.21.edu.ar/empleabilidad)

[Ecosistema y Semillero de Mujeres en Tecnología](https://www.lanube.21.edu.ar/empleabilidad)

[Programa de inserción profesional](https://www.lanube.21.edu.ar/empleabilidad)

Ruta de Empleabilidad

#### Pasantías rentadas

#### ¡Sumá experiencia mientras estudiás!

Las pasantías rentadas son experiencias formativas que te permiten aplicar los conocimientos de tu carrera en un entorno real de trabajo, facilitando tu inserción en el mundo laboral y el desarrollo de habilidades profesionales.

Postulate acá

#### ¿Qué necesitás para postularte? | Requisitos

Para acceder a una pasantía rentada, es necesario cumplir con los requisitos establecidos por la normativa vigente y por cada organización.

En general, se solicita:

- Ser estudiante regular de la Universidad.​

- Tener 18 años o más.​

- Estar cursando una carrera vinculada a la pasantía.

​​

- Cumplir con las condiciones académicas requeridas (como porcentaje de la carrera aprobada, según cada convocatoria).

​​

- Contar con disponibilidad horaria compatible con la carga de la pasantía.

​​

- Cumplir con los requisitos específicos de cada búsqueda (por ejemplo: conocimientos técnicos, idioma o manejo de herramientas)

#### Características de la pasantía | Duración

Las pasantías educativas rentadas se desarrollan en empresas u organizaciones públicas o privadas, en actividades relacionadas con tu formación académica, y constituyen una instancia de aprendizaje con alto valor formativo.

- Duración: entre 2 y 12 meses.

- Carga horaria: Hasta 20 horas semanales, con un máximo de 4 horas por día, distribuidas de lunes a viernes en horario diurno según acuerdo.

#### Reconocimiento académico | Beneficios

Si realizas una pasantía con una duración mínima de 4 meses:

- Podes acreditar 1 materia electiva.
- Se suplementa a tu título.

Para solicitarlo debes iniciar el trámite en los canales de contactos para alumnos, enviando la siguiente información:

- Razón social de la organización.
- CUIT
- Periodo de la pasantía realizada.
- Certificación o documentación que acredite la experiencia.

#### Ingreso al programa de pasantías | ¿Cuándo y por donde me inscribo?

Las convocatorias se publican en los canales oficiales de comunicación de la Universidad. A través de ellos se difunden las convocatorias y oportunidades disponibles.

#### Documentación | ¿Cómo formalizo la pasantía?

Para formalizar tu pasantía, es necesario completar la siguiente documentación:

- Convenio Marco

Es un acuerdo que se firma por única vez entre la organización y la Universidad. Si la organización ya ha incorporado pasantes anteriormente, es probable que este documento ya esté firmado.

- Convenio Anexo

Es el documento que se gestiona por cada estudiante que realiza una pasantía. Debe estar firmado por la organización, la Universidad y por vos como participante del programa.

#### Condiciones laborales seguras

En ningún caso se permitirá que los pasantes realicen tareas penosas, riesgosas o insalubres. La pasantía debe ofrecer siempre un entorno de aprendizaje y desarrollo seguro.

#### Interships

En la Universidad Siglo 21 entendemos las internships como experiencias de pasantías con un impacto significativo en el ámbito global.

Esta dimensión internacional puede manifestarse a través de diversos factores, como el alcance, la proyección o la presencia de la empresa u organización en la que los estudiantes realizan su proceso de formación práctica.

Consideramos que una pasantía adquiere carácter global cuando la entidad receptora desarrolla sus actividades o ejerce influencia más allá del contexto local o nacional.

De este modo, promovemos que nuestros estudiantes se integren en entornos que les permitan desarrollar competencias interculturales, ampliar su visión global y prepararse para los desafíos del mundo profesional contemporáneo.

Si bien las leyes pueden verse modificadas en cada país, se respetan rigurosamente las bases de convenios de pasantías.

#### Condiciones | Convenios de la pasantía

- Definir efectivamente la carga horaria y duración de la pasantía.​

- Recibir una suma de dinero en carácter no remunerativo en calidad deasignación estimulo.

​​

- Contar con cobertura de salud, beneficios y licencias especificados por una reglamentación.

#### Pasantías | Inscripciones

- Por el momento, el Portal de Empleo se encuentra en desarrollo, por lo que no vas a poder inscribirte desde ese espacio.

- Las pasantías rentadas se publican a medida que las organizaciones nos comparten sus búsquedas.

- Las convocatorias se comparten a través de los canales oficiales de la Universidad (mail, redes sociales y newsletters).

#### Training for exchange students

El programa "Trainers for Exchange Students" es una iniciativa impulsada por la Universidad Siglo 21 que ofrece a estudiantes de intercambio internacional la oportunidad de desarrollar instancias prácticas de entrenamiento profesional en contextos reales,como parte de su experiencia académica y formativa.

- Reconocimiento formal de las horas y créditos académicos correspondientes a la participación del estudiante en el programa.

- Acompañamiento académico y profesional durante el desarrollo de las actividades.

- Posibilidad de integrarse activamente en proyectos reales que potencien tus habilidades disciplinares, interculturales y de empleabilidad.

#### Características de la pasantía | Consideraciones

El estudiante deberá completar un mínimo de horas prácticas pactadas con anticipación y distribuidas en dos semestres consecutivos.

Las actividades se realizarán en el marco de proyectos institucionales o áreas definidas por la universidad.

Al finalizar, el estudiante presentará un informe de cierre ante:

- El referente del proyecto.
- El Área de Empleabilidad.
- El Centro de Internacionalización de Universidad Siglo 21.

#### Ecosistema y Semillero de Mujeres en Tecnología

Este programa de becas académico-laborales, tiene el objetivo de brindar un espacio de inserción profesional a las alumnas de la universidad, asegurando al mismo tiempo el avance académico durante el cursado de su carrera y un incentivo para que más mujeres decidan estudiar carreras relacionadas con la tecnología.

Si sos ingresante o estás cursando el primer semestre de la Licenciatura en Sistemas o Ingeniería en Software, te invitamos a participar de esta iniciativa del área de Empleabilidad de la Universidad.

Para acceder al beneficio, deberás:

- Mantener un promedio de 8 (ocho), incluyendo aplazos.
- La duración de la pasantía dependerá de la organización, con un máximo de hasta 18 meses.

Acceso a un descuento de hasta un 50% en aranceles durante la participación en el programa. Y un 30% posterior a la finalización de dicho programa de pasantía.

- La beca no incluye matrículas.
- Acceso a la realización de una pasantía rentada en la empresa, según la Ley y normativa de Pasantías.

#### Programa de inserción profesional

Potencia tu perfil y acércate a tus primeras oportunidades laborales. Un recorrido práctico y progresivo para desarrollarse y posicionarse en el mercado.

#### ¿A quién está dirigido?

- Estudiantes de últimos años
- Egresados recientes (hasta 2 años de egreso)

El programa cuenta con apertura institucional por Decanato, reforzando su relevancia académica y estratégica.

#### ¿Cómo funciona el programa?

Se organiza como un recorrido integral de dos etapas claves:

### Diagnóstico de tu CV - ElevArte Asesoría

- Análisis personalizado del currículum.

- ​Mejora de estructura, redacción y enfoque por logros ​

- Adaptación a criterios actuales del mercado (ATS y keywords)

​Mejora de estructura, redacción y enfoque por logros ​Adaptación a criterios actuales del mercado (ATS y keywords)

### Tu primer CV, tu primera huella profesional - Usina de Talento (SEC)

- Construcción de CV optimizado utilizando feedback de la primera etapa del programa.

- Identificación de habilidades y experiencias relevantes. ​

​​

- Comunicación estratégica del perfil profesional.

Lográs un perfil claro, ordenado y alineado a las demandas del mercado

#### Ruta de Empleabilidad

#### Explorá nuevas formas de desarrollar tu carrera profesional

El mundo del trabajo evoluciona constantemente y las competencias que demanda también. Ruta de Empleabilidad es una propuesta de Universidad Siglo 21 diseñada para acompañarte en el desarrollo de habilidades, herramientas y conocimientos que potencien tu perfil profesional y amplíen tus oportunidades laborales.

A través de distintos ciclos temáticos, vas a poder prepararte para responder a los desafíos de los nuevos escenarios laborales, conocer tendencias del mercado y desarrollar competencias vinculadas al ejercicio profesional, la sustentabilidad, la internacionalización y el espíritu emprendedor.

Esta propuesta forma parte del programa de Certificados en Competencias y es desarrollada por Empleabilidad junto a los Centros de Excelencia Académica de la Universidad.

#### ¿Qué vas a encontrar?

Tres recorridos de formación diseñados para fortalecer distintas dimensiones de tu desarrollo profesional.

### Ruta 1: Tus primeros pasos como freelance

### Junto al Centro de Emprendimiento de la Universidad

Este ciclo te brinda herramientas para dar tus primeros pasos como freelancer, construir una propuesta de valor, encontrar clientes y potenciar tu perfil profesional con estrategias aplicables a distintas profesiones.

- Programa:

Encuentro 1: Claves para iniciar como freelancer.

Conocé los primeros pasos para comenzar a desarrollar una actividad profesional independiente, identificar oportunidades y planificar tu crecimiento.

#### Fecha

#### Hora

#### Disertante

#### Formulario

#### Ingresá a Zoom

#### ID

#### 27/08/2026

#### 20:00 h

#### Agustina Laboureau

#### Inscribite acá

#### Sala Zoom

#### 831 9189 3818

Encuentro 2: Dónde ofrecer tus servicios.

Descubrí las principales plataformas, espacios y estrategias para encontrar clientes y generar nuevas oportunidades profesionales.

#### 01/09/2026

#### Sofia Jobs

#### 848 50740983

Encuentro 3: Cómo presentar y vender tus servicios. Aprendé a comunicar tu propuesta de valor, fortalecer tu marca personal y generar confianza en potenciales clientes.

#### 08/09/2026

#### Joaquín Cámara

#### 833 784143

### Ruta 2: Cómo prepararte para trabajar en empresas con impacto

Cada vez más organizaciones incorporan la sustentabilidad como parte de su estrategia y buscan profesionales capaces de responder a esos desafíos. ​Este ciclo te ayudará a comprender cómo fortalecer tu perfil para desarrollarte en organizaciones comprometidas con el impacto económico, social y ambiental.

- Programa:

Encuentro 1: Dónde encontrar oportunidades laborales en sustentabilidad.

Conocé los sectores, organizaciones y perfiles que hoy demandan profesionales comprometidos con el desarrollo sostenible.

#### 13/10/2026

#### Carolina Ulla

#### 851 2242 6844

Encuentro 2: Cómo prepararte para trabajar en empresas con impacto.

Descubrí qué competencias buscan las organizaciones y cómo construir un perfil profesional alineado con esos desafíos.

#### 20/10/2026

#### Joel Zumoffen

#### 856 7547 5502

Encuentro 3: Cómo ingresar a una empresa con impacto: experiencias reales

Escucha referentes que compartirán su recorrido profesional y consejos para iniciar una carrera en organizaciones con propósito.

#### 27/10/2026

#### Fabian Saieg

#### 819104683

#### Certificados en Competencias

Al completar los recorridos, podrás seguir fortaleciendo tu desarrollo profesional mediante el programa Certificados en Competencias, una propuesta que fortalece el recorrido de las materias y la participación en experiencias co-curriculares orientadas al desarrollo de habilidades altamente valoradas por el mundo del trabajo.

#### ¿Cómo participar?

✔ Inscribite en los encuentros de tu interés.

✔ Recibirás por correo electrónico los datos de acceso correspondientes.

✔ Participá de las actividades y seguí construyendo tu perfil profesional.

Ingresá acá y conocé los Certificados en Competencias

#### Eventos de empleabilidad

En la Universidad Siglo 21 formamos grandes profesionales y sabemos lo fundamental que es conectarse con personas, oportunidades, empresas y organizaciones en general.

Por ello siempre estamos generando espacios de vinculación y de networking para que puedas aprovecharlos al máximo. Podes ver algunas imágenes de nuestros eventos.

#### Tips para el buscar trabajo

Desde Siglo 21 siempre pensamos en generar propuestas que te sumen valor.

Desde el área de empleabilidad, te acercamos algunos tips y herramientas para que puedas desarrollarte de manera exitosa en tu próxima búsqueda laboral

### ¿Cómo preparar tu perfil de Linkedin?

1 min de lectura

### ¿Cómo preparar tu Curriculum Vitae?

1 min de lectura

### ¿Cómo prepararse para una entrevista laboral?

2 min de lectura

### SUSCRIBITE

### AL NEWSLETTER

### ¡Sumate a Experiencias 21!

### Enterate antes que nadie de todas las experiencias, actividades y novedades.

 Recibí contenido exclusivo y mantenete al día con todo lo que pasa en Experiencias 21.

SUSCRIBITE ACÁ$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/empleabilidad$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$atencion-y-derivaciones$pea0$), null, 0, $pea0$ln-encuentros-con-directores$pea0$,
        $pea0$Directores de Carrera$pea0$, $pea0$ENCUENTROS 2026$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/encuentros-con-directores el 2026-11-08. Revisalo antes de publicar.

ENCUENTROS 2026

¡Participá de los encuentros virtuales con tu Director/a!

Elegí tu carrera y participá en el día y horario indicado. En este espacio tu director/a responderá dudas y consultas académicas.

| carrera | director/a | email | día | horario | link sala teams |
| --- | --- | --- | --- | --- | --- |
| Tecnicatura En Dirección De Protocolo, Organización De Eventos Y Relaciones Públicas | Guadalupe Altamirano | guadalupe.altamirano@ues21.edu.ar | Todos los jueves | 14 a 15 hs | Ingresá a la sala |
| Ingeniería En Software | Luis Bravo | luis.bravo@ues21.edu.ar | Todos los martes | 10 a 11 hs | Ingresá a la sala |
| Licenciatura En Informática | Luis Bravo | luis.bravo@ues21.edu.ar | Todos los martes | 10 a 11 hs | Ingresá a la sala |
| Tecnicatura En Relaciones Laborales | Marcelo Lesta | marcelo.lesta@ues21.edu.ar | Todos los miércoles | 15 a 16 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Gestión Del Clima Laboral En La Organización | Marcelo Lesta | marcelo.lesta@ues21.edu.ar | Todos los miércoles | 15 a 16 hs | Ingresá a la sala |
| Licenciatura En Gestión De Recursos Humanos | Marcelo Lesta | marcelo.lesta@ues21.edu.ar | Todos los miércoles | 15 a 16 hs | Ingresá a la sala |
| Licenciatura En Emprendimiento - Ciclo | Marcelo Lesta | marcelo.lesta@ues21.edu.ar | Todos los miércoles | 15 a 16 hs | Ingresá a la sala |
| Licenciatura En Administración | Marcelo Lesta | marcelo.lesta@ues21.edu.ar | Todos los miércoles | 15 a 16 hs | Ingresá a la sala |
| Licenciatura En Desarrollo De Negocios Inmobiliarios - CCC | SEBASTIAN NINI | Sebastian.Nini@ues21.edu.ar | Todos los lunes | 09:00 a 10:30 hs | Ingresá a la sala |
| Martillero, Corredor Público Y Corredor Inmobiliario | SEBASTIAN NINI | Sebastian.Nini@ues21.edu.ar | Todos los lunes | 09:00 a 10:30 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Administración De La Propiedad Horizontal Y Conjuntos Inmobiliarios | SEBASTIAN NINI | Sebastian.Nini@ues21.edu.ar | Todos los lunes | 09:00 a 10:30 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Enfermería | María Isabel Morales | morales.maria@ues21.edu.ar | Todos los martes y Jueves | 18 a 20 hs | Ingresá a la sala |
| Licenciatura En Antropología Organizacional | Evangelina Perez | evangelina.perez@ues21.edu.ar | Todos los martes | 14 a 15 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Promoción Comunitaria En Niñez Y Adolescencia | Evangelina Perez | evangelina.perez@ues21.edu.ar | Todos los martes | 14 a 15 hs | Ingresá a la sala |
| Tecnicatura En Responsabilidad Y Gestión Social | Evangelina Perez | evangelina.perez@ues21.edu.ar | Todos los martes | 14 a 15 hs | Ingresá a la sala |
| Licenciatura En Periodismo | Celina Morgan | celina.morgan@ues21.edu.ar | Todos los lunes | 11 a 12 hs | Ingresá a la sala |
| Licenciatura En Diseño Y Animación Digital | Roberto Benedetti | roberto.benedetti@ues21.edu.ar | Todos los lunes | 13 a 14 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Diseño Y Animación Digital | Roberto Benedetti | roberto.benedetti@ues21.edu.ar | Todos los lunes | 13 a 14 hs | Ingresá a la sala |
| Licenciatura En Administración Hotelera | Maximiliano Perez Joos | maximiliano.perez@ues21.edu.ar | Todos los miércoles | 13:30 a 14:30 hs | Ingresá a la sala |
| Licenciatura En Gestión Turística | Maximiliano Perez Joos | maximiliano.perez@ues21.edu.ar | Todos los miércoles | 13:30 a 14:30 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Gestión De Recursos Turísticos | Maximiliano Perez Joos | maximiliano.perez@ues21.edu.ar | Todos los miércoles | 13:30 a 14:30 hs | Ingresá a la sala |
| Licenciatura En Diseño Industrial |  |  |  |  |  |
| Licenciatura En Ambiente Y Energías Renovables | Gabriel Imwinkelried | gabriel.imwinkelried@ues21.edu.ar | Todos los miércoles | 14 a 15 hs | Ingresá a la sala |
| Licenciatura En Gestión Ambiental | Gabriel Imwinkelried | gabriel.imwinkelried@ues21.edu.ar | Todos los miércoles | 14 a 15 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Gestión Y Auditorías Ambientales | Gabriel Imwinkelried | gabriel.imwinkelried@ues21.edu.ar | Todos los miércoles | 14 a 15 hs | Ingresá a la sala |
| Licenciatura En Terapia Ocupacional Y Desarrollo Humano | Milva Gonzalez | milva.gonzalez@ues21.edu.ar | Todos los viernes | 15 a 16 hs | Ingresá a la sala |
| Licenciatura En Producción De Bioimágenes | Danilo Stefano Catalfamo | danilo.catalfamo@ues21.edu.ar | Todos los martes | 13 a 14 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Atención Prehospitalaria De Emergencias | Carlos Lopez Bigott | carlos.lopez@ues21.edu.ar | Todos los martes | 11 a 11:30 hs | Ingresá a la sala |
| Licenciatura En Hidrocarburos Y Geociencia | Marcela Maldonado | marcela.maldonado@ues21.edu.ar | Todos los martes | 15 a 16 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Hidrocarburos Y Geociencia | Marcela Maldonado | marcela.maldonado@ues21.edu.ar | Todos los martes | 15 a 16 hs | Ingresá a la sala |
| Ingeniería En Innovación Y Desarrollo | Segio Fritz | sergio.fritz@ues21.edu.ar | Todos los lunes | 13:30 a 14:30 hs | Ingresá a la sala |
| Licenciatura En Administracion De Infraestructura Tecnologica | Segio Fritz | sergio.fritz@ues21.edu.ar | Todos los lunes | 13:30 a 14:30 hs | Ingresá a la sala |
| Licenciatura En Inteligencia Artificial Y Robótica | Segio Fritz | sergio.fritz@ues21.edu.ar | Todos los lunes | 13:30 a 14:30 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Redes Informáticas Y Telecomunicaciones | Segio Fritz | sergio.fritz@ues21.edu.ar | Todos los lunes | 13:30 a 14:30 hs | Ingresá a la sala |
| Licenciatura En Fonoaudiología | Daina Anabella Rojos | daina.rojos@ues21.edu.ar | Todos los miércoles | 14 a 15 hs | Ingresá a la sala |
| Abogacía | Guadalupe Virasoro | guadalupe.virasoro@ues21.edu.ar | Todos los jueves | 14 a 15 hs | Ingresá a la sala |
| Procurador | Guadalupe Virasoro | guadalupe.virasoro@ues21.edu.ar | Todos los jueves | 14 a 15 hs | Ingresá a la sala |
| Licenciatura En Diseño De Indumentaria Y Textil | Candelaria Urrere | candelaria.urrere@ues21.edu.ar | Todos los martes | 11 a 12 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Gestión De Moda | Candelaria Urrere | candelaria.urrere@ues21.edu.ar | Todos los martes | 11 a 12 hs | Ingresá a la sala |
| Licenciatura En Administración Pública | Paola Ninci | paola.ninci@ues21.edu.ar | Todos los martes | 14 a 15 hs | Ingresá a la sala |
| Licenciatura En Ciencia Política Y Gobierno | Paola Ninci | paola.ninci@ues21.edu.ar | Todos los martes | 14 a 15 hs | Ingresá a la sala |
| Licenciatura En Relaciones Internacionales | Paola Ninci | paola.ninci@ues21.edu.ar | Todos los martes | 14 a 15 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Administración Y Gestión De Políticas Públicas | Paola Ninci | paola.ninci@ues21.edu.ar | Todos los martes | 14 a 15 hs | Ingresá a la sala |
| Licenciatura En Administración De Servicios De Salud | Pilar Maure | pilar.maure@ues21.edu.ar | Todos los martes | 14:00 hs | Ingresá a la sala |
| Tecnicatura En Gestión De Empresas Familiares | Pilar Maure | pilar.maure@ues21.edu.ar | Todos los martes | 14:00 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Gestión Administrativa De Servicios De Salud | Pilar Maure | pilar.maure@ues21.edu.ar | Todos los martes | 14:00 hs | Ingresá a la sala |
| Licenciatura En Kinesiologia Y Fisioterapia | Marcela Lavilla | marcela.lavilla@ues21.edu.ar | Todos los miércoles | 12:00 hs | Ingresá a la sala |
| Licenciatura En Psicología | Ana Estefania Azpilicueta | ana.azpilicueta@ues21.edu.ar | Todos los martes | 10 a 12 hs | Ingresá a la sala |
| Licenciatura En Bioinformática | Martina Ceballos | martina.ceballos@ues21.edu.ar | Todos los lunes | 15 a 16 hs | Ingresá a la sala |
| Escribanía | Federico Miguel | Federico.Miguel@ues21.edu.ar | Todos los miércoles | 16 a 17 hs | Ingresá a la sala |
| Licenciatura En Diseño Gráfico | Fernanda Vincenti | fernanda.vincenti@ues21.edu.ar | Todos los jueves | 14 a 15 hs | Ingresá a la sala |
| Licenciatura En Publicidad | Fernanda Vincenti | fernanda.vincenti@ues21.edu.ar | Todos los jueves | 15 a 16 hs | Ingresá a la sala |
| Licenciatura En Criminología Y Seguridad | Javier Chilo | Javier.Chilo@ues21.edu.ar | Todos los martes | 14 a 15 hs | Ingresá a la sala |
| Tecnicatura En Investigación De La Escena Del Crimen | Javier Chilo | Javier.Chilo@ues21.edu.ar | Todos los martes | 14 a 15 hs | Ingresá a la sala |
| Profesorado Universitario | Debora Brocca | debora.brocca@ues21.edu.ar | Todos los miércoles | 17 a 18 hs | Ingresá a la sala |
| Licenciatura En Educación - Ciclo | Debora Brocca | debora.brocca@ues21.edu.ar | Todos los miércoles | 17 a 18 hs | Ingresá a la sala |
| Licenciatura En Educación Y Nuevas Tecnologías | Debora Brocca | debora.brocca@ues21.edu.ar | Todos los miércoles | 17 a 18 hs | Ingresá a la sala |
| Licenciatura En Psicopedagogía | Debora Brocca | debora.brocca@ues21.edu.ar | Todos los miércoles | 17 a 18 hs | Ingresá a la sala |
| Licenciatura En Seguridad Informatica | Emmanuel Vilas | emmanuel.vilas@ues21.edu.ar | Todos los martes | 15 a 16 hs | Ingresá a la sala |
| Licenciatura En Comercialización | Luciana Mudry | Luciana.Mudry@ues21.edu.ar | Todos los jueves | 10 a 11 hs | Ingresá a la sala |
| Tecnicatura En Dirección De Equipos De Ventas | Luciana Mudry | Luciana.Mudry@ues21.edu.ar | Todos los jueves | 10 a 11 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Marketing Y Publicidad Digital | Luciana Mudry | Luciana.Mudry@ues21.edu.ar | Todos los jueves | 10 a 11 hs | Ingresá a la sala |
| Tecnicatura Universitaria En Diseño Y Desarrollo De Videojuegos | Fernando Cordoba | cordoba.fernando@ues21.edu.ar | Todos los martes | 11:30 a 12:30 hs | Ingresá a la sala |
| Contador Público | Pablo Bustos | pablo.bustos@ues21.edu.ar | Todos los martes | 10:00 a 11:00 hs | Ingresá a la sala |
| Tecnicatura En Administración Y Gestión Tributaria |  |  |  |  |  |
| Tecnicatura En Gestión Contable E Impositiva |  |  |  |  |  |
| Licenciatura En Administración Agraria | Esteban Papalini | esteban.papalini@ues21.edu.ar | Todos los martes | 11 a 12 hs | Ingresá a la sala |
| Licenciatura En Comercio Internacional | Gabriela Vazquez | Gabriela.Vazquez@ues21.edu.ar | Todos los martes | 17 a 18 hs | Ingresá a la sala |
| Licenciatura En Logística Global | Gabriela Vazquez | Gabriela.Vazquez@ues21.edu.ar | Todos los martes | 17 a 18 hs | Ingresá a la sala |
| Actuario | Nicolas Quaglia | nicolas.quaglia@ues21.edu.ar | Todos los martes | 09 a 10 hs | Ingresá a la sala |
| Licenciatura En Finanzas | Nicolas Quaglia | nicolas.quaglia@ues21.edu.ar | Todos los martes | 09 a 10 hs | Ingresá a la sala |
| Licenciatura En Inteligencia De Negocios Digitales | Nicolas Quaglia | nicolas.quaglia@ues21.edu.ar | Todos los martes | 09 a 10 hs | Ingresá a la sala |
| Licenciatura En Ciencia De Datos | Marcos Ugarte | marcos.ugarte@ues21.edu.ar | Todos los miércoles | 16 a 17 hs | Ingresá a la sala |
| Licenciatura En Higiene, Seguridad Y Medio Ambiente Del Trabajo | Matias Aparicio | Matias.Aparicio@ues21.edu.ar | Todos los lunes | 11 a 12 hs | Ingresá a la sala |
| Tecnicatura En Higiene Y Seguridad Laboral | Matias Aparicio | Matias.Aparicio@ues21.edu.ar | Todos los lunes | 11 a 12 hs | Ingresá a la sala |
|  |  |  |  |  |  |
| Licenciatura En Relaciones Públicas E Institucionales | Guadalupe Altamirano | guadalupe.altamirano@ues21.edu.ar | Todos los jueves | 14 a 15 hs | Ingresá a la sala |$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/encuentros-con-directores$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-equivalencias$pea0$,
        $pea0$EQUIVALENCIAS | La Nube 21$pea0$, $pea0$La Universidad Siglo 21 reconoce equivalencias de numerosas Universidades e instituciones para que sea más fácil comenzar a cursar la carrera que elijas, tanto en forma presencial como a distancia.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/equivalencias el 2026-11-08. Revisalo antes de publicar.

#### Equivalencias

La Universidad Siglo 21 reconoce equivalencias de numerosas Universidades e instituciones para que sea más fácil comenzar a cursar la carrera que elijas, tanto en forma presencial como a distancia.

Tipos de Equivalencias

Doble

Titulación

[Equivalencias Internas](https://www.lanube.21.edu.ar/equivalencias)

Idiomas

[Equivalencias Externas](https://www.lanube.21.edu.ar/equivalencias)

Estado de tu solicitud

#### Tipos de Equivalencias

#### Internas:

Es la posibilidad de que se analice si las materias que un estudiante ya tiene aprobadas en la misma universidad Siglo 21, puedan ser reconocidas como aprobadas también en la otra carrera que desea cursar.

#### Externas:

Es la posibilidad de que se analice si las materias que un estudiante tiene aprobadas en cualquier otra u otras instituciones educativas puedan ser reconocidas como aprobada también por la universidad.

- Si existe Regla (Ya existe un análisis previo para acreditar la materia aprobada que estás solicitando como equivalencia), el plazo de resolución de tu solicitud será de 3 días hábiles. Deberás presentar analítico y plan de estudios emitidos y legalizados por la institución de origen.

- Si no existe Regla (No hay un análisis previo para acreditar la materia aprobada que estás solicitando como equivalencia). Deberás seleccionar la materia Siglo que consideres que se deba otorgar como equivalencia en base a los contenidos mínimos de las mismas. Estos contenidos estarán disponibles en el Portal de equivalencias para que los analices, además deberás presentar la documentación para dar inicio al trámite. El plazo de gestión es de 30 días hábiles.

- Si la solicitud es mixta (La solicitud incluye materias que cuentan con un análisis previo para acreditar la materia aprobada que estás solicitando como equivalencia y materias que no tienen dicho análisis). Deberás seleccionar la materia Siglo que no tenga regla y consideres que se deba otorgar como equivalencia en base a los contenidos mínimos de las mismas. Estos contenidos estarán disponibles en el Portal de equivalencias para que los analices, además deberás presentar la documentación para dar inicio al trámite. El plazo de gestión es de 30 días hábiles.

- Si la solicitud es aprobada condicional sin predictamen. Si solicitaste materias sin regla, pero no presentaste la documentación completa y definitiva, se te van a otorgar las equivalencias que te auto sugeriste evaluando los contenidos mínimos de las materias siglo como regular condicional debiendo completar la documentación antes de la 5° semana de cursado del periodo del pedido, para acceder a las equivalencias definitivas. Si no se presentas la documentación en dicho plazo, o, una vez analizada la documentación, el tutor rechaza total o parcialmente las materias sugeridas, las materias auto sugeridas pasarán al estado Libre. En consecuencia, también quedarán en estado Libre todas las materias correlativas que dependan de ellas.

[Ingresá al Portal de Equivalencias](https://tusestudiosprevios.21.edu.ar/equivalencia)

#### ¿Cómo solicitar equivalencias internas?

Al hacer click en COMENZAR selecciona equivalencias Internas para iniciar la solicitud, y luego hacé clic en Confirmar.

Cargá tus datos personales y de contacto. Verificá que la información sea correcta y hacé clic en Siguiente para continuar.

Seleccioná la carrera o plan de destino para el que querés solicitar las equivalencias. Revisá las equivalencias disponibles y hacé clic en Siguiente.

Verificá que la carrera de origen y la carrera de destino sean correctas. Luego, seleccioná las materias aprobadas para las que querés solicitar equivalencias y hacé clic en Siguiente.

Verificá que toda la documentación requerida se encuentre disponible. Luego, aceptá los términos y condiciones y hacé clic en Finalizar para enviar la solicitud de equivalencias.

#### ¿Cómo solicitar equivalencias externas?

Al hacer click en COMENZAR selecciona equivalencias Externas para iniciar la solicitud, y luego hacé clic en Confirmar.

#### Paso 1: Completá tus datos personales

Cargá tus datos personales y de contacto. Verificá que la información sea correcta y hacé clic en Siguiente para continuar.

#### Paso 2: Elegí la institución y la carrera

- Seleccioná la institución de la que provenís.
- Luego, seleccioná la carrera y el plan de estudios que cursaste.

#### Paso 3: Conocé las equivalencias sugeridas.

Una vez que completes la institución y la carrera de origen, el portal te sugerirá las carreras de Siglo 21 que cuenten con un predictamen de equivalencias. Además, se mostrarán las materias equivalentes disponibles para esa combinación.

#### Paso 4: Seleccioná las materias aprobadas.

En este paso, seleccioná las materias que aprobaste en tu carrera de origen. Si alguna materia no figura en el listado, podés agregarla manualmente para incluirla en la solicitud de equivalencias.

En este paso, seleccioná las materias que aprobaste en tu carrera de origen. Si alguna materia no figura en el listado, podés agregarla manualmente para incluirla en la solicitud de equivalencias.

#### Paso 5: Completá la información de las materias.

Una vez seleccionadas las materias, completá los datos de aprobación de cada una.

Al finalizar la carga, se mostrará el paso 4 con el estado de las equivalencias:

- Si la materia tiene una equivalencia definida, se visualizará la asignatura correspondiente en la carrera de destino.

- Si la materia no tiene una equivalencia definida, deberás hacer clic en Agregar sugerencia de equivalencia.

- Luego selecciona la materia de Siglo 21 que consideres equivalente, tomando como referencia los contenidos mínimos y el programa de la materia cursada en tu institución de origen.

#### Paso 6: Adjuntá la documentación y finalizá la solicitud.

- Una vez que hayas completado la carga de todas las materias, adjuntá la documentación requerida, verificá que la información sea correcta, aceptá los términos y condiciones y hacé clic en Finalizar para enviar tu solicitud de equivalencias.

Una vez enviada la solicitud, el trámite quedará registrado y el sistema generará un número de solicitud para su seguimiento.

Además, recibirás en el correo electrónico que registraste durante la carga un correo de confirmación con el número de solicitud y una copia de los términos y condiciones aceptados.

A partir de ese momento, podrás consultar el estado de tu solicitud desde la opción Seguimiento de solicitudes disponible en el Portal de Equivalencias.

#### Consultá el estado de tu solicitud

1

Para consultar el estado de tu solicitud ingresá al portal de equivalencias al botón Seguimiento de solicitudes

2

Ingresá el número de solicitud y tu DNI

3

El portal te indicará el estado del trámite. En caso de que esté finalizado podrás consultar el resultado del mismo.

Para aquellas materias que no cumplan el porcentaje requerido de contenidos mínimos y sean rechazadas, podrás ver “ver motivo de rechazo".

Los estados posibles que puede tener tu solicitud son:

#### Documentación Aprobada

Si presentaste la documentación completa y definitiva, se te van a otorgan como aprobadas las materias con regla y tu tutor de carrera comenzará el análisis de las materias sin regla en un plazo de gestión de 30 días hábiles.

#### Pendiente de Documentación

En caso de que solicites equivalencias en materias sin Regla y la documentación se encuentre incompleta, Cuando solicitas materias sin regla pero la documentación que presentaste está incompleta, vas a recibir un mail indicando que completes la documentación en un plazo de 7 días. Si dentro de ese plazo, no envías la documentación de manera correcta, la solicitud se rechazará automáticamente.

#### Solicitud Aprobada Condicional

Si solicitaste materias con regla pero no presentaste la documentación completa y definitiva, se te van a otorgar las equivalencias como regular condicional debiendo completar la documentación antes de la 9° semana de cursado del periodo del pedido, para acceder a las equivalencias definitivas. Si no se presenta la documentación en dicho plazo, tanto las materias otorgadas como regular condicional como las correlativas que se haya cursado, se reprocesaran a libre.

#### Solicitud Rechazada

El formulario de solicitud no se puede modificar, por lo que si cometiste algún un error en los datos de institución y/o carrera de origen, se rechazará la solicitud y vas a recibir un mail indicándote el error y como realizar la carga.

#### Doble Titulación

La Universidad te ofrece la posibilidad de articular los estudios entre diferentes carreras de la oferta académica, con el objetivo que los estudiantes de una primera carrera puedan obtener también el título de una segunda carrera, en poco tiempo por contar con programas de estudio similares.

Para iniciar el trámite de Doble Titulación, debes comunicarte con el 0810 555 0202

IMPORTANTE:

Aquellos alumnos que hayan realizado doble titulación de la carrera de origen, NO podrán acceder a una doble titulación desde la carrera de destino. (ejemplo: de Abogacía a Lic en Recursos Humanos es válido, pero de Recursos Humanos a Lic en Relaciones Públicas e Institucionales NO)

Consultá las carreras en las que se encuentran reglamentadas para la Doble Titulación

INGRESÁ ACÁ

¿En qué casos puedo solicitar una Doble Titulación?

Si tu carrera de Origen tiene una Doble Titulación reglamentada con la carrera de Destino, podrás solicitar el inicio del trámite cuando:

- Tengas hasta el cuarto cuatrimestre aprobado en tu carrera de origen.

- Ya te egresaste de la carrera de origen.

Si aún no egresaste de tu carrera de origen:

- Materias que comparten el mismo código en ambas carreras: Se te van a otorgar automáticamente en la carrera de destino, aquellas materias que tienen el mismo código en tu carrera de origen y ya aprobaste. Aquellas materias que aún no cursaste en tu carrera de Origen, se van a ir otorgando en tu carrera de Destino a medida que las vayas aprobando.​

Estas materias que comparten el mismo código en ambas carreras, deberás cursarlas en tu carrera de Origen. Por esto, si intentás inscribirte desde la carrera de Destino a una de estas materias, no podrás hacerlo sino que deberás cursarla y aprobarla en tu carrera de origen.

- Materias que apuntan a las mismas competencias en ambas carreras: Se te van a otorgar de manera condicional en la carrera de Destino. Una vez que egreses de la carrera de Origen, estas materias por competencias serán aprobadas en la carrera de Destino. En caso de que solicites la baja de tu carrera de origen antes de egresarte, aquellas materias que se te otorgaron de manera condicional en tu carrera de destino, cambiarán al estado No cursada.

- ¿Cómo se ven estas materias en el Portal de Estudiantes?

Si haces clic sobre la tarjeta verde correspondiente al legajo de la carrera de destino, vas a poder ver las materias que la conforman agrupadas en:

- Aprobadas: Aquí verás las materias otorgadas porque comparten el mismo código en ambas carreras.

- Pendientes: Aquí se listarán las materias que aún debes cursar y aprobar.

- Condicionadas: Aquí verás las materias por competencia aprobadas de manera condicional. Estas materias se cambiaran a aprobadas cuando te egreses de la carrera de origen.

Si ya egresaste de tu carrera de origen:

En este caso se te van a otorgar automáticamente en la carrera de destino, aquellas materias que tienen el mismo código en tu carrera de origen y ya aprobaste. También serán otorgadas, aquellas materias que apuntan a las mismas competencias.​

- ¿Cómo se ven estas materias en el Portal de Estudiantes?

Al ser egresado de tu carrera de Origen, en tu Portal de Estudiantes vas a ver la totalidad de las materias aprobadas por equivalencias. Si haces clic sobre la tarjeta verde correspondiente al legajo de la carrera de destino, vas a poder ver las materias que la conforman agrupadas en:

- Aprobadas: Aquí verás las materias otorgadas por la Doble Titulación

- Pendientes: Aquí se listarán las materias que aún debes cursar y aprobar de la carrera de Destino.

IMPORTANTE:

​Tene en cuenta que la doble titulación te exime de cursar seminario final, y se te otorgará luego de aprobar EFIP II.

¿Cómo consulto el estado del trámite una vez que solicité la Doble Titulación?

Una vez que solicitaste la Doble Titulación, podrás hacer un seguimiento desde el Portal de Equivalencias con el número de trámite y tu DNI.

Aquí podrás ver el Estado del Trámite

Aquí podrás ver las materias otorgadas

#### Idiomas

Podes solicitar la eximición del idioma Inglés si rendiste alguna Certificación Nacional o Internacional.

Conocé los Certificados

habilitados para la eximición

Ingresa Acá

Documentación a enviar en caso de Certificados Nacionales

- Fotocopia de 1º y 2º hoja de DNI.
- Comprobante del pago del trámite
- Fotocopia legalizada de Título de Licenciado, Profesor o Traductor; pudiendo ser de nivel Universitario o Terciario siempre y cuando cuenten con el respaldo del Ministerio de Educación de la Nación Argentina (títulos oficiales).

Documentación a enviar en caso de Certificados Internacionales

- Fotocopia de 1º y 2º hoja de DNI.
- Fotocopia legalizada del Certificado de Examen de Inglés aprobado.

¿Cómo cargar la solicitud de eximición de idiomas?

Para solicitar la eximision de idiomas, deberás cargar tu solicitud en nuestro Portal de Equivalencias.

Ingresá al Portal de Equivalencias$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/equivalencias$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-eximicion-idiomas$pea0$,
        $pea0$EXIMICIÓN IDIOMAS$pea0$, $pea0$EXIMICIONES POR CERTIFICADOS INTERNACIONALES INGLÉS$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/post/eximici%C3%B3n-idiomas el 2026-11-09. Revisalo antes de publicar.

**EXIMICIONES POR CERTIFICADOS INTERNACIONALES INGLÉS**

Podes solicitar la eximición del cursado de las materias correspondientes a Idioma Extranjero, siempre que cumplas con las siguientes condiciones:

-Tenes estudios previos de Inglés, con certificación internacional comprobable.

-Que el certificado provenga de alguna de las siguientes instituciones:

**University of Cambrige:**

FCE (First Certificate in English).

CAE (Certificate in Advanced English).

CPE (Certificate in Proficiency English).

BEC (Vantage & Highier).

IELTS (5-6-7-8-9).

**Trinity Exams:**

ISE II (Intergrated Skills in English).

GESE 7-8-9 (Graded Examinations in Spoken English).

**ETS (English Testing Services) TOEFL (Test of English as a Foreign Language):**

TOEFL iBT (Internet Based) 60 o más.

TOEFL (Computer) 173 o más.

TOEFL (Paper) 500 o más.

BULATS (60-74) o más.

TOEIC (Test of English for International Communication) 600 o más.

**Anglia Examinations:**

Advanced. AcCEpt Proficiency.

Masters.

**Colegio San Pedro Apóstol:**

Bachillerato Internacional “Ingles B” (Calificación 5 o más).

**Bachillerato Internacional “Inglés B”**

Bachillerato Internacional “Inglés B” (Calificación 5 o más emitido por instituciones que hayan sido certificadas y habilitadas como Centros Evaluadores).

**Oxford University Press certificados por Oxford University**

Se reconocen los programas y exámenes de Oxford University Press, certificados por Oxford University de la siguiente manera:

Serán eximidos de la obligatoriedad de rendir placement test de inglés y cursar los niveles de inglés que presente su plan de estudios, aquellos estudiantes que hayan rendido exámenes de **Oxford University Press** certificados por Oxford University, que demuestren un **nivel equivalente a B2** en el Marco Común Europeo de Referencia (CEFR).

**Cambridge Assessment International Education**

Se reconocen los programas y exámenes de Cambridge Assessment International Education de la siguiente manera:

Serán eximidos de la obligatoriedad de cursar y rendir la materia inglés en el curso de ingreso, aquellos estudiantes que hayan rendido exámenes de **Cambridge** International que demuestren un **nivel equivalente a B2** en el Marco Común Europeo de Referencia (CEFR).

**EQUIVALENCIAS ACEPTADAS PARA IDIOMA PORTUGUES**

Tener títulos Universitarios o Terciarios de validez nacional, Licenciaturas, Profesorados o Traductorados de Inglés o portugués.

El Certificado de Proficiência em Língua Portuguesa para Estrangeiros (Celpe Bras).

Este Certificado es otorgado por el Ministerio de Educación de Brasil a extranjeros-no nativos de Brasil. Se certifican los niveles: intermedio, intermedio superior, avanzando y avanzado superior. En ambos casos, deben cumplir los requisitos y procedimientos establecidos para la solicitud de equivalencias.

CONOCÉ CÓMO SOLICITAR LAS EXIMICIONES PARA IDIOMAS$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/post/eximici%C3%B3n-idiomas$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$atencion-y-derivaciones$pea0$), null, 0, $pea0$ln-gabinete-de-bienestar-1$pea0$,
        $pea0$Gabinete de Bienestar| La Nube 21$pea0$, $pea0$Te damos la bienvenida al espacio del Gabinete de Bienestar. Aquí vas a encontrar herramientas que te ayudarán a organizar el estudio de tus materias, te enseñarán cómo aprender a estudiar, y cómo…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/gabinete-de-bienestar-1 el 2026-11-08. Revisalo antes de publicar.

### Gabinete de Bienestar

Te damos la bienvenida al espacio del Gabinete de Bienestar. Aquí vas a encontrar herramientas que te ayudarán a organizar el estudio de tus materias, te enseñarán cómo aprender a estudiar, y cómo manejar tus emociones en el momento de presentarte a un examen, sin importar en qué modalidad de la Universidad estés cursando tus materias.

¿En qué podemos acompañarte?

Solicitá un encuentro

[Espacios de acompañamiento](https://www.lanube.21.edu.ar/gabinete-de-bienestar-1)

EFIP y

Defesa Oral

[Recursos para vos](https://www.lanube.21.edu.ar/gabinete-de-bienestar-1)

#### ¿Qué es el Gabinete de Bienestar?

El propósito del Gabinete de Bienestar es acompañarte a lo largo de tu vida académica, brindándote herramientas para afrontar cada etapa de tu recorrido de manera eficiente y con bienestar.

Estamos para escucharte, orientarte y asesorarte ante los distintos desafíos que puedan surgir durante tu carrera, impulsándote a alcanzar tus metas y concretar tu proyecto académico y profesional, en un camino hacia el bienestar y la felicidad.

En el Gabinete de Bienestar trabajan de manera conjunta psicólogos y psicólogas egresados de Siglo 21, con un alto nivel técnico y una mirada cercana y humana. Podrás conversar e interactuar con ellos ante los distintos desafíos que representa cada hito de tu carrera, encontrando un espacio de escucha, orientación y acompañamiento.

La misión del Gabinete es que como estudiante de Siglo 21, cuentes con un espacio donde se te escuche y puedas encontrar un pilar sobre cómo gestionar tu vida universitaria, para que el sueño de recibirte y convertirte en profesional este cada día más cerca y se haga realidad de la mejor manera.

#### ¿En qué podemos acompañarte?

Tu recorrido universitario tiene distintos momentos. Encontrá herramientas y acompañamiento para transitar cada uno de ellos.

#### Solicitá un turno

¿Necesitás un espacio para vos? Podés solicitar un encuentro individual con un profesional del Gabinete de Bienestar.

Encontrá un espacio de escucha, acompañamiento y orientación para transitar los desafíos de tu vida universitaria.

#### Te presentamos a nuestro equipo

Conocé a los profesionales que forman parte del Gabinete de Bienestar y que están para acompañarte en tu recorrido universitario.

#### Espacios de acompañamiento

Te acompañamos en tu trayectoria universitaria, brindándote espacios de orientación, escucha y bienestar. Mirá las próximas fechas:

#### Desafíos de tu carrera

#### Ciclo de bienestar y preparación para EFIP

Te invitamos a participar del ciclo de EFIP especialmente diseñado para acompañarte en este momento clave.​​

​​​

### Preparáte para tu Defensa Oral con nuestro ciclo de acompañamiento

#### ¡Preparate de la mejor manera para este gran paso!

En este ciclo de dos talleres te acompañamos en la preparación para la defensa oral de tu Trabajo Final de Grado, integrando herramientas técnicas y emocionales.

Vas a trabajar en la estructura y el guion de tu presentación, el desarrollo de materiales visuales, la práctica cronometrada y los simulacros con audiencia real. Además, vas a incorporar herramientas para gestionar la ansiedad, el autosabotaje y el diálogo interno.

El objetivo es que llegues a tu defensa con mayor preparación, confianza y seguridad.

#### Herramientas para tu bienestar

Te compartimos recursos breves para incorporar a tu rutina y acompañarte cuando lo necesites.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/gabinete-de-bienestar-1$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$oferta-academica$pea0$), null, 0, $pea0$ln-idiomas$pea0$,
        $pea0$IDIOMAS | La Nube 21$pea0$, $pea0$menu$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/idiomas el 2026-11-08. Revisalo antes de publicar.

menu

### Idiomas

En este espacio encontras una guía para transitar y aprovechar al máximo el cursado de tu materia Idioma Inglés en la plataforma English Discoveries – Edusoft; y de Idioma Portugués Avanzado I y II en tu Aula Virtual (CANVAS).

Inglés

Portugués

¿Cuáles son los Certificados

habilitados para la eximición?

¡Conócelos acá!

#### Placement Test o Prueba de Nivelación

El Placement Test de Inglés es una evaluación que permite conocer tu nivel de dominio del idioma inglés para ubicarte en el nivel correspondiente en relación a contenidos de la plataforma de cursado.

El primer paso es realizar el examen de nivelación (Placement Test). Para prepararte, es fundamental que veas los videos que tu docente te envió a través de la mensajería de Canvas.

Este examen permitirá ubicarte en un nivel dentro del MCER (Marco Común Europeo de Referencia para las Lenguas), un estándar internacional que define las competencias lingüísticas.

A partir de este resultado, comenzarás tu cursado acompañado por tu tutor virtual en Canvas.

Antes de realizarlo, es importante que revises los requisitos técnicos necesarios y conozcas cómo se desarrolla el examen.

A continuación, encontrarás la información clave para prepararte antes de comenzar:

Sobre el examen

​A partir del resultado obtenido en tu examen, el sistema te ubicará en el nivel correspondiente para comenzar tu cursado.

El examen tiene una duración de 1 hora y está compuesto por 100 preguntas.

Antes de rendir: Requisitos técnicos

El Placement Test de Inglés se rinde a través de una extensión de Klarway que debe instalarse en el navegador Google Chrome.

La instalación de la extensión se realiza desde tu Aula Virtual (Canvas), donde encontrarás el acceso para instalarla antes de comenzar el examen.

Este examen no se rinde desde la aplicación habitual de Klarway utilizada para otros exámenes, sino mediante una extensión que debe instalarse en el navegador de Google Chrome.

​​​

Es requisito obligatorio realizar el examen utilizando el navegador de Google Chrome, ya que la extensión necesaria para rendir funciona únicamente en ese navegador.

#### ¿CÓMO Y DONDE SE CURSA IDIOMA INGLES?

La plataforma de cursado es English Discoveries, desarrollada por Edusoft Ltd., líder global en soluciones de evaluación y aprendizaje del idioma inglés. Esta plataforma ofrece 10 cursos alineados con el MCER (Marco Común Europeo de Referencia para las Lenguas).

El sistema cubre las principales habilidades del idioma y cuenta con tecnología diseñada para el aprendizaje en línea, optimizada para su uso en PC y Tablet.

Una vez que estés inscripto en la materia, podrás acceder a la plataforma desde tu Aula Virtual (Canvas). Allí deberás hacer clic en el botón verde “ENTRAR”, que encontrarás debajo de la presentación, para ingresar a English Discoveries.

Para que tus avances se guarden correctamente, recordá cerrar siempre la sesión (log out) desde la plataforma English Discoveries y no cerrar las actividades directamente desde la ventana del navegador. Ante cualquier inconveniente de acceso, se recomienda borrar las cookies del navegador antes de volver a ingresar.

Requisitos técnicos para el uso de Edusoft

Recordá que tu cátedra estará vinculada a un Profesor Virtual, quien te acompañará durante todo el cursado de la materia. Este docente tendrá visibilidad de tu avance en la plataforma y se comunicará con vos a través de la mensajería de tu Aula Virtual (Canvas) para orientarte y resolver tus dudas académicas.

#### ¿Cuándo comienza y cuánto dura el cursado?

Podrás inscribirte a partir de la segunda matrícula abonada de tu Carrera, a través de Portal Estudiantes. La materia tiene apertura en los períodos A: marzo y agosto.

El plazo de inscripción es el regido por el año calendario para las materias cuatrimestrales.

La licencia tiene una vigencia de un año calendario (12 meses), a partir de la fecha de apertura oficial del curso.

#### ¿Cual es el trayecto que debo realizar?

Antes que nada, deberás realizar el Test de nivelación. El resultado obtenido te colocará en un nivel determinado y a partir de allí tendrás que cursar los niveles correspondientes para obtener la regularidad de la materia. Cada nivel consta de 10 unidades temáticas.

Estudiarás según tu ritmo personal, pero es recomendable que cada nivel sea cursado en no más de 6 semanas. Este es el tiempo sugerido para lograr el aprendizaje; sin embargo, cada estudiante tiene la responsabilidad de administrar sus tiempos para cubrir los niveles dentro de la duración del cursado (un año calendario).

#### ¿En qué consiste cada Nivel?

Cada nivel está compuesto por distintos segmentos con ejercicios de expresión oral, auditiva, lectura comprensiva, gramática y vocabulario.

Para acceder al nivel siguiente, deberás aprobar el nivel en curso, razón por la cual no tendrás acceso a otro nivel que el que estás cursando.

Para aprobar cada nivel y avanzar al siguiente, es necesario alcanzar un progreso académico y una puntuación mínima de 70.

IMPORTANTE:

No olvides transitar y completar cada sección sin saltear audios, videos, ejercicios o evaluaciones intermedias. De lo contrario, las secciones te figurarán incompletas y no se contabilizará el avance en el progreso general.

Una vez que cumplas estos requisitos, se te habilitará el Final Course Test, que deberás aprobar con puntuación igual o mayor a 70.

El porcentaje de progreso en el nivel (Course Completion) y la puntuación promedio (Average Test Score) se registran en el cuadro inicial, debajo de la presentación del nivel, como indica la imagen.

#### Programas por Nivel

Revisá cada programa sectorizado por nivel:

#### Programa de

#### IDIOMA EXTRANJERO (INGLÉS) I

1

#### IDIOMA EXTRANJERO (INGLÉS) III

3

#### IDIOMA EXTRANJERO (INGLÉS) V

5

#### IDIOMA EXTRANJERO (INGLÉS) II

2

#### IDIOMA EXTRANJERO (INGLÉS) IV

4

#### IDIOMA EXTRANJERO (INGLÉS) VI

6

#### ¿Cómo accedo al Final Course Test o Examen Final del Nivel?

En cuanto se te habilite el Final Course Test o Examen Final del Nivel, verás la notificación de examen habilitado en la columna de la izquierda, en el ícono “Assessments”:

Para acceder, debes hacer clic en “Assessments”, luego en “Available Tests”, y por último en el botón verde “Start Test”.

Podes rendir todas las veces que sea necesario, hasta alcanzar el porcentaje requerido para aprobarlo (70).

IMPORTANTE:

Este Examen Final de Nivel es el que te permite pasar de un nivel a otro; NO corresponde al examen final para aprobar la materia.

Para conocer cómo es el examen final integrador para aprobar la materia, consultá más abajo la sección

[¿Cómo es el examen final integrador?](https://www.lanube.21.edu.ar/idiomas)

#### ¿Cómo se regulariza?

Alcanzarás la regularidad al aprobar con una calificación de 70% en el examen final de tu último nivel según Placement Test.

¿Cómo saber si ya obtuviste la regularidad?

- Cuando completes tu trayectoria en la plataforma Edusoft, vas a ver la nota de tu último examen cargada en la sección TP1 en tu Aula Virtual (Canvas). Ese registro indica que ya cumpliste con las actividades requeridas.

- Una vez cargada esa nota, la regularidad se reflejará en el Portal Estudiantes.

¿Qué sucede si no ves la nota en el TP 1?

Antes de hacer un reclamo, te recomendamos:

- Revisar el PDF que compartió tu docente para confirmar si cumpliste con el 100% de los requisitos.
- Si cumpliste con todo, contactá a tu docente y solicitá la carga de la nota en TP1.

La regularidad tiene una duración de 18 meses, plazo con el que contarás para rendir el examen final integrador hasta en 3 oportunidades.

IMPORTANTE:

Si por algún motivo debes recursar la materia, el avance que hayas obtenido no se va a guardar y tendrás que inscribirte nuevamente para cursar la materia desde el inicio.

#### ¿Cómo es el examen final integrador para aprobar la materia?

El examen consta de 50 preguntas de opción múltiple y debe aprobarse con una nota mínima de 4.

En la evaluación se contemplan los contenidos estudiados en la plataforma. Las áreas a examinar son lectura comprensiva, gramática y vocabulario. No se evaluarán ejercicios de comprensión auditiva (listening), expresión oral (speaking) ni producción escrita (writing).

Al momento de rendir NO podrás utilizar glosarios, diccionarios, listados de verbos ni ningún otro material de consulta.

Debés inscribirte al examen final desde tu Portal de Estudiantes, respetando los días y horarios disponibles.

Rendís a través del Sistema Online de Exámenes, desde la plataforma Klarway, tal como lo hacés habitualmente en tus exámenes finales.

Para más información sobre exámenes finales, podés consultarlo en el Reglamento Institucional:

[Ir al reglamento](https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21)

### GLOSARIO

Average Test Score: Indica el promedio de calificaciones obtenido como resultado de las evaluaciones parciales correspondientes al nivel en curso.

Course Completion: Indica el porcentaje de avance alcanzado por el alumno en el nivel en curso.

Edusoft: Es la organización privada de evaluación e investigación educativa, que nos brinda la plataforma English Discoveries como herramienta de aprendizaje y evaluación del idioma inglés.

English Discoveries: Plataforma de aprendizaje utilizada para el cursado de Idioma Inglés, compuesta por 10 niveles que abarcan desde principiante hasta avanzado.

Final Course Test: Examen final del nivel en curso.​

Placement Test: Prueba de Nivelación que evalúa los conocimientos del alumno en Idioma Inglés, y lo ubica en el nivel correspondiente dentro de la plataforma.

TOEIC BRIDGE es tu examen de nivelación que está basado en una certificación internacional de ETS (English Testing services) referenciado al MCRE (Marco común europeo de las Lenguas)

TOEIC: Es una certificación con validez internacional requerida en organizaciones y diversos espacios profesionales.

OLPC: Oficial Learning Preparation Course. Contenido opcional que podés cursar en la plataforma para obtener, luego de tu inscripción, la certificación oficial de ETS.

#### ¿CÓMO CURSO PORTUGUÉS AVANZADO I Y II?

Si tu carrera tiene Idioma Extranjero VII y VIII, significa que tendrás como segundo idioma Portugués Avanzado I y II. Cursarás ambas materias luego de aprobar Idioma Inglés.

Portugués Avanzado I y II son correlativas entre sí, por lo que deberás primero regularizar Idioma Portugués Avanzado I para poder cursar luego Idioma Portugués Avanzado II.

Para cursar portugues, deberas tener aprobado Idioma Ingles​

​ La inscripción se realiza a través del Portal de Estudiantes

​La materia figura como:

- Idioma Extranjero VII - Portugués Avanzado I
- Idioma Extranjero VIII - Portugués Avanzado II

#### ¿Cómo se cursa esta materia?

Portugués Avanzado I y II se cursan íntegramente en tu Aula Virtual (Canvas) y se cursa de manera bimestral para todas las modalidades, exceptuando la Modalidad Presencial, en la que se cursa de manera cuatrimestral.

Estas materias son de tipología MEC, por lo que tienen las siguientes condiciones de cursado:

#### Regularidad

#### ​

#### ¿Qué necesitás para lograr esta condición?

- 3 de 4 TPs con nota 5 ó más, presentados antes del vencimiento de la actividad.

- 2 parciales con nota 5 ó más, sea en instancia de parcial, recuperatorio o integrador.​

#### Libre por Nota

- La materia quedará en este estado cuando no se cumplan las condiciones de regularidad.

#### Promoción Directa

- 3 de 4 TPs con nota 7 ó más, presentados antes del vencimiento de la actividad.

- 2 parciales con nota 7 ó más, sea en instancia de parcial, recuperatorio o integrador.​

#### Libre

- La materia quedará en este estado cuando se hayan utilizado todas las oportunidades para rendir la materia, sin poder aprobar la misma o cuando haya vencido el plazo para rendir el examen final.

#### Promoción Indirecta

- 4 de 4 TPs con nota 7 ó más, presentados antes del vencimiento de la actividad.

- 2 parciales con nota 5 ó 6, sea en instancia de parcial, recuperatorio o integrador.

IMPORTANTE:

Al tratarse de una materia de tipología MEC, se aplica la Valoración de Tiempo de Entrega en la calificación de los trabajos prácticos.

Si queres conocer más de esta política

Ingresá acá

Revisá cada programa sectorizado por nivel:

#### Portugues Avanzado I

1

#### Portugues Avanzado II

1

#### ¿Cómo se rinde el examen final?

- Regular:

- 30 preguntas
- Se aprueba con nota 4 ó más
- Contas con un límite de hasta 3 instancias para rendir y un plazo máximo de 18 meses. Tené en cuenta que si te inscribis para rendir, pero no te presentas, las ausencias cuentan como aplazo.

- Libre por Nota

- 50 preguntas
- Se aprueba con nota 4 ó más
- Contas con una oportunidad para rendir y un plazo máximo de 6 meses. Tené en cuenta que si te inscribis para rendir, pero no te presentas, las ausencias cuentan como aplazo.

IMPORTANTE:

El examen final evalúa los contenidos comprendidos en el Canvas más la bibliografía obligatoria indicada en el programa, a través de ejercicios de lectura comprensiva, gramática y vocabulario. No se incluyen ejercicios de expresión oral ni comprensión auditiva.

Durante el examen final no se pueden utilizar elementos que puedan servir de ayuda como diccionarios, glosarios, listados de verbos, o cualquier otro similar.

Up$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/idiomas$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-inscripcion-a-examenes$pea0$,
        $pea0$Inscripción a exámenes$pea0$, $pea0$Desde el Portal de Estudiantes podés gestionar la inscripción a tus parciales, recuperatorios, integradores y exámenes finales, según tu modalidad.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/inscripci%C3%B3n-a-examenes el 2026-11-09. Revisalo antes de publicar.

#### Inscripción a Exámenes

Desde el Portal de Estudiantes podés gestionar la inscripción a tus parciales, recuperatorios, integradores y exámenes finales, según tu modalidad.

En esta guía encontrarás cómo realizar la inscripción, los horarios disponibles y la información específica para cada tipo de evaluación.

Parciales modalidad Distancia

Parciales

Presencial

PH

Presencia Distribuida

Recuperatorios Integradores

Exámenes

Finales

#### PARCIALES
Modalidad Distancia ED - EDH

#### ¿Cuándo me inscribo a los parciales?

#### Ahora podés planificar tus evaluaciones desde el inicio del cursado.

#comp-msd8tkrk1 svg [data-color="1"] {fill: #36D1B5;}

#### Materias Bimestrales

La modalidad de cursado no cambia y seguís teniendo la posibilidad de elegir el día y el horario en que querés rendir tus parciales. Recordá que podés hacerlo dentro de los plazos establecidos.

### Plazos para inscribirte:

### ​

- Primer Parcial: hasta el 18 de octubre.

- Segundo Parcial: hasta el 10 de noviembre.

Si no realizás la inscripción dentro del plazo correspondiente, el sistema asignará automáticamente una fecha para rendir.

Organizá tus evaluaciones con mayor anticipación, para distribuir mejor tu tiempo de estudio y evitar tener que resolver todo sobre el final del bimestre.

Desde la primera semana de cursado vas a poder inscribirte tanto al Parcial 1 como al Parcial 2. Esta mejora te permite tener una visión completa del calendario y planificar con tiempo.

Duración del examen parcial: 40 minutos.

Ausencia: Si no asistís al parcial, la evaluación quedará registrada como Ausente.

#comp-msdaiohk svg [data-color="1"] {fill: #36D1B5;}

#### Materias Cuatrimestrales

Duración del examen parcial: 40 minutos.

Desde el inicio del cursado tendrás habilitada la inscripción al Primer Parcial y al Segundo Parcial.

Podrás elegir la fecha y la franja horaria en la que preferís rendir cada evaluación, organizando ambas instancias desde el comienzo del semestre.

- Primer Parcial: hasta el 14 de agosto.

- Segundo Parcial: hasta el 4 de septiembre.

#### ¿Cómo me inscribo a los parciales?

1. Ingresá al Portal del Estudiante. A través del menú lateral ingresá a la sección Exámenes y hacé clic en Nueva inscripción.

#### 2. Elegí la materia que querés rendir. Vas a visualizar todas las materias disponibles. Podés seleccionar:

- Parcial 1
- Parcial 2

#### ​

#### No necesitás esperar a rendir el primer parcial para inscribirte al segundo.

#### 3. Elegí la fecha y el horario:

Una vez seleccionado el lugar, se mostrará el calendario con las fechas disponibles.

Solo tenés que:

- Elegir el día en el calendario.
- Seleccionar el horario disponible.
- Verificar que el resumen de inscripción esté completo.
- Hacer clic en Inscribirme al examen para confirmar la inscripción.

#comp-msd8tkrr2 svg [data-color="1"] {fill: #36D1B5;}

#### Franjas Horarias

Al momento de inscribirte, deberás seleccionar una de las franjas horarias disponibles para rendir tu parcial. Elegí la que mejor se adapte a tu organización y disponibilidad.

Horarios disponibles:

Lunes a viernes:

- 06:00 a 09:00
- 09:00 a 13:00
- 13:00 a 17:00
- 17:00 a 20:00
- 20:00 a 22:00

Sábados y domingos:

- 01:00 a 04:00
- 04:00 a 09:00
- 09:00 a 13:00
- 13:00 a 17:00
- 17:00 a 20:00
- 20:00 a 22:00

#### PARCIALES
Modalidad Presencial - Presencial Home - Presencial Distribuida

No será necesario que realices la inscripción al parcial. La fecha, el lugar y la franja horaria de tus parciales serán asignados de acuerdo con el cronograma correspondiente a tu modalidad y podrás consultarlo desde tu Portal Estudiantes.

Modalidad Presencial y Presencial Dsitribuida

- Primer Parcial: semanas 7 y 8.
- Segundo Parcial: semanas 14 y 15.

Modalidad Presencial Home

Materias bimestrales:

- Primer Parcial: semanas 3 y 4.
- Segundo Parcial: semanas 7 y 8.

Materias cuatrimestrales:

- Primer Parcial: semanas 7 y 8.
- Segundo Parcial: semanas 16 y 17.

#### Recuperatorios - Integradores

Deberás realizar la inscripción al Recuperatorio o Integrador desde el Portal de Estudiantes hasta 24 horas antes de la fecha en la que querés rendir.

- Ingresá a Exámenes.
- Hacé clic en Nueva inscripción.
- Seleccioná la materia y la instancia Recuperatorio.
- Elegí el lugar, la fecha y la franja horaria disponible.
- Confirmá la inscripción.

Una vez finalizada, podrás consultar el detalle de tu inscripción desde la sección Exámenes.

#### ¿Cuándo se rinde?

Modalidad Distancia ED - EDH

Materias bimestrales:​ semana 9

Materias cuatrimestrales:​ semana 18

Modalidad Presencial y Presencial Distribuida

- Semana 16

Modalidad Presencial Home

Materias bimestrales:​ semana 9

Materias cuatrimestrales:​ semana 18

Duración del examen Recuperatorio: 40 minutos.

Duración del examen Integrador: 60 minutos.​

- Franjas Horarias

Al momento de inscribirte, deberás seleccionar una de las franjas horarias disponibles para rendir tu examen. Elegí la que mejor se adapte a tu organización y disponibilidad.

Horarios disponibles:

Lunes a viernes:

- 06:00 a 09:00
- 09:00 a 13:00
- 13:00 a 17:00
- 17:00 a 20:00
- 20:00 a 22:00

Sábados y domingos:

- 01:00 a 04:00
- 04:00 a 09:00
- 09:00 a 13:00
- 13:00 a 17:00
- 17:00 a 20:00
- 20:00 a 22:00

#### EXÁMENES FINALES

La inscripción a exámenes finales debe realizarse desde el Portal de Estudiantes con al menos 4 (cuatro) días corridos de anticipación a la fecha del examen.

Si necesitás anular tu inscripción, podrás hacerlo antes de que sea aceptada, es decir, hasta 8 (ocho) días corridos antes de la fecha del examen solicitada.

Los exámenes finales se rinden en las fechas publicadas para cada mesa de examen. Al momento de la inscripción, podrás seleccionar una de las fechas disponibles según tu modalidad y la oferta de mesas habilitadas.

Educación Distribuida (ED) y Educación Distribuida Home (EDH)

Los exámenes finales se rinden en las fechas y horarios publicados por el Centro de Apoyo Universitario (CAU) o Sede seleccionada. Al momento de la inscripción, desde tu Portal Estudiantes podrás elegir una de las mesas disponibles y la franja horaria correspondiente.

Modalidad Presencial (P) y Modalidad Presencial Distribuida (PD)

Los exámenes finales se rinden en las fechas publicadas en el Portal de Estudiantes. Una vez habilitadas las mesas de examen, podrás realizar la inscripción seleccionando la fecha y la franja horaria disponible.

Modalidad Presencial Home (PH)

Los exámenes finales se rinden en las fechas publicadas en el Portal de Estudiantes. Una vez habilitadas las mesas de examen, podrás realizar la inscripción seleccionando la fecha y la franja horaria disponible.

Duración del examen final para todas las modalidades: 90 minutos.

​​​

#### ¿Cómo me inscribo a los finales?

PASO 1

Ingresá en la sección Exámenes y hacé clic en el botón + Nueva Inscripción.

A continuación, se desplegará la siguiente pantalla en cuya parte superior verás los datos principales de la carrera que estás cursando, y debajo de esta información las materias a las que podés inscribirte para rendir examen separadas en dos pestañas: Finales y Parciales. Hace clic en Finales.

PASO 2

Selecciona la materia de la pestaña Finales a la que queres inscribirte para rendir examen el final.

A la derecha, el formulario “Resumen de inscripción” se irá auto-completando con los datos que vayas ingresando para realizar la inscripción al examen de la materia seleccionada.

PASO 3

Una vez confirmado el lugar, seleccioná la mesa en la que rendirás el examen; es decir, elegí la fecha y el horario publicados en los que realizarás el examen.

PASO 4

Hacé clic en el botón Inscribirme al examen dentro del “Resumen de inscripción” para completar la inscripción.

Luego, hacé clic en el botón Confirmar. A continuación, se desplegará un mensaje que anuncia que la inscripción al examen ha sido exitosa.

#### AUSENCIA
EXAMEN PARCIAL / RECUPERATORIO / INTEGRADOR / FINAL

#### Si no asistís al examen en la fecha y horario asignados, la evaluación quedará registrada como Ausente.

#### ​

- En parciales, recuperatorios e integradores, la inasistencia no habilita la reprogramación de la evaluación.
- En exámenes finales, además de registrarse el Ausente, perderás una de las oportunidades disponibles para rendir la materia antes de quedar en condición de Libre.

Existen situaciones de excepción contempladas en la normativa institucional vigente.

#### ¿Cómo ver tus inscripciones?

Para visualizar tus inscripciones a exámenes, simplemente dirígete a una de las siguientes pestañas:

- A Rendir: te mostrará todas las inscripciones activas para rendir un examen a futuro.

- Históricas: acá podrás ver las inscripciones que realizaste en el pasado para rendir exámenes.

#### Modalidad PH

#### Modalidad P

#### Modalidad ED

#### Modalidad EDH

Up$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/inscripci%C3%B3n-a-examenes$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$aranceles-y-pagos$pea0$), null, 0, $pea0$ln-inscripcion-a-materias$pea0$,
        $pea0$Inscripción a materias$pea0$, $pea0$¿Queres saber cómo generar tus tickets e inscribirte a tus materias? Seguí el paso a paso según tu modalidad de cursado.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/inscripci%C3%B3n-a-materias el 2026-11-08. Revisalo antes de publicar.

¿Queres saber cómo generar tus tickets e inscribirte a tus materias? Seguí el paso a paso según tu modalidad de cursado.

​¡Encontrá toda la información en esta guía!

Periodo de Inscripción

Normas Arancelarias

¿Cómo generar mis tickets?

¿Cómo abono mis tickets?

Inscripción a materias

## Beneficios y Becas

## ¡Chequeá tu correo con frecuencia para mantenerte al tanto de las promociones vigentes!

## PROMOCIONES

#### VER MÁS

## BENEFICIOS

## BECAS

#### Periodo de Inscripción

El período de inscripción a materias está definido y establecido por el Calendario Académico y es publicado para todas las modalidades.

En todas las modalidades los estudiantes deben optar por las materias que deseen cursar, en función de la apertura de materias dispuestas, su avance académico y los requisitos de inscripción.

Consultá tu calendario académico

#### ¿Qué son las normas arancelarias?

Son el sistema mediante el cual gestionás el pago de tu cursado en la Universidad. Incluye la matrícula semestral y los tickets de materias.

#### MATRICULA

- Es obligatoria cada semestre.
- Habilita tu cursado y derecho a exámenes parciales, finales y Defensa Oral.
- ​Para poder rendir exámenes parciales, finales o la Defensa Oral del Seminario Final es requisito necesario que la matricula se encuentre paga y activa, siendo la misma de una duración semestral.

#### ARANCELES

- Son paquetes que agrupan una cierta cantidad de materias.
- Se abonan para cursar el semestre.
- Mirá como se componen tus paquetes según tu nivel formativo:

Antes de avanzar, identificá:

- Si tu carrera es de grado o pregrado.
- Filtra tu modalidad: Presencial, Presencial Distribuida, Presencial Home, Distancia o Distancia Home.

Esto define cómo se arma tu paquete de materias y qué tipo de ticket debés abonar. ¿Qué son los Tickets? son los paquetes de materias que cursás en el semestre.​

#### ¡Buscá tu modalidad!

Elegí tu modalidad de cursado y revisá toda la información relevante para inscribirte a tus materias según tu nivel formativo.

#### GRADO

#### PREGRADO

#### CICLO COMPLEMENTARIO

#### Información Adicional

#### Materias de Idioma

¿Vas a cursar Inglés o Portugués?

- Si tu modalidad es ED/EDH o PH, se cuenta como una materia más, dentro del paquete de 3 o 6 materias.

- Si tu modalidad es Presencial, ingresa como una materia más dentro del paquete que elijas.

#### ¿Cómo genero mis tickets?

¡Hacé clic en las flechas y navegá por cada uno de los pasos!

1

Para inscribirte a una materia, dirigite al botón Materias en el menu izquierdo.​

​Asegúrate de que se despliegue la carrera que estás cursando.

Si estás cursando más de una carrera, haz clic en la marca ">" para localizarla.

#### ¿Cómo abono mis tickets?

1

PLATAFORMA E-PAGOS

Cuando hayas confirmado la generación de los tickets. Serás dirigido a “E-pagos” para poder efectuar el pago.

Elegí la opción "Matrícula y Aranceles" desde el menú principal.

Se mostrarán los conceptos generados (aranceles y matrícula).

Seleccioná los ítems que deseas pagar, pueden ser uno o más.

Verificá el detalle de tu resumen

y luego hace clic en siguiente.

#### ¿Cómo inscribirme a mis materias en Portal de Estudiantes?

1

Una vez que hayas efectuado el pago del ticket (o de los tickets), verifica el Estado de la matrícula: debe haber cambiado de PENDIENTE a HABILITADA (en color verde).

#### ¿Cómo ver tus inscripciones a materias?

Para visualizar las materias a las que ya te has inscripto, primero asegúrate de que se despliegue la carrera sobre la que queres obtener esta información.

- Selecciona el Periodo y Subperíodo académico.

- A continuación, ingresá a la pestaña Inscriptas.

#### Revisá tus Materias Correlativas

Para conocer si una materia tiene correlativas, debés ingresar a tu Portal de Estudiantes. Una vez dentro, hacé clic en la sección Cursado, luego accedé a Materias programáticas del Plan de Estudio y seleccioná la materia que querés consultar. Ahí vas a poder ver si tiene correlativas y cuáles son.

A la derecha vas a ver la materia seleccionada y, al deslizar hacia abajo, vas a encontrar el botón Correlativas.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/inscripci%C3%B3n-a-materias$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-internacionalizacion$pea0$,
        $pea0$INTERNACIONALIZACIÓN | La Nube 21$pea0$, $pea0$Vivimos en un mundo que requiere líderes preparados para responder a los desafíos globales. Desde nuestros valores institucionales, promovemos una formación innovadora y responsable, impulsando la…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/internacionalizacion el 2026-11-08. Revisalo antes de publicar.

### Te formas vos, cambiás el mundo

Vivimos en un mundo que requiere líderes preparados para responder a los desafíos globales. Desde nuestros valores institucionales, promovemos una formación innovadora y responsable, impulsando la internacionalización como espacio de diálogo e intercambio que fortalece el aprendizaje y enriquece la experiencia humana y profesional.

POTENCIÁ TU PERFIL

ACADÉMICO Y PROFESIONAL

Explorá el espacio de Experiencias 21 y descubrí actividades cocurriculares para tu carrera.

Ingresá al Portal de Recomendaciones para conocer cada propuesta y realizá tu inscripción.

Especial

Misiones académicas

[Intercambios​](https://www.lanube.21.edu.ar/internacionalizacion)

[Anfitriones 21
​](https://www.lanube.21.edu.ar/internacionalizacion)

[Doble](https://www.lanube.21.edu.ar/internacionalizacion)

[Titulación​](https://www.lanube.21.edu.ar/internacionalizacion)

[Learning Expedition​](https://www.lanube.21.edu.ar/internacionalizacion)

[Certificado en Competencias Internacionales](https://www.lanube.21.edu.ar/internacionalizacion)

Misiones académics

#### Misiones Académicas

Una propuesta para sumergirse en otra cultura y vivir una experiencia única. A través de un recorrido académico-experiencial ofrecemos la oportunidad de viajar a diferentes destinos donde además de conocer destinos turísticos maravillosos, brindamos la posibilidad de acceder a capacitaciones con docentes e instituciones internacionales entregando certificaciones.

#### ¡Las Misiones 2026 te esperan!

#### FORMATE SIN FRONTERAS, VIAJÁ CON SIGLO 21

#### EXPERIENCIAS | CAPACITACIONES | VISITAS | CULTURAS

#### Este año te ofrecemos opciones que no podés desaprovechar

#### MADRID Global Bussines Inmersion del 21 al 28 de mayo.

BRASIL Managment en Latam del 18 de julio al 1 de agosto.

NEW YORK Fashion Trends del 7 al 19 de septiembre.

SAN FRANCISCO Silicon Disrupt del 7 al 18 de octubre.

SUIZA Multilateralismo y Diplomacia 5 al 9 de octubre.

#### ​

#### ESPAÑA octubre.

#### Charla informativa presencial | Misiones académicas

Te invitamos a participar en nuestra charla informativa presencial sobre las misiones académicas, que se realiza todos los jueves de 14:30 a 15:30 p.m. en el aula 212 edificio ARCOR.

Misiones académicas PRESENCIALES

Inscribite acá

#### Intercambios Académicos

#### ¿Te imaginás cursar una parte de tu carrera en otro país?

Contamos con más de 200 convenios de cooperación internacional que incluyen movilidad estudiantil para que nuestros estudiantes puedan tener una experiencia de cursado en distintas partes del mundo.

[CONOCÉ LAS OPORTUNIDADES ACÁ](https://docs.google.com/spreadsheets/d/1-tBtEnfpfzVQHM2LjPIIovDPZZdKFokk/edit?usp=sharing&ouid=100393666445566204865&rtpof=true&sd=true)

​Consultá el protocolo completo y, ¡preparate para tu experiencia internacional!

[OUTGOINGS](https://contenidos.21.edu.ar/descargas/foto-protocolo-de-movilidad-estudiantil-internacional-outgoings.pdf)

#### Intercambio Académico
Presencial

Viví una experiencia internacional en otra universidad, sumando una mirada global a tu formación y conectándote con nuevas culturas.Vas a poder cursar materias en el exterior, fortalecer tu autonomía y desarrollar habilidades clave para tu futuro profesional.

Para más información, podés comunicarte con la Referente de Movilidad, Agostina Aimar, a:

[agostina-aimar@mi.21.edu.ar](mailto:agostina-aimar@mi.21.edu.ar)

Postulate acá

#### Intercambio Académico
Virtual

Realizá un intercambio internacional sin salir de casa. Conectate con el mundo, cursá con instituciones de otros países y potenciá tu perfil profesional desarrollando una mirada global.

Para más información, podés comunicarte con la Referente de Movilidad, Agostina Aimar, a:

[agostina-aimar@mi.21.edu.ar](mailto:agostina-aimar@mi.21.edu.ar)

Postulate acá

### Tu experiencia internacional empieza acá, ¡postulate!

#### Conocé el testimonio de nuestros estudiantes

#### Charla informativa | Intercambios académicos

#### Charla informativa modalidad Virtual

Te invitamos a participar en nuestra charla informativa sobre intercambios académicos, que se realiza todos los martes a las 10:00 h vía Teams.

[CONECTATE ACÁ](https://teams.microsoft.com/dl/launcher/launcher.html?url=%2F_%23%2Fl%2Fmeetup-join%2F19%3Ameeting_NWQ5ZGE5Y2MtZjU2YS00ODRkLWJmNjctYzI3NjNmMzhhNWUz%40thread.v2%2F0%3Fcontext%3D%257b%2522Tid%2522%253a%252250a68648-8a2a-489c-b745-643d4d86d1e3%2522%252c%2522Oid%2522%253a%2522af4f0748-021e-4060-a445-58faed206515%2522%257d%26anon%3Dtrue&type=meetup-join&deeplinkId=9a5a028c-4ff8-4ce3-b06c-6a24010b6a16&directDl=true&msLaunch=true&enableMobilePage=true&suppressPrompt=true)

#### Charla informativa modalidad Presencial

También podés participar de manera presencial en la sede Campus los días jueves de 14:30 a 15:30 h en el aula 212 del edificio ARCOR.

#### Estudiantes Internacionales | Incomings

Recibimos estudiantes de universidades extranjeras que tengan convenio con Universidad Siglo 21.

Si tu universidad cuenta con un acuerdo vigente, podés participar del programa de intercambio siendo nominado por el área de internacionalización de tu institución.

Consultá el protocolo completo y preparate para tu experiencia internacional:

[Incomings (Español)](https://contenidos.21.edu.ar/descargas/foto-protocolo-de-movilidad-estudiantil-internacional-incomings.pdf)

[Incomings (English)](https://contenidos.21.edu.ar/descargas/foto-international-student-mobility-protocol-incomings.pdf)

#### Estudiantes Internacionales sin convenio | Study Abroad

Si tu universidad no tiene convenio con Siglo 21, también podés cursar un semestre con nosotros a través del programa Study Abroad.

Para más información, comunicate con Internacionalización a través de nuestros canales de atención virtual.

#### Programa Anfitriones 21

Sumate a una experiencia intercultural acompañando a estudiantes internacionales en su llegada a Universidad Siglo 21.

El programa te invita a participar en su inducción, integrarlos a la vida universitaria y compartir actividades culturales, mientras desarrollás habilidades globales y ampliás tu mirada.

Esta convocatoria está habilitada para estudiantes de modalidad Presencial y prioriza a quienes estén cursando el Certificado en Competencias de Internacionalización

¿Te imaginas acompañar a un estudiante internacional en sus primeros pasos en Argentina?

[Inscripción periodo 2A](https://cocurriculares.21.edu.ar/alumnos?idCareer=12004)

Viví una experiencia enriquecedora, guiándolos en su adaptación al campus, la ciudad y nuestra cultura.

#### Doble Titulación Internacional

Accedé a una doble titulación con títulos emitidos y validados por Universidad Siglo 21 y una universidad del exterior.

​​

​Esta modalidad se basa en la equivalencia de planes de estudio y el cursado de materias específicas en cada institución, permitiéndote complementar tu formación con una experiencia académica internacional.

- Obtené tu título de grado o posgrado y sumá un diferencial clave para tu perfil profesional.

- Disponible para estudiantes próximos a recibirse.

- La modalidad se ajusta según lo establecido en cada convenio entre universidades.

#### DOBLE TITULACIÓN | AUDENCIA BUSINESS SCHOOOL

La oferta está dirigida a estudiantes proximos a graduarse de las carreras de Administración que deseen realizar un intercambio para obtener un doble título, habilitado en calidad de grado o máster por la Universidad de Audencia, siempre que hayan cumplido con los requisitos académicos, incluida la obtención de los créditos necesarios y la eximición por suficiencia idiomática.

El título de Audencia se otorgará una vez que el estudiante de la Universidad Siglo 21 haya completado el programa Grande École y cumplido con los siguientes requisitos, debidamente ordenados y consolidados:

- Obtener la totalidad de los 60 créditos ECTS cursados en Audencia Business School, distribuidos en 51 ECTS correspondientes a una de las especializaciones y 9 ECTS al Trabajo Final de Máster.

- Aprobar al menos 60 ECTS durante el año académico en Audencia, que incluyen una especialización en el semestre de otoño y una pasantía u otra especialización en el semestre de primavera.

- Acreditar dominio del idioma inglés mediante uno de los siguientes exámenes internacionales, en caso de no ser hablante nativo: TOEIC (puntaje mínimo 850), IELTS (puntaje mínimo 7), TOEFL iBT (puntaje mínimo 90/120) o Cambridge Advanced Certificate C1.

- Elaborar una tesis y aprobar la correspondiente defensa oral final.

Para más información podes comunicarte a través de los canales oficiales de Atención de Alumnos.

#### Learning Expedition

Short term experience programme

Viví una experiencia intensiva en Argentina que combina formación académica y encuentro cultural.

Este programa está orientado a estudiantes y profesionales internacionales vinculados a negocios, administración y carreras afines, interesados en conocer el entorno académico y cultural local.

- Programa para estudiantes​

Participá de una semana de capacitación intensiva con clases, conferencias y actividades académicas exclusivas. Además, vas a poder conocer Córdoba a través de paseos y visitas guiadas, conectándote con su cultura y gastronomía.

- Programa para ejecutivos y profesionales

Accedé a una semana de formación con conferencias, masterclass y espacios de diálogo junto a referentes locales. Complementá la experiencia con actividades culturales y recorridos por la ciudad.

*Programa sujeto a articulación y adaptación según las instituciones participantes.

Certificado en competencias

#### Certificado en Competencias de Internalización

Certificá tus habilidades en internacionalización con foco en interculturalidad y desarrollo sostenible, alineado a la Agenda 2030, y preparate para desenvolverte en entornos diversos y dinámicos.

Potenciá tu perfil con una visión global y conocimientos en desarrollo internacional.

[Más información](https://informate.21.edu.ar/certificado-en-competencias)

A lo largo del programa, vas a fortalecer competencias vinculadas al trabajo colaborativo, la comunicación intercultural y la comprensión de problemáticas globales, sumando un diferencial a tu formación académica.

Este certificado complementa tu carrera, reconociendo conocimientos y habilidades con perspectiva internacional y abordajes integrales en distintas áreas.

[Inscribite acá](https://cocurriculares.21.edu.ar/alumnos?idCareer=10984)

Lunes

Espacio de consultas para inscriptos en Certificados.

16:00 hs

Unirse a sala Teams

ID de reunión: 841 6174 0367 

Código de acceso: 554827

### SUSCRIBITE

### AL NEWSLETTER

### ¡Sumate a Experiencias 21!

### Enterate antes que nadie de todas las experiencias, actividades y novedades.

 Recibí contenido exclusivo y mantenete al día con todo lo que pasa en Experiencias 21.

SUSCRIBITE ACÁ$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/internacionalizacion$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-investigacion$pea0$,
        $pea0$Investigación$pea0$, $pea0$Investigá y generá nuevos conocimientos$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/investigacion el 2026-11-08. Revisalo antes de publicar.

#### Ayudantía y adscripción
en Investigación

Investigá y generá nuevos conocimientos

La Universidad Siglo 21, a través de la Resolución del Consejo Superior (R.C.S) N° 700/19, establece la posibilidad de formar en investigación a alumnos y egresados de nuestra casa de estudios, como así también a graduados de otras universidades.

[CONSULTÁ LA RESOLUCIÓN AQUÍ](https://www.lanube.21.edu.ar/_files/ugd/cf0a7a_faa73b0b9458409aaa4cfa038b679b43.pdf)

POTENCIÁ TU PERFIL

ACADÉMICO Y PROFESIONAL

Explorá el espacio de Experiencias 21 y descubrí actividades cocurriculares para tu carrera.

Ingresá al Portal de Recomendaciones para conocer cada propuesta y realizá tu inscripción.

Especial

#### Si sos estudiante
¡Sumáte a investigar!

#### Ayudantía en investigación | ¿En qué consiste?

Abarca las actividades desempañadas por las/los estudiantes en apoyo al desarrollo de la función de investigación de la Universidad. Estas buscan desarrollar en los/las estudiantes competencias vinculadas con la investigación científica y académica en los diferentes campos disciplinares y/o pilares de la Universidad.

#### Ayudantía en investigación | Beneficios

La Universidad certifica el desempeño de los ayudantes alumnos que hayan cumplido en tiempo y forma con los deberes establecidos.

​Además, las ayudantías serán consignadas como suplemento al título universitario y te otorgarán crédito para una materia electiva.

- Requisito para obtener suplemento y el crédito: Participar en un proyecto de investigación como ayudante durante el plazo de un año, pudiendo ser en períodos consecutivos o no consecutivos.

Ver RCS 758/2019 – Suplemento al Título Universitario

Ver RR- RR 5248/2022 – Reconocimiento del Crédito Académico

#### Ayudantía en investigación | ¿Cómo y cúando puedo iniciar?

Podés iniciar a lo largo del año y para ello será necesario que sepas a qué proyecto te gustaría sumarte.

Cuando sepas a qué proyecto te gustaría sumarte deberás enviar tu CV acorde al modelo que podrás descargar aquí a [secretariadeinvestigacion@ues21.edu.ar](mailto:secretariadeinvestigacion@ues21.edu.ar) y te pondremos en contacto con quién dirige el proyecto de tu elección.

Te compartimos un modelo de CV para ayudantes:

[Mirá el modelo de CV acá](https://www.lanube.21.edu.ar/_files/ugd/cf0a7a_cdd02ea64fcf4c3dbfb2d587df65a773.docx?dn=Formato%20CV%20-%20Ayudantes%20-%20Alumnos%20-%20Grado%20y%20Postgrado%20(2).docx)

#### Si sos egresado
¡Continúa Formandote!

#### Adscripción en investigación | ¿En qué consiste?

Abarca las actividades desempañadas por graduados/as que contribuyan al desarrollo de la investigación de la Universidad. La adscripción busca desarrollar en los/las graduados/as competencias vinculadas con la investigación científica y académica en los diferentes campos disciplinares y/o pilares de la Universidad.

#### Adscripción en investigación | Beneficios

- Adquirir herramientas propias del ámbito de la investigación que te serán de utilidad para tu desempeño profesional.​

- Conocer en profundidad un tema que te sea de interés, desde un punto de vista científico.​

- Aportar a la producción de conocimiento y a su transferencia al sector socio-productivo.

#### Adscripción en investigación | ¿Cómo y cúando puedo iniciar?

Podés iniciar a lo largo del año y para ello será necesario que sepas a qué proyecto te gustaría sumarte.

Cuando sepas a qué proyecto te gustaría sumarte deberás enviar tu CV acorde al modelo que podrás descargar aquí a [secretariadeinvestigacion@ues21.edu.ar](mailto:secretariadeinvestigacion@ues21.edu.ar) y te pondremos en contacto con quién dirige el proyecto de tu elección.

Te compartimos un modelo de CV para adscriptos:

[Mirá el modelo de CV acá](https://www.lanube.21.edu.ar/_files/ugd/cf0a7a_9193c883d21244a487a7ef3719a40d93.docx?dn=Formato%20CV%20-%20Adscripto%20(1).docx)

#### EXPLORÁ LOS PROYECTOS VIGENTES
Elegí el proyecto que más te motive y empezá a potenciar tu formación.

Descubrí propuestas abiertas a estudiantes de todas las carreras para participar en experiencias de investigación a través de adscripciones y ayudantías.

Podés profundizar en tu área de interés, desarrollar nuevas habilidades y sumar experiencia académica con impacto en tu formación profesional.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/investigacion$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$plataformas$pea0$), null, 0, $pea0$ln-klarway$pea0$,
        $pea0$Klarway$pea0$, $pea0$El Sistema Online de Exámenes (SOE) te permite rendir tus exámenes de forma online, con seguridad, flexibilidad y autonomía.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/klarway el 2026-11-08. Revisalo antes de publicar.

#### SOE

#### Sistema Online de Exámenes

El Sistema Online de Exámenes (SOE) te permite rendir tus exámenes de forma online, con seguridad, flexibilidad y autonomía.

Podrás hacerlo a través de la plataforma Klarway, que cuenta con validación de identidad y monitoreo en tiempo real, garantizando un entorno confiable y seguro durante todo el examen.

¿Qué Aplicación usa SOE?

¿Cómo instalar Klarway?

¿Cómo registrarse?

¿Cómo se rinde el examen?

#### ¿Qué aplicación se utiliza para rendir?

Para rendir se utiliza la herramienta Klarway, una aplicación de escritorio disponible para PC y algunas versiones de Mac.

En esta aplicación deberás realizar el empadronamiento inicial, y será la misma que utilizarás cada vez que rindas tus exámenes.

Para rendir, deberás instalar la aplicación en tu computadora e ingresar con tus datos. Durante el examen, el sistema verificará tu identidad y realizará un seguimiento automático para garantizar la integridad académica.

#### ¿Cómo instalar Klarway en tu notebook?

Descargá e instalá el programa en tu computadora. Vas a ver que SOE es compatible con Windows y algunas versiones de MAC/IOS

#### Descargá
Klarway en tu computadora

Descargá SOE acá

Problemas con Antivirus

Requisitos técnicos para instalar Klarway

#### ¿Cómo registrarse en Klarway?

Debes cumplir con este paso para poder validar tu identidad y poder acreditar al momento de rendir que sos vos.

Para poder hacerlo debes contar con tu DNI e instalar Klarway en tu computadora.

Cómo registrarse en Klarway

#### Recomendaciones para un registro exitoso

### Ubicate en un lugar iluminado

con fondo liso, en donde se pueda verificar correctamente la totalidad del rostro

### DNI

​Debes cargar únicamente una fotografía de tu DNI (digital o físico) o pasaporte, donde se visualicen correctamente los datos.

### ​Auriculares

Para garantizar el reconocimiento facial, no se permite el uso de auriculares en el registro

### Indumentaria

El registro requiere una imagen con indumentaria adecuada. No se permitirá el registro sin remera

#### ¿Cómo se rinde el exámen?

1. Accedé a Klarway desde el icono que está en tu escritorio.

Antes de ingresar a Klarway para rendir tu examen, se te solicitará cerrar todos los programas activos. Algunos serán finalizados automáticamente por el sistema. Una vez completado este paso, podrás acceder a Klarway y rendir el examen como lo hacés habitualmente. El ambiente debe estar libre de personas, ruidos e imágenes detrás de ti. Esto garantiza una evaluación sin interrupciones ni anomalías.

2. Ingresa las credenciales para loguearte en Portal de Estudiantes.

3. Habilitá tu examen.

Para comenzar deberás presionar “Habilitar”. Se comprobará tu rostro para poder validar tu identidad, para ello debes permanecer frente a la Cámara Web hasta completar la validación y, luego presiona confirmar para continuar con la realización del examen. Si no logras validar tu identidad no podrás proceder con el examen.

4. Acepta condiciones de Reglamento Institucional para la ejecución de exámenes para que se habilite finalmente el examen.

#### Recomendaciones para rendir con Klarway

- Elegí un lugar bien iluminado para rendir el examen, procurando que se vea claramente tu rostro y el plano medio corto (desde la cabeza hasta debajo de los hombros)

- Evitá luces de fondo, ventanas intensas o elementos visuales que puedan distorsionar la imagen.

- ​Asegurate de que tu computadora tenga al menos un 80% de batería o esté conectada al cargador.

​​​

- Esto es fundamental para evitar interrupciones durante la evaluación​

- Recordá mantener el micrófono encendido durante todo el examen y elegir un lugar silencioso, sin interrupciones de otras personas o ruidos.

- Esto favorecerá tu concentración

- En caso de tener problemas a la hora de rendir tu exámen, ponete en contacto con tu CAU o SEDE.

- ​En caso de rendir desde tu hogar (Recordá que en el print de pantalla se debe visualizar el día y la hora)

- Envíanos el print de pantalla del error desde Consulta alumnos: 21.edu.ar > Inicia sesión > Consulta Alumnos > Área Tecnológica > Tipo de consulta “Sistema de Examen

- Deben aguardar siempre hasta que el video finalice su carga.

- La pestaña puede minimizarse y la computadora seguir utilizándose, pero este paso constituye una etapa obligatoria del proceso de examen.

- Recordá que todas las instancias evaluativas son auditadas.

- En el panel superior de SOE podrás visualizar las anomalías detectadas por la plataforma, esto no interrumpirá tu examen, pero es importante que puedas tomarlas como guía para modificar tu conducta

Tené en cuenta estas recomendaciones para rendir con tranquilidad, concentración y confianza en tus conocimientos.

#### Buenas practicas para rendir

- Mantené el enfoque de frente a la cámara y en la pantalla del examen

- Recordá utilizar una vestimenta adecuada.

- Buscá un espacio en donde estés solo/a en silencio y sin distracciones

- Recordá que no se permite tomar fotografías de las preguntas, respuestas y/o de la revisión del examen.

- Tené en cuenta que no está permitido el uso de auriculares durante el examen.

#### Si tenes más dudas sobre las buenas practicas para rendir con Klarway,
revisa dentro del reglamento institucional el Régimen General de Sanciones

Conocé más

#### ¿Cómo se solicita la revisión del examen?

Si al finalizar el examen, consideras que alguna pregunta no ha sido evaluada de manera correcta, podés solicitar la revisión de dicha pregunta. Enterate de cómo cuándo hacerla.

CONOCÉ MÁS

Si tenés más dudas sobre Klarway, revisá nuestras preguntas frecuentes

PREGUNTAS FRECUENTES$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/klarway$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$oferta-academica$pea0$), null, 0, $pea0$ln-materias-electivas$pea0$,
        $pea0$Materias Electivas| La Nube 21$pea0$, $pea0$Las materias electivas, son materias que poseen contenidos y competencias considerados de interés y que complementan la propuesta académica de las distintas carreras que ofrece la Universidad. Esta…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/materias-electivas el 2026-11-08. Revisalo antes de publicar.

#### MATERIAS ELECTIVAS

#### ¿QUÉ SON LAS MATERIAS ELECTIVAS?

Las materias electivas, son materias que poseen contenidos y competencias considerados de interés y que complementan la propuesta académica de las distintas carreras que ofrece la Universidad. Estas materias te permiten profundizar temas que ya previstos en tu formación, pero incorporando nuevas perspectivas que amplían los alcances tu título, o bien sumar competencias específicas para tu perfil profesional.

Todos los estudiantes de carreras de grado deben cumplir con créditos en materias electivas según la cantidad que determina cada plan de estudio, lo que constituye uno de los requisitos para la obtención de tu título.

#### Créditos

Los créditos electivos forman parte de los requisitos de tu plan de estudios y se obtienen al aprobar las materias electivas habilitadas para tu carrera. La cantidad de créditos que debés completar depende de tu carrera y plan de estudios.

- Equivalencia de créditos:

4 créditos = 1 materia electiva.

8 créditos = hasta 2 materias electivas.

Para obtener los créditos, la materia electiva debe ser cursada en su totalidad, incluyendo la evaluación final.

En tu Portal Estudiantes, te van a aparecer las materias electivas que están vinculadas a tu carrera para que elijas la que prefieras, según tu interés profesional y que te permita cumplir con el total de créditos que necesitas.

IMPORTANTE:

No se puede cursar Idiomas ni Práctica Solidaria como materias electivas.

#### GLOBAL PERSPECTIVE MATTERS

Impulsamos trayectos académicos con perspectiva internacional. Porque el futuro se construye sin fronteras.

#### PROGRAMAS DE MATERIAS ELECTIVAS$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/materias-electivas$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$oferta-academica$pea0$), null, 0, $pea0$ln-materias-map$pea0$,
        $pea0$Materias MAP$pea0$, $pea0$Las Materias de Aplicación Preprofesional (MAP) son una oportunidad para vivir experiencias reales vinculadas a tu carrera, conectándote con el mundo laboral mientras cursas.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/materias-map el 2026-11-09. Revisalo antes de publicar.

#### Materias MAP

#### Seguimos
Evolucionando

Las Materias de Aplicación Preprofesional (MAP) son una oportunidad para vivir experiencias reales vinculadas a tu carrera, conectándote con el mundo laboral mientras cursas.

¿Cómo se

cursa?

Acuerdo Pedagógico

Esquema de Entregas

¿Cómo se aprueba?

DreamShaper

Ancla 1

Con las materias MAP vas a poder:

- Observar situaciones reales vinculadas a tu campo profesional.
- Participar activamente en proyectos, equipos y organizaciones reales.
- Actuar sobre problemáticas concretas, aplicando lo aprendido en la carrera.

Esto te permitirá:

- Ganar seguridad y confianza en tu rol profesional.
- Incorporar herramientas clave para tu futuro laboral.
- Comprender mejor el entorno y las dinámicas del campo donde vas a desarrollarte.

Las MAP están diseñadas para guiarte en el desarrollo de competencias a través de 3 niveles de intervención:

Intervención

Básica

vas a realizar actividades de observación no participante y análisis de casos en contextos cercanos o situaciones simuladas, para empezar a conocer de cerca cómo se trabaja en tu área profesional.

Intervención Intermedia

vas a formar parte de proyectos de extensión como Proyecto Académico Transversal (PAT), Proyecto de Intervención Comunitaria (PIC) y el Servicio de Extensión Comunitaria (SEC), donde vas a involucrarte con comunidades, equipos y propuestas vinculadas a tu carrera

Intervención Avanzada

vas a colaborar con una organización o institución, participando en experiencias auténticas que te acercan a los desafíos del entorno laboral.

#### ¿Cómo se cursa?

Las materias MAP se componen de 2 trabajos prácticos múltiple opción (módulos 1 y 3), 2 trabajos prácticos a desarrollar (módulos 2 y 4) y 2 exámenes parciales.

#### Trabajos Prácticos múltiple opción

Los trabajos prácticos múltiple opción los encontrarás en los módulos de lectura 1 y 3.​

Se realizan en tu Aula Virtual (Canvas). Podrás hacerlo las veces que necesites hasta la fecha de cierre de periodo. El sistema guarda la última nota.

La calificación de los Trabajos Prácticos de corrección automática estará compuesta de dos elementos:

- La actividad académica, es decir la calificación en base a las respuestas que desarrolles.
- La valoración de tiempo de entrega.

Valoración de tiempo de entrega

¿Qué es la Valoración de Tiempo de Entrega?

Define los términos y condiciones aplicables cuando los TPs no son entregados dentro del plazo estipulado en el calendario académico.

Se van a descontar 5 puntos en Canvas por cada día que transcurra entre la Fecha de Entrega y la Fecha en la que presentaste tu TP.

Si presentaste tu TP entre estas fechas, no se aplica la Valoración de Tiempo de Entrega y tu Calificación será la que obtuviste en Canvas.

Si presentaste tu TP entre estas fechas, se aplica la Valoración de Tiempo de Entrega y a tu Calificación se le descontará 5 puntos por día de atraso.

#### Fecha
Inicio Periodo

#### Fecha
de Entrega

#### Fecha
Fin de Periodo

Recordá que:

- La fecha de Inicio de Periodo: es la fecha desde la cual podés realizar tus TPs.

- La fecha de Entrega: es la última fecha que tenés disponible para entregar el TP sin que se aplique la Valoración de Tiempo de Entrega.

- La fecha Fin de Periodo: es la última oportunidad que tenés para entregar el TP, ya que luego de esta, el sistema se bloquea y no admite más presentaciones.

#### Trabajos Prácticos a desarollar:

Los trabajos prácticos 2 y 4 son de entrega individual, donde producís tu propio desarrollo escrito a partir de consignas, que tu docente luego evaluará de acuerdo a una rúbrica con criterios específicos para cada uno de ellos.

Las consignas de los TP te las compartirá tu docente a través de CANVAS, junto con la rúbrica con la que serán corregidos, y deberás subirlos en los Módulos de lecturas 2 y 4 en CANVAS.

Estos TP acompañan las prácticas que estás desarrollado en contextos reales:

- Trabajo práctico 2: está vinculado a los contenidos teóricos del módulo de lectura 2, y el recorrido realizado hasta el momento en la práctica preprofesional.

- Trabajo práctico 4: está vinculado a los contenidos teóricos del módulo de lectura 4, y al cierre integral de la práctica preprofesional.

La calificación de los Trabajos Prácticos abiertos a desarrollar corresponde en tu totalidad a la corrección realizada por tu docente. El profesor podrá corregir la actividad hasta 1 semana después de la fecha de entrega.

#### Esquema de tus entregas

Ancla 2

- 4 módulos de lectura
- ​4 lecturas específicas en cada uno de ellos

- 2 trabajos prácticos múltiple opción de calificación automática (módulo 1 y 3)
- 2 trabajos prácticos con consigna abierta (modulo 2 y 4)
- ​2 exámenes parciales

MÓDULO 1

- 4 lecturas
- 1 TP múltiple opción.
- 1 actividad autoevaluativa.

MÓDULO 2

- 4 lecturas
- 1 TP abierto: se elabora un TP a partir de las competencias y habilidades técnicas especificas que se deben desarrollar y la práctica preprofesional realizada hasta el momento
- 1 actividad autoevaluativa.

MÓDULO 3

- 4 lecturas
- 1 TP múltiple opción.
- 1 actividad autoevaluativa.

MÓDULO 4

- 4 lecturas
- 1 TP abierto: se elabora un TP a partir de las competencias y habilidades técnicas especificas que se deben desarrollar y la práctica preprofesional realizada hasta el momento
- 1 actividad autoevaluativa.

Semana 1

Inicio del periodo de cursado

Semana 5 u 8

Valoración de tiempo de entrega.

Semana 8 o 15

Valoración de tiempo de entrega.

PRIMER PARCIAL

Preguntas múltiple opción.

SEGUNDO PARCIAL

Preguntas múltiple opción.

IMPORTANTE:

Los TP 1 y 3 (múltiple opción) podés realizarlos las veces que necesites hasta obtener la calificación deseada, antes de la fecha de entrega; en cambio, los TP 2 y 4 (a desarrollar) se entregan una única vez antes de la fecha de entrega.

#### ¿Cómo accedo al Acuerdo Pedagógico?

Tu docente subirá un documento con el acuerdo pedagógico, el cual deberás descargar para conocer cómo será el recorrido de la materia durante el cursado y que responsabilidades y compromisos debes asumir como estudiante.

Al acceder a tu materia MAP desde tu Aula Virtual (Canvas), en la página de inicio, deberás dirigirte al ícono Acuerdos.

#### ¿Cómo veo las consignas de mis Trabajos Prácticos 2 y 4?

El docente puede compartirte las consignas de tus trabajos prácticos 2 y/o 4 a través de la sección Acuerdo Pedagógico o enviártelas mediante el sistema de mensajería.

#### ¿Cómo realizo mis trabajos prácticos?

En los módulos 1 y 3, los Trabajos Prácticos son de múltiple opción. Luego de leer el enunciado, hacé clic en el botón “Comenzar” para realizar tu TP.

En los módulos 2 y 4, los Trabajos Prácticos son de producción escrita y requieren que subas un archivo. Para entregarlo, hacé clic en “Empezar tarea”, cargá el archivo y seleccioná “Entregar tarea”.

Trabajo practico

#### ¿Cómo se aprueba una materia MAP?

#### Promoción Directa

#### ¿Qué necesitás para lograr esta condición?

• 3 de 4 TPs con nota 7 ó más.

• 2 parciales con nota 7 ó más, sea en instancia de parcial, recuperatorio o integrador.

• 75% de asistencia para modalidades Presencial Presencial Home y Presencial Distribuida.

​​

#### ¿Cómo aprobar la materia?

Alcanzaste la promoción de la materia, por lo que no necesitas rendir un final.

La calificación final en la materia será el promedio obtenido entre todos los TPs y los parciales, sean estos aprobados en primera instancia o mediando recuperatorio individual o integrador más la nota de proceso para la modalidad Presencial.

#### Promoción Indirecta

• 4 de 4 TPs con nota 7 ó más.

• 2 parciales con nota 5 ó 6, sea en instancia de parcial, recuperatorio o integrador.

• 75% de asistencia para modalidades Presencial Presencial Home y Presencial Distribuida.

Alcanzaste la promoción de la materia, por lo que no necesitas rendir un final.

La calificación final en la materia será el promedio obtenido entre todos los TPs y los parciales, sean estos aprobados en primera instancia o mediando recuperatorio individual o integrador más la nota de proceso para la modalidad Presencial.

​​

#### Regularidad

• 3 de 4 TPs con nota 5 ó más.

• 2 parciales con nota 5 ó más, sea en instancia de parcial, recuperatorio o integrador.

• 75% de asistencia para modalidades Presencial Presencial Home y Presencial Distribuida.

Para aprobar la materia debes rendir un examen final que tendrá 30 preguntas y deberá aprobarse con nota 4 ó más.

Contas con un límite de hasta 3 instancias para rendir y un plazo máximo de 18 meses. Tené en cuenta que si te inscribis para rendir, pero no te presentas, las ausencias cuentan como aplazo.

#### ¿En qué condición quedo si no alcanzo la Regularidad de la materia?

#### Libre por Nota

La materia quedará en este estado cuando no se cumplan las condiciones de regularidad.

- Este estado habilita la instancia Final de 50 preguntas virtual de multiple opción.

​​

- Solo para las modalidades Presencial Presencial Home y Presencial Distribuida también deben rendir una instancia oral.

#### Libre

Quedará en este estado cuando se hayan utilizado todas las oportunidades para rendir la materia, sin poder aprobarla o cuando haya vencido el plazo para rendir el examen final.

- Esta condición implica que se debe recursar la asignatura.

#### ¿Cómo se cuál es el nivel de intervención de mi materia MAP?

Podés ver el nivel de intervención correspondiente a tu materia en:

- El Acuerdo Pedagógico
- En los encabezados de los Trabajos Prácticos 2 y 4

#### ¿Cómo sé cuál es mi proyecto o mi organización asignada?

- Intervención básica: vas a participar en un proyecto de extensión (PAT, PIC o SEC) vinculado a los contenidos de la materia y a las competencias que se buscan desarrollar. Tu docente te compartirá a través de tu Aula Virtual (CANVAS) toda la información necesaria para acompañar este recorrido.

- Intervención avanzada: vas a estar vinculado a una organización, institución o empresa relacionada con tu Carrera. Recibirás un correo con los datos de contacto del referente de la organización, para que puedas comunicarte y coordinar el desarrollo de tus prácticas. También podrás contactarte con tu docente a través de tu Aula Virtual (CANVAS).

#### Fechas de Entrega

- Modalidad ED / EDH / PH

#### Cursado Bimestral

#### 2A

### TP 1

### TP 2

### TP 3

### TP 4

### Fin del periodo

Fecha de Entrega

31/8

31/8

21/09

21/09

3/10

#### 2B

Fecha de Entrega

2/11

2/11

23/11

23/11

5/12

- Modalidad Presencial

#### Cursado Cuatrimestral - Segundo Semestre

Fecha de Entrega

21/09

21/09

9/11

9/11

21/11

#### Si cursás tus materias MAP en DreamShaper, revisá toda la información acá

#### ¿Qué es DreamShaper?

Es una plataforma online donde vas a desarrollar tus actividades Pre-Profesionales. A través de un recorrido guiado, trabajarás sobre un reto real vinculado a una organización, institución o empresa, pensado especialmente para que puedas poner en juego lo que aprendiste en la materia.

#### ¿Por qué cursás con DreamShaper?

Esta herramienta permite transformar el desafío preprofesional en una experiencia concreta y organizada: paso a paso, vas a construir una propuesta que responde a una necesidad real, desarrollando habilidades clave para tu carrera. Todo el proceso lo harás con el acompañamiento de tu docente, que será tu referente durante la cursada. A través de Dreamshaper podrás tener contacto con tu organización.

#### ¿Cómo se cursa?

En la plataforma, vas a resolver una serie de actividades breves, que te permitirán avanzar de forma progresiva. A medida que completes etapas, DreamShaper te avisará cuándo es momento de descargar tu avance y subirlo como Actividad Preprofesional en CANVAS. Vas a realizar dos entregas, una por cada parte del recorrido.

¡En esta materia vas a trabajar en equipo!

- Los grupos se arman de forma aleatoria.
- Van a contar con un foro grupal dentro de la plataforma para organizarse y comunicarse. Al comenzar la cursada, lo primero que tenés que hacer es presentarte en ese espacio. A medida que avancen con el trabajo deben usar el foro para registrar cada paso que vayan completando.

Además, deberás realizar los 4 trabajos prácticos múltiple opción, correspondientes a los módulos de lecturas en tu Aula Virtual (CANVAS).

#### ¿Cómo accedo a la plataforma DreamShaper?

- Ingresá a tu Aula Virtual (CANVAS).
- En la página de inicio, hacé clic sobre el botón “Prácticas”. Desde ese botón, se te redireccionará automáticamente a la plataforma Dreamshaper. No te pedirá loguearte nuevamente.

Tu docente te acompañará en toda tu cursada, y el canal de contacto con él será a través de la mensajería de CANVAS.

#### Mirá el video tutorial

#### Proceso de vinculacion según nivel de intervención.

#### Nivel de intervención Intermedio.

Si la materia que estas cursando corresponde a un nivel de intervención intermedio, la Universidad te vinculará con un programa de extensión acorde a tu formación (PAT, PIC o SEC). . Tu docente te compartirá a través de tu Aula Virtual (CANVAS) cuál es el proyecto al que estás asignado y el contacto de su director, a fin de que puedas coordinar tus prácticas.

#### Nivel de Intervención Avanzado.

Vas a estar vinculado/a a una organización, institución o empresa relacionada con tu Carrera. Recibirás un correo con los datos de contacto del referente de la organización, para que puedas comunicarte y coordinar el desarrollo de tus prácticas. También podrás contactarte con tu docente a través de tu Aula Virtual (CANVAS).

- Carga horaria

Deberás cumplir entre cuatro (4) y ocho (8) horas semanales de prácticas en la organización, según lo establecido para tu carrera y en coordinación con la entidad.

- Seguros

Todos los estudiantes inscriptos en una materia MAP de intervención avanzada cuentan con un seguro que los cubre durante toda la cursada, ante cualquier contingencia que pudiera ocurrir en el contexto organizacional. Si requerís acceder a la póliza, deberás solicitarla solamente a tu director de Carrera.

IMPORTANTE:

La gestión del seguro será realizada por la Universidad una vez que estés inscripto/a en la materia. No es necesario que realices ningún trámite por tu cuenta.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/materias-map$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$modalidades$pea0$), null, 0, $pea0$ln-modalidad-ed$pea0$,
        $pea0$Educación Distribuida$pea0$, $pea0$El cursado se realiza a través de la Plataforma Multimedia, con el acompañamiento de un Profesor Tutor y un Profesor Experto en los dos primeros cuatrimestres, y de un Profesor Virtual a partir del…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/modalidad-ed el 2026-11-08. Revisalo antes de publicar.

### MODALIDAD 
EDUCACIÓN DISTRIBUIDA

El cursado se realiza a través de la Plataforma Multimedia, con el acompañamiento de un Profesor Tutor y un Profesor Experto en los dos primeros cuatrimestres, y de un Profesor Virtual a partir del tercero.

También, deberás asistir a 4 encuentros presenciales por materia, cada 15 días en tu CAU.

Recursos presenciales y digitales

En la modalidad Educación Distribuida combinás encuentros presenciales en tu CAU con el uso de la Plataforma Multimedia, donde accedés a materiales, actividades y acompañamiento docente, integrando así recursos digitales y presenciales para tu cursado.

4 Encuentros en el Centro de Apoyo Universitario (CAU)

Plataforma Multimedia

Conocé todo lo que necesitás saber de tu modalidad

### CONDICIONES DE MATERIAS

Tu espacio central de cursado. Ingresá y mirá el contenido de tus materias.

### INSCRIPCIÓN A MATERIAS

Ingresá para encontrar todo el contenido sobre tu modalidad.

### CALENDARIO ACADÉMICO

Gestioná inscripciones, a materias, parciales, finales y mucho más.

### TODO SOBRE PARCIALES

Resumen de titulo por avance

### TRABAJOS PRÁCTICOS

Resumen de titulo por avance

#### ¿Cómo es la Sub-modalidad ED?

El estudio se lleva a cabo mediante la Plataforma Multimedia, con el respaldo de un Profesor Tutor y un Profesor Experto (para las materias del 1er al 2do cuatrimestre) y con la ayuda de un Profesor Virtual (para las materias a partir del 3er cuatrimestre).

Además deberás asistir a 4 encuentros presenciales por materia, que se dictarán cada 15 días en tu CAU. Te recordamos que es indispensable que asistas con tu notebook personal a cada uno de ellos y que tomes contacto con la fecha y horario de los encuentros presenciales de tus materias, ingresando al portal de estudiante.

## Tutor Dinamizador

Es quien te guiará durante el espacio de Open Class. Su principal tarea será acompañarte en tu recorrido, brindandote herramientas que faciliten tu aprendizaje tanto individual, como grupal, trabajando de manera colaborativa con tus compañeros.

## ¡Así aseguramos que tu experiencia sea un verdadero éxito!

IMPORTANTE:

A pesar de cursar bajo la modalidad ED, vas a tener que cursar materias en modalidad EDH.

#### Estructura del encuentro

#### Sam Class

Dentro de Aula Virtual: CANVAS tendrás habilitado el contenido de tus materias. Además, se te brindará un video que lo nombramos “SAM CLASS”. Este video es una propuesta de aula invertida en donde se compartirá una consigna práctica que deberás elaborarla previamente y llevarla resuelta a tu próximo encuentro para trabajarla de manera colaborativa con tus compañeros y el tutor dinamizador.

#### Open Class

Los encuentros que vas a tener en tu CAU se llaman “OPEN CLASS” y tienen una duración total de 2hs y media, distribuidas de la siguiente manera:

#### 1era Etapa: Bienvenida

El Tutor Dinamizador te dará la bienvenida y realizará la apertura de la clase, como así también se encargará de la toma de asistencia. Te recordamos que es requisito contar con el 75% de asistencia en cada una de tus materias.

#### ¿Cómo registrar la asistencia?

La toma de asistencia, se realizará a través de nuestra APP Siglo 21. Descargá la APP en tu celular y mirá el vídeo para saber cómo registrar tus asistencias a las Open Class.

#### 2da Etapa: Dinámica Áulica

Es la Dinámica Áulica, de una duración aproximada de 40 minutos, en la que se les compartirá un vídeo conceptual donde se explican los conceptos centrales del módulo aplicados a ejemplos prácticos. Luego, se realizará la puesta en común de la actividad vinculada a la SAM CLASS que elaboraste previamente al encuentro. Y por último, en grupo, trabajarán sobre la consigna que se propone al cierre de la clase proyectada.

#### 3ra Etapa: EVA 21

En esta etapa se brindarán 50 minutos para la realización del Trabajo Práctico. Si bien el desarrollo del mismo se hace dentro de la OPEN CLASS, la entrega es completamente individual y obligatoria. El tutor dinamizador se encargará de acompañarte en esta instancia para guiarte en la realización del Trabajo Práctico. El propósito de esta etapa es que finalices el encuentro con tus actividades prácticas presentadas o los objetivos y herramientas que necesitas para poder realizarlas posteriormente.

#### 4ta Etapa: Experiencia 21

Esta es una etapa de aprendizaje diferencial donde buscamos sumarle valor a tu perfil profesional llenándolo de experiencias que lo enriquezcan y permitan que profundices en temas que optimizarán tu paso por la Universidad. Para conocer más seguí leyendo el siguiente apartado.

#### Conocé más

La Open Class tiene una duración de 2 hs y media

Experiencias 21

#### Experiencias 21

Capsulas ED de Experiencias 21, es una iniciativa pensada especialmente para vos, que estudias en la modalidad ED. Queremos asegurarnos de que tu experiencia educativa sea enriquecedora y que cuente con el valor agregado que mereces.

#### ¿En qué consiste?

#### Enterate acá

Cápsulas ED de Experiencias 21 es un espacio con breves videos que se comparten cada semana antes de la Open Class para acompañarte durante tu cursado en modalidad ED.

En cada cápsula vas a conocer Experiencias 21, actividades y propuestas de la Universidad pensadas para complementar tu formación y potenciar tu trayectoria universitaria.

Durante el video aparecerá un código QR para registrar tu asistencia a la cápsula. Recordá que es diferente al QR de la Open Class, por lo que debés completar ambos registros.

#### Calendario de actividades:

Calendario Experiencia 21

#### Semana 1

Vida 21

#### Semana 2

Sustentabilidad

#### Semana 3

Internalización

#### Semana 4

Empleabilidad

#### Semana 5

Emprendimiento

#### Semana 6

Vida 21

#### Semana 7

Sustentabilidad

#### ¿Qué sumarás en tu perfil profesional?

Emprendimiento

Inspírate y adquirí herramientas para convertir tus ideas en proyectos exitosos.

Conocé más

Internacionalización

Amplía tus horizontes y conocé oportunidades del plano internacional y dale a tu perfil profesional una perspectiva global.

Conocé más

Sustentabilidad

Desarrolla una mentalidad orientada a la construcción de espacios más sostenibles.

Conocé más

Empleabilidad

Potencia tu perfil profesional para destacarte en el mercado laboral.

Conocé más

Vida 21

Disfruta de cursos, talleres y actividades culturales y deportivas que contribuirán a tu bienestar personal.

Conocé más

¡No te pierdas estas oportunidades para enriquecer tu experiencia universitaria y prepararte para un futuro brillante!

#### Consultas académicas

En caso de tener consultas académicas podes contactarte con los docentes de tus materias a través de la mensajería del Aula Virtual (Canvas).

#### Mirá el vídeo y conocé cómo es la Modalidad ED

#### EFIP: Conocé todo lo que necesitás saber sobre esta importante instancia.

Este examen te permite acreditar de forma presencial los conocimientos adquiridos: en los primeros años de tu Carrera para rendir el EFIP I y en el último año para el EFIP II, integrando y aplicando lo aprendido a lo largo del cursado.

Conocé más$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/modalidad-ed$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$modalidades$pea0$), null, 0, $pea0$ln-modalidad-edh$pea0$,
        $pea0$Educación Distribuida Home$pea0$, $pea0$Las materias se estudian a través de la Plataforma Multimedia, en un ambiente educativo que combina estrategias multimediales, diseño de métodos de enseñanza y herramientas de comunicación. Además,…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/modalidad-edh el 2026-11-08. Revisalo antes de publicar.

### MODALIDAD 
EDUCACIÓN DISTRIBUIDA HOME

Las materias se estudian a través de la Plataforma Multimedia, en un ambiente educativo que combina estrategias multimediales, diseño de métodos de enseñanza y herramientas de comunicación. Además, contás con el apoyo de un Profesor Tutor y un Profesor Experto (durante los primeros dos cuatrimestres), y a partir del tercer cuatrimestre en adelante, tendrás el respaldo de un Profesor Virtual.

Recursos digitales.

En esta modalidad tu aprendizaje se apoya en las Plataformas Multimedias, donde accedés a materiales, clases grabadas, herramientas interactivas y actividades en línea, con el acompañamiento de tus profesores y tutores.

Plataforma Multimedia

4 Encuentros en el Centro de Apoyo Universitario (CAU)

Plataforma Multimedia

### CONDICIONES DE MATERIAS

Tu espacio central de cursado. Ingresá y mirá el contenido de tus materias.

### INSCRIPCIÓN A MATERIAS

Ingresá para encontrar todo el contenido sobre tu modalidad.

### CALENDARIO ACADÉMICO

Gestioná inscripciones, a materias, parciales, finales y mucho más.

### TODO SOBRE PARCIALES

Resumen de titulo por avance

### TRABAJOS PRÁCTICOS

Resumen de titulo por avance

#### EFIP: Conocé todo lo que necesitás saber sobre esta importante instancia.

Este examen te permite acreditar de forma presencial los conocimientos adquiridos: en los primeros años de tu Carrera para rendir el EFIP I y en el último año para el EFIP II, integrando y aplicando lo aprendido a lo largo del cursado.

Conocé más$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/modalidad-edh$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$modalidades$pea0$), null, 0, $pea0$ln-modalidad-presencial-home$pea0$,
        $pea0$MODALIDAD PRESENCIAL HOME | La Nube 21$pea0$, $pea0$Esta modalidad combina en todas sus asignaturas la presencialidad con la virtualidad en un entorno áulico mediado por tecnologías. Las materias programáticas se cursan durante un bimestre y las mat…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/modalidad-presencial-home el 2026-11-08. Revisalo antes de publicar.

### MODALIDAD PRESENCIAL HOME

Esta modalidad combina en todas sus asignaturas la presencialidad con la virtualidad en un entorno áulico mediado por tecnologías. Las materias programáticas se cursan durante un bimestre y las materias de proceso son de cursado cuatrimestral. Las clases presenciales se cursan de lunes a sábados en horarios diurnos y/o nocturnos, dependiendo el año de cursado y la Carrera, debiendo cumplir con un 75% de asistencia.

Recursos presenciales y digitales

En la modalidad Presencial Home contás con aulas físicas para tus clases, una plataforma multimedia que integra todos los recursos digitales y sedes universitarias que respaldan tu experiencia académica.

Aula Presencial

Plataforma Multimedia

Sede Campus Córdoba

Sede Nueva Córdoba

Sede Río Cuarto

Conocé todo lo que necesitás saber de tu modalidad

### CONDICIONES DE MATERIAS

Tu espacio central de cursado. Ingresá y mirá el contenido de tus materias.

### INSCRIPCIÓN A MATERIAS

Ingresá para encontrar todo el contenido sobre tu modalidad.

### CALENDARIO ACADÉMICO

Gestioná inscripciones, a materias, parciales, finales y mucho más.

### TODO SOBRE PARCIALES

Resumen de titulo por avance

### TRABAJOS PRÁCTICOS

Resumen de titulo por avance

#### Registrá tu asistencia en la APP Siglo 21

Con tu celular podés registrar tu asistencia a las clases de manera ágil y sencilla. Solo necesitás descargar la App Siglo 21 e ingresar con tu usuario para validar tu presencia en cada cursado.

Conocé la App

#### ¿Cursas en Sede? Conocé cómo habitar los espacios de la Universidad

- SEDE CAMPUS

Ingresá acá

En el Campus vas a encontrar múltiples espacios de estudio, recreación y servicios. Te invitamos a conocer las pautas y recomendaciones para aprovechar al máximo tu experiencia universitaria en la sede.

- SEDE NUEVA CÓRDOBA

- SEDE RIO CUARTO$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/modalidad-presencial-home$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$modalidades$pea0$), null, 0, $pea0$ln-modalidad-presencial$pea0$,
        $pea0$Presencial$pea0$, $pea0$Esta modalidad combina en todas sus asignaturas la presencialidad con la virtualidad en un entorno áulico mediado por tecnologías. Las materias se cursan durante un cuatrimestre, con un porcentaje…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/modalidad-presencial el 2026-11-08. Revisalo antes de publicar.

### MODALIDAD PRESENCIAL

Esta modalidad combina en todas sus asignaturas la presencialidad con la virtualidad en un entorno áulico mediado por tecnologías. Las materias se cursan durante un cuatrimestre, con un porcentaje mayor de asistencia a clases presenciales sobre el cursado virtual. Las clases presenciales se cursan de lunes a sábados en horarios diurnos y/o nocturnos, dependiendo el año de cursado y la Carrera, debiendo cumplir con un 75% de asistencia.

Recursos presenciales y digitales

La modalidad presencial se apoya en aulas dinámicas, recursos digitales y sedes académicas que facilitan tu aprendizaje y acompañan tu trayectoria universitaria.

Aula Presencial

Plataforma Multimedia

Sede Campus Córdoba

Sede Nueva Córdoba

Sede Río Cuarto

Conocé todo lo que necesitás saber de tu modalidad

### CONDICIONES DE MATERIAS

Tu espacio central de cursado. Ingresá y mirá el contenido de tus materias.

### INSCRIPCIÓN A MATERIAS

Ingresá para encontrar todo el contenido sobre tu modalidad.

### CALENDARIO ACADÉMICO

Gestioná inscripciones, a materias, parciales, finales y mucho más.

### TODO SOBRE PARCIALES

Resumen de titulo por avance

### TRABAJOS PRÁCTICOS

Resumen de titulo por avance

#### Registrá tu asistencia en la APP Siglo 21

Con tu celular podés registrar tu asistencia a las clases de manera ágil y sencilla. Solo necesitás descargar la App Siglo 21 e ingresar con tu usuario para validar tu presencia en cada cursado.

Conocé la App

#### ¿Cursas en Sede? Conocé cómo habitar los espacios de la Universidad

- SEDE CAMPUS

Ingresá acá

En el Campus vas a encontrar múltiples espacios de estudio, recreación y servicios. Te invitamos a conocer las pautas y recomendaciones para aprovechar al máximo tu experiencia universitaria en la sede.

- SEDE NUEVA CÓRDOBA

- SEDE RIO CUARTO$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/modalidad-presencial$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$oferta-academica$pea0$), null, 0, $pea0$ln-modulo0$pea0$,
        $pea0$Módulo 0$pea0$, $pea0$En este programa preparatorio te acercamos contenido y clases niveladoras diseñadas especialmente para que inicies el cursado de la mejor manera. Te ayudara a adquirir conocimientos esenciales para…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/modulo0 el 2026-11-09. Revisalo antes de publicar.

#comp-mlfjyoeh svg [data-color="1"] {fill: #4BD1A0;}

En este programa preparatorio te acercamos contenido y clases niveladoras diseñadas especialmente para que inicies el cursado de la mejor manera. Te ayudara a adquirir conocimientos esenciales para las materias troncales de tu carrera y a adoptar con anticipación nuestro Modelo Académico.

- Inicio de Cursado: 18 de febrero

#### ¿Qué es el Módulo 0?

Es un módulo de lecturas que encontrás dentro de tu materia en tu Aula Virtual (CANVAS), un recorrido breve y guiado, para llegar al comienzo de clases con más claridad y seguridad. Se habilita un mes antes del cursado y está pensado para que puedas aprender, practicar y afianzar los conceptos clave que vas a necesitar durante la cursada.

#### ¿Cuáles son los beneficios que vas a lograr al cursar el módulo 0?

Llegás al inicio de clases con más claridad sobre los temas centrales.

Construís una base de conceptos que después se profundizan en clases.

Obtenes una mejor organización desde el primer día y evitás acumularte al comienzo.

Ganás seguridad al avanzar con guía y práctica antes de la cursada.

Listado de materias que incluyen Módulo 0

| ALGEBRA Y GEOMETRIA |
| --- |
| ALGEBRA Y GEOMETRIA |
| ANALISIS MATEMATICO |
| ANATOMIA |
| ANATOMÍA HUMANA |
| ARQUITECTURA DEL COMPUTADOR |
| BALISTICA |
| BASE DE DATOS I |
| BASES DEL DERECHO PRIVADO |
| BIOQUIMICA I |
| BIOQUIMICA II |
| CALCULO AVANZADO |
| CALCULO INTEGRAL |
| CIENCIAS BIOLÓGICAS |
| DERECHO CONSTITUCIONAL |
| DERECHO PENAL ECONOMICO |
| DERECHO PENAL: PARTE GENERAL |
| ECONOMIA INTERNACIONAL |
| ELECTROTECNIA Y TERMOTECNIA |
| ENFERMERIA BASICA I |
| ESTADISTICA Y PROBABILIDAD |
| FISIOLOGÍA |
| FISIOLOGÍA HUMANA |
| FUNDAMENTOS DE ANATOMÍA HUMANA |
| HERRAMIENTAS MATEMATICAS I - ALGEBRA |
| HERRAMIENTAS MATEMATICAS II - ANALISIS |
| HERRAMIENTAS MATEMATICAS III - ESTADISTICA I |
| HERRAMIENTAS MATEMATICAS III - ESTADISTICA I |
| HERRAMIENTAS MATEMÁTICAS I - ÁLGEBRA |
| HERRAMIENTAS MATEMÁTICAS II - ANÁLISIS |
| HISTORIA DEL DERECHO |
| INTRODUCCION AL DERECHO |
| INTRODUCCIÓN A LA CIENCIA DE DATOS |
| INTRODUCCIÓN A LA PSICOLOGÍA |
| LENGUAJES FORMALES Y COMPUTABILIDAD |
| LOGICA SIMBOLICA |
| MATEMATICA DISCRETA |
| NEUROANATOMÍA Y NEUROFISIOLOGÍA |
| PLAN DE MARKETING DIGITAL |
| PRINCIPIOS DE ECONOMIA |
| PRINCIPIOS DE LA CONTABILIDAD |
| PROGRAMACION LOGICA |
| PROGRAMACION ORIENTADA A OBJETOS |
| SISTEMAS DE INFORMACION |
| TEORIA DE LA ARGUMENTACION JURIDICA |

Vas a encontrar recursos diseñados para prepararte de forma progresiva:

- Cuatro lecturas interactivas.

- Actividades con devolución inmediata, para que puedas practicar, corregir y entender el porqué de cada respuesta.

- Recursos de apoyo (por ejemplo, material complementario o clases grabadas, cuando estén disponibles).

- Acompañamiento personalizado por parte de un tutor virtual a través de la mensajería en CANVAS, quien te va a orientar en el recorrido y te ayudará a resolver tus dudas.

Potenciá tu desempeño: participar del Módulo 0 incrementa un 20% tus posibilidades de aprobar la materia

#### ¿Cómo se cursa el Módulo 0?

Se cursa a través de tu Aula Virtual (CANVAS) en un trayecto simple. Mirá cómo acceder a las lecturas:

#comp-mlfiosvc svg [data-color="1"] {fill: #4BD1A0;}

Ingresa a tu Aula Virtual (CANVAS) en la materia que tiene habilitado el módulo.

#comp-mlfipkkw svg [data-color="1"] {fill: #4BD1A0;}

En la página de inicio, haces clic en módulo 0.

#comp-mlfiprrz svg [data-color="1"] {fill: #4BD1A0;}

Una vez que ingreses vas a encontrar las cuatro lecturas del módulo.

#comp-mlfipypd svg [data-color="1"] {fill: #4BD1A0;}

Para acceder a una lectura, hacés clic en “Ver lectura”.

#comp-mlfiq847 svg [data-color="1"] {fill: #4BD1A0;}

Avanzás y realizás las actividades de repaso, que se encuentran al final de cada lectura. En cada actividad, recibís feedback inmediato, para identificar errores, ver las respuestas correctas y comprender la justificación.

#### Acompañamiento y consultas

Durante este recorrido no vas a estar solo/a vas a contar con acompañamiento para:

Resolver dudas sobre cómo avanzar, dónde encontrar materiales o cómo usar el espacio dentro del Aula Virtual (CANVAS).

Organizar tu cursado (qué hacer primero, cómo seguir, cómo retomar si te pausaste las actividades)

Cuando lo necesites vas a poder canalizar consultas vinculadas al contenido.

¿Cómo te comunicas con tus Tutores Virtuales?

Te recordamos que cuentas con el apoyo de un Tutor Virtual, quien te acompaña durante el cursado de la materia y está disponible para resolver todas tus consultas académicas.

Puedes contactarlo a través de la mensajería de la materia en tu Aula Virtual (CANVAS).

#### Mirá el vídeo y aprendé a enviar mensajes a tu docente desde tu Aula Virtual (CANVAS)$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/modulo0$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$plataformas$pea0$), null, 0, $pea0$ln-portal-de-estudiantes$pea0$,
        $pea0$Portal de Estudiantes | La Nube 21$pea0$, $pea0$El Portal Estudiantes permite ver toda la información relacionada con tu cursado y avance de tu vida académica. En este portal, encontrarás:​$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/portal-de-estudiantes el 2026-11-08. Revisalo antes de publicar.

#### PORTAL DE ESTUDIANTES

El Portal Estudiantes permite ver toda la información relacionada con tu cursado y avance de tu vida académica. En este portal, encontrarás:​

​​Acceso directo a toda la información relacionada con la o las Carreras que estés cursando.

​​Un módulo para inscribirte para rendir exámenes.

Un módulo para inscribirte en las materias de tu Carrera.​

Vínculo directo a ePagos para poder completar tu inscripción a tus materias.

Simulador de pagos para que puedas gestionar mejor tus gastos.

Sección llamada “Más opciones” que ofrece un vínculo directo a una guía acerca de este portal, a una ventana donde podrás cambiar tu contraseña de ingreso, la información para ponerte en contacto con la universidad Siglo 21, y mucho más.

#### Conocé el
Portal de Estudiantes

Ingresá

al Portal

Conocé tu información de la carrera

¿Cómo

inscribirte a materias?

Pagos y Simulador de Precios

¿Cómo

inscribirte a tus exámenes?

¿Cómo modificar tus datos personales?

#### ¿Cómo ingresar a tu Portal Estudiantes?

#### 1.

Iniciá sesión con tu cuenta institucional.

Podés hacerlo desde el siguiente enlace:

Accedé al Portal Estudiantes

- Se abrirá una ventana donde deberás ingresar tus datos de acceso.

- En el campo de usuario, escribí tu dirección de correo institucional:

[N.USUARIO@soysiglo.21.edu.ar](mailto:N.USUARIO@soysiglo.21.edu.ar)

- Luego hacé clic en el botón “Siguiente”.

[N.USUARIO@soysiglo.21.edu.ar](mailto:N.USUARIO@soysiglo.21.edu.ar) ​​

- Escribí tu contraseña y presioná “Iniciar sesión” para acceder a tu aula virtual.

​​​

#### ¿Cómo se Ingresa al Portal de Estudiantes?

Si al hacer clic en el link para ingresar al Portal Estudiantes te aparece un error, seguí estos pasos:

1. Borrá cookies y caché del navegador

Esto ayuda a eliminar información almacenada que podría estar causando el error.

¿Cómo hacerlo?

Google Chrome

- Hacé clic en los tres puntos verticales (arriba a la derecha).
- Seleccioná "Configuración" > "Privacidad y seguridad".
- Elegí "Borrar datos de navegación".
- Marcá "Cookies y otros datos de sitios" y "Archivos e imágenes en caché".
- Hacé clic en "Borrar datos".

​​

Otros Navegadores​​​

- Hacé clic en las tres líneas horizontales (arriba a la derecha).
- Seleccioná "Configuración" > "Privacidad y seguridad".
- En la sección "Cookies y datos del sitio", hacé clic en "Borrar datos…".
- Seleccioná ambas opciones y confirmá.

2. Intentá ingresar nuevamente al Portal

- Probá hacer clic en el enlace del Portal otra vez después de borrar los datos.

3. Si el error persiste:

- Probá ingresar desde otro navegador (por ejemplo, si usás Chrome, intentá con Firefox).
- O bien, abrí una ventana de navegación en modo incógnito y volvé a intentar.

Información Importante

- Si sos alumno ingresante recordá que tus datos de acceso te llegarán a tu casilla de correo electrónico informada al momento de inscribirte

- Verificá en correo no deseado

- Puede demorar 48 hs hábiles en llegarte.

#### ¿Qué pasa si no recuerdo mi contraseña para ingresar?

Accedé al Portal

Si no recordás tu contraseña, hacé clic en el enlace que dice

“Si no conoces o si olvidaste tu contraseña, podés restablecerla desde aquí”. Se abrirá una nueva pestaña para recuperarla.

- O directamente ingresando al siguiente link:

Recuperá tu clave acá

#### 2.

Ingresá tu usuario institucional.

- En el campo de texto, escribí tu usuario sin el @soysiglo.21.edu.ar

Ejemplo: si tu correo es N.USUARIO@soysiglo.21.edu.ar

Ingresá: N.USUARIO

- Luego hacé clic en “Siguiente”.

N.USUARIO​​

#### 3.

Confirmá tu correo de recuperación.

- El correo de recuperación es tu mail personal registrado en tu Portal de Estudiantes.

- Si es correcta, hacé clic en “Enviar contraseña”.

#### 4.

Revisá tu mail.

- Vas a recibir un correo con instrucciones para generar una nueva contraseña. Seguí el enlace, creá una nueva clave segura, ¡y listo!

#### Cursado: Conocé toda la información de tu Carrera

#### Carrera que estás cursando

#### Agenda de eventos

#### Menu

#### Accesos directos

#### Últimas noticias

#### Menú

Cursado: Es la ventana inicial del “Portal Estudiantes” en el que se despliega la carrera que estés cursando, se visualizan eventos, resultados de exámenes si ya hubieras rendido alguno, y desde donde se accede a las demás secciones

Examen: Gestioná tus exámenes de un modo fácil y práctico

Materias: Mediante este módulo podrás inscribirte a las materias a cursar y tener un control total de tu carrera

Pagos: El acceso directo a este módulo te brinda la comodidad necesaria para finalizar el proceso de inscripción a materias y organizar tus gastos

Simulador de Precios: El propósito de este simulador es la de acercarte una app que te provea un cálculo estimativo de tus gastos

Certificados: Accedé a algunas de tus constancias y certificados.

Más opciones: Accedé a información adicional sobre tu vida académica en Siglo 21, entre otros: una agenda para ver todas tus obligaciones de un solo vistazo, un acceso a "Ayuda" para preguntas frecuentes, un lugar donde cambiar tu Contraseña al Portal Estudiantes, actualizar tus datos personales y mucho más

Volver a Cursado

#### Consultá las carreras que estás cursando

En el centro de la pantalla se mostrará una tarjeta verde con el nombre y algunos detalles de la carrera en la que te has inscripto tales como la cantidad de materias aprobadas y el total de materias existentes en la Carrera.

Legajo

Nivel de Estudio

Modalidad

Si haces clic sobre la tarjeta verde de una carrera en particular, vas a poder ver las materias que la conforman agrupadas en:

- Aprobadas: Aquí se listarán las materias que hayas aprobado

- Pendientes: Aquí se listarán las materias que aún debes cursar y aprobar

- Cursando: Aquí se listarán las materias que estés actualmente cursando

- Regulares: Aquí se listarán las materias en las que hayas obtenido la regularidad

- Libres por Nota: Aquí se listarán las materias que has cursado anteriormente pero no has aprobado.

#### MATERIAS

Volver a Cursado

#### Próximos Eventos

Al ingresar al “Portal Estudiantes” podrás visualizar debajo de la tarjeta verde una sección llamada “Próximos Eventos”.

Hacé clic en un Evento para desplegar detalles sobre el mismo o en el botón Ver Todo para acceder a más eventos de los desplegados en pantalla.

Volver a Cursado

#### Últimas Notas

A la derecha de la pantalla, podrás visualizar una listado con los exámenes rendidos y los datos más relevantes acerca de los mismos. Por ejemplo, en el caso de un examen, la fecha en la cual lo rendiste, o si lo aprobaste o no, y en el caso de un TP, la fecha de entrega.

Volver a Cursado

#### Materias: Conocé cómo inscribirte a tus materias

Ingresa al botón Materias y gestioná tus inscripciones a las materias que te corresponde cursar en un período lectivo determinado y también la generación de tickets para realizar los pagos correspondientes para finalizar el proceso de inscripción.

#### Conocé cómo inscribirte
a tus materias

#### Ingresá acá

#### Revisá las Correlativas y Programa de cada Materia

Para conocer si una materia tiene correlativas, deberás ingresar a tu Portal de Estudiantes, hacer click en tu Carrera y revisar el Plan de Estudio.

Si querés ver las correlativas que tiene cada materias, deberás hacer click en Ver Correlativas. Si necesitas ver el programa de la materia, hacé click en Ver Programa.

#### Pagos: Conocé cómo utilizar e-pagos

A través de este botón vas a poder acceder a E-pagos y puedes efectuar los pagos correspondientes a los paquetes que obtuviste y así finalizar el proceso de inscripción a las materias que vas a cursar.

A continuación, se desplegará en una ventana nueva el sitio de pagos.

Hacé clic en la opción de acuerdo a la acción que debas ejecutar. Las opciones son:

- Matrícula y Aranceles: selecciona esta opción para efectuar pagos que completarán tu proceso de inscripción a las materias a cursar.

- Pago a cuenta: selecciona esta opción para abonar un monto diferente al que te arroja el sistema o para utilizar varios medios de pago.

- Otros pagos: selecciona esta opción para efectuar pagos que no sean de matrículas o aranceles. Por ejemplo, mediante esta opción podrás pagar, entre otros, el pedido de un Certificado Analítico Parcial.

#### Precios: Probá el Simulador de Precios

Desde aquí podes obtener un estimativo del monto que deberías pagar de acuerdo a la selección de paquetes que realices. De este modo, tendrás un mayor control de tu presupuesto y podrás anticipar futuros gastos. Además, podes utilizar el simulador para ver cómo se aplican las promociones comerciales, descuentos, becas o beneficios que tengas asociados a tu legajo académico.

A continuación se desplegará la siguiente pantalla:

IMPORTANTE:

​​Los precios son meramente estimativos y pueden variar. Los descuentos, becas y beneficios aplicados impactan en cada caso de manera particular y podrían verse modificados o alterados.

Asimismo, la estimación de pago que se realiza desde esta herramienta de simulación tiene una vigencia de 24 horas.

#### Exámenes: Conocé cómo inscribirte a tus parciales y finales

Ingresá al botón Exámenes para gestionar de tus exámenes ya sean parciales, finales o EFIP. Aquí podrás inscribirte a exámenes, visualizar su inscripción o, si aún no fue aceptada, anularla.

#### Conocé cómo inscribirte
a tus exámenes

#### ¿Cómo actualizar tus datos personales?

Ingresá a tu Portal de Estudiantes y en Más opciones, hacé click en Actualizar tus Datos Personales.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/portal-de-estudiantes$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$oferta-academica$pea0$), null, 0, $pea0$ln-posgrado-presencial$pea0$,
        $pea0$POSGRADO PRESENCIAL | La Nube 21$pea0$, $pea0$Se trata de un modelo de cursado flexible en tiempo y lugar, que combina la modalidad PRESENCIAL con la VIRTUAL. Bajo este modelo el alumno cursará tres materias en forma paralela por periodo acadé…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/posgrado-presencial el 2026-11-08. Revisalo antes de publicar.

#### POSGRADO
Modalidad Presencial

Se trata de un modelo de cursado flexible en tiempo y lugar, que combina la modalidad PRESENCIAL con la VIRTUAL. Bajo este modelo el alumno cursará tres materias en forma paralela por periodo académico (bimestral) utilizando la plataforma Canvas y asistiendo mensualmente a instancias presenciales en la Sede Campus. Ambas instancias son integradas y complementarias

Consultá los programas y planes de estudio de las Especializaciones y Maestrías vigentes, en nuestra página web oficial de la universidad Ingresando aquí

Curso Nivelatorio

Documentación y convenios

¿Cómo

curso?

Experiencias Ampliadas

¿Cómo apruebo?

Preguntas Frecuentes

Calendario académico

#### ¿Cómo genero mis aranceles y me inscribo a mis materias?

#### Consulta el instructivo acá

#### Curso Nivelatorio

Algunos de los Programas de Posgrado que desarrolla la Universidad, ofrecen una instancia de Curso Nivelatorio como soporte para los alumnos con formación no relacionada al área disciplinar del posgrado elegido.

Duración: 1 bimestre

Cursado: Virtual a través del Aula Virtual (Canvas)

Los Posgrados que ofrecen esta instancia son:

- Maestría en Administración de Empresas
- Maestría en Administración de Negocios Y Aplicaciones Tecnológicas en la Empresa
- Maestría en Derecho Internacional
- Maestría en Inteligencia de Negocios y Explotación de Datos
- Especialización en Finanzas Corporativas y Mercado de Capitales

#### ¿Cómo apruebo el curso de nivelación?

El curso de Nivelación puede tener solamente dos estados al finalizar: LIBRE o APROBADO.

Para lograr la condición de APROBADO, deberás rendir un examen con 50% o más, lo que se traducirá en una nota de 7.

Si al rendir tu examen no alcanzas el 50%, la nota que obtendrás será 2.

Recordá que la nota final del curso de nivelación, NO se encuadra dentro de la tabla de calificaciones del Posgrado ni se cuenta en el promedio de tu carrera. Si al final de tu primer año, tenés aprobadas todas tus materias, el curso de nivelación se dará por aprobado

#### ¿Cómo curso mi posgrado?

El cursado combina la modalidad PRESENCIAL con el aprendizaje mediado por tecnología a través de la Plataforma CANVAS.

Tienen clases presenciales cada 2 semanas, sujeto a cambios en caso de feriados o fines de semana largos (verificar cada cronograma).

La Especialización En Derecho penal tributario y económico tiene una modalidad de cursado diferente. Te sugerimos consultar su cronograma

#### ¿Cómo apruebo mis materias?

En tu posgrado tendrás una estructura de asignaturas, alguna de las cuales tienen un cursado Bimestral y otras un cursado Cuatrimestral.

#### Materias Programáticas (bimestrales)

Constan de 4 actividades prácticas llamadas AP. Para aprobar la materia debes aprobar obligatoriamente la AP 4 con una calificación igual o mayor al 50%, y, además, el promedio de las notas obtenidas en la AP 1, AP 2, AP 3 y AP 4 (todas las actividades) debe ser igual a 50% o más.

#### AP 1: Múltiple opción

- Es una Actividad de corrección automática e INDIVIDUAL.
- Posee 2 intentos dentro de la fecha de entrega estipulada. Ese segundo intento es el único RECUPERATORIO.

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

#### AP 2: Múltiple opción

- Es una Actividad de corrección automática e INDIVIDUAL.
- Posee 2 intentos dentro de la fecha de entrega estipulada. Ese segundo intento es el único RECUPERATORIO.

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

#### AP 3: a desarrollar

- Consiste en un trabajo grupal a desarrollar.
- Los grupos se arman de manera aleatoria en CANVAS, durante la segunda semana de cursado.
- NO posee recuperatorio.

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

#### AP 4: a desarrollar

- Es un trabajo en el que se integran los conocimientos desarrollados en la materia
- Tiene recuperatorio, en caso de:

-No llegar al promedio mínimo del 50% entre las 4 AP.

-No alcanzar la calificación mínima de la AP 4

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

#### Materias de Proceso (cuatrimestrales)

Constan de 4 actividades prácticas llamadas AP. Para aprobar la materia debes aprobar obligatoriamente la AP 4 con una calificación igual o mayor al 50%, y, además, el promedio de las notas obtenidas en la AP 1, AP 2, AP 3 y AP 4 (todas las actividades) debe ser igual a 50% o más.

#### AP 1: A desarrollar

- Consiste en un trabajo Individual a desarrollar.
- No posee recuperatorio

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

#### AP 2: A desarrollar

- Consiste en un trabajo Individual a desarrollar, donde se continua con la AP 1
- No posee recuperatorio

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

- Consiste en un trabajo Individual a desarrollar, donde se continua con la AP2
- NO posee recuperatorio.

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

- Consiste en un trabajo Individual a desarrollar, donde se da cierre a lo trabajado en la AP1, AP2 y AP3
- Tiene recuperatorio, en caso de no llegar a la calificación mínima de la AP 4

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

#### Notas: Escala aritmética

#### Actividad de formación práctica

La actividad de formación práctica, brinda un espacio de integración y aplicación de los contenidos, modelos y herramientas desarrollados en el transcurso del cursado.

En esta materia vas a trabajar sobre un caso o situación real en la que, a partir de la aplicación de herramientas de diagnóstico propias de la disciplina desarrolladas en base a los conocimientos previamente adquiridos en el cursado de la carrera, buscarás detectar una situación problemática u oportunidad de mejora teniendo como objetivo plantear una propuesta superadora a aplicar al caso en función del diagnóstico realizado.

#### Objetivo General

​Desarrollar una visión sistémica de un caso o situación real, aplicando de manera integral los conocimientos previos, para la toma de decisiones y elaboración de propuestas de mejora.

#### Objetivos Específicos

Realizar un diagnóstico sobre un caso o situación problemática real

Aplicar conceptos teóricos y metodológicos desarrollados previamente en la carrera para el análisis de la situación. Generar una propuesta de intervención sobre la realidad que implique una mejora sustancial en la situación relevada.

#### ¿Cómo se cursa?

La materia es cuatrimestral y deberás desarrollar un trabajo practico integral referido al caso o situación real que estés analizando de acuerdo a las consignas que te brinde el profesor. Tendrás que cumplir con tres entregas parciales del trabajo, en fecha pre establecida y a través de la plataforma CANVAS, que evidencien el grado de avance en el proceso de análisis y elaboración; y una entrega final en la que se reflejará el diagnóstico de situación y la propuesta de mejora o solución planteada ya finalizada.

Cada una de las entregas se considera una actividad práctica (AP) en si misma, aunque sean parte de un solo trabajo.

#### ¿Cómo se aprueba?

Para aprobar la materia debes aprobar obligatoriamente la AP 4 con una calificación igual o mayor al 50%, y, además, el promedio de las notas obtenidas en la AP 1, AP 2, AP 3 y AP 4 (todas las actividades) debe ser igual a 50% o más.

Las 4 entregas o AP son a desarrollar y de carácter INDIVIDUAL.

#### ¿Qué documentos debo presentar?

Para poder dar inicio a tu actividad de formación práctica, es necesario que la organización sobre la que vas a realizar tu estudio de caso, haya suscrito con la Universidad Siglo 21 un convenio marco de actividades académicas, y que vos como alumno firmes una carta compromiso sobre preservación de la confidencialidad en uso de los datos

#### Taller de metodología para trabajo final

A los fines de la graduación como Especialista o Magisters, al finalizar el cursado de todo el Plan de estudio, cada estudiante presentará un trabajo final individual por escrito siendo necesario que presente previamente un proyecto –cuyas líneas de temática serán brindada según carrera- a la dirección.

A ese fin, el Taller de Metodología para el Trabajo Final cobra relevancia, ya que tiene por objeto la capacitación y el apoyo metodológico para entrenar a los participantes de la carrera en el diseño y presentación de dicho proyecto.

Introducir a futuros especialistas y magisters, en el campo de la investigación y capacitarlos en el diseño y presentación de un proyecto de trabajo final en temas propios del área.

Reflexionar sobre el rol y la significación de la investigación en las organizaciones.

Analizar los componentes del proceso de investigación científica.

Comprender la importancia de la selección y presentación del marco teórico como fundamento del trabajo final a realizar.

Guiar para la presentación de un proyecto de trabajo final (investigación, innovación, intervención profesional) en la metodología general.

Desarrollar habilidad para la argumentación y la expresión escrita bajo las normas APA.

Para aprobar la materia debes aprobar obligatoriamente la AP 4 con una calificación igual o mayor a 4 que es el equivalente al 50%, y, además, el promedio de las notas obtenidas en la AP 1, AP 2, AP 3 y AP 4 (todas las actividades) debe ser igual a 50% o más.

Las 4 AP son a desarrollar y de carácter INDIVIDUAL. Solo la AP 4 tiene posibilidad de recuperatorio.

#### Calendario académico y cronograma de cursado

Conocé cuáles son las fechas de vencimiento de tus actividades.

Descarga el Calendario en PDF

#### Consulta las materias habilitadas para cada período

Conocé las materias que se habilitan en cada periodo, ingresando al siguiente link:

Consultá las materias habilitadas

#### 1

Elegí la carrera que estás cursando.

#### 2

Elegí tu cohorte de ingreso, es decir el periodo en el que comenzaste a cursar.

#### 3

Bajá con el cursor y revisá las materias habilitadas para cada periodo.

#### Documentación y convenios

#### ¿Qué documentación debo presentar para mi legajo?

- Ficha de inscripción, [descárgala acá](https://contenidos.21.edu.ar/_autogestion/inscripcion/fdi/ficha-de-inscripcion.pdf).
- Fotocopia de DNI (Frente y dorso).
- Fotocopia legalizada del Título de Grado.
- CV actualizado.
- 2 fotos tipo carnet.
- Carta de aceptación del reglamento [descárgala acá](https://contenidos.21.edu.ar/_autogestion/inscripcion/reglamento/carta-de-aceptacion-reglamento.pdf).
- Completar y/o suscribir todo otro formulario o documentación adicional que se requiera, en virtud de los procedimientos administrativos vigentes al momento de la solicitud de admisión.
- Fotocopia legalizada del título de grado o admisión excepcional art 39 Bis ley de educación superior.

#### Documentación Específica por Programas de Posgrados y Ciclos de Complementación

#### Maestría en Administración de Empresas

#### Maestría en Administración de Negocios y Aplicaciones Tecnológicas en la Empresa

#### Maestría En Criminología Y Ciencias Forenses

#### Maestría en Derecho Internacional

#### Maestría en Derecho Procesal

#### Maestría en Innovación Educativa

#### Especialización en Contabilidad y Auditoría

#### Especialización en Derecho de Familia, Niñez y Adolescencia

#### Especialización en Finanzas Corporativas y Mercado de Capitales

#### Especialización en Gestión y Gobierno de Empresas Familiares

#### Especialización en Logística y Cadena de Suministro

#### Especialización en Marketing y Dirección Comercial

#### Especialización en Negocios Internacionales

#### ¡Si sos extranjero!

- Se requiere presentar:

DNI o Pasaporte + Título de grado emitido por la Universidad de origen.

La normativa general establece que, para cursar una carrera de posgrado en la República Argentina, quienes posean un título de grado obtenido en el extranjero deberán convalidarlo o revalidarlo (según corresponda), conforme a la normativa vigente al momento de realizar el trámite.

No obstante, según lo dispuesto por la Resolución Ministerial N.º 416/00, las universidades podrán reconocer títulos de grado obtenidos en el extranjero exclusivamente a los efectos de la prosecución de estudios de posgrado en la República Argentina, siempre que el programa no requiera el ejercicio profesional.

#### ¿Dónde presento la documentación?

Para cargar tu documentación de legajo de manera digital y autogestiva deberás utilizar la plataforma Digital Admin.

Ingresá a Digital Admin

Utilizá las flechas y conocé el paso a paso para cargar tu documentación de legajo

#### 1- Creá tu cuenta

#### Ingresar a Digital Admin y creá tu cuenta de usuario completando todos los campos de la derecha.

Ingresá a Digital Admin

En caso de que tengas un usuario y no recuerdes la contraseña, podrás clickear en “Olvidé mi contraseña” y recibirás un acceso al correo electrónico asociado para poder reestablecerla.

#### Experiencias Ampliadas

Las Experiencias Ampliadas son propuestas académicas internacionales que complementan y potencian tu posgrado en Universidad Siglo 21.

Están pensadas para que puedas profundizar tu formación en áreas estratégicas, vivir una experiencia educativa en entornos globales y sumar certificaciones internacionales, sin modificar tu plan de estudios ni extender la duración de tu programa.

Son oportunidades para expandir tu mirada profesional, conectar con estudiantes y docentes de distintos países y llevar tu perfil académico a un nivel superior.

#### Babson Buil

Programa académico intensivo de una semana en Babson College (EE. UU.), la universidad líder mundial en emprendimiento

Además del posgrado que estás cursando en Siglo 21, hoy podés sumar una experiencia internacional que te permite focalizar tu formación en emprendimiento e innovación, sin cambiar de programa ni extender su duración.

Para muchos estudiantes, Babson Build funciona como una especialización práctica integrada a su MBA o maestría, dictada por el referente global en educación emprendedora.

Durante una semana intensiva se trabaja sobre:

- Pensamiento emprendedor.
- Modelos de negocioInnovación.
- Marketing emprendedor.
- Toma de decisiones en contextos de incertidumbre.
- Escalamiento de negocios.​

El programa culmina con un pitch final al estilo Shark Tank, donde equipos internacionales presentan sus proyectos ante un jurado académico, poniendo en práctica las metodologías y herramientas trabajadas durante la semana.

La experiencia incluye:

Formación académica:

- Clases presenciales con profesores de Babson.
- Materiales académicos y casos.
- Proyecto grupal internacional + pitch final.
- Certificado y badge oficial.

Experiencia residencial:

- Alojamiento compartido en residencias.
- Ropa de cama y servicios incluidos.
- Acceso a instalaciones del campus (biblioteca, espacios académicos, gym con tarifa reducida).

Alimentación:

- 3 comidas por día (lunes a viernes).
- Eventos académicos con comidas incluidas.

Logística:

- Traslado grupal aeropuerto-programa.
- Transporte grupal a Boston.

Acceso posterior:

- Plataforma académica (Canvas) por 6 meses.

Requisitos:

- Estar cursando un Posgrado virtual o presencial
- Experiencia laboral de mas de 2 años.
- Nivel avanzado de Inglés.
- Visa vigente al momento del programa.

Inversión del programa: USD 2.340

Este valor es posible porque Universidad Siglo 21 es miembro de Babson Collaborative for Entrepreneurship Education, una red académica de 44 universidades en 31 países seleccionadas por su compromiso con la educación emprendedora. Formar parte de esta red permite ofrecer condiciones preferenciales y acceso directo a programas de altísimo prestigio internacional.

#### CEREM | Global Business School

Global Business Immersion (GBI) – Madrid

Viví una semana de inmersión internacional que impulsa tu desarrollo profesional y te conecta con líderes influyentes del ecosistema empresarial europeo e iberoamericano.

La Global Business Immersion es un programa vivencial de alto impacto que combina formación, networking y acceso directo a empresas e instituciones referentes de España y Europa. Está orientada a profesionales que buscan comprender tendencias emergentes y adquirir herramientas clave en un entorno global.

¿Qué ofrece la experiencia?

4 ejes centrales

- Liderazgo
- Negocios globales
- Emprendimiento e innovación
- Tecnología

Actividades destacadas

Conferencias con expertos internacionales

- Visitas a empresas líderes
- Casos prácticos sobre desafíos reales
- Networking estratégico con directivos, emprendedores y profesionales de múltiples países

Un entorno único para conectar

La GBI te permite interactuar con referentes del ecosistema europeo, participar en mesas de debate y construir una red global que potencia tu carrera y amplía tus oportunidades profesionales.

GBI en cifras

- 12 ediciones
- 45+ speakers internacionales
- 30+ empresas visitadas
- (Iberdrola, Telefónica, Santander, Naturgy, entre otras)
- 30+ casos de negocio analizados
- 1.400+ profesionales de 19 países
- 100% recomiendan la experiencia

#### Trabajo Final de posgrado

### Trabajo final Maestrías

3 min de lectura

### Trabajo Final Especializaciones

2 min de lectura

#### Preguntas Frecuentes

POSGRADO

La siguiente es la tabla de conversión utilizada para trasladar los puntos que se obtienen en las Actividades Prácticas, a una nota para el acta que forma parte de su analítico e historial académico. Podrán visualizar las mismas en tu Portal de Estudiantes.

Mesa de atención
Edificio Escuela de negocios. Calle de los Latinos N°8555, B° Los Boulevares, CP. 5008. Córdoba.

Correo Posgrado
posgrado@soysiglo.edu.ar

Ingresá en el botón Cuenta de tu SAM y luego en Configuraciones
 

Hacé Click en +Dirección de correo electrónico
 

Completá tu correo y hacé Click en registrar correo electrónico
 

Si lo deseas, también podes registrar tu número de teléfono para recibir SMS.

Ingresá al botón Notificaciones incluido en tu cuenta y ACTIVA las notificaciones que te interesen recibir ALERTAS

1. Al ingresar a la plataforma, debes ir a “Tablero”, donde encontrarás cargadas las materias que estas
cursando.
2. Seleccionas la materia en la que trabajaras, haciendo clic en el nombre de la misma
3. Una vez que ingresas verás la página de inicio. Ingresar a CALIFICACIONES.
4. Clic en Actividad Práctica 1 (TP1) para ver los detalles de tu entrega.

 
5. Se abre la siguiente pantalla. Hacer clic en VER COMENTARIOS.

 
6. Allí podrás ver tu entrega y en caso que el profesor haya resaltado o dejado comentarios, podrás leerlos.

1. Al ingresar a la plataforma, debes ir a “Tablero”, donde encontrarás cargadas las materias que estas
cursando.
2. Seleccionas la materia en la que trabajaras, haciendo click en el nombre de la misma
3. Una vez que ingresas verás la página de inicio

 
4. En la siguiente pestaña verás el contenido del PRIMER MÓDULO de tu materia:

1. Al ingresar a la plataforma, debes ir a “BANDEJA DE ENTRADA”, donde encontrarás las comunicacionesde tus Profesores y también podrás redactar mensajes.
2. Al ingresar a la “Bandeja de entrada” verás todos los mensajes de tus materias.
3. Para redactar un mensaje hacé click en el ícono del lápiz

 

Para redactar un nuevo mensaje debes:

En la barra izquierda de tu Canvas, debes hacer click en Cursos.

 

Luego hacé click en Todos los Cursos
 

Por último buscá tus Inscripciones Pasadas y accede al contenido de tus materias.

Para ver cuál es tu Grupo y tus compañeros debes hacer click en el botón Grupos sobre la barra izquierda de tu SAM.

1-Dirigite hacia "Foros y luego a el grupo que corresponda en tu materia 
2-Luego dirigite hacia "Foros de Discusión"

 

3- Hacé click en + Foro de Discusión
 

4-Por último, escribí tu texto y presioná "Guardar"

#### Links de utilidad

Aula Virtual (CANVAS)

E-BOOK 21

Portal Estudiantes

Digital Admin

#### Canal de Contacto

Ante cualquier consulta relacionada a con posgrado comunicate con [posgrado@soysiglo.edu.ar](mailto:posgrado@soysiglo.edu.ar)$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/posgrado-presencial$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$oferta-academica$pea0$), null, 0, $pea0$ln-posgrado-virtual$pea0$,
        $pea0$POSGRADO VIRTUAL | La Nube 21$pea0$, $pea0$Es la modalidad concebida por la Universidad Siglo 21 para aquellos estudiantes que, por trabajo u otras circunstancias no disponen del tiempo para asistir a clases presenciales en forma regular.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/posgrado-virtual el 2026-11-08. Revisalo antes de publicar.

#### POSGRADO
Modalidad Virtual

Es la modalidad concebida por la Universidad Siglo 21 para aquellos estudiantes que, por trabajo u otras circunstancias no disponen del tiempo para asistir a clases presenciales en forma regular.

Toma las mejores prácticas de la educación a distancia y de la educación presencial, permitiendo a los alumnos estudiar la carrera elegida de manera VIRTUAL, con un sistema innovador, en el que los y las estudiantes comparten actividades grupales con otros compañeros de estudio.

Consultá los programas y planes de estudio de las Especializaciones y Maestrías vigentes, en nuestra página web oficial de la universidad Ingresando aquí

Curso Nivelatorio

Documentación y convenios

¿Cómo

curso?

Preguntas Frecuentes

¿Cómo apruebo?

Experiencias ampliadas

Calendario académico

#### ¿Cómo genero mis aranceles y me inscribo a mis materias?

#### Consulta el instructivo acá

#### Curso Nivelatorio

Algunos de los Programas de Posgrado que desarrolla la Universidad, ofrecen una instancia de Curso Nivelatorio como soporte para los alumnos con formación no relacionada al área disciplinar del posgrado elegido.

Duración: 1 bimestre

Cursado: Virtual a través del Aula Virtual (Canvas)

Los Posgrados que ofrecen esta instancia son:

- Maestría en Administración de Empresas
- Maestría en Administración de Negocios Y Aplicaciones Tecnológicas en la Empresa
- Maestría en Derecho Internacional
- Maestría en Inteligencia de Negocios y Explotación de Datos
- Especialización en Finanzas Corporativas y Mercado de Capitales

#### ¿Cómo apruebo el curso de nivelación?

El curso de Nivelación puede tener solamente dos estados al finalizar: LIBRE o APROBADO.

Para lograr la condición de APROBADO, deberás rendir un examen con 50% o más, lo que se traducirá en una nota de 7.

Si al rendir tu examen no alcanzas el 50%, la nota que obtendrás será 2.

Recordá que la nota final del curso de nivelación, NO se encuadra dentro de la tabla de calificaciones del Posgrado ni se cuenta en el promedio de tu carrera. Si al final de tu primer año, tenés aprobadas todas tus materias, el curso de nivelación se dará por aprobado

#### ¿Cómo curso mi posgrado?

El cursado es 100% Online. Se cursa a través del Aula Virtual (CANVAS) y el cronograma está compuesto por materias bimestrales y cuatrimestrales.

Durante el desarrollo del período de cursado, se podrá disponer de encuentros sincrónicos mediados por tecnologías y coordinados por un Profesor Experto de la materia, como apoyo cuando los docentes consideren oportuno para el proceso de aprendizaje, según la particularidad de cada materia y sus contenidos.

La asistencia a estos espacios es de carácter opcional, sin embargo, se recomienda participar en ellos con el objetivo de fortalecer tanto los contenidos abordados como los vínculos entre los estudiantes y el cuerpo docente.

#### ¿Cómo apruebo mis materias?

En tu posgrado tendrás una estructura de asignaturas, alguna de las cuales tienen un cursado Bimestral y otras un cursado Cuatrimestral.

#### Materias Programáticas (bimestrales)

Constan de 4 actividades prácticas llamadas AP. Para aprobar la materia debes aprobar obligatoriamente la AP 4 con una calificación igual o mayor al 50%, y, además, el promedio de las notas obtenidas en la AP 1, AP 2, AP 3 y AP 4 (todas las actividades) debe ser igual a 50% o más.

#### AP 1: Múltiple opción

- Es una Actividad de corrección automática e INDIVIDUAL.
- Posee 2 intentos dentro de la fecha de entrega estipulada. Ese segundo intento es el único RECUPERATORIO.

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

#### AP 2: Múltiple opción

- Es una Actividad de corrección automática e INDIVIDUAL.
- Posee 2 intentos dentro de la fecha de entrega estipulada. Ese segundo intento es el único RECUPERATORIO.

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

#### AP 3: a desarrollar

- Consiste en un trabajo grupal a desarrollar.
- Los grupos se arman de manera aleatoria en CANVAS, durante la segunda semana de cursado.
- NO posee recuperatorio.

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

#### AP 4: a desarrollar

- Es un trabajo en el que se integran los conocimientos desarrollados en la materia
- Tiene recuperatorio, en caso de:

-No llegar al promedio mínimo del 50% entre las 4 AP.

-No alcanzar la calificación mínima de la AP 4

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

#### Materias de Proceso (cuatrimestrales)

Constan de 4 actividades prácticas llamadas AP. Para aprobar la materia debes aprobar obligatoriamente la AP 4 con una calificación igual o mayor al 50%, y, además, el promedio de las notas obtenidas en la AP 1, AP 2, AP 3 y AP 4 (todas las actividades) debe ser igual a 50% o más.

#### AP 1: A desarrollar

- Consiste en un trabajo Individual a desarrollar.
- No posee recuperatorio

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

#### AP 2: A desarrollar

- Consiste en un trabajo Individual a desarrollar, donde se continua con la AP 1
- No posee recuperatorio

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

- Consiste en un trabajo Individual a desarrollar, donde se continua con la AP2
- NO posee recuperatorio.

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

- Consiste en un trabajo Individual a desarrollar, donde se da cierre a lo trabajado en la AP1, AP2 y AP3
- Tiene recuperatorio, en caso de no llegar a la calificación mínima de la AP 4

Se aprueba con nota 4 que es el equivalente al 50% del trabajo desarrollado correctamente.

#### Notas: Escala aritmética

#### Actividad de formación práctica

La actividad de formación práctica, brinda un espacio de integración y aplicación de los contenidos, modelos y herramientas desarrollados en el transcurso del cursado.

En esta materia vas a trabajar sobre un caso o situación real en la que, a partir de la aplicación de herramientas de diagnóstico propias de la disciplina desarrolladas en base a los conocimientos previamente adquiridos en el cursado de la carrera, buscarás detectar una situación problemática u oportunidad de mejora teniendo como objetivo plantear una propuesta superadora a aplicar al caso en función del diagnóstico realizado.

#### Objetivo General

​Desarrollar una visión sistémica de un caso o situación real, aplicando de manera integral los conocimientos previos, para la toma de decisiones y elaboración de propuestas de mejora.

#### Objetivos Específicos

Realizar un diagnóstico sobre un caso o situación problemática real

Aplicar conceptos teóricos y metodológicos desarrollados previamente en la carrera para el análisis de la situación. Generar una propuesta de intervención sobre la realidad que implique una mejora sustancial en la situación relevada.

#### ¿Cómo se cursa?

La materia es cuatrimestral y deberás desarrollar un trabajo practico integral referido al caso o situación real que estés analizando de acuerdo a las consignas que te brinde el profesor. Tendrás que cumplir con tres entregas parciales del trabajo, en fecha pre establecida y a través de la plataforma CANVAS, que evidencien el grado de avance en el proceso de análisis y elaboración; y una entrega final en la que se reflejará el diagnóstico de situación y la propuesta de mejora o solución planteada ya finalizada.

Cada una de las entregas se considera una actividad práctica (AP) en si misma, aunque sean parte de un solo trabajo.

#### ¿Cómo se aprueba?

Para aprobar la materia debes aprobar obligatoriamente la AP 4 con una calificación igual o mayor al 50%, y, además, el promedio de las notas obtenidas en la AP 1, AP 2, AP 3 y AP 4 (todas las actividades) debe ser igual a 50% o más.

Las 4 entregas o AP son a desarrollar y de carácter INDIVIDUAL.

#### ¿Qué documentos debo presentar?

Para poder dar inicio a tu actividad de formación práctica, es necesario que la organización sobre la que vas a realizar tu estudio de caso, haya suscrito con la Universidad Siglo 21 un convenio marco de actividades académicas, y que vos como alumno firmes una carta compromiso sobre preservación de la confidencialidad en uso de los datos

#### Taller de metodología para trabajo final

A los fines de la graduación como Especialista o Magisters, al finalizar el cursado de todo el Plan de estudio, cada estudiante presentará un trabajo final individual por escrito siendo necesario que presente previamente un proyecto –cuyas líneas de temática serán brindada según carrera- a la dirección.

A ese fin, el Taller de Metodología para el Trabajo Final cobra relevancia, ya que tiene por objeto la capacitación y el apoyo metodológico para entrenar a los participantes de la carrera en el diseño y presentación de dicho proyecto.

Introducir a futuros especialistas y magisters, en el campo de la investigación y capacitarlos en el diseño y presentación de un proyecto de trabajo final en temas propios del área.

Reflexionar sobre el rol y la significación de la investigación en las organizaciones.

Analizar los componentes del proceso de investigación científica.

Comprender la importancia de la selección y presentación del marco teórico como fundamento del trabajo final a realizar.

Guiar para la presentación de un proyecto de trabajo final (investigación, innovación, intervención profesional) en la metodología general.

Desarrollar habilidad para la argumentación y la expresión escrita bajo las normas APA.

Para aprobar la materia debes aprobar obligatoriamente la AP 4 con una calificación igual o mayor a 4 que es el equivalente al 50%, y, además, el promedio de las notas obtenidas en la AP 1, AP 2, AP 3 y AP 4 (todas las actividades) debe ser igual a 50% o más.

Las 4 AP son a desarrollar y de carácter INDIVIDUAL. Solo la AP 4 tiene posibilidad de recuperatorio.

#### Calendario académico y cronograma de cursado

Conocé cuáles son las fechas de vencimiento de tus actividades.

Descarga el Calendario en PDF

#### Consulta las materias habilitadas para cada período

Ahora tus encuentros virtuales los agenda y coordina el docente de cada materia. Revisa tu mensajería en la plataforma para mantenerte en contacto con el profesor y conocer los detalles de los encuentros

Conocé las materias que se habilitan en cada periodo, ingresando al siguiente link

Consultá las materias habilitadas

#### 1

Elegí la carrera que estás cursando.

#### 2

Elegí tu cohorte de ingreso, es decir el periodo en el que comenzaste a cursar.

#### 3

Bajá con el cursor y revisá las materias habilitadas para cada periodo.

#### Documentación y convenios

#### ¿Qué documentación debo presentar para mi legajo?

- Ficha de inscripción, [descárgala acá](https://contenidos.21.edu.ar/_autogestion/inscripcion/fdi/ficha-de-inscripcion.pdf).
- Fotocopia de DNI (Frente y dorso).
- Fotocopia legalizada del Título de Grado.
- CV actualizado.
- 2 fotos tipo carnet.
- Carta de aceptación del reglamento [descárgala acá](https://contenidos.21.edu.ar/_autogestion/inscripcion/reglamento/carta-de-aceptacion-reglamento.pdf).
- Completar y/o suscribir todo otro formulario o documentación adicional que se requiera, en virtud de los procedimientos administrativos vigentes al momento de la solicitud de admisión.
- Fotocopia legalizada del título de grado o admisión excepcional art 39 Bis ley de educación superior.

#### Documentación Específica por Programas de Posgrados y Ciclos de Complementación

#### Maestría en Administración de Empresas

#### Maestría en Administración de Negocios y Aplicaciones Tecnológicas en la Empresa

#### Maestría En Criminología Y Ciencias Forenses

#### Maestría en Derecho Internacional

#### Maestría en Derecho Procesal

#### Maestría en Innovación Educativa

#### Especialización en Contabilidad y Auditoría

#### Especialización en Derecho de Familia, Niñez y Adolescencia

#### Especialización en Finanzas Corporativas y Mercado de Capitales

#### Especialización en Gestión y Gobierno de Empresas Familiares

#### Especialización en Logística y Cadena de Suministro

#### Especialización en Marketing y Dirección Comercial

#### Especialización en Negocios Internacionales

#### ¡Si sos extranjero!

- Se requiere presentar:

DNI o Pasaporte + Título de grado emitido por la Universidad de origen.

La normativa general establece que, para cursar una carrera de posgrado en la República Argentina, quienes posean un título de grado obtenido en el extranjero deberán convalidarlo o revalidarlo (según corresponda), conforme a la normativa vigente al momento de realizar el trámite.

No obstante, según lo dispuesto por la Resolución Ministerial N.º 416/00, las universidades podrán reconocer títulos de grado obtenidos en el extranjero exclusivamente a los efectos de la prosecución de estudios de posgrado en la República Argentina, siempre que el programa no requiera el ejercicio profesional.

#### ¿Dónde presento la documentación?

Para cargar tu documentación de legajo de manera digital y autogestiva deberás utilizar la plataforma Digital Admin.

Ingresá a Digital Admin

Utilizá las flechas y conocé el paso a paso para cargar tu documentación de legajo

#### 1- Creá tu cuenta

#### Ingresar a Digital Admin y creá tu cuenta de usuario completando todos los campos de la derecha.

Ingresá a Digital Admin

En caso de que tengas un usuario y no recuerdes la contraseña, podrás clickear en “Olvidé mi contraseña” y recibirás un acceso al correo electrónico asociado para poder reestablecerla.

#### Experiencias Ampliadas

Las Experiencias Ampliadas son propuestas académicas internacionales que complementan y potencian tu posgrado en Universidad Siglo 21.

Están pensadas para que puedas profundizar tu formación en áreas estratégicas, vivir una experiencia educativa en entornos globales y sumar certificaciones internacionales, sin modificar tu plan de estudios ni extender la duración de tu programa.

Son oportunidades para expandir tu mirada profesional, conectar con estudiantes y docentes de distintos países y llevar tu perfil académico a un nivel superior.

#### Babson Buil

Programa académico intensivo de una semana en Babson College (EE. UU.), la universidad líder mundial en emprendimiento

Además del posgrado que estás cursando en Siglo 21, hoy podés sumar una experiencia internacional que te permite focalizar tu formación en emprendimiento e innovación, sin cambiar de programa ni extender su duración.

Para muchos estudiantes, Babson Build funciona como una especialización práctica integrada a su MBA o maestría, dictada por el referente global en educación emprendedora.

Durante una semana intensiva se trabaja sobre:

- Pensamiento emprendedor.
- Modelos de negocioInnovación.
- Marketing emprendedor.
- Toma de decisiones en contextos de incertidumbre.
- Escalamiento de negocios.​

El programa culmina con un pitch final al estilo Shark Tank, donde equipos internacionales presentan sus proyectos ante un jurado académico, poniendo en práctica las metodologías y herramientas trabajadas durante la semana.

La experiencia incluye:

Formación académica:

- Clases presenciales con profesores de Babson.
- Materiales académicos y casos.
- Proyecto grupal internacional + pitch final.
- Certificado y badge oficial.

Experiencia residencial:

- Alojamiento compartido en residencias.
- Ropa de cama y servicios incluidos.
- Acceso a instalaciones del campus (biblioteca, espacios académicos, gym con tarifa reducida).

Alimentación:

- 3 comidas por día (lunes a viernes).
- Eventos académicos con comidas incluidas.

Logística:

- Traslado grupal aeropuerto-programa.
- Transporte grupal a Boston.

Acceso posterior:

- Plataforma académica (Canvas) por 6 meses.

Requisitos:

- Estar cursando un Posgrado virtual o presencial
- Experiencia laboral de mas de 2 años.
- Nivel avanzado de Inglés.
- Visa vigente al momento del programa.

Inversión del programa: USD 2.340

Este valor es posible porque Universidad Siglo 21 es miembro de Babson Collaborative for Entrepreneurship Education, una red académica de 44 universidades en 31 países seleccionadas por su compromiso con la educación emprendedora. Formar parte de esta red permite ofrecer condiciones preferenciales y acceso directo a programas de altísimo prestigio internacional.

#### CEREM | Global Business School

Global Business Immersion (GBI) – Madrid

Viví una semana de inmersión internacional que impulsa tu desarrollo profesional y te conecta con líderes influyentes del ecosistema empresarial europeo e iberoamericano.

La Global Business Immersion es un programa vivencial de alto impacto que combina formación, networking y acceso directo a empresas e instituciones referentes de España y Europa. Está orientada a profesionales que buscan comprender tendencias emergentes y adquirir herramientas clave en un entorno global.

¿Qué ofrece la experiencia?

4 ejes centrales

- Liderazgo
- Negocios globales
- Emprendimiento e innovación
- Tecnología

Actividades destacadas

Conferencias con expertos internacionales

- Visitas a empresas líderes
- Casos prácticos sobre desafíos reales
- Networking estratégico con directivos, emprendedores y profesionales de múltiples países

Un entorno único para conectar

La GBI te permite interactuar con referentes del ecosistema europeo, participar en mesas de debate y construir una red global que potencia tu carrera y amplía tus oportunidades profesionales.

GBI en cifras

- 12 ediciones
- 45+ speakers internacionales
- 30+ empresas visitadas
- (Iberdrola, Telefónica, Santander, Naturgy, entre otras)
- 30+ casos de negocio analizados
- 1.400+ profesionales de 19 países
- 100% recomiendan la experiencia

#### Trabajo Final de posgrado

### Trabajo final Maestrías

3 min de lectura

### Trabajo Final Especializaciones

2 min de lectura

#### Preguntas Frecuentes

POSGRADO

La siguiente es la tabla de conversión utilizada para trasladar los puntos que se obtienen en las Actividades Prácticas, a una nota para el acta que forma parte de su analítico e historial académico. Podrán visualizar las mismas en tu Portal de Estudiantes.

Mesa de atención
Edificio Escuela de negocios. Calle de los Latinos N°8555, B° Los Boulevares, CP. 5008. Córdoba.

Correo Posgrado
posgrado@soysiglo.edu.ar

Ingresá en el botón Cuenta de tu SAM y luego en Configuraciones
 

Hacé Click en +Dirección de correo electrónico
 

Completá tu correo y hacé Click en registrar correo electrónico
 

Si lo deseas, también podes registrar tu número de teléfono para recibir SMS.

Ingresá al botón Notificaciones incluido en tu cuenta y ACTIVA las notificaciones que te interesen recibir ALERTAS

1. Al ingresar a la plataforma, debes ir a “Tablero”, donde encontrarás cargadas las materias que estas
cursando.
2. Seleccionas la materia en la que trabajaras, haciendo clic en el nombre de la misma
3. Una vez que ingresas verás la página de inicio. Ingresar a CALIFICACIONES.
4. Clic en Actividad Práctica 1 (TP1) para ver los detalles de tu entrega.

 
5. Se abre la siguiente pantalla. Hacer clic en VER COMENTARIOS.

 
6. Allí podrás ver tu entrega y en caso que el profesor haya resaltado o dejado comentarios, podrás leerlos.

1. Al ingresar a la plataforma, debes ir a “Tablero”, donde encontrarás cargadas las materias que estas
cursando.
2. Seleccionas la materia en la que trabajaras, haciendo click en el nombre de la misma
3. Una vez que ingresas verás la página de inicio

 
4. En la siguiente pestaña verás el contenido del PRIMER MÓDULO de tu materia:

1. Al ingresar a la plataforma, debes ir a “BANDEJA DE ENTRADA”, donde encontrarás las comunicacionesde tus Profesores y también podrás redactar mensajes.
2. Al ingresar a la “Bandeja de entrada” verás todos los mensajes de tus materias.
3. Para redactar un mensaje hacé click en el ícono del lápiz

 

Para redactar un nuevo mensaje debes:

En la barra izquierda de tu Canvas, debes hacer click en Cursos.

 

Luego hacé click en Todos los Cursos
 

Por último buscá tus Inscripciones Pasadas y accede al contenido de tus materias.

Para ver cuál es tu Grupo y tus compañeros debes hacer click en el botón Grupos sobre la barra izquierda de tu SAM.

1-Dirigite hacia "Foros y luego a el grupo que corresponda en tu materia 
2-Luego dirigite hacia "Foros de Discusión"

 

3- Hacé click en + Foro de Discusión
 

4-Por último, escribí tu texto y presioná "Guardar"

#### Links de utilidad

Aula Virtual (CANVAS)

E-BOOK 21

Portal Estudiantes

Digital Admin

#### Canal de Contacto

Ante cualquier consulta relacionada a con posgrado comunicate con [posgrado@soysiglo.edu.ar](mailto:posgrado@soysiglo.edu.ar)$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/posgrado-virtual$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$oferta-academica$pea0$), null, 0, $pea0$ln-practica-profesional$pea0$,
        $pea0$PRÁCTICA PROFESIONAL | La Nube 21$pea0$, $pea0$La Práctica Profesional (PP) es una materia en la que vas a integrar, de manera práctica, los conocimientos adquiridos a lo largo de tu Carrera. A través de una experiencia formativa real, podrás a…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/practica-profesional el 2026-11-08. Revisalo antes de publicar.

#### Práctica Profesional

La Práctica Profesional (PP) es una materia en la que vas a integrar, de manera práctica, los conocimientos adquiridos a lo largo de tu Carrera. A través de una experiencia formativa real, podrás aprender, analizar y valorar el entorno profesional propio de tu disciplina.

#### Generalidades de la Práctica Profesional

¿Qué es la

Práctica Profesional?​

Estructura del Cursado

Plataforma

SOY SIGLO​

¿Dónde realizo mi Práctica Profesional?

¿Cuento con un Seguro?

Selección de talento​

Preguntas Frecuentes

#### Validá tus correlativas antes de empezar tu cursado

Para poder cursar esta materia, es necesario que sus correlativas se encuentren en condición Regular o Aprobada.

Si al finalizar el cursado aún no aprobaste las correlativas requeridas, la materia permanecerá en estado Regular por un plazo máximo de 18 meses. Durante ese período tendrás la oportunidad de completar y aprobar las materias pendientes.

Transcurrido ese plazo sin haber aprobado las correlativas, la materia pasará a estado Libre y será necesario recursarla.

Si querés consultar cuáles son las correlativas de esta materia, ingresá a tu Portal de Estudiantes, accedé al Historial Académico de tu legajo y revisá el Plan de Estudio. Allí encontrarás la opción Correlativas, donde podrás ver el detalle correspondiente.

#### ¿Qué es la Práctica Profesional?

Es una materia de proceso que deben cursar todos los estudiantes de grado, independientemente de la carrera, ya que forma parte del trayecto obligatorio de formación académica.

¿Qué aportes formativos brindará a tu Perfil Profesional?

1. Vinculación profesional:

Te permitirá tener un contacto directo con el ámbito laboral, facilitando la comprensión de las dinámicas y exigencias reales del sector, y fomentando la creación de redes profesionales.

2. Experiencia práctica:

Te ofrecerá la oportunidad de aplicar los conocimientos teóricos en situaciones reales, fortaleciendo tus habilidades técnicas y tu capacidad para enfrentar desafíos laborales concretos.

3. Formación integral:

Desarrollarás competencias clave que son fundamentales para una adecuada empleabilidad y desempeño profesional.

4. Acceso a oportunidades laborales:

Te abrirá la puerta para un primer acercamiento al mercado profesional, facilitando la exploración de diferentes roles y el inicio de tu carrera en el área elegida.

#### Estructura del cursado ​​

La asignatura se compone de dos instancias obligatorias que garantizan una formación integral: instancia académica e instancia organizacional.

INSTANCIA

ACADÉMICA

Ingresá acá

INSTANCIA ORGANIZACIONAL

Ingresá acá

#### Instancia Académica

Dependiendo de tu modalidad de cursado, participarás de encuentros presenciales o virtuales con tu docente. Además, deberás acceder al Aula Virtual (CANVAS), donde encontrarás el material de estudio y podrás comunicarte con tu docente durante todo el semestre.

Modalidad Presencial (P) y Presencial Home (PH)

- Participarás de encuentros presenciales con tu docente, en el día y horario correspondiente a tu comisión.
- De acuerdo con lo dispuesto por el docente, podrán realizarse encuentros virtuales complementarios.

Modalidad Educación a Distancia (ED) y Educación Distribuida Home (EDH)

- Tendrás contacto permanente con tu docente a través de la mensajería interna de CANVAS.
- Podrán organizarse encuentros virtuales según la planificación de la cátedra.​

​ Recordá comunicarte con tu docente de Práctica Profesional desde el primer día de cursado y mantener el contacto durante todo el cuatrimestre a través de la mensajería del Aula Virtual (CANVAS).

Requisitos de aprobación

Requisitos académicos de aprobación

Cursado Cuatrimestral

#### PRESENCIAL

¿Cómo se aprueba?

- Tener aprobados 3 TPs con nota de 5 o más, siendo obligatorio aprobar el TP4.

- 75% de asistencia a clases presenciales.

- Correlativas aprobadas.

La nota final es el promedio de los 4 TPs de la materia.​

Si al finalizar el cursado, las correlativas previas no están aprobadas, la materia queda en estado REGULAR por un plazo máximo de 18 (dieciocho) meses. Si en dicho plazo no aprobas tus correlativas, la materia queda en estado LIBRE, y debes recursarla.

Cursado Cuatrimestral

#### DISTANCIA

¿Cómo se aprueba?

- Tener aprobados 3 TPs con nota de 5 o más, siendo obligatorio aprobar el TP4.

​​​​

- Correlativas aprobadas.

La nota final es el promedio de los 4 TPs de la materia.​

Si al finalizar el cursado, las correlativas previas no están aprobadas, la materia queda en estado REGULAR por un plazo máximo de 18 (dieciocho) meses. Si en dicho plazo no aprobas tus correlativas, la materia queda en estado LIBRE, y debes recursarla.

Cursado Cuatrimestral

#### PRESENCIAL HOME

¿Cómo se aprueba?

- Tener aprobados 3 TPs con nota de 5 o más, siendo obligatorio aprobar el TP4.

- 75% de asistencia a clases presenciales.

​​​​

- Correlativas aprobadas.

La nota final es el promedio de los 4 TPs de la materia.​

Si al finalizar el cursado, las correlativas previas no están aprobadas, la materia queda en estado REGULAR por un plazo máximo de 18 (dieciocho) meses. Si en dicho plazo no aprobas tus correlativas, la materia queda en estado LIBRE, y debes recursarla.

#### Calendario de entregas

La entrega de los trabajos prácticos es obligatoria y debe realizarse en las fechas establecidas en el calendario académico.

#### 2° Semestre

#### Trabajo Práctico 1

#### Trabajo Práctico 2

#### Trabajo Práctico 3

#### Trabajo Práctico 4

#### Todas las modalidades

#### 6° Semana

#### 07/09/2026

#### 9° Semana

#### 28/09/2026

#### 12° Semana

#### 19/10/2026

#### 15° Semana

#### 09/11/2026

Además de cumplir con los requisitos académicos previstos para la aprobación de la materia, según tu modalidad de cursado, deberás completar 250 horas de práctica en la organización asignada, respetando un máximo de entre 20 y 25 horas semanales.

Para acreditar las horas realizadas, será necesario presentar la Planilla de Asistencia, completada y firmada por tu tutor/a organizacional.

Asimismo, la organización deberá validar tu desempeño mediante la Evaluación de Desempeño, la cual deberá estar firmada y contar con una calificación mínima de 7 (siete).

Recordá que ambos documentos deberán adjuntarse junto con el Trabajo Práctico 4 a través de tu Aula Virtual (CANVAS).

Te recomendamos verificar con anticipación que la documentación esté completa y correctamente firmada para evitar demoras en la evaluación de tu práctica.

#### Instancia Organizacional

Si pertenecés a una carrera del Decanato de Ciencias de la Salud, no debés ingresar a la plataforma para gestionar tu vinculación. Debés comunicarte exclusivamente con tu Coordinador/a de Práctica y contactar también a tu docente para recibir las indicaciones correspondientes.

Información Importante

Fecha límite para solicitar o proponer organización periodo 2A/26

​​Fecha límite para solicitar organización: hasta el 07/08/2026

Fecha límite para proponer organización: hasta el 24/08/2026

Fecha límite para aplicar incompatibilidad: hasta el 24/08/2026

Plataforma SOY SIGLO

El proceso de asignación y vinculación con la organización donde realizarás tu Práctica Profesional se gestiona a través de la plataforma SOY SIGLO.

Podrás acceder a la plataforma dentro de las 24 a 48 horas hábiles posteriores a la inscripción en la materia.

El ingreso se realiza directamente con tu correo institucional @soysiglo.21.edu.ar y tu contraseña habitual.

La cuenta se habilita automáticamente con tu inscripción, por lo que no es necesario que te registres en la plataforma.

Si al intentar ingresar visualizás un mensaje de error, te recomendamos acceder desde una ventana de navegación privada o modo incógnito, ya que algunos navegadores pueden generar conflictos de sesión.

Accedé a la plataforma acá

¿Dónde realizo mi Práctica Profesional?

La vinculación entre el estudiante y la organización puede gestionarse de dos maneras, ambas exclusivamente a través de SOY SIGLO.

Información Importante

Antes de iniciar el proceso, debes completar uno de los formularios disponibles ingresando en Práctica Profesional/Solidaria > Agregar nueva experiencia. La elección del formulario dependerá de la modalidad de vinculación que corresponda a tu caso.

Las oportunidades publicadas en "Empresas que buscan tu talento" pertenecen exclusivamente al Portal de Empleo de la Universidad y no forman parte del proceso de asignación de la Práctica Profesional ni de la Práctica Solidaria.

Proponer una organización

Si tu intención es proponer una organización donde realizar tu Práctica Profesional, antes debes revisar que cumpla con los siguientes requisitos:

- La organización o profesional independiente deben darte el consentimiento para proponerlos ante la Universidad y brindarte los datos necesarios para completar el formulario correspondiente.

- Deberá ser una organización, pública o privada, o un profesional independiente registrados en ARCA u organismo equivalente en caso de que propongas una organización extranjera.

- Dentro de la organización, debe haber una persona que sea tu tutor. El mismo debe tener experiencia en la carrera que estás cursando y título de grado.

- Si sos estudiante de Abogacía, Contador Público, Lic. en Informática y Lic. En Psicología, tu tutor además debe ser egresado de la misma carrera, sin excepción.

- Deben brindarte un espacio y los materiales necesarios para que desarrolles tus prácticas y garantizar que realices tareas vinculadas a la formación que estás cursando.

- Podrás proponer la organización en la que te encuentres trabajando actualmente, siempre que esta cumpla con los requisitos establecidos y que la práctica se desarrolle en un área distinta a aquella en la que desempeñas tus funciones habituales.

- Podrás proponer una organización familiar o propia siempre y cuando, además de cumplir los requisitos mencionados anteriormente, presenten un tutor que no sea familiar directo y/o subordinado.

¿Qué datos necesitas para proponer una organización o profesional independiente?

Debes enviar la propuesta a través del formulario “Quiero proponer una organización (Práctica Profesional)” con la siguiente información:

Datos de la organización o profesional independiente:

- Razón social o nombre del profesional
- Nombre de fantasía
- CUIT (org. Nacionales) o Número de registro (org. Extranjera)
- Tipo de personería jurídica
- País, provincia y localidad del domicilio legal y, si corresponde, de la sucursal
- Actividad principal/rubro
- Cantidad de empleados
- Documentación obligatoria: constancia de inscripción en ARCA u organismo extranjero equivalente, actualizada a la fecha de carga

Datos del tutor:

- Nombre y apellido
- DNI
- Máxima formación alcanzada y título obtenido
- Cargo que desempeña dentro de la organización
- Correo electrónico (institucional o personal)
- Teléfono celular
- País, Provincia y localidad del domicilio laboral (puede coincidir o no con el domicilio legal de la organización)
- Documentación obligatoria: Únicamente estudiantes de Abogacía, Contador Público y Lic. en Informática, deben adjuntar copia legible del título del tutor

Si la propuesta es aprobada o rechazada recibirás un correo electrónico, pero debes ingresar proactivamente a la plataforma a verificar el estado de tu formulario. Si visualizas el estado “Pendiente de aprobación”, debes ingresar desde la opción “Revisar” y corroborar si, en el listado de aprobadores, el rol "ninguno seleccionado; miembro personal" figura aprobada significa que la Universidad aprobó tu propuesta y podés comenzar tu práctica.

En caso de rechazo, se detallará el motivo dentro del formulario y desde la opción “Editar” podrás:

- Corregir el formulario y enviarlo nuevamente para su validación
- Actualizar los datos con una nueva propuesta y enviarla para su validación
- Completar el formulario "Solicito que la Universidad me asigne una organización" y aguardar una asignación

Causas de rechazo de la organización:

​​

- El/la tutor/a solo tiene título de secundario y no posee formación de grado.
- El estudiante de Abogacía, Contador Público, Lic. en Psicología o Lic. en Informática presentó como tutor a un profesional que no posee título de Abogado, Contador Público o Lic. en Psicología respectivamente. En el caso del estudiante de Lic. en Informática NO haya presentado un tutor que sea Lic. en Informática o Ingeniero en Sistemas.
- El/la tutor/a de la carrera de Contador Público, Abogacía, Lic. En Psicología y Lic. en Informática no adjuntó el título de grado de su formación.
- El profesional independiente o la Organización no se encuentran registrados en ARCA.
- El/la tutor/a es familiar directo y/o subordinado del estudiante.

Si ya tenés una organización donde realizar tu práctica, en este video te mostramos cómo cargar sus datos y proponerla para su evaluación por parte de la universidad.

Si la Organización presenta inconvenientes con la aceptación en la plataforma SOY SIGLO, deberán enviarle el siguiente instructivo. Este instructivo es de uso exclusivo para Organizaciones y no para estudiantes.

ingresa acá

Solicitar que la Universidad me asigne una organización

Deberás completar el formulario "Solicito que la Universidad me asigne una organización" disponible en la plataforma SOY SIGLO.

Contás con un plazo de 7 días para completarlo. Si, una vez asignada la organización, no te comunicás con tu tutor dentro de ese período, la asignación se cancelará automáticamente.

Importante: este formulario debe completarse una única vez.

Tené en cuenta que la asignación no es inmediata, debes ingresar proactivamente a tu solicitud desde el botón “Revisar” para corroborar el estado. Tu solicitud siempre tendrá estado “APROBADO”, pero una vez asignada, se cargarán los datos de la organización y los datos de contacto del tutor.

La distancia entre el domicilio particular y la Organización no es motivo de rechazo si se encuentran dentro de la misma localidad de residencia.

El estudiante es responsable de iniciar el primer contacto con el tutor de la Organización para coordinar el inicio de la práctica.  Para ello, dispone de un plazo de 7 días. Si transcurrido ese plazo no se ha comunicado con su tutor, la asignación será cancelada automáticamente.

Si todavía no contás con una organización para realizar tu práctica, en este video te explicamos cómo completar el formulario para solicitar que la universidad te asigne una.

Incompatibilidad de Concurrencia: Casos y Requisitos

Los casos aceptados como incompatibilidad de concurrencia son los indicados en el reglamento y consisten en estos casos:

CASO A: Deben cumplir con las dos condiciones obligatoriamente.

Condición 1: El/la estudiante desarrolla de manera habitual y cotidiana tareas propias de la profesión vinculada a la carrera que cursa, en el marco de su empleo actual.

Ejemplo: personas que trabajan en el Poder Judicial y estudian Abogacía.

Condición 2: El/la estudiante tiene prohibido por ley realizar tareas profesionales fuera de su ámbito laboral, según lo establece la normativa vigente.

Ejemplo: lo establecido en la Ley Orgánica del Poder Judicial correspondiente.

CASO B: alumnos privados de la libertad.

De manera excepcional, los estudiantes que acrediten una situación de incompatibilidad de concurrencia a la organización no deberán asistir presencialmente. Para ello, deberán presentar la documentación respaldatoria que justifique la situación.

En estos casos, cada docente asignará al estudiante tareas propias de la profesión, desarrolladas de manera simulada, con el objetivo de garantizar el aprendizaje de nuevas instancias.

- Estas tareas deberán equivaler a 250 horas, según lo establecido en la Resolución 3810/2020.
- Su aprobación será requisito obligatorio, junto con la aprobación de los Trabajos Prácticos del Aula Virtual (Canvas).
- El docente enviará las tareas a través de mensajería en el Aula Virtual.

​​

¿Qué sucede si se aprueba tu incompatibilidad?

​​

- El docente recibe el listado de alumnos con esta condición. Desde la Coordinación de Práctica Profesional, se analiza y aprueba (o no), los documentos cargados; además de ello deberás mantenerte en contacto con el docente vía mensajería del Aula Virtual (CANVAS) para comentarle tu situación de aprobación y seguir sus indicaciones.

- Recibirás un correo electrónico además de ver el estado en la plataforma. El Coordinador Académico junto al docente te asignarán tareas simuladas, propias de la profesión, equivalentes a 250 horas, cuya aprobación es obligatoria, además de los 4 TPs obligatorios de CANVAS.

- No es necesario que completes convenios en este caso, ya que no estas vinculando/a con ninguna organización.

- Tené en cuenta que, en esta modalidad, no habrá planilla de asistencia, ni de evaluación de desempeño de la organización a presentar.

Información Importante

La carga de la incompatibilidad no implica la aprobación automática.

En este video te explicamos cómo completar el formulario de incompatibilidad en la plataforma SOY SIGLO, y qué información debés presentar, según tu caso.

#### Seguro

Información Importante

Todos los estudiantes inscriptos en la materia Práctica Profesional están asegurados durante el período en que realizan sus prácticas

Contás con cobertura de seguro desde el primer día de clases del período en que cursás la materia. No debés presentarte en la organización antes de esa fecha.

No es necesario realizar ningún trámite para activarlo, ya que se gestiona automáticamente.

Si necesitás solicitar la póliza, completá el siguiente formulario:

Completá el formulario acá

¿Qué debo hacer en caso de Accidente?

En caso de accidente deberás recurrir al Establecimiento Sanitario y/o Profesional Médico más cercano y/o cualquiera de tu elección.

Luego de una primer atención, ya seas vos o algún responsable, se deberá cumplimentar con un REPORTE DE ACCIDENTE

en el plazo de 72hs de ocurrido el accidente complétalo acá:

Reporte de accidente

La Universidad cuenta con un Seguro que contempla cobertura de gastos médicos y/o farmacéuticos, POR REEMBOLSO, por lo que en caso de que no poseas Obra Social y/o Medicina Prepaga o bien elijas un Establecimiento en forma particular, y debas efectuar alguna erogación económica, RECORDÁ solicitar comprobantes de gastos: FACTURA, RECIBOS, TICKETS, etc; como así también la documentación médica asociada (RP, Estudios, Análisis, Historia Clínica, etc).

Solicitud de Reintegro o Indemnización

Recordá que contás con la posibilidad de comunicarte en forma permanente con ADDER (Administración de Riesgos y Seguros) a través de [siniestros@adder.com.ar](mailto:siniestros@adder.com.ar) o al teléfono móvil +54-9-351-5-053-837 a fin de consultar cualquier tema referente a Denuncias de Accidentes, Seguimientos, etc.

#### Disposiciones para Casos Particulares

Estudiantes con Discapacidad

Trabajamos en conjunto con el Centro de Sustentabilidad de la Universidad y nuestra Asesora Especializada en Accesibilidad e Inclusión Académica, para abordar las particularidades de cada caso y lograr una buena experiencia en el desarrollo de tu práctica profesional.

Por cualquier consulta/inquietud contáctate al centro de atención al alumno de la Universidad para comentarnos tu situación.

Estudiantes radicados en el extranjero

Si te encontrás en el exterior de igual modo deberás realizar tu práctica profesional en una organización.

En este caso deberás buscar una empresa u organización en el lugar que residas que cumpla con los requisitos solicitados para poder avanzar con tu instancia organizacional.

En el caso de prácticas a realizarse en organizaciones extranjeras, estas deberán aceptar expresamente que el estudiante:

• No contará con seguro de vida otorgado por la Universidad.

• Se someterá a lo dispuesto en la cláusula octava del convenio, relativa a Jurisdicción y Competencia, la cual no admite modificaciones.

En caso de que el estudiante no proponga una organización, la Universidad procederá a asignar una, teniendo en cuenta el país de residencia, el cual deberá ser consignado en el formulario correspondiente.

Los estudiantes de las carreras de Abogacía, Contador Público deberán realizar la práctica de manera presencial.

La presentación de los Trabajos Prácticos y de la documentación requerida es obligatoria y deberá realizarse conforme a lo establecido en el calendario académico vigente.

#### Documentación

Convenio de Actividades Académicas

El Convenio de Actividades Académicas (Marco y Anexo) es el documento que formaliza la instancia organizacional de la Práctica Profesional. Ambos documentos son gestionados de manera digital por la organización a través de la plataforma Talent21.

Pueden visualizarse desde el perfil de la organización, cuando el estudiante ya se encuentra asignado a una organización (en caso de solicitar una) o cuando la Universidad y la Organización aprobaron la propuesta del estudiante (en caso de proponer una organización). Para ello, es requisito obligatorio que las organizaciones estén registradas en SOY SIGLO.

El estudiante no debe realizar ninguna gestión vinculada a los convenios.

En casos de incompatibilidad de concurrencia aprobados, no se gestionarán convenios ya que no existe vínculo con una organización.

¿Cómo puedo visualizar mi convenio?

CONVENIO ANEXO

Es el vínculo entre la Universidad, Organización y Estudiante.El convenio se puede visualizar dentro del formulario cargado por el estudiante (una vez sea asignado en caso de solicitar una organización o en caso de que la universidad le haya aprobado su propuesta).

Para poder visualizarlo, debes ingresar al formulario cargado haciendo clic en el botón “REVISAR”. Una vez dentro del formulario, dirígete hasta el final de la página, donde encontrarás el apartado “Convenio Anexo”.

Debajo aparecerá la palabra “aquí”; al hacer clic allí, se abrirá el PDF correspondiente.

CONVENIO MARCO

Es el vínculo entre la Universidad y la Organización

El convenio lo puede visualizar el tutor de la organización dentro de la plataforma.

Información Importante

A partir del período 1/26, no se recibirá documentación en formato PDF ni con firma física.

Evaluación de Desempeño

Recordá que las evaluaciones de desempeño las estaremos enviando al Tutor de la organización donde cursaste la materia, directamente al mail que dejo asentado de contacto. En caso de no haberla recibido correctamente la podrás descargar de este apartado teniendo en cuenta que debe ser el archivo correspondiente a tu carrera para que la organización pueda completarla efectiva, en caso contrario no podremos evaluar tu desarrollo en la instancia organizacional.

- Ingresá en el link disponible abajo.
- Busca entre los archivos el nombre de tu carrera.
- Descargá la Evaluación de Desempeño.

A continuación, encontrarás el listado de Carreras. Solo tenés que identificar la tuya y hacer clic en el enlace para descargar el archivo correspondiente con la evaluación de desempeño.

Planilla de asistencia

A través de esta planilla se llevará el control de tu asistencia a las 250 h en instancia organizacional. Debes descargarla y presentarla al tutor de la Organización.

Descargá acá la planilla de asistencia

#### Preguntas Frecuentes

#### ¿Debo hacer mi práctica profesional si ya estoy realizando una pasantía en una organización?

Sí, la Práctica Profesional deberá realizarse de igual modo. El estudiante podrá proponer la organización en la cual desarrolla su pasantía, siempre que la empresa cumpla con los requisitos establecidos y que las tareas a desarrollar sean acordes a la carrera que está estudiando.

#### ¿Es posible realizar la práctica profesional en la empresa donde se encuentra trabajando?

Sí, siempre que la empresa cumpla con los requisitos para presentar una organización y que las tareas sean acordes a la carrera que está estudiando.

#### ¿El estudiante puede proponer una organización familiar o propia?

Sí, siempre y cuando el/la tutor/a no sea familiar directo y/o subordinado del estudiante y las actividades sean acordes a su carrera.

La organización que me fue asignada no responde a mis intentos de contacto. ¿Qué pasos debo seguir en este caso?

Deberás reportar la situación a través del canal de Atención al Alumno. El área de Empleabilidad podrá comunicarse con el referente de la organización y tomar las medidas necesarias para resolver el inconveniente. Informá con la mayor antelación posible para evitar pérdida de horas.

#### ¿Tengo que esperar a que la empresa me contacte?

No. Debés tomar la iniciativa de contactar a la empresa una vez que se informa la asignación, utilizando los datos del tutor.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/practica-profesional$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$oferta-academica$pea0$), null, 0, $pea0$ln-practica-solidaria$pea0$,
        $pea0$PRÁCTICA SOLIDARIA | La Nube 21$pea0$, $pea0$Como futuro profesional de Siglo 21, vas a cursar Práctica Solidaria para vivir una experiencia de aprendizaje junto a la comunidad. Vas a trabajar con una organización, comprender distintas realid…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/practica-solidaria el 2026-11-08. Revisalo antes de publicar.

#### Práctica Solidaria

Como futuro profesional de Siglo 21, vas a cursar Práctica Solidaria para vivir una experiencia de aprendizaje junto a la comunidad. Vas a trabajar con una organización, comprender distintas realidades y desarrollar una mirada humana y socialmente comprometida que te permita generar un impacto positivo desde tu profesión.

¿Qué es la

Práctica Solidaria?

¿Cómo se cursa?​

¿Dónde realizo mi Práctica Solidaria?

Plataforma

SOY SIGLO​​

¿Cuento con un Seguro?

Preguntas Frecuentes

#### ¿Qué es la Práctica Solidaria?

La Práctica Solidaria es una experiencia de aprendizaje en la que vas a participar junto a una organización de la comunidad. A través de esta experiencia, vas a poner en práctica lo que aprendés en tu carrera, desarrollar habilidades para tu futuro profesional y fortalecer una mirada humana y socialmente comprometida.

Es una materia obligatoria que forma parte del plan de estudios de todas las carreras de grado, sin importar la modalidad en la que curses.

Podés elegir en qué cuatrimestre del año académico querés cursarla, siempre que hayas alcanzado el tercer cuatrimestre de tu carrera.

Además, no tiene costo, por lo que no se incluye dentro del paquete de materias que abonás.

Información Importante

Recordá que la inscripción a la Práctica Solidaria finaliza sin excepción el viernes previo al inicio del período lectivo correspondiente.​

Fechas de cierre de inscripción segundo semestre: hasta el 31/07/2026

#### ¿Cómo se cursa?

El cursado de la Práctica Solidaria comprende dos instancias de aprendizaje:​​

INSTANCIA

ACADÉMICA

Ingresá acá

INSTANCIA ORGANIZACIONAL

Ingresá acá

### Instancia Académica

La materia se cursa a través del Aula Virtual (CANVAS), donde vas a contar con el material de estudio y tendrás la posibilidad de comunicarte con tu docente. Además, también podrás encontrar los formularios que se solicitan para el cursado de esta asignatura.

Modalidad Presencial (P) - Presencial Home (PH)

4 (cuatro) encuentros presenciales por semestre, en el día y horario correspondiente a tu cátedra, en las siguientes semanas de cursado:

- 3° semana
- 6° semana
- 10° semana
- 13° semana

Modalidad Educación Distribuida (ED) - Educación Distribuida Home (EDH) - Presencial Distribuida (PD)

4 (cuatro) encuentros virtuales y sincrónicos por semestre.

- Tu docente enviará las fechas y accesos a la sala de Teams a través de la mensajería de tu Aula Virtual (CANVAS).

3° semana

6° semana

10° semana

13° semana

Tu docente enviará las fechas y enlaces de acceso a la sala de Teams a través de la mensajería de tu Aula Virtual (CANVAS).

Información Importante

Recordá contactar a tu docente de Práctica Solidaria a través de la mensajería de tu Aula Virtual (Canvas), desde el primer día de cursado y durante todo el cuatrimestre.

Calendario de entregas 2026:

La entrega de los trabajos prácticos es obligatoria y debe realizarse en las fechas establecidas en el calendario académico.

#### 2° Semestre

#### Trabajo Práctico 1

#### Trabajo Práctico 2

#### Trabajo Práctico 3

#### Trabajo Práctico 4

#### Todas las Modalidades

#### 6° Semana

#### 07/09/2026

#### 9° Semana

#### 28/09/2026

#### 12° Semana

#### 19/10/2026

#### 15° Semana

#### 09/11/2026

Información Importante

Antes de avanzar con la instancia académica, es necesario contar con una organización asignada para realizar la práctica. La entrega de los trabajos prácticos es obligatoria y debe cumplirse en los plazos establecidos.

Requisitos de aprobación

Requisitos académicos de aprobación

Cursado Cuatrimestral

#### PRESENCIAL

¿Cómo se aprueba?

- Tener aprobados 3 TPs con nota de 5 o más, siendo obligatorio aprobar el TP4.

- 75% de asistencia a clases presenciales.

- Cumplir con el total de la carga horaria acordada con la organización y la obtención de una nota mayor o igual a 5 en la evaluación de desempeño de la misma.​​​​​​

La nota final es el promedio de los 4 TPs de la materia.​

​​

Cursado Cuatrimestral

#### DISTANCIA

¿Cómo se aprueba?

- Tener aprobados 3 TPs con nota de 5 o más, siendo obligatorio aprobar el TP4.

- Cumplir con el total de la carga horaria acordada con la organización y la obtención de una nota mayor o igual a 5 en la evaluación de desempeño de la misma.​​​​​​

La nota final es el promedio de los 4 TPs de la materia.​

​​​

Cursado Cuatrimestral

#### PRESENCIAL HOME

¿Cómo se aprueba?

- Tener aprobados 3 TPs con nota de 5 o más, siendo obligatorio aprobar el TP4.

- 75% de asistencia a clases presenciales.

​​​​

- Cumplir con el total de la carga horaria acordada con la organización y la obtención de una nota mayor o igual a 5 en la evaluación de desempeño de la misma.​​​​​​

La nota final es el promedio de los 4 TPs de la materia.​

### Instancia Organizacional

​¿Cómo es la dinámica de la práctica?

- Realizarás tu experiencia in situ en una organización social. Vos sos el protagonista: deberás contactarlos para acordar tus tareas y horarios.

- Duración: 12 semanas (comenzando en la 2° semana de cursado).

- Carga horaria: Un mínimo de 3 horas semanales.

¿Quiénes te acompañan en tu experiencia?

Información Importante

La Práctica Solidaria se realiza de forma presencial en la organización asignada o propuesta. El primer contacto tiene como objetivo coordinar días, horarios y tareas. La modalidad virtual solo se admite en casos excepcionales, previamente aprobados por la Universidad.

- Tutor en la Organización: Es tu referente en el día a día. Te asignará las tareas, te orientará en el ámbito de trabajo y evaluará tu compromiso y desempeño presencial.

- Docente Siglo 21: Es tu guía académico. Realizará el seguimiento de la materia, te brindará apoyo y evaluará tus trabajos prácticos para asegurar que cumplas tus objetivos de aprendizaje.

Información Importante

Fecha límite del periodo 2A/26

​​Fecha límite para solicitar organización: hasta el 07/08/2026

Fecha límite para proponer organización: hasta el 24/08/2026

Fecha límite para aplicar incompatibilidad: hasta el 24/08/2026

Plataforma SOY SIGLO

El proceso de asignación y vinculación con la organización donde realizarás tu Práctica Solidaria se gestiona a través de la plataforma SOY SIGLO.

Podrás acceder a la plataforma dentro de las 24 a 48 horas hábiles posteriores a la inscripción en la materia.

El ingreso se realiza directamente con tu correo institucional @soysiglo.21.edu.ar y tu contraseña habitual.

La cuenta se habilita automáticamente con tu inscripción, por lo que no es necesario que te registres en la plataforma.

Accedé a la plataforma acá

#### ¿Dónde realizo mi Práctica Solidaria?

La vinculación entre el/la estudiante y la organización está a cargo de la Universidad y puede gestionarse de dos maneras:

Solicitar una organización a la Universidad

Deberás completar el formulario "Solicito que la Universidad me asigne una organización" dentro de la plataforma SOY SIGLO y aguardar la asignación. El formulario debe completarse una única vez.

Tené en cuenta que la asignación no es inmediata, debes ingresar proactivamente a tu solicitud desde el botón “Revisar” para corroborar el estado. Tu solicitud siempre tendrá estado “APROBADO”, pero una vez asignada, se cargarán los datos de la organización y los datos de contacto del tutor.

La distancia entre el domicilio particular y la Organización no es motivo de rechazo si se encuentran dentro de la misma localidad de residencia.

Una vez asignada la organización, es importante que te comuniques con tu tutor para coordinar el inicio de la práctica. Contás con un plazo de 7 días para realizar ese primer contacto. Si pasado ese tiempo no te comunicaste con el tutor, la asignación se cancelará automáticamente.

Si todavía no contás con una organización para realizar tu práctica, en este video te explicamos cómo completar el formulario para solicitar que la universidad te asigne una.

Proponer una organización

### Deberás completar el formulario en la plataforma: Quiero proponer una organización.

### Requisitos para las Organizaciones:
​​​​

- Deberá ser una organización de la sociedad civil que se encuentre en actividad.

### ​

- Las actividades a realizar NO deben estar vinculadas directamente con la carrera.

- Contar con un referente que te guíe en el desarrollo de las actividades y complete la evaluación de desempeño.

- Realizar actividades acordes a los objetivos de la materia.

- ​La organización deberá contar con un proyecto de acción directa vinculados a los derechos humanos y al compromiso social.

Si la propuesta es aprobada o rechazada, recibirás un correo y podrás consultar el estado en la plataforma.

En caso de rechazo, se detallará el motivo y desde la plataforma podrás:

- Corregir el formulario y enviarlo nuevamente.
- Completar el formulario "Quiero solicitar una Organización a la Universidad" y aguardar una asignación.

Si ya tenés una organización donde realizar tu práctica, en este video te mostramos cómo cargar sus datos y proponerla para su evaluación por parte de la universidad.

Causas de rechazo de la organización:

- Organizaciones que no trabajen de forma directa por los Derechos Humanos (por ejemplo, organizaciones protectoras de animales).​

- Organizaciones donde el acento esté puesto en trasmitir e influir en ideas políticas, religiosas, etc.

### ​​​

#### Incompatibilidad de concurrencia

CASO A: Estudiante privado/a de su libertad.

CASO B: Estudiante con Certificado Único de Discapacidad (CUD) imposibilitado/a de asistir presencialmente a una organización.

En el caso en el que se apruebe la incompatibilidad, recibirás un correo electrónico y podrás visualizar el estado en la plataforma. Además, deberás comunicarte con tu docente para recibir las indicaciones correspondientes.

En el caso en el que se rechace tu incompatibilidad, recibirás un correo electrónico además de ver el estado en la plataforma, con los motivos de rechazo. En este caso deberas:

- ​Corregir el formulario y enviarlo nuevamente
- Solicitar una organización o Proponer una Organización nueva.

#### Estudiante en el extranjero

Si residís fuera del país, podés proponer una organización del lugar donde vivís para realizar tu práctica.

La organización deberá aceptar las siguientes condiciones:

- La práctica no contará con el seguro de vida brindado por la Universidad.
- No será posible modificar la cláusula octava (Jurisdicción y Competencia) del convenio correspondiente.

¿ Qué tenes que hacer?

- Si querés proponer una organización, completá el formulario: Quiero proponer una organización (cumpliendo los requisitos mencionados).

- ​Si no presentás una propuesta, la Universidad te asignará una organización según tu lugar de residencia en el extranjero. En ese caso, deberás completar el formulario: Solicito que la Universidad me asigne una organización, indicando el país donde residís.

En este video te explicamos cómo completar el formulario de incompatibilidad en la plataforma SOY SIGLO, y qué información debés presentar, según tu caso.

#### Seguro de Vida

Estarás asegurado/a desde el primer día de clases, del período en el que curses la materia, por lo que es muy importante que no asistas a la organización antes de esa fecha. No debes realizar ninguna gestión, el seguro se activa desde el primer día de clases

La Universidad cuenta con un Seguro que cubre gastos médicos y/o farmacéuticos por reintegro.

Si no tenés Obra Social o Medicina Prepaga, o elegís atenderte de forma particular y debés realizar algún gasto, recordá solicitar y conservar:

- Facturas, recibos o tickets.
- Documentación médica respaldatoria (certificados, estudios, análisis, historia clínica, etc.).

Esta documentación es necesaria para gestionar el reintegro.

En caso de necesitar la póliza del mismo, deberán completar el siguiente formulario:

solicitud de póliza

### ¿Qué debo hacer en caso de Accidente?

Atención médica inmediata: acudí al establecimiento sanitario, servicio de urgencias o profesional médico más cercano o de tu elección.

Luego de una primer atención, ya seas vos o algún responsable, se deberá cumplimentar con un REPORTE DE ACCIDENTE

en el plazo de 72hs de ocurrido el accidente complétalo acá:

reporte de accidente

DATOS del seguro:

- Aseguradora: SANCOR Coop. de Seguros Ltda.

- ADDER Seguros: administración@adder.com.ar | +54 9 351 5053837

#### Documentación

Convenio de Actividades Académicas (Marco y Anexo)

Los convenios son los documentos que formalizan la vinculación entre la Universidad y la organización donde realizarás tu Práctica Solidaria.

La firma se realiza exclusivamente de manera digital por parte de la organización, a través de la plataforma SOY SIGLO.

Como estudiante, no tenés que realizar ninguna gestión: no es necesario firmar, presentar ni enviar documentación. Si la organización necesita una copia de los convenios, podrá descargarla directamente desde la plataforma.

Información Importante

Si realizás la práctica bajo la modalidad de incompatibilidad de concurrencia, no se gestionarán convenios, ya que esta modalidad no implica la vinculación con una organización.

¿Cómo puedo ver mi convenio?

Existen dos tipos de convenios vinculados a la Práctica Solidaria.

- Convenio Anexo

Es el documento que formaliza la vinculación entre la Universidad, la organización y vos.

Podrás visualizarlo una vez que:

- la Universidad apruebe la organización que propusiste, o
- se te asigne una organización, si solicitaste que la Universidad la gestion

¿Cómo acceder al convenio?

- Ingresá al formulario que completaste.
- Hacé clic en Revisar.
- Desplazate hasta el final de la página.
- En el apartado Convenio Anexo, hacé clic en el enlace "aquí" para abrir el documento en formato PDF.

- Convenio Marco

Es el documento que formaliza la vinculación entre la Universidad y la organización.

Este convenio está disponible únicamente para el tutor de la organización dentro de la plataforma SOY SIGLO. Como estudiante, no necesitás realizar ninguna gestión sobre este documento.

Información Importante

A partir del periodo 1/26, no se recibe documentación en formato PDF ni con firma física.

Evaluación de autopercepción:

Debes completar esta encuesta en las últimas dos semanas de cursado, tu docente la compartirá por mensajería de tu Aula Virtual (CANVAS).

Evaluación de desempeño

Tiene que ser completada por el referente de la organización y debes enviarla junto al Trabajo Práctico 4 a través de tu Aula Virtual (CANVAS).

Encontrá tu evaluación de desempeño acá

#### Preguntas Frecuentes

#### ¿Es posible realizar la práctica solidaria en la organización donde ya estoy trabajando?

Sólo si la organización tiene área o proyectos vinculados a la responsabilidad social o a grupos vulnerados. En este caso podrás presentar la Propuesta de cursado.

#### ¿Qué procedimiento debo seguir si no aprueban la organización que propuse para realizar la práctica?

Si tu propuesta no cumple con los requisitos, no podremos aprobarla. En ese caso, deberás presentar una nueva organización que cumpla con los requisitos de aprobación

La organización que me fue asignada no responde a mis intentos de contacto, ¿qué pasos debo seguir en este caso?

​Envíanos alguna prueba de que intentaste contactarlos (puede ser un mail, mensaje o captura). Con eso, vamos a intervenir y tratar de restablecer el contacto. Si aun así no obtenés respuesta, buscaremos otra alternativa para que puedas hacer tu práctica.

#### ¿Tengo que esperar a que la organización me contacte?

Una vez que recibís el contacto de la organización (generalmente del tutor asignado), sos vos quien debe tomar la iniciativa para escribir o llamar y presentarte. Es fundamental que hagas este primer contacto para coordinar el inicio de la práctica y acordar horarios o tareas.

#### Problemas durante la práctica: ¿cómo se gestionan?

Si tenés algún inconveniente durante la práctica (como tareas no relacionadas, ausencia del tutor, entre otros), comunícate con la universidad lo antes posible. Así podremos intervenir y ayudarte a resolver la situación.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/practica-solidaria$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$modalidades$pea0$), null, 0, $pea0$ln-presencialidad-distribuida$pea0$,
        $pea0$Presencial Distribuida$pea0$, $pea0$Esta modalidad combina la experiencia de cursado presencial en el CAU con la tecnología de Telepresencia, permitiendo conectarte y aprender de una manera completamente nueva.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/presencialidad-distribuida el 2026-11-08. Revisalo antes de publicar.

### MODALIDAD PRESENCIAL DISTRIBUIDA

Esta modalidad combina la experiencia de cursado presencial en el CAU con la tecnología de Telepresencia, permitiendo conectarte y aprender de una manera completamente nueva.

Las aulas en los CAU están equipadas con la tecnología necesaria para que puedas ver e interactuar en tiempo real con tu profesor y el contenido de tus materias, haciendo del aprendizaje una experiencia dinámica y cercana.

Recursos presenciales y digitales

La modalidad Presencial Distribuida tiene las siguientes caracteristicas clave:

​Cursado cuatrimestral: Cada materia tiene una duración de un cuatrimestre, lo que permite enfocarte en objetivos claros y progresar paso a paso.

Horarios: Las clases se ofrecen de lunes a viernes, en distintos horarios según la carrera.

Contacto con docentes: Combina las clases presenciales en tu CAU utilizando recursos holográficos para interactuar de manera sincrónica, con tu profesor, compañeros de clase y de otros CAUs, lo que te permitirá resolver dudas y obtener apoyo académico de manera rápida y sencilla.

Tutores Dinamizadores en el Centro de Apoyo Universitario (CAU): Contarás con el apoyo de tutores dinamizadores que estarán allí para guiarte y ayudarte durante el proceso de aprendizaje.

Estudia con tus compañeros: En el CAU tendrás la oportunidad de cursar junto a otros estudiantes, lo que te permitirá compartir experiencias, trabajar en equipo, y construir una red de apoyo que enriquecerá tu aprendizaje.

Conocé todo lo que necesitás saber de tu modalidad

### CONDICIONES DE MATERIAS

Tu espacio central de cursado. Ingresá y mirá el contenido de tus materias.

### INSCRIPCIÓN A MATERIAS

Ingresá para encontrar todo el contenido sobre tu modalidad.

### CALENDARIO ACADÉMICO

Gestioná inscripciones, a materias, parciales, finales y mucho más.

### TODO SOBRE PARCIALES

Resumen de titulo por avance

### TRABAJOS PRÁCTICOS

Resumen de titulo por avance

#### Registrá tu asistencia en la APP Siglo 21

Con tu celular podés registrar tu asistencia a las clases de manera ágil y sencilla. Solo necesitás descargar la App Siglo 21 e ingresar con tu usuario para validar tu presencia en cada cursado.

Conocé la App$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/presencialidad-distribuida$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-proceso-de-titulacion$pea0$,
        $pea0$OBTENE TU TITULO | La Nube 21$pea0$, $pea0$Inicias el trámite final para la emisión de tu título profesional. Conoce a continuación los pasos y las etapas que integrarás en esta última etapa de tu trayecto académico.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/proceso-de-titulacion el 2026-11-08. Revisalo antes de publicar.

#### Felicitaciones

#### Llegaste a tu meta

Inicias el trámite final para la emisión de tu título profesional. Conoce a continuación los pasos y las etapas que integrarás en esta última etapa de tu trayecto académico.

¿Cómo es el proceso de titulación?

¿Cuándo inicia y qué tener en cuenta?

¿Cómo consultar el estado en tu Portal Estudiantes?

¿Cómo consultar el estado en SIDCer?

¿Cómo se retira el título o gestiona el envío?

Constancia de egreso y certificado

#### ¿Cómo es el proceso de titulación?

Tené en cuenta que en las carreras de Pregrado no se rinde el EFIP II, por lo que el proceso de visado académico comenzará automáticamente una vez registrado tu egreso.

#### ¿Cuándo inicia el proceso y qué debo tener en cuenta?

El proceso inicia cuando alcanzas la condición de egresado, y no requiere que realices ninguna solicitud.

Sin embargo deberás tener en cuenta los siguientes aspectos:

Tener la condición de egresado:

Carreras de grado:

- La condición de egresado se obtiene luego de rendir tu defensa oral y aprobar el Seminario Final. Es necesario que la nota esté cargada en tu Portal de Estudiantes.

Carreras de Pregrado:

- La condición de egresado se obtiene luego de haber aprobado la última materia de tu carrera. Es necesario que la nota este cargada en tu Portal de Estudiantes.

Haber abonado la tasa de graduación

Los egresados de carreras de GRADO y CICLOS DE COMPLEMENTACION (Excepto Escribanía) cualquiera sea la modalidad, deberán abonar la Tasa de Graduación para llevar adelante el VISADO académico para rendir DEFENSA ORAL*.

*(para alumnos DISTANCIA no es necesario abonar la TASA previo a rendir el EFIP II, ya que la validación académica para rendir EFIP II es automática en CAMPUS)

¿Que contempla la TASA de GRADUACION?

- Constancia de egreso o certificado de titulación en trámite (a requerimiento del interesado)
- Gestión del diploma y certificado analítico oficial digital y en papel de seguridad, con la respectiva legalización ministerial.
- Opción de envío del título a CAU (para aquellos egresados que son de otras ciudades/provincias).
- Invitación al acto de colación para el egresado e invitados (la cantidad de invitados te será comunicada por correo institucional)
- Acceso a evento de colación.

¿Cuándo y cómo se abona la Tasa de Graduación?

Cuando estés en apto para rendir tu defensa oral, vas a recibir un correo informándote que gestiones el pago de la tasa de graduación. En este momento deberás ingresar a Pago Eléctronico y generar el ticket por la tasa de graduación.

Ingresá a Otros Pagos y seleccioná el concepto Titulación de grado - pregrado

Hacé clic en Siguiente y seleccioná el medio de pago que prefieras para completar la transacción.

Contar con toda la documentación de legajo completa

#### Revisá cuál es la documentación necesaría y cómo enviarla:

Ingresá acá

#### ¿Cómo consultar el estado de tu título en tu Portal Estudiantes?

#### Ahora podes consultar el estado de tu título en la sección "Cursado" desde tu Portal Estudiantes.

SECCIÓN CURSADO: desde acá vas a poder visualizar el estado de tu título.

El trámite de tu título atraviesa distintas etapas administrativas y académicas, necesarias para garantizar la validez y correcta emisión de la documentación oficial. Cada una de estas instancias tiene un tiempo estimado de gestión y podrás seguir su avance de forma transparente desde tu Portal Estudiante, en la sección Cursado.

A continuación, te explicamos en qué consiste cada etapa para que sepas qué esperar en cada momento del proceso y puedas acompañar tu camino como egresado/a con tranquilidad.

#### ETAPA 1: Validación

#### ¿Qué sucede en esta etapa?

Revisamos y confirmamos que todos tus datos académicos y personales estén correctos antes de generar la documentación de tu título.

#### Duración estimada: hasta 75 días.

#### Tips para vos: asegurate de tener tus datos actualizados en el portal para evitar demoras.

#### ETAPA 2: Legalización

#### ¿Qué significa?

#### Tu título se legaliza oficialmente y se completan todas las firmas necesarias para que sea válido legalmente.

#### Duración estimada: hasta 40 días.

#### En esta fase, tu título ya tiene respaldo legal, pero aún no está listo para retirar o enviar.

#### ETAPA 3: Despacho

#### ¿Qué implica esta etapa?

#### Una vez legalizado, tu título pasa al proceso interno de empaque y envío o retiro según lo hayas solicitado.

#### Duración estimada: hasta 5 días.

#### Estado visible en tu Portal:

- Despacho:

- Entrega:

#### Otros estados posibles:

- Documentación Incompleta

#### Si faltan datos o documentación en tu legajo, aparecerá una notificación de “Documentación Incompleta”.

#### Que hacer: revisá tu portal y cargá o actualizá la documentación o datos faltantes para reanudar el trámite.

- Progreso de Titulación — Visualización de ambos títulos

Si completaste una carrera que tiene título intermedio, podrás visualizar el progreso de ambos trámites por separado en tu Portal Estudiante.

#### ¿Cómo consultar el avance del registro en SIDCer?

SIDCer es el Sistema Informático de Diplomas y Certificaciones. En este organismo gubernamental, la universidad solicita la legalización del título.

Podes consultar el avance del trámite a través desde la página de SidCer

Ingresá a SIDCer

¿Cómo es el proceso en SIDCer?

► Solicitud enviada a la DNGyFU (Dirección Nacional de Gestión y Fiscalización Universitaria).

► Solicitud aprobada: Regresa a la institución para la carga de imágenes.

(DNGyFU notifica a la Universidad a través de una aprobación preeliminar para que continúe con el trámite)

1. Impresión y pegado de obleas (código QR que lleva el título).

2. Digitalización de imágenes de diploma y analítico físicos.

3. Firma de autoridades.

4. Envío de imágenes digitalizadas al Ministerio para validación final.

► Trámite finalizado: Incorporación del egresado en el Registro Público de Graduados Universitarios.

Cuando tu trámite se encuentra finalizado en SIDCer, existe un plazo posterior de gestiones internas en la Universidad. Se te notificará desde el área cuando se encuentre listo para ser retirado o solicitar el envío a tu CAU.

#### ¿Cómo retiro mi título?

Una vez que haya finalizado el proceso, vas a recibir una notificación para que retires tu título o coordines el envío a tu CAU.

#### Retiro de Título en sede Campus

Para retirar tu título en la sede Campus, deberás solicitar turno hasta 48 hs. hábiles antes de la fecha en que desees retirarlo.

Solicitá tu turno acá

(Podes asistir personalmente o enviar un tercero/comisionista autorizado; quien deberá presentarse con una nota firmada por el egresado y certificada por escribano, juez de paz o policía + copia del DNI del alumno y de la persona autorizada).

#### Envío al CAU

Para recibir tu título en el Centro de Aprendizaje Universitario del cual egresaste, debés solicitarlo mediante consulta web desde tu Portal Estudiantes:

Paso 1: Desde tu Portal Estudiantes ingresá a la sección Contactanos

Paso 2:

- En la pantalla de Consulta Alumnos, ubicate en la sección Iniciar Trámite.
- Confirmá la selección de tu legajo y hacé clic en el botón Comenzar.

Paso 3:

- En el campo Títulos de tipificación, seleccioná la opción Envío de título.
- En la Descripción del ticket, redactá el pedido indicando de forma explícita el nombre de tu CAU.
- Presioná el botón Enviar.

IMPORTANTE: Los envíos se realizan semanalmente, podes contactarte con tu CAU para coordinar el retiro.

Información Importante

Solo se envían al CAU de egreso. No es posible realizar cambio de CAU o solicitar envío a uno distinto (a excepción que tu CAU no se encuentre habilitado. En ese caso se enviará al mas cercano).

#### SOLICITUD DE CONSTANCIA DE EGRESO

Podés pedir esta constancia siempre que necesites presentarla ante una institución o para realizar la jura en tu Colegio Profesional.

¿Cómo se realiza el trámite?

Esta constancia se puede gestionar de dos maneras:

- A través del Colegio Profesional: La entidad puede requerirla directamente enviando una nota formal (oficio) al Secretario Académico.
- De manera personal: Podés tramitarla vos directamente siguiendo estos pasos:​​​

Paso 1: Ingresá a Consulta Alumnos desde tu Portal Estudiantes dentro de Contactanos.

Paso 2: En título de tipificación, elegí Constancia de egreso u oficio.

Paso 2: En la Descripción indicá el nombre del colegio profesional y el correo electrónico de la institución. El documento se enviará en formato digital directamente a la institución solicitante (no se envía a tu casilla personal).

Información Importante

Tené en cuenta que estos trámites tienen carácter de documentación provisoria por ende no son necesarios para validar tu condición de egresado/a. Solicitalos solo en caso de que algún organismo o institución te los requiera.

#### SOLICITUD DE CERTIFICADO DE TÍTULO EN TRÁMITE

Carreras de Grado

Para solicitarlo debe tener la nota de Defensa Oral cargada.

Carreras de Pre Grado

Para solicitarlo debe tener rendido el último final. Debe tener completa la documentación de inscripción.

Para solicitarlo deberá:

​​

1. Cargar la Solicitud a través de Consulta Alumnos desde tu Portal Estudiantes dentro de Contactanos.

2. En caso de ser egresado de la Tec. en Higiene, indicar nombre de la institución en la que se presentará y lugar (ciudad, provincia, país).

3. El documento se envía en formato digital y tiene validez por un año

Paso 1: En consultar elegí el legajo correspondiente

Paso 2: En título de tipificación, elegí Certificado de título en trámite

Paso 3: Envía tu consulta.

Información Importante

Tené en cuenta que estos trámites tienen carácter de documentación provisoria por ende no son necesarios para validar tu condición de egresado/a. Solicitalos solo en caso de que algún organismo o institución te los requiera.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/proceso-de-titulacion$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$plataformas$pea0$), null, 0, $pea0$ln-requisitos-tecnicos-edusoft$pea0$,
        $pea0$REQUISITOS TÉCNICOS EDUSOFT$pea0$, $pea0$Para ejecutar English Discoveries, tus dispositivos deben cumplir los siguientes requisitos mínimos de hardware:$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/post/requisitos-t%C3%A9cnicos-edusoft el 2026-11-09. Revisalo antes de publicar.

**Para ejecutar English Discoveries, tus dispositivos deben cumplir los siguientes requisitos mínimos de hardware:**

- La PC / Mac debe cumplir con los requisitos mínimos del sistema operativo admitido.
- Resolución mínima 1024x768.
- Auriculares / altavoces y micrófono. (Sugerimos utilizar un micrófono externo y no el micrófono incorporado de la computadora).
- Se admiten tabletas de 10 pulgadas (resolución mínima de 1024x768). (Las actividades de voz no son compatibles con dispositivos de tableta)

**Sistemas operativos compatibles:**

- Windows 7 (versión de 32 o 64 bits), Windows 8 (versión de 32 o 64 bits) y Windows 10 (versión de 32 o 64 bits).
- Mac OS X 10 (con navegador Chrome o Firefox).
- iOS 9 o 10 (con navegador Safari) es compatible con la plataforma de estudiantes English Discoveries.
- Android 6 o 7 (con navegador Chrome)

**Navegadores:**

- Google Chrome 37 o superior
- Mozilla Firefox 43 o superior
- Internet Explorer 10 + 11

**Componentes adicionales:**

- Flash Player 18 o mejor
- Usuarios de Internet Explorer: deberán descargar el módulo de reconocimiento de voz, desde la ventana de verificación del sistema.
- Chrome o Firefox: el reconocimiento de voz es automático, no hay necesidad de descargar ningún módulo.

### Comentarios$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/post/requisitos-t%C3%A9cnicos-edusoft$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$plataformas$pea0$), null, 0, $pea0$ln-requisitos-tecnicos-klarway$pea0$,
        $pea0$REQUISITOS TÉCNICOS KLARWAY$pea0$, $pea0$SISTEMA OPERATIVO: Windows$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/post/requisitos-tecnicos-klarway el 2026-11-09. Revisalo antes de publicar.

**SISTEMA OPERATIVO: Windows**

- VERSION DEL SISTEMA: Windows 10 o superior
- PROCESADOR: Intel Core i3 o superior
- 64bits, 4GB de RAM
- ESPACIO DISPONIBLE: 1GB
- CÁMARA Y MICRÓFONO
- CONEXIÓN A INTERNET
- BATERIA CARGADA 80% (o conectada a red eléctrica)

**Sistema Operativo MAC**

- VERSION DEL SISTEMA: Monterrey 12.6.3 o superior
- PROCESADOR: Intel Core i3 / M1 o superior
- 64bits, 4GB de RAM
- ESPACIO DISPONIBLE: 1GB
- CÁMARA Y MICRÓFONO
- CONEXIÓN A INTERNET
- BATERIA CARGADA 80% (o conectada a red eléctrica)

### Comentarios$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/post/requisitos-tecnicos-klarway$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-revision-de-examen$pea0$,
        $pea0$¿Cómo solicitar la revisión de examen?$pea0$, $pea0$Si al finalizar el examen, consideras que alguna pregunta no ha sido evaluada de manera correcta, el sistema te va a habilitar la “solicitud de revisión” en el mismo momento del examen.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/post/revision-de-examen el 2026-11-09. Revisalo antes de publicar.

Si al finalizar el examen, consideras que alguna pregunta no ha sido evaluada de manera correcta, el sistema te va a habilitar la “**solicitud de revisión**” en el mismo momento del examen.

En esta instancia, deberás marcar aquellas preguntas con las cuales no estás de acuerdo y argumentar el motivo por el cual no lo estás.

Por ejemplo, si no estás de acuerdo con la respuesta que se marca como correcta, deberás específicar cuál crees es la opción adecuada y el detalle de la bibliografía en la que viste ese contenido.

**El proceso de revisión solo se realiza una vez finalizado el examen. Cumplida esta instancia, no hay otra vía de revisión.**

🔰​ En el caso de Parcial, contarás con 10 minutos para realizar la revisión

🔰​ En el caso de Examen Final, contarás con 15 minutos

El plazo de respuesta del pedido de revisión es de 15 días y de la resolución podrán darse las siguientes situaciones:

- Que se dé lugar al pedido y el examen revisado esté APROBADO. En dicho caso, se analizará si corresponde la aplicación de un cambio en la calificación obtenida, de acuerdo a la escala de notas vigente.

- Que se dé lugar al pedido y el examen revisado esté DESAPROBADO. En dicho caso se analizará, según la problemática identificada, si corresponde la aplicación de un cambio de calificación o si se otorga la posibilidad de rendir nuevamente la instancia de examen.

- Que no se dé lugar al pedido de revisión.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/post/revision-de-examen$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-salud-y-deportes$pea0$,
        $pea0$Salud y Deportes$pea0$, $pea0$Salud y Deportes$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/salud-y-deportes el 2026-11-08. Revisalo antes de publicar.

Salud y Deportes

Viví tu experiencia universitaria al máximo

Activá tu bienestar y viví la universidad desde otro lugar. En este espacio encontrás propuestas que combinan actividad física, hábitos saludables y gestión emocional.

Desafiá tus límites, conectá con otros y fortalecé tu cuerpo y mente mientras desarrollás constancia y trabajo en equipo. Cada experiencia te ayuda a sentirte mejor, rendir más y disfrutar tu vida universitaria.

POTENCIÁ TU PERFIL

ACADÉMICO Y PROFESIONAL

Explorá el espacio de Experiencias 21 y descubrí actividades cocurriculares para tu carrera.

Ingresá al Portal de Recomendaciones para conocer cada propuesta y realizá tu inscripción.

Especial

Activá tu bienestar

Sumate a las actividades pensadas para promover el bienestar, la vida activa y el equilibrio entre estudio y salud.

#### Beneficios académicos| Sumá a tu titulo

Formar parte de una escuadra deportiva no solo impulsa tu desarrollo personal y el trabajo en equipo, también tiene reconocimiento académico.

Si participás como capitán de equipo durante un año, podés acceder a la equivalencia de la materia Grupo y Liderazgo o a una materia electiva.

Además, al integrar equipos deportivos federados y representar a la Universidad, podés obtener el Suplemento al Título Universitario, un diferencial que reconoce tu compromiso y fortalece tu perfil académico y profesional.

### SUSCRIBITE

### AL NEWSLETTER

### ¡Sumate a Experiencias 21!

### Enterate antes que nadie de todas las experiencias, actividades y novedades.

 Recibí contenido exclusivo y mantenete al día con todo lo que pasa en Experiencias 21.

SUSCRIBITE ACÁ$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/salud-y-deportes$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-seminariofinal$pea0$,
        $pea0$CURSADO Seminario Final$pea0$, $pea0$El Trabajo Final de Graduación (TFG) es una etapa obligatoria para obtener tu título de grado. A través de este proceso vas a demostrar la integración de los conocimientos adquiridos durante la Car…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/seminariofinal el 2026-11-08. Revisalo antes de publicar.

#### Te damos la
Bienvenida al proceso de Trabajo Final de Grado

El Trabajo Final de Graduación (TFG) es una etapa obligatoria para obtener tu título de grado. A través de este proceso vas a demostrar la integración de los conocimientos adquiridos durante la Carrera, aplicándolos en un proyecto profesional o académico.

El TFG se desarrolla en tres etapas: el cursado del Seminario Final, la revisión del trabajo por una Comisión Asesora CAE y la Defensa Oral.

El proceso del Trabajo Final de Grado está integrado por 3 etapas:

#### 01. Cursado

Conocé más

#### 02. CAE

Conocé más

#### 03. Defensa Oral

Conocé más

Mirá el vídeo y conocé los aspectos principales de esta gran etapa en la Universidad.

01

CURSADO DE LA MATERIA

SEMINARIO FINAL

Durante esta etapa, cursás la asignatura Seminario Final, donde desarrollás el Proyecto de Trabajo Final de Grado. A lo largo del cursado, respondés a consignas y entregás avances, con el acompañamiento del cuerpo docente a través de tutorías académicas.

Modulo 0

¿De qué se trata la materia?

Entrega y Devolución

¿Cómo se aprueba?

Normas APA

#### ¿Qué es el Módulo 0?

El Módulo 0 es una instancia complementaria, diseñada para que llegues mejor preparado/a al tramo final.

#### ¿Qué te aporta este espacio?

Te ayuda a organizar tu tiempo y planificación personal.

Te propone herramientas metodológicas para encarar tu proyecto.

Te invita a repensar lo aprendido durante la Carrera.

Te guía para transformar tus ideas en una propuesta profesional sólida.

Tenés a disposición 4 lecturas clave para convertir tu proyecto en un producto profesional que refleje todo lo que aprendiste.

#### El módulo 0 lo vas a encontrar en la Página de Inicio de la materia Seminario Final.

#### Para ingresar a la materia Seminario Final hace clic en "Opciones de TFG"

Cada bloque tiene un botón de acceso a la lectura correspondiente:

- Lectura 01: Fundamentos y planificación inicial del trabajo.
- Lectura 02: Diseño metodológico y marco teórico.
- Lectura 03: Ejecución de la investigación y redacción académica.
- Lectura 04: Elaboración del informe final, presentación y defensa.

Te recomendamos avanzar en orden, ya que cada etapa se construye sobre la anterior.

#### ¿De qué se trata la materia Seminario Final?

El Seminario Final busca generar las competencias profesionales claves, como son la visión estratégica, la autogestión y la comunicación. Durante el cursado se trabajan las siguientes competencias institucionales:

​​

Innovación y creatividad en las propuestas de aplicación: para eso el alumno debe conocer el panorama actual de la profesión, acciones, métodos, etc.

Investigación: teoría de la disciplina y casuística, de modo que pueda elaborarse una propuesta innovadora basada en paradigmas.

Comunicación Escrita (redacción del texto y presentación de informe según el tipo del trabajo final de grado) y Oral.

Es una materia de la currícula de todas las carreras de grado.

Duración: 4 meses

Cursado: Último semestre.

Condiciones al finalizar el cursado: REGULAR o LIBRE

#### ALTERNATIVAS DE PRODUCTOS Y LÍNEAS TEMÁTICAS ESTRATÉGICAS EN CADA CAMPO DISCIPLINAR

En el inicio del cursado, deberás elegir un tipo de Producto sobre el que trabajar y, para el mismo, una línea temática.

Las alternativas para cada uno, se encontrarán disponibles en la plataforma de la materia Seminario Final, según el campo disciplinar, pues están definidas en función de las competencias que has desarrollado durante el cursado para que puedas elaborar tu TFG poniéndolas en práctica.

#### PRODUCTOS DISPONIBLES SEGÚN TU CARRERA

Ingresar

#### ¿CURSASTE PUBLICIDAD O DISEÑO GRÁFICO?

Ingresar

Como punto de partida, deberás elegir el Producto, que determinará el formato general de tu TFG.

¿Cómo debes hacer?

Desde la página de inicio del Aula Virtual (Canvas), debes ingresar a > “Opciones de TFG” donde encontrarás videos explicativos sobre los diferentes productos en que puedes trabajar.

Deberás elegir entre diversas líneas temáticas que la Universidad te propone.

Es importante que sepas que, una vez elegida la línea temática, no podrás modificarla, por lo que es importante que revises tus intereses y propósitos y los tomes como guía para la elección.

Definidos el tipo de trabajo y la línea temática, iniciarás el proceso de construcción progresiva de tu TFG. Para ello, contarás con los contenidos, objetos de aprendizaje colaborativos y entregas pautadas específicas.

Los contenidos de la materia se distribuyen en 4 módulos. En cada uno deberás elaborar presentaciones de carácter evaluativo según consignas específicas, apoyándote en el contenido dispuesto en la plataforma y en la guía de tu Profesor Director.

El objetivo es que, en el cuarto y último módulo, logres el documento completo y definitivo de tu Trabajo Final de Grado, que, una vez aprobado por tu Profesor Director, estará listo para pasar a la etapa siguiente de revisión por parte de la CAE.

#### AVANCES Y ENTREGAS PARCIALES EVALUATIVOS: 4 módulos

Cada uno implica una entrega parcial y evaluativa, correspondiente a la etapa de tu producción que se aborde en el mismo.

#### ¿Cómo es la Entrega y Devolución?

#### Modalidad de entrega y calificación

MODALIDAD DE ENTREGA: A través de tu plataforma virtual

CALIFICACIÓN: Una vez cumplida la fecha de vencimiento para la entrega, el docente iniciará el proceso de corrección. Esto podría extenderse hasta un máximo de 10 días corridos, según los lineamientos institucionales.

#### Devolución del Profesor

Dentro del plazo mencionado, el docente cargará la calificación correspondiente en la plataforma. Junto con la nota, recibirás observaciones específicas que podrán estar incluidas directamente en el archivo que entregaste o en la sección de comentarios.

Cada devolución estará acompañada de una grilla de evaluación, la cual detalla los criterios utilizados para calificar tu trabajo y describe tu desempeño en cada aspecto evaluado. Esto te permitirá comprender mejor cómo se llegó a la calificación asignada y qué áreas puedes mejorar.

#### ¿Cómo obtener la regularidad en seminario final?

#### Elegí tu modalidad y revisá las condiciones de cursado de Seminario Final

#### Cursado Presencial

#### Modalidad

#### Presencial

#### ¿Cómo se Aprueba?

•Tener aprobados 3 TPs con nota de 5 o más, siendo obligatorio aprobar el TP4.

•75% de asistencia a clases presenciales.

#### Tené en cuenta que

La nota final será la que obtengas en tu Defensa Oral, una vez que cumplas con todas las instancias de tu Trabajo Final de Grado.

#### Capacitación Normas APA

Te compartimos una capacitación en normas APA. Es fundamental para el desarrollo del Trabajo Final de Grado, ya que brinda las herramientas necesarias para citar correctamente las fuentes, estructurar el contenido de forma clara y profesional, y evitar el plagio académico. Dominar este estilo de citación no solo mejora la calidad del trabajo escrito, sino que también fortalece las competencias en redacción académica y en el manejo ético de la información, aspectos clave para una presentación rigurosa y confiable del proyecto final.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/seminariofinal$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-simulador-de-condicion$pea0$,
        $pea0$SIMULADOR DE CONDICIÓN | La Nube 21$pea0$, $pea0$Cargá las notas de cada una de tus actividades y conocé cual será el estado final en cada una de tus materias. Recordá que los requisitos cambiarán de acuerdo a tu modalidad.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/simulador-de-condicion el 2026-11-08. Revisalo antes de publicar.

#### Simulador de Condición

Cargá las notas de cada una de tus actividades y conocé cual será el estado final en cada una de tus materias. Recordá que los requisitos cambiarán de acuerdo a tu modalidad.

#### ¡No olvides refrescar la página cada vez que uses el simulador!$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/simulador-de-condicion$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-sustentabilidad-social$pea0$,
        $pea0$SUSTENTABILIDAD SOCIAL | La Nube 21$pea0$, $pea0$SUSTENTABILIDAD$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/sustentabilidad-social el 2026-11-08. Revisalo antes de publicar.

SUSTENTABILIDAD

¿CUÁL ES NUESTRO PROPÓSITO?

Contribuir a la formación de agentes de transformación social, fortaleciendo el vínculo Universidad–comunidad y aportando a la mejora de la calidad de vida de los sectores vulnerados.

POTENCIÁ TU PERFIL

ACADÉMICO Y PROFESIONAL

Explorá el espacio de Experiencias 21 y descubrí actividades cocurriculares para tu carrera.

Ingresá al Portal de Recomendaciones para conocer cada propuesta y realizá tu inscripción.

Especial

Extensión

Proyectos Extensión

Certificado en Competencias

Institucional

Academia

#### Extensión

Nuestra misión es formar profesionales con mirada global, espíritu emprendedor y compromiso social, capaces de generar impacto positivo en sus entornos.

Es una de las tres funciones esenciales de la universidad, junto con la investigación y la docencia. Busca fortalecer el vínculo con la comunidad, promoviendo el desarrollo local y el intercambio de conocimientos, donde la comunidad acerca sus problemáticas y la Universidad responde con herramientas y saberes.

#### PAT | Proyectos académicos transversales

Son proyectos de articulación entre cátedras y organizaciones sociales que se desarrollan en el marco de una materia. Permiten abordar problemáticas reales, generando espacios de aprendizaje práctico junto a docentes.

Duración | bimestral o cuatrimestral

#### VOLUNTARIOS 21

Espacio de compromiso social donde difundimos oportunidades de voluntariado en organizaciones de todo el país. Actuamos como nexo entre estudiantes, egresados, docentes y co-docentes que deseen participar.

Con 4 áreas de desarrollo:

- Servicio
- Educación
- Medio Ambiente
- Derechos Humanos

Beneficios:

- Reconocimiento de Crédito Académico | Debés acreditar tu participación en proyectos de voluntariado en dos períodos

semestrales consecutivos o no consecutivos.

Reconocimiento: 1 materia electiva

- Suplemento al Título Universitario.

#### Proyectos de Extensión

#### PIC | Proyectos de Intervención Comunitaria

Proyectos nutridos de manera interdisciplinaria con la intervención de diferentes carreras, poseen un formato similar a los equipos de investigación con la diferencia que se trata de un tema aplicado a necesidades comunitarias reales.

Duración | anual

#### SEC | Servicio de Extensión Comunitaria

Servicios que responden a oportunidades identificadas en conjunto con organizaciones de la comunidad, con un alto potencial de impacto. De carácter federal y permanente.

[CONOCÉ LOS PROYECTOS ACÁ](https://informate.21.edu.ar/experiencia-21?tag=sustentabilidad&seen=1&page=1)

#### Institucional

#### Accesibilidad en Siglo 21

Desde la Universidad acompañamos y asesoramos en accesibilidad académica a estudiantes que lo necesiten.

Trabajamos para promover prácticas educativas inclusivas a través de la sensibilización, capacitación y acompañamiento en la implementación del Protocolo de prácticas educativas inclusivas.

### Instructivo para el uso de plataformas

Ponemos a disposición un instructivo con lineamientos básicos para facilitar el uso de las plataformas con lectores de pantalla, especialmente pensado para personas con discapacidad visual.

- Vas a encontrar recursos para:

### CANVAS
Instructivo para el uso del lector de pantalla en Canvas​

[MIRÁ EL INSTRUCTIVO ACÁ](https://www.lanube.21.edu.ar/_files/ugd/cf0a7a_ef1039c075df48e1bf5f66cc9f71b3c9.docx?dn=Trabajando%20con%20las%20plataformas%20de%20%20Universidad%20Siglo%2021%20y%20lectores%20de%20pantalla.docx)

### KLARWAY
Requiere de asistencia de un tercero por no tener un diseño universal

[INSTRUCTIVO](https://www.lanube.21.edu.ar/_files/ugd/cf0a7a_e3a48a091abc4033b07f8e809541299d.pdf)

#### Académia

#### Práctica Solidaria

La Práctica Solidaria es una experiencia que complementa tu formación profesional, promoviendo el desarrollo de la responsabilidad social como parte de tu perfil.

Se trata de una instancia de participación continua que te vincula con distintas realidades sociales, permitiéndote involucrarte activamente y generar impacto en la comunidad y el entorno.

#### CONOCÉ
MÁS SOBRE 
PRÁCTICA SOLIDARIA

Especial

#### Certificado en Competencias de Sustentabilidad

Incorporá una mirada integral del desarrollo sostenible, equilibrando las dimensiones económica, ambiental y social.

A través de un enfoque interdisciplinario, vas a adquirir conocimientos y metodologías que promueven el equilibrio entre el desarrollo económico, el cuidado del ambiente y la atención a las necesidades sociales.

[CONOCÉ MÁS](https://informate.21.edu.ar/certificado-en-competencias)

Este certificado complementa tu formación con herramientas y habilidades para diseñar e implementar iniciativas con enfoque sustentable y uso responsable de los recursos.

[INSCRIBITE AHORA](https://cocurriculares.21.edu.ar/alumnos?idCareer=10986)

Lunes

Espacio de consultas para inscriptos en Certificados.

16:00 hs

Unirse a sala Teams

ID de reunión: 841 6174 0367 

Código de acceso: 554827

#### Materias específicas

Además de los programas cocurriculares, también podés potenciar tu formación desdelo curricular.

Contamos con materias específicas y alineadas a los ODS:

- Responsabilidad Social
- Nuevas Economías e innovación social
- Gestión Sustentable de organizaciones
- Estudios de género para la formación profesional

### SUSCRIBITE

### AL NEWSLETTER

### ¡Sumate a Experiencias 21!

### Enterate antes que nadie de todas las experiencias, actividades y novedades.

 Recibí contenido exclusivo y mantenete al día con todo lo que pasa en Experiencias 21.

SUSCRIBITE ACÁ$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/sustentabilidad-social$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$atencion-y-derivaciones$pea0$), null, 0, $pea0$ln-teacompanamos$pea0$,
        $pea0$SOY INGRESANTE | La Nube 21$pea0$, $pea0$Contás con equipos y referentes disponibles para orientarte en tu recorrido.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/teacompa%C3%B1amos el 2026-11-08. Revisalo antes de publicar.

### ESTAMOS PARA
ACOMPAÑARTE

Contás con equipos y referentes disponibles para orientarte en tu recorrido.

A lo largo de tu cursada, vas a tener acceso a distintos espacios de apoyo pensados para escucharte, orientarte y acompañarte tanto en lo académico como en lo personal.

Desde el inicio y en cada etapa, hay equipos preparados para ayudarte a resolver dudas, organizar tu recorrido y fortalecer tu experiencia universitaria.

Tenés disponible diferentes instancias de acompañamiento, como el Gabinete de Bienestar, los Tutores Virtuales y los encuentros con directores de carrera. Accedé a la información y elegí el espacio que mejor se adapte a vos:

TU

CAU/SEDE

TE ACOMPAÑA

RECIBÍ ACOMPAÑAMIENTO ADMISITRATIVO Y ACADÉMICO

Si tenés dudas o consultas, recurrí siempre a tu CAU o Sede. Ellos están para acompañarte en lo que necesites.

LOS

TUTORES VIRTUALES

TE ACOMPAÑAN

APOYO ACADÉMICO PARA ACOMPAÑARTE DURANTE LA CURSADA

Un equipo de acompañamiento que te orienta en la cursada, en el uso de las herramientas y en tu organización semanal.

CONSULTAS DIRECTAS

Para realizar consultas puntuales sobre la cursada, el uso de la plataforma o la organización académica.

ENCUENTROS PROGRAMADOS

Espacios de acompañamiento con tutores para organizar tu estudio y resolver dudas de manera más personalizada.

CONOCÉ MÁS SOBRE EL

GABINETE DE BIENESTAR

ORIENTACIÓN Y ACOMPAÑAMIENTO PERSONAL

Un espacio de escucha y orientación para acompañarte en tu bienestar personal y en la adaptación a la vida universitaria.

ENCUENTROS INDIVIDUALES

Sesiones personalizadas con profesionales del Gabinete para orientarte y acompañarte.

TALLERES

Actividades para fortalecer tu bienestar, habilidades y gestión académica.

ENCUENTROS CON

DIRECTORES DE CARRERA

ENCUENTROS ACADÉMICOS PARA ORIENTARTE Y ACOMPAÑARTE EN TU RECORRIDO

Los directores de carrera te acompañan en distintos momentos de tu cursada, brindando orientación y respondiendo consultas sobre el recorrido universitario.

ENCUENTROS VIRTUALES

Consultá los horarios de los encuentros con los directores de carrera del segundo semestre 2026$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/teacompa%C3%B1amos$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$oferta-academica$pea0$), null, 0, $pea0$ln-test-de-autorregulacion-del-aprendizaje$pea0$,
        $pea0$¿Qué es el Test de Autorregulación del Aprendizaje?$pea0$, $pea0$El test de Autorregulación es un test que podrás realizar cuando curses la materia Aprender en el siglo 21 en tu Aula Virtual (Canvas).$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/post/test-de-autorregulacion-del-aprendizaje el 2026-11-09. Revisalo antes de publicar.

El test de Autorregulación es un test que podrás realizar cuando curses la materia Aprender en el siglo 21 en tu Aula Virtual (Canvas).

Este test cuenta con 4 secciones correspondiente a las etapas del proceso de aprendizaje **Planificación>Ejecución-La procastinación** >**Ejecución-Técnicas de estudio>Monitoreo**.

Es necesario que respondas las 4 secciones para finalizar el test y obtener tu Perfil de aprendizaje y algunas recomendaciones vinculadas a ese perfil.

Además podrás leer recomendaciones generales sobre cada etapa.

Para conocer cuál es tu Perfil de Aprendizaje deberás ingresar a **Perfil 21** desde tu **Portal de Estudiante**.

Una vez que estés en **Perfil 21,** debes ingresar a la pestaña **Mis intereses**.

En este espacio podrás conocer cuál es tu **Perfil de Aprendizaje**.

Los perfiles que podes encontrar son:

**Mirá este vídeo y descubrí más sobre el**

**Test de Autorregulación**

### Comentarios$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/post/test-de-autorregulacion-del-aprendizaje$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$oferta-academica$pea0$), null, 0, $pea0$ln-tipos-de-materias$pea0$,
        $pea0$Tipos de Materias$pea0$, $pea0$¿Cómo ver la tipología de materias?$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/tipos-de-materias el 2026-11-08. Revisalo antes de publicar.

#### Tipos de materias

¿Cómo ver la tipología de materias?

Materias Programáticas

Materias de Proceso

#### ¿Cómo ver la Tipología de Materias?

Existen diferentes requisitos para alcanzar las condiciones de Regularidad y Promoción. Estos varían de acuerdo a la modalidad de cursado que tengas, la estructura curricular y tipología de materia

Para conocer cual es la tipología de tu materia deberás ingresar a tu Portal de Estudiantes, hacer click en tu Carrera y revisar las Materias. Arriba de cada una de ellas, vas a poder ver si se trata de una materia MEC, MIA, MIP o MAP.

#### Mirá el vídeo y conocé cómo ver la tipología de tu materia

Elegí tu modalidad y tipología y revisá el esquema del período

### Materia

### MIP

Botón

### Entregá tu TP 1 antes de la semana 5

### y tu TP 2 antes de la semana 9

### Entregá tu TP 3 antes de la semana 12

### y tu TP 4 antes de la semana 16

### Semana

### 2

### 4

### 6

### 8

### 10

### 12

### 14

### 16

### 18

### SEGUNDO PARCIAL

### De la semana 10 a la 17

### Necesitás inscribirte para rendir

### PRIMER PARCIAL

### De la semana 1 a la 8

### Antes del inicio

- Buscá la bibliografía
- Revisá las condiciones
- Planificá tus objetivos

### RECUPERATORIO O INTEGRADOR

### MEC

Botón

### Entregá tu TP 1 y TP 2

### antes de la semana 5

### Entregá tu TP 3 y TP 4

### antes de la semana 8

### 1

### 3

### 5

### 7

### 9

### De la semana 5 a la 8

### De la semana 1 a la 4

- Buscá la bibliografía
- Revisá las condiciones
- Planificá tus objetivos

### MIA

Botón

### Entrega tu TP 1 antes de la semana 4

### y tu TP 2 antes de la semana 5

### Entregá tu TP 3 antes de la semana 7

### y tu TP 4 antes de la semana 8

- Buscá la bibliografía
- Revisá las condiciones
- Planificá tus objetivos

#### Materias Programáticas

Las tipologías que se puede encontrar en las materias Programáticas son:

MEC

MIA

MIP

MAP

#### Materias de exploración y conceptualización (MEC):

Es una materia programática, de duración bimestral o cuatrimestral según tu modalidad, que contempla la realización de 4 trabajos prácticos de corrección automática.

La calificación de los TPs estará compuesta de dos elementos:

1) La actividad académica, es decir la calificación en base a las respuestas que des en el desarrollo de la evaluación.

2) La Valoración de Tiempo de Entrega, que significa la presentación del TP en tiempo establecido en el calendario académico.

#### ¿Qué es la Valoración de Tiempo de Entrega?

La Valoración de Tiempo de Entrega define los términos y condiciones aplicables cuando los TPs no son entregados dentro del plazo estipulado en el calendario académico.

Consiste en una reducción en la calificación obtenida en el TP entregado fuera de plazo.

Para esto, vas a tener en la plataforma 3 fechas diferentes:

-Fecha de Inicio de Periodo: Es la fecha desde la cual podes realizar tus TPs.

-La Fecha de Entrega: Esta es la última fecha que tenes disponible para entregar el TP sin que se aplique la Valoración de Tiempo de Entrega.

-Fecha Fin de Periodo: Es la última oportunidad que tenes para entregar el TP, ya que luego de esta, el sistema se bloquea y no admite más presentaciones.

Se van a descontar 5 puntos en Canvas por cada día que transcurra entre la Fecha de Entrega y la Fecha en la que presentaste tu TP.

Si presentaste tu TP entre estas fechas, no se aplica la Valoración de Tiempo de Entrega y tu Calificación será la que obtuviste en Canvas.

Si presentaste tu TP entre estas fechas, se aplica la Valoración de Tiempo de Entrega y a tu Calificación se le descontará 5 puntos por día de atraso.

#### Fecha
Inicio Periodo

#### Fecha
de Entrega

#### Fecha
Fin de Periodo

IMPORTANTE:

No se descontaran mas de 50 puntos por entregar tu TP fuera de plazo. Esto quiere decir, que la nota final no será menor a 5 a causa de la Valoración de Tiempo de Entrega, por lo que tu TP no quedará desaprobado por este motivo.

#### Materias de integración y aplicación (MIA):

Es una materia programática, de duración bimestral o cuatrimestral según tu modalidad, que contempla la realización de 4 trabajos prácticos a desarrollar que serán corregidos de manera manual por parte de un docente y que tienen distintas fechas de vencimiento durante el periodo.

Los trabajos prácticos tienen consignas abiertas, lo que posibilitan un enfoque práctico y crítico y, al mismo tiempo, una evaluación más detallada y personalizada por parte de los docentes.

#### Materias de intervención profesional (MIP)

Es una materia de duración cuatrimestral para todas las modalidades, que contempla la realización de 4 trabajos prácticos que podrán tener corrección manual por parte de un docente y que tienen distintas fechas de vencimiento a lo largo del periodo.

En este tipo de materias te vas a encontrar con consignas abiertas de progresiva complejidad y a través del intercambio en foros, vas a poder crear soluciones que integren los conocimientos específicos de la formación profesional con situaciones hipotéticas o reales del mundo social y productivo.

#### Materias de aplicación pre-profesional (MAP)

Es una materia de duración bimestral o cuatrimestral. Te permitirán aplicar los conocimientos teóricos en un entorno práctico, acercarte al contexto laboral de tu profesión y fortalecer competencias como la comunicación, liderazgo y resolución de problemas. Las MAP están divididas en tres niveles de intervención:

Intervención Básica: Primer contacto con el mundo laboral mediante observación de situaciones reales o simuladas.

Intervención Intermedia: Aplicación de conocimientos en contextos reales a través de proyectos como el PAT, PIC y SEC, colaborando con profesionales activos.

Intervención Avanzada: Aplicación de competencias en desafíos reales, vinculándote con organizaciones del sector público, privado o ONGs.

Cada nivel te ayudará a incrementar tu autonomía y responsabilidad, preparándote para tu futura carrera profesional.

El cursado se compone de 4 trabajos prácticos de realización automática y 2 actividades evaluativas pre-profesionales a desarrollar.

#### Materias de Proceso

Las Materias de Proceso tienen la finalidad de integrar los contenidos específicos y las competencias profesionales, vinculando los conocimientos con la realidad práctica, a partir del análisis global de situaciones simuladas y/o de la inmersión en organizaciones donde se pone en juego la transferencia de conocimientos teóricos a la realidad.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/tipos-de-materias$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-tp-modalidad-presencial$pea0$,
        $pea0$¿Cómo son los TPs en la modalidad Presencial, Presencial Home y Presencial Distribuida?$pea0$, $pea0$En la modalidad PRESENCIAL, tanto P, PH y PD, encontraremos:$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/post/tp-modalidad-presencial el 2026-11-09. Revisalo antes de publicar.

En la modalidad PRESENCIAL, tanto P, PH y PD, encontraremos:

- Actividades Evaluativas en espacio áulico
- TPs de Corrección Automática (Canvas)
- Parciales

| Al comienzo del cursado de la materia, tu docente te compartirá el acuerdo pedagógico, las actividades evaluativas de proceso a desarrollar junto a las fechas de presentación de cada una. |
| --- |

**¿Cómo será la calificación final de los Trabajos Prácticos en las materias?**

**Las calificaciones obtenidas en las Actividades Evaluativas de Proceso en los entornos áulicos y las calificaciones obtenidas en los Trabajos Prácticos de tu Aula Virtual (Canvas) darán como resultado el cálculo final** de cada una de las instancias evaluativas a partir de lo establecido en el contrato pedagógico.

****

****

**¿Dónde se encuentran las consignas de las Actividad Evaluativas de Proceso?**

Las consignas de cada Actividad Evaluativa de Proceso en las materias serán compartidas por el/la docente en el espacio áulico presencial junto con los criterios de evaluación y la fecha límite para su entrega.

### Comentarios$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/post/tp-modalidad-presencial$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$tramites$pea0$), null, 0, $pea0$ln-trabajos-practicos$pea0$,
        $pea0$TRABAJOS PRÁCTICOS | La Nube 21$pea0$, $pea0$Los trabajos prácticos (TP) son una de las actividades más relevantes dentro de la plataforma, ya que integran los contenidos desarrollados en cada uno de los módulos de las materias.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/trabajos-practicos el 2026-11-08. Revisalo antes de publicar.

#### Todo sobre los
Trabajos Prácticos

Los trabajos prácticos (TP) son una de las actividades más relevantes dentro de la plataforma, ya que integran los contenidos desarrollados en cada uno de los módulos de las materias.

Su realización es clave para alcanzar la regularidad y/o promoción de la materia, de acuerdo con tus condiciones de cursado.

Conocé cómo se realizan los trabajos prácticos según cada tipología de materia.

¿Cómo ingresar a los TPs?

TPs Materias

MEC

TPs Materias

MIA

TPs Materias

MIP

TPs Materias

MAP

#### ¿CÓMO INGRESAR A LOS TRABAJOS PRÁCTICOS?

- Aula Virtual (CANVAS):

Los Trabajos Prácticos se encuentran disponibles dentro del Aula Virtual (Canvas) de cada materia. Para acceder, es necesario ingresar a la materia correspondiente y dirigirse a la página principal. Allí vas a encontrar el botón “Comenzar”, que te permitirá acceder a los distintos módulos que conforman la materia.

Una vez que ingreses en el costado superior izquierdo, vas a poder ver en qué módulo y materia estás.

Para ingresar a realizar el TP, debes hacer click en Trabajo Práctico, sobre el margen superior de cada aula abierta.

Cuando ingreses aquí, leé con atención los 3 puntos que se te presentan:

- Objetivo de la actividad
- Enunciado
- Preguntas

Las preguntas que deberás responder, se basan en estos 3 puntos, por lo que es muy importante que los leas con detenimiento.

Cuando hayas terminado, hacé click en Realizar Examen.

#### MATERIAS MEC

Los TP´s en las materias MEC, se corrigen automáticamente y los podes hacer todas las veces que quieras.

El sistema guarda la última calificación.

Si cursas Abogacía, Contador Público o Lic. en Informática, tu TP 3 y TP4 de las materias MEC tendrán un Camino de Dominio.

¿QUE ES EL CAMINO DE DOMINIO?

En el TP 3 y TP 4, antes de realizar tu actividad, deberás completar una fase diagnóstico, también llamado Camino de dominio. Este diagnóstico te va a permitir acceder a un TP básico o avanzado.

Ese TP al cual te lleve el camino de dominio, es el que debes cumplimentar para aprobar la actividad.

IMPORTANTE:

Si sólo realizas el cuestionario de diagnóstico y no el TP, la actividad te quedará como No realizada y sin calificación.

#### Valoración de Tiempo de Entrega (sólo para materias MEC)

La Valoración de Tiempo de Entrega define los términos y condiciones aplicables cuando los TPs no son entregados dentro del plazo estipulado en el calendario académico.

Esta valoración, será aplicable solamente en el caso de las materias con tipología MEC y consiste en una reducción en la calificación obtenida en el TP entregado fuera de plazo.

Para esto, vas a tener en la plataforma 3 fechas diferentes:

-Fecha de Inicio de Periodo: Es la fecha desde la cual podes realizar tus TPs.

-La Fecha de Entrega: Esta es la última fecha que tenes disponible para entregar el TP sin que se aplique la Valoración de Tiempo de Entrega.

-Fecha Fin de Periodo: Es la última oportunidad que tenes para entregar el TP, ya que luego de esta, el sistema se bloquea y no admite más presentaciones.

Se van a descontar 5 puntos en Canvas por cada día que transcurra entre la Fecha de Entrega y la Fecha en la que presentaste tu TP.

Si presentaste tu TP entre estas fechas, no se aplica la Valoración de Tiempo de Entrega y tu Calificación será la que obtuviste en Canvas.

Si presentaste tu TP entre estas fechas, se aplica la Valoración de Tiempo de Entrega y a tu Calificación se le descontará 5 puntos por día de atraso.

#### Fecha
Inicio Periodo

#### Fecha
de Entrega

#### Fecha
Fin de Periodo

#### Si tu modalidad es Presencial, Presencial Home ó Presencial Distribuida

#### Mirá cómo entregar tus TPs

#### Ingresá acá

IMPORTANTE:

No se descontaran mas de 50 puntos por entregar tu TP fuera de plazo. Esto quiere decir, que la nota final no será menor a 5 a causa de la Valoración de Tiempo de Entrega, por lo que tu TP no quedará desaprobado por este motivo.

#### ¿Cómo se ve en Canvas el descuento de puntos?

Cuando realizas la entrega de tu TP luego de que pasó la Fecha de Entrega, si ingresas a tu Libreta de Calificaciones en Canvas vas a ver reflejada esta situación en la columna Estado.

En esta columna se te va a indicar que la entrega se hizo con atraso, sin embargo el puntaje que ves aquí, es el puntaje final de esa última entrega que realizaste, con el descuento ya aplicado.

Para ver el detalle de la calificación y el descuento por la valoración de tiempo de entrega, deberás ingresar a los detalles de la entrega del TP. Allí vas a ver la fecha en la que hiciste esa última entrega, la calificación original, el descuento de puntos y la calificación final.

### MATERIAS MIA

En las materias con tipología MIA, la calificación de los TPs está a cargo del docente, según el diseño que tenga cada actividad. Estos trabajos, pueden presentarse en una única oportunidad, de acuerdo al calendario académico estipulado y no tienen recuperatorio.

En el siguiente vídeo te explicamos, cómo se entregan los TPs 1 y 4 de las materias MIA.

¿CÓMO SE HACEN LOS TRABAJOS PRÁCTICOS 1 Y 4?

¿CÓMO SE HACEN LOS TRABAJOS PRÁCTICOS 2 Y 3?

En las materias con tipología MIA, tanto el TP 2 como el TP 3, son de entrega, producción y evaluación individual, pero requieren para su realización y aprobación como condición obligatoria la participación en el espacio de FORO DE DISCUSIÓN GRUPAL de cada TP respectivamente.

Estos trabajos son corregidos por los docentes de la Universidad, pueden presentarse en una única oportunidad, previo a las fechas de vencimiento que figuran en el calendario académico.

Mirá el paso a paso para conocer cómo se elaboran estos trabajos

PASO 1:

Ponete en contacto con tus compañeros de grupo. Para ello deberás ingresar al botón grupos de tu Aula Virtual (Canvas) y luego en Personas, ahí podrás ver quiénes son los demás integrantes de tu equipo.

PASO 2:

Leé las consignas del trabajo práctico e ingresa a Foro de discusión para dejar tus aportes.

Es muy importante que sepas que, si entregas el TP2 o el TP 3 sin haber participado PREVIAMENTE en el FORO DE DISCUSIÓN GRUPAL, tu calificación será de UNO (1) para ese TP SIN EXCEPCIÓN. Por eso, te recomendamos respetar las consignas y su orden para tener los mejores resultados.

Tené en cuenta que los aportes de tus compañeros de grupo, te serán de gran utilidad para la construcción y respuesta a los puntos que debes entregar de manera individual y que la extensión máxima para la una participación en los foros es de 1500 caracteres. NO los excedas.

PASO 3:

Solo si ya has realizado tus aportes en el FORO DE DISCUSIÓN GRUPAL y revisado los aportes de tus compañeros, llegó el momento de que realices el TP, que es de construcción y entrega individual y deberás entregar en el espacio identificado como entregar tarea.

### MATERIAS MIP

¿CÓMO SE ENTREGAN LOS TRABAJOS PRÁCTICOS 1 Y 3?

En las materias con tipología MIP, tanto el TP 1 como el TP 3, son de entrega, producción y evaluación individual, pero requieren para su realización y aprobación como condición obligatoria la participación en el espacio de FORO DE DISCUSIÓN GRUPAL de cada TP respectivamente.

Estos trabajos son corregidos por los docentes de la Universidad, pueden presentarse en una única oportunidad, previo a las fechas de vencimiento que figuran en el calendario académico.

Mirá el paso a paso para conocer cómo se elaboran estos trabajos

PASO 1:

Ponete en contacto con tus compañeros de grupo. Para ello deberás ingresar al botón grupos de tu Aula Virtual (Canvas) y luego en Personas, ahí podrás ver quiénes son los demás integrantes de tu equipo.

PASO 2:

Leé las consignas del trabajo práctico e ingresa a Foro de discusión para dejar tus aportes.

Es muy importante que sepas que, si entregas el TP1 o el TP 3 sin haber participado PREVIAMENTE en el FORO DE DISCUSIÓN GRUPAL, tu calificación será de UNO (1) para ese TP SIN EXCEPCIÓN. Por eso, te recomendamos respetar las consignas y su orden para tener los mejores resultados.

Tené en cuenta que los aportes de tus compañeros de grupo, te serán de gran utilidad para la construcción y respuesta a los puntos que debes entregar de manera individual y que la extensión máxima para la una participación en los foros es de 1500 caracteres. NO los excedas.

PASO 3:

Solo si ya has realizado tus aportes en el FORO DE DISCUSIÓN GRUPAL y revisado los aportes de tus compañeros, llegó el momento de que realices el TP, que es de construcción y entrega individual y deberás entregar en el espacio identificado como entregar tarea.

¿CÓMO SE ENTREGAN LOS TRABAJOS PRÁCTICOS 2 Y 4?

Los TPs 2 y 4 de las materias con tipología MIP, se realizan y entregan de manera INDIVIDUAL.

Estos trabajos, pueden presentarse en una única oportunidad, de acuerdo al calendario académico estipulado y no tienen recuperatorio.

Para ingresar a hacer estos TPs debes hacer click en Trabajo Práctico.

Allí te vas a encontrar con el objetivo, enunciado y consignas de la actividad. Después de leer toda esta información hacé click en Empezar Tarea.

Cargá tu archivo y hacé click en Entregar Tarea$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/trabajos-practicos$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-tuprimersemestre$pea0$,
        $pea0$SOY INGRESANTE | La Nube 21$pea0$, $pea0$Queremos acompañarte desde el inicio y brindarte la información clave para que comiences tu camino universitario con claridad y confianza. Lee atentamente toda la información.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/tuprimersemestre el 2026-11-08. Revisalo antes de publicar.

### ¡Te damos la Bienvenida! Recorré tus primeros pasos en la Universidad.

Queremos acompañarte desde el inicio y brindarte la información clave para que comiences tu camino universitario con claridad y confianza. Lee atentamente toda la información.

### RECORRÉ TUS PRIMEROS PASOS EN LA UNIVERSIDAD

A continuación, te proponemos una guía paso a paso con todo lo que necesitás revisar para comenzar tu cursada.

Cada tarjeta corresponde a una acción importante: desde acceder a tus plataformas hasta conocer tu modalidad y las fechas clave. Te sugerimos recorrerlas en orden para organizarte mejor desde el inicio.

Asistí al

IVU

#### VER MÁS

Entrá a tus

PLATAFORMAS

Revisá tu

MODALIDAD

Consultá tu

RUTA ACADÉMICA

Mirá tu

CRONOGRAMA

Centro de Profesores Tutores Virtuales

#### Despegue 21: Introducción a la Vida Universitaria (IVU)

Representa el primer hito académico para todo estudiante ingresante y tiene como objetivo aportar valor y sentido a la experiencia universitaria en Siglo 21.

Durante este espacio, vas a conocer cómo funciona la Universidad, el modelo de cursado que elegiste, el sistema de evaluación y los accesos a las distintas plataformas informáticas que vas a utilizar a lo largo de tu carrera.

Es una actividad obligatoria.

Se realiza una única vez en el CAU o Sede donde vas a cursar tu Carrera.

Tu CAU o SEDE te enviará la invitación con el día y horario.

¿Qué vas a conocer?

- Las plataformas que vas a usar todos los días para estudiar, cursar y gestionar tu Carrera.
- Información académica clave: cómo se estructura tu Carrera, cómo se aprueban las materias y cómo consultar el calendario de cursado.
- Herramientas y recursos útiles que te van a ayudar a resolver tus dudas, planificar tus tiempos y mantenerte al tanto de lo que necesitás.
- Espacios y propuestas de bienestar, acompañamiento y experiencias que hacen a la vida universitaria más allá del estudio.

Despegue 21 es tu punto de partida para empezar con claridad, confianza y toda la información necesaria para transitar tu vida universitaria.

#### Revisá tu modalidad

Es importante que conozcas tu modalidad de cursado, ya que de ella dependen la forma en que vas a estudiar, cómo se desarrollan las clases y qué espacios se habilitan en la plataforma.

Cada modalidad tiene una organización diferente, por lo que identificar la tuya te va a permitir acceder correctamente a los contenidos, participar de las actividades académicas y seguir tu cursada sin inconvenientes.

Actualmente contamos con cinco modalidades de cursado:

Distribuida (ED)

[MÁS INFO](https://www.lanube.21.edu.ar/modalidad-ed)

Cursás principalmente de forma virtual, con materiales, clases grabadas y actividades en el Aula Virtual (Canvas). Además, vas a tener encuentros presenciales obligatorios en tu CAU.

[MÁS INFO](https://www.lanube.21.edu.ar/modalidad-edh)

Distribuida Home (EDH)

Todo el cursado se realiza desde casa, sin necesidad de asistir al CAU. Vas a contar con clases sincrónicas (en vivo) y asincrónicas (grabadas), materiales interactivos y acompañamiento docente virtual.

Presencial Distribuida

Cursás en tu CAU o sede a través de aulas equipadas con tecnología de telepresencia. Te conectás en tiempo real con tu docente y aprendés en un entorno cercano, dinámico y acompañado.

[MÁS INFO](https://www.lanube.21.edu.ar/presencialidad-distribuida)

Presencial Home

Vas a combinar clases presenciales en aula con actividades virtuales a través de plataformas digitales. Todas las materias se desarrollan en un entorno educativo mediado por tecnologías.

[MÁS INFO](https://www.lanube.21.edu.ar/modalidad-presencial-home)

Presencial

[MÁS INFO](https://www.lanube.21.edu.ar/modalidad-presencial)

Vas a asistir a clases en una sede de forma regular, con días y horarios establecidos. Además, vas a complementar tu cursada con recursos digitales y actividades en el Aula Virtual (CANVAS).

#### Plataformas

Conocé las plataformas que vas a utilizar durante tu cursado

Ingresá en cada botón y para conocer cómo utilizarlas.

### PORTAL ESTUDIANTES

Desde acá gestioná tu cursado, consultá tus inscripciones a parciales y materias.

Conocé más >

### AULA VIRTUAL (canvas)

Acá podés acceder al contenido académico y comunicarte con tus docentes.

Conocé más >

### SOE (KLARWAY)

Es la aplicación por donde vas a rendir tus exámenes parciales y finales.

Conocé más >

### APP

Desde la App podés gestionar tu cursado en tu celular.

Conocé más >

### E-BOOK

Accedé a la biblioteca virtual.

Conocé más >

#### Tu Ruta Académica

Estos son los pasos que debés seguir para iniciar y gestionar tu semestre de forma correcta.​​ Asegurate de completar cada paso para cumplir con tus responsabilidades académicas.

### Accedé a tu Aula Virtual (CANVAS)

Es el primer espacio que debés conocer: allí encontrarás tus materias, podrás comunicarte con tus docentes y acceder al contenido académico

✔ Explorá las materias

✔ Accedé a los 4 módulos principales de cada una.

### Mirá cómo acceder a tu Aula desde acá

### Revisá tu Calendario

### Verificá cuando rendis

### Comunicate con tu Docente

### Realizá tus Trabajos Prácticos

Cada docente es tu principal guía. Ellos te orientan sobre el cursado, entregas y dudas.

✔ Revisá quién es tu docente en cada materia

✔ Usá la mensajería para comunicarte con tus docentes.

### Mirá cómo comunicarte acá

### Tutores

### Virtuales

Los TPs son obligatorios en cada materia

✔Tenés 4 TPs por materia.

✔ Revisá las fechas de entrega.

✔ Hacelos en tu Aula Virtual (Canvas)

### Hacé clic acá y mirá todo lo que necesitas saber sobre tus TPs

Te acompañan en tu primer año universitario.

✔Te brindan orientación, apoyo y herramientas para organizar tu estudio.

✔ Te ayudan a adaptarte al cursado y avanzar con confianza en tu carrera.

Es tu mapa del semestre. Incluye fechas importantes: entregas, parciales, finales y cierres.

✔ Buscá el calendario según tu modalidad

✔ Organizá tus tiempos desde ahora.

### Elegí tu modalidad y mirá tu Calendario acá

Esta instancia es obligatoria.

✔ Tenés 2 parciales por materia.

✔ Si sos alumno Presencial, Presencial Home o Presencial Distribuida revisá las fechas en tu Portal Estudiantes.

✔ Si sos alumno distancia inscribite con al menos 24 hs de anticipación.

### Hacé clic acá y revisá todo sobre tus parciales

#### Antes de empezar: Módulo 0

El Módulo 0 es un programa preparatorio digital dentro de tu Aula Virtual (Canvas), que se habilita en determinadas materias, diseñado para que llegues al inicio de clases con más claridad y seguridad.

Antes de que comience la cursada, vas a encontrar lecturas guiadas, actividades prácticas y recursos que te ayudan a fortalecer conceptos clave que vas a necesitar durante el cuatrimestre.

Al cursarlo vas a:

- Comprender mejor los temas centrales desde el primer día.
- Construir una base sólida de conocimientos.
- Organizar tu estudio con anticipación.
- Ganar seguridad para avanzar con tu cursada.

### Mirá toda la información acá

#### Revisá el Calendario Académico

El Calendario Académico es tu guía de ruta para todo el año. Ahí vas a encontrar las fechas más importantes de tu cursado, como:

- Inicio y fin de clases.
- Fechas de parciales y recuperatorios.
- Entregas de trabajos prácticos.
- Períodos de inscripción a exámenes finales.
- Fechas de receso y feriados.

- Recomendaciones:

Revisá tu calendario al menos una vez por semana para asegurarte de no pasar por alto fechas clave.

Si una fecha ya pasó, enfocáte en la próxima actividad para mantenerte al día.

Podés imprimirlo o agregarlo a Google Calendar para recibir alertas automáticas.

#### CALENDARIO MODALIDAD
DISTANCIA

#### CALENDARIO MODALIDAD
PRESENCIAL HOME

#### CALENDARIO MODALIDAD
PRESENCIAL

#### CALENDARIO MODALIDAD
PRESENCIAL DISTRIBUIDA

Además te comentamos que, a partir de este momento vas a comenzar a recibir información importante por mail sobre:

- Fechas y horarios de actividades.
- Novedades académicas.
- Recordatorios y avisos institucionales.

IMPORTANTE:

Debes revisar y leer todos los mensajes que recibas de la Universidad. Esto asegura que no te pierdas información clave para tu cursado.$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/tuprimersemestre$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$atencion-y-derivaciones$pea0$), null, 0, $pea0$ln-tutoresvirtuales$pea0$,
        $pea0$Tutores Virtuales$pea0$, $pea0$El Centro de Profesores Tutores Virtuales (CPV) te acompaña en tu primer año universitario, brindándote orientación, apoyo y herramientas para organizar tu estudio, adaptarte al cursado y avanzar c…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/tutoresvirtuales el 2026-11-08. Revisalo antes de publicar.

#### Conocé el centro de 
Profesores Tutores Virtuales

El Centro de Profesores Tutores Virtuales (CPV) te acompaña en tu primer año universitario, brindándote orientación, apoyo y herramientas para organizar tu estudio, adaptarte al cursado y avanzar con confianza en tu carrera.

El Centro de Profesores Tutores Virtuales (CPV) funciona como un puente entre vos, el docente experto y la Universidad. Te acompañamos en tus primeros pasos para que tu integración académica sea clara, ordenada y sin dificultades. Nuestro objetivo es que inicies tu cursado de la mejor manera, con el apoyo que necesitás.

¿Qué podes consultar con tu Profesor Tutor Virtual?

El Profesor Tutor Virtual está para acompañarte durante tu primer año en la Universidad. Podés acudir con todo tipo de consultas relacionadas con tu cursado, organización, uso de la plataforma y dudas sobre el modelo de aprendizaje.

Tené en cuenta que las consultas sobre el contenido específico de cada asignatura deben dirigirse al docente a cargo a través de la mensajería de tu Aula Virtual (Canvas).

#### Talleres POTENCIAR 21

Te invitamos a participar de los Talleres Potenciar 21, un espacio pensado para acompañarte en el desarrollo de habilidades clave para tu cursado.

A través de estos encuentros vas a poder incorporar herramientas prácticas, mejorar tus hábitos de estudio y organizarte de manera más efectiva para avanzar con seguridad en tu recorrido académico.​​

#### Explorá los talleres disponibles e inscribite en el que mejor se adapte a tus necesidades:

#### Horarios de consulta

Hacé clic en el horario para ingresar a la consulta por Teams.

#### Espacios de encuentro

¿Dónde nos encontrás?

Estamos con vos en cada materia de tu Aula Virtual (Canvas). Podés escribirnos desde la mensajería del menú principal en la opción “Bandeja de Entrada”, para recibir acompañamiento.

En la sección anuncios de tus materias vas a encontrar siempre el cronograma de los Talleres POTENCIAR 21 y los horarios de consulta.

1

Ingresá a tu Aula Virtual (Canvas) y hacé clic en el menú lateral en “Tablero”. Luego seleccioná la materia que quieras abrir.

#### Experiencias de estudiantes
Conocé cómo acompañamos tu recorrido académico en cada etapa.

“Todo el material me ayudó muchísimo. ¡Aprobé el final con 8! Muy agradecida por las herramientas brindadas.”

María Cristina 

EFIP I (Abogacía)

“Buen día, Sofía. Estoy muy contenta: aprobé el segundo examen y, en consecuencia, la materia de Tecnologías. Quería agradecerte por tus recomendaciones y tu dedicación; todo me ha servido para llegar a este resultado. Muchas gracias.”

Liliana

Tecnicatura en Investigación de la Escena del Crimen

“¡Muchísimas gracias! Era mi primer desafío y estaba asustada porque no veía la nota. Finalmente obtuve un 9 en el TP1. ¡Estoy feliz! Gracias por todo.”

Florencia Lújan

Martillero, Corredor Público y Corredor Inmobiliario

“Gracias por la oportunidad de retomar los TP 1 y 2. Me permitió volver a encaminarme y avanzar hacia la regularidad.”

Juan Cruz

Licenciatura en Informática$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/tutoresvirtuales$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$oferta-academica$pea0$), null, 0, $pea0$ln-universitarios21$pea0$,
        $pea0$Universitarios 21 | La Nube 21$pea0$, $pea0$UNIVERSITARIOS 21 es el programa de ingreso que la Universidad Siglo 21 ofrece a todos los y las estudiantes ingresantes de las carreras de Grado o Pregrado, para que conozcas nuestro modelo académ…$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/universitarios21 el 2026-11-08. Revisalo antes de publicar.

#### UNIVERSITARIOS 21

UNIVERSITARIOS 21 es el programa de ingreso que la Universidad Siglo 21 ofrece a todos los y las estudiantes ingresantes de las carreras de Grado o Pregrado, para que conozcas nuestro modelo académico durante el primer trayecto de tu carrera.​

Este espacio se compone de dos materias que se cursan en el primer semestre de la carrera, según la modalidad de estudio que hayas elegido. Las materias son: Aprender en el Siglo 21 y Tecnología, Humanidades y Modelos Globales.

Aprender en el Siglo 21

Tecnología, Humanidades y Modelos Globales

IMPORTANTE:

Para poder inscribirse a cursar materias del 4° cuatrimestre de tu plan de estudios deberás tener aprobadas las materias que componen Universitarios 21.

En ningún caso el reconocimiento de materias externas implicará la eximición del cursado y aprobación de UNIVERSITARIOS 21.

#### ¿Cómo se aprueban las materias de Universitarios 21?

Las materias de Universitarios 21 se cursa y evalúa con idénticas reglas y condiciones que las materias curriculares correspondientes al plan de estudios de cada carrera, conforme a tu modalidad de cursado. Lo mismo aplica para la condición de aprobación y vigencia de la regularidad.

#### Eximición de materias Universitarios 21

Quienes cuenten con cinco (5) o más materias aprobadas en su legajo Siglo, ya sea por reconocimiento de equivalencias externas o por la combinación de materias reconocidas por equivalencias externas y materias cursadas en Universidad Siglo 21, serán eximidos del cursado de las materias de Universitarios 21 Aprender en Siglo 21 y Tecnología, Humanidades y Modelos Globales (CUR027 / CUR028), conforme a lo establecido por la Resolución del Consejo Superior N.º 1256/2026.

#### APRENDER EN EL SIGLO 21

Es una materia que busca acompañarte, desde el primer día en este desafío de emprender un proyecto, una carrera.

Por eso, el eje principal de la misma es trabajar con vos en la capacidad para autorregular el aprendizaje, componente clave y de gran impacto en el comportamiento académico.

Sabemos que los estudiantes que mejores resultados alcanzan no son los que los asisten simplemente a clases y cumplen con las tareas sino que son los que se apropian de su proceso de estudio y se sienten dueños de su proceso de aprendizaje.

#### Parte de la bibliografía de esta materia es nuestro Reglamento Institucional

#### Consultalo Acá

En esta materia vas a encontrar inspiración y orientación para fortalecer tu autoconfianza, cumplir tus objetivos de formación, adquirir y desarrollar competencias blandas y socioemocionales, para afrontar los desafíos de un mundo en constante cambio.

#### Principales ejes de la materia

- Autorregulación y PERMA
- Desafíos Profesionales y Personales
- Siglo XXI y las nuevas demandas en el aprendizaje

#### ¿Cómo hacer el test de Autorregulación?

#### CONOCÉ MÁS

#### TECNOLOGÍA, HUMANIDADES Y MODELOS GLOBALES

Esta materia te propone romper modelos mentales, apropiarte del uso de las tecnologías, identificar nuevas oportunidades, establecer acciones y enfocar las mismas en soluciones innovadoras. Es decir, te ayudará a generar competencias que te facilitaran la formación profesional para actuar en el mundo de hoy.

- Comprensión histórica de las revoluciones
- Dimensión económica y social
- Desafíos para el futuro$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/universitarios21$pea0$)
on conflict (categoria_id, slug) do nothing;

insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = $pea0$institucional$pea0$), null, 0, $pea0$ln-uso-de-espacios$pea0$,
        $pea0$USO DE ESPACIOS| La Nube 21$pea0$, $pea0$Queremos que cuando asistas a cualquiera de las instalaciones que conforman Universidad Siglo 21 disfrutes de la mejor experiencia junto a tus compañeros/as y docentes.$pea0$, $pea0$> **A validar:** contenido relevado de https://www.lanube.21.edu.ar/uso-de-espacios el 2026-11-09. Revisalo antes de publicar.

#### ¿Cómo habitar nuestros espacios?

Queremos que cuando asistas a cualquiera de las instalaciones que conforman Universidad Siglo 21 disfrutes de la mejor experiencia junto a tus compañeros/as y docentes.

Para ello, al transitar por espacios comunes, tené en cuenta respetar las normas de convivencia y mantener los buenos hábitos que definen la cultura de la comunidad Siglo 21.

Si cursás en Sede Campus o vas a visitarla pronto, te sugerimos revisar los buenos hábitos y normas de convivencia para disfrutar al máximo de la Universidad.

[Espacios Comunes](https://www.lanube.21.edu.ar/uso-de-espacios)

[Edificios Campus](https://www.lanube.21.edu.ar/uso-de-espacios)

[Salud y Bienestar y](https://www.lanube.21.edu.ar/uso-de-espacios)

Academia 21

En caso de asistir a otras Sedes o Centros de Apoyo Universitario, de igual manera te recomendamos leer estas normas para aplicarlas según corresponda en las distintas instalaciones que conforman la Universidad Siglo 21 a lo largo del país.

#### En espacios comunes

Seguí los siguientes consejos y disfrutá de los espacios comunes de la Universidad (aulas, salas de reunión, bar, espacios de exterior).

- Mantener la limpieza. Al finalizar el día, recoger los elementos utilizados y procurar dejar el espacio como fue recibido.
- Descartar los desechos, según corresponda, en los basureros dispuestos para diferenciar húmedos, papel y cartón y plástico.
- Comer solo en las áreas designadas para ello.
- Usar auriculares en reuniones virtuales o al escuchar música.
- Mantener un tono de voz moderado.
- No sacar ni mover mobiliario, equipos o materiales de aulas, laboratorios u oficinas. En caso de tener autorización, devolver todo al lugar original después de usarlo y seguir el proceso de registro.
- No pegar carteles en paredes, puertas u otras superficies que puedan dañarse. Si es necesario, hacerlo solo en los espacios designados o sobre superficies de vidrio.
- Cuidar los muebles de las aulas y oficinas (pupitres, cortinas). Si algo no funciona, comunícalo a la bedelía para solucionarlo.
- Apagar las luces cuando cierres o te vayas de una oficina/aula, al igual que los aires acondicionados.

#### En edificios de Sede Campus

Cuando curses o visites la sede por cualquier motivo, te recomendamos tener presente estas indicaciones.

- Respetar las pautas de convivencia indicadas para los [espacios comunes de la Universidad](https://www.lanube.21.edu.ar/uso-de-espacios).
- En el marco de una actividad, no solo académica, el referente del espacio asignado es el responsable de la apertura y cierre con llave del mismo, constituyéndose en la autoridad áulica responsable de su cuidado y seguridad, como así también del equipamiento y de los recursos que lo integran.
- No está permitido traspasar entre personas la llave de un aula y/o laboratorio. El retiro y devolución de la misma debe hacerse siempre desde la Mesa de Atención o Recepción del Edificio correspondiente, mediante el sistema de registro destinado a tal fin.
- No está permitido el ingreso y/o permanencia de estudiantes en aulas y laboratorios sin la presencia docente (incluidos recreos y/o al finalizar la clase).

#### En edificio de Salud y Bienestar y Academia 21

Para disfrutar este espacio de innovación y excelencia te pedimos procures respetar las siguientes recomendaciones.

Respetar las pautas de convivencia indicadas para los [espacios comunes de la Universidad](https://www.lanube.21.edu.ar/uso-de-espacios)[.](https://www.lanube.21.edu.ar/uso-de-espacios)​

Espacio MultiLab

• En MultiLab y espacios donde se usen insumos médicos, elementos punzo-cortantes o residuos biológicos, descartar los desechos en recipiente o en cesto de residuos correspondiente.

• No ingresar a aulas de práctica con bolsos ni mochilas. Utilizar los lockers para guardar elementos personales. Al ser estos de uso diario y compartido, retirar lo guardado al finalizar el día.

• Tratar los insumos y equipos con el máximo cuidado y precaución. No manipular equipos ni simuladores sin la supervisión de un/a docente.

• Mantener un tono de voz moderado.

• No consumir allí alimentos o bebidas, excepto en Laboratorio de Nutrición y Química.

• Tratar con cuidado y respeto los maniquíes, que son nuestros pacientes. Usar siempre guantes y no marcarlos con lapiceras.

• Respetar el orden y dejar todo en su lugar, tal como estaba al llegar.

• No sacar equipamiento de las aulas.

Espacio Co-Learning:

Es un espacio destinado a cocrear conocimiento, construir ideas, debatir y desarrollar proyectos a partir del encuentro, la exploración y el intercambio de experiencias y de conocimientos. Por ello no debe utilizarse como espacio de recreación y/o de descanso, como espacio para realizar actividades que impliquen elevar el tono de voz, consumir alimentos y bebidas, o cualquier otra actividad que distorsione el concepto del mismo.

Up$pea0$, 'global', 'borrador', $pea0$https://www.lanube.21.edu.ar/uso-de-espacios$pea0$)
on conflict (categoria_id, slug) do nothing;
