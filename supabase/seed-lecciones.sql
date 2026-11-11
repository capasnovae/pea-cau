-- Generado por scripts/importar-lecciones.mts a partir de contenido/lecciones. No editar a mano.

-- Borradores "A validar": coordinación los revisa y publica (junto con sus artículos fuente).

insert into public.cursos (id, tipo, titulo, descripcion_md, alcance, estado)
values ('e53c3af0-f81a-4a01-8604-c2525d27d326'::uuid, 'capacitacion', $pea0$Plataformas del estudiante$pea0$, $pea0$Portal de Estudiantes, Aula Virtual (Canvas), app y exámenes online. A validar.$pea0$, 'global', 'borrador')
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid, 'e53c3af0-f81a-4a01-8604-c2525d27d326'::uuid, 1, $pea0$Portal y aula$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid, 'e53c3af0-f81a-4a01-8604-c2525d27d326'::uuid, 2, $pea0$Exámenes online$pea0$)
on conflict do nothing;

insert into public.cursos (id, tipo, titulo, descripcion_md, alcance, estado)
values ('f928a96f-8136-4848-84e6-283de543bf0b'::uuid, 'capacitacion', $pea0$Cursado y modalidades$pea0$, $pea0$Ingreso, modalidades ED, EDH y PD, inscripción y calendario. A validar.$pea0$, 'global', 'borrador')
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid, 'f928a96f-8136-4848-84e6-283de543bf0b'::uuid, 1, $pea0$Ingreso$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid, 'f928a96f-8136-4848-84e6-283de543bf0b'::uuid, 2, $pea0$Modalidades$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('e3a09525-da75-41c0-827b-bb9e91335610'::uuid, 'f928a96f-8136-4848-84e6-283de543bf0b'::uuid, 3, $pea0$Cursado$pea0$)
on conflict do nothing;

insert into public.cursos (id, tipo, titulo, descripcion_md, alcance, estado)
values ('b2496c9c-792e-4395-8fa5-cd575aa2d644'::uuid, 'capacitacion', $pea0$Evaluación (EVA 21)$pea0$, $pea0$Trabajos prácticos, exámenes, condiciones de aprobación, prácticas y EFIP. A validar.$pea0$, 'global', 'borrador')
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid, 'b2496c9c-792e-4395-8fa5-cd575aa2d644'::uuid, 1, $pea0$Trabajos y exámenes$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('ded24f8c-0a3b-444b-8201-48f555f45573'::uuid, 'b2496c9c-792e-4395-8fa5-cd575aa2d644'::uuid, 2, $pea0$Aprobación$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid, 'b2496c9c-792e-4395-8fa5-cd575aa2d644'::uuid, 3, $pea0$Materias especiales$pea0$)
on conflict do nothing;

insert into public.cursos (id, tipo, titulo, descripcion_md, alcance, estado)
values ('9fe6df40-deab-4faa-8040-e0ecc8236963'::uuid, 'capacitacion', $pea0$Trámites$pea0$, $pea0$Cambio de modalidad, equivalencias y baja. A validar.$pea0$, 'global', 'borrador')
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid, '9fe6df40-deab-4faa-8040-e0ecc8236963'::uuid, 1, $pea0$Trámites$pea0$)
on conflict do nothing;

insert into public.cursos (id, tipo, titulo, descripcion_md, alcance, estado)
values ('6b54eb6c-d227-47ed-8717-9d6b6a2dbe62'::uuid, 'capacitacion', $pea0$Aranceles, becas y pagos$pea0$, $pea0$Matrícula, aranceles, pagos, deuda, becas y beneficios. A validar.$pea0$, 'global', 'borrador')
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid, '6b54eb6c-d227-47ed-8717-9d6b6a2dbe62'::uuid, 1, $pea0$Aranceles y pagos$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('7dd9fd98-5e03-4d1b-8cea-6b5288e2a78b'::uuid, '6b54eb6c-d227-47ed-8717-9d6b6a2dbe62'::uuid, 2, $pea0$Becas y beneficios$pea0$)
on conflict do nothing;

