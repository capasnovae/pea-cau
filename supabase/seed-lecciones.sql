-- Generado por scripts/importar-lecciones.mts a partir de contenido/lecciones. No editar a mano.

-- Borradores "A validar": coordinación los revisa y publica (junto con sus artículos fuente).

insert into public.cursos (id, tipo, titulo, descripcion_md, alcance, estado)
values (md5('pea-curso:reglamento-esencial')::uuid, 'capacitacion', 'Reglamento esencial', $pea0$Lecciones cortas a partir del reglamento. A validar.$pea0$, 'global', 'borrador')
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values (md5('pea-modulo:Cursado')::uuid, md5('pea-curso:reglamento-esencial')::uuid, 1, $pea0$Cursado$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values (md5('pea-modulo:Evaluación (EVA 21)')::uuid, md5('pea-curso:reglamento-esencial')::uuid, 2, $pea0$Evaluación (EVA 21)$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values (md5('pea-modulo:Trámites')::uuid, md5('pea-curso:reglamento-esencial')::uuid, 3, $pea0$Trámites$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values (md5('pea-modulo:Egreso')::uuid, md5('pea-curso:reglamento-esencial')::uuid, 4, $pea0$Egreso$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values (md5('pea-modulo:Administración')::uuid, md5('pea-curso:reglamento-esencial')::uuid, 5, $pea0$Administración$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values (md5('pea-modulo:Plataformas y atención')::uuid, md5('pea-curso:reglamento-esencial')::uuid, 6, $pea0$Plataformas y atención$pea0$)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:01-requisitos-para-cursar')::uuid, md5('pea-modulo:Cursado')::uuid, 1, $pea0$Requisitos para cursar$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Hace falta conexión a Internet. Si no la tiene, debe informarlo a la Universidad para que evalúe su caso.","El correo electrónico que registra es el canal oficial: ahí llegan todas las notificaciones. Mantenerlo actualizado es su responsabilidad.","Para rendir exámenes virtuales o usar software especial necesita notebook con cámara y micrófono (Windows 10 o superior, o Mac Monterrey 12.6.3 o superior).","Seguir cursando depende de no tener sanciones académicas o administrativas."],"ejemplos":[{"consulta":"No me llegan los avisos de la facultad.","respuesta":"Que revise el correo que tiene registrado: es el canal oficial. Si cambió de mail, tiene que actualizarlo en sus datos."},{"consulta":"¿Puedo rendir el virtual desde la tablet?","respuesta":"No: para exámenes virtuales se pide notebook con cámara y micrófono, con Windows 10 o superior o Mac Monterrey 12.6.3 o superior."},{"consulta":"No tengo Internet en casa, ¿puedo cursar igual?","respuesta":"Tiene que informarlo a la Universidad, que evalúa si puede admitirlo o continuar."}],"ojo":["Una expulsión en otra universidad o instituto oficial inhabilita para cursar, salvo resolución del Rectorado.","En carreras que lo piden, el ambo o la chaquetilla es obligatorio y lo compra cada estudiante."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-2-5-requisitos-para-cursado$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:01-requisitos-para-cursar:1')::uuid, 'opcion_multiple', $pea0$Un alumno dice que no recibió un aviso importante. ¿Qué es lo primero que le pedís?$pea0$, $pea0$El correo registrado es el canal oficial de comunicación de la Universidad.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:01-requisitos-para-cursar')::uuid
where exists (select 1 from public.items where id = md5('pea-item:01-requisitos-para-cursar')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:01-requisitos-para-cursar:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:01-requisitos-para-cursar:1:1')::uuid, $pea0$Que espere a que se lo manden por WhatsApp.$pea0$, false, 1),
  (md5('pea-opcion:01-requisitos-para-cursar:1:2')::uuid, $pea0$Que revise el correo registrado y lo actualice si cambió.$pea0$, true, 2),
  (md5('pea-opcion:01-requisitos-para-cursar:1:3')::uuid, $pea0$Que pida un certificado de cursado.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:01-requisitos-para-cursar:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:01-requisitos-para-cursar:2')::uuid, 'verdadero_falso', $pea0$Para rendir un examen virtual alcanza con el celular.$pea0$, $pea0$Se pide notebook con cámara y micrófono que cumpla los requisitos técnicos.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:01-requisitos-para-cursar')::uuid
where exists (select 1 from public.items where id = md5('pea-item:01-requisitos-para-cursar')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:01-requisitos-para-cursar:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:01-requisitos-para-cursar:2:1')::uuid, $pea0$Verdadero$pea0$, false, 1),
  (md5('pea-opcion:01-requisitos-para-cursar:2:2')::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:01-requisitos-para-cursar:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:02-modalidades')::uuid, md5('pea-modulo:Cursado')::uuid, 2, $pea0$Modalidades del CAU: ED, EDH y PD$pea0$, 'leccion', a.id,
       $pea0${"resumen":["En el CAU se cursan carreras de grado y pregrado en tres modalidades: ED, EDH y PD.","ED: plataforma más Open Class en el CAU. Cada subperíodo dura 9 semanas y se asiste cada 2 semanas por materia.","En ED se cursan hasta 2 materias con asistencia al CAU por subperíodo; en grado se puede sumar 1 materia 100% virtual.","EDH: todo el cursado es en la plataforma, sin asistencia al CAU.","PD: es presencial; las materias se cursan cuatrimestralmente con actividades sincrónicas."],"ejemplos":[{"consulta":"Trabajo todo el día, ¿qué me conviene?","respuesta":"Distancia está pensada para quien no puede asistir regularmente: ED, con Open Class en el CAU, o EDH, íntegramente en la plataforma."},{"consulta":"¿En ED tengo que venir al CAU?","respuesta":"Sí, a las Open Class: cada 2 semanas por materia, en las fechas del calendario. En EDH no hay asistencia al CAU."},{"consulta":"¿Puedo sumar una materia sin venir al CAU?","respuesta":"En carreras de grado en ED puede sumar 1 materia íntegramente virtual por subperíodo, que se rige por las reglas de EDH."}],"ojo":["Si en el CAU no se llega a 5 ingresantes de la misma carrera, la Universidad puede pasar a los de ED a EDH.","Quienes necesitan ajustes razonables rinden obligatoriamente en su sede o CAU, no en su casa.","El 75% de asistencia de las condiciones de aprobación no aplica en EDH."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-3-1-modalidades-de-cursado$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:02-modalidades:1')::uuid, 'opcion_multiple', $pea0$¿Qué sub-modalidad se cursa íntegramente en la plataforma, sin ir al CAU?$pea0$, $pea0$En EDH todo el cursado es en la plataforma; en ED hay Open Class en el CAU.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:02-modalidades')::uuid
where exists (select 1 from public.items where id = md5('pea-item:02-modalidades')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:02-modalidades:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:02-modalidades:1:1')::uuid, $pea0$Educación Distribuida (ED)$pea0$, false, 1),
  (md5('pea-opcion:02-modalidades:1:2')::uuid, $pea0$Educación Distribuida Home (EDH)$pea0$, true, 2),
  (md5('pea-opcion:02-modalidades:1:3')::uuid, $pea0$Presencial Distribuida (PD)$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:02-modalidades:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:02-modalidades:2')::uuid, 'verdadero_falso', $pea0$En ED, por subperíodo se cursan hasta 2 materias con asistencia al CAU.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:02-modalidades')::uuid
where exists (select 1 from public.items where id = md5('pea-item:02-modalidades')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:02-modalidades:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:02-modalidades:2:1')::uuid, $pea0$Verdadero$pea0$, true, 1),
  (md5('pea-opcion:02-modalidades:2:2')::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:02-modalidades:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:03-inscripcion-a-materias')::uuid, md5('pea-modulo:Cursado')::uuid, 3, $pea0$Inscripción a materias$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Se inscribe en el período del Calendario Académico. Cerrado el período, no hay inscripción.","Necesita aranceles al día, legajo completo, estar matriculado y respetar las correlativas.","Para materias de cuarto cuatrimestre, debe tener aprobado Universitarios 21.","Queda inscripto a la materia solo cuando pagó los aranceles e hizo la inscripción.","Topes en ED y EDH: grado 6 + 2 extra; pregrado 4 + 2 extra. Si se inscribe solo en el subperíodo B, 1 extra. En PD, hasta 8 materias."],"ejemplos":[{"consulta":"Se me pasó la fecha, ¿me pueden anotar?","respuesta":"No: una vez cerrado el período del Calendario Académico no se puede inscribir."},{"consulta":"Me anoté pero no pagué, ¿estoy cursando?","respuesta":"No todavía: la inscripción a la materia queda firme cuando están pagos los aranceles."},{"consulta":"Estudio a distancia, ¿cuántas materias puedo hacer?","respuesta":"En grado, hasta 6 al inicio del semestre más 2 adicionales si las correlativas lo permiten; en pregrado, 4 más 2. Las extras se pagan aparte."},{"consulta":"Empiezo en el segundo subperíodo, ¿a cuántas me anoto?","respuesta":"Los ingresantes con equivalencias y quienes empiezan en los segundos subperíodos (junio u octubre) cursan solo materias de ese subperíodo, hasta 3."}],"ojo":["Los ingresantes no pueden anotarse a materias extra.","Práctica Solidaria y Práctica Profesional: inscripción hasta el viernes previo al inicio de clases.","Procurador (5 + 2) y los ciclos de complementación (4 + 2) tienen otros topes: consultá la fuente."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-2-inscripcion-a-materias$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:03-inscripcion-a-materias:1')::uuid, 'opcion_multiple', $pea0$Un alumno de distancia quiere cursar una materia de cuarto cuatrimestre. ¿Qué tiene que tener aprobado sí o sí?$pea0$, $pea0$Para materias de cuarto cuatrimestre se pide Universitarios 21 aprobado.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:03-inscripcion-a-materias')::uuid
where exists (select 1 from public.items where id = md5('pea-item:03-inscripcion-a-materias')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:03-inscripcion-a-materias:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:03-inscripcion-a-materias:1:1')::uuid, $pea0$El Seminario Final.$pea0$, false, 1),
  (md5('pea-opcion:03-inscripcion-a-materias:1:2')::uuid, $pea0$Universitarios 21.$pea0$, true, 2),
  (md5('pea-opcion:03-inscripcion-a-materias:1:3')::uuid, $pea0$Todas las materias de tercer cuatrimestre.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:03-inscripcion-a-materias:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:03-inscripcion-a-materias:2')::uuid, 'verdadero_falso', $pea0$Un alumno de grado en ED puede anotarse a 6 materias al inicio del semestre más 2 extra.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:03-inscripcion-a-materias')::uuid
where exists (select 1 from public.items where id = md5('pea-item:03-inscripcion-a-materias')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:03-inscripcion-a-materias:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:03-inscripcion-a-materias:2:1')::uuid, $pea0$Verdadero$pea0$, true, 1),
  (md5('pea-opcion:03-inscripcion-a-materias:2:2')::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:03-inscripcion-a-materias:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:04-cambio-de-catedra')::uuid, md5('pea-modulo:Cursado')::uuid, 4, $pea0$Cambio de cátedra (PD)$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Es solo para modalidades presenciales: en el CAU, aplica a PD.","Se pide en el período del Calendario Académico y solo si hay superposición de horarios entre materias del mismo semestre.","Requisitos: aranceles del semestre pagos y cambiar a una cátedra del mismo turno."],"ejemplos":[{"consulta":"Curso en PD y se me superponen dos materias del mismo cuatrimestre.","respuesta":"Puede pedir cambio de cátedra en el período del calendario, con los aranceles pagos y a una cátedra del mismo turno."},{"consulta":"Quiero pasarme a la cátedra de la tarde porque me queda mejor.","respuesta":"Solo se cambia si hay superposición de horarios y siempre dentro del mismo turno."},{"consulta":"Estudio en ED, ¿puedo cambiar de cátedra?","respuesta":"No: el cambio de cátedra es solo para las modalidades presenciales."}],"ojo":["Si cursa materias de distintos cuatrimestres a la vez, la Universidad no garantiza que no haya superposiciones.","En el calendario 2026 de P y PD, el cambio de cátedra del primer semestre fue del 16/03 al 20/03."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-4-cambio-de-catedra$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:04-cambio-de-catedra:1')::uuid, 'opcion_multiple', $pea0$¿En qué caso corresponde un cambio de cátedra?$pea0$, $pea0$Solo con superposición, dentro del mismo turno y en modalidades presenciales.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:04-cambio-de-catedra')::uuid
where exists (select 1 from public.items where id = md5('pea-item:04-cambio-de-catedra')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:04-cambio-de-catedra:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:04-cambio-de-catedra:1:1')::uuid, $pea0$Superposición de horarios entre materias del mismo semestre, en PD.$pea0$, true, 1),
  (md5('pea-opcion:04-cambio-de-catedra:1:2')::uuid, $pea0$Preferencia por otro docente, en ED.$pea0$, false, 2),
  (md5('pea-opcion:04-cambio-de-catedra:1:3')::uuid, $pea0$Cambio de turno de mañana a noche.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:04-cambio-de-catedra:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:05-cambio-de-modalidad')::uuid, md5('pea-modulo:Trámites')::uuid, 5, $pea0$Cambio de modalidad$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Se pide en las fechas del calendario de trámites.","Requisitos: libre deuda, legajo completo, no estar inscripto a un final ni tener una nota pendiente de carga.","No tiene que haber hecho más de 2 pases entre presencial y distancia (PH/MP/PD a ED/EDH o al revés).","Aprobadas y regulares se conservan. Las que está cursando y las Libre por Nota quedan Libre por Pase: las recursa.","Las regulares se rinden con las reglas de la modalidad nueva."],"ejemplos":[{"consulta":"Me quiero pasar a distancia pero estoy anotado a un final el jueves.","respuesta":"Todavía no puede: no tiene que estar inscripto a una mesa ni tener una nota pendiente de carga."},{"consulta":"Tengo 3 materias cursando, ¿las pierdo?","respuesta":"Esas quedan Libre por Pase y las recursa. Las regulares y las aprobadas se mantienen."},{"consulta":"Ya me cambié tres veces entre presencial y distancia.","respuesta":"No puede hacer otro pase: el requisito es no haber hecho más de 2 pases entre esas modalidades."}],"ojo":["Libre por Nota no se conserva: pasa a Libre por Pase.","Los idiomas que está cursando o tiene regulares se pierden.","Si pasa a ED o cambia de CAU, debe confirmar su lugar con el CAU de destino.","Seminario de Práctica y EFIP tienen reglas especiales: consultá la fuente."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-3-2-cambios-de-modalidad$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:05-cambio-de-modalidad:1')::uuid, 'opcion_multiple', $pea0$Un alumno con mesa el jueves pide el pase de modalidad hoy. ¿Qué le respondés?$pea0$, $pea0$Uno de los requisitos es no estar inscripto a una mesa de examen final.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:05-cambio-de-modalidad')::uuid
where exists (select 1 from public.items where id = md5('pea-item:05-cambio-de-modalidad')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:05-cambio-de-modalidad:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:05-cambio-de-modalidad:1:1')::uuid, $pea0$Que lo hace sin problema.$pea0$, false, 1),
  (md5('pea-opcion:05-cambio-de-modalidad:1:2')::uuid, $pea0$Que no puede estar inscripto a un final al pedir el pase.$pea0$, true, 2),
  (md5('pea-opcion:05-cambio-de-modalidad:1:3')::uuid, $pea0$Que pierde todas sus materias regulares.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:05-cambio-de-modalidad:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:05-cambio-de-modalidad:2')::uuid, 'verdadero_falso', $pea0$Al cambiar de modalidad, una materia en condición Regular conserva su estado.$pea0$, $pea0$Se conserva, pero se rinde con las condiciones de evaluación de la modalidad de destino.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:05-cambio-de-modalidad')::uuid
where exists (select 1 from public.items where id = md5('pea-item:05-cambio-de-modalidad')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:05-cambio-de-modalidad:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:05-cambio-de-modalidad:2:1')::uuid, $pea0$Verdadero$pea0$, true, 1),
  (md5('pea-opcion:05-cambio-de-modalidad:2:2')::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:05-cambio-de-modalidad:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:06-equivalencias')::uuid, md5('pea-modulo:Trámites')::uuid, 6, $pea0$Equivalencias$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Se evalúan contenidos, objetivos, bibliografía y nivel de la materia, no solo el nombre.","Para equivalencias externas se pide: DNI, analítico legalizado, plan y programas legalizados, y el pago de la tasa.","Se puede reconocer como máximo el 70% del plan de la carrera de destino.","No hay reconocimiento parcial ni se otorga la condición de regular por equivalencia."],"ejemplos":[{"consulta":"En mi otra facultad la materia se llama igual, ¿me la dan?","respuesta":"No necesariamente: se comparan contenidos, objetivos y bibliografía, no el nombre."},{"consulta":"¿Qué tengo que presentar?","respuesta":"DNI, certificado analítico legalizado, plan de estudios y programas legalizados, y el comprobante de pago de la tasa."},{"consulta":"Tengo casi toda la carrera hecha en otro lado.","respuesta":"Se puede reconocer hasta el 70% del plan de la carrera en Siglo 21."}],"ojo":["Práctica Solidaria, Práctica Profesional y Seminario Final no se dan por equivalencia externa: se aprueban en Siglo 21.","Si hay un pre-dictamen aprobado para esa institución y carrera, no se piden los programas."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-6-1-sistema-de-equivalencias-para-todas-las-modalidades$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:06-equivalencias:1')::uuid, 'opcion_multiple', $pea0$¿Cuál es el máximo del plan que se puede reconocer por equivalencias externas?$pea0$, $pea0$El reconocimiento externo no puede superar el 70% del plan de la carrera de destino.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:06-equivalencias')::uuid
where exists (select 1 from public.items where id = md5('pea-item:06-equivalencias')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:06-equivalencias:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:06-equivalencias:1:1')::uuid, $pea0$50%$pea0$, false, 1),
  (md5('pea-opcion:06-equivalencias:1:2')::uuid, $pea0$70%$pea0$, true, 2),
  (md5('pea-opcion:06-equivalencias:1:3')::uuid, $pea0$100%$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:06-equivalencias:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:06-equivalencias:2')::uuid, 'verdadero_falso', $pea0$Una materia con el mismo nombre se da por equivalente automáticamente.$pea0$, $pea0$Se evalúan contenidos, objetivos, bibliografía y nivel, no el nombre.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:06-equivalencias')::uuid
where exists (select 1 from public.items where id = md5('pea-item:06-equivalencias')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:06-equivalencias:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:06-equivalencias:2:1')::uuid, $pea0$Verdadero$pea0$, false, 1),
  (md5('pea-opcion:06-equivalencias:2:2')::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:06-equivalencias:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:07-solicitud-de-baja')::uuid, md5('pea-modulo:Trámites')::uuid, 7, $pea0$Solicitud de baja$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Se pide en la Mesa de Atención de Alumnos o por autogestión en el portal.","Requisito: no deber libros en la biblioteca ni tener deuda, baja administrativa o inhabilitación académica.","La baja no devuelve dinero ni cancela la deuda de aranceles del semestre, salvo razones institucionales aprobadas por el Vicerrectorado."],"ejemplos":[{"consulta":"Quiero darme de baja, ¿me devuelven lo que pagué?","respuesta":"No: la baja no implica reintegro ni cancela deuda de aranceles, salvo razones institucionales justificadas y aprobadas."},{"consulta":"¿Dónde pido la baja?","respuesta":"En la Mesa de Atención de Alumnos o desde las herramientas de autogestión del portal."},{"consulta":"Tengo una cuota atrasada y me quiero dar de baja.","respuesta":"Primero tiene que regularizar la deuda: es requisito para otorgar la baja."}],"ojo":["También puede renunciar a la regularidad de una materia aunque siga vigente."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-5-solicitud-de-baja$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:07-solicitud-de-baja:1')::uuid, 'opcion_multiple', $pea0$Un alumno con deuda pide la baja. ¿Qué le decís?$pea0$, $pea0$No registrar deuda es requisito para otorgar la baja.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:07-solicitud-de-baja')::uuid
where exists (select 1 from public.items where id = md5('pea-item:07-solicitud-de-baja')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:07-solicitud-de-baja:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:07-solicitud-de-baja:1:1')::uuid, $pea0$Que se la damos y la deuda se cancela.$pea0$, false, 1),
  (md5('pea-opcion:07-solicitud-de-baja:1:2')::uuid, $pea0$Que primero tiene que regularizar la deuda.$pea0$, true, 2),
  (md5('pea-opcion:07-solicitud-de-baja:1:3')::uuid, $pea0$Que la baja le devuelve el último pago.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:07-solicitud-de-baja:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:08-titulo')::uuid, md5('pea-modulo:Egreso')::uuid, 8, $pea0$Título$pea0$, 'leccion', a.id,
       $pea0${"resumen":["La titulación empieza cuando cumplió todos los requisitos de la Universidad y de la normativa.","Se abona una tasa por el trámite del título.","El diploma se emite en hasta 120 días corridos desde que el legajo queda como Egresado, con la documentación completa.","En carreras que lo prevén, puede pedir el título intermedio."],"ejemplos":[{"consulta":"Terminé la carrera, ¿cuándo tengo el título?","respuesta":"El plazo es de hasta 120 días corridos desde que el legajo queda como Egresado, con toda la documentación obligatoria completa."},{"consulta":"¿El título tiene costo?","respuesta":"Sí: se abona la tasa del trámite administrativo del título."},{"consulta":"Mi carrera tiene título intermedio, ¿cómo lo pido?","respuesta":"Lo inicia el estudiante, siempre que cumpla lo exigido por la carrera para esa titulación."}],"ojo":["Si egresó por articulación o doble titulación, el trámite empieza al terminar el reconocimiento de estudios."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-12-5-proceso-de-titulacion$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:08-titulo:1')::uuid, 'opcion_multiple', $pea0$¿Desde cuándo corren los 120 días para el diploma?$pea0$, $pea0$El plazo corre desde que el legajo adquiere la condición de Egresado.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:08-titulo')::uuid
where exists (select 1 from public.items where id = md5('pea-item:08-titulo')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:08-titulo:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:08-titulo:1:1')::uuid, $pea0$Desde que aprobó la última materia.$pea0$, false, 1),
  (md5('pea-opcion:08-titulo:1:2')::uuid, $pea0$Desde que el legajo queda como Egresado, con la documentación completa.$pea0$, true, 2),
  (md5('pea-opcion:08-titulo:1:3')::uuid, $pea0$Desde la colación.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:08-titulo:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:09-colacion')::uuid, md5('pea-modulo:Egreso')::uuid, 9, $pea0$Colación$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Es el acto de reconocimiento a quienes terminaron su plan con todos los requisitos cumplidos.","Cada colación incluye a quienes egresaron entre el 1 de septiembre del año anterior y el 31 de agosto del año en curso.","En la ceremonia se entrega un diploma simbólico, no el título oficial.","Si adeuda documentación para el título, no participa."],"ejemplos":[{"consulta":"¿En la colación me dan el título?","respuesta":"No: se entrega un diploma simbólico. El título oficial sigue su propio trámite."},{"consulta":"Terminé en octubre, ¿entro en la colación de este año?","respuesta":"Entra quien egresó entre el 1 de septiembre del año anterior y el 31 de agosto del año en curso: octubre pasa a la siguiente."},{"consulta":"Me falta presentar un papel, ¿puedo colacionar igual?","respuesta":"No: si adeuda documentación para emitir el título no puede participar."}],"ojo":["En pregrado, por la distancia, el acto alcanza a egresados de CAU Córdoba y Río IV, salvo que la Universidad lo amplíe.","No incluye títulos intermedios ni dobles titulaciones, salvo que haya gestionado equivalencias."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-12-6-colacion$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:09-colacion:1')::uuid, 'verdadero_falso', $pea0$En la colación se entrega el título oficial.$pea0$, $pea0$Se entrega un diploma simbólico; el título oficial se tramita aparte.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:09-colacion')::uuid
where exists (select 1 from public.items where id = md5('pea-item:09-colacion')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:09-colacion:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:09-colacion:1:1')::uuid, $pea0$Verdadero$pea0$, false, 1),
  (md5('pea-opcion:09-colacion:1:2')::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:09-colacion:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:10-matricula-y-aranceles')::uuid, md5('pea-modulo:Administración')::uuid, 10, $pea0$Matrícula y aranceles$pea0$, 'leccion', a.id,
       $pea0${"resumen":["La matrícula es semestral y debe estar paga y activa para rendir parciales, finales o la defensa del Seminario Final.","En distancia, la matrícula del 1er semestre va del 1/1 al 31/7 y la del 2do, del 1/8 al 31/12.","En ED y EDH se paga por paquete: Ticket A, Ticket B o semestre completo (A+B), según materias y subperíodo. En PD, tickets de 1, 3, 4 o 6 materias.","Materias extra en ED y EDH: arancel aparte (grado 1/6 y pregrado 1/4 del arancel A+B). No les aplican becas.","No se reintegra dinero por no completar el cursado por causas personales."],"ejemplos":[{"consulta":"No pagué la matrícula, ¿puedo rendir el final igual?","respuesta":"No: para rendir parciales, finales o la defensa del Seminario Final la matrícula tiene que estar paga y activa."},{"consulta":"Dejé de cursar a mitad de semestre, ¿me devuelven el ticket?","respuesta":"No: no hay reintegro cuando el servicio fue prestado y deja por causas personales."},{"consulta":"Mi beca, ¿cubre la materia extra?","respuesta":"No: en materias extra y en las de verano no aplican becas ni beneficios."}],"ojo":["Sin actividad académica por más de 1 año calendario queda en baja administrativa y debe matricularse de nuevo.","Suspender el cursado no cambia la regularidad, pero para retomar debe cancelar la deuda de ese período.","Pregrado y ciclos de complementación en distancia no tienen arancel único para el subperíodo A: pagan semestre completo."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-4-normas-arancelarias$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:10-matricula-y-aranceles:1')::uuid, 'opcion_multiple', $pea0$¿Qué necesita sí o sí para rendir un final?$pea0$, $pea0$La matrícula paga y activa es requisito para rendir parciales, finales o la defensa oral.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:10-matricula-y-aranceles')::uuid
where exists (select 1 from public.items where id = md5('pea-item:10-matricula-y-aranceles')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:10-matricula-y-aranceles:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:10-matricula-y-aranceles:1:1')::uuid, $pea0$La matrícula paga y activa.$pea0$, true, 1),
  (md5('pea-opcion:10-matricula-y-aranceles:1:2')::uuid, $pea0$Una beca vigente.$pea0$, false, 2),
  (md5('pea-opcion:10-matricula-y-aranceles:1:3')::uuid, $pea0$Haber cursado en el mismo semestre.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:10-matricula-y-aranceles:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:10-matricula-y-aranceles:2')::uuid, 'verdadero_falso', $pea0$Las becas se aplican también a las materias extra.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:10-matricula-y-aranceles')::uuid
where exists (select 1 from public.items where id = md5('pea-item:10-matricula-y-aranceles')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:10-matricula-y-aranceles:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:10-matricula-y-aranceles:2:1')::uuid, $pea0$Verdadero$pea0$, false, 1),
  (md5('pea-opcion:10-matricula-y-aranceles:2:2')::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:10-matricula-y-aranceles:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:11-pagos-y-deuda')::uuid, md5('pea-modulo:Administración')::uuid, 11, $pea0$Pagos y deuda$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Los tickets se generan en la autogestión y el pago tarda unas 72 horas hábiles en acreditarse.","Es responsabilidad del estudiante pagar con anticipación y guardar el comprobante.","Con deuda anterior no puede pagar la matrícula ni los aranceles del período actual hasta cancelarla.","Todo pago se aplica primero a la deuda y puede tener recargo por mora."],"ejemplos":[{"consulta":"Pagué hoy y mañana cierra la inscripción.","respuesta":"El pago tarda unas 72 horas hábiles en acreditarse: por eso se recomienda pagar con anticipación."},{"consulta":"Quiero pagar este semestre pero debo una cuota del anterior.","respuesta":"Primero tiene que cancelar lo adeudado: cualquier pago se aplica antes a la deuda."},{"consulta":"Me rechazaron el pago con tarjeta.","respuesta":"La Universidad lo intima a regularizar en un plazo; si no lo hace, pasa a baja administrativa."}],"ojo":["Con deuda tampoco puede pagar tasas de trámites.","Si se da de baja del servicio, no hay devolución de dinero."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-4-normas-arancelarias$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:11-pagos-y-deuda:1')::uuid, 'opcion_multiple', $pea0$Un alumno pagó hoy y la inscripción cierra mañana. ¿Qué le explicás?$pea0$, $pea0$El plazo estimado de acreditación es de 72 horas hábiles.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:11-pagos-y-deuda')::uuid
where exists (select 1 from public.items where id = md5('pea-item:11-pagos-y-deuda')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:11-pagos-y-deuda:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:11-pagos-y-deuda:1:1')::uuid, $pea0$Que el pago se acredita al instante.$pea0$, false, 1),
  (md5('pea-opcion:11-pagos-y-deuda:1:2')::uuid, $pea0$Que la acreditación tarda unas 72 horas hábiles.$pea0$, true, 2),
  (md5('pea-opcion:11-pagos-y-deuda:1:3')::uuid, $pea0$Que no hace falta pagar para inscribirse.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:11-pagos-y-deuda:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:12-becas-y-beneficios')::uuid, md5('pea-modulo:Administración')::uuid, 12, $pea0$Becas y beneficios$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Una beca es un apoyo económico por buen nivel académico y regularidad (ver requisitos en la fuente); un beneficio, por una situación o cualidad del estudiante.","No son acumulables entre sí: si califica para más de una, se aplica la más provechosa.","Becas del primer semestre: postulación del 1 de octubre del año anterior al 1 de enero.","Becas del segundo semestre: postulación del 1 de abril al 1 de julio."],"ejemplos":[{"consulta":"Tengo beca y me corresponde también el beneficio por familiar, ¿se suman?","respuesta":"No: becas y beneficios no son acumulables; se aplica el que más le convenga."},{"consulta":"¿Cuándo me postulo para el primer semestre?","respuesta":"Del 1 de octubre del año anterior al 1 de enero; el resultado se confirma hasta el 1 de febrero."},{"consulta":"Entregué la solicitud incompleta.","respuesta":"Las solicitudes incompletas o con deficiencias se rechazan: tiene que cumplir todos los requisitos de la categoría."}],"ojo":["Las promociones sí pueden sumarse a una beca o beneficio, según sus condiciones.","Quien tiene beca debe informar cualquier cambio en su situación económica o académica."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-3-becas-y-beneficios$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:12-becas-y-beneficios:1')::uuid, 'opcion_multiple', $pea0$Un alumno califica para dos beneficios. ¿Qué pasa?$pea0$, $pea0$Las ayudas económicas no son acumulables; se aplica la más provechosa.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:12-becas-y-beneficios')::uuid
where exists (select 1 from public.items where id = md5('pea-item:12-becas-y-beneficios')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:12-becas-y-beneficios:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:12-becas-y-beneficios:1:1')::uuid, $pea0$Se le aplican los dos.$pea0$, false, 1),
  (md5('pea-opcion:12-becas-y-beneficios:1:2')::uuid, $pea0$Se le aplica el más provechoso.$pea0$, true, 2),
  (md5('pea-opcion:12-becas-y-beneficios:1:3')::uuid, $pea0$No se le aplica ninguno.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:12-becas-y-beneficios:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:13-documentacion-obligatoria')::uuid, md5('pea-modulo:Cursado')::uuid, 13, $pea0$Documentación obligatoria$pea0$, 'leccion', a.id,
       $pea0${"resumen":["El legajo completo es requisito. Se presenta en la sede o CAU con original y copia; la copia certificada se envía en formato digital.","Grado y pregrado: solicitud de inscripción firmada, DNI vigente (no el digital), secundario completo, 2 fotos color 3x3 y ficha médica.","Sin el analítico todavía, sirve una constancia de título en trámite que diga que no adeuda materias: vale 1 año y se presenta una sola vez.","Grado: plazo de un año y medio; si no, no puede reinscribirse al cuarto período. Pregrado: dentro del primer año."],"ejemplos":[{"consulta":"¿Puedo presentar el DNI digital?","respuesta":"No: para el legajo se acepta solo el DNI vigente, no el digital. Si es extranjero, pasaporte vigente."},{"consulta":"Todavía no me dieron el analítico del secundario.","respuesta":"Puede presentar una constancia de título en trámite donde conste que no adeuda materias. Vale 1 año desde su emisión y se presenta una sola vez."},{"consulta":"¿Quién me certifica las copias?","respuesta":"Personal autorizado del CAU o la sede, juez de paz, registro civil o escribano público. Después la envía en formato digital."}],"ojo":["La secretaría del juzgado no sirve para certificar copias.","Mayores de 25 sin secundario completo: ingreso por trámite especial con resolución rectoral (45 días hábiles).","Los ciclos de complementación tienen otra documentación y otros plazos: consultá la fuente."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-2-2-documentacion-obligatoria-y-complementaria$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:13-documentacion-obligatoria:1')::uuid, 'opcion_multiple', $pea0$Un alumno de grado no completó su legajo en el primer año y medio. ¿Qué pasa?$pea0$, $pea0$En grado la documentación se completa dentro del primer año y medio.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:13-documentacion-obligatoria')::uuid
where exists (select 1 from public.items where id = md5('pea-item:13-documentacion-obligatoria')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:13-documentacion-obligatoria:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:13-documentacion-obligatoria:1:1')::uuid, $pea0$Nada, puede presentarlo cuando quiera.$pea0$, false, 1),
  (md5('pea-opcion:13-documentacion-obligatoria:1:2')::uuid, $pea0$No puede reinscribirse al cuarto período de cursado.$pea0$, true, 2),
  (md5('pea-opcion:13-documentacion-obligatoria:1:3')::uuid, $pea0$Pierde las materias aprobadas.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:13-documentacion-obligatoria:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:13-documentacion-obligatoria:2')::uuid, 'verdadero_falso', $pea0$El DNI digital es válido para el legajo.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:13-documentacion-obligatoria')::uuid
where exists (select 1 from public.items where id = md5('pea-item:13-documentacion-obligatoria')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:13-documentacion-obligatoria:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:13-documentacion-obligatoria:2:1')::uuid, $pea0$Verdadero$pea0$, false, 1),
  (md5('pea-opcion:13-documentacion-obligatoria:2:2')::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:13-documentacion-obligatoria:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:14-estudiantes-extranjeros')::uuid, md5('pea-modulo:Cursado')::uuid, 14, $pea0$Estudiantes extranjeros$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Quien terminó el secundario en el exterior debe convalidar el título ante las autoridades educativas nacionales: es obligatorio.","Para equivalencias de estudios en el exterior: documentación legalizada (apostilla de La Haya o consulado) y traducción de Traductor Público si no está en español.","Necesita la residencia de la Dirección Nacional de Migraciones para estudiar en el país.","En grado y pregrado debe presentar el DNI argentino durante el primer año."],"ejemplos":[{"consulta":"Terminé el secundario en Paraguay, ¿me puedo inscribir?","respuesta":"Sí, pero tiene que convalidar su título secundario ante las autoridades educativas nacionales: es un requisito obligatorio."},{"consulta":"Mis certificados están en portugués.","respuesta":"Tienen que estar legalizados (apostilla o consulado) y traducidos por Traductor Público Nacional; para Brasil no se exige que esté inscripto en el registro."},{"consulta":"¿Qué hago con la residencia?","respuesta":"La tramita en Migraciones. El Centro de Internacionalización le da la constancia de inscripción para el trámite."}],"ojo":["En carreras que piden título de grado previo, no puede empezar sin la convalidación o reválida de ese título.","Migraciones pide acreditar avance académico a los 6 o 12 meses."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-2-4-documentacion-obligatoria-y-complementaria-extranjeros$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:14-estudiantes-extranjeros:1')::uuid, 'verdadero_falso', $pea0$Un estudiante extranjero de grado tiene que presentar el DNI argentino durante el primer año.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:14-estudiantes-extranjeros')::uuid
where exists (select 1 from public.items where id = md5('pea-item:14-estudiantes-extranjeros')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:14-estudiantes-extranjeros:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:14-estudiantes-extranjeros:1:1')::uuid, $pea0$Verdadero$pea0$, true, 1),
  (md5('pea-opcion:14-estudiantes-extranjeros:1:2')::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:14-estudiantes-extranjeros:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:15-calendario-academico')::uuid, md5('pea-modulo:Cursado')::uuid, 15, $pea0$Calendario académico$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Se publica cada año en el Portal de estudiante; conocer las fechas es responsabilidad del alumno.","ED y EDH: 2 semestres con 2 subperíodos de 9 semanas cada uno. La semana 9 es de recuperatorios e integradores.","En ED y EDH, el 1er parcial se rinde entre las semanas 1 y 4, y el 2do entre las semanas 5 y 8.","PD: semestres de 16 semanas. 1ros parciales en las semanas 7 y 8; 2dos parciales en las semanas 14 y 15.","Si un parcial coincide con un feriado se reprograma; en PD, solo por feriado nacional."],"ejemplos":[{"consulta":"¿Dónde veo las fechas de los TP y los parciales?","respuesta":"En el calendario académico de su modalidad, publicado en el Portal de estudiante (también está en La Nube)."},{"consulta":"En 2026, ¿hasta cuándo me puedo inscribir en el subperíodo 1A?","respuesta":"Según el calendario 2026 de Distancia, las clases empiezan el 16/03 y la inscripción a materias es hasta el 29/03."},{"consulta":"¿Cuándo son los recuperatorios en ED?","respuesta":"En la semana 9 de cada subperíodo. En 2026, para el 1A, del 11/5 al 16/5."}],"ojo":["Las fechas cambian cada año: verificá siempre el calendario vigente.","En el calendario 2026 de Distancia, los TP de MEC y MAP vencen en las semanas 5 y 8; los de MIA, en las semanas 4, 5, 7 y 8."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-1-calendario-academico$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:15-calendario-academico:1')::uuid, 'opcion_multiple', $pea0$En ED y EDH, ¿en qué semanas se rinde el 2do parcial?$pea0$, $pea0$El 1er parcial va de la semana 1 a la 4 y el 2do de la 5 a la 8.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:15-calendario-academico')::uuid
where exists (select 1 from public.items where id = md5('pea-item:15-calendario-academico')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:15-calendario-academico:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:15-calendario-academico:1:1')::uuid, $pea0$Semanas 1 a 4.$pea0$, false, 1),
  (md5('pea-opcion:15-calendario-academico:1:2')::uuid, $pea0$Semanas 5 a 8.$pea0$, true, 2),
  (md5('pea-opcion:15-calendario-academico:1:3')::uuid, $pea0$Semana 9.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:15-calendario-academico:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:15-calendario-academico:2')::uuid, 'verdadero_falso', $pea0$La semana 9 del subperíodo es de recuperatorios e integradores.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:15-calendario-academico')::uuid
where exists (select 1 from public.items where id = md5('pea-item:15-calendario-academico')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:15-calendario-academico:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:15-calendario-academico:2:1')::uuid, $pea0$Verdadero$pea0$, true, 1),
  (md5('pea-opcion:15-calendario-academico:2:2')::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:15-calendario-academico:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:16-materias-de-verano')::uuid, md5('pea-modulo:Cursado')::uuid, 16, $pea0$Materias de verano$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Solo para quienes se reinscriben: los ingresantes no pueden cursar en verano.","Se cursan hasta 4 materias, entre febrero y marzo.","Se paga un arancel por cada materia antes de empezar (como máximo, hasta el fin del cursado). No aplican becas ni beneficios.","Regular: 3 de 4 TP con 5 o más y 2 parciales con 5 o más. Promoción directa: 3 de 4 TP y 2 parciales con 7 o más, y correlativas aprobadas."],"ejemplos":[{"consulta":"Soy nuevo, ¿puedo adelantar una materia en verano?","respuesta":"No: el verano es solo para quienes se reinscriben; los ingresantes quedan excluidos."},{"consulta":"¿Mi beca cubre la materia de verano?","respuesta":"No: en verano se paga un arancel por materia y no aplican becas ni beneficios."},{"consulta":"¿Cuántas materias puedo hacer en verano?","respuesta":"Hasta 4."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-3-inscripcion-a-materias-de-verano$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:16-materias-de-verano:1')::uuid, 'opcion_multiple', $pea0$¿Quién no puede cursar materias de verano?$pea0$, $pea0$El verano es solo para quienes se reinscriben.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:16-materias-de-verano')::uuid
where exists (select 1 from public.items where id = md5('pea-item:16-materias-de-verano')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:16-materias-de-verano:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:16-materias-de-verano:1:1')::uuid, $pea0$Un ingresante.$pea0$, true, 1),
  (md5('pea-opcion:16-materias-de-verano:1:2')::uuid, $pea0$Un alumno que se reinscribe.$pea0$, false, 2),
  (md5('pea-opcion:16-materias-de-verano:1:3')::uuid, $pea0$Un alumno con beca.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:16-materias-de-verano:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:17-planes-de-estudio')::uuid, md5('pea-modulo:Cursado')::uuid, 17, $pea0$Planes de estudio$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Los planes los aprueba el Consejo Superior y después el Ministerio de Educación.","Cuando entra un plan nuevo, el anterior se mantiene por la duración teórica de la carrera más un año.","Si no terminó en ese plazo, la Universidad puede pasarlo al plan nuevo y debe cursar todas sus materias.","Las materias que están en los dos planes se reconocen por equivalencia directa y automática.","Quien estuvo inactivo más de un período y retoma fuera de ese plazo también puede ser migrado al plan vigente."],"ejemplos":[{"consulta":"Vuelvo después de mucho tiempo, ¿sigo con mi plan?","respuesta":"Si su plan ya no se mantiene, al retomar se lo migra al plan vigente."},{"consulta":"Me pasaron de plan y tengo materias nuevas.","respuesta":"Al migrar debe hacer todas las materias del plan nuevo, aunque no estuvieran en el original. Las que coinciden se reconocen automáticamente."},{"consulta":"¿Qué son los créditos de una materia?","respuesta":"Equivalen a la cantidad de horas semanales que tiene la materia."}],"ojo":["Cuando la Universidad migra alumnos de plan, arma un plan de transición con los pasos a seguir."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-1-planes-de-estudio$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:17-planes-de-estudio:1')::uuid, 'verdadero_falso', $pea0$Las materias que están en el plan anterior y en el nuevo se reconocen automáticamente.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:17-planes-de-estudio')::uuid
where exists (select 1 from public.items where id = md5('pea-item:17-planes-de-estudio')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:17-planes-de-estudio:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:17-planes-de-estudio:1:1')::uuid, $pea0$Verdadero$pea0$, true, 1),
  (md5('pea-opcion:17-planes-de-estudio:1:2')::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:17-planes-de-estudio:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:18-correlativas')::uuid, md5('pea-modulo:Cursado')::uuid, 18, $pea0$Correlativas$pea0$, 'leccion', a.id,
       $pea0${"resumen":["El plan de correlatividades fija el orden en que se cursan las materias.","Para inscribirse a una materia, sus correlativas tienen que estar regulares.","Para aprobar o promocionar, sus correlativas tienen que estar aprobadas.","Puede promocionar si aprueba la correlativa anterior dentro de los 60 días de terminada la materia; si no, la materia queda Regular."],"ejemplos":[{"consulta":"¿Cómo sé qué correlativas tiene una materia?","respuesta":"En el Portal de Estudiantes: su carrera, Plan de Estudio y Ver Correlativas. Ahí también está Ver Programa."},{"consulta":"Promocioné pero me falta aprobar la correlativa.","respuesta":"Tiene 60 días desde que terminó la materia para aprobar la correlativa anterior; si no, la materia queda Regular y rinde final."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-correlativas$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:18-correlativas:1')::uuid, 'opcion_multiple', $pea0$Para inscribirse a cursar una materia, ¿cómo tienen que estar sus correlativas?$pea0$, $pea0$Para cursar alcanza con correlativas regulares; para aprobar, tienen que estar aprobadas.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:18-correlativas')::uuid
where exists (select 1 from public.items where id = md5('pea-item:18-correlativas')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:18-correlativas:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:18-correlativas:1:1')::uuid, $pea0$Regulares.$pea0$, true, 1),
  (md5('pea-opcion:18-correlativas:1:2')::uuid, $pea0$Aprobadas.$pea0$, false, 2),
  (md5('pea-opcion:18-correlativas:1:3')::uuid, $pea0$No importa.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:18-correlativas:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:19-universitarios-21')::uuid, md5('pea-modulo:Cursado')::uuid, 19, $pea0$Universitarios 21$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Es el programa de ingreso de grado y pregrado: dos materias del primer semestre, Aprender en el Siglo 21 y Tecnología, Humanidades y Modelos Globales.","Se cursan y evalúan con las mismas reglas que el resto de las materias de su modalidad.","Hay que aprobarlas para inscribirse a materias de cuarto cuatrimestre.","Una equivalencia externa no reemplaza a estas materias; hay eximición con 5 o más materias aprobadas en el legajo."],"ejemplos":[{"consulta":"¿Por qué no me deja anotarme a una materia de cuarto cuatrimestre?","respuesta":"Porque necesita tener aprobado Universitarios 21."},{"consulta":"Tengo materias aprobadas en otra universidad, ¿hago Universitarios 21?","respuesta":"Si suma 5 o más materias aprobadas en su legajo de Siglo 21 puede quedar eximido; revisá las condiciones en la fuente."}],"ojo":["Aprender en el Siglo 21 usa como bibliografía el Reglamento Institucional."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-universitarios21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:19-universitarios-21:1')::uuid, 'verdadero_falso', $pea0$Universitarios 21 se aprueba con reglas distintas al resto de las materias.$pea0$, $pea0$Se cursa y evalúa con las mismas reglas que las materias del plan, según la modalidad.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:19-universitarios-21')::uuid
where exists (select 1 from public.items where id = md5('pea-item:19-universitarios-21')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:19-universitarios-21:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:19-universitarios-21:1:1')::uuid, $pea0$Verdadero$pea0$, false, 1),
  (md5('pea-opcion:19-universitarios-21:1:2')::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:19-universitarios-21:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:20-tipos-de-materias-y-tp')::uuid, md5('pea-modulo:Evaluación (EVA 21)')::uuid, 20, $pea0$Tipos de materias y trabajos prácticos$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Cada materia tiene 4 módulos y 4 TP obligatorios: para regularizar hay que aprobar al menos 3, con nota 5 o más.","MEC y MAP: los TP se rehacen sin límite dentro del cronograma y vale la última nota. Entregar tarde resta 5 puntos por día, sin bajar de 5.","MIA y MIP: cada TP se entrega una sola vez, en la fecha del calendario. Si no lo entrega, es 0 y promedia.","MIA y MIP suman foros grupales obligatorios (MIA en TP2 y TP3; MIP en TP1 y TP3), pero el TP es individual.","Las Actividades Prácticas son opcionales: sirven para autoevaluarse."],"ejemplos":[{"consulta":"Me fue mal en el TP de una MEC, ¿lo puedo rehacer?","respuesta":"Sí: en MEC y MAP se rehace las veces que quiera dentro de los plazos del SAM, y vale la última nota."},{"consulta":"Se me pasó la fecha del TP2 de una MIA.","respuesta":"En MIA y MIP el TP se presenta una sola vez en la fecha del calendario; si no lo entregó, tiene 0 y se promedia."},{"consulta":"Entregué tarde un TP de MEC, ¿me lo toman?","respuesta":"Sí, hasta el cierre del SAM, pero resta 5 puntos por día de demora; la demora nunca lo baja de 5."}],"ojo":["En MIP es obligatorio aprobar el TP4 con 5 o más.","La bibliografía obligatoria la consigue cada estudiante.","Conviene que verifique en el SAM que las notas de los TP queden registradas."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:20-tipos-de-materias-y-tp:1')::uuid, 'opcion_multiple', $pea0$En una materia MIA, ¿cuántas veces se puede entregar cada TP?$pea0$, $pea0$En MIA y MIP el TP se presenta por única vez.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:20-tipos-de-materias-y-tp')::uuid
where exists (select 1 from public.items where id = md5('pea-item:20-tipos-de-materias-y-tp')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:20-tipos-de-materias-y-tp:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:20-tipos-de-materias-y-tp:1:1')::uuid, $pea0$Una sola vez, en la fecha del calendario.$pea0$, true, 1),
  (md5('pea-opcion:20-tipos-de-materias-y-tp:1:2')::uuid, $pea0$Ilimitadas, hasta el cierre del SAM.$pea0$, false, 2),
  (md5('pea-opcion:20-tipos-de-materias-y-tp:1:3')::uuid, $pea0$Dos veces.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:20-tipos-de-materias-y-tp:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:20-tipos-de-materias-y-tp:2')::uuid, 'verdadero_falso', $pea0$Para regularizar hay que aprobar al menos 3 de los 4 TP con 5 o más.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:20-tipos-de-materias-y-tp')::uuid
where exists (select 1 from public.items where id = md5('pea-item:20-tipos-de-materias-y-tp')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:20-tipos-de-materias-y-tp:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:20-tipos-de-materias-y-tp:2:1')::uuid, $pea0$Verdadero$pea0$, true, 1),
  (md5('pea-opcion:20-tipos-de-materias-y-tp:2:2')::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:20-tipos-de-materias-y-tp:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:21-parciales-recuperatorios-integradores')::uuid, md5('pea-modulo:Evaluación (EVA 21)')::uuid, 21, $pea0$Parciales, recuperatorios e integradores$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Parciales: 20 preguntas de opción múltiple; se aprueban con 5 (9 correctas). El 1º toma los módulos 1 y 2; el 2º, los 3 y 4.","Recuperatorio: si sacó menos de 5 o faltó a un parcial, o para llevar a 7 un parcial si el otro ya es 7 o más. Reemplaza la nota, mayor o menor.","Integrador: 30 preguntas de los dos parciales, para quien desaprobó o faltó a ambos o los aprobó con 5 o 6. Aprueba con 5; promociona con 7.","Un parcial con 7 o más no se recupera.","Duración: parciales y recuperatorios, 40 minutos; integrador, 60; finales, 90."],"ejemplos":[{"consulta":"Saqué 4 en el primer parcial y 8 en el segundo.","respuesta":"Puede rendir el recuperatorio del parcial 1 o el integrador. La nota nueva reemplaza a la anterior."},{"consulta":"Tengo 6 y 6, ¿puedo promocionar?","respuesta":"Puede rendir el integrador: con 7 o más accede a la promoción directa, si cumple los TP y las demás condiciones."},{"consulta":"Saqué 7 en un parcial, ¿lo recupero para subir la nota?","respuesta":"No: un parcial con 7 o más no se recupera."}],"ojo":["Si se inscribe a un recuperatorio o integrador y no se presenta, la nota es 0 y cuenta para la materia.","En ED y EDH, el 1er parcial se rinde entre las semanas 1 y 4 y el 2do entre las semanas 5 y 8."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:21-parciales-recuperatorios-integradores:1')::uuid, 'opcion_multiple', $pea0$Un alumno sacó 3 y 3 en los parciales. ¿Qué puede rendir?$pea0$, $pea0$Con los dos parciales desaprobados corresponde el integrador.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:21-parciales-recuperatorios-integradores')::uuid
where exists (select 1 from public.items where id = md5('pea-item:21-parciales-recuperatorios-integradores')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:21-parciales-recuperatorios-integradores:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:21-parciales-recuperatorios-integradores:1:1')::uuid, $pea0$El recuperatorio del parcial 1.$pea0$, false, 1),
  (md5('pea-opcion:21-parciales-recuperatorios-integradores:1:2')::uuid, $pea0$El integrador.$pea0$, true, 2),
  (md5('pea-opcion:21-parciales-recuperatorios-integradores:1:3')::uuid, $pea0$Nada: queda libre.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:21-parciales-recuperatorios-integradores:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:21-parciales-recuperatorios-integradores:2')::uuid, 'verdadero_falso', $pea0$La nota del recuperatorio reemplaza a la del parcial aunque sea menor.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:21-parciales-recuperatorios-integradores')::uuid
where exists (select 1 from public.items where id = md5('pea-item:21-parciales-recuperatorios-integradores')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:21-parciales-recuperatorios-integradores:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:21-parciales-recuperatorios-integradores:2:1')::uuid, $pea0$Verdadero$pea0$, true, 1),
  (md5('pea-opcion:21-parciales-recuperatorios-integradores:2:2')::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:21-parciales-recuperatorios-integradores:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:22-inscripcion-a-examenes')::uuid, md5('pea-modulo:Evaluación (EVA 21)')::uuid, 22, $pea0$Inscripción a exámenes (ED, EDH y PD)$pea0$, 'leccion', a.id,
       $pea0${"resumen":["ED y EDH, parcial: inscripción hasta 24 horas antes. Esa inscripción no se anula ni se modifica.","Recuperatorio o integrador: inscripción hasta 24 horas antes; se puede anular hasta 48 horas antes.","Final: con al menos 4 días corridos de anticipación; se anula antes de que sea aceptada, es decir, hasta 8 días corridos antes.","PD: los parciales no requieren inscripción; finales, recuperatorios e integradores, con los mismos plazos.","Para rendir: DNI vigente, matrícula paga, estar inscripto y, si corresponde, notebook con el navegador institucional. Tolerancia: 15 minutos."],"ejemplos":[{"consulta":"Me anoté al parcial y no puedo ir, ¿lo cambio?","respuesta":"En ED y EDH la inscripción al parcial no se puede anular ni modificar."},{"consulta":"Quiero rendir el final el lunes, ¿me anoto hoy jueves?","respuesta":"No llega: hay que inscribirse con al menos 4 días corridos de anticipación."},{"consulta":"Me anoté al recuperatorio y no voy a poder ir.","respuesta":"Puede anular hasta 48 horas antes; si no se presenta, la nota es 0 y cuenta para la materia."},{"consulta":"¿Cuándo me anoto al EFIP?","respuesta":"Hasta 6 días corridos antes de la fecha; puede anular hasta 7 días antes. Las fechas salen en la Cartelera del Portal."}],"ojo":["Los turnos dependen de la disponibilidad de la sede o CAU.","Materias virtuales: la mesa de final se pide cuando está cargada la condición al terminar el bimestre."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:22-inscripcion-a-examenes:1')::uuid, 'opcion_multiple', $pea0$En ED, ¿hasta cuándo se puede anular la inscripción a un recuperatorio?$pea0$, $pea0$Se inscribe hasta 24 horas antes y se anula hasta 48 horas antes.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:22-inscripcion-a-examenes')::uuid
where exists (select 1 from public.items where id = md5('pea-item:22-inscripcion-a-examenes')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:22-inscripcion-a-examenes:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:22-inscripcion-a-examenes:1:1')::uuid, $pea0$Hasta 48 horas antes.$pea0$, true, 1),
  (md5('pea-opcion:22-inscripcion-a-examenes:1:2')::uuid, $pea0$Hasta 24 horas antes.$pea0$, false, 2),
  (md5('pea-opcion:22-inscripcion-a-examenes:1:3')::uuid, $pea0$No se puede anular.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:22-inscripcion-a-examenes:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:22-inscripcion-a-examenes:2')::uuid, 'verdadero_falso', $pea0$En ED, la inscripción a un parcial se puede anular hasta 24 horas antes.$pea0$, $pea0$La inscripción a un parcial en ED y EDH no se anula ni se modifica.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:22-inscripcion-a-examenes')::uuid
where exists (select 1 from public.items where id = md5('pea-item:22-inscripcion-a-examenes')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:22-inscripcion-a-examenes:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:22-inscripcion-a-examenes:2:1')::uuid, $pea0$Verdadero$pea0$, false, 1),
  (md5('pea-opcion:22-inscripcion-a-examenes:2:2')::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:22-inscripcion-a-examenes:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:23-ausencia-y-revision')::uuid, md5('pea-modulo:Evaluación (EVA 21)')::uuid, 23, $pea0$Ausencia a un examen y pedido de revisión$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Faltar a un examen, por cualquier motivo (personal, laboral, médico, paro), no permite reprogramarlo: queda Ausente.","En un final, el ausente además consume una de las 3 oportunidades antes de quedar Libre.","La revisión se pide en el sistema al terminar el examen: 10 minutos en parciales y 15 en finales. No hay otra vía.","La respuesta llega en 15 días. Si estaba desaprobado, puede cambiar la nota o habilitarse a rendir otra vez."],"ejemplos":[{"consulta":"Tuve fiebre y no pude rendir el parcial, ¿me lo reprograman?","respuesta":"No: las razones médicas tampoco habilitan a reprogramar; queda Ausente."},{"consulta":"Ayer rendí y una pregunta estaba mal corregida.","respuesta":"Ya no se puede pedir: la revisión solo se solicita en el sistema al terminar el examen (10 minutos en parciales, 15 en finales)."},{"consulta":"Pedí revisión, ¿cuándo me responden?","respuesta":"El plazo de respuesta es de 15 días."}],"ojo":["Hay casos especiales regulados (Res. CS 535/2017) que son excepción a esta regla: derivá.","Si no completa todos los datos del pedido de revisión, el pedido es nulo."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:23-ausencia-y-revision:1')::uuid, 'opcion_multiple', $pea0$¿Cuánto tiempo hay para pedir revisión al terminar un final?$pea0$, $pea0$10 minutos en parciales y 15 en finales, desde el sistema.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:23-ausencia-y-revision')::uuid
where exists (select 1 from public.items where id = md5('pea-item:23-ausencia-y-revision')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:23-ausencia-y-revision:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:23-ausencia-y-revision:1:1')::uuid, $pea0$15 minutos.$pea0$, true, 1),
  (md5('pea-opcion:23-ausencia-y-revision:1:2')::uuid, $pea0$10 minutos.$pea0$, false, 2),
  (md5('pea-opcion:23-ausencia-y-revision:1:3')::uuid, $pea0$15 días.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:23-ausencia-y-revision:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:24-condiciones-de-aprobacion')::uuid, md5('pea-modulo:Evaluación (EVA 21)')::uuid, 24, $pea0$Condiciones de aprobación y escala de notas$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Regular: 3 de 4 TP con 5 o más y 2 parciales con 5 o más (puede mediar recuperatorio o integrador). Rinde final de 30 preguntas.","Promoción directa: 3 de 4 TP con 7 o más, 2 parciales con 7 o más y correlativas aprobadas. Aprueba sin final.","Promoción indirecta: 4 de 4 TP con 7 o más, parciales con 5 o 6 y correlativas aprobadas. También aprueba sin final.","Final regular: aprueba con 4 (14 de 30), vigencia 18 meses, 3 oportunidades. Libre por nota: 50 preguntas, 3 meses, 1 oportunidad.","Asistencia del 75% en ED y PD; no aplica en EDH."],"ejemplos":[{"consulta":"¿Con cuánto apruebo el final regular?","respuesta":"Con 4, que equivale a 14 respuestas correctas de 30."},{"consulta":"Quedé libre por nota, ¿cuánto tiempo tengo?","respuesta":"3 meses y una sola oportunidad para el final de 50 preguntas; aprueba con 24 correctas."},{"consulta":"Promocioné pero me debe una correlativa.","respuesta":"Sin las correlativas aprobadas la materia queda Regular y tiene que rendir final."}],"ojo":["En PD, en MEC, MIA y MAP, el final suma un oral si aprueba el escrito; en MIP no.","Idiomas no tiene promoción indirecta."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:24-condiciones-de-aprobacion:1')::uuid, 'opcion_multiple', $pea0$Un alumno tiene 3 TP con 8, parciales con 7 y 9, y correlativas aprobadas. ¿Qué condición tiene?$pea0$, $pea0$3 de 4 TP y parciales con 7 o más, con correlativas aprobadas, es promoción directa.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:24-condiciones-de-aprobacion')::uuid
where exists (select 1 from public.items where id = md5('pea-item:24-condiciones-de-aprobacion')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:24-condiciones-de-aprobacion:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:24-condiciones-de-aprobacion:1:1')::uuid, $pea0$Promoción directa.$pea0$, true, 1),
  (md5('pea-opcion:24-condiciones-de-aprobacion:1:2')::uuid, $pea0$Regular.$pea0$, false, 2),
  (md5('pea-opcion:24-condiciones-de-aprobacion:1:3')::uuid, $pea0$Libre por nota.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:24-condiciones-de-aprobacion:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:24-condiciones-de-aprobacion:2')::uuid, 'verdadero_falso', $pea0$En EDH se exige el 75% de asistencia.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:24-condiciones-de-aprobacion')::uuid
where exists (select 1 from public.items where id = md5('pea-item:24-condiciones-de-aprobacion')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:24-condiciones-de-aprobacion:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:24-condiciones-de-aprobacion:2:1')::uuid, $pea0$Verdadero$pea0$, false, 1),
  (md5('pea-opcion:24-condiciones-de-aprobacion:2:2')::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:24-condiciones-de-aprobacion:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:25-materias-de-proceso')::uuid, md5('pea-modulo:Evaluación (EVA 21)')::uuid, 25, $pea0$Materias de proceso e idiomas en distancia$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Las materias de proceso no se promocionan ni se rinden libres: si no se cumplen las condiciones, quedan Libres y se recursan.","Práctica Solidaria: carga horaria completa con nota 5 o más de la organización, y 3 de 4 TP con el TP4 aprobado. Nota: promedio de TP, sin final.","Práctica Profesional: 250 horas con nota 7 o más de la organización, 3 de 4 TP con el TP4 aprobado y correlativas aprobadas.","Los TP de estas prácticas vencen en las semanas 6, 8, 12 y 15, el domingo a las 23:59.","Idiomas: placement test único; regular con 6 niveles seguidos al 70% o Avanzado 3; integrador de 50 preguntas, aprueba con 4."],"ejemplos":[{"consulta":"No llegué a las horas de la Práctica Profesional.","respuesta":"Sin las 250 horas no se aprueba; si no cumple al terminar el cursado queda Libre y la recursa."},{"consulta":"Aprobé la Práctica Profesional pero me debe una correlativa.","respuesta":"Queda Regular hasta aprobarla, con un máximo de 18 meses; si no, pierde la regularidad y recursa."},{"consulta":"No terminé los niveles de inglés este año.","respuesta":"Si no alcanza la regularidad en el año de cursado, pierde el avance y reinicia la materia."},{"consulta":"¿Puedo usar diccionario en el examen de inglés?","respuesta":"No: no se permiten diccionarios, glosarios ni listas de verbos."}],"ojo":["Para cursar el último semestre necesita todos los niveles de idioma aprobados.","Seminario de Práctica en distancia queda Regular y su nota es la del EFIP I.","Pregrado: Integración Profesional - Estudio del Caso pide el TP4 y 2 de los TP 1 a 3 con 5 o más."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:25-materias-de-proceso:1')::uuid, 'opcion_multiple', $pea0$¿Cuántas horas en una organización pide la Práctica Profesional?$pea0$, $pea0$250 horas con planilla de asistencia y evaluación de desempeño de 7 o más.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:25-materias-de-proceso')::uuid
where exists (select 1 from public.items where id = md5('pea-item:25-materias-de-proceso')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:25-materias-de-proceso:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:25-materias-de-proceso:1:1')::uuid, $pea0$250$pea0$, true, 1),
  (md5('pea-opcion:25-materias-de-proceso:1:2')::uuid, $pea0$100$pea0$, false, 2),
  (md5('pea-opcion:25-materias-de-proceso:1:3')::uuid, $pea0$400$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:25-materias-de-proceso:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:25-materias-de-proceso:2')::uuid, 'verdadero_falso', $pea0$Las materias de proceso se pueden rendir como libre por nota.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:25-materias-de-proceso')::uuid
where exists (select 1 from public.items where id = md5('pea-item:25-materias-de-proceso')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:25-materias-de-proceso:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:25-materias-de-proceso:2:1')::uuid, $pea0$Verdadero$pea0$, false, 1),
  (md5('pea-opcion:25-materias-de-proceso:2:2')::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:25-materias-de-proceso:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:26-efip')::uuid, md5('pea-modulo:Evaluación (EVA 21)')::uuid, 26, $pea0$EFIP I y EFIP II$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Solo para carreras de grado en ED y EDH; no para pregrado ni ciclos de complementación. Son presenciales, ante un tribunal.","EFIP I: integración curricular (escrita y oral) y, si la carrera tiene idiomas, producción en idioma. Hay que aprobar las dos en el mismo turno.","Para rendir EFIP I: Seminario de Práctica (o de Planificación y Control) Regular, o el Módulo EFIP I cursando o Regular, y las correlativas aprobadas.","EFIP I se rinde hasta 3 veces; si no aprueba, vuelve a cursar el Módulo EFIP I o el Seminario de Práctica.","EFIP II: todas las materias aprobadas (con Práctica Solidaria y electivas) y Seminario Final Regular. Es requisito para la defensa del TFG."],"ejemplos":[{"consulta":"Desaprobé el EFIP I tres veces.","respuesta":"Tiene que inscribirse de nuevo al Módulo EFIP I; si su carrera no lo tiene, recursa el Seminario de Práctica (o de Planificación y Control)."},{"consulta":"¿Puedo cursar materias de séptimo sin el EFIP I?","respuesta":"Como regla, en distancia necesita el EFIP I aprobado para cursar y aprobar 7º y 8º; en Abogacía y Contador depende de las correlativas."},{"consulta":"¿Dónde veo las fechas del EFIP?","respuesta":"En la Cartelera del Portal de estudiante, al inicio de cada año. Se inscribe hasta 6 días corridos antes."}],"ojo":["Sin EFIP I aprobado no puede inscribirse a cursar Seminario Final.","Aprobar el Seminario de Práctica no aprueba el EFIP I: igual tiene que rendirlo.","Para EFIP II necesita además el visado del analítico aprobado y no tener deuda.","La Universidad puede autorizar rendir en el CAU con tecnología; el examen queda grabado."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:26-efip:1')::uuid, 'opcion_multiple', $pea0$¿Quién rinde EFIP?$pea0$, $pea0$Aplica exclusivamente a carreras de grado de la modalidad Distancia.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:26-efip')::uuid
where exists (select 1 from public.items where id = md5('pea-item:26-efip')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:26-efip:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:26-efip:1:1')::uuid, $pea0$Estudiantes de grado en ED o EDH.$pea0$, true, 1),
  (md5('pea-opcion:26-efip:1:2')::uuid, $pea0$Estudiantes de pregrado en ED.$pea0$, false, 2),
  (md5('pea-opcion:26-efip:1:3')::uuid, $pea0$Estudiantes de grado en PD.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:26-efip:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:26-efip:2')::uuid, 'verdadero_falso', $pea0$El EFIP I se puede rendir hasta 3 veces.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:26-efip')::uuid
where exists (select 1 from public.items where id = md5('pea-item:26-efip')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:26-efip:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:26-efip:2:1')::uuid, $pea0$Verdadero$pea0$, true, 1),
  (md5('pea-opcion:26-efip:2:2')::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:26-efip:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:27-sanciones')::uuid, md5('pea-modulo:Cursado')::uuid, 27, $pea0$Sanciones$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Las faltas son leves, graves, muy graves o gravísimas; el plagio también se gradúa de leve a gravísimo.","Según la gravedad: llamado de atención, apercibimiento, suspensión o expulsión.","Además se pone 0 en la actividad; con la suspensión, la materia queda Libre.","Todas las sanciones, salvo el llamado de atención, quedan registradas en el certificado analítico.","En exámenes son faltas: leer en voz alta, usar el teclado o auriculares, desviar la mirada, tapar la cámara o apagar el micrófono."],"ejemplos":[{"consulta":"En el examen me marcaron por mirar para el costado.","respuesta":"Desviar la mirada de forma sostenida es una falta leve: corresponde un llamado de atención con nota 0 en esa instancia."},{"consulta":"Copié un TP de un compañero, ¿qué me puede pasar?","respuesta":"La copia en TP es una falta leve: llamado de atención y 0 en la actividad. Si es plagio más grave, la sanción sube."},{"consulta":"¿La sanción queda en mi analítico?","respuesta":"Sí, salvo el llamado de atención, que queda solo en su legajo."}],"ojo":["La expulsión es definitiva y se comunica a todo el Sistema Universitario Nacional.","No rendir en el CAU cuando la modalidad lo exige también es falta leve."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-13-1-regimen-general-de-sanciones$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:27-sanciones:1')::uuid, 'opcion_multiple', $pea0$¿Qué sanción no figura en el certificado analítico?$pea0$, $pea0$El llamado de atención queda solo en el legajo.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:27-sanciones')::uuid
where exists (select 1 from public.items where id = md5('pea-item:27-sanciones')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:27-sanciones:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:27-sanciones:1:1')::uuid, $pea0$Llamado de atención.$pea0$, true, 1),
  (md5('pea-opcion:27-sanciones:1:2')::uuid, $pea0$Apercibimiento.$pea0$, false, 2),
  (md5('pea-opcion:27-sanciones:1:3')::uuid, $pea0$Suspensión.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:27-sanciones:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:28-condiciones-de-graduacion')::uuid, md5('pea-modulo:Egreso')::uuid, 28, $pea0$Condiciones para la graduación$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Para egresar hay una evaluación integral: en pregrado, la materia Integración Profesional - Estudio del Caso; en grado, el Trabajo Final de Graduación (TFG) con defensa oral.","En todos los casos las citas van con normas APA; omitirlas es una falta por plagio.","En grado, el TFG se aprueba en un máximo de 18 meses desde que regulariza Seminario Final; si no, queda Libre en Seminario Final."],"ejemplos":[{"consulta":"Estudio una tecnicatura, ¿tengo que hacer un trabajo final?","respuesta":"En pregrado la instancia final es la materia Integración Profesional - Estudio del Caso, no un TFG."},{"consulta":"Regularicé Seminario Final hace 2 años y no defendí.","respuesta":"Pasados 18 meses sin aprobar el TFG queda Libre en Seminario Final y tiene que recursarla."}],"ojo":["Después del egreso siguen el trámite del título (tasa y hasta 120 días) y la colación: mirá esas lecciones."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-12-1-condiciones-para-la-graduacion$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:28-condiciones-de-graduacion:1')::uuid, 'verdadero_falso', $pea0$En grado, el TFG se tiene que aprobar dentro de los 18 meses de regularizar Seminario Final.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:28-condiciones-de-graduacion')::uuid
where exists (select 1 from public.items where id = md5('pea-item:28-condiciones-de-graduacion')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:28-condiciones-de-graduacion:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:28-condiciones-de-graduacion:1:1')::uuid, $pea0$Verdadero$pea0$, true, 1),
  (md5('pea-opcion:28-condiciones-de-graduacion:1:2')::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:28-condiciones-de-graduacion:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:29-trabajo-final-de-grado')::uuid, md5('pea-modulo:Egreso')::uuid, 29, $pea0$Trabajo Final de Graduación (TFG)$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Tiene 3 etapas: Seminario Final, Comisión Académica Evaluadora (CAE) y Defensa Oral.","En distancia, Seminario Final se regulariza cumpliendo las entregas de avance del tutor. No hay prórrogas.","La CAE evalúa el TFG en 60 días: puede habilitar la defensa, pedir ajustes con un plazo o no aprobarlo.","Habilitado, se inscribe a la mesa de Defensa Oral en un máximo de 30 días corridos.","La nota final pondera Seminario Final, CAE y defensa; con menos de 4 se recursa Seminario Final."],"ejemplos":[{"consulta":"Ya regularicé Seminario Final, ¿qué sigue?","respuesta":"Se le asigna una CAE, que evalúa el trabajo en un plazo de 60 días."},{"consulta":"La CAE me pidió cambios.","respuesta":"Recibe un acta rúbrica con las recomendaciones y el plazo para entregar el trabajo ajustado."},{"consulta":"Me habilitaron a defensa, ¿hay plazo para anotarme?","respuesta":"Sí: tiene que inscribirse a la mesa de Defensa Oral dentro de los 30 días corridos."}],"ojo":["Para la Defensa Oral necesita el EFIP II aprobado.","El TFG es individual."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-12-2-trabajo-final-de-graduacion$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:29-trabajo-final-de-grado:1')::uuid, 'opcion_multiple', $pea0$¿Cuál es la segunda etapa del TFG?$pea0$, $pea0$Seminario Final, CAE y Defensa Oral, en ese orden.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:29-trabajo-final-de-grado')::uuid
where exists (select 1 from public.items where id = md5('pea-item:29-trabajo-final-de-grado')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:29-trabajo-final-de-grado:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:29-trabajo-final-de-grado:1:1')::uuid, $pea0$La Comisión Académica Evaluadora (CAE).$pea0$, true, 1),
  (md5('pea-opcion:29-trabajo-final-de-grado:1:2')::uuid, $pea0$La Defensa Oral.$pea0$, false, 2),
  (md5('pea-opcion:29-trabajo-final-de-grado:1:3')::uuid, $pea0$El Seminario Final.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:29-trabajo-final-de-grado:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:30-portal-de-estudiantes')::uuid, md5('pea-modulo:Plataformas y atención')::uuid, 30, $pea0$Portal de Estudiantes$pea0$, 'leccion', a.id,
       $pea0${"resumen":["En el Portal ve su carrera y su avance, se inscribe a materias y exámenes, paga por ePagos y usa el simulador de pagos.","Se entra con la cuenta institucional: usuario@soysiglo.21.edu.ar y su contraseña.","Si da error al entrar: borrar cookies y caché, y probar otro navegador o una ventana de incógnito.","En \"Más opciones\" hay una guía del portal, cambio de contraseña y datos de contacto."],"ejemplos":[{"consulta":"No puedo entrar al portal, me da error.","respuesta":"Que borre las cookies y la caché del navegador y vuelva a intentar; si sigue, otro navegador o modo incógnito."},{"consulta":"¿Dónde me inscribo a un final?","respuesta":"En el Portal de Estudiantes, en el módulo de inscripción a exámenes."},{"consulta":"¿Con qué usuario entro?","respuesta":"Con su correo institucional (usuario@soysiglo.21.edu.ar) y su contraseña."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-portal-de-estudiantes$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:30-portal-de-estudiantes:1')::uuid, 'opcion_multiple', $pea0$Un alumno no puede entrar al portal. ¿Qué le sugerís primero?$pea0$, $pea0$Es el primer paso que indica la guía del portal.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:30-portal-de-estudiantes')::uuid
where exists (select 1 from public.items where id = md5('pea-item:30-portal-de-estudiantes')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:30-portal-de-estudiantes:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:30-portal-de-estudiantes:1:1')::uuid, $pea0$Borrar cookies y caché del navegador e intentar de nuevo.$pea0$, true, 1),
  (md5('pea-opcion:30-portal-de-estudiantes:1:2')::uuid, $pea0$Hacer un cambio de carrera.$pea0$, false, 2),
  (md5('pea-opcion:30-portal-de-estudiantes:1:3')::uuid, $pea0$Esperar al próximo semestre.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:30-portal-de-estudiantes:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:31-aula-virtual')::uuid, md5('pea-modulo:Plataformas y atención')::uuid, 31, $pea0$Aula Virtual (Canvas)$pea0$, 'leccion', a.id,
       $pea0${"resumen":["El Aula Virtual es Canvas: ahí están las materias, se presentan las actividades y se contacta al docente.","Se entra eligiendo Soy Estudiante y la cuenta institucional.","Si olvidó la contraseña, la restablece desde el enlace de recuperación, con su usuario sin @soysiglo.21.edu.ar.","Las dudas de contenido de cada materia van al docente, por la mensajería del aula."],"ejemplos":[{"consulta":"Olvidé la contraseña del aula.","respuesta":"Desde el enlace de recuperación, con su usuario institucional sin el @soysiglo.21.edu.ar; después confirma su correo de recuperación."},{"consulta":"¿Cómo le escribo al profesor?","respuesta":"Por la mensajería de su Aula Virtual (Canvas)."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-aula-virtual$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:31-aula-virtual:1')::uuid, 'verdadero_falso', $pea0$El Aula Virtual de la Universidad es Canvas.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:31-aula-virtual')::uuid
where exists (select 1 from public.items where id = md5('pea-item:31-aula-virtual')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:31-aula-virtual:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:31-aula-virtual:1:1')::uuid, $pea0$Verdadero$pea0$, true, 1),
  (md5('pea-opcion:31-aula-virtual:1:2')::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:31-aula-virtual:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:32-klarway')::uuid, md5('pea-modulo:Plataformas y atención')::uuid, 32, $pea0$Exámenes online con Klarway$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Los exámenes online se rinden con Klarway (Sistema Online de Exámenes), una app de escritorio para PC y algunas Mac, con validación de identidad.","Antes hay que registrarse una vez: DNI (digital o físico) o pasaporte, lugar iluminado, fondo liso y sin auriculares.","Al rendir: cerrar los programas, entrar con las credenciales del Portal, validar el rostro y aceptar las condiciones.","Recomendaciones: buena luz, batería al 80% o cargador, micrófono encendido y lugar silencioso."],"ejemplos":[{"consulta":"¿Puedo rendir desde el celular?","respuesta":"No: Klarway es una aplicación de escritorio para PC y algunas versiones de Mac."},{"consulta":"Me falló Klarway rindiendo desde casa.","respuesta":"Que saque una captura del error con fecha y hora visibles y la envíe por Consulta Alumnos, Área Tecnológica, Sistema de Examen. También puede contactar a su CAU."},{"consulta":"Me pide registrarme, ¿qué necesito?","respuesta":"Su DNI o pasaporte y la app instalada. La foto, en un lugar iluminado, con fondo liso, sin auriculares y con ropa adecuada."}],"ojo":["Durante el examen no puede usar auriculares, apagar el micrófono ni tapar la cámara: son faltas sancionables."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-klarway$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:32-klarway:1')::uuid, 'opcion_multiple', $pea0$Un alumno tuvo un error de Klarway rindiendo en su casa. ¿Qué tiene que enviar?$pea0$, $pea0$La captura tiene que mostrar el día y la hora.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:32-klarway')::uuid
where exists (select 1 from public.items where id = md5('pea-item:32-klarway')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:32-klarway:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:32-klarway:1:1')::uuid, $pea0$Una captura del error con fecha y hora, por Consulta Alumnos.$pea0$, true, 1),
  (md5('pea-opcion:32-klarway:1:2')::uuid, $pea0$Un audio por WhatsApp al docente.$pea0$, false, 2),
  (md5('pea-opcion:32-klarway:1:3')::uuid, $pea0$Nada: se reprograma solo.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:32-klarway:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:33-canales-de-contacto')::uuid, md5('pea-modulo:Plataformas y atención')::uuid, 33, $pea0$Canales de contacto$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Dudas de contenido de una materia: al docente, por la mensajería del Aula Virtual.","Consulta escrita: en Consultar, elegir el legajo, el motivo en Título de tipificación, describir el caso y adjuntar si hace falta.","También puede chatear en el momento con un Asesor Institucional.","Los datos de cada CAU están en el mapa de Sedes y Centros; los directores de carrera tienen su mail publicado."],"ejemplos":[{"consulta":"¿Cómo dejo una consulta por escrito?","respuesta":"En Consultar: elige el legajo, el motivo en Título de tipificación, describe el caso y adjunta un archivo si hace falta."},{"consulta":"Quiero hablar con alguien ahora.","respuesta":"Puede chatear con un Asesor Institucional en el momento."},{"consulta":"Quiero contactarme con otros estudiantes.","respuesta":"Puede sumarse a ComunidadNET."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-canales-de-contacto$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:33-canales-de-contacto:1')::uuid, 'opcion_multiple', $pea0$Una duda sobre el contenido de una materia, ¿a quién va?$pea0$, $pea0$El contenido de cada materia lo responde el docente a cargo.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:33-canales-de-contacto')::uuid
where exists (select 1 from public.items where id = md5('pea-item:33-canales-de-contacto')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:33-canales-de-contacto:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:33-canales-de-contacto:1:1')::uuid, $pea0$Al docente, por la mensajería del Aula Virtual.$pea0$, true, 1),
  (md5('pea-opcion:33-canales-de-contacto:1:2')::uuid, $pea0$A la biblioteca.$pea0$, false, 2),
  (md5('pea-opcion:33-canales-de-contacto:1:3')::uuid, $pea0$A Tesorería.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:33-canales-de-contacto:1')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:34-tutores-virtuales')::uuid, md5('pea-modulo:Plataformas y atención')::uuid, 34, $pea0$Profesores Tutores Virtuales$pea0$, 'leccion', a.id,
       $pea0${"resumen":["El Centro de Profesores Tutores Virtuales (CPV) acompaña el primer año: organización, cursado, plataforma y modelo de aprendizaje.","Las dudas de contenido de cada materia no van al tutor: van al docente, por la mensajería de Canvas.","Al tutor se le escribe desde la Bandeja de Entrada de Canvas; también hay consultas por Teams en horarios fijos.","Talleres Potenciar 21: hábitos de estudio y organización. El cronograma está en los anuncios de cada materia."],"ejemplos":[{"consulta":"Soy nuevo y no sé cómo organizarme.","respuesta":"Su Profesor Tutor Virtual lo acompaña en el primer año; también puede sumarse a los Talleres Potenciar 21."},{"consulta":"Le pregunté al tutor una duda de contenido y no me la resolvió.","respuesta":"Las dudas del contenido de cada materia van al docente a cargo, por la mensajería del aula."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-tutoresvirtuales$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:34-tutores-virtuales:1')::uuid, 'verdadero_falso', $pea0$El tutor virtual resuelve las dudas de contenido de cada materia.$pea0$, $pea0$El tutor acompaña la organización y el cursado; el contenido lo responde el docente.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:34-tutores-virtuales')::uuid
where exists (select 1 from public.items where id = md5('pea-item:34-tutores-virtuales')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:34-tutores-virtuales:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:34-tutores-virtuales:1:1')::uuid, $pea0$Verdadero$pea0$, false, 1),
  (md5('pea-opcion:34-tutores-virtuales:1:2')::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:34-tutores-virtuales:1')::uuid)
on conflict do nothing;
