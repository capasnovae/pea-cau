-- Generado por scripts/importar-lecciones.mts a partir de contenido/lecciones. No editar a mano.

-- Borradores "A validar": coordinación los revisa y publica (junto con sus artículos fuente).

insert into public.cursos (id, tipo, titulo, descripcion_md, alcance, estado)
values (md5('pea-curso:reglamento-esencial')::uuid, 'capacitacion', 'Reglamento esencial', $pea0$Lecciones cortas a partir del reglamento. A validar.$pea0$, 'global', 'borrador')
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values (md5('pea-modulo:Cursado')::uuid, md5('pea-curso:reglamento-esencial')::uuid, 1, $pea0$Cursado$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values (md5('pea-modulo:Trámites')::uuid, md5('pea-curso:reglamento-esencial')::uuid, 2, $pea0$Trámites$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values (md5('pea-modulo:Egreso')::uuid, md5('pea-curso:reglamento-esencial')::uuid, 3, $pea0$Egreso$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values (md5('pea-modulo:Administración')::uuid, md5('pea-curso:reglamento-esencial')::uuid, 4, $pea0$Administración$pea0$)
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
select md5('pea-item:02-modalidades')::uuid, md5('pea-modulo:Cursado')::uuid, 2, $pea0$Modalidades de cursado$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Presencial tiene tres sub-modalidades: Presencial (P), Presencial Home (PH) y Presencial Distribuida (PD).","En Presencial (P) la presencialidad mínima es del 70%; en Presencial Home (PH), del 50%. Para PD, consultá la fuente.","Distancia tiene dos: Educación Distribuida (ED), con Open Class en el CAU, y Educación Distribuida Home (EDH), 100% en la plataforma.","En ED, cada subperíodo dura 9 semanas y se asiste al CAU cada 2 semanas por materia."],"ejemplos":[{"consulta":"Trabajo todo el día, ¿qué modalidad me conviene?","respuesta":"Distancia está pensada para quien no puede asistir regularmente: ED con encuentros en el CAU o EDH, íntegramente en la plataforma."},{"consulta":"¿En ED tengo que ir al CAU?","respuesta":"Sí, a las Open Class: cada 2 semanas por materia, en las fechas del calendario. En EDH no hay asistencia al CAU."},{"consulta":"¿Cuánto tengo que ir en Presencial Home?","respuesta":"Como mínimo el 50% de la carga horaria es presencial; en Presencial (P), el 70%."}],"ojo":["Si en el CAU no se llega a 5 ingresantes de la misma carrera, la Universidad puede pasar a los de ED a EDH.","Quienes necesitan ajustes razonables rinden obligatoriamente en su sede o CAU, no en su casa."]}$pea0$::jsonb, 'marcar_hecho'
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
select md5('pea-pregunta:02-modalidades:2')::uuid, 'verdadero_falso', $pea0$En Presencial Home la presencialidad mínima es del 50%.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
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
       $pea0${"resumen":["Se inscribe en el período del Calendario Académico. Cerrado el período, no hay inscripción.","Necesita aranceles al día, legajo completo, estar matriculado y respetar las correlativas.","Para materias de cuarto cuatrimestre, debe tener aprobado Universitario 21.","Queda inscripto a la materia solo cuando pagó los aranceles e hizo la inscripción.","Los ingresantes quedan inscriptos automáticamente al primer semestre."],"ejemplos":[{"consulta":"Se me pasó la fecha, ¿me pueden anotar?","respuesta":"No: una vez cerrado el período del Calendario Académico no se puede inscribir."},{"consulta":"Me anoté pero no pagué, ¿estoy cursando?","respuesta":"No todavía: la inscripción a la materia queda firme cuando están pagos los aranceles."},{"consulta":"Estudio a distancia, ¿cuántas materias puedo hacer?","respuesta":"En grado, hasta 6 al inicio del semestre más 2 adicionales si las correlativas lo permiten. Las extras tienen un arancel aparte."}],"ojo":["Los ingresantes no pueden anotarse a materias extra.","En Presencial (P) y Presencial Distribuida (PD) el máximo es de 8 materias; cada extra se paga aparte.","Práctica Solidaria y Práctica Profesional: inscripción hasta el viernes previo al inicio de clases."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-2-inscripcion-a-materias$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:03-inscripcion-a-materias:1')::uuid, 'opcion_multiple', $pea0$Un alumno de distancia quiere cursar una materia de cuarto cuatrimestre. ¿Qué tiene que tener aprobado sí o sí?$pea0$, $pea0$Para materias de cuarto cuatrimestre se pide Universitario 21 aprobado.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:03-inscripcion-a-materias')::uuid
where exists (select 1 from public.items where id = md5('pea-item:03-inscripcion-a-materias')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:03-inscripcion-a-materias:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:03-inscripcion-a-materias:1:1')::uuid, $pea0$El Seminario Final.$pea0$, false, 1),
  (md5('pea-opcion:03-inscripcion-a-materias:1:2')::uuid, $pea0$Universitario 21.$pea0$, true, 2),
  (md5('pea-opcion:03-inscripcion-a-materias:1:3')::uuid, $pea0$Todas las materias de tercer cuatrimestre.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:03-inscripcion-a-materias:1')::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:03-inscripcion-a-materias:2')::uuid, 'verdadero_falso', $pea0$Quien se anotó a una materia pero no pagó los aranceles ya está inscripto al cursado.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:03-inscripcion-a-materias')::uuid
where exists (select 1 from public.items where id = md5('pea-item:03-inscripcion-a-materias')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:03-inscripcion-a-materias:2')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:03-inscripcion-a-materias:2:1')::uuid, $pea0$Verdadero$pea0$, false, 1),
  (md5('pea-opcion:03-inscripcion-a-materias:2:2')::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = md5('pea-pregunta:03-inscripcion-a-materias:2')::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select md5('pea-item:04-cambio-de-catedra')::uuid, md5('pea-modulo:Cursado')::uuid, 4, $pea0$Cambio de cátedra$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Solo para Presencial, Presencial Home y Presencial Distribuida.","Se pide en el período del Calendario Académico y solo si hay superposición de horarios entre materias del mismo semestre.","Requisitos: aranceles del semestre pagos y cambiar a una cátedra del mismo turno."],"ejemplos":[{"consulta":"Se me superponen dos materias del mismo cuatrimestre.","respuesta":"Puede pedir cambio de cátedra en el período del calendario, con los aranceles pagos y a una cátedra del mismo turno."},{"consulta":"Quiero pasarme a la cátedra de la tarde porque me queda mejor.","respuesta":"Solo se cambia si hay superposición de horarios y siempre dentro del mismo turno."},{"consulta":"Estudio en ED, ¿puedo cambiar de cátedra?","respuesta":"No: el cambio de cátedra es solo para las modalidades presenciales."}],"ojo":["Si cursa materias de distintos cuatrimestres a la vez, la Universidad no garantiza que no haya superposiciones."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-4-cambio-de-catedra$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select md5('pea-pregunta:04-cambio-de-catedra:1')::uuid, 'opcion_multiple', $pea0$¿En qué caso corresponde un cambio de cátedra?$pea0$, $pea0$Solo con superposición, dentro del mismo turno y en modalidades presenciales.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', md5('pea-item:04-cambio-de-catedra')::uuid
where exists (select 1 from public.items where id = md5('pea-item:04-cambio-de-catedra')::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, md5('pea-pregunta:04-cambio-de-catedra:1')::uuid, x.texto, x.correcta, x.orden from (values
  (md5('pea-opcion:04-cambio-de-catedra:1:1')::uuid, $pea0$Superposición de horarios entre materias del mismo semestre, en modalidad presencial.$pea0$, true, 1),
  (md5('pea-opcion:04-cambio-de-catedra:1:2')::uuid, $pea0$Preferencia por otro docente, en cualquier modalidad.$pea0$, false, 2),
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
       $pea0${"resumen":["La matrícula es semestral y debe estar paga y activa para rendir parciales, finales o la defensa del Seminario Final.","Los aranceles se pagan por paquete de materias según carrera y modalidad.","Las materias extra tienen arancel aparte (en PH, ED y EDH de grado, 1/6 del arancel A+B) y no les aplican becas.","No se reintegra dinero por no completar el cursado por causas personales."],"ejemplos":[{"consulta":"No pagué la matrícula, ¿puedo rendir el final igual?","respuesta":"No: para rendir parciales, finales o la defensa del Seminario Final la matrícula tiene que estar paga y activa."},{"consulta":"Dejé de cursar a mitad de semestre, ¿me devuelven el ticket?","respuesta":"No: no hay reintegro cuando el servicio fue prestado y deja por causas personales."},{"consulta":"Mi beca, ¿cubre la materia extra?","respuesta":"No: en materias extra y en las de verano no aplican becas ni beneficios."}],"ojo":["Sin actividad académica por más de 1 año calendario queda en baja administrativa y debe matricularse de nuevo.","Suspender el cursado no cambia la regularidad, pero para retomar debe cancelar la deuda de ese período."]}$pea0$::jsonb, 'marcar_hecho'
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