insert into public.cursos (id, tipo, titulo, descripcion_md, alcance, estado)
values ('392c63fd-382d-4643-8e37-96656a8b45e4'::uuid, 'capacitacion', $pea0$Egreso$pea0$, $pea0$Graduación, Trabajo Final de Graduación, título y colación. A validar.$pea0$, 'global', 'borrador')
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('d51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid, '392c63fd-382d-4643-8e37-96656a8b45e4'::uuid, 1, $pea0$Trabajo final$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid, '392c63fd-382d-4643-8e37-96656a8b45e4'::uuid, 2, $pea0$Título y colación$pea0$)
on conflict do nothing;

insert into public.cursos (id, tipo, titulo, descripcion_md, alcance, estado)
values ('72e9fb9b-76fd-4d7e-80c5-9da430f7ba59'::uuid, 'capacitacion', $pea0$Normas y acompañamiento$pea0$, $pea0$Sanciones, canales de contacto, tutores y bienestar. A validar.$pea0$, 'global', 'borrador')
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('2594b0a0-0047-4677-845e-19307b8d00ef'::uuid, '72e9fb9b-76fd-4d7e-80c5-9da430f7ba59'::uuid, 1, $pea0$Normas$pea0$)
on conflict do nothing;

insert into public.modulos (id, curso_id, orden, titulo)
values ('68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid, '72e9fb9b-76fd-4d7e-80c5-9da430f7ba59'::uuid, 2, $pea0$Acompañamiento$pea0$)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '0c8bd593-8354-49df-8d58-bb7d3fb8bcdf'::uuid, 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid, 1, $pea0$Requisitos para cursar$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Hace falta conexión a Internet. Si no la tiene, debe informarlo a la Universidad para que evalúe su caso.","El correo electrónico que registra es el canal oficial: ahí llegan todas las notificaciones. Mantenerlo actualizado es su responsabilidad.","Para rendir exámenes virtuales o usar software especial necesita notebook con cámara y micrófono (Windows 10 o superior, o Mac Monterrey 12.6.3 o superior).","Seguir cursando depende de no tener sanciones académicas o administrativas."],"ejemplos":[{"consulta":"No me llegan los avisos de la facultad.","respuesta":"Que revise el correo que tiene registrado: es el canal oficial. Si cambió de mail, tiene que actualizarlo en sus datos."},{"consulta":"¿Puedo rendir el virtual desde la tablet?","respuesta":"No: para exámenes virtuales se pide notebook con cámara y micrófono, con Windows 10 o superior o Mac Monterrey 12.6.3 o superior."},{"consulta":"No tengo Internet en casa, ¿puedo cursar igual?","respuesta":"Tiene que informarlo a la Universidad, que evalúa si puede admitirlo o continuar."}],"ojo":["Una expulsión en otra universidad o instituto oficial inhabilita para cursar, salvo resolución del Rectorado.","En carreras que lo piden, el ambo o la chaquetilla es obligatorio y lo compra cada estudiante."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-2-5-requisitos-para-cursado$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'da469af9-09e9-45b9-89a6-f52b16e9e992'::uuid, 'opcion_multiple', $pea0$Un alumno dice que no recibió un aviso importante. ¿Qué es lo primero que le pedís?$pea0$, $pea0$El correo registrado es el canal oficial de comunicación de la Universidad.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0c8bd593-8354-49df-8d58-bb7d3fb8bcdf'::uuid
where exists (select 1 from public.items where id = '0c8bd593-8354-49df-8d58-bb7d3fb8bcdf'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'da469af9-09e9-45b9-89a6-f52b16e9e992'::uuid, x.texto, x.correcta, x.orden from (values
  ('81285ba4-c164-492b-816b-a3c561be4a19'::uuid, $pea0$Que espere a que se lo manden por WhatsApp.$pea0$, false, 1),
  ('2e9415c0-027f-4690-8ee0-9809938f0959'::uuid, $pea0$Que revise el correo registrado y lo actualice si cambió.$pea0$, true, 2),
  ('612df04f-d3db-4821-8b13-34e5de4b3fae'::uuid, $pea0$Que pida un certificado de cursado.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'da469af9-09e9-45b9-89a6-f52b16e9e992'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'b9704758-3057-4bee-882b-681051a82bff'::uuid, 'verdadero_falso', $pea0$Para rendir un examen virtual alcanza con el celular.$pea0$, $pea0$Se pide notebook con cámara y micrófono que cumpla los requisitos técnicos.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0c8bd593-8354-49df-8d58-bb7d3fb8bcdf'::uuid
where exists (select 1 from public.items where id = '0c8bd593-8354-49df-8d58-bb7d3fb8bcdf'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'b9704758-3057-4bee-882b-681051a82bff'::uuid, x.texto, x.correcta, x.orden from (values
  ('51ad65fd-e151-402d-8989-9d4936fabe9e'::uuid, $pea0$Verdadero$pea0$, false, 1),
  ('b77b68a8-e9f5-48bb-83ba-c37eac873725'::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'b9704758-3057-4bee-882b-681051a82bff'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'a0ce0cfc-f526-4528-83dd-560760fd78fa'::uuid, '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid, 2, $pea0$Modalidades del CAU: ED, EDH y PD$pea0$, 'leccion', a.id,
       $pea0${"resumen":["En el CAU se cursan carreras de grado y pregrado en tres modalidades: ED, EDH y PD.","ED: plataforma más Open Class en el CAU. Cada subperíodo dura 9 semanas y se asiste cada 2 semanas por materia.","En ED se cursan hasta 2 materias con asistencia al CAU por subperíodo; en grado se puede sumar 1 materia 100% virtual.","EDH: todo el cursado es en la plataforma, sin asistencia al CAU.","PD: es presencial; las materias se cursan cuatrimestralmente con actividades sincrónicas."],"ejemplos":[{"consulta":"Trabajo todo el día, ¿qué me conviene?","respuesta":"Distancia está pensada para quien no puede asistir regularmente: ED, con Open Class en el CAU, o EDH, íntegramente en la plataforma."},{"consulta":"¿En ED tengo que venir al CAU?","respuesta":"Sí, a las Open Class: cada 2 semanas por materia, en las fechas del calendario. En EDH no hay asistencia al CAU."},{"consulta":"¿Puedo sumar una materia sin venir al CAU?","respuesta":"En carreras de grado en ED puede sumar 1 materia íntegramente virtual por subperíodo, que se rige por las reglas de EDH."}],"ojo":["Si en el CAU no se llega a 5 ingresantes de la misma carrera, la Universidad puede pasar a los de ED a EDH.","Quienes necesitan ajustes razonables rinden obligatoriamente en su sede o CAU, no en su casa.","El 75% de asistencia de las condiciones de aprobación no aplica en EDH."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-3-1-modalidades-de-cursado$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '0cd974c7-c188-4575-8ad2-9d3615efe786'::uuid, 'opcion_multiple', $pea0$¿Qué sub-modalidad se cursa íntegramente en la plataforma, sin ir al CAU?$pea0$, $pea0$En EDH todo el cursado es en la plataforma; en ED hay Open Class en el CAU.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a0ce0cfc-f526-4528-83dd-560760fd78fa'::uuid
where exists (select 1 from public.items where id = 'a0ce0cfc-f526-4528-83dd-560760fd78fa'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '0cd974c7-c188-4575-8ad2-9d3615efe786'::uuid, x.texto, x.correcta, x.orden from (values
  ('67418201-d589-4c05-8c0d-8882c4259520'::uuid, $pea0$Educación Distribuida (ED)$pea0$, false, 1),
  ('d9dc5b54-6c24-453e-80dd-065ab0bed35f'::uuid, $pea0$Educación Distribuida Home (EDH)$pea0$, true, 2),
  ('9a9830ee-a3ed-488b-8dea-269c031415be'::uuid, $pea0$Presencial Distribuida (PD)$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '0cd974c7-c188-4575-8ad2-9d3615efe786'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '2e4d6eb3-7635-4d7f-813a-0cafd91612a4'::uuid, 'verdadero_falso', $pea0$En ED, por subperíodo se cursan hasta 2 materias con asistencia al CAU.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a0ce0cfc-f526-4528-83dd-560760fd78fa'::uuid
where exists (select 1 from public.items where id = 'a0ce0cfc-f526-4528-83dd-560760fd78fa'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '2e4d6eb3-7635-4d7f-813a-0cafd91612a4'::uuid, x.texto, x.correcta, x.orden from (values
  ('c7e0e31a-f5ec-4452-88cb-1e65fd58ece1'::uuid, $pea0$Verdadero$pea0$, true, 1),
  ('98442d17-8088-4496-8bcd-4b35d2103940'::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '2e4d6eb3-7635-4d7f-813a-0cafd91612a4'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '51622ea5-2aad-4a37-8328-1bbfc5b489fb'::uuid, 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid, 3, $pea0$Inscripción a materias$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Se inscribe en el período del Calendario Académico. Cerrado el período, no hay inscripción.","Necesita aranceles al día, legajo completo, estar matriculado y respetar las correlativas.","Para materias de cuarto cuatrimestre, debe tener aprobado Universitarios 21.","Queda inscripto a la materia solo cuando pagó los aranceles e hizo la inscripción.","Topes en ED y EDH: grado 6 + 2 extra; pregrado 4 + 2 extra. Si se inscribe solo en el subperíodo B, 1 extra. En PD, hasta 8 materias."],"ejemplos":[{"consulta":"Se me pasó la fecha, ¿me pueden anotar?","respuesta":"No: una vez cerrado el período del Calendario Académico no se puede inscribir."},{"consulta":"Me anoté pero no pagué, ¿estoy cursando?","respuesta":"No todavía: la inscripción a la materia queda firme cuando están pagos los aranceles."},{"consulta":"Estudio a distancia, ¿cuántas materias puedo hacer?","respuesta":"En grado, hasta 6 al inicio del semestre más 2 adicionales si las correlativas lo permiten; en pregrado, 4 más 2. Las extras se pagan aparte."},{"consulta":"Empiezo en el segundo subperíodo, ¿a cuántas me anoto?","respuesta":"Los ingresantes con equivalencias y quienes empiezan en los segundos subperíodos (junio u octubre) cursan solo materias de ese subperíodo, hasta 3."}],"ojo":["Los ingresantes no pueden anotarse a materias extra.","Práctica Solidaria y Práctica Profesional: inscripción hasta el viernes previo al inicio de clases.","Procurador (5 + 2) y los ciclos de complementación (4 + 2) tienen otros topes: consultá la fuente."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-2-inscripcion-a-materias$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '26d8df03-a1a9-4918-8e13-73ba925845df'::uuid, 'opcion_multiple', $pea0$Un alumno de distancia quiere cursar una materia de cuarto cuatrimestre. ¿Qué tiene que tener aprobado sí o sí?$pea0$, $pea0$Para materias de cuarto cuatrimestre se pide Universitarios 21 aprobado.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '51622ea5-2aad-4a37-8328-1bbfc5b489fb'::uuid
where exists (select 1 from public.items where id = '51622ea5-2aad-4a37-8328-1bbfc5b489fb'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '26d8df03-a1a9-4918-8e13-73ba925845df'::uuid, x.texto, x.correcta, x.orden from (values
  ('2b369bdb-fd21-4aea-8a04-6757a077127d'::uuid, $pea0$El Seminario Final.$pea0$, false, 1),
  ('f2294a34-50c6-4478-8120-8d46044cca02'::uuid, $pea0$Universitarios 21.$pea0$, true, 2),
  ('bebcad44-5329-47d2-864b-5eaf36fcb109'::uuid, $pea0$Todas las materias de tercer cuatrimestre.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '26d8df03-a1a9-4918-8e13-73ba925845df'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '2a455e9a-0c90-40c0-8825-1048e0326aa1'::uuid, 'verdadero_falso', $pea0$Un alumno de grado en ED puede anotarse a 6 materias al inicio del semestre más 2 extra.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '51622ea5-2aad-4a37-8328-1bbfc5b489fb'::uuid
where exists (select 1 from public.items where id = '51622ea5-2aad-4a37-8328-1bbfc5b489fb'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '2a455e9a-0c90-40c0-8825-1048e0326aa1'::uuid, x.texto, x.correcta, x.orden from (values
  ('51c5a4e8-b64c-4c84-8006-741ce69e9d55'::uuid, $pea0$Verdadero$pea0$, true, 1),
  ('1b3d5104-311a-43e7-8b99-b85f7f5b2e6f'::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '2a455e9a-0c90-40c0-8825-1048e0326aa1'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '167ada6b-e3cf-4327-8c9a-e06a0122ddc1'::uuid, 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid, 4, $pea0$Cambio de cátedra (PD)$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Es solo para modalidades presenciales: en el CAU, aplica a PD.","Se pide en el período del Calendario Académico y solo si hay superposición de horarios entre materias del mismo semestre.","Requisitos: aranceles del semestre pagos y cambiar a una cátedra del mismo turno."],"ejemplos":[{"consulta":"Curso en PD y se me superponen dos materias del mismo cuatrimestre.","respuesta":"Puede pedir cambio de cátedra en el período del calendario, con los aranceles pagos y a una cátedra del mismo turno."},{"consulta":"Quiero pasarme a la cátedra de la tarde porque me queda mejor.","respuesta":"Solo se cambia si hay superposición de horarios y siempre dentro del mismo turno."},{"consulta":"Estudio en ED, ¿puedo cambiar de cátedra?","respuesta":"No: el cambio de cátedra es solo para las modalidades presenciales."}],"ojo":["Si cursa materias de distintos cuatrimestres a la vez, la Universidad no garantiza que no haya superposiciones.","En el calendario 2026 de P y PD, el cambio de cátedra del primer semestre fue del 16/03 al 20/03."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-4-cambio-de-catedra$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'bc5e3d3b-e07a-45da-831f-939b305124e5'::uuid, 'opcion_multiple', $pea0$¿En qué caso corresponde un cambio de cátedra?$pea0$, $pea0$Solo con superposición, dentro del mismo turno y en modalidades presenciales.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '167ada6b-e3cf-4327-8c9a-e06a0122ddc1'::uuid
where exists (select 1 from public.items where id = '167ada6b-e3cf-4327-8c9a-e06a0122ddc1'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'bc5e3d3b-e07a-45da-831f-939b305124e5'::uuid, x.texto, x.correcta, x.orden from (values
  ('ff0e04e3-7f01-49cf-856a-ffb28078bf29'::uuid, $pea0$Superposición de horarios entre materias del mismo semestre, en PD.$pea0$, true, 1),
  ('1f7e9ac5-2944-4923-8ce6-4ac0f93b8c4f'::uuid, $pea0$Preferencia por otro docente, en ED.$pea0$, false, 2),
  ('28b2b781-a483-4dcb-854b-1ced27061d0b'::uuid, $pea0$Cambio de turno de mañana a noche.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'bc5e3d3b-e07a-45da-831f-939b305124e5'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '046b3b65-8558-4c89-810b-922567df3cb0'::uuid, '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid, 5, $pea0$Cambio de modalidad$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Se pide en las fechas del calendario de trámites. En 2026, desde distancia, vence el 9/3 (1A), 11/5 (1B), 27/7 (2A) y 28/9 (2B).","Requisitos: libre deuda, legajo completo, no estar inscripto a un final ni tener una nota pendiente de carga.","No tiene que haber hecho más de 2 pases entre presencial y distancia (PH/MP/PD a ED/EDH o al revés).","Aprobadas y regulares se conservan. Las que está cursando y las Libre por Nota quedan Libre por Pase: las recursa.","Las regulares se rinden con las reglas de la modalidad nueva."],"ejemplos":[{"consulta":"Me quiero pasar a distancia pero estoy anotado a un final el jueves.","respuesta":"Todavía no puede: no tiene que estar inscripto a una mesa ni tener una nota pendiente de carga."},{"consulta":"Tengo 3 materias cursando, ¿las pierdo?","respuesta":"Esas quedan Libre por Pase y las recursa. Las regulares y las aprobadas se mantienen."},{"consulta":"Ya me cambié tres veces entre presencial y distancia.","respuesta":"No puede hacer otro pase: el requisito es no haber hecho más de 2 pases entre esas modalidades."}],"ojo":["Libre por Nota no se conserva: pasa a Libre por Pase.","Los idiomas que está cursando o tiene regulares se pierden.","Si pasa a ED o cambia de CAU, debe confirmar su lugar con el CAU de destino.","Seminario de Práctica y EFIP tienen reglas especiales: consultá la fuente."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-3-2-cambios-de-modalidad$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '6b41783d-37e9-4583-808c-1e36ac3f5202'::uuid, 'opcion_multiple', $pea0$Un alumno con mesa el jueves pide el pase de modalidad hoy. ¿Qué le respondés?$pea0$, $pea0$Uno de los requisitos es no estar inscripto a una mesa de examen final.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '046b3b65-8558-4c89-810b-922567df3cb0'::uuid
where exists (select 1 from public.items where id = '046b3b65-8558-4c89-810b-922567df3cb0'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '6b41783d-37e9-4583-808c-1e36ac3f5202'::uuid, x.texto, x.correcta, x.orden from (values
  ('79d074c0-9d80-4886-80d7-ab035439aa85'::uuid, $pea0$Que lo hace sin problema.$pea0$, false, 1),
  ('20d4d0b3-0056-41d5-8d10-5f9bba32194f'::uuid, $pea0$Que no puede estar inscripto a un final al pedir el pase.$pea0$, true, 2),
  ('ac3bb6a5-9bb5-4252-8ec5-6abf63e1fa09'::uuid, $pea0$Que pierde todas sus materias regulares.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '6b41783d-37e9-4583-808c-1e36ac3f5202'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '42369db1-c3c5-4986-8b34-2272b155a33f'::uuid, 'verdadero_falso', $pea0$Al cambiar de modalidad, una materia en condición Regular conserva su estado.$pea0$, $pea0$Se conserva, pero se rinde con las condiciones de evaluación de la modalidad de destino.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '046b3b65-8558-4c89-810b-922567df3cb0'::uuid
where exists (select 1 from public.items where id = '046b3b65-8558-4c89-810b-922567df3cb0'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '42369db1-c3c5-4986-8b34-2272b155a33f'::uuid, x.texto, x.correcta, x.orden from (values
  ('7c1052b4-be4b-4edd-825a-f5e787c6e286'::uuid, $pea0$Verdadero$pea0$, true, 1),
  ('90f73ac2-f3c3-4c2c-8545-f6f4c1be0a0b'::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '42369db1-c3c5-4986-8b34-2272b155a33f'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '0e0f7567-7780-4bb1-8f96-8da38a4030a0'::uuid, '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid, 6, $pea0$Equivalencias$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Se evalúan contenidos, objetivos, bibliografía y nivel de la materia, no solo el nombre.","Para equivalencias externas se pide: DNI, analítico legalizado, plan y programas legalizados, y el pago de la tasa.","Se puede reconocer como máximo el 70% del plan de la carrera de destino.","No hay reconocimiento parcial ni se otorga la condición de regular por equivalencia."],"ejemplos":[{"consulta":"En mi otra facultad la materia se llama igual, ¿me la dan?","respuesta":"No necesariamente: se comparan contenidos, objetivos y bibliografía, no el nombre."},{"consulta":"¿Qué tengo que presentar?","respuesta":"DNI, certificado analítico legalizado, plan de estudios y programas legalizados, y el comprobante de pago de la tasa."},{"consulta":"Tengo casi toda la carrera hecha en otro lado.","respuesta":"Se puede reconocer hasta el 70% del plan de la carrera en Siglo 21."}],"ojo":["Práctica Solidaria, Práctica Profesional y Seminario Final no se dan por equivalencia externa: se aprueban en Siglo 21.","Si hay un pre-dictamen aprobado para esa institución y carrera, no se piden los programas."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-6-1-sistema-de-equivalencias-para-todas-las-modalidades$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'af2f9107-574e-4419-811c-91a2a94f4b51'::uuid, 'opcion_multiple', $pea0$¿Cuál es el máximo del plan que se puede reconocer por equivalencias externas?$pea0$, $pea0$El reconocimiento externo no puede superar el 70% del plan de la carrera de destino.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0e0f7567-7780-4bb1-8f96-8da38a4030a0'::uuid
where exists (select 1 from public.items where id = '0e0f7567-7780-4bb1-8f96-8da38a4030a0'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'af2f9107-574e-4419-811c-91a2a94f4b51'::uuid, x.texto, x.correcta, x.orden from (values
  ('76b4b1b0-3409-49c1-8878-6baa1097ae0a'::uuid, $pea0$50%$pea0$, false, 1),
  ('c026a0c0-1e32-45b1-8efe-c47571da6f6d'::uuid, $pea0$70%$pea0$, true, 2),
  ('1f6b0e2c-a305-44ba-8594-e268704fc01d'::uuid, $pea0$100%$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'af2f9107-574e-4419-811c-91a2a94f4b51'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '0f8f45fd-48a2-4352-8e1d-01fd5e89c37d'::uuid, 'verdadero_falso', $pea0$Una materia con el mismo nombre se da por equivalente automáticamente.$pea0$, $pea0$Se evalúan contenidos, objetivos, bibliografía y nivel, no el nombre.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0e0f7567-7780-4bb1-8f96-8da38a4030a0'::uuid
where exists (select 1 from public.items where id = '0e0f7567-7780-4bb1-8f96-8da38a4030a0'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '0f8f45fd-48a2-4352-8e1d-01fd5e89c37d'::uuid, x.texto, x.correcta, x.orden from (values
  ('b9c35e67-8f74-40b4-85b5-40168e71db31'::uuid, $pea0$Verdadero$pea0$, false, 1),
  ('b7f0decf-c601-4849-85d4-c87f046e2021'::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '0f8f45fd-48a2-4352-8e1d-01fd5e89c37d'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'e2088b9a-c2dc-4c4f-8417-e514aa081194'::uuid, '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid, 7, $pea0$Solicitud de baja$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Se pide en la Mesa de Atención de Alumnos o por autogestión en el portal.","Requisito: no deber libros en la biblioteca ni tener deuda, baja administrativa o inhabilitación académica.","La baja no devuelve dinero ni cancela la deuda de aranceles del semestre, salvo razones institucionales aprobadas por el Vicerrectorado."],"ejemplos":[{"consulta":"Quiero darme de baja, ¿me devuelven lo que pagué?","respuesta":"No: la baja no implica reintegro ni cancela deuda de aranceles, salvo razones institucionales justificadas y aprobadas."},{"consulta":"¿Dónde pido la baja?","respuesta":"En la Mesa de Atención de Alumnos o desde las herramientas de autogestión del portal."},{"consulta":"Tengo una cuota atrasada y me quiero dar de baja.","respuesta":"Primero tiene que regularizar la deuda: es requisito para otorgar la baja."}],"ojo":["También puede renunciar a la regularidad de una materia aunque siga vigente."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-5-solicitud-de-baja$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '8458be8d-9545-4c2d-8ab1-f08268066010'::uuid, 'opcion_multiple', $pea0$Un alumno con deuda pide la baja. ¿Qué le decís?$pea0$, $pea0$No registrar deuda es requisito para otorgar la baja.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'e2088b9a-c2dc-4c4f-8417-e514aa081194'::uuid
where exists (select 1 from public.items where id = 'e2088b9a-c2dc-4c4f-8417-e514aa081194'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '8458be8d-9545-4c2d-8ab1-f08268066010'::uuid, x.texto, x.correcta, x.orden from (values
  ('b70f6832-cd45-488f-8faa-854156a977a2'::uuid, $pea0$Que se la damos y la deuda se cancela.$pea0$, false, 1),
  ('1ac17b47-4f7f-46ce-846f-f2778b27107f'::uuid, $pea0$Que primero tiene que regularizar la deuda.$pea0$, true, 2),
  ('b33ccd23-ffe1-434f-83c1-4de98a700699'::uuid, $pea0$Que la baja le devuelve el último pago.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '8458be8d-9545-4c2d-8ab1-f08268066010'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '0f80ea74-e6e6-4df4-89fc-6772efbf2e38'::uuid, '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid, 8, $pea0$Título$pea0$, 'leccion', a.id,
       $pea0${"resumen":["La titulación empieza cuando cumplió todos los requisitos de la Universidad y de la normativa.","Se abona una tasa por el trámite del título.","El diploma se emite en hasta 120 días corridos desde que el legajo queda como Egresado, con la documentación completa.","En carreras que lo prevén, puede pedir el título intermedio."],"ejemplos":[{"consulta":"Terminé la carrera, ¿cuándo tengo el título?","respuesta":"El plazo es de hasta 120 días corridos desde que el legajo queda como Egresado, con toda la documentación obligatoria completa."},{"consulta":"¿El título tiene costo?","respuesta":"Sí: se abona la tasa del trámite administrativo del título."},{"consulta":"Mi carrera tiene título intermedio, ¿cómo lo pido?","respuesta":"Lo inicia el estudiante, siempre que cumpla lo exigido por la carrera para esa titulación."}],"ojo":["Si egresó por articulación o doble titulación, el trámite empieza al terminar el reconocimiento de estudios."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-12-5-proceso-de-titulacion$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '01b1b453-33e8-4c3d-848b-f372f2a9a339'::uuid, 'opcion_multiple', $pea0$¿Desde cuándo corren los 120 días para el diploma?$pea0$, $pea0$El plazo corre desde que el legajo adquiere la condición de Egresado.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0f80ea74-e6e6-4df4-89fc-6772efbf2e38'::uuid
where exists (select 1 from public.items where id = '0f80ea74-e6e6-4df4-89fc-6772efbf2e38'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '01b1b453-33e8-4c3d-848b-f372f2a9a339'::uuid, x.texto, x.correcta, x.orden from (values
  ('3bf8cd1d-a565-469b-8d77-4036908057cb'::uuid, $pea0$Desde que aprobó la última materia.$pea0$, false, 1),
  ('21f6f92b-2fc5-49a1-8764-fa9e29215b61'::uuid, $pea0$Desde que el legajo queda como Egresado, con la documentación completa.$pea0$, true, 2),
  ('89b48209-7470-46d1-81e8-3e4834c9ba70'::uuid, $pea0$Desde la colación.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '01b1b453-33e8-4c3d-848b-f372f2a9a339'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'a129de96-9b9a-43fb-8ba8-f02c2eb96b2b'::uuid, '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid, 9, $pea0$Colación$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Es el acto de reconocimiento a quienes terminaron su plan con todos los requisitos cumplidos.","Cada colación incluye a quienes egresaron entre el 1 de septiembre del año anterior y el 31 de agosto del año en curso.","En la ceremonia se entrega un diploma simbólico, no el título oficial.","Si adeuda documentación para el título, no participa."],"ejemplos":[{"consulta":"¿En la colación me dan el título?","respuesta":"No: se entrega un diploma simbólico. El título oficial sigue su propio trámite."},{"consulta":"Terminé en octubre, ¿entro en la colación de este año?","respuesta":"Entra quien egresó entre el 1 de septiembre del año anterior y el 31 de agosto del año en curso: octubre pasa a la siguiente."},{"consulta":"Me falta presentar un papel, ¿puedo colacionar igual?","respuesta":"No: si adeuda documentación para emitir el título no puede participar."}],"ojo":["En pregrado, por la distancia, el acto alcanza a egresados de CAU Córdoba y Río IV, salvo que la Universidad lo amplíe.","No incluye títulos intermedios ni dobles titulaciones, salvo que haya gestionado equivalencias."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-12-6-colacion$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '4060d6ec-397c-4022-8cd5-a85fd26dcc57'::uuid, 'verdadero_falso', $pea0$En la colación se entrega el título oficial.$pea0$, $pea0$Se entrega un diploma simbólico; el título oficial se tramita aparte.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a129de96-9b9a-43fb-8ba8-f02c2eb96b2b'::uuid
where exists (select 1 from public.items where id = 'a129de96-9b9a-43fb-8ba8-f02c2eb96b2b'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '4060d6ec-397c-4022-8cd5-a85fd26dcc57'::uuid, x.texto, x.correcta, x.orden from (values
  ('c764f4ef-22e0-44e6-8ea9-a5d3c3b0fdfc'::uuid, $pea0$Verdadero$pea0$, false, 1),
  ('163fdfc5-d6f5-434f-8bb5-7880e8e79bd0'::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '4060d6ec-397c-4022-8cd5-a85fd26dcc57'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'b8dffd86-0f08-4e8a-80ba-47301a5100f0'::uuid, '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid, 10, $pea0$Matrícula y aranceles$pea0$, 'leccion', a.id,
       $pea0${"resumen":["La matrícula es semestral y debe estar paga y activa para rendir parciales, finales o la defensa del Seminario Final.","En distancia, la matrícula del 1er semestre va del 1/1 al 31/7 y la del 2do, del 1/8 al 31/12.","En ED y EDH se paga por paquete: Ticket A, Ticket B o semestre completo (A+B), según materias y subperíodo. En PD, tickets de 1, 3, 4 o 6 materias.","Materias extra en ED y EDH: arancel aparte (grado 1/6 y pregrado 1/4 del arancel A+B). No les aplican becas.","No se reintegra dinero por no completar el cursado por causas personales."],"ejemplos":[{"consulta":"No pagué la matrícula, ¿puedo rendir el final igual?","respuesta":"No: para rendir parciales, finales o la defensa del Seminario Final la matrícula tiene que estar paga y activa."},{"consulta":"Dejé de cursar a mitad de semestre, ¿me devuelven el ticket?","respuesta":"No: no hay reintegro cuando el servicio fue prestado y deja por causas personales."},{"consulta":"Mi beca, ¿cubre la materia extra?","respuesta":"No: en materias extra y en las de verano no aplican becas ni beneficios."}],"ojo":["Sin actividad académica por más de 1 año calendario queda en baja administrativa y debe matricularse de nuevo.","Suspender el cursado no cambia la regularidad, pero para retomar debe cancelar la deuda de ese período.","Pregrado y ciclos de complementación en distancia no tienen arancel único para el subperíodo A: pagan semestre completo."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-4-normas-arancelarias$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'dd5d628c-d652-4fd6-810e-3a29a6c18ee0'::uuid, 'opcion_multiple', $pea0$¿Qué necesita sí o sí para rendir un final?$pea0$, $pea0$La matrícula paga y activa es requisito para rendir parciales, finales o la defensa oral.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'b8dffd86-0f08-4e8a-80ba-47301a5100f0'::uuid
where exists (select 1 from public.items where id = 'b8dffd86-0f08-4e8a-80ba-47301a5100f0'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'dd5d628c-d652-4fd6-810e-3a29a6c18ee0'::uuid, x.texto, x.correcta, x.orden from (values
  ('4d5cd777-48a9-4f14-8cb5-4d31d8f3cbe5'::uuid, $pea0$La matrícula paga y activa.$pea0$, true, 1),
  ('6945197e-f785-411a-8125-d1a291ef9954'::uuid, $pea0$Una beca vigente.$pea0$, false, 2),
  ('f63e66a2-768b-4660-8d72-4a5d3a80a954'::uuid, $pea0$Haber cursado en el mismo semestre.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'dd5d628c-d652-4fd6-810e-3a29a6c18ee0'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '48188209-7e94-41c1-8c51-f59ffb1dd64a'::uuid, 'verdadero_falso', $pea0$Las becas se aplican también a las materias extra.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'b8dffd86-0f08-4e8a-80ba-47301a5100f0'::uuid
where exists (select 1 from public.items where id = 'b8dffd86-0f08-4e8a-80ba-47301a5100f0'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '48188209-7e94-41c1-8c51-f59ffb1dd64a'::uuid, x.texto, x.correcta, x.orden from (values
  ('b079315d-6b43-4405-8cdf-05ee247460f7'::uuid, $pea0$Verdadero$pea0$, false, 1),
  ('1b0b929b-1f77-4a53-8e51-ca79a4ec08b9'::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '48188209-7e94-41c1-8c51-f59ffb1dd64a'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '74d76fb4-4d7e-476b-88ad-3529e9fcbdfa'::uuid, '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid, 11, $pea0$Pagos y deuda$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Los tickets se generan en la autogestión y el pago tarda unas 72 horas hábiles en acreditarse.","Es responsabilidad del estudiante pagar con anticipación y guardar el comprobante.","Con deuda anterior no puede pagar la matrícula ni los aranceles del período actual hasta cancelarla.","Todo pago se aplica primero a la deuda y puede tener recargo por mora."],"ejemplos":[{"consulta":"Pagué hoy y mañana cierra la inscripción.","respuesta":"El pago tarda unas 72 horas hábiles en acreditarse: por eso se recomienda pagar con anticipación."},{"consulta":"Quiero pagar este semestre pero debo una cuota del anterior.","respuesta":"Primero tiene que cancelar lo adeudado: cualquier pago se aplica antes a la deuda."},{"consulta":"Me rechazaron el pago con tarjeta.","respuesta":"La Universidad lo intima a regularizar en un plazo; si no lo hace, pasa a baja administrativa."}],"ojo":["Con deuda tampoco puede pagar tasas de trámites.","Si se da de baja del servicio, no hay devolución de dinero."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-4-normas-arancelarias$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '8f08fc6e-49d5-49ae-835f-005e17246cd0'::uuid, 'opcion_multiple', $pea0$Un alumno pagó hoy y la inscripción cierra mañana. ¿Qué le explicás?$pea0$, $pea0$El plazo estimado de acreditación es de 72 horas hábiles.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '74d76fb4-4d7e-476b-88ad-3529e9fcbdfa'::uuid
where exists (select 1 from public.items where id = '74d76fb4-4d7e-476b-88ad-3529e9fcbdfa'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '8f08fc6e-49d5-49ae-835f-005e17246cd0'::uuid, x.texto, x.correcta, x.orden from (values
  ('5319c9c7-7440-48a9-8e83-f3f40f7b1de1'::uuid, $pea0$Que el pago se acredita al instante.$pea0$, false, 1),
  ('d2b1e178-7665-435e-8702-a03a86227e6a'::uuid, $pea0$Que la acreditación tarda unas 72 horas hábiles.$pea0$, true, 2),
  ('45fa4461-b668-4e30-880e-f75955a3333c'::uuid, $pea0$Que no hace falta pagar para inscribirse.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '8f08fc6e-49d5-49ae-835f-005e17246cd0'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '925fa6bc-a7b4-42cf-8605-e8f52ddbfab3'::uuid, '7dd9fd98-5e03-4d1b-8cea-6b5288e2a78b'::uuid, 12, $pea0$Becas y beneficios$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Una beca es un apoyo económico por buen nivel académico y regularidad (ver requisitos en la fuente); un beneficio, por una situación o cualidad del estudiante.","No son acumulables entre sí: si califica para más de una, se aplica la más provechosa.","Becas del primer semestre: postulación del 1 de octubre del año anterior al 1 de enero.","Becas del segundo semestre: postulación del 1 de abril al 1 de julio."],"ejemplos":[{"consulta":"Tengo beca y me corresponde también el beneficio por familiar, ¿se suman?","respuesta":"No: becas y beneficios no son acumulables; se aplica el que más le convenga."},{"consulta":"¿Cuándo me postulo para el primer semestre?","respuesta":"Del 1 de octubre del año anterior al 1 de enero; el resultado se confirma hasta el 1 de febrero."},{"consulta":"¿Hasta cuándo pido un beneficio para el subperíodo 1B?","respuesta":"Según el calendario de trámites 2026, del 30/3 al 29/5. Las fechas cambian cada año."},{"consulta":"Entregué la solicitud incompleta.","respuesta":"Las solicitudes incompletas o con deficiencias se rechazan: tiene que cumplir todos los requisitos de la categoría."}],"ojo":["Las promociones sí pueden sumarse a una beca o beneficio, según sus condiciones.","Quien tiene beca debe informar cualquier cambio en su situación económica o académica."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-3-becas-y-beneficios$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '9bc4ddf0-d48b-411d-8d61-2bd5ad1774bd'::uuid, 'opcion_multiple', $pea0$Un alumno califica para dos beneficios. ¿Qué pasa?$pea0$, $pea0$Las ayudas económicas no son acumulables; se aplica la más provechosa.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '925fa6bc-a7b4-42cf-8605-e8f52ddbfab3'::uuid
where exists (select 1 from public.items where id = '925fa6bc-a7b4-42cf-8605-e8f52ddbfab3'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '9bc4ddf0-d48b-411d-8d61-2bd5ad1774bd'::uuid, x.texto, x.correcta, x.orden from (values
  ('84dada2f-d28f-4eec-8fb5-28b459361b6b'::uuid, $pea0$Se le aplican los dos.$pea0$, false, 1),
  ('0be8df5b-0cd7-4761-8986-a93e589e9e7e'::uuid, $pea0$Se le aplica el más provechoso.$pea0$, true, 2),
  ('375f9ff2-d86e-499f-8e40-adb506e34a73'::uuid, $pea0$No se le aplica ninguno.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '9bc4ddf0-d48b-411d-8d61-2bd5ad1774bd'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'ea14167f-c386-4580-8436-18216b1e7f3e'::uuid, 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid, 13, $pea0$Documentación obligatoria$pea0$, 'leccion', a.id,
       $pea0${"resumen":["El legajo completo es requisito. Se presenta en la sede o CAU con original y copia; la copia certificada se envía en formato digital.","Grado y pregrado: solicitud de inscripción firmada, DNI vigente (no el digital), secundario completo, 2 fotos color 3x3 y ficha médica.","Sin el analítico todavía, sirve una constancia de título en trámite que diga que no adeuda materias: vale 1 año y se presenta una sola vez.","Grado: plazo de un año y medio; si no, no puede reinscribirse al cuarto período. Pregrado: dentro del primer año."],"ejemplos":[{"consulta":"¿Puedo presentar el DNI digital?","respuesta":"No: para el legajo se acepta solo el DNI vigente, no el digital. Si es extranjero, pasaporte vigente."},{"consulta":"Todavía no me dieron el analítico del secundario.","respuesta":"Puede presentar una constancia de título en trámite donde conste que no adeuda materias. Vale 1 año desde su emisión y se presenta una sola vez."},{"consulta":"¿Quién me certifica las copias?","respuesta":"Personal autorizado del CAU o la sede, juez de paz, registro civil o escribano público. Después la envía en formato digital."}],"ojo":["La secretaría del juzgado no sirve para certificar copias.","Mayores de 25 sin secundario completo: ingreso por trámite especial con resolución rectoral (45 días hábiles).","Los ciclos de complementación tienen otra documentación y otros plazos: consultá la fuente."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-2-2-documentacion-obligatoria-y-complementaria$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'd61d2310-ef5c-4ba6-8cfc-c5520d64b8c3'::uuid, 'opcion_multiple', $pea0$Un alumno de grado no completó su legajo en el primer año y medio. ¿Qué pasa?$pea0$, $pea0$En grado la documentación se completa dentro del primer año y medio.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'ea14167f-c386-4580-8436-18216b1e7f3e'::uuid
where exists (select 1 from public.items where id = 'ea14167f-c386-4580-8436-18216b1e7f3e'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'd61d2310-ef5c-4ba6-8cfc-c5520d64b8c3'::uuid, x.texto, x.correcta, x.orden from (values
  ('6d0a5e91-ea90-4321-8305-436a357c2d1e'::uuid, $pea0$Nada, puede presentarlo cuando quiera.$pea0$, false, 1),
  ('33b41f38-b71b-4041-8230-cdd7938e1b46'::uuid, $pea0$No puede reinscribirse al cuarto período de cursado.$pea0$, true, 2),
  ('57dc2498-2178-49a0-844d-7781412d42a4'::uuid, $pea0$Pierde las materias aprobadas.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'd61d2310-ef5c-4ba6-8cfc-c5520d64b8c3'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '83cdc2c5-16bd-484d-8072-dddf700eccc3'::uuid, 'verdadero_falso', $pea0$El DNI digital es válido para el legajo.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'ea14167f-c386-4580-8436-18216b1e7f3e'::uuid
where exists (select 1 from public.items where id = 'ea14167f-c386-4580-8436-18216b1e7f3e'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '83cdc2c5-16bd-484d-8072-dddf700eccc3'::uuid, x.texto, x.correcta, x.orden from (values
  ('bd3d4141-1316-423b-8e6c-af949b4b7d91'::uuid, $pea0$Verdadero$pea0$, false, 1),
  ('073358c6-e3ae-46c1-83e8-93bf3118e30c'::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '83cdc2c5-16bd-484d-8072-dddf700eccc3'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'c4622600-4c5e-4aca-80d3-9513920094b9'::uuid, 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid, 14, $pea0$Estudiantes extranjeros$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Quien terminó el secundario en el exterior debe convalidar el título ante las autoridades educativas nacionales: es obligatorio.","Para equivalencias de estudios en el exterior: documentación legalizada (apostilla de La Haya o consulado) y traducción de Traductor Público si no está en español.","Necesita la residencia de la Dirección Nacional de Migraciones para estudiar en el país.","En grado y pregrado debe presentar el DNI argentino durante el primer año."],"ejemplos":[{"consulta":"Terminé el secundario en Paraguay, ¿me puedo inscribir?","respuesta":"Sí, pero tiene que convalidar su título secundario ante las autoridades educativas nacionales: es un requisito obligatorio."},{"consulta":"Mis certificados están en portugués.","respuesta":"Tienen que estar legalizados (apostilla o consulado) y traducidos por Traductor Público Nacional; para Brasil no se exige que esté inscripto en el registro."},{"consulta":"¿Qué hago con la residencia?","respuesta":"La tramita en Migraciones. El Centro de Internacionalización le da la constancia de inscripción para el trámite."}],"ojo":["En carreras que piden título de grado previo, no puede empezar sin la convalidación o reválida de ese título.","Migraciones pide acreditar avance académico a los 6 o 12 meses."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-2-4-documentacion-obligatoria-y-complementaria-extranjeros$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '7afd21f6-c3ea-45d8-8064-b4825dc08535'::uuid, 'verdadero_falso', $pea0$Un estudiante extranjero de grado tiene que presentar el DNI argentino durante el primer año.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c4622600-4c5e-4aca-80d3-9513920094b9'::uuid
where exists (select 1 from public.items where id = 'c4622600-4c5e-4aca-80d3-9513920094b9'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '7afd21f6-c3ea-45d8-8064-b4825dc08535'::uuid, x.texto, x.correcta, x.orden from (values
  ('a23a48f5-1f6f-4eca-881c-9b3131b7cb88'::uuid, $pea0$Verdadero$pea0$, true, 1),
  ('ec6b8df1-e423-48b7-8927-0e65ad028e29'::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '7afd21f6-c3ea-45d8-8064-b4825dc08535'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'ac8ab6d1-104c-4f63-87e3-a4a00c2cac9c'::uuid, 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid, 15, $pea0$Calendario académico$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Se publica cada año en el Portal de estudiante; conocer las fechas es responsabilidad del alumno.","ED y EDH: 2 semestres con 2 subperíodos de 9 semanas cada uno. La semana 9 es de recuperatorios e integradores.","En ED y EDH, el 1er parcial se rinde entre las semanas 1 y 4, y el 2do entre las semanas 5 y 8.","PD: semestres de 16 semanas. 1ros parciales en las semanas 7 y 8; 2dos parciales en las semanas 14 y 15.","Si un parcial coincide con un feriado se reprograma; en PD, solo por feriado nacional."],"ejemplos":[{"consulta":"¿Dónde veo las fechas de los TP y los parciales?","respuesta":"En el calendario académico de su modalidad, publicado en el Portal de estudiante (también está en La Nube)."},{"consulta":"En 2026, ¿hasta cuándo me puedo inscribir en el subperíodo 1A?","respuesta":"Según el calendario 2026 de Distancia, las clases empiezan el 16/03 y la inscripción a materias es hasta el 29/03."},{"consulta":"¿Cuándo son los recuperatorios en ED?","respuesta":"En la semana 9 de cada subperíodo. En 2026, para el 1A, del 11/5 al 16/5."}],"ojo":["Las fechas cambian cada año: verificá siempre el calendario vigente.","En el calendario 2026 de Distancia, los TP de MEC y MAP vencen en las semanas 5 y 8; los de MIA, en las semanas 4, 5, 7 y 8."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-1-calendario-academico$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'd1b553a5-1e5b-4590-8c58-2a348262adf9'::uuid, 'opcion_multiple', $pea0$En ED y EDH, ¿en qué semanas se rinde el 2do parcial?$pea0$, $pea0$El 1er parcial va de la semana 1 a la 4 y el 2do de la 5 a la 8.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'ac8ab6d1-104c-4f63-87e3-a4a00c2cac9c'::uuid
where exists (select 1 from public.items where id = 'ac8ab6d1-104c-4f63-87e3-a4a00c2cac9c'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'd1b553a5-1e5b-4590-8c58-2a348262adf9'::uuid, x.texto, x.correcta, x.orden from (values
  ('1b37e9c3-91ac-408e-8816-46e3fae25a1c'::uuid, $pea0$Semanas 1 a 4.$pea0$, false, 1),
  ('0e24bf89-efa7-4b9d-86e8-449a395029dc'::uuid, $pea0$Semanas 5 a 8.$pea0$, true, 2),
  ('b8e0e9a8-33ac-4110-8418-15bfe4f4f0fc'::uuid, $pea0$Semana 9.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'd1b553a5-1e5b-4590-8c58-2a348262adf9'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'b62ca47e-3c80-45e6-8e5a-23550d37042b'::uuid, 'verdadero_falso', $pea0$La semana 9 del subperíodo es de recuperatorios e integradores.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'ac8ab6d1-104c-4f63-87e3-a4a00c2cac9c'::uuid
where exists (select 1 from public.items where id = 'ac8ab6d1-104c-4f63-87e3-a4a00c2cac9c'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'b62ca47e-3c80-45e6-8e5a-23550d37042b'::uuid, x.texto, x.correcta, x.orden from (values
  ('43c01310-ccb2-4141-8aff-d80d30805b0c'::uuid, $pea0$Verdadero$pea0$, true, 1),
  ('3f5072fa-b5b5-4b6a-89ae-5c7f16852815'::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'b62ca47e-3c80-45e6-8e5a-23550d37042b'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'd3fca8ba-6f12-4c04-89e9-36b3d9ed59b9'::uuid, 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid, 16, $pea0$Materias de verano$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Solo para quienes se reinscriben: los ingresantes no pueden cursar en verano.","Se cursan hasta 4 materias, entre febrero y marzo.","Se paga un arancel por cada materia antes de empezar (como máximo, hasta el fin del cursado). No aplican becas ni beneficios.","Regular: 3 de 4 TP con 5 o más y 2 parciales con 5 o más. Promoción directa: 3 de 4 TP y 2 parciales con 7 o más, y correlativas aprobadas."],"ejemplos":[{"consulta":"Soy nuevo, ¿puedo adelantar una materia en verano?","respuesta":"No: el verano es solo para quienes se reinscriben; los ingresantes quedan excluidos."},{"consulta":"¿Mi beca cubre la materia de verano?","respuesta":"No: en verano se paga un arancel por materia y no aplican becas ni beneficios."},{"consulta":"¿Cuántas materias puedo hacer en verano?","respuesta":"Hasta 4."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-3-inscripcion-a-materias-de-verano$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'd0a2521d-72d6-4c75-8520-2bb9ba15a85a'::uuid, 'opcion_multiple', $pea0$¿Quién no puede cursar materias de verano?$pea0$, $pea0$El verano es solo para quienes se reinscriben.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd3fca8ba-6f12-4c04-89e9-36b3d9ed59b9'::uuid
where exists (select 1 from public.items where id = 'd3fca8ba-6f12-4c04-89e9-36b3d9ed59b9'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'd0a2521d-72d6-4c75-8520-2bb9ba15a85a'::uuid, x.texto, x.correcta, x.orden from (values
  ('fae48907-0cfb-4b19-8702-9061088288c3'::uuid, $pea0$Un ingresante.$pea0$, true, 1),
  ('78c9d279-fcbd-46f2-857c-8f7e6abdc782'::uuid, $pea0$Un alumno que se reinscribe.$pea0$, false, 2),
  ('49c03a8b-ba65-4e8c-884f-0070c5a3e74d'::uuid, $pea0$Un alumno con beca.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'd0a2521d-72d6-4c75-8520-2bb9ba15a85a'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'b6a5cf93-414c-4287-8d12-3c8a12eeebda'::uuid, 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid, 17, $pea0$Planes de estudio$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Los planes los aprueba el Consejo Superior y después el Ministerio de Educación.","Cuando entra un plan nuevo, el anterior se mantiene por la duración teórica de la carrera más un año.","Si no terminó en ese plazo, la Universidad puede pasarlo al plan nuevo y debe cursar todas sus materias.","Las materias que están en los dos planes se reconocen por equivalencia directa y automática.","Quien estuvo inactivo más de un período y retoma fuera de ese plazo también puede ser migrado al plan vigente."],"ejemplos":[{"consulta":"Vuelvo después de mucho tiempo, ¿sigo con mi plan?","respuesta":"Si su plan ya no se mantiene, al retomar se lo migra al plan vigente."},{"consulta":"Me pasaron de plan y tengo materias nuevas.","respuesta":"Al migrar debe hacer todas las materias del plan nuevo, aunque no estuvieran en el original. Las que coinciden se reconocen automáticamente."},{"consulta":"¿Qué son los créditos de una materia?","respuesta":"Equivalen a la cantidad de horas semanales que tiene la materia."}],"ojo":["Cuando la Universidad migra alumnos de plan, arma un plan de transición con los pasos a seguir."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-1-planes-de-estudio$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '014755aa-174f-4775-8d35-0490286b0f3b'::uuid, 'verdadero_falso', $pea0$Las materias que están en el plan anterior y en el nuevo se reconocen automáticamente.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'b6a5cf93-414c-4287-8d12-3c8a12eeebda'::uuid
where exists (select 1 from public.items where id = 'b6a5cf93-414c-4287-8d12-3c8a12eeebda'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '014755aa-174f-4775-8d35-0490286b0f3b'::uuid, x.texto, x.correcta, x.orden from (values
  ('7ddf8b9f-1a6b-4c92-8867-46c2d9dc85ab'::uuid, $pea0$Verdadero$pea0$, true, 1),
  ('fc1967d8-bc0c-43b8-8080-25a09c086491'::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '014755aa-174f-4775-8d35-0490286b0f3b'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '0c5a2f5c-1591-406a-83d5-4a8612cc7208'::uuid, 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid, 18, $pea0$Correlativas$pea0$, 'leccion', a.id,
       $pea0${"resumen":["El plan de correlatividades fija el orden en que se cursan las materias.","Para inscribirse a una materia, sus correlativas tienen que estar regulares.","Para aprobar o promocionar, sus correlativas tienen que estar aprobadas.","Puede promocionar si aprueba la correlativa anterior dentro de los 60 días de terminada la materia; si no, la materia queda Regular."],"ejemplos":[{"consulta":"¿Cómo sé qué correlativas tiene una materia?","respuesta":"En el Portal de Estudiantes: su carrera, Plan de Estudio y Ver Correlativas. Ahí también está Ver Programa."},{"consulta":"Promocioné pero me falta aprobar la correlativa.","respuesta":"Tiene 60 días desde que terminó la materia para aprobar la correlativa anterior; si no, la materia queda Regular y rinde final."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-correlativas$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '9d818327-6a0c-4fe4-87c2-7334bda05bd3'::uuid, 'opcion_multiple', $pea0$Para inscribirse a cursar una materia, ¿cómo tienen que estar sus correlativas?$pea0$, $pea0$Para cursar alcanza con correlativas regulares; para aprobar, tienen que estar aprobadas.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0c5a2f5c-1591-406a-83d5-4a8612cc7208'::uuid
where exists (select 1 from public.items where id = '0c5a2f5c-1591-406a-83d5-4a8612cc7208'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '9d818327-6a0c-4fe4-87c2-7334bda05bd3'::uuid, x.texto, x.correcta, x.orden from (values
  ('98312826-db17-4ab6-814c-6296d0fda5da'::uuid, $pea0$Regulares.$pea0$, true, 1),
  ('ab4ced1f-53e8-4c25-8fdb-6b065e0556ba'::uuid, $pea0$Aprobadas.$pea0$, false, 2),
  ('e0e23e54-8315-4e0d-8857-300d6916be9c'::uuid, $pea0$No importa.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '9d818327-6a0c-4fe4-87c2-7334bda05bd3'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '1311ce80-81e8-4b51-8d5e-f04bf6c3cf98'::uuid, 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid, 19, $pea0$Universitarios 21$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Es el programa de ingreso de grado y pregrado: dos materias del primer semestre, Aprender en el Siglo 21 y Tecnología, Humanidades y Modelos Globales.","Se cursan y evalúan con las mismas reglas que el resto de las materias de su modalidad.","Hay que aprobarlas para inscribirse a materias de cuarto cuatrimestre.","Una equivalencia externa no reemplaza a estas materias; hay eximición con 5 o más materias aprobadas en el legajo."],"ejemplos":[{"consulta":"¿Por qué no me deja anotarme a una materia de cuarto cuatrimestre?","respuesta":"Porque necesita tener aprobado Universitarios 21."},{"consulta":"Tengo materias aprobadas en otra universidad, ¿hago Universitarios 21?","respuesta":"Si suma 5 o más materias aprobadas en su legajo de Siglo 21 puede quedar eximido; revisá las condiciones en la fuente."}],"ojo":["Aprender en el Siglo 21 usa como bibliografía el Reglamento Institucional."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-universitarios21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '233aad7a-517e-4f9b-8ab7-268f7944dc92'::uuid, 'verdadero_falso', $pea0$Universitarios 21 se aprueba con reglas distintas al resto de las materias.$pea0$, $pea0$Se cursa y evalúa con las mismas reglas que las materias del plan, según la modalidad.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '1311ce80-81e8-4b51-8d5e-f04bf6c3cf98'::uuid
where exists (select 1 from public.items where id = '1311ce80-81e8-4b51-8d5e-f04bf6c3cf98'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '233aad7a-517e-4f9b-8ab7-268f7944dc92'::uuid, x.texto, x.correcta, x.orden from (values
  ('0f0518fa-444a-426f-87b7-c85d5dbfb4b9'::uuid, $pea0$Verdadero$pea0$, false, 1),
  ('ad4879aa-4505-446d-8269-fcfd4bcf4001'::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '233aad7a-517e-4f9b-8ab7-268f7944dc92'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'c51091da-e129-4679-8501-c7e57fa62334'::uuid, '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid, 20, $pea0$Tipos de materias y trabajos prácticos$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Cada materia tiene 4 módulos y 4 TP obligatorios: para regularizar hay que aprobar al menos 3, con nota 5 o más.","MEC y MAP: los TP se rehacen sin límite dentro del cronograma y vale la última nota. Entregar tarde resta 5 puntos por día, sin bajar de 5.","MIA y MIP: cada TP se entrega una sola vez, en la fecha del calendario. Si no lo entrega, es 0 y promedia.","MIA y MIP suman foros grupales obligatorios (MIA en TP2 y TP3; MIP en TP1 y TP3), pero el TP es individual.","Las Actividades Prácticas son opcionales: sirven para autoevaluarse."],"ejemplos":[{"consulta":"Me fue mal en el TP de una MEC, ¿lo puedo rehacer?","respuesta":"Sí: en MEC y MAP se rehace las veces que quiera dentro de los plazos del SAM, y vale la última nota."},{"consulta":"Se me pasó la fecha del TP2 de una MIA.","respuesta":"En MIA y MIP el TP se presenta una sola vez en la fecha del calendario; si no lo entregó, tiene 0 y se promedia."},{"consulta":"Entregué tarde un TP de MEC, ¿me lo toman?","respuesta":"Sí, hasta el cierre del SAM, pero resta 5 puntos por día de demora; la demora nunca lo baja de 5."}],"ojo":["En MIP es obligatorio aprobar el TP4 con 5 o más.","La bibliografía obligatoria la consigue cada estudiante.","Conviene que verifique en el SAM que las notas de los TP queden registradas."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '1572d416-66d1-46a4-8a15-5d246854ae75'::uuid, 'opcion_multiple', $pea0$En una materia MIA, ¿cuántas veces se puede entregar cada TP?$pea0$, $pea0$En MIA y MIP el TP se presenta por única vez.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c51091da-e129-4679-8501-c7e57fa62334'::uuid
where exists (select 1 from public.items where id = 'c51091da-e129-4679-8501-c7e57fa62334'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '1572d416-66d1-46a4-8a15-5d246854ae75'::uuid, x.texto, x.correcta, x.orden from (values
  ('f8c372b3-ead4-4ffb-887a-d61994b141d2'::uuid, $pea0$Una sola vez, en la fecha del calendario.$pea0$, true, 1),
  ('aae31868-ddc1-451c-8e69-746fb52a5a50'::uuid, $pea0$Ilimitadas, hasta el cierre del SAM.$pea0$, false, 2),
  ('406239fd-d356-489b-82a4-6ddd4dc702bb'::uuid, $pea0$Dos veces.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '1572d416-66d1-46a4-8a15-5d246854ae75'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '91178283-a39e-40c6-8716-357a81e78d99'::uuid, 'verdadero_falso', $pea0$Para regularizar hay que aprobar al menos 3 de los 4 TP con 5 o más.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c51091da-e129-4679-8501-c7e57fa62334'::uuid
where exists (select 1 from public.items where id = 'c51091da-e129-4679-8501-c7e57fa62334'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '91178283-a39e-40c6-8716-357a81e78d99'::uuid, x.texto, x.correcta, x.orden from (values
  ('b3b614bc-eab9-4e48-879e-fe1b1a5f705f'::uuid, $pea0$Verdadero$pea0$, true, 1),
  ('d760f9fb-8874-4b50-8394-e88f04986644'::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '91178283-a39e-40c6-8716-357a81e78d99'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '3bd31396-9081-42be-8037-888a17438850'::uuid, '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid, 21, $pea0$Parciales, recuperatorios e integradores$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Parciales: 20 preguntas de opción múltiple; se aprueban con 5 (9 correctas). El 1º toma los módulos 1 y 2; el 2º, los 3 y 4.","Recuperatorio: si sacó menos de 5 o faltó a un parcial, o para llevar a 7 un parcial si el otro ya es 7 o más. Reemplaza la nota, mayor o menor.","Integrador: 30 preguntas de los dos parciales, para quien desaprobó o faltó a ambos o los aprobó con 5 o 6. Aprueba con 5; promociona con 7.","Un parcial con 7 o más no se recupera.","Duración: parciales y recuperatorios, 40 minutos; integrador, 60; finales, 90."],"ejemplos":[{"consulta":"Saqué 4 en el primer parcial y 8 en el segundo.","respuesta":"Puede rendir el recuperatorio del parcial 1 o el integrador. La nota nueva reemplaza a la anterior."},{"consulta":"Tengo 6 y 6, ¿puedo promocionar?","respuesta":"Puede rendir el integrador: con 7 o más accede a la promoción directa, si cumple los TP y las demás condiciones."},{"consulta":"Saqué 7 en un parcial, ¿lo recupero para subir la nota?","respuesta":"No: un parcial con 7 o más no se recupera."}],"ojo":["Si se inscribe a un recuperatorio o integrador y no se presenta, la nota es 0 y cuenta para la materia.","En ED y EDH, el 1er parcial se rinde entre las semanas 1 y 4 y el 2do entre las semanas 5 y 8.","Cuando puede elegir entre recuperatorio e integrador, se inscribe solo a uno de los dos."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '2cb05b60-ec80-416d-82c6-8269024b0ae0'::uuid, 'opcion_multiple', $pea0$Un alumno sacó 3 y 3 en los parciales. ¿Qué puede rendir?$pea0$, $pea0$Con los dos parciales desaprobados corresponde el integrador.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3bd31396-9081-42be-8037-888a17438850'::uuid
where exists (select 1 from public.items where id = '3bd31396-9081-42be-8037-888a17438850'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '2cb05b60-ec80-416d-82c6-8269024b0ae0'::uuid, x.texto, x.correcta, x.orden from (values
  ('15f58964-ecf6-460f-8278-70e064cc37d4'::uuid, $pea0$El recuperatorio del parcial 1.$pea0$, false, 1),
  ('e3e894e4-eecd-45a5-8487-70e649d2be4c'::uuid, $pea0$El integrador.$pea0$, true, 2),
  ('c9c665b8-2b33-40ba-87ec-cef66d8ace9a'::uuid, $pea0$Nada: queda libre.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '2cb05b60-ec80-416d-82c6-8269024b0ae0'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '2082d590-1f43-4add-8bff-3b0ed1127bf9'::uuid, 'verdadero_falso', $pea0$La nota del recuperatorio reemplaza a la del parcial aunque sea menor.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3bd31396-9081-42be-8037-888a17438850'::uuid
where exists (select 1 from public.items where id = '3bd31396-9081-42be-8037-888a17438850'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '2082d590-1f43-4add-8bff-3b0ed1127bf9'::uuid, x.texto, x.correcta, x.orden from (values
  ('6ec40bf3-52cb-4428-853b-9105e3a1a64b'::uuid, $pea0$Verdadero$pea0$, true, 1),
  ('534e8723-f3f5-4ea6-8f8c-91654bffdcae'::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '2082d590-1f43-4add-8bff-3b0ed1127bf9'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '56017845-afc2-40e3-843c-ef094ad2f073'::uuid, '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid, 22, $pea0$Inscripción a exámenes (ED, EDH y PD)$pea0$, 'leccion', a.id,
       $pea0${"resumen":["ED y EDH, parcial: inscripción hasta 24 horas antes. Esa inscripción no se anula ni se modifica.","Recuperatorio o integrador: inscripción hasta 24 horas antes; se puede anular hasta 48 horas antes.","Final: con al menos 4 días corridos de anticipación; se anula antes de que sea aceptada, es decir, hasta 8 días corridos antes.","PD: los parciales no requieren inscripción; finales, recuperatorios e integradores, con los mismos plazos.","Para rendir: DNI vigente, matrícula paga, estar inscripto y, si corresponde, notebook con el navegador institucional. Tolerancia: 15 minutos."],"ejemplos":[{"consulta":"Me anoté al parcial y no puedo ir, ¿lo cambio?","respuesta":"En ED y EDH la inscripción al parcial no se puede anular ni modificar."},{"consulta":"Quiero rendir el final el lunes, ¿me anoto hoy jueves?","respuesta":"No llega: hay que inscribirse con al menos 4 días corridos de anticipación."},{"consulta":"Me anoté al recuperatorio y no voy a poder ir.","respuesta":"Puede anular hasta 48 horas antes; si no se presenta, la nota es 0 y cuenta para la materia."},{"consulta":"¿Cuándo me anoto al EFIP?","respuesta":"Hasta 6 días corridos antes de la fecha; puede anular hasta 7 días antes. Las fechas salen en la Cartelera del Portal."}],"ojo":["Los turnos dependen de la disponibilidad de la sede o CAU.","Materias virtuales: la mesa de final se pide cuando está cargada la condición al terminar el bimestre."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'dc462016-2585-44ea-8ee1-6bdab95b72ec'::uuid, 'opcion_multiple', $pea0$En ED, ¿hasta cuándo se puede anular la inscripción a un recuperatorio?$pea0$, $pea0$Se inscribe hasta 24 horas antes y se anula hasta 48 horas antes.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '56017845-afc2-40e3-843c-ef094ad2f073'::uuid
where exists (select 1 from public.items where id = '56017845-afc2-40e3-843c-ef094ad2f073'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'dc462016-2585-44ea-8ee1-6bdab95b72ec'::uuid, x.texto, x.correcta, x.orden from (values
  ('49a9edd4-53c4-49cd-8354-a7e1eca637bd'::uuid, $pea0$Hasta 48 horas antes.$pea0$, true, 1),
  ('e43ccf3c-5b8f-4ae6-839c-bd449fb2f808'::uuid, $pea0$Hasta 24 horas antes.$pea0$, false, 2),
  ('f15333eb-5433-4c6c-829a-c26ee658768f'::uuid, $pea0$No se puede anular.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'dc462016-2585-44ea-8ee1-6bdab95b72ec'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '47b33b58-af32-427f-8382-6413f4deb85f'::uuid, 'verdadero_falso', $pea0$En ED, la inscripción a un parcial se puede anular hasta 24 horas antes.$pea0$, $pea0$La inscripción a un parcial en ED y EDH no se anula ni se modifica.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '56017845-afc2-40e3-843c-ef094ad2f073'::uuid
where exists (select 1 from public.items where id = '56017845-afc2-40e3-843c-ef094ad2f073'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '47b33b58-af32-427f-8382-6413f4deb85f'::uuid, x.texto, x.correcta, x.orden from (values
  ('823adb15-d8b3-44c8-8113-30bc518c0247'::uuid, $pea0$Verdadero$pea0$, false, 1),
  ('d79cf3b1-e1d4-4c42-82aa-ab6a41420994'::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '47b33b58-af32-427f-8382-6413f4deb85f'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '3039650a-f7a0-4135-8566-df7fb2192825'::uuid, '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid, 23, $pea0$Ausencia a un examen y pedido de revisión$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Faltar a un examen, por cualquier motivo (personal, laboral, médico, paro), no permite reprogramarlo: queda Ausente.","En un final, el ausente además consume una de las 3 oportunidades antes de quedar Libre.","La revisión se pide en el sistema al terminar el examen: 10 minutos en parciales y 15 en finales. No hay otra vía.","La respuesta llega en 15 días. Si estaba desaprobado, puede cambiar la nota o habilitarse a rendir otra vez."],"ejemplos":[{"consulta":"Tuve fiebre y no pude rendir el parcial, ¿me lo reprograman?","respuesta":"No: las razones médicas tampoco habilitan a reprogramar; queda Ausente."},{"consulta":"Ayer rendí y una pregunta estaba mal corregida.","respuesta":"Ya no se puede pedir: la revisión solo se solicita en el sistema al terminar el examen (10 minutos en parciales, 15 en finales)."},{"consulta":"Pedí revisión, ¿cuándo me responden?","respuesta":"El plazo de respuesta es de 15 días."}],"ojo":["Hay casos especiales regulados (Res. CS 535/2017) que son excepción a esta regla: derivá.","Si no completa todos los datos del pedido de revisión, el pedido es nulo."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '70dd4a87-8fd7-436d-87db-287a1b71760b'::uuid, 'opcion_multiple', $pea0$¿Cuánto tiempo hay para pedir revisión al terminar un final?$pea0$, $pea0$10 minutos en parciales y 15 en finales, desde el sistema.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3039650a-f7a0-4135-8566-df7fb2192825'::uuid
where exists (select 1 from public.items where id = '3039650a-f7a0-4135-8566-df7fb2192825'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '70dd4a87-8fd7-436d-87db-287a1b71760b'::uuid, x.texto, x.correcta, x.orden from (values
  ('ab3321bc-cd49-4021-8518-d3ee588fd881'::uuid, $pea0$15 minutos.$pea0$, true, 1),
  ('7611472d-53cb-48eb-8f3f-3f4787313d80'::uuid, $pea0$10 minutos.$pea0$, false, 2),
  ('f98fc609-ee9d-42d6-8bc5-d69a34add619'::uuid, $pea0$15 días.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '70dd4a87-8fd7-436d-87db-287a1b71760b'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '184d1130-cf11-41be-8840-e304df55102c'::uuid, 'ded24f8c-0a3b-444b-8201-48f555f45573'::uuid, 24, $pea0$Condiciones de aprobación y escala de notas$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Regular: 3 de 4 TP con 5 o más y 2 parciales con 5 o más (puede mediar recuperatorio o integrador). Rinde final de 30 preguntas.","Promoción directa: 3 de 4 TP con 7 o más, 2 parciales con 7 o más y correlativas aprobadas. Aprueba sin final.","Promoción indirecta: 4 de 4 TP con 7 o más, parciales con 5 o 6 y correlativas aprobadas. También aprueba sin final.","Final regular: aprueba con 4 (14 de 30), vigencia 18 meses, 3 oportunidades. Libre por nota: 50 preguntas, 3 meses, 1 oportunidad.","Asistencia del 75% en ED y PD; no aplica en EDH."],"ejemplos":[{"consulta":"¿Con cuánto apruebo el final regular?","respuesta":"Con 4, que equivale a 14 respuestas correctas de 30."},{"consulta":"Quedé libre por nota, ¿cuánto tiempo tengo?","respuesta":"3 meses y una sola oportunidad para el final de 50 preguntas; aprueba con 24 correctas."},{"consulta":"Promocioné pero me debe una correlativa.","respuesta":"Sin las correlativas aprobadas la materia queda Regular y tiene que rendir final."}],"ojo":["En PD, en MEC, MIA y MAP, el final suma un oral si aprueba el escrito; en MIP no.","Idiomas no tiene promoción indirecta."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '44e1c16f-3b31-4f74-8690-e54e4aade280'::uuid, 'opcion_multiple', $pea0$Un alumno tiene 3 TP con 8, parciales con 7 y 9, y correlativas aprobadas. ¿Qué condición tiene?$pea0$, $pea0$3 de 4 TP y parciales con 7 o más, con correlativas aprobadas, es promoción directa.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '184d1130-cf11-41be-8840-e304df55102c'::uuid
where exists (select 1 from public.items where id = '184d1130-cf11-41be-8840-e304df55102c'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '44e1c16f-3b31-4f74-8690-e54e4aade280'::uuid, x.texto, x.correcta, x.orden from (values
  ('fe28cccf-6a12-4a29-899d-886e29fd0c2f'::uuid, $pea0$Promoción directa.$pea0$, true, 1),
  ('941f5649-599d-4cc7-8e1f-9de16fc4dd76'::uuid, $pea0$Regular.$pea0$, false, 2),
  ('29824a9c-714f-4acb-8df4-ce91a4feca95'::uuid, $pea0$Libre por nota.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '44e1c16f-3b31-4f74-8690-e54e4aade280'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'c394e7c0-5f3e-46cd-8ad4-ff4ea9c820ec'::uuid, 'verdadero_falso', $pea0$En EDH se exige el 75% de asistencia.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '184d1130-cf11-41be-8840-e304df55102c'::uuid
where exists (select 1 from public.items where id = '184d1130-cf11-41be-8840-e304df55102c'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'c394e7c0-5f3e-46cd-8ad4-ff4ea9c820ec'::uuid, x.texto, x.correcta, x.orden from (values
  ('4e889188-d7af-4554-88a6-12abc05a53ac'::uuid, $pea0$Verdadero$pea0$, false, 1),
  ('bc034b2c-03af-445b-800e-a3a3517aa487'::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'c394e7c0-5f3e-46cd-8ad4-ff4ea9c820ec'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'af8288cb-e294-424d-835d-bd4be9907e56'::uuid, '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid, 25, $pea0$Materias de proceso e idiomas en distancia$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Las materias de proceso no se promocionan ni se rinden libres: si no se cumplen las condiciones, quedan Libres y se recursan.","Práctica Solidaria: carga horaria completa con nota 5 o más de la organización, y 3 de 4 TP con el TP4 aprobado. Nota: promedio de TP, sin final.","Práctica Profesional: 250 horas con nota 7 o más de la organización, 3 de 4 TP con el TP4 aprobado y correlativas aprobadas.","Los TP de estas prácticas vencen en las semanas 6, 8, 12 y 15, el domingo a las 23:59.","Idiomas: placement test único; regular con 6 niveles seguidos al 70% o Avanzado 3; integrador de 50 preguntas, aprueba con 4."],"ejemplos":[{"consulta":"No llegué a las horas de la Práctica Profesional.","respuesta":"Sin las 250 horas no se aprueba; si no cumple al terminar el cursado queda Libre y la recursa."},{"consulta":"Aprobé la Práctica Profesional pero me debe una correlativa.","respuesta":"Queda Regular hasta aprobarla, con un máximo de 18 meses; si no, pierde la regularidad y recursa."},{"consulta":"No terminé los niveles de inglés este año.","respuesta":"Si no alcanza la regularidad en el año de cursado, pierde el avance y reinicia la materia."},{"consulta":"¿Puedo usar diccionario en el examen de inglés?","respuesta":"No: no se permiten diccionarios, glosarios ni listas de verbos."}],"ojo":["Para cursar el último semestre necesita todos los niveles de idioma aprobados.","Seminario de Práctica en distancia queda Regular y su nota es la del EFIP I.","Pregrado: Integración Profesional - Estudio del Caso pide el TP4 y 2 de los TP 1 a 3 con 5 o más."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '60fdca89-8cf5-40bc-8b7e-bb12210864fb'::uuid, 'opcion_multiple', $pea0$¿Cuántas horas en una organización pide la Práctica Profesional?$pea0$, $pea0$250 horas con planilla de asistencia y evaluación de desempeño de 7 o más.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'af8288cb-e294-424d-835d-bd4be9907e56'::uuid
where exists (select 1 from public.items where id = 'af8288cb-e294-424d-835d-bd4be9907e56'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '60fdca89-8cf5-40bc-8b7e-bb12210864fb'::uuid, x.texto, x.correcta, x.orden from (values
  ('05e272ff-cb94-42ba-85f7-12e9570e3a77'::uuid, $pea0$250$pea0$, true, 1),
  ('d879e955-da24-448e-83cd-9a3a87882a2a'::uuid, $pea0$100$pea0$, false, 2),
  ('97bf8ced-311e-42c9-8383-f34f6dc5e5ca'::uuid, $pea0$400$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '60fdca89-8cf5-40bc-8b7e-bb12210864fb'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '865f2ebb-0e64-49aa-836b-18ad7c4f6b42'::uuid, 'verdadero_falso', $pea0$Las materias de proceso se pueden rendir como libre por nota.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'af8288cb-e294-424d-835d-bd4be9907e56'::uuid
where exists (select 1 from public.items where id = 'af8288cb-e294-424d-835d-bd4be9907e56'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '865f2ebb-0e64-49aa-836b-18ad7c4f6b42'::uuid, x.texto, x.correcta, x.orden from (values
  ('1b9a5aec-7c39-47d4-8c66-68949a04326c'::uuid, $pea0$Verdadero$pea0$, false, 1),
  ('1da5a069-e4fb-4cf7-8990-9f66024e2153'::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '865f2ebb-0e64-49aa-836b-18ad7c4f6b42'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '8d2c9c40-243e-47a0-8b05-a293d6dd3ae6'::uuid, '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid, 26, $pea0$EFIP I y EFIP II$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Solo para carreras de grado en ED y EDH; no para pregrado ni ciclos de complementación. Son presenciales, ante un tribunal.","EFIP I: integración curricular (escrita y oral) y, si la carrera tiene idiomas, producción en idioma. Hay que aprobar las dos en el mismo turno.","Para rendir EFIP I: Seminario de Práctica (o de Planificación y Control) Regular, o el Módulo EFIP I cursando o Regular, y las correlativas aprobadas.","EFIP I se rinde hasta 3 veces; si no aprueba, vuelve a cursar el Módulo EFIP I o el Seminario de Práctica.","EFIP II: todas las materias aprobadas (con Práctica Solidaria y electivas) y Seminario Final Regular. Es requisito para la defensa del TFG."],"ejemplos":[{"consulta":"Desaprobé el EFIP I tres veces.","respuesta":"Tiene que inscribirse de nuevo al Módulo EFIP I; si su carrera no lo tiene, recursa el Seminario de Práctica (o de Planificación y Control)."},{"consulta":"¿Puedo cursar materias de séptimo sin el EFIP I?","respuesta":"Como regla, en distancia necesita el EFIP I aprobado para cursar y aprobar 7º y 8º; en Abogacía y Contador depende de las correlativas."},{"consulta":"¿Dónde veo las fechas del EFIP?","respuesta":"En la Cartelera del Portal de estudiante, al inicio de cada año. Se inscribe hasta 6 días corridos antes."}],"ojo":["Sin EFIP I aprobado no puede inscribirse a cursar Seminario Final.","Aprobar el Seminario de Práctica no aprueba el EFIP I: igual tiene que rendirlo.","Para EFIP II necesita además el visado del analítico aprobado y no tener deuda.","La Universidad puede autorizar rendir en el CAU con tecnología; el examen queda grabado."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'd0777b37-f1f0-4aba-88b1-5064afedafa3'::uuid, 'opcion_multiple', $pea0$¿Quién rinde EFIP?$pea0$, $pea0$Aplica exclusivamente a carreras de grado de la modalidad Distancia.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '8d2c9c40-243e-47a0-8b05-a293d6dd3ae6'::uuid
where exists (select 1 from public.items where id = '8d2c9c40-243e-47a0-8b05-a293d6dd3ae6'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'd0777b37-f1f0-4aba-88b1-5064afedafa3'::uuid, x.texto, x.correcta, x.orden from (values
  ('1221705c-6931-4df9-8cfc-4c318ede2c41'::uuid, $pea0$Estudiantes de grado en ED o EDH.$pea0$, true, 1),
  ('f5a70644-8e61-45d5-8456-3ace5d5578c9'::uuid, $pea0$Estudiantes de pregrado en ED.$pea0$, false, 2),
  ('be7d1859-4b97-49fa-81cc-167255393b69'::uuid, $pea0$Estudiantes de grado en PD.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'd0777b37-f1f0-4aba-88b1-5064afedafa3'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '8080da1a-b662-44a5-83a1-fccff0a8be67'::uuid, 'verdadero_falso', $pea0$El EFIP I se puede rendir hasta 3 veces.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '8d2c9c40-243e-47a0-8b05-a293d6dd3ae6'::uuid
where exists (select 1 from public.items where id = '8d2c9c40-243e-47a0-8b05-a293d6dd3ae6'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '8080da1a-b662-44a5-83a1-fccff0a8be67'::uuid, x.texto, x.correcta, x.orden from (values
  ('ae217f65-451f-4a4b-8a25-81cacbd43e1d'::uuid, $pea0$Verdadero$pea0$, true, 1),
  ('e934abda-bef1-40ba-8390-a95a5d3c7d2c'::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '8080da1a-b662-44a5-83a1-fccff0a8be67'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '4434f5d7-adf9-4696-8f1e-1bf7ad66bc32'::uuid, '2594b0a0-0047-4677-845e-19307b8d00ef'::uuid, 27, $pea0$Sanciones$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Las faltas son leves, graves, muy graves o gravísimas; el plagio también se gradúa de leve a gravísimo.","Según la gravedad: llamado de atención, apercibimiento, suspensión o expulsión.","Además se pone 0 en la actividad; con la suspensión, la materia queda Libre.","Todas las sanciones, salvo el llamado de atención, quedan registradas en el certificado analítico.","En exámenes son faltas: leer en voz alta, usar el teclado o auriculares, desviar la mirada, tapar la cámara o apagar el micrófono."],"ejemplos":[{"consulta":"En el examen me marcaron por mirar para el costado.","respuesta":"Desviar la mirada de forma sostenida es una falta leve: corresponde un llamado de atención con nota 0 en esa instancia."},{"consulta":"Copié un TP de un compañero, ¿qué me puede pasar?","respuesta":"La copia en TP es una falta leve: llamado de atención y 0 en la actividad. Si es plagio más grave, la sanción sube."},{"consulta":"¿La sanción queda en mi analítico?","respuesta":"Sí, salvo el llamado de atención, que queda solo en su legajo."}],"ojo":["La expulsión es definitiva y se comunica a todo el Sistema Universitario Nacional.","No rendir en el CAU cuando la modalidad lo exige también es falta leve."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-13-1-regimen-general-de-sanciones$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'ae46221c-c43a-42d0-8d74-1a86434c2e35'::uuid, 'opcion_multiple', $pea0$¿Qué sanción no figura en el certificado analítico?$pea0$, $pea0$El llamado de atención queda solo en el legajo.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '4434f5d7-adf9-4696-8f1e-1bf7ad66bc32'::uuid
where exists (select 1 from public.items where id = '4434f5d7-adf9-4696-8f1e-1bf7ad66bc32'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'ae46221c-c43a-42d0-8d74-1a86434c2e35'::uuid, x.texto, x.correcta, x.orden from (values
  ('1e37bf34-fef1-4cfe-850f-e7d8b856d965'::uuid, $pea0$Llamado de atención.$pea0$, true, 1),
  ('ef3a6959-fbe7-4e31-8928-f7782ff589bc'::uuid, $pea0$Apercibimiento.$pea0$, false, 2),
  ('d2e90a1e-8c61-49a5-8225-005103d8dbd1'::uuid, $pea0$Suspensión.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'ae46221c-c43a-42d0-8d74-1a86434c2e35'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '20292778-d608-4f42-8e8c-13f8a66040dd'::uuid, 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid, 28, $pea0$Condiciones para la graduación$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Para egresar hay una evaluación integral: en pregrado, la materia Integración Profesional - Estudio del Caso; en grado, el Trabajo Final de Graduación (TFG) con defensa oral.","En todos los casos las citas van con normas APA; omitirlas es una falta por plagio.","En grado, el TFG se aprueba en un máximo de 18 meses desde que regulariza Seminario Final; si no, queda Libre en Seminario Final."],"ejemplos":[{"consulta":"Estudio una tecnicatura, ¿tengo que hacer un trabajo final?","respuesta":"En pregrado la instancia final es la materia Integración Profesional - Estudio del Caso, no un TFG."},{"consulta":"Regularicé Seminario Final hace 2 años y no defendí.","respuesta":"Pasados 18 meses sin aprobar el TFG queda Libre en Seminario Final y tiene que recursarla."}],"ojo":["Después del egreso siguen el trámite del título (tasa y hasta 120 días) y la colación: mirá esas lecciones."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-12-1-condiciones-para-la-graduacion$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '5bf6758d-c69c-4aae-8d01-435c43d5ab12'::uuid, 'verdadero_falso', $pea0$En grado, el TFG se tiene que aprobar dentro de los 18 meses de regularizar Seminario Final.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '20292778-d608-4f42-8e8c-13f8a66040dd'::uuid
where exists (select 1 from public.items where id = '20292778-d608-4f42-8e8c-13f8a66040dd'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '5bf6758d-c69c-4aae-8d01-435c43d5ab12'::uuid, x.texto, x.correcta, x.orden from (values
  ('b3d6bdff-9fb7-4314-806f-2834b8691c97'::uuid, $pea0$Verdadero$pea0$, true, 1),
  ('7f359767-867d-4592-8cb6-3caf7a85024b'::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '5bf6758d-c69c-4aae-8d01-435c43d5ab12'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '9ed54b62-6be5-44f2-897d-871d98de3293'::uuid, 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid, 29, $pea0$Trabajo Final de Graduación (TFG)$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Tiene 3 etapas: Seminario Final, Comisión Académica Evaluadora (CAE) y Defensa Oral.","En distancia, Seminario Final se regulariza cumpliendo las entregas de avance del tutor. No hay prórrogas.","La CAE evalúa el TFG en 60 días: puede habilitar la defensa, pedir ajustes con un plazo o no aprobarlo.","Habilitado, se inscribe a la mesa de Defensa Oral en un máximo de 30 días corridos.","La nota final pondera Seminario Final, CAE y defensa; con menos de 4 se recursa Seminario Final."],"ejemplos":[{"consulta":"Ya regularicé Seminario Final, ¿qué sigue?","respuesta":"Se le asigna una CAE, que evalúa el trabajo en un plazo de 60 días."},{"consulta":"La CAE me pidió cambios.","respuesta":"Recibe un acta rúbrica con las recomendaciones y el plazo para entregar el trabajo ajustado."},{"consulta":"Me habilitaron a defensa, ¿hay plazo para anotarme?","respuesta":"Sí: tiene que inscribirse a la mesa de Defensa Oral dentro de los 30 días corridos."}],"ojo":["Para la Defensa Oral necesita el EFIP II aprobado.","El TFG es individual."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-12-2-trabajo-final-de-graduacion$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '0146e795-39b5-4d65-8b4f-3ef76d6ee451'::uuid, 'opcion_multiple', $pea0$¿Cuál es la segunda etapa del TFG?$pea0$, $pea0$Seminario Final, CAE y Defensa Oral, en ese orden.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '9ed54b62-6be5-44f2-897d-871d98de3293'::uuid
where exists (select 1 from public.items where id = '9ed54b62-6be5-44f2-897d-871d98de3293'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '0146e795-39b5-4d65-8b4f-3ef76d6ee451'::uuid, x.texto, x.correcta, x.orden from (values
  ('bd36c162-b281-4a3f-83ea-3c0248fe7e5c'::uuid, $pea0$La Comisión Académica Evaluadora (CAE).$pea0$, true, 1),
  ('2fbaa871-d933-4eb8-8303-36ed647005ee'::uuid, $pea0$La Defensa Oral.$pea0$, false, 2),
  ('b8069f0c-7d7d-4023-81b9-c057d5460a2d'::uuid, $pea0$El Seminario Final.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '0146e795-39b5-4d65-8b4f-3ef76d6ee451'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'c886f8d7-6dbe-4f3d-8e48-129e52eaf434'::uuid, '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid, 30, $pea0$Portal de Estudiantes$pea0$, 'leccion', a.id,
       $pea0${"resumen":["En el Portal ve su carrera y su avance, se inscribe a materias y exámenes, paga por ePagos y usa el simulador de pagos.","Se entra con la cuenta institucional: usuario@soysiglo.21.edu.ar y su contraseña.","Si da error al entrar: borrar cookies y caché, y probar otro navegador o una ventana de incógnito.","En \"Más opciones\" hay una guía del portal, cambio de contraseña y datos de contacto."],"ejemplos":[{"consulta":"No puedo entrar al portal, me da error.","respuesta":"Que borre las cookies y la caché del navegador y vuelva a intentar; si sigue, otro navegador o modo incógnito."},{"consulta":"¿Dónde me inscribo a un final?","respuesta":"En el Portal de Estudiantes, en el módulo de inscripción a exámenes."},{"consulta":"¿Con qué usuario entro?","respuesta":"Con su correo institucional (usuario@soysiglo.21.edu.ar) y su contraseña."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-portal-de-estudiantes$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'df467d01-3f9f-40ca-8005-d511d4203049'::uuid, 'opcion_multiple', $pea0$Un alumno no puede entrar al portal. ¿Qué le sugerís primero?$pea0$, $pea0$Es el primer paso que indica la guía del portal.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c886f8d7-6dbe-4f3d-8e48-129e52eaf434'::uuid
where exists (select 1 from public.items where id = 'c886f8d7-6dbe-4f3d-8e48-129e52eaf434'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'df467d01-3f9f-40ca-8005-d511d4203049'::uuid, x.texto, x.correcta, x.orden from (values
  ('b84b0ee7-4071-4121-81d2-b7c490d465d5'::uuid, $pea0$Borrar cookies y caché del navegador e intentar de nuevo.$pea0$, true, 1),
  ('97e98095-0cb2-4cfd-8ab2-1b286ab36606'::uuid, $pea0$Hacer un cambio de carrera.$pea0$, false, 2),
  ('f752d813-87d3-4af6-8108-7990a3df6e1f'::uuid, $pea0$Esperar al próximo semestre.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'df467d01-3f9f-40ca-8005-d511d4203049'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'd36cf7d1-c546-495d-8749-ea007754750c'::uuid, '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid, 31, $pea0$Aula Virtual (Canvas)$pea0$, 'leccion', a.id,
       $pea0${"resumen":["El Aula Virtual es Canvas: ahí están las materias, se presentan las actividades y se contacta al docente.","Se entra eligiendo Soy Estudiante y la cuenta institucional.","Si olvidó la contraseña, la restablece desde el enlace de recuperación, con su usuario sin @soysiglo.21.edu.ar.","Las dudas de contenido de cada materia van al docente, por la mensajería del aula."],"ejemplos":[{"consulta":"Olvidé la contraseña del aula.","respuesta":"Desde el enlace de recuperación, con su usuario institucional sin el @soysiglo.21.edu.ar; después confirma su correo de recuperación."},{"consulta":"¿Cómo le escribo al profesor?","respuesta":"Por la mensajería de su Aula Virtual (Canvas)."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-aula-virtual$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '9b6c1d17-3db5-4d0b-839f-9928199ef12f'::uuid, 'verdadero_falso', $pea0$El Aula Virtual de la Universidad es Canvas.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd36cf7d1-c546-495d-8749-ea007754750c'::uuid
where exists (select 1 from public.items where id = 'd36cf7d1-c546-495d-8749-ea007754750c'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '9b6c1d17-3db5-4d0b-839f-9928199ef12f'::uuid, x.texto, x.correcta, x.orden from (values
  ('972dad70-a639-4a97-81e5-99550bb86268'::uuid, $pea0$Verdadero$pea0$, true, 1),
  ('49bf06f3-2f76-4785-8a39-4622a528bdce'::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '9b6c1d17-3db5-4d0b-839f-9928199ef12f'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '3ff5fecf-dfe1-40b9-8105-6c44641d758e'::uuid, '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid, 32, $pea0$Exámenes online con Klarway$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Los exámenes online se rinden con Klarway (Sistema Online de Exámenes), una app de escritorio para PC y algunas Mac, con validación de identidad.","Antes hay que registrarse una vez: DNI (digital o físico) o pasaporte, lugar iluminado, fondo liso y sin auriculares.","Al rendir: cerrar los programas, entrar con las credenciales del Portal, validar el rostro y aceptar las condiciones.","Recomendaciones: buena luz, batería al 80% o cargador, micrófono encendido y lugar silencioso."],"ejemplos":[{"consulta":"¿Puedo rendir desde el celular?","respuesta":"No: Klarway es una aplicación de escritorio para PC y algunas versiones de Mac."},{"consulta":"Me falló Klarway rindiendo desde casa.","respuesta":"Que saque una captura del error con fecha y hora visibles y la envíe por Consulta Alumnos, Área Tecnológica, Sistema de Examen. También puede contactar a su CAU."},{"consulta":"Me pide registrarme, ¿qué necesito?","respuesta":"Su DNI o pasaporte y la app instalada. La foto, en un lugar iluminado, con fondo liso, sin auriculares y con ropa adecuada."}],"ojo":["Durante el examen no puede usar auriculares, apagar el micrófono ni tapar la cámara: son faltas sancionables."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-klarway$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '4239eb9f-3b8f-485f-84ff-d4f0c8383322'::uuid, 'opcion_multiple', $pea0$Un alumno tuvo un error de Klarway rindiendo en su casa. ¿Qué tiene que enviar?$pea0$, $pea0$La captura tiene que mostrar el día y la hora.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3ff5fecf-dfe1-40b9-8105-6c44641d758e'::uuid
where exists (select 1 from public.items where id = '3ff5fecf-dfe1-40b9-8105-6c44641d758e'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '4239eb9f-3b8f-485f-84ff-d4f0c8383322'::uuid, x.texto, x.correcta, x.orden from (values
  ('6f069635-fc99-49c7-8cf2-c5e42fa19b58'::uuid, $pea0$Una captura del error con fecha y hora, por Consulta Alumnos.$pea0$, true, 1),
  ('a9227629-7986-4066-8ef2-6f53561a6a33'::uuid, $pea0$Un audio por WhatsApp al docente.$pea0$, false, 2),
  ('db9d1715-c3f7-420a-8e3c-9915452ea50d'::uuid, $pea0$Nada: se reprograma solo.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '4239eb9f-3b8f-485f-84ff-d4f0c8383322'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '5862ba03-4027-4188-81b3-64dc1c964e32'::uuid, '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid, 33, $pea0$Canales de contacto$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Dudas de contenido de una materia: al docente, por la mensajería del Aula Virtual.","Consulta escrita: en Consultar, elegir el legajo, el motivo en Título de tipificación, describir el caso y adjuntar si hace falta.","También puede chatear en el momento con un Asesor Institucional.","Los datos de cada CAU están en el mapa de Sedes y Centros; los directores de carrera tienen su mail publicado."],"ejemplos":[{"consulta":"¿Cómo dejo una consulta por escrito?","respuesta":"En Consultar: elige el legajo, el motivo en Título de tipificación, describe el caso y adjunta un archivo si hace falta."},{"consulta":"Quiero hablar con alguien ahora.","respuesta":"Puede chatear con un Asesor Institucional en el momento."},{"consulta":"Quiero contactarme con otros estudiantes.","respuesta":"Puede sumarse a ComunidadNET."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-canales-de-contacto$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '2e99d294-e92f-42fd-8baf-ca7f2734133d'::uuid, 'opcion_multiple', $pea0$Una duda sobre el contenido de una materia, ¿a quién va?$pea0$, $pea0$El contenido de cada materia lo responde el docente a cargo.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '5862ba03-4027-4188-81b3-64dc1c964e32'::uuid
where exists (select 1 from public.items where id = '5862ba03-4027-4188-81b3-64dc1c964e32'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '2e99d294-e92f-42fd-8baf-ca7f2734133d'::uuid, x.texto, x.correcta, x.orden from (values
  ('1f95b85f-369f-484a-8b0c-f76329f0423a'::uuid, $pea0$Al docente, por la mensajería del Aula Virtual.$pea0$, true, 1),
  ('f5d925fb-2494-4c63-829a-5818b57a2863'::uuid, $pea0$A la biblioteca.$pea0$, false, 2),
  ('941901c4-7ad8-4a3a-869d-416228a6b3a3'::uuid, $pea0$A Tesorería.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '2e99d294-e92f-42fd-8baf-ca7f2734133d'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'acba49f6-9e64-4d80-8562-653a61b4346d'::uuid, '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid, 34, $pea0$Profesores Tutores Virtuales$pea0$, 'leccion', a.id,
       $pea0${"resumen":["El Centro de Profesores Tutores Virtuales (CPV) acompaña el primer año: organización, cursado, plataforma y modelo de aprendizaje.","Las dudas de contenido de cada materia no van al tutor: van al docente, por la mensajería de Canvas.","Al tutor se le escribe desde la Bandeja de Entrada de Canvas; también hay consultas por Teams en horarios fijos.","Talleres Potenciar 21: hábitos de estudio y organización. El cronograma está en los anuncios de cada materia."],"ejemplos":[{"consulta":"Soy nuevo y no sé cómo organizarme.","respuesta":"Su Profesor Tutor Virtual lo acompaña en el primer año; también puede sumarse a los Talleres Potenciar 21."},{"consulta":"Le pregunté al tutor una duda de contenido y no me la resolvió.","respuesta":"Las dudas del contenido de cada materia van al docente a cargo, por la mensajería del aula."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-tutoresvirtuales$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'b10eff4a-edce-4a92-81cd-c7aaa6eb5d75'::uuid, 'verdadero_falso', $pea0$El tutor virtual resuelve las dudas de contenido de cada materia.$pea0$, $pea0$El tutor acompaña la organización y el cursado; el contenido lo responde el docente.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'acba49f6-9e64-4d80-8562-653a61b4346d'::uuid
where exists (select 1 from public.items where id = 'acba49f6-9e64-4d80-8562-653a61b4346d'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'b10eff4a-edce-4a92-81cd-c7aaa6eb5d75'::uuid, x.texto, x.correcta, x.orden from (values
  ('965468cd-bc0c-463b-868e-e07003e0c3b6'::uuid, $pea0$Verdadero$pea0$, false, 1),
  ('c239c09d-f3c4-4a86-8498-f3742d575c55'::uuid, $pea0$Falso$pea0$, true, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'b10eff4a-edce-4a92-81cd-c7aaa6eb5d75'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'fa3f849b-6994-4c30-8d5c-0278e45215f7'::uuid, '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid, 35, $pea0$Inscribirse a exámenes en el Portal$pea0$, 'leccion', a.id,
       $pea0${"resumen":["En el Portal de Estudiantes: Exámenes, Nueva inscripción, elegir la materia, el lugar, la fecha y la franja horaria, y confirmar con Inscribirme al examen.","En ED y EDH, desde la primera semana de cursado se puede inscribir al Parcial 1 y al Parcial 2: no hace falta esperar a rendir el primero.","Si no se inscribe dentro del plazo, el sistema le asigna una fecha automáticamente.","En PD no se inscribe a los parciales: fecha, lugar y franja se asignan según el cronograma y se ven en el Portal."],"ejemplos":[{"consulta":"¿Cómo me anoto al parcial?","respuesta":"En el Portal: Exámenes, Nueva inscripción. Elige la materia, el lugar, el día y la franja, revisa el resumen y confirma con Inscribirme al examen."},{"consulta":"Todavía no rendí el primer parcial, ¿me puedo anotar al segundo?","respuesta":"Sí: desde la primera semana se puede inscribir a los dos."},{"consulta":"No me anoté al parcial a tiempo.","respuesta":"Si venció el plazo, el sistema le asigna una fecha automáticamente; que la revise en el Portal."},{"consulta":"Curso en PD, ¿dónde me anoto al parcial?","respuesta":"En PD no hace falta: el parcial se asigna según el cronograma y lo ve en su Portal."}],"ojo":["Si falta a un parcial, queda registrado como Ausente.","Recuperatorio o integrador: cuando puede elegir, se inscribe solo a uno de los dos."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-inscripcion-a-examenes$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'c1387fe8-abc5-4013-8667-8c06e508b862'::uuid, 'opcion_multiple', $pea0$Un alumno de ED no se inscribió al parcial dentro del plazo. ¿Qué pasa?$pea0$, $pea0$Según la guía de inscripción, el sistema asigna una fecha si no se inscribe a tiempo.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'fa3f849b-6994-4c30-8d5c-0278e45215f7'::uuid
where exists (select 1 from public.items where id = 'fa3f849b-6994-4c30-8d5c-0278e45215f7'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'c1387fe8-abc5-4013-8667-8c06e508b862'::uuid, x.texto, x.correcta, x.orden from (values
  ('8894013e-6224-40f0-8603-c68c24a1e19c'::uuid, $pea0$Pierde el parcial y queda libre.$pea0$, false, 1),
  ('8ec5ffe6-6137-48fc-802c-9ce04add66ac'::uuid, $pea0$El sistema le asigna una fecha automáticamente.$pea0$, true, 2),
  ('2f40e43f-320d-48b7-8613-9bed71904697'::uuid, $pea0$Tiene que pedir una mesa especial.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'c1387fe8-abc5-4013-8667-8c06e508b862'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'c4c2e72c-bbb1-4946-8b80-ce01f5f4d17b'::uuid, '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid, 36, $pea0$App Siglo 21$pea0$, 'leccion', a.id,
       $pea0${"resumen":["La app se descarga de la tienda del celular y se entra con los datos del Portal de Estudiantes.","Desde la app: legajos, historial de materias, calificaciones, agenda, inscripción a materias y exámenes, y pago electrónico.","La asistencia se registra escaneando con la app el QR que muestra el profesor.","Si olvidó la contraseña, la resetea desde ¿Olvidaste tu contraseña?"],"ejemplos":[{"consulta":"¿Cómo registro la asistencia?","respuesta":"Con la app: toca el ícono del QR arriba en la pantalla y escanea el QR del profesor. La primera vez tiene que dar permiso a la cámara."},{"consulta":"Estudio dos carreras, ¿las veo en la app?","respuesta":"Sí: puede consultar cada uno de sus legajos."},{"consulta":"¿Con qué usuario entro a la app?","respuesta":"Con los mismos datos del Portal de Estudiantes."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-app-siglo-21$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '007dc56a-13f7-472a-8d5e-fdbe04cd4acc'::uuid, 'verdadero_falso', $pea0$La asistencia se registra escaneando con la app el QR que muestra el profesor.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c4c2e72c-bbb1-4946-8b80-ce01f5f4d17b'::uuid
where exists (select 1 from public.items where id = 'c4c2e72c-bbb1-4946-8b80-ce01f5f4d17b'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '007dc56a-13f7-472a-8d5e-fdbe04cd4acc'::uuid, x.texto, x.correcta, x.orden from (values
  ('92dda046-dcd4-4a39-8b94-6a602bbc4f0c'::uuid, $pea0$Verdadero$pea0$, true, 1),
  ('29213e4f-2500-4425-8dbe-518737d99d3b'::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '007dc56a-13f7-472a-8d5e-fdbe04cd4acc'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '2bdca9f6-e70b-439f-852d-e32c79ab3538'::uuid, 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid, 37, $pea0$Defensa Oral$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Se habilita cuando la CAE aprueba el TFG. Todas las defensas orales son presenciales, en el Campus de la Universidad.","En distancia (ED y EDH) necesita el EFIP II aprobado antes de pedir la mesa.","Pasos: pagar la Tasa de Graduación, controles automáticos del legajo, completar el formulario, enviar la solicitud y recibir la fecha.","La tasa activa el visado: constancia de que no adeuda materias y de que están al día documentación, administración, biblioteca y CAE.","La matrícula del semestre tiene que estar paga al iniciar el visado y al rendir."],"ejemplos":[{"consulta":"La CAE me aprobó, ¿cómo pido la defensa?","respuesta":"Primero paga la Tasa de Graduación (el ticket aparece solo en Pago Electrónico); eso inicia el visado. Después completa el formulario y espera la fecha."},{"consulta":"¿Puedo defender desde mi ciudad?","respuesta":"No: todas las defensas orales se rinden en forma presencial en el Campus de la Universidad."},{"consulta":"¿Qué incluye la Tasa de Graduación?","respuesta":"La gestión del diploma y el analítico con legalización, la opción de envío del título al CAU y la invitación a la colación."}],"ojo":["Si estudia en distancia y no aprobó el EFIP II, no puede pedir la mesa (hay excepciones de carrera: consultá la fuente)."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-defensa-oral$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'bfaccff1-04ee-4d42-87a9-3fed159462aa'::uuid, 'opcion_multiple', $pea0$Un alumno de ED con el TFG aprobado por la CAE pide la defensa. ¿Qué necesita además?$pea0$, $pea0$En distancia se pide el EFIP II aprobado; la tasa inicia el visado.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '2bdca9f6-e70b-439f-852d-e32c79ab3538'::uuid
where exists (select 1 from public.items where id = '2bdca9f6-e70b-439f-852d-e32c79ab3538'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'bfaccff1-04ee-4d42-87a9-3fed159462aa'::uuid, x.texto, x.correcta, x.orden from (values
  ('4ae4c26a-bba1-4a05-8239-57170be7a87d'::uuid, $pea0$Tener el EFIP II aprobado y pagar la Tasa de Graduación.$pea0$, true, 1),
  ('69d0e05c-5b05-44ef-801e-c545d0621ceb'::uuid, $pea0$Solo inscribirse a una mesa de final.$pea0$, false, 2),
  ('2b4767f6-0ce5-4291-8226-2d5c3cf15668'::uuid, $pea0$Nada más: la fecha se asigna sola.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'bfaccff1-04ee-4d42-87a9-3fed159462aa'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'd3a159c7-0420-4c1c-81a5-6773c969f70b'::uuid, '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid, 38, $pea0$Eximición de idiomas$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Puede pedir la eximición de Idioma Extranjero quien tiene una certificación internacional de inglés comprobable.","Se aceptan, entre otros: FCE, CAE o CPE de Cambridge; TOEFL iBT 60 o más; TOEIC 600 o más; Bachillerato Internacional Inglés B con 5 o más.","También se reconocen exámenes de Oxford y de Cambridge International con nivel equivalente a B2, según la fuente.","Para portugués hay otra lista de equivalencias aceptadas."],"ejemplos":[{"consulta":"Tengo el First, ¿tengo que cursar inglés?","respuesta":"Puede pedir la eximición: el FCE de Cambridge es una de las certificaciones aceptadas."},{"consulta":"Hice TOEFL y saqué 55.","respuesta":"No alcanza para el TOEFL iBT: se pide 60 o más."}],"ojo":["Las condiciones exactas de cada certificado están en la fuente: verificá antes de confirmar."]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-eximicion-idiomas$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '5fb9eeda-39a7-4a1f-8423-d203f91a314e'::uuid, 'opcion_multiple', $pea0$¿Qué puntaje mínimo de TOEFL iBT se acepta para la eximición?$pea0$, $pea0$Se acepta TOEFL iBT con 60 o más.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd3a159c7-0420-4c1c-81a5-6773c969f70b'::uuid
where exists (select 1 from public.items where id = 'd3a159c7-0420-4c1c-81a5-6773c969f70b'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '5fb9eeda-39a7-4a1f-8423-d203f91a314e'::uuid, x.texto, x.correcta, x.orden from (values
  ('2d1829bd-6d86-40b4-8728-c0465b755eaa'::uuid, $pea0$40$pea0$, false, 1),
  ('75855dd1-a408-4539-8281-f634dfac76c7'::uuid, $pea0$60$pea0$, true, 2),
  ('947435f4-3624-4667-89e9-fa1c63dc04c3'::uuid, $pea0$100$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '5fb9eeda-39a7-4a1f-8423-d203f91a314e'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'bf74500f-6fef-4705-8fcb-5624bc1c5b59'::uuid, 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid, 39, $pea0$Módulo 0$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Es un programa preparatorio con contenido y clases niveladoras para empezar mejor el cursado.","Es un módulo de lecturas dentro de la materia, en el Aula Virtual (Canvas): un recorrido breve y guiado.","Se habilita un mes antes del inicio de clases.","Lo tienen algunas materias troncales, por ejemplo Herramientas Matemáticas, Introducción al Derecho o Estadística y Probabilidad."],"ejemplos":[{"consulta":"¿Qué es el Módulo 0 que me aparece en Canvas?","respuesta":"Un módulo de lecturas niveladoras dentro de la materia, para llegar al inicio de clases con los temas centrales más claros."},{"consulta":"¿Todas las materias tienen Módulo 0?","respuesta":"No: solo las que figuran en el listado de La Nube, como Herramientas Matemáticas o Introducción al Derecho."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-modulo0$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select '34953aa7-2ffd-4dde-80c4-ce7f244b77fc'::uuid, 'verdadero_falso', $pea0$El Módulo 0 se habilita un mes antes del inicio de clases.$pea0$, $pea0$$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'bf74500f-6fef-4705-8fcb-5624bc1c5b59'::uuid
where exists (select 1 from public.items where id = 'bf74500f-6fef-4705-8fcb-5624bc1c5b59'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, '34953aa7-2ffd-4dde-80c4-ce7f244b77fc'::uuid, x.texto, x.correcta, x.orden from (values
  ('0f78d1be-f80d-4056-8189-3044ee190177'::uuid, $pea0$Verdadero$pea0$, true, 1),
  ('1afe24c5-741e-4e28-8394-5af4fdde9d88'::uuid, $pea0$Falso$pea0$, false, 2)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = '34953aa7-2ffd-4dde-80c4-ce7f244b77fc'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '444e3f43-cdbe-4389-81a6-5b8c27daf134'::uuid, '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid, 40, $pea0$Gabinete de Bienestar$pea0$, 'leccion', a.id,
       $pea0${"resumen":["Acompaña la vida académica: organización del estudio, aprender a estudiar y manejo de las emociones.","Lo integran psicólogos y psicólogas egresados de Siglo 21.","Se puede pedir un encuentro individual con un profesional del Gabinete.","Tiene ciclos de preparación para el EFIP y para la Defensa Oral, con herramientas técnicas y emocionales."],"ejemplos":[{"consulta":"Estoy muy ansioso con el EFIP.","respuesta":"Puede sumarse al ciclo de bienestar y preparación para EFIP del Gabinete de Bienestar, o pedir un encuentro individual."},{"consulta":"Necesito hablar con alguien, no doy más con la facultad.","respuesta":"Puede pedir un encuentro individual con un profesional del Gabinete de Bienestar desde La Nube."}],"ojo":[]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-gabinete-de-bienestar-1$pea0$ and a.alcance = 'global'
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select 'ec9975a2-9339-4da8-807b-3ee87d1af53e'::uuid, 'opcion_multiple', $pea0$Un alumno está nervioso por su Defensa Oral. ¿Qué le recomendás?$pea0$, $pea0$El Gabinete tiene un ciclo de dos talleres para preparar la defensa.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '444e3f43-cdbe-4389-81a6-5b8c27daf134'::uuid
where exists (select 1 from public.items where id = '444e3f43-cdbe-4389-81a6-5b8c27daf134'::uuid)
on conflict do nothing;

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, 'ec9975a2-9339-4da8-807b-3ee87d1af53e'::uuid, x.texto, x.correcta, x.orden from (values
  ('bfd061ee-9c2a-4eef-8552-3176ff59061d'::uuid, $pea0$El ciclo de preparación para la Defensa Oral del Gabinete de Bienestar.$pea0$, true, 1),
  ('be27f6ea-5cb4-4249-8dba-db874f82dcaa'::uuid, $pea0$Pedir una prórroga de la defensa.$pea0$, false, 2),
  ('b1c1e393-2c19-4b6e-87a0-a250f8429a1f'::uuid, $pea0$Cambiar de modalidad.$pea0$, false, 3)
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = 'ec9975a2-9339-4da8-807b-3ee87d1af53e'::uuid)
on conflict do nothing;
