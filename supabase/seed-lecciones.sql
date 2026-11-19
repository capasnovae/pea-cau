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
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Sofía","canal":"whatsapp","consulta":"Hola! No me llegó nada del cambio de fecha del parcial y mañana tengo que rendir el virtual. ¿Lo puedo hacer desde la tablet?"},{"tipo":"preguntar","opciones":[{"texto":"¿El correo que tiene registrado es el que usa hoy?","clave":true,"porque":"Todas las notificaciones van al correo registrado; si cambió de mail, tiene que actualizarlo."},{"texto":"¿Con qué equipo va a rendir?","clave":true,"porque":"Para exámenes virtuales se pide notebook con cámara, micrófono y un sistema operativo mínimo."},{"texto":"¿Tiene conexión a Internet?","clave":true,"porque":"Es requisito para cursar; si no la tiene, debe informarlo a la Universidad."},{"texto":"¿En qué año de la carrera está?","clave":false,"porque":"No cambia lo que le tenés que decir."}]},{"tipo":"idea","titulo":"El correo registrado es el canal oficial","texto":"Todas las notificaciones de la Universidad llegan al correo que la persona registró. Mantenerlo actualizado es responsabilidad suya: si cambió de mail y no lo actualizó en sus datos, los avisos le siguen llegando a una casilla que no usa.","clave":"Los avisos van al correo registrado; actualizarlo le toca al estudiante.","ejemplo":"Si Sofía cambió de mail, que lo actualice en sus datos y revise la casilla registrada."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"El equipo para rendir virtual","texto":"Para rendir exámenes virtuales o usar software especial hace falta una notebook con cámara y micrófono, con Windows 10 o superior o Mac Monterrey 12.6.3 o superior, además del procesador, la memoria y la conexión que se piden. Tiene que cumplir todos los requisitos, no solo uno: la tablet o el celular no sirven.","clave":"Notebook con cámara, micrófono y sistema operativo mínimo; tablet o celular, no.","ejemplo":"Sofía no puede rendir desde la tablet: necesita una notebook que cumpla los requisitos."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Sin Internet, se informa","texto":"La conexión a Internet es requisito para cursar. Si la persona no la tiene, tiene que informarlo a la Universidad, que evalúa si puede admitirla o si puede seguir cursando. No es algo que el CAU pueda dar por resuelto.","clave":"Sin conexión, lo informa a la Universidad y ella decide."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Seguir cursando depende de no tener sanciones académicas o administrativas, y una expulsión en otra universidad o instituto oficial inhabilita para cursar, salvo resolución del Rectorado.\nEn las carreras que lo piden, el ambo o la chaquetilla es obligatorio y lo compra cada estudiante."},{"tipo":"cierre","resolucion":"A Sofía le respondés que los avisos llegan al correo que tiene registrado: que revise esa casilla y, si cambió de mail, que lo actualice en sus datos. Y que el virtual no lo puede rendir desde la tablet: necesita una notebook con cámara, micrófono y Windows 10 o superior (o Mac Monterrey 12.6.3 o superior).","recordar":"Avisos al correo registrado; el virtual, con una notebook que cumpla los requisitos."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-2-5-requisitos-para-cursado$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '0c8bd593-8354-49df-8d58-bb7d3fb8bcdf'::uuid and id not in ('da469af9-09e9-45b9-89a6-f52b16e9e992'::uuid, 'b9704758-3057-4bee-882b-681051a82bff'::uuid, 'b4c6991a-6506-4560-81d2-b6321f2d21bd'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'da469af9-09e9-45b9-89a6-f52b16e9e992'::uuid, 'opcion_multiple', $pea0$Martín cursa EDH y escribe por WhatsApp: "No me llegó el aviso de cambio de fecha. Hace un año cambié de mail, pero nunca lo actualicé en el portal". ¿Qué le respondés?$pea0$, $pea0$El correo que el estudiante registró es el canal oficial de comunicación, y mantenerlo actualizado es su responsabilidad.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0c8bd593-8354-49df-8d58-bb7d3fb8bcdf'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '0c8bd593-8354-49df-8d58-bb7d3fb8bcdf'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'da469af9-09e9-45b9-89a6-f52b16e9e992'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'da469af9-09e9-45b9-89a6-f52b16e9e992'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('81285ba4-c164-492b-816b-a3c561be4a19'::uuid, $pea0$Que la Universidad tendría que haberle avisado por WhatsApp, así que hacés un reclamo.$pea0$, false, 1, $pea0$El canal oficial es el correo registrado, no WhatsApp: no hay nada que reclamar.$pea0$, null::int, null),
  ('2e9415c0-027f-4690-8ee0-9809938f0959'::uuid, $pea0$Que el correo registrado es el canal oficial y que mantenerlo actualizado es responsabilidad suya: que lo actualice ya en sus datos.$pea0$, true, 2, $pea0$Es la regla: todas las notificaciones van al correo registrado, y actualizarlo le toca al estudiante.$pea0$, null::int, null),
  ('612df04f-d3db-4821-8b13-34e5de4b3fae'::uuid, $pea0$Le reenviás el aviso y listo: no hace falta que cambie nada.$pea0$, false, 3, $pea0$Así solo resolvés este aviso; los próximos le van a seguir llegando a un correo que no usa.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'da469af9-09e9-45b9-89a6-f52b16e9e992'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'b9704758-3057-4bee-882b-681051a82bff'::uuid, 'opcion_multiple', $pea0$Carla cursa ED y tiene que rendir su primer parcial virtual. Tiene una notebook con Windows 8, cámara y micrófono. ¿Qué le decís?$pea0$, $pea0$Para rendir exámenes virtuales se pide una notebook que cumpla todos los requisitos técnicos: sistema operativo, procesador, RAM, cámara, micrófono y conexión.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0c8bd593-8354-49df-8d58-bb7d3fb8bcdf'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '0c8bd593-8354-49df-8d58-bb7d3fb8bcdf'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'b9704758-3057-4bee-882b-681051a82bff'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'b9704758-3057-4bee-882b-681051a82bff'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('51ad65fd-e151-402d-8989-9d4936fabe9e'::uuid, $pea0$Que está bien, porque tiene cámara y micrófono.$pea0$, false, 1, $pea0$También se exige el sistema operativo: Windows 10 o superior.$pea0$, null::int, null),
  ('b77b68a8-e9f5-48bb-83ba-c37eac873725'::uuid, $pea0$Que rinda desde el celular, que tiene una versión más nueva.$pea0$, false, 2, $pea0$Para los exámenes virtuales se pide una notebook o netbook, no un celular.$pea0$, null::int, null),
  ('441c5eec-7883-4b90-869e-d6819843308e'::uuid, $pea0$Que no cumple los requisitos: necesita una notebook con Windows 10 o superior (o Mac Monterrey 12.6.3 o superior), procesador i3 o superior, 64 bits, 4 GB de RAM, cámara y micrófono.$pea0$, true, 3, $pea0$El equipo tiene que cumplir todas las características técnicas, no solo una.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'b9704758-3057-4bee-882b-681051a82bff'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'b4c6991a-6506-4560-81d2-b6321f2d21bd'::uuid, 'opcion_multiple', $pea0$Diego quiere inscribirse en EDH y cuenta que no tiene Internet en su casa. ¿Qué hacés?$pea0$, $pea0$Sin conexión a Internet, la persona tiene que informarlo a la Universidad, que decide si es viable su admisión o que siga cursando.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0c8bd593-8354-49df-8d58-bb7d3fb8bcdf'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '0c8bd593-8354-49df-8d58-bb7d3fb8bcdf'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'b4c6991a-6506-4560-81d2-b6321f2d21bd'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'b4c6991a-6506-4560-81d2-b6321f2d21bd'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('d70abacc-bae7-40e8-85cd-659b491f62ce'::uuid, $pea0$Le decís que no se puede inscribir.$pea0$, false, 1, $pea0$El reglamento no lo prohíbe de entrada: la Universidad evalúa el caso.$pea0$, null::int, null),
  ('0c9d4175-6d68-4642-8783-c843e2db4ecc'::uuid, $pea0$Le explicás que tiene que informarlo a la Universidad, que se va a expedir sobre si es viable su admisión.$pea0$, true, 2, $pea0$Es lo que pide la regla cuando falta conexión.$pea0$, null::int, null),
  ('8fc0eb2d-c876-4f26-8be1-6a80bfbfff78'::uuid, $pea0$Le decís que no hay problema, que se arregla con los datos del celular.$pea0$, false, 3, $pea0$La conexión es un requisito y la falta de Internet hay que informarla; no la podés dar por resuelta vos.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'b4c6991a-6506-4560-81d2-b6321f2d21bd'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'a0ce0cfc-f526-4528-83dd-560760fd78fa'::uuid, '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid, 2, $pea0$Modalidades del CAU: ED, EDH y PD$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Agustina","canal":"mostrador","consulta":"Hola, quiero empezar a estudiar pero trabajo todo el día. ¿Me conviene ED o EDH? ¿Tengo que venir al CAU?"},{"tipo":"preguntar","opciones":[{"texto":"¿Puede venir al CAU cada 2 semanas por materia?","clave":true,"porque":"En ED hay Open Class en el CAU; en EDH no hay asistencia."},{"texto":"¿Es una carrera de grado o de pregrado?","clave":true,"porque":"En grado, en ED puede sumar 1 materia 100% virtual por subperíodo."},{"texto":"¿Necesita ajustes razonables?","clave":true,"porque":"Con ajustes razonables rinde obligatoriamente en su sede o CAU."},{"texto":"¿Qué promedio tuvo en el secundario?","clave":false,"porque":"No cambia la modalidad que le conviene."}]},{"tipo":"idea","titulo":"ED: plataforma y Open Class en el CAU","texto":"En ED se cursa en la plataforma y se asiste a Open Class en el CAU: cada subperíodo dura 9 semanas y se va cada 2 semanas por materia, en las fechas del calendario. Se cursan hasta 2 materias con asistencia por subperíodo; en grado se puede sumar 1 materia 100% virtual, que se rige por las reglas de EDH.","clave":"ED: Open Class cada 2 semanas por materia; en grado, +1 materia virtual.","ejemplo":"Si Agustina puede venir al CAU cada dos semanas, ED le sirve."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"EDH, todo en la plataforma; PD, presencial","texto":"En EDH todo el cursado es en la plataforma, sin asistencia al CAU, y el 75% de asistencia de las condiciones de aprobación no aplica. Distancia (ED o EDH) está pensada para quien no puede asistir regularmente.\nPD, en cambio, es presencial: las materias se cursan cuatrimestralmente con actividades sincrónicas.","clave":"EDH: sin asistencia al CAU. PD: presencial y cuatrimestral.","ejemplo":"Si Agustina no puede venir nunca, EDH es la que le sirve."},{"tipo":"probalo","n":1},{"tipo":"ojo","texto":"Quienes necesitan ajustes razonables rinden obligatoriamente en su sede o CAU, no en su casa, aunque cursen EDH.\nY si en el CAU no se llega a 5 ingresantes de la misma carrera, la Universidad puede pasar a los de ED a EDH."},{"tipo":"probalo","n":3},{"tipo":"cierre","resolucion":"A Agustina le explicás que las dos modalidades a distancia están pensadas para quien trabaja: en ED cursa en la plataforma y viene al CAU a las Open Class, cada 2 semanas por materia; en EDH todo es en la plataforma, sin venir al CAU. Que elija según si puede asistir cada dos semanas.","recordar":"ED: Open Class en el CAU. EDH: todo en la plataforma. PD: presencial."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-3-1-modalidades-de-cursado$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'a0ce0cfc-f526-4528-83dd-560760fd78fa'::uuid and id not in ('0cd974c7-c188-4575-8ad2-9d3615efe786'::uuid, '2e4d6eb3-7635-4d7f-813a-0cafd91612a4'::uuid, 'e5868466-321d-4c2a-8e10-990a5246c857'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '0cd974c7-c188-4575-8ad2-9d3615efe786'::uuid, 'clasificar', $pea0$Clasificá cada característica según la modalidad a la que corresponde.$pea0$, $pea0$ED combina plataforma y Open Class en el CAU; EDH es íntegramente en la plataforma; PD es presencial y cuatrimestral con actividades sincrónicas en el CAU.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a0ce0cfc-f526-4528-83dd-560760fd78fa'::uuid, $pea0${"columnas":["ED","EDH","PD"]}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'a0ce0cfc-f526-4528-83dd-560760fd78fa'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '0cd974c7-c188-4575-8ad2-9d3615efe786'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '0cd974c7-c188-4575-8ad2-9d3615efe786'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('67418201-d589-4c05-8c0d-8882c4259520'::uuid, $pea0$Open Class en el CAU cada 2 semanas por materia$pea0$, false, 1, null, null::int, $pea0$ED$pea0$),
  ('d9dc5b54-6c24-453e-80dd-065ab0bed35f'::uuid, $pea0$Todo el cursado en la plataforma, sin asistencia al CAU$pea0$, false, 2, null, null::int, $pea0$EDH$pea0$),
  ('9a9830ee-a3ed-488b-8dea-269c031415be'::uuid, $pea0$Materias cuatrimestrales con actividades sincrónicas en el CAU$pea0$, false, 3, null, null::int, $pea0$PD$pea0$),
  ('af66e066-089d-41a2-8e20-aa84bfda51bf'::uuid, $pea0$Subperíodos de 9 semanas con hasta 2 materias con asistencia al CAU$pea0$, false, 4, null, null::int, $pea0$ED$pea0$),
  ('90586c62-3f11-4f45-871c-ca0c09cfccf1'::uuid, $pea0$No se exige porcentaje de asistencia$pea0$, false, 5, null, null::int, $pea0$EDH$pea0$)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '0cd974c7-c188-4575-8ad2-9d3615efe786'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '2e4d6eb3-7635-4d7f-813a-0cafd91612a4'::uuid, 'opcion_multiple', $pea0$Tomás cursa una carrera de pregrado en ED. Ya tiene 2 materias con Open Class en el subperíodo y quiere sumar una tercera "100% virtual" para no venir al CAU. ¿Qué le decís?$pea0$, $pea0$En ED se cursan hasta 2 materias con asistencia por subperíodo; solo en grado se puede sumar 1 materia íntegramente virtual, que se rige por las reglas de EDH.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a0ce0cfc-f526-4528-83dd-560760fd78fa'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'a0ce0cfc-f526-4528-83dd-560760fd78fa'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '2e4d6eb3-7635-4d7f-813a-0cafd91612a4'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '2e4d6eb3-7635-4d7f-813a-0cafd91612a4'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('c7e0e31a-f5ec-4452-88cb-1e65fd58ece1'::uuid, $pea0$Que sí: en ED se puede sumar 1 materia íntegramente virtual por subperíodo.$pea0$, false, 1, $pea0$Esa materia extra virtual es solo para carreras de grado.$pea0$, null::int, null),
  ('98442d17-8088-4496-8bcd-4b35d2103940'::uuid, $pea0$Que no: la materia íntegramente virtual adicional es solo para carreras de grado.$pea0$, true, 2, $pea0$Tomás es de pregrado: su tope en ED es de 2 materias con asistencia al CAU por subperíodo.$pea0$, null::int, null),
  ('b7a3b270-fefc-447c-8fda-29e46362c2d9'::uuid, $pea0$Que sí, siempre que la rinda en el CAU.$pea0$, false, 3, $pea0$El lugar donde rinde no cambia nada: la opción no existe para pregrado.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '2e4d6eb3-7635-4d7f-813a-0cafd91612a4'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'e5868466-321d-4c2a-8e10-990a5246c857'::uuid, 'opcion_multiple', $pea0$Lucía cursa EDH y tiene ajustes razonables por el Protocolo de Prácticas Educativas Inclusivas. Pregunta si puede rendir el final desde su casa, como sus compañeros. ¿Qué le respondés?$pea0$, $pea0$Quienes requieren ajustes razonables rinden de forma obligatoria en su sede o CAU, nunca en su domicilio, tanto en ED como en EDH.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a0ce0cfc-f526-4528-83dd-560760fd78fa'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'a0ce0cfc-f526-4528-83dd-560760fd78fa'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'e5868466-321d-4c2a-8e10-990a5246c857'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'e5868466-321d-4c2a-8e10-990a5246c857'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('caec79fc-4d2b-4c34-8670-cd6fc33a1212'::uuid, $pea0$Que sí: en EDH todos rinden en el lugar que elijan.$pea0$, false, 1, $pea0$Esa es la regla general, pero quienes tienen ajustes razonables quedan exceptuados.$pea0$, null::int, null),
  ('52f5fde8-8d16-42b2-85aa-5ece9bcb9a3b'::uuid, $pea0$Que para rendir en el CAU se tiene que pasar a ED.$pea0$, false, 2, $pea0$No hace falta cambiar de modalidad: rinde en su sede o CAU sin dejar EDH.$pea0$, null::int, null),
  ('34f8ccdf-c6f1-4bec-8d24-c90c143d6d58'::uuid, $pea0$Que no: con ajustes razonables tiene que rendir obligatoriamente en su sede o CAU.$pea0$, true, 3, $pea0$La fuente prohíbe rendir en el domicilio particular en esos casos.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'e5868466-321d-4c2a-8e10-990a5246c857'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '51622ea5-2aad-4a37-8328-1bbfc5b489fb'::uuid, 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid, 3, $pea0$Inscripción a materias$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Bruno","canal":"telefono","consulta":"Hola, se me pasó la fecha de inscripción y todavía no pagué la cuota. ¿Me pueden anotar igual a las materias?"},{"tipo":"preguntar","opciones":[{"texto":"¿Sigue abierto el período de inscripción del calendario?","clave":true,"porque":"Cerrado el período, no hay inscripción."},{"texto":"¿Tiene los aranceles al día y el legajo completo?","clave":true,"porque":"Son requisitos; sin los aranceles pagos la inscripción no queda firme."},{"texto":"¿Es grado o pregrado, y en qué modalidad?","clave":true,"porque":"De eso dependen los topes de materias."},{"texto":"¿Qué materia le gusta más?","clave":false,"porque":"No cambia nada del trámite."}]},{"tipo":"idea","titulo":"Cuándo y con qué requisitos","texto":"Se inscribe en el período del Calendario Académico: cerrado el período, no hay inscripción. Necesita aranceles al día, legajo completo, estar matriculado y respetar las correlativas; para materias de cuarto cuatrimestre, además, Universitarios 21 aprobado. Queda inscripto a la materia recién con la inscripción hecha y los aranceles pagos.","clave":"En fecha, al día y con correlativas; sin pago, no queda inscripto.","ejemplo":"A Bruno, con el período cerrado, no se lo puede anotar."},{"tipo":"probalo","n":3},{"tipo":"idea","titulo":"Cuántas materias","texto":"En ED y EDH, en grado: hasta 6 materias al inicio del semestre más 2 adicionales; en pregrado, 4 más 2. Si se inscribe solo en el subperíodo B, 1 extra. En PD, hasta 8 materias. Las extras se pagan aparte y dependen de las correlativas.","clave":"Distancia: grado 6 + 2, pregrado 4 + 2. PD: hasta 8."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Ingresantes y segundo subperíodo","texto":"Los ingresantes no pueden anotarse a materias extra. Los ingresantes con equivalencias y quienes empiezan en los segundos subperíodos (junio u octubre) cursan solo materias de ese subperíodo, hasta 3.","clave":"Ingresantes: sin extras; si empiezan en junio u octubre, hasta 3."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Práctica Solidaria y Práctica Profesional tienen su propia fecha: inscripción hasta el viernes previo al inicio de clases.\nAlgunas carreras tienen otros topes: Procurador, 5 + 2; Licenciatura en Educación y Escribanía (ciclos), 4 + 2."},{"tipo":"cierre","resolucion":"A Bruno le explicás que, cerrado el período del Calendario Académico, no se lo puede inscribir, y que aunque se anote en fecha, la inscripción queda firme recién con los aranceles pagos. Que tenga en cuenta las fechas del próximo período y llegue con la cuota al día.","recordar":"Inscripción en fecha y con los aranceles pagos."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-2-inscripcion-a-materias$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '51622ea5-2aad-4a37-8328-1bbfc5b489fb'::uuid and id not in ('26d8df03-a1a9-4918-8e13-73ba925845df'::uuid, '2a455e9a-0c90-40c0-8825-1048e0326aa1'::uuid, '774b0ecb-a395-4371-8276-b95406282879'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '26d8df03-a1a9-4918-8e13-73ba925845df'::uuid, 'opcion_multiple', $pea0$Julieta cursa una carrera de grado en EDH, no es ingresante y sus correlativas le permiten todo. Al inicio del semestre se quiere anotar a 7 materias. ¿Qué le decís?$pea0$, $pea0$En ED/EDH, grado: hasta 6 materias al inicio del semestre más 2 extra con arancel adicional, si las correlativas lo permiten y no es ingresante.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '51622ea5-2aad-4a37-8328-1bbfc5b489fb'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '51622ea5-2aad-4a37-8328-1bbfc5b489fb'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '26d8df03-a1a9-4918-8e13-73ba925845df'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '26d8df03-a1a9-4918-8e13-73ba925845df'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('2b369bdb-fd21-4aea-8a04-6757a077127d'::uuid, $pea0$Que el máximo es 6 y no puede sumar más.$pea0$, false, 1, $pea0$Le sacás las 2 adicionales que el reglamento le permite.$pea0$, null::int, null),
  ('f2294a34-50c6-4478-8120-8d46044cca02'::uuid, $pea0$Que puede: 6 materias más hasta 2 adicionales; la séptima se paga con un arancel aparte.$pea0$, true, 2, $pea0$En grado ED/EDH el tope es 6 + 2, y las extras implican un arancel adicional.$pea0$, null::int, null),
  ('bebcad44-5329-47d2-864b-5eaf36fcb109'::uuid, $pea0$Que puede anotarse hasta a 8 sin costo adicional.$pea0$, false, 3, $pea0$El tope es correcto, pero las extras siempre llevan un arancel adicional.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '26d8df03-a1a9-4918-8e13-73ba925845df'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '2a455e9a-0c90-40c0-8825-1048e0326aa1'::uuid, 'opcion_multiple', $pea0$Nahuel es ingresante en una carrera de grado en ED y empieza en el segundo subperíodo (octubre). Se quiere anotar a 4 materias. ¿Qué le respondés?$pea0$, $pea0$Quien empieza en un segundo subperíodo (junio u octubre) cursa solo materias de ese subperíodo, hasta 3; los ingresantes no pueden sumar materias extra.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '51622ea5-2aad-4a37-8328-1bbfc5b489fb'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '51622ea5-2aad-4a37-8328-1bbfc5b489fb'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '2a455e9a-0c90-40c0-8825-1048e0326aa1'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '2a455e9a-0c90-40c0-8825-1048e0326aa1'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('51c5a4e8-b64c-4c84-8006-741ce69e9d55'::uuid, $pea0$Que puede anotarse a 6 + 2, como cualquier alumno de grado.$pea0$, false, 1, $pea0$Quien empieza en un segundo subperíodo tiene otro tope.$pea0$, null::int, null),
  ('1b3d5104-311a-43e7-8b99-b85f7f5b2e6f'::uuid, $pea0$Que puede anotarse a 3 y sumar 1 extra pagándola aparte.$pea0$, false, 2, $pea0$Los ingresantes no pueden anotarse a materias extra.$pea0$, null::int, null),
  ('df746436-4559-4d98-8153-89c244fa1844'::uuid, $pea0$Que solo puede cursar materias ofrecidas en ese subperíodo, hasta 3, sin extras.$pea0$, true, 3, $pea0$Es la regla para quien empieza en junio u octubre, y como ingresante no tiene extras.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '2a455e9a-0c90-40c0-8825-1048e0326aa1'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '774b0ecb-a395-4371-8276-b95406282879'::uuid, 'verdadero_falso', $pea0$Si el alumno ya se anotó a la materia en el portal, está inscripto aunque todavía no haya pagado los aranceles.$pea0$, $pea0$La condición de inscripto a la materia se adquiere solo cuando abonó los aranceles e hizo la inscripción.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '51622ea5-2aad-4a37-8328-1bbfc5b489fb'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '51622ea5-2aad-4a37-8328-1bbfc5b489fb'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '774b0ecb-a395-4371-8276-b95406282879'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '774b0ecb-a395-4371-8276-b95406282879'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('3a6ad727-0d98-4387-8a1d-e45f7bb14ea5'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('120cff47-0686-45b7-85e5-c5f080b00939'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '774b0ecb-a395-4371-8276-b95406282879'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '167ada6b-e3cf-4327-8c9a-e06a0122ddc1'::uuid, 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid, 4, $pea0$Cambio de cátedra (PD)$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Joaquín","canal":"mostrador","consulta":"Hola, curso PD a la mañana y me quiero pasar a la cátedra de la tarde de una materia, porque me queda mejor con el trabajo. ¿Se puede?"},{"tipo":"preguntar","opciones":[{"texto":"¿En qué modalidad cursa?","clave":true,"porque":"El cambio de cátedra es solo para modalidades presenciales: en el CAU, PD."},{"texto":"¿Tiene superposición de horarios entre materias del mismo semestre?","clave":true,"porque":"Es el único motivo por el que se cambia de cátedra."},{"texto":"¿Tiene pagos los aranceles del semestre?","clave":true,"porque":"Es requisito para pedirlo."},{"texto":"¿Qué docente prefiere?","clave":false,"porque":"La preferencia por un docente no habilita el cambio."}]},{"tipo":"idea","titulo":"Solo en PD y solo por superposición","texto":"El cambio de cátedra es solo para las modalidades presenciales: en el CAU, aplica a PD. Se pide en el período del Calendario Académico y solo si hay superposición de horarios entre materias del mismo semestre. No se cambia por comodidad ni por preferir otro docente.","clave":"PD, en fecha y solo si se superponen materias del mismo semestre.","ejemplo":"Si a Joaquín no se le superponen materias, no corresponde el cambio."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Mismo turno y aranceles pagos","texto":"Además, tiene que tener pagos los aranceles del semestre y el cambio es siempre a una cátedra del mismo turno: de mañana a mañana, no de mañana a tarde.","clave":"Con aranceles pagos y siempre dentro del mismo turno.","ejemplo":"Aunque Joaquín tuviera superposición, no podría pasar a la tarde."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Si cursa materias de distintos cuatrimestres a la vez, la Universidad no garantiza que no haya superposiciones.\nLas fechas del cambio de cátedra salen en el Calendario Académico de PD de cada año: chequealas ahí, no de memoria."},{"tipo":"probalo","n":3},{"tipo":"cierre","resolucion":"A Joaquín le explicás que no se puede: el cambio de cátedra se pide solo si hay superposición de horarios entre materias del mismo semestre, y siempre a una cátedra del mismo turno. Pasarse a la tarde porque le queda mejor no es un motivo que se acepte.","recordar":"Solo por superposición, en fecha, con aranceles pagos y en el mismo turno."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-4-cambio-de-catedra$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '167ada6b-e3cf-4327-8c9a-e06a0122ddc1'::uuid and id not in ('bc5e3d3b-e07a-45da-831f-939b305124e5'::uuid, 'c6a5d744-7c69-425c-8e31-1e36e0a96c4a'::uuid, '5f635f65-66a8-428e-8585-d267225d7c4f'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'bc5e3d3b-e07a-45da-831f-939b305124e5'::uuid, 'clasificar', $pea0$Clasificá cada situación según si corresponde o no un cambio de cátedra.$pea0$, $pea0$Solo corresponde en modalidades presenciales (en el CAU, PD), dentro del período, con superposición entre materias del mismo semestre, con aranceles pagos y a una cátedra del mismo turno.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '167ada6b-e3cf-4327-8c9a-e06a0122ddc1'::uuid, $pea0${"columnas":["Corresponde","No corresponde"]}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '167ada6b-e3cf-4327-8c9a-e06a0122ddc1'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'bc5e3d3b-e07a-45da-831f-939b305124e5'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'bc5e3d3b-e07a-45da-831f-939b305124e5'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('ff0e04e3-7f01-49cf-856a-ffb28078bf29'::uuid, $pea0$Alumno de PD con superposición entre materias del mismo semestre, aranceles pagos, dentro del período$pea0$, false, 1, null, null::int, $pea0$Corresponde$pea0$),
  ('1f7e9ac5-2944-4923-8ce6-4ac0f93b8c4f'::uuid, $pea0$Alumno de ED que prefiere otro tutor$pea0$, false, 2, null, null::int, $pea0$No corresponde$pea0$),
  ('28b2b781-a483-4dcb-854b-1ced27061d0b'::uuid, $pea0$Alumno de PD sin superposición que quiere otro docente$pea0$, false, 3, null, null::int, $pea0$No corresponde$pea0$),
  ('49aada24-7bee-497f-8143-44beeae4a5aa'::uuid, $pea0$Alumno de PD con superposición entre materias del mismo semestre, pero con aranceles del semestre impagos$pea0$, false, 4, null, null::int, $pea0$No corresponde$pea0$)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'bc5e3d3b-e07a-45da-831f-939b305124e5'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'c6a5d744-7c69-425c-8e31-1e36e0a96c4a'::uuid, 'opcion_multiple', $pea0$Ramiro cursa PD a la mañana. Dos materias del mismo semestre se le superponen, tiene los aranceles pagos y está dentro del período. Pide pasarse a una cátedra del turno noche. ¿Qué le respondés?$pea0$, $pea0$El cambio de cátedra solo se hace a cátedras del mismo turno de cursado.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '167ada6b-e3cf-4327-8c9a-e06a0122ddc1'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '167ada6b-e3cf-4327-8c9a-e06a0122ddc1'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'c6a5d744-7c69-425c-8e31-1e36e0a96c4a'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'c6a5d744-7c69-425c-8e31-1e36e0a96c4a'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('bcd953f7-2c36-4374-8ba8-c4530c309701'::uuid, $pea0$Que sí: como hay superposición, puede elegir cualquier cátedra.$pea0$, false, 1, $pea0$El cambio está limitado a cátedras del mismo turno.$pea0$, null::int, null),
  ('e62897d1-1d7e-4e13-8329-fe25287128aa'::uuid, $pea0$Que puede pedir el cambio, pero solo a una cátedra del turno mañana.$pea0$, true, 2, $pea0$Cumple los requisitos, y el destino tiene que ser del mismo turno.$pea0$, null::int, null),
  ('364102d2-9d90-413a-82a6-73e1104fad1e'::uuid, $pea0$Que no puede, porque los cambios de cátedra solo se dan por mérito académico.$pea0$, false, 3, $pea0$No existe esa condición: el motivo válido es la superposición de horarios.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'c6a5d744-7c69-425c-8e31-1e36e0a96c4a'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '5f635f65-66a8-428e-8585-d267225d7c4f'::uuid, 'opcion_multiple', $pea0$Agustina cursa PD y este semestre tiene materias de 1.º y de 3.er cuatrimestre del plan; dos de ellas se superponen. ¿Qué le decís?$pea0$, $pea0$El cambio de cátedra aplica a superposiciones entre materias del mismo semestre; si se cursan materias de distintos cuatrimestres, la Universidad no puede garantizar que no se superpongan.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '167ada6b-e3cf-4327-8c9a-e06a0122ddc1'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '167ada6b-e3cf-4327-8c9a-e06a0122ddc1'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '5f635f65-66a8-428e-8585-d267225d7c4f'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '5f635f65-66a8-428e-8585-d267225d7c4f'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('acbac109-4c57-484a-8d44-c4108f13b502'::uuid, $pea0$Que pida cambio de cátedra, que siempre se da cuando hay superposición.$pea0$, false, 1, $pea0$La regla exige que las materias sean del mismo semestre.$pea0$, null::int, null),
  ('94f6fb68-51d6-4c78-8f97-ca8c5ad85721'::uuid, $pea0$Que el cambio de cátedra cubre superposiciones entre materias del mismo semestre; si cursa materias de distintos cuatrimestres, la Universidad no garantiza que no haya superposición.$pea0$, true, 2, $pea0$Es la nota expresa del reglamento.$pea0$, null::int, null),
  ('c9917ebc-e0a8-45c2-84dc-51c7f5d32be0'::uuid, $pea0$Que se pase a EDH para evitar la superposición.$pea0$, false, 3, $pea0$Es un cambio de modalidad, con otras consecuencias: no es la respuesta a esta consulta.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '5f635f65-66a8-428e-8585-d267225d7c4f'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '046b3b65-8558-4c89-810b-922567df3cb0'::uuid, '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid, 5, $pea0$Cambio de modalidad$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"video","ruta":"lecciones/05-cambio-de-modalidad.mp4"},{"tipo":"caso","persona":"Lucía","canal":"whatsapp","consulta":"Hola! Curso ED pero con el trabajo no llego a cumplir la asistencia en el CAU. Me quiero pasar a EDH. ¿Se puede? ¿Cómo hago?"},{"tipo":"preguntar","opciones":[{"texto":"¿Está anotada a algún final o le falta que carguen una nota?","clave":true,"porque":"Con un final anotado o una nota pendiente de carga no puede pedir el pase."},{"texto":"¿Cómo están sus materias: aprobadas, regulares, cursando, libres?","clave":true,"porque":"De eso depende qué conserva y qué tiene que recursar."},{"texto":"¿Tiene el Seminario de Práctica regular?","clave":true,"porque":"Entre ED y EDH esa regularidad se conserva; en otros pases se pierde."},{"texto":"¿Aprobó Universitario 21?","clave":false,"porque":"No es requisito para cambiar de modalidad."}]},{"tipo":"idea","titulo":"Antes de pedirlo, que esté en regla","texto":"El pase se pide en las fechas del calendario de trámites de cada año, que cambian según la modalidad de origen: fuera de esa ventana no se puede. Además tiene que cumplir las condiciones de ingreso de la nueva modalidad, tener libre deuda y el legajo completo, y no estar anotada a una mesa de final ni tener una nota de final pendiente de carga.\nNo hace falta tener Universitario 21 ni materias aprobadas.","clave":"En fecha, sin deuda, legajo completo y sin finales pendientes.","ejemplo":"En el chequeo ves que Lucía rinde el jueves un final Libre por Nota: primero rinde (o se da de baja de esa mesa) y recién después avisa al CAU para pedir el pase."},{"tipo":"idea","titulo":"Qué pasa con cada materia","texto":"Lo que ya ganó, lo conserva: las aprobadas siguen aprobadas y las regulares siguen regulares, pero las rinde con las reglas de evaluación de la modalidad nueva. Lo que está en curso se pierde: las que está cursando y las Libre por Nota quedan Libre por Pase, y las tiene que recursar.\nPor eso, antes de pedir el pase, conviene que revise cómo le quedarían.","clave":"Aprobadas y regulares se conservan; cursando y Libre por Nota se recursan.","ejemplo":"Las 2 materias que Lucía está cursando hoy quedarían Libre por Pase."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"El Seminario de Práctica, la excepción","texto":"En casi todos los pases, el Seminario de Práctica pierde su condición. La excepción es justamente el pase más común del CAU: entre ED y EDH, si lo tiene regular, conserva la regularidad.\nEl Seminario Final regular se mantiene siempre, en cualquier pase.","clave":"Entre ED y EDH, el Seminario de Práctica regular se conserva."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Si el pase es al revés, a ED (o cambia de CAU), que no se vaya sin confirmar su lugar: en esos casos es responsabilidad del estudiante contactar al CAU de destino, porque no todos los CAU ofrecen todas las carreras ni todas las materias.\nPara el CAU, el pase entre ED y EDH es un cambio de submodalidad: va por HubSpot a Gestiones N2 con DNI, legajo, carrera, submodalidad de origen y de destino, CAU de destino y si tiene materias Cursando o Libre por Nota. Tarda hasta 5 días hábiles."},{"tipo":"probalo","n":3},{"tipo":"cierre","resolucion":"A Lucía le respondés que sí se puede, pero no todavía: primero rinde el final del jueves (o se da de baja de esa mesa) y espera que carguen la nota. Le avisás que las 2 materias que cursa quedarían Libre por Pase, y que conserva sus aprobadas, sus regulares (que rinde con las reglas de EDH) y, si lo tiene regular, el Seminario de Práctica. Cuando tenga la nota cargada, te avisa y el CAU lo pide por interno (a Gestiones N2), dentro de las fechas del calendario de trámites.","recordar":"Primero sin finales pendientes, después el pase, en fecha."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-3-2-cambios-de-modalidad$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '046b3b65-8558-4c89-810b-922567df3cb0'::uuid and id not in ('6b41783d-37e9-4583-808c-1e36ac3f5202'::uuid, '42369db1-c3c5-4986-8b34-2272b155a33f'::uuid, 'fb8b142d-05d3-45c5-8c98-bffdd7b114c5'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '6b41783d-37e9-4583-808c-1e36ac3f5202'::uuid, 'opcion_multiple', $pea0$Valentina cursa EDH y se quiere pasar a ED. Tiene 5 materias aprobadas, 1 regular, 1 Libre por Nota y 2 cursando. ¿Cómo le quedan?$pea0$, $pea0$Aprobadas y regulares se conservan (las regulares se rinden con las reglas de la modalidad de destino); "cursando" y "Libre por Nota" pasan a Libre por Pase.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '046b3b65-8558-4c89-810b-922567df3cb0'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '046b3b65-8558-4c89-810b-922567df3cb0'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '6b41783d-37e9-4583-808c-1e36ac3f5202'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '6b41783d-37e9-4583-808c-1e36ac3f5202'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('79d074c0-9d80-4886-80d7-ab035439aa85'::uuid, $pea0$Conserva todo, porque es un pase dentro de distancia.$pea0$, false, 1, $pea0$Las reglas comunes se aplican a todos los pases, también ED↔EDH.$pea0$, null::int, null),
  ('20d4d0b3-0056-41d5-8d10-5f9bba32194f'::uuid, $pea0$Conserva las aprobadas y la regular (que rinde con las reglas de ED); la Libre por Nota y las 2 que cursa quedan Libre por Pase y las tiene que recursar.$pea0$, true, 2, $pea0$Es la regla común a todos los cambios de modalidad.$pea0$, null::int, null),
  ('ac3bb6a5-9bb5-4252-8ec5-6abf63e1fa09'::uuid, $pea0$Conserva solo las aprobadas; la regular también queda Libre por Pase.$pea0$, false, 3, $pea0$La condición Regular se conserva en todos los casos.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '6b41783d-37e9-4583-808c-1e36ac3f5202'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '42369db1-c3c5-4986-8b34-2272b155a33f'::uuid, 'opcion_multiple', $pea0$Florencia cursa una carrera de grado en ED, tiene el Seminario de Práctica regular y se quiere pasar a EDH. Pregunta si lo pierde. ¿Qué le respondés?$pea0$, $pea0$El Seminario de Práctica pierde su condición en los pases entre modalidades, salvo en ED↔EDH, donde se conserva la regularidad.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '046b3b65-8558-4c89-810b-922567df3cb0'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '046b3b65-8558-4c89-810b-922567df3cb0'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '42369db1-c3c5-4986-8b34-2272b155a33f'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '42369db1-c3c5-4986-8b34-2272b155a33f'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('7c1052b4-be4b-4edd-825a-f5e787c6e286'::uuid, $pea0$Que lo pierde: el Seminario de Práctica se pierde en cualquier pase.$pea0$, false, 1, $pea0$Hay una excepción justamente para ED↔EDH.$pea0$, null::int, null),
  ('90f73ac2-f3c3-4c2c-8545-f6f4c1be0a0b'::uuid, $pea0$Que antes del pase tiene que rendir EFIP I o lo pierde.$pea0$, false, 2, $pea0$Esa exigencia es para quien pasa de distancia a presencial (P o PH).$pea0$, null::int, null),
  ('70b6dc02-baf5-414a-8bf7-5081d3195faa'::uuid, $pea0$Que conserva la regularidad: en el pase ED↔EDH el Seminario de Práctica regular se mantiene.$pea0$, true, 3, $pea0$Es la única situación en la que el reglamento conserva esa regularidad.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '42369db1-c3c5-4986-8b34-2272b155a33f'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'fb8b142d-05d3-45c5-8c98-bffdd7b114c5'::uuid, 'opcion_multiple', $pea0$Ezequiel cursa EDH, cumple todos los requisitos y se quiere pasar a ED en tu CAU. ¿Qué más le recomendás antes de tramitar el pase?$pea0$, $pea0$En todo pase a ED, o cambio de CAU, el estudiante tiene que confirmar su lugar con el CAU de destino.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '046b3b65-8558-4c89-810b-922567df3cb0'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '046b3b65-8558-4c89-810b-922567df3cb0'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'fb8b142d-05d3-45c5-8c98-bffdd7b114c5'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'fb8b142d-05d3-45c5-8c98-bffdd7b114c5'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('73afc402-d673-40aa-8480-d33682ba4408'::uuid, $pea0$Nada: si cumple los requisitos, el lugar en el CAU está garantizado.$pea0$, false, 1, $pea0$No en todos los CAU se ofrecen todas las carreras o materias.$pea0$, null::int, null),
  ('01549144-c0b9-47e1-8ed4-2498c5427457'::uuid, $pea0$Que contacte al CAU de destino para asegurar su lugar, porque es responsabilidad suya.$pea0$, true, 2, $pea0$El reglamento pone esa responsabilidad en el estudiante en todo pase a ED o cambio de CAU.$pea0$, null::int, null),
  ('e2c56fd0-2876-48e8-86e4-73cbe375e7d7'::uuid, $pea0$Que primero apruebe Universitario 21.$pea0$, false, 3, $pea0$Para el cambio de modalidad no se exige tener Universitario 21 aprobado.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'fb8b142d-05d3-45c5-8c98-bffdd7b114c5'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '0e0f7567-7780-4bb1-8f96-8da38a4030a0'::uuid, '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid, 6, $pea0$Equivalencias$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Valeria","canal":"whatsapp","consulta":"Hola! Hice dos años de Administración en otra facu. Varias materias se llaman igual que acá, ¿me las dan por equivalencia?"},{"tipo":"preguntar","opciones":[{"texto":"¿Tiene los programas de las materias?","clave":true,"porque":"Se comparan contenidos, objetivos, bibliografía y nivel, no el nombre."},{"texto":"¿Tiene el analítico y el plan legalizados?","clave":true,"porque":"Son parte de lo que se presenta, junto con el DNI y la tasa."},{"texto":"¿Qué materias quiere que le reconozcan?","clave":true,"porque":"Algunas no se dan por equivalencia externa y hay un tope del 70% del plan."},{"texto":"¿Con qué promedio terminó?","clave":false,"porque":"No es lo que se evalúa."}]},{"tipo":"idea","titulo":"Se compara el contenido, no el nombre","texto":"Para una equivalencia se evalúan los contenidos, los objetivos, la bibliografía y el nivel de la materia, no solo el nombre. No hay reconocimiento parcial ni se otorga la condición de regular por equivalencia, y se puede reconocer como máximo el 70% del plan de la carrera de destino.","clave":"Contenidos, objetivos y bibliografía; nada parcial; hasta el 70% del plan.","ejemplo":"Que las materias de Valeria se llamen igual no alcanza: se comparan los programas."},{"tipo":"idea","titulo":"Qué se presenta","texto":"Para equivalencias externas se pide DNI, certificado analítico legalizado, plan de estudios y programas legalizados, y el comprobante de pago de la tasa. Si hay un pre-dictamen aprobado para esa institución y carrera, no se piden los programas.","clave":"DNI, analítico, plan y programas legalizados y la tasa (sin programas si hay pre-dictamen)."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Práctica Solidaria, Práctica Profesional y Seminario Final no se dan por equivalencia externa: se aprueban en Siglo 21.\nEn distancia, el Seminario de Práctica tampoco: se aprueba con el EFIP I."},{"tipo":"probalo","n":1},{"tipo":"probalo","n":2},{"tipo":"cierre","resolucion":"A Valeria le explicás que el nombre no alcanza: se comparan contenidos, objetivos, bibliografía y nivel. Que traiga DNI, analítico, plan y programas legalizados y pague la tasa; le pueden reconocer hasta el 70% del plan, sin reconocimientos parciales.","recordar":"Se comparan programas, no nombres; hasta el 70% del plan."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-6-1-sistema-de-equivalencias-para-todas-las-modalidades$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '0e0f7567-7780-4bb1-8f96-8da38a4030a0'::uuid and id not in ('af2f9107-574e-4419-811c-91a2a94f4b51'::uuid, '0f8f45fd-48a2-4352-8e1d-01fd5e89c37d'::uuid, '232916ee-2681-425b-8bd6-aefc592c4556'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'af2f9107-574e-4419-811c-91a2a94f4b51'::uuid, 'opcion_multiple', $pea0$Pablo se inscribe a una carrera de grado en EDH y quiere pedir equivalencia por la Práctica Profesional y el Seminario Final que aprobó en otra universidad. ¿Qué le decís?$pea0$, $pea0$Práctica Solidaria, Práctica Profesional y Seminario Final no se reconocen por equivalencia externa.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0e0f7567-7780-4bb1-8f96-8da38a4030a0'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '0e0f7567-7780-4bb1-8f96-8da38a4030a0'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'af2f9107-574e-4419-811c-91a2a94f4b51'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'af2f9107-574e-4419-811c-91a2a94f4b51'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('76b4b1b0-3409-49c1-8878-6baa1097ae0a'::uuid, $pea0$Que sí, si las materias tienen el mismo nombre.$pea0$, false, 1, $pea0$El nombre no define la equivalencia y, además, esas materias están exceptuadas.$pea0$, null::int, null),
  ('c026a0c0-1e32-45b1-8efe-c47571da6f6d'::uuid, $pea0$Que se las pueden dar como regulares y después rinde el final.$pea0$, false, 2, $pea0$Nunca se otorga la condición de regular por equivalencia.$pea0$, null::int, null),
  ('1f6b0e2c-a305-44ba-8594-e268704fc01d'::uuid, $pea0$Que no: Práctica Profesional, Práctica Solidaria y Seminario Final se aprueban siempre en Siglo 21.$pea0$, true, 3, $pea0$Son materias exceptuadas del reconocimiento externo.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'af2f9107-574e-4419-811c-91a2a94f4b51'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '0f8f45fd-48a2-4352-8e1d-01fd5e89c37d'::uuid, 'opcion_multiple', $pea0$Marina va a cursar en ED y aprobó "Seminario de Práctica" en otra institución, con contenidos casi idénticos. Pregunta si se lo reconocen. ¿Qué le respondés?$pea0$, $pea0$En modalidad distancia, el Seminario de Práctica (o de Planificación y Control de Gestión) no se reconoce por equivalencia externa, porque su aprobación está atada al EFIP I.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0e0f7567-7780-4bb1-8f96-8da38a4030a0'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '0e0f7567-7780-4bb1-8f96-8da38a4030a0'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '0f8f45fd-48a2-4352-8e1d-01fd5e89c37d'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '0f8f45fd-48a2-4352-8e1d-01fd5e89c37d'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('b9c35e67-8f74-40b4-85b5-40168e71db31'::uuid, $pea0$Que sí, porque los contenidos coinciden.$pea0$, false, 1, $pea0$En distancia esa materia está exceptuada, aunque los contenidos coincidan.$pea0$, null::int, null),
  ('b7f0decf-c601-4849-85d4-c87f046e2021'::uuid, $pea0$Que no: en distancia el Seminario de Práctica no se da por equivalencia externa, porque se aprueba con el EFIP I.$pea0$, true, 2, $pea0$Es la excepción expresa del reglamento para modalidad distancia.$pea0$, null::int, null),
  ('4eea4a8a-b29c-410e-8744-6bb7730f5cb1'::uuid, $pea0$Que sí, pero solo como reconocimiento parcial.$pea0$, false, 3, $pea0$No existe el reconocimiento parcial.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '0f8f45fd-48a2-4352-8e1d-01fd5e89c37d'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '232916ee-2681-425b-8bd6-aefc592c4556'::uuid, 'opcion_multiple', $pea0$Esteban trae DNI, analítico legalizado, plan legalizado y el comprobante de la tasa, pero no los programas. Su carrera de origen tiene un pre-dictamen aprobado para Siglo 21. ¿Qué le decís?$pea0$, $pea0$Si hay un pre-dictamen aprobado por resolución rectoral, no se exigen los programas; el resto de la documentación y la tasa sí.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0e0f7567-7780-4bb1-8f96-8da38a4030a0'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '0e0f7567-7780-4bb1-8f96-8da38a4030a0'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '232916ee-2681-425b-8bd6-aefc592c4556'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '232916ee-2681-425b-8bd6-aefc592c4556'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('4990f6b3-9f39-4816-806f-b832175d1ea0'::uuid, $pea0$Que sin programas no puede iniciar el trámite.$pea0$, false, 1, $pea0$Con pre-dictamen aprobado, los programas no se exigen.$pea0$, null::int, null),
  ('9a5ce3e0-e3f1-4c67-8cc9-f3862e7386b0'::uuid, $pea0$Que puede avanzar: con pre-dictamen aprobado no se piden los programas.$pea0$, true, 2, $pea0$El pre-dictamen ya fija las equivalencias para esa institución, carrera y plan.$pea0$, null::int, null),
  ('7b0d60a3-f527-46d8-811c-ca4a73dcb728'::uuid, $pea0$Que no necesita pagar la tasa porque hay pre-dictamen.$pea0$, false, 3, $pea0$La tasa administrativa se exige para iniciar cualquier trámite de equivalencias.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '232916ee-2681-425b-8bd6-aefc592c4556'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'e2088b9a-c2dc-4c4f-8417-e514aa081194'::uuid, '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid, 7, $pea0$Solicitud de baja$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Gonzalo","canal":"whatsapp","consulta":"Hola, quiero darme de baja de la carrera. Tengo una cuota atrasada. ¿Me devuelven lo que pagué del semestre?"},{"tipo":"preguntar","opciones":[{"texto":"¿Tiene deuda de aranceles?","clave":true,"porque":"Sin regularizar la deuda no se otorga la baja."},{"texto":"¿Debe libros de la biblioteca?","clave":true,"porque":"Es otro requisito para la baja."},{"texto":"¿Tiene una baja administrativa o una inhabilitación académica?","clave":true,"porque":"También impiden otorgar la baja."},{"texto":"¿Por qué motivo quiere dejar?","clave":false,"porque":"No cambia los requisitos ni habilita un reintegro."}]},{"tipo":"idea","titulo":"Dónde se pide y qué se necesita","texto":"Se pide en la Mesa de Atención de Alumnos o por autogestión en el portal. Para otorgarla, no tiene que deber libros en la biblioteca ni tener deuda, baja administrativa o inhabilitación académica.","clave":"En la Mesa o por el portal; sin deuda ni libros pendientes.","ejemplo":"Gonzalo primero tiene que regularizar la cuota atrasada."},{"tipo":"probalo","n":1},{"tipo":"probalo","n":3},{"tipo":"idea","titulo":"No hay reintegro","texto":"La baja no devuelve dinero ni cancela la deuda de aranceles del semestre. La única excepción son razones institucionales justificadas y aprobadas por el Vicerrectorado.","clave":"La baja no devuelve lo pagado ni cancela la deuda."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Darse de baja de la carrera no es la única opción: también puede renunciar a la regularidad de una materia, aunque siga vigente."},{"tipo":"cierre","resolucion":"A Gonzalo le explicás que puede pedir la baja en la Mesa de Atención de Alumnos o desde el portal, pero primero tiene que regularizar la cuota atrasada. Y que la baja no le devuelve lo que pagó ni cancela la deuda del semestre.","recordar":"Primero sin deuda; la baja no tiene reintegro."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-5-solicitud-de-baja$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'e2088b9a-c2dc-4c4f-8417-e514aa081194'::uuid and id not in ('8458be8d-9545-4c2d-8ab1-f08268066010'::uuid, 'acb95661-26bd-4d82-84da-22743d0cf1dc'::uuid, 'fe0a8d75-83a4-4806-85a3-1c9c8898299d'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '8458be8d-9545-4c2d-8ab1-f08268066010'::uuid, 'opcion_multiple', $pea0$Micaela cursa EDH, está al día con las cuotas y pide la baja. En el sistema figura que tiene un libro de la biblioteca sin devolver. ¿Qué le decís?$pea0$, $pea0$Para otorgar la baja no tiene que adeudar libros ni registrar deuda, baja administrativa o inhabilitación académica.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'e2088b9a-c2dc-4c4f-8417-e514aa081194'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'e2088b9a-c2dc-4c4f-8417-e514aa081194'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '8458be8d-9545-4c2d-8ab1-f08268066010'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '8458be8d-9545-4c2d-8ab1-f08268066010'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('b70f6832-cd45-488f-8faa-854156a977a2'::uuid, $pea0$Que le tramitás la baja igual: el libro no tiene nada que ver.$pea0$, false, 1, $pea0$No adeudar libros es requisito para otorgar la baja.$pea0$, null::int, null),
  ('1ac17b47-4f7f-46ce-846f-f2778b27107f'::uuid, $pea0$Que primero tiene que devolver el libro; después puede pedir la baja.$pea0$, true, 2, $pea0$Es uno de los requisitos expresos.$pea0$, null::int, null),
  ('b33ccd23-ffe1-434f-83c1-4de98a700699'::uuid, $pea0$Que no puede darse de baja porque tiene materias regulares.$pea0$, false, 3, $pea0$Tener materias regulares no impide la baja.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '8458be8d-9545-4c2d-8ab1-f08268066010'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'acb95661-26bd-4d82-84da-22743d0cf1dc'::uuid, 'opcion_multiple', $pea0$Joaquín pagó el semestre completo, cursó tres semanas y pide la baja con reintegro por motivos personales. ¿Qué le respondés?$pea0$, $pea0$La baja no devuelve dinero ni cancela deuda de aranceles semestrales, salvo razones institucionales justificadas y aprobadas.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'e2088b9a-c2dc-4c4f-8417-e514aa081194'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'e2088b9a-c2dc-4c4f-8417-e514aa081194'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'acb95661-26bd-4d82-84da-22743d0cf1dc'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'acb95661-26bd-4d82-84da-22743d0cf1dc'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('f7c063d9-0b06-4833-8b8f-f5d48aff3d9c'::uuid, $pea0$Que le devuelven la parte proporcional del semestre que no cursó.$pea0$, false, 1, $pea0$La baja no implica reintegro de dinero.$pea0$, null::int, null),
  ('4c16ffd7-a29f-4a67-8465-a24e90dfb14a'::uuid, $pea0$Que el reintegro corresponde si la baja se pide antes de la mitad del subperíodo.$pea0$, false, 2, $pea0$Esa regla no existe en el reglamento.$pea0$, null::int, null),
  ('c3dbc5de-0d4b-4655-8ad1-9e94300c6c12'::uuid, $pea0$Que la baja no implica reintegro ni cancela la deuda de aranceles, salvo razones institucionales aprobadas por el Vicerrectorado de Gestión Institucional.$pea0$, true, 3, $pea0$Es la regla, con su única excepción.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'acb95661-26bd-4d82-84da-22743d0cf1dc'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'fe0a8d75-83a4-4806-85a3-1c9c8898299d'::uuid, 'verdadero_falso', $pea0$Para pedir la baja, el alumno tiene que ir sí o sí a la Mesa de Atención de Alumnos.$pea0$, $pea0$También la puede pedir desde las herramientas de autogestión del portal de estudiantes.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'e2088b9a-c2dc-4c4f-8417-e514aa081194'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'e2088b9a-c2dc-4c4f-8417-e514aa081194'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'fe0a8d75-83a4-4806-85a3-1c9c8898299d'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'fe0a8d75-83a4-4806-85a3-1c9c8898299d'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('5d881354-3d22-450a-8280-f3d93ac3a070'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('13fa6718-7896-45c4-8e98-0a259bebece1'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'fe0a8d75-83a4-4806-85a3-1c9c8898299d'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '0f80ea74-e6e6-4df4-89fc-6772efbf2e38'::uuid, '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid, 8, $pea0$Título$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Camila","canal":"whatsapp","consulta":"Hola! Ya rendí la última materia. ¿Cuándo me dan el título? ¿Tiene costo?"},{"tipo":"preguntar","opciones":[{"texto":"¿Su legajo ya figura como Egresado?","clave":true,"porque":"El plazo para el diploma corre desde ahí."},{"texto":"¿Tiene completa la documentación obligatoria?","clave":true,"porque":"Sin la documentación completa, el plazo no empieza."},{"texto":"¿Egresó por articulación o doble titulación?","clave":true,"porque":"En ese caso, el trámite empieza al terminar el reconocimiento de estudios."},{"texto":"¿Qué nota sacó en la última materia?","clave":false,"porque":"No influye en el trámite del título."}]},{"tipo":"idea","titulo":"Cuándo empieza y cuánto tarda","texto":"La titulación empieza cuando cumplió todos los requisitos de la Universidad y de la normativa. El diploma se emite en hasta 120 días corridos desde que el legajo queda como Egresado, con toda la documentación obligatoria completa. Se abona una tasa por el trámite del título.","clave":"Hasta 120 días desde Egresado, con la documentación completa; tiene tasa.","ejemplo":"Si a Camila le falta documentación, el plazo todavía no corre."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"El título intermedio","texto":"En las carreras que lo prevén, se puede pedir el título intermedio. Lo inicia el estudiante, siempre que cumpla lo exigido por la carrera para esa titulación.","clave":"El título intermedio lo pide el estudiante, si cumple lo exigido."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Si egresó por articulación o doble titulación, el trámite del título empieza al terminar el reconocimiento de estudios, no antes."},{"tipo":"cierre","resolucion":"A Camila le explicás que el diploma se emite en hasta 120 días corridos desde que su legajo queda como Egresado, siempre que tenga toda la documentación obligatoria completa, y que el trámite tiene una tasa.","recordar":"Egresado y documentación completa: hasta 120 días, con tasa."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-12-5-proceso-de-titulacion$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '0f80ea74-e6e6-4df4-89fc-6772efbf2e38'::uuid and id not in ('01b1b453-33e8-4c3d-848b-f372f2a9a339'::uuid, 'e0dab6bb-f345-44a0-8f90-fc5b7adf3b78'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '01b1b453-33e8-4c3d-848b-f372f2a9a339'::uuid, 'opcion_multiple', $pea0$Rocío ya figura como Egresada en una carrera de grado, pero le falta presentar documentación obligatoria del legajo. Pregunta cuándo va a tener el diploma. ¿Qué le respondés?$pea0$, $pea0$El diploma se emite en hasta 120 días corridos desde que el legajo es Egresado, siempre que la documentación obligatoria esté completa.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0f80ea74-e6e6-4df4-89fc-6772efbf2e38'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '0f80ea74-e6e6-4df4-89fc-6772efbf2e38'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '01b1b453-33e8-4c3d-848b-f372f2a9a339'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '01b1b453-33e8-4c3d-848b-f372f2a9a339'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('3bf8cd1d-a565-469b-8d77-4036908057cb'::uuid, $pea0$Que en 120 días desde que aprobó la última materia, tenga o no la documentación.$pea0$, false, 1, $pea0$El plazo corre con la documentación obligatoria completa y desde la condición de Egresado.$pea0$, null::int, null),
  ('21f6f92b-2fc5-49a1-8764-fa9e29215b61'::uuid, $pea0$Que el plazo de hasta 120 días corridos exige la documentación obligatoria completa: tiene que presentarla.$pea0$, true, 2, $pea0$Sin legajo completo, el plazo no se cumple.$pea0$, null::int, null),
  ('89b48209-7470-46d1-81e8-3e4834c9ba70'::uuid, $pea0$Que lo recibe en la colación.$pea0$, false, 3, $pea0$En la colación se entrega un diploma simbólico, no el título.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '01b1b453-33e8-4c3d-848b-f372f2a9a339'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'e0dab6bb-f345-44a0-8f90-fc5b7adf3b78'::uuid, 'opcion_multiple', $pea0$Lautaro cursa una carrera que prevé título intermedio y ya cumplió lo exigido para esa titulación. Pregunta cómo lo obtiene. ¿Qué le decís?$pea0$, $pea0$El título intermedio se pide a requerimiento del estudiante, cuando cumplió lo exigido por la carrera, y lleva la tasa del trámite.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0f80ea74-e6e6-4df4-89fc-6772efbf2e38'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '0f80ea74-e6e6-4df4-89fc-6772efbf2e38'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'e0dab6bb-f345-44a0-8f90-fc5b7adf3b78'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'e0dab6bb-f345-44a0-8f90-fc5b7adf3b78'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('c32ff703-2208-428b-8e7e-6283179e0712'::uuid, $pea0$Que se emite automáticamente cuando cumple los requisitos.$pea0$, false, 1, $pea0$El título intermedio se inicia a pedido del estudiante.$pea0$, null::int, null),
  ('844af01d-6743-405f-889c-0043002b3eea'::uuid, $pea0$Que no se puede pedir hasta terminar la carrera completa.$pea0$, false, 2, $pea0$Se puede pedir apenas cumple lo exigido para la titulación intermedia.$pea0$, null::int, null),
  ('d6043a67-38cd-42e1-82a8-722de74510d2'::uuid, $pea0$Que lo tiene que solicitar él y abonar la tasa del trámite.$pea0$, true, 3, $pea0$El trámite se inicia a requerimiento del estudiante y paga tasa como cualquier título.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'e0dab6bb-f345-44a0-8f90-fc5b7adf3b78'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'a129de96-9b9a-43fb-8ba8-f02c2eb96b2b'::uuid, '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid, 9, $pea0$Colación$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Ignacio","canal":"mostrador","consulta":"Hola, terminé la carrera en octubre. ¿Entro en la colación de este año? ¿Ahí me dan el título?"},{"tipo":"preguntar","opciones":[{"texto":"¿Cuándo egresó?","clave":true,"porque":"Entra quien egresó entre el 1 de septiembre del año anterior y el 31 de agosto del año en curso."},{"texto":"¿Tiene completa la documentación para el título?","clave":true,"porque":"Si adeuda documentación, no participa."},{"texto":"¿Es grado o pregrado, y de qué CAU?","clave":true,"porque":"En pregrado, el acto alcanza a egresados de CAU Córdoba y Río IV."},{"texto":"¿Qué promedio tiene?","clave":false,"porque":"No influye en la colación."}]},{"tipo":"idea","titulo":"Quién entra en cada colación","texto":"La colación es el acto de reconocimiento a quienes terminaron su plan con todos los requisitos cumplidos. Cada una incluye a quienes egresaron entre el 1 de septiembre del año anterior y el 31 de agosto del año en curso. Si adeuda documentación para el título, no participa.","clave":"Egresados del 1/9 al 31/8, sin documentación pendiente.","ejemplo":"Ignacio terminó en octubre: pasa a la colación siguiente."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Un diploma simbólico","texto":"En la ceremonia se entrega un diploma simbólico, no el título oficial: el título sigue su propio trámite.","clave":"En la colación, diploma simbólico; el título va por su trámite."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"En pregrado, por la distancia, el acto alcanza a egresados de CAU Córdoba y Río IV, salvo que la Universidad lo amplíe.\nNo incluye títulos intermedios ni dobles titulaciones, salvo que haya gestionado equivalencias."},{"tipo":"probalo","n":2},{"tipo":"cierre","resolucion":"A Ignacio le explicás que, como egresó en octubre, entra en la colación siguiente, la de quienes egresan hasta el 31 de agosto del año que viene. Y que en el acto se entrega un diploma simbólico: el título oficial sigue su propio trámite.","recordar":"Del 1/9 al 31/8; en la colación, diploma simbólico."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-12-6-colacion$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'a129de96-9b9a-43fb-8ba8-f02c2eb96b2b'::uuid and id not in ('4060d6ec-397c-4022-8cd5-a85fd26dcc57'::uuid, '9a595659-5526-4023-8cbc-2ec96e582059'::uuid, '42befa12-758c-4a5d-87d2-aa5085579bc9'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '4060d6ec-397c-4022-8cd5-a85fd26dcc57'::uuid, 'opcion_multiple', $pea0$Camila egresó de una carrera de grado el 15 de septiembre y pregunta si entra en la colación de este año. ¿Qué le respondés?$pea0$, $pea0$Cada colación incluye a quienes egresaron entre el 1 de septiembre del año anterior y el 31 de agosto del año en curso.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a129de96-9b9a-43fb-8ba8-f02c2eb96b2b'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'a129de96-9b9a-43fb-8ba8-f02c2eb96b2b'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '4060d6ec-397c-4022-8cd5-a85fd26dcc57'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '4060d6ec-397c-4022-8cd5-a85fd26dcc57'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('c764f4ef-22e0-44e6-8ea9-a5d3c3b0fdfc'::uuid, $pea0$Que sí, porque egresó en este año calendario.$pea0$, false, 1, $pea0$El corte no es el año calendario sino el 31 de agosto.$pea0$, null::int, null),
  ('163fdfc5-d6f5-434f-8bb5-7880e8e79bd0'::uuid, $pea0$Que pasa a la colación del año siguiente, que incluye a quienes egresan entre el 1 de septiembre y el 31 de agosto.$pea0$, true, 2, $pea0$Septiembre ya entra en el período de la próxima colación.$pea0$, null::int, null),
  ('4eb6cdaf-84c7-4d56-866f-660add1bca37'::uuid, $pea0$Que puede elegir en cuál participar.$pea0$, false, 3, $pea0$El período de cada colación es fijo.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '4060d6ec-397c-4022-8cd5-a85fd26dcc57'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '9a595659-5526-4023-8cbc-2ec96e582059'::uuid, 'opcion_multiple', $pea0$Facundo egresó de una carrera de pregrado en un CAU de otra provincia (no es Córdoba ni Río IV) y quiere anotarse en la colación. ¿Qué le decís?$pea0$, $pea0$La colación de pregrado alcanza a egresados de CAU Córdoba y Río IV, salvo que la Universidad amplíe el alcance.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a129de96-9b9a-43fb-8ba8-f02c2eb96b2b'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'a129de96-9b9a-43fb-8ba8-f02c2eb96b2b'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '9a595659-5526-4023-8cbc-2ec96e582059'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '9a595659-5526-4023-8cbc-2ec96e582059'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('98e6c552-f3a4-478b-8554-d42a7738a7c2'::uuid, $pea0$Que sí, como cualquier egresado.$pea0$, false, 1, $pea0$En pregrado el acto tiene un alcance limitado por la distancia.$pea0$, null::int, null),
  ('59a14257-7e38-4953-86fa-16aefc059306'::uuid, $pea0$Que, en principio, la colación de pregrado alcanza solo a egresados de CAU Córdoba y Río IV, salvo que la Universidad decida ampliarla.$pea0$, true, 2, $pea0$Es la regla del reglamento para pregrado.$pea0$, null::int, null),
  ('397ef43b-6e69-45e5-8472-820e44a3408c'::uuid, $pea0$Que solo puede ir si ya recibió el título oficial.$pea0$, false, 3, $pea0$Recibir el título no es condición para colacionar; adeudar documentación sí lo impide.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '9a595659-5526-4023-8cbc-2ec96e582059'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '42befa12-758c-4a5d-87d2-aa5085579bc9'::uuid, 'verdadero_falso', $pea0$En la colación se entrega el título oficial.$pea0$, $pea0$Se entrega un diploma simbólico; el título oficial sigue su propio trámite.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a129de96-9b9a-43fb-8ba8-f02c2eb96b2b'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'a129de96-9b9a-43fb-8ba8-f02c2eb96b2b'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '42befa12-758c-4a5d-87d2-aa5085579bc9'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c20971f-24fa-4481-895a-3d84f2bc0384'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '42befa12-758c-4a5d-87d2-aa5085579bc9'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('d36177cb-82aa-4b4a-84f7-8f324ed6f779'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('82c44611-5bac-4d1d-819e-6810c9776a28'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '42befa12-758c-4a5d-87d2-aa5085579bc9'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'b8dffd86-0f08-4e8a-80ba-47301a5100f0'::uuid, '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid, 10, $pea0$Matrícula y aranceles$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Matías","canal":"whatsapp","consulta":"Hola, no pagué la matrícula de este semestre. ¿Puedo rendir el final igual la semana que viene?"},{"tipo":"preguntar","opciones":[{"texto":"¿Tiene la matrícula del semestre paga y activa?","clave":true,"porque":"Sin eso no puede rendir parciales, finales ni la defensa del Seminario Final."},{"texto":"¿En qué modalidad cursa?","clave":true,"porque":"Cambian los períodos de matrícula y la forma de pago."},{"texto":"¿Hace cuánto que no tiene actividad académica?","clave":true,"porque":"Con más de 1 año sin actividad queda en baja administrativa."},{"texto":"¿Qué materia rinde?","clave":false,"porque":"No cambia el requisito de la matrícula."}]},{"tipo":"idea","titulo":"La matrícula, paga y activa","texto":"La matrícula es semestral y tiene que estar paga y activa para rendir parciales, finales o la defensa del Seminario Final. En distancia, la del primer semestre va del 1/1 al 31/7 y la del segundo, del 1/8 al 31/12.","clave":"Sin matrícula paga y activa, no se rinde.","ejemplo":"Matías tiene que pagar la matrícula del semestre antes de rendir."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Cómo se paga el cursado","texto":"En ED y EDH se paga por paquete: Ticket A, Ticket B o semestre completo (A+B), según materias y subperíodo; en PD, tickets de 1, 3, 4 o 6 materias. Pregrado y ciclos de complementación en distancia no tienen arancel único para el subperíodo A: pagan semestre completo.","clave":"Distancia: Ticket A, B o A+B. PD: tickets por cantidad de materias."},{"tipo":"probalo","n":3},{"tipo":"idea","titulo":"Extras y reintegros","texto":"Las materias extra en ED y EDH tienen arancel aparte (en grado, 1/6 del arancel A+B; en pregrado, 1/4) y no les aplican becas ni beneficios. Y no se reintegra dinero cuando deja de cursar por causas personales.","clave":"Extras con arancel aparte y sin beca; sin reintegro por causas personales."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Sin actividad académica por más de 1 año calendario queda en baja administrativa y debe matricularse de nuevo.\nSuspender no cambia la regularidad, pero para volver a inscribirse o rendir las regulares debe cancelar la deuda de tickets del período en que las regularizó."},{"tipo":"cierre","resolucion":"A Matías le explicás que no puede rendir: para presentarse a un final, la matrícula del semestre tiene que estar paga y activa. Que la pague antes de la fecha del examen.","recordar":"Para rendir, matrícula paga y activa."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-4-normas-arancelarias$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'b8dffd86-0f08-4e8a-80ba-47301a5100f0'::uuid and id not in ('dd5d628c-d652-4fd6-810e-3a29a6c18ee0'::uuid, '48188209-7e94-41c1-8c51-f59ffb1dd64a'::uuid, '7988da7e-8946-4368-8653-34f0c5548c2c'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'dd5d628c-d652-4fd6-810e-3a29a6c18ee0'::uuid, 'opcion_multiple', $pea0$Brenda cursa una carrera de grado en EDH. Tiene una materia regular del primer semestre, no pagó la matrícula del segundo y quiere rendir el final en septiembre. ¿Qué le decís?$pea0$, $pea0$Para rendir parciales, finales o la defensa del Seminario Final, la matrícula semestral tiene que estar paga y activa.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'b8dffd86-0f08-4e8a-80ba-47301a5100f0'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'b8dffd86-0f08-4e8a-80ba-47301a5100f0'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'dd5d628c-d652-4fd6-810e-3a29a6c18ee0'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'dd5d628c-d652-4fd6-810e-3a29a6c18ee0'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('4d5cd777-48a9-4f14-8cb5-4d31d8f3cbe5'::uuid, $pea0$Que puede rendir, porque la materia la regularizó en el primer semestre.$pea0$, false, 1, $pea0$La regularidad no la exime: para rendir hace falta matrícula activa.$pea0$, null::int, null),
  ('6945197e-f785-411a-8125-d1a291ef9954'::uuid, $pea0$Que puede rendir, porque la matrícula solo se exige para cursar.$pea0$, false, 2, $pea0$La matrícula paga y activa se exige justamente para rendir parciales y finales.$pea0$, null::int, null),
  ('f63e66a2-768b-4660-8d72-4a5d3a80a954'::uuid, $pea0$Que primero tiene que pagar la matrícula del segundo semestre: sin matrícula paga y activa no puede rendir.$pea0$, true, 3, $pea0$En distancia, la matrícula del segundo semestre cubre del 1/8 al 31/12.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'dd5d628c-d652-4fd6-810e-3a29a6c18ee0'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '48188209-7e94-41c1-8c51-f59ffb1dd64a'::uuid, 'opcion_multiple', $pea0$Iván cursa una carrera de grado en ED, tiene una beca del 50% y se anota a una materia extra. Pregunta cuánto paga por esa extra. ¿Qué le respondés?$pea0$, $pea0$Materias extra en ED/EDH: grado 1/6 y pregrado 1/4 del arancel A+B, sin becas ni beneficios.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'b8dffd86-0f08-4e8a-80ba-47301a5100f0'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'b8dffd86-0f08-4e8a-80ba-47301a5100f0'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '48188209-7e94-41c1-8c51-f59ffb1dd64a'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '48188209-7e94-41c1-8c51-f59ffb1dd64a'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('b079315d-6b43-4405-8cdf-05ee247460f7'::uuid, $pea0$1/6 del arancel A+B, con el 50% de beca.$pea0$, false, 1, $pea0$Las becas y beneficios no se aplican a materias extra.$pea0$, null::int, null),
  ('1b0b929b-1f77-4a53-8e51-ca79a4ec08b9'::uuid, $pea0$1/6 del arancel A+B, sin beca.$pea0$, true, 2, $pea0$Es el arancel de la extra en grado, y no se aplican becas.$pea0$, null::int, null),
  ('ef22e1aa-4004-4ed5-872b-8b5bb024e253'::uuid, $pea0$Nada, porque está dentro del tope de 6 + 2.$pea0$, false, 3, $pea0$Estar dentro del tope habilita la inscripción, pero la extra se paga aparte.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '48188209-7e94-41c1-8c51-f59ffb1dd64a'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '7988da7e-8946-4368-8653-34f0c5548c2c'::uuid, 'opcion_multiple', $pea0$Paula cursa una carrera de pregrado en ED y quiere cursar una sola materia en el subperíodo A. ¿Qué tiene que pagar?$pea0$, $pea0$En distancia, pregrado y ciclos de complementación no tienen ticket único para el subperíodo A: si cursan en A, pagan el semestre completo.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'b8dffd86-0f08-4e8a-80ba-47301a5100f0'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'b8dffd86-0f08-4e8a-80ba-47301a5100f0'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '7988da7e-8946-4368-8653-34f0c5548c2c'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '7988da7e-8946-4368-8653-34f0c5548c2c'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('aef65e80-3d3e-4f70-8ffe-95642332d7a7'::uuid, $pea0$Solo el Ticket A.$pea0$, false, 1, $pea0$En pregrado no hay arancel único para el subperíodo A.$pea0$, null::int, null),
  ('93de6a79-2846-473e-887f-49d928d85eff'::uuid, $pea0$El semestre completo (Ticket A + Ticket B).$pea0$, true, 2, $pea0$Pregrado y ciclos de complementación en distancia que cursan en A pagan semestre completo.$pea0$, null::int, null),
  ('f0dc20c9-bc7d-4dd7-8118-e544ff1c5f25'::uuid, $pea0$1/4 del arancel A+B, como una materia extra.$pea0$, false, 3, $pea0$Ese es el arancel de las materias extra, no el de su paquete.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '7988da7e-8946-4368-8653-34f0c5548c2c'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '74d76fb4-4d7e-476b-88ad-3529e9fcbdfa'::uuid, '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid, 11, $pea0$Pagos y deuda$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Lorena","canal":"whatsapp","consulta":"Hola! Debo una cuota del semestre pasado. Hoy quiero pagar la matrícula de este semestre porque mañana cierra la inscripción. ¿Llego?"},{"tipo":"preguntar","opciones":[{"texto":"¿Tiene deuda de períodos anteriores?","clave":true,"porque":"Con deuda no puede pagar la matrícula ni los aranceles del período actual."},{"texto":"¿Cuándo cierra la inscripción?","clave":true,"porque":"El pago tarda unas 72 horas hábiles en acreditarse."},{"texto":"¿Cómo va a pagar?","clave":true,"porque":"Si un pago con tarjeta es rechazado, se la intima a regularizar en un plazo."},{"texto":"¿Qué carrera cursa?","clave":false,"porque":"No cambia cómo se aplican los pagos."}]},{"tipo":"idea","titulo":"Primero la deuda","texto":"Con deuda anterior no puede pagar la matrícula ni los aranceles del período actual hasta cancelarla, y tampoco las tasas de trámites. Todo pago se aplica primero a la deuda y puede tener recargo por mora.","clave":"Todo pago va primero a la deuda; con deuda, no paga lo actual.","ejemplo":"Lo que Lorena pague hoy se aplica primero a la cuota que debe."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"El pago tarda en acreditarse","texto":"Los tickets se generan en la autogestión y el pago tarda unas 72 horas hábiles en acreditarse. Es responsabilidad del estudiante pagar con anticipación y guardar el comprobante.","clave":"Unas 72 horas hábiles para acreditarse: pagar con tiempo y guardar el comprobante.","ejemplo":"Si la inscripción cierra mañana, un pago de hoy puede no llegar a acreditarse."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Si le rechazan un pago con tarjeta, la Universidad lo intima a regularizar en un plazo; si no lo hace, pasa a baja administrativa.\nY si se da de baja del servicio, no hay devolución de dinero."},{"tipo":"probalo","n":3},{"tipo":"cierre","resolucion":"A Lorena le explicás que primero tiene que cancelar la cuota que debe, porque todo pago se aplica antes a la deuda, y que el pago tarda unas 72 horas hábiles en acreditarse: pagando hoy, puede no llegar al cierre de mañana. Que pague cuanto antes y guarde el comprobante.","recordar":"Primero la deuda, y pagar con 72 horas hábiles de margen."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-4-normas-arancelarias$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '74d76fb4-4d7e-476b-88ad-3529e9fcbdfa'::uuid and id not in ('8f08fc6e-49d5-49ae-835f-005e17246cd0'::uuid, '919ae05f-fb53-4bbb-88ca-b5e5dd70828d'::uuid, '31f129b3-60cd-4c38-8c33-3c893444d16a'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '8f08fc6e-49d5-49ae-835f-005e17246cd0'::uuid, 'opcion_multiple', $pea0$Martina cursa EDH, debe una cuota del semestre anterior y quiere pagar ya la matrícula del semestre actual para inscribirse. ¿Qué le decís?$pea0$, $pea0$Con deuda anterior no se puede pagar el período actual ni tasas de trámites; cualquier pago va primero a la deuda.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '74d76fb4-4d7e-476b-88ad-3529e9fcbdfa'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '74d76fb4-4d7e-476b-88ad-3529e9fcbdfa'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '8f08fc6e-49d5-49ae-835f-005e17246cd0'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '8f08fc6e-49d5-49ae-835f-005e17246cd0'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('5319c9c7-7440-48a9-8e83-f3f40f7b1de1'::uuid, $pea0$Que pague la matrícula ahora y regularice la deuda más adelante.$pea0$, false, 1, $pea0$Con deuda de períodos anteriores no puede pagar la matrícula ni los aranceles del período actual.$pea0$, null::int, null),
  ('d2b1e178-7665-435e-8702-a03a86227e6a'::uuid, $pea0$Que primero tiene que cancelar lo adeudado: todo pago se imputa antes a la deuda y puede tener recargo por mora.$pea0$, true, 2, $pea0$Es lo que fija el reglamento para alumnos con deuda.$pea0$, null::int, null),
  ('45fa4461-b668-4e30-880e-f75955a3333c'::uuid, $pea0$Que pida un trámite de excepción y pague la tasa correspondiente.$pea0$, false, 3, $pea0$Mientras tenga deuda tampoco puede abonar tasas de trámites.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '8f08fc6e-49d5-49ae-835f-005e17246cd0'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '919ae05f-fb53-4bbb-88ca-b5e5dd70828d'::uuid, 'opcion_multiple', $pea0$Joaquín cursa ED, pagó el ticket hoy a la tarde y la inscripción a materias cierra pasado mañana. Te pregunta si llega. ¿Qué le respondés?$pea0$, $pea0$El pago tarda unas 72 horas hábiles en acreditarse; por eso se paga con anticipación y se guarda el comprobante.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '74d76fb4-4d7e-476b-88ad-3529e9fcbdfa'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '74d76fb4-4d7e-476b-88ad-3529e9fcbdfa'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '919ae05f-fb53-4bbb-88ca-b5e5dd70828d'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '919ae05f-fb53-4bbb-88ca-b5e5dd70828d'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('1ad3cfe4-26a9-4c12-8531-181385703415'::uuid, $pea0$Que sí, el pago se acredita en el día.$pea0$, false, 1, $pea0$El plazo estimado de acreditación es de 72 horas hábiles, no inmediato.$pea0$, null::int, null),
  ('3352a699-530d-4c9b-8357-b4ed5f154bc9'::uuid, $pea0$Que no se preocupe, porque para inscribirse no hace falta tener el pago acreditado.$pea0$, false, 2, $pea0$Para cursar tiene que tener los aranceles del período abonados y no tener deuda.$pea0$, null::int, null),
  ('2ab50e8a-84de-48b4-8266-c88728c25f7a'::uuid, $pea0$Que la acreditación puede tardar hasta 72 horas hábiles, así que quizás no llegue, y que guarde el comprobante de pago.$pea0$, true, 3, $pea0$Pagar con antelación y resguardar el comprobante son responsabilidades del estudiante.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '919ae05f-fb53-4bbb-88ca-b5e5dd70828d'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '31f129b3-60cd-4c38-8c33-3c893444d16a'::uuid, 'verdadero_falso', $pea0$Si un alumno deja de cursar a mitad de semestre por motivos personales, se le devuelve lo que pagó por las materias que no terminó.$pea0$, $pea0$No hay reintegro por abandono o baja por causas personales; solo se reintegra si no pudo inscribirse a ninguna materia por causas imputables a la Universidad.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '74d76fb4-4d7e-476b-88ad-3529e9fcbdfa'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '74d76fb4-4d7e-476b-88ad-3529e9fcbdfa'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '31f129b3-60cd-4c38-8c33-3c893444d16a'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '31f129b3-60cd-4c38-8c33-3c893444d16a'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('09bd0688-92cf-46ae-8369-c18a7894a026'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('e64018d3-2480-4efc-88bd-6e5622d59938'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '31f129b3-60cd-4c38-8c33-3c893444d16a'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '925fa6bc-a7b4-42cf-8605-e8f52ddbfab3'::uuid, '7dd9fd98-5e03-4d1b-8cea-6b5288e2a78b'::uuid, 12, $pea0$Becas y beneficios$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Ezequiel","canal":"mostrador","consulta":"Hola, tengo beca por rendimiento y mi hermana empieza a estudiar acá. ¿Me suman también el descuento por familiar?"},{"tipo":"preguntar","opciones":[{"texto":"¿Ya tiene una beca o un beneficio?","clave":true,"porque":"Becas y beneficios no se acumulan: se aplica el más provechoso."},{"texto":"¿Para qué semestre quiere la ayuda?","clave":true,"porque":"Cada semestre tiene su período de postulación."},{"texto":"¿Tiene alguna promoción vigente?","clave":true,"porque":"Las promociones sí pueden sumarse, según sus condiciones."},{"texto":"¿Qué carrera va a estudiar la hermana?","clave":false,"porque":"No cambia si se acumulan."}]},{"tipo":"idea","titulo":"Beca o beneficio, no los dos","texto":"Una beca se otorga por mérito (buen nivel académico y regularidad) a quien no tiene recursos suficientes; un beneficio, por una situación o cualidad del estudiante. No son acumulables entre sí: si califica para más de una, se aplica la más provechosa. Las promociones, en cambio, sí pueden sumarse según sus condiciones.","clave":"Beca y beneficio no se suman: se aplica el que más conviene.","ejemplo":"A Ezequiel se le aplica la beca o el beneficio por familiar, el que le convenga más."},{"tipo":"probalo","n":1},{"tipo":"probalo","n":3},{"tipo":"idea","titulo":"Cuándo postularse","texto":"Becas del primer semestre: postulación del 1 de octubre del año anterior al 1 de enero, con resultado hasta el 1 de febrero. Becas del segundo semestre: del 1 de abril al 1 de julio. Los beneficios tienen fechas propias por subperíodo: fijate en el calendario de trámites vigente, porque cambian cada año.","clave":"Becas: 1/10 al 1/1 y 1/4 al 1/7. Beneficios: según el calendario de trámites."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Las solicitudes incompletas o con deficiencias se rechazan: tiene que cumplir todos los requisitos de la categoría.\nY quien tiene beca debe informar cualquier cambio en su situación económica o académica."},{"tipo":"cierre","resolucion":"A Ezequiel le explicás que la beca y el beneficio por familiar no se suman: si califica para los dos, se le aplica el que más le convenga. Si tiene una promoción, esa sí puede sumarse según sus condiciones.","recordar":"Becas y beneficios no se acumulan; se aplica el más provechoso."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-3-becas-y-beneficios$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '7dd9fd98-5e03-4d1b-8cea-6b5288e2a78b'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '925fa6bc-a7b4-42cf-8605-e8f52ddbfab3'::uuid and id not in ('9bc4ddf0-d48b-411d-8d61-2bd5ad1774bd'::uuid, '7d55d7f5-76c7-4024-8ec1-cbb7984bf46e'::uuid, '67db813b-293a-4825-868e-21d4ab31fbb5'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '7dd9fd98-5e03-4d1b-8cea-6b5288e2a78b'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '9bc4ddf0-d48b-411d-8d61-2bd5ad1774bd'::uuid, 'opcion_multiple', $pea0$Sofía cursa grado en ED con beca por alto rendimiento. Su hermano empieza a cursar y ella pregunta si además le suman el beneficio por familiar directo. ¿Qué le decís?$pea0$, $pea0$Becas y beneficios no se acumulan; si califica para más de una, se aplica la más conveniente. Las promociones sí pueden sumarse.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '925fa6bc-a7b4-42cf-8605-e8f52ddbfab3'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '925fa6bc-a7b4-42cf-8605-e8f52ddbfab3'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '7dd9fd98-5e03-4d1b-8cea-6b5288e2a78b'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '9bc4ddf0-d48b-411d-8d61-2bd5ad1774bd'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '7dd9fd98-5e03-4d1b-8cea-6b5288e2a78b'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '9bc4ddf0-d48b-411d-8d61-2bd5ad1774bd'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('84dada2f-d28f-4eec-8fb5-28b459361b6b'::uuid, $pea0$Que sí, se suman los dos descuentos.$pea0$, false, 1, $pea0$Becas y beneficios no son acumulables entre sí.$pea0$, null::int, null),
  ('0be8df5b-0cd7-4761-8986-a93e589e9e7e'::uuid, $pea0$Que no se suman: se le aplica la ayuda que le resulte más provechosa.$pea0$, true, 2, $pea0$Es la regla cuando alguien califica para más de una ayuda económica.$pea0$, null::int, null),
  ('375f9ff2-d86e-499f-8e40-adb506e34a73'::uuid, $pea0$Que por pedir el beneficio pierde la beca.$pea0$, false, 3, $pea0$No pierde nada: se aplica la más provechosa.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '9bc4ddf0-d48b-411d-8d61-2bd5ad1774bd'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '7d55d7f5-76c7-4024-8ec1-cbb7984bf46e'::uuid, 'opcion_multiple', $pea0$Tomás cursa EDH y el 10 de julio llama para postularse a una beca para el segundo semestre. ¿Qué le respondés?$pea0$, $pea0$Becas: 1er semestre del 1/10 al 1/1; 2do semestre del 1/4 al 1/7. Fuera de plazo no se puede postular.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '925fa6bc-a7b4-42cf-8605-e8f52ddbfab3'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '925fa6bc-a7b4-42cf-8605-e8f52ddbfab3'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '7dd9fd98-5e03-4d1b-8cea-6b5288e2a78b'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '7d55d7f5-76c7-4024-8ec1-cbb7984bf46e'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '7dd9fd98-5e03-4d1b-8cea-6b5288e2a78b'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '7d55d7f5-76c7-4024-8ec1-cbb7984bf46e'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('a2f13588-0acf-4273-8c14-9b057915c4e2'::uuid, $pea0$Que está a tiempo hasta que empiecen las clases del segundo semestre.$pea0$, false, 1, $pea0$La postulación del segundo semestre cierra el 1 de julio.$pea0$, null::int, null),
  ('a3ec715e-618f-4bf5-8a05-21edfbb893c8'::uuid, $pea0$Que se postule igual y, si sale, se le aplica desde el inicio del semestre.$pea0$, false, 2, $pea0$Las ayudas rigen desde su otorgamiento y nunca son retroactivas.$pea0$, null::int, null),
  ('07f8c268-f676-4e86-8b6c-276f62d8a1c7'::uuid, $pea0$Que la postulación cerró el 1 de julio y que la próxima es para el primer semestre, del 1 de octubre al 1 de enero.$pea0$, true, 3, $pea0$Son los plazos fijos del reglamento para becas.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '7d55d7f5-76c7-4024-8ec1-cbb7984bf46e'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '67db813b-293a-4825-868e-21d4ab31fbb5'::uuid, 'clasificar', $pea0$Clasificá cada ayuda o mejora según su tipo.$pea0$, $pea0$Beca: mérito. Beneficio: situación o cualidad del estudiante. Promoción: mejora de pago que no es ayuda económica y puede sumarse.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '925fa6bc-a7b4-42cf-8605-e8f52ddbfab3'::uuid, $pea0${"columnas":["Beneficio","Beca","Promoción"]}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '925fa6bc-a7b4-42cf-8605-e8f52ddbfab3'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '7dd9fd98-5e03-4d1b-8cea-6b5288e2a78b'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '67db813b-293a-4825-868e-21d4ab31fbb5'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '7dd9fd98-5e03-4d1b-8cea-6b5288e2a78b'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '67db813b-293a-4825-868e-21d4ab31fbb5'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('72d7e05d-05a8-4af1-856e-4adcf558f617'::uuid, $pea0$Descuento por tener un familiar directo cursando$pea0$, false, 1, null, null::int, $pea0$Beneficio$pea0$),
  ('925fe348-d4c2-404a-8d0d-52c7fe7ae7c9'::uuid, $pea0$Apoyo por mérito académico para quien no tiene recursos suficientes$pea0$, false, 2, null, null::int, $pea0$Beca$pea0$),
  ('74565013-a668-427c-8ce9-07ff6a8affaf'::uuid, $pea0$Mejora en las condiciones de pago que ofrece la Universidad a su criterio$pea0$, false, 3, null, null::int, $pea0$Promoción$pea0$),
  ('af3b8e88-5022-4d00-8f90-90ef529fc7a0'::uuid, $pea0$Descuento por ser deportista federado$pea0$, false, 4, null, null::int, $pea0$Beneficio$pea0$),
  ('f9b70410-f85c-43e6-8774-9f38daf31cbf'::uuid, $pea0$Beca por alto rendimiento académico$pea0$, false, 5, null, null::int, $pea0$Beca$pea0$)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '67db813b-293a-4825-868e-21d4ab31fbb5'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'ea14167f-c386-4580-8436-18216b1e7f3e'::uuid, 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid, 13, $pea0$Documentación obligatoria$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Milagros","canal":"mostrador","consulta":"Hola, vengo a dejar los papeles para inscribirme. Traje el DNI en el celular y todavía no tengo el analítico del secundario. ¿Sirve?"},{"tipo":"preguntar","opciones":[{"texto":"¿Trae el DNI vigente en tarjeta?","clave":true,"porque":"Para el legajo no se acepta el DNI digital."},{"texto":"¿Tiene el analítico o una constancia de título en trámite?","clave":true,"porque":"La constancia sirve si dice que no adeuda materias."},{"texto":"¿Es una carrera de grado o de pregrado?","clave":true,"porque":"Cambia el plazo para completar el legajo."},{"texto":"¿Por qué eligió esta carrera?","clave":false,"porque":"No cambia la documentación."}]},{"tipo":"idea","titulo":"Qué tiene que presentar","texto":"El legajo completo es requisito. En grado y pregrado: solicitud de inscripción firmada, DNI vigente (no el digital; si es extranjero, pasaporte vigente), secundario completo, 2 fotos color 3x3 y ficha médica. Se presenta en la sede o CAU con original y copia, y la copia certificada se envía en formato digital.","clave":"Solicitud, DNI vigente (no digital), secundario, 2 fotos 3x3 y ficha médica.","ejemplo":"Milagros tiene que traer el DNI en tarjeta: el del celular no sirve."},{"tipo":"idea","titulo":"Sin analítico, la constancia","texto":"Si todavía no tiene el analítico, sirve una constancia de título en trámite que diga que no adeuda materias. Vale 1 año desde su emisión y se presenta una sola vez.","clave":"Constancia de título en trámite, sin materias adeudadas: vale 1 año, una vez.","ejemplo":"Milagros puede presentar la constancia del colegio mientras espera el analítico."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Plazos para completarlo","texto":"En grado hay 1 año y medio para completar el legajo; si no, no se reinscribe al 4.º período. En pregrado, 1 año; si no, no se reinscribe al 3.º.","clave":"Grado, 1 año y medio; pregrado, 1 año. Si no, no se reinscribe."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Las copias las certifica personal autorizado del CAU o la sede, un juez de paz, el registro civil o un escribano público. La secretaría del juzgado no sirve.\nMayores de 25 sin secundario completo ingresan por un trámite especial con resolución rectoral (45 días hábiles)."},{"tipo":"probalo","n":3},{"tipo":"cierre","resolucion":"A Milagros le explicás que el DNI digital no sirve para el legajo: tiene que presentar el DNI vigente. Y que, mientras espera el analítico, puede presentar una constancia de título en trámite que diga que no adeuda materias, que vale 1 año y se presenta una sola vez.","recordar":"DNI vigente (no digital) y, sin analítico, constancia de título en trámite."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-2-2-documentacion-obligatoria-y-complementaria$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'ea14167f-c386-4580-8436-18216b1e7f3e'::uuid and id not in ('d61d2310-ef5c-4ba6-8cfc-c5520d64b8c3'::uuid, '83cdc2c5-16bd-484d-8072-dddf700eccc3'::uuid, '2c22b046-aaaf-4137-855d-beb9e74eb091'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'd61d2310-ef5c-4ba6-8cfc-c5520d64b8c3'::uuid, 'opcion_multiple', $pea0$Valentina terminó el secundario en diciembre y se inscribe en una carrera de grado EDH, pero el colegio todavía no le dio el analítico. ¿Qué le indicás?$pea0$, $pea0$Sin analítico, sirve la constancia de título en trámite sin materias adeudadas; si no trae el definitivo en un año, pierde validez.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'ea14167f-c386-4580-8436-18216b1e7f3e'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'ea14167f-c386-4580-8436-18216b1e7f3e'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'd61d2310-ef5c-4ba6-8cfc-c5520d64b8c3'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'd61d2310-ef5c-4ba6-8cfc-c5520d64b8c3'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('6d0a5e91-ea90-4321-8305-436a357c2d1e'::uuid, $pea0$Que no puede inscribirse hasta tener el analítico.$pea0$, false, 1, $pea0$Existe documentación provisoria para este caso.$pea0$, null::int, null),
  ('33b41f38-b71b-4041-8230-cdd7938e1b46'::uuid, $pea0$Que presente una constancia de alumna regular del colegio.$pea0$, false, 2, $pea0$La constancia tiene que decir que terminó y no adeuda materias.$pea0$, null::int, null),
  ('57dc2498-2178-49a0-844d-7781412d42a4'::uuid, $pea0$Que presente una constancia de título en trámite donde conste que no adeuda materias: vale 1 año y se presenta una sola vez.$pea0$, true, 3, $pea0$Es la documentación provisoria que admite el reglamento.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'd61d2310-ef5c-4ba6-8cfc-c5520d64b8c3'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '83cdc2c5-16bd-484d-8072-dddf700eccc3'::uuid, 'opcion_multiple', $pea0$Lucas cursa una carrera de pregrado en ED, está por reinscribirse a su tercer período y todavía no completó el legajo. ¿Qué le explicás?$pea0$, $pea0$Grado: 1 año y medio (bloquea el 4.º período). Pregrado: 1 año (bloquea el 3.º).$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'ea14167f-c386-4580-8436-18216b1e7f3e'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'ea14167f-c386-4580-8436-18216b1e7f3e'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '83cdc2c5-16bd-484d-8072-dddf700eccc3'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '83cdc2c5-16bd-484d-8072-dddf700eccc3'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('bd3d4141-1316-423b-8e6c-af949b4b7d91'::uuid, $pea0$Que no hay problema: tiene un año y medio para completarlo.$pea0$, false, 1, $pea0$Ese plazo es para grado; en pregrado es el primer año.$pea0$, null::int, null),
  ('073358c6-e3ae-46c1-83e8-93bf3118e30c'::uuid, $pea0$Que sin el legajo completo no puede reinscribirse al tercer período: en pregrado vence en el primer año.$pea0$, true, 2, $pea0$Es la consecuencia que fija el reglamento para pregrado.$pea0$, null::int, null),
  ('2a74ec0b-da35-496d-80fc-23328e59a36a'::uuid, $pea0$Que puede reinscribirse, pero pierde las materias que aprobó.$pea0$, false, 3, $pea0$El reglamento no prevé esa consecuencia: lo que bloquea es la reinscripción.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '83cdc2c5-16bd-484d-8072-dddf700eccc3'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '2c22b046-aaaf-4137-855d-beb9e74eb091'::uuid, 'clasificar', $pea0$Una alumna pregunta dónde certificar la copia de su documentación. Clasificá cada opción.$pea0$, $pea0$Certifican el CAU o la sede, juez de paz, registro civil o escribano; la secretaría del juzgado no. Después se envía en formato digital.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'ea14167f-c386-4580-8436-18216b1e7f3e'::uuid, $pea0${"columnas":["Sirve","No sirve"]}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'ea14167f-c386-4580-8436-18216b1e7f3e'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '2c22b046-aaaf-4137-855d-beb9e74eb091'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '2c22b046-aaaf-4137-855d-beb9e74eb091'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('edc04627-6209-4208-8771-f411b2510ac9'::uuid, $pea0$Personal autorizado del CAU$pea0$, false, 1, null, null::int, $pea0$Sirve$pea0$),
  ('fc727af5-374a-465f-8033-5335140c7c37'::uuid, $pea0$Secretaría del juzgado$pea0$, false, 2, null, null::int, $pea0$No sirve$pea0$),
  ('b76d1fc6-9ad5-4b99-84f9-e08629c00af3'::uuid, $pea0$Juez de paz$pea0$, false, 3, null, null::int, $pea0$Sirve$pea0$),
  ('a0ecbb9f-10ba-4be5-82c3-965b720ffb38'::uuid, $pea0$Escribano público$pea0$, false, 4, null, null::int, $pea0$Sirve$pea0$),
  ('d3803759-bb9c-44aa-86fe-de64dfd9755f'::uuid, $pea0$Registro civil$pea0$, false, 5, null, null::int, $pea0$Sirve$pea0$)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '2c22b046-aaaf-4137-855d-beb9e74eb091'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'c4622600-4c5e-4aca-80d3-9513920094b9'::uuid, 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid, 14, $pea0$Estudiantes extranjeros$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Mateo","canal":"whatsapp","consulta":"Hola! Terminé el secundario en Paraguay y me quiero inscribir a una carrera a distancia. ¿Qué necesito?"},{"tipo":"preguntar","opciones":[{"texto":"¿Ya convalidó el título secundario?","clave":true,"porque":"Es obligatorio, ante las autoridades educativas nacionales."},{"texto":"¿Tiene la residencia de Migraciones?","clave":true,"porque":"La necesita para estudiar en el país."},{"texto":"¿Quiere pedir equivalencias de estudios en el exterior?","clave":true,"porque":"La documentación va legalizada y, si no está en español, traducida."},{"texto":"¿Hace cuánto vive en Argentina?","clave":false,"porque":"No es un requisito."}]},{"tipo":"idea","titulo":"Convalidar el título","texto":"Quien terminó el secundario en el exterior tiene que convalidar el título ante las autoridades educativas nacionales: es obligatorio. En las carreras que piden título de grado previo, tampoco puede empezar sin la convalidación o reválida de ese título.","clave":"Secundario del exterior: convalidación obligatoria.","ejemplo":"Mateo puede inscribirse, pero tiene que convalidar su título paraguayo."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Documentación del exterior","texto":"Para equivalencias de estudios en el exterior, la documentación va legalizada (apostilla de La Haya o consulado) y, si no está en español, traducida por Traductor Público Nacional. Para Brasil no hace falta que el traductor esté inscripto en el Registro.","clave":"Legalizada (apostilla o consulado) y con traducción pública si no está en español."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Residencia y DNI","texto":"Para estudiar en el país necesita la residencia de la Dirección Nacional de Migraciones, que se tramita allá; el Centro de Internacionalización le da la constancia de inscripción para el trámite. En grado y pregrado debe presentar el DNI argentino durante el primer año.","clave":"Residencia en Migraciones y DNI argentino durante el primer año."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Migraciones pide acreditar avance académico a los 6 o 12 meses."},{"tipo":"cierre","resolucion":"A Mateo le explicás que puede inscribirse, pero tiene que convalidar su título secundario ante las autoridades educativas nacionales, tramitar la residencia en Migraciones (con la constancia que le da el Centro de Internacionalización) y presentar el DNI argentino durante el primer año.","recordar":"Convalidación, residencia y DNI argentino en el primer año."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-2-4-documentacion-obligatoria-y-complementaria-extranjeros$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'c4622600-4c5e-4aca-80d3-9513920094b9'::uuid and id not in ('7afd21f6-c3ea-45d8-8064-b4825dc08535'::uuid, 'd150b1aa-7e36-4192-89c8-0df5192a6e9f'::uuid, '5c9e43cf-dc17-4062-8593-d733e5a1bff8'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '7afd21f6-c3ea-45d8-8064-b4825dc08535'::uuid, 'opcion_multiple', $pea0$Camila terminó el secundario en Bolivia y quiere empezar una carrera de grado en ED. Todavía no tramitó la convalidación. ¿Qué le decís?$pea0$, $pea0$El secundario extranjero se convalida sí o sí: es requisito para la admisión definitiva y excluyente para el título.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c4622600-4c5e-4aca-80d3-9513920094b9'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'c4622600-4c5e-4aca-80d3-9513920094b9'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '7afd21f6-c3ea-45d8-8064-b4825dc08535'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '7afd21f6-c3ea-45d8-8064-b4825dc08535'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('a23a48f5-1f6f-4eca-881c-9b3131b7cb88'::uuid, $pea0$Que no puede empezar a cursar hasta tener la convalidación.$pea0$, false, 1, $pea0$Eso aplica al título de grado previo, no al secundario.$pea0$, null::int, null),
  ('ec6b8df1-e423-48b7-8927-0e65ad028e29'::uuid, $pea0$Que puede empezar, pero la convalidación es obligatoria: la necesita para la admisión definitiva y para que le emitan el título.$pea0$, true, 2, $pea0$Es lo que dice el reglamento sobre el secundario extranjero.$pea0$, null::int, null),
  ('64fe1b0a-8603-49a2-87e6-5a4395939253'::uuid, $pea0$Que la convalidación no hace falta si después presenta el DNI argentino.$pea0$, false, 3, $pea0$El DNI acredita identidad; no reemplaza la convalidación del título.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '7afd21f6-c3ea-45d8-8064-b4825dc08535'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'd150b1aa-7e36-4192-89c8-0df5192a6e9f'::uuid, 'opcion_multiple', $pea0$Rafael quiere pedir equivalencias de una universidad de Brasil y sus certificados están en portugués. ¿Qué le pedís?$pea0$, $pea0$Estudios del exterior: legalización (apostilla o consulado) y traducción pública si no están en español.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c4622600-4c5e-4aca-80d3-9513920094b9'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'c4622600-4c5e-4aca-80d3-9513920094b9'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'd150b1aa-7e36-4192-89c8-0df5192a6e9f'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'd150b1aa-7e36-4192-89c8-0df5192a6e9f'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('c65c76f3-88bf-420c-8da6-5bad3212a1c6'::uuid, $pea0$Una traducción simple al español, sin legalizar.$pea0$, false, 1, $pea0$Tiene que estar legalizada y traducida por Traductor Público Nacional.$pea0$, null::int, null),
  ('b94388ff-7206-4926-8fd9-3c86bc243742'::uuid, $pea0$Legalización y traducción de un Traductor Público inscripto en el Registro Público de Traductores, sin excepción.$pea0$, false, 2, $pea0$Para Brasil no se exige la inscripción en el Registro.$pea0$, null::int, null),
  ('f085c457-3ca3-4bc5-86a4-372b665a9c7b'::uuid, $pea0$Documentación legalizada (apostilla de La Haya o consulado) y traducida por Traductor Público Nacional; para Brasil no hace falta que esté inscripto en el Registro.$pea0$, true, 3, $pea0$Así lo fija el reglamento para estudios en el exterior.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'd150b1aa-7e36-4192-89c8-0df5192a6e9f'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '5c9e43cf-dc17-4062-8593-d733e5a1bff8'::uuid, 'opcion_multiple', $pea0$Diego es extranjero, cursa grado en EDH, se inscribió con pasaporte y está terminando su primer año. ¿Qué le recordás?$pea0$, $pea0$Extranjeros de grado y pregrado: DNI argentino obligatorio en el primer año; la residencia la tramita el estudiante en Migraciones.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c4622600-4c5e-4aca-80d3-9513920094b9'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'c4622600-4c5e-4aca-80d3-9513920094b9'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '5c9e43cf-dc17-4062-8593-d733e5a1bff8'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '5c9e43cf-dc17-4062-8593-d733e5a1bff8'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('0d59ac43-1715-4ad5-8c61-b9a4eac153a7'::uuid, $pea0$Que con el pasaporte alcanza para toda la carrera.$pea0$, false, 1, $pea0$En grado y pregrado tiene que presentar el DNI argentino durante el primer año.$pea0$, null::int, null),
  ('84c1f613-71f4-45c2-8bc7-0ae81dbfcff5'::uuid, $pea0$Que tiene que presentar el DNI argentino durante el primer año de ingreso.$pea0$, true, 2, $pea0$Es obligatorio para grado y pregrado.$pea0$, null::int, null),
  ('d854c6de-2773-4a9e-8643-a11b3be61e16'::uuid, $pea0$Que el Centro de Internacionalización le tramita la residencia y el DNI.$pea0$, false, 3, $pea0$El Centro le da la constancia de inscripción; el trámite en Migraciones lo hace él.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '5c9e43cf-dc17-4062-8593-d733e5a1bff8'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'ac8ab6d1-104c-4f63-87e3-a4a00c2cac9c'::uuid, 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid, 15, $pea0$Calendario académico$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Celeste","canal":"whatsapp","consulta":"Hola! Curso ED y el parcial me cae justo en el feriado provincial. ¿Lo cambian? ¿Dónde veo las fechas?"},{"tipo":"preguntar","opciones":[{"texto":"¿En qué modalidad cursa?","clave":true,"porque":"ED y EDH tienen un calendario y PD otro."},{"texto":"¿La materia es MIP o bimestral?","clave":true,"porque":"La MIP es cuatrimestral y tiene otras semanas de parcial y recuperatorio."},{"texto":"¿El feriado es nacional o provincial?","clave":true,"porque":"Un parcial en feriado se reprograma; en PD, solo si el feriado es nacional."},{"texto":"¿Qué nota sacó en el último TP?","clave":false,"porque":"No cambia las fechas."}]},{"tipo":"idea","titulo":"Dónde están las fechas","texto":"El calendario académico se publica cada año en el Portal de estudiante (también está en La Nube), y conocer las fechas es responsabilidad del alumno. Las fechas cambian cada año: verificá siempre el calendario vigente de su modalidad.","clave":"Calendario vigente de su modalidad, en el Portal de estudiante."},{"tipo":"idea","titulo":"Cómo se organiza Distancia","texto":"ED y EDH tienen 2 semestres con 2 subperíodos de 9 semanas. El 1.er parcial va de la semana 1 a la 4 y el 2.º, de la 5 a la 8; la semana 9 es de recuperatorios e integradores. La excepción es MIP, que es cuatrimestral: parciales en las semanas 1–8 y 10–17, y recuperatorio en la 18.","clave":"Distancia: parciales en semanas 1–4 y 5–8, recuperatorios en la 9 (MIP, otro esquema)."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"PD y los feriados","texto":"PD tiene semestres de 16 semanas: los primeros parciales, en las semanas 7 y 8, y los segundos, en la 14 y la 15. Si un parcial coincide con un feriado se reprograma; en PD, solo si es feriado nacional.","clave":"Un parcial en feriado se reprograma; en PD, solo por feriado nacional.","ejemplo":"Celeste cursa ED: su parcial se reprograma aunque el feriado sea provincial."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Las entregas de TP en Distancia también tienen semanas fijas: MEC y MAP vencen en las semanas 5 y 8; MIA, en la 4, 5, 7 y 8; MIP, en la 5, 9, 12 y 16. Las fechas exactas, en el calendario vigente."},{"tipo":"probalo","n":3},{"tipo":"cierre","resolucion":"A Celeste le explicás que, como cursa ED, el parcial que cae en un feriado se reprograma aunque el feriado sea provincial, y que las fechas las ve en el calendario académico de Distancia vigente, en el Portal de estudiante.","recordar":"Fechas en el calendario vigente; en feriado se reprograma (en PD, solo nacional)."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-1-calendario-academico$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'ac8ab6d1-104c-4f63-87e3-a4a00c2cac9c'::uuid and id not in ('d1b553a5-1e5b-4590-8c58-2a348262adf9'::uuid, 'b62ca47e-3c80-45e6-8e5a-23550d37042b'::uuid, 'c94bfaa3-5318-4e20-8bea-e316c9b4d2e1'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'd1b553a5-1e5b-4590-8c58-2a348262adf9'::uuid, 'opcion_multiple', $pea0$Agustina cursa en EDH una materia MIP (cuatrimestral) y pregunta si su 1er parcial tiene que ser sí o sí entre las semanas 1 y 4. ¿Qué le decís?$pea0$, $pea0$Antes de dar semanas, preguntá el tipo de materia: MIP en ED/EDH tiene calendario cuatrimestral.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'ac8ab6d1-104c-4f63-87e3-a4a00c2cac9c'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'ac8ab6d1-104c-4f63-87e3-a4a00c2cac9c'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'd1b553a5-1e5b-4590-8c58-2a348262adf9'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'd1b553a5-1e5b-4590-8c58-2a348262adf9'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('1b37e9c3-91ac-408e-8816-46e3fae25a1c'::uuid, $pea0$Que sí, como en todas las materias de ED y EDH.$pea0$, false, 1, $pea0$Esa ventana es para las materias bimestrales; MIP es cuatrimestral.$pea0$, null::int, null),
  ('0e24bf89-efa7-4b9d-86e8-449a395029dc'::uuid, $pea0$Que no: en MIP el 1er parcial va de la semana 1 a la 8, el 2do de la 10 a la 17 y el recuperatorio es en la 18.$pea0$, true, 2, $pea0$Es el esquema de MIP en Distancia.$pea0$, null::int, null),
  ('b8e0e9a8-33ac-4110-8418-15bfe4f4f0fc'::uuid, $pea0$Que lo rinde en la semana 9, junto con los recuperatorios.$pea0$, false, 3, $pea0$La semana 9 es de recuperatorios en las materias bimestrales.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'd1b553a5-1e5b-4590-8c58-2a348262adf9'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'b62ca47e-3c80-45e6-8e5a-23550d37042b'::uuid, 'opcion_multiple', $pea0$Nicolás cursa en ED y su parcial cae en un feriado provincial. ¿Qué le explicás?$pea0$, $pea0$En ED/EDH, un parcial en feriado nacional o provincial se reprograma; en PD, solo por feriado nacional.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'ac8ab6d1-104c-4f63-87e3-a4a00c2cac9c'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'ac8ab6d1-104c-4f63-87e3-a4a00c2cac9c'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'b62ca47e-3c80-45e6-8e5a-23550d37042b'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'b62ca47e-3c80-45e6-8e5a-23550d37042b'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('43c01310-ccb2-4141-8aff-d80d30805b0c'::uuid, $pea0$Que no se mueve, porque solo cuentan los feriados nacionales.$pea0$, false, 1, $pea0$Esa regla es la de PD; en ED y EDH cuentan nacionales y provinciales.$pea0$, null::int, null),
  ('3f5072fa-b5b5-4b6a-89ae-5c7f16852815'::uuid, $pea0$Que se reprograma al sábado siguiente o a la semana siguiente, salvo que la Secretaría disponga otra solución.$pea0$, true, 2, $pea0$Es lo que fija el reglamento para ED y EDH.$pea0$, null::int, null),
  ('ef2efd6d-e74c-4146-8e24-17088a0bfb54'::uuid, $pea0$Que pierde esa fecha y tiene que ir directo al recuperatorio.$pea0$, false, 3, $pea0$El parcial se reprograma; no pierde la instancia.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'b62ca47e-3c80-45e6-8e5a-23550d37042b'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'c94bfaa3-5318-4e20-8bea-e316c9b4d2e1'::uuid, 'clasificar', $pea0$Clasificá cada dato del calendario según la modalidad a la que corresponde.$pea0$, $pea0$ED/EDH trabaja con subperíodos de 9 semanas; PD, con semestres de 16 semanas.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'ac8ab6d1-104c-4f63-87e3-a4a00c2cac9c'::uuid, $pea0${"columnas":["ED/EDH","PD"]}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'ac8ab6d1-104c-4f63-87e3-a4a00c2cac9c'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'c94bfaa3-5318-4e20-8bea-e316c9b4d2e1'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'c94bfaa3-5318-4e20-8bea-e316c9b4d2e1'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('ea5060e3-f9c8-4c11-872d-7c9dfcf847b2'::uuid, $pea0$1er parcial entre las semanas 1 y 4 (materia bimestral)$pea0$, false, 1, null, null::int, $pea0$ED/EDH$pea0$),
  ('eb0733d6-5652-464c-8b37-735a4bf1187d'::uuid, $pea0$1er parcial en las semanas 7 y 8$pea0$, false, 2, null, null::int, $pea0$PD$pea0$),
  ('247a3bd9-92c7-4ed0-84e7-57816c76e748'::uuid, $pea0$2do parcial en las semanas 14 y 15$pea0$, false, 3, null, null::int, $pea0$PD$pea0$),
  ('63a0ab70-5d5d-42b2-8235-b338181dd024'::uuid, $pea0$Recuperatorios en la semana 9 del subperíodo$pea0$, false, 4, null, null::int, $pea0$ED/EDH$pea0$),
  ('7f271e63-6202-43c6-8e73-e8a3a3faa9f0'::uuid, $pea0$Semestre de 16 semanas$pea0$, false, 5, null, null::int, $pea0$PD$pea0$)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'c94bfaa3-5318-4e20-8bea-e316c9b4d2e1'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'd3fca8ba-6f12-4c04-89e9-36b3d9ed59b9'::uuid, 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid, 16, $pea0$Materias de verano$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Franco","canal":"whatsapp","consulta":"Hola, entré este año. ¿Puedo adelantar materias en el verano? Tengo beca, ¿me cubre?"},{"tipo":"preguntar","opciones":[{"texto":"¿Es ingresante o se reinscribe?","clave":true,"porque":"Los ingresantes no pueden cursar en verano."},{"texto":"¿Cuántas materias quiere hacer?","clave":true,"porque":"En verano se cursan hasta 4."},{"texto":"¿Tiene beca o beneficio?","clave":true,"porque":"En verano no aplican: se paga un arancel por materia."},{"texto":"¿Qué carrera cursa?","clave":false,"porque":"No cambia quién puede cursar en verano."}]},{"tipo":"idea","titulo":"Quién y cuántas","texto":"El verano es solo para quienes se reinscriben: los ingresantes no pueden cursar. Se cursan hasta 4 materias, entre febrero y marzo, y para abrir una materia hace falta un mínimo de 15 inscriptos; si no se completa, la Universidad puede no abrirla.","clave":"Solo quienes se reinscriben, hasta 4 materias y con 15 inscriptos para abrir.","ejemplo":"Franco entró este año: todavía no puede cursar en verano."},{"tipo":"probalo","n":1},{"tipo":"probalo","n":3},{"tipo":"idea","titulo":"Cuánto se paga","texto":"Se paga un arancel por cada materia antes de empezar (como máximo, hasta el fin del cursado). En verano no aplican becas ni beneficios.","clave":"Arancel por materia y sin becas ni beneficios."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Cómo se aprueba","texto":"Para quedar regular: 3 de 4 TP con 5 o más y 2 parciales con 5 o más. Para la promoción directa: 3 de 4 TP y 2 parciales con 7 o más, y las correlativas aprobadas.","clave":"Regular con 5 o más; promoción con 7 o más y correlativas aprobadas."},{"tipo":"ojo","texto":"Que una materia figure en la oferta de verano no garantiza que se abra: si no llega a 15 inscriptos, la Universidad puede no abrirla."},{"tipo":"cierre","resolucion":"A Franco le explicás que el verano es solo para quienes se reinscriben, así que este año no puede, y que cuando pueda, va a pagar un arancel por materia: la beca no aplica en verano.","recordar":"Verano: solo reinscriptos, hasta 4 materias y sin becas."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-5-3-inscripcion-a-materias-de-verano$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'd3fca8ba-6f12-4c04-89e9-36b3d9ed59b9'::uuid and id not in ('d0a2521d-72d6-4c75-8520-2bb9ba15a85a'::uuid, 'eb8c5da7-bf72-4641-8e38-7198dd822712'::uuid, '5bec1448-f272-460a-88d9-63c6af6d2b53'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'd0a2521d-72d6-4c75-8520-2bb9ba15a85a'::uuid, 'opcion_multiple', $pea0$Bruno cursa ED, se reinscribe y quiere hacer 5 materias en verano, entre ellas una MIP. ¿Qué le decís?$pea0$, $pea0$Verano: solo reinscriptos, hasta 4 materias, únicamente MEC y MIA.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd3fca8ba-6f12-4c04-89e9-36b3d9ed59b9'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'd3fca8ba-6f12-4c04-89e9-36b3d9ed59b9'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'd0a2521d-72d6-4c75-8520-2bb9ba15a85a'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'd0a2521d-72d6-4c75-8520-2bb9ba15a85a'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('fae48907-0cfb-4b19-8702-9061088288c3'::uuid, $pea0$Que puede cursar las 5 si tiene las correlativas en regla.$pea0$, false, 1, $pea0$El máximo en verano es 4 materias.$pea0$, null::int, null),
  ('78c9d279-fcbd-46f2-857c-8f7e6abdc782'::uuid, $pea0$Que puede hasta 4 y solo MEC o MIA: la MIP no se dicta en verano.$pea0$, true, 2, $pea0$En verano se excluyen MIP y las materias de proceso.$pea0$, null::int, null),
  ('49c03a8b-ba65-4e8c-884f-0070c5a3e74d'::uuid, $pea0$Que puede cursar las 5 si paga el arancel de cada una.$pea0$, false, 3, $pea0$El arancel no habilita a superar el máximo ni a cursar MIP.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'd0a2521d-72d6-4c75-8520-2bb9ba15a85a'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'eb8c5da7-bf72-4641-8e38-7198dd822712'::uuid, 'opcion_multiple', $pea0$Julieta se inscribió el mes pasado en su primera carrera, tiene beca del 50% y quiere adelantar una materia en verano. ¿Qué le respondés?$pea0$, $pea0$El verano es para reinscriptos; además, se paga arancel por materia sin becas ni beneficios.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd3fca8ba-6f12-4c04-89e9-36b3d9ed59b9'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'd3fca8ba-6f12-4c04-89e9-36b3d9ed59b9'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'eb8c5da7-bf72-4641-8e38-7198dd822712'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'eb8c5da7-bf72-4641-8e38-7198dd822712'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('a39966fa-682d-4d9c-8873-1818fb8d4d71'::uuid, $pea0$Que puede, y se le aplica la beca.$pea0$, false, 1, $pea0$Los ingresantes no cursan en verano, y en verano no aplican becas.$pea0$, null::int, null),
  ('97e478a6-e6e2-4eb6-8024-a7842c366047'::uuid, $pea0$Que puede si paga el arancel completo, sin la beca.$pea0$, false, 2, $pea0$Los ingresantes están excluidos del verano en todas las modalidades.$pea0$, null::int, null),
  ('5ce1ce02-cc9c-4c6c-81d0-49a580c87c19'::uuid, $pea0$Que no puede: el verano es solo para quienes se reinscriben.$pea0$, true, 3, $pea0$Los ingresantes quedan excluidos sin distinción de modalidad.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'eb8c5da7-bf72-4641-8e38-7198dd822712'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '5bec1448-f272-460a-88d9-63c6af6d2b53'::uuid, 'verdadero_falso', $pea0$Una materia de verano se abre siempre, aunque se inscriba una sola persona.$pea0$, $pea0$Abrir una materia de verano requiere un mínimo de 15 inscriptos; si no se completa, la Universidad puede no abrirla.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd3fca8ba-6f12-4c04-89e9-36b3d9ed59b9'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'd3fca8ba-6f12-4c04-89e9-36b3d9ed59b9'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '5bec1448-f272-460a-88d9-63c6af6d2b53'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '5bec1448-f272-460a-88d9-63c6af6d2b53'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('bdc12cd0-dd35-4686-8d36-7c61818bd157'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('16d545f8-5e13-4a2b-81ee-8c69e9ea11d9'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '5bec1448-f272-460a-88d9-63c6af6d2b53'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'b6a5cf93-414c-4287-8d12-3c8a12eeebda'::uuid, 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid, 17, $pea0$Planes de estudio$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Hernán","canal":"telefono","consulta":"Hola, dejé la carrera hace tres años y quiero volver. ¿Sigo con mi plan o tengo que empezar de nuevo?"},{"tipo":"preguntar","opciones":[{"texto":"¿Hace cuánto que no tiene actividad?","clave":true,"porque":"Inactivo más de un período y fuera de plazo, se lo migra al plan vigente."},{"texto":"¿Su plan todavía se conserva?","clave":true,"porque":"El plan anterior puede conservarse por la duración teórica de la carrera más un año."},{"texto":"¿Qué materias tiene aprobadas?","clave":true,"porque":"Las que están en los dos planes se reconocen automáticamente."},{"texto":"¿Por qué dejó la carrera?","clave":false,"porque":"No cambia qué plan le toca."}]},{"tipo":"idea","titulo":"Cuánto dura un plan viejo","texto":"Cuando entra un plan nuevo, el anterior puede conservarse por la duración teórica de la carrera más un año. Si no terminó en ese plazo, la Universidad puede pasarlo al plan nuevo. Quien estuvo inactivo más de un período y no terminó en ese plazo, al retomar es migrado al plan vigente: no puede seguir en su plan de origen.","clave":"Plan viejo: duración teórica más un año; inactivo y fuera de plazo, migra.","ejemplo":"Si el plan de Hernán ya no se conserva, al volver pasa al plan vigente."},{"tipo":"probalo","n":1},{"tipo":"probalo","n":3},{"tipo":"idea","titulo":"Qué pasa con las materias","texto":"Al migrar debe cursar todas las materias del plan nuevo, aunque no estuvieran en el original. Las que están en los dos planes se reconocen por equivalencia directa y automática, y las aprobadas del plan anterior que no están en el nuevo pueden tomarse como electivas.","clave":"Las que coinciden se reconocen solas; las que no están pueden ser electivas."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Cuando la Universidad migra alumnos de plan, arma un plan de transición con los pasos a seguir.\nY si preguntan por los créditos de una materia: equivalen a la cantidad de horas semanales que tiene."},{"tipo":"cierre","resolucion":"A Hernán le explicás que, si su plan ya no se conserva, al volver lo migran al plan vigente: las materias que coinciden se le reconocen automáticamente, las que no están en el plan nuevo pueden tomarse como electivas y va a tener que cursar las materias nuevas.","recordar":"Inactivo y fuera de plazo: plan vigente; lo que coincide se reconoce solo."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-14-1-planes-de-estudio$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'b6a5cf93-414c-4287-8d12-3c8a12eeebda'::uuid and id not in ('014755aa-174f-4775-8d35-0490286b0f3b'::uuid, 'd32ce0d1-1995-462e-8041-6bcb0d3aee45'::uuid, 'e8dad6b6-9a92-4e20-87fd-1f4de47ab79e'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '014755aa-174f-4775-8d35-0490286b0f3b'::uuid, 'opcion_multiple', $pea0$Ramiro cursaba en ED, estuvo varios períodos sin actividad y su plan ya terminó el período de conservación. Quiere volver. ¿Qué le explicás?$pea0$, $pea0$Inactivo más de un período y fuera del plazo de conservación: migración obligatoria al plan vigente.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'b6a5cf93-414c-4287-8d12-3c8a12eeebda'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'b6a5cf93-414c-4287-8d12-3c8a12eeebda'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '014755aa-174f-4775-8d35-0490286b0f3b'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '014755aa-174f-4775-8d35-0490286b0f3b'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('7ddf8b9f-1a6b-4c92-8867-46c2d9dc85ab'::uuid, $pea0$Que sigue con su plan original porque ya lo había empezado.$pea0$, false, 1, $pea0$Si retoma fuera del plazo, no puede seguir en su plan de origen.$pea0$, null::int, null),
  ('fc1967d8-bc0c-43b8-8080-25a09c086491'::uuid, $pea0$Que pasa al plan vigente: lo que coincide se reconoce automáticamente y tiene que cursar las materias nuevas del plan.$pea0$, true, 2, $pea0$Es lo que fija el reglamento para inactivos fuera del plazo.$pea0$, null::int, null),
  ('4a9bf799-a74d-47c5-88db-9c90a76a8a3f'::uuid, $pea0$Que pierde todas las materias aprobadas y empieza de cero.$pea0$, false, 3, $pea0$Las coincidentes se reconocen por equivalencia directa y las demás pueden ser electivas.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '014755aa-174f-4775-8d35-0490286b0f3b'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'd32ce0d1-1995-462e-8041-6bcb0d3aee45'::uuid, 'opcion_multiple', $pea0$A Carla la migraron al plan nuevo y tiene aprobada una materia que no existe en ese plan. ¿Qué pasa con esa materia?$pea0$, $pea0$Materia en ambos planes: equivalencia directa. Materia solo en el plan viejo: puede ir como electiva.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'b6a5cf93-414c-4287-8d12-3c8a12eeebda'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'b6a5cf93-414c-4287-8d12-3c8a12eeebda'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'd32ce0d1-1995-462e-8041-6bcb0d3aee45'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'd32ce0d1-1995-462e-8041-6bcb0d3aee45'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('c151f78f-9ad1-45a2-8113-45a2cf8ca648'::uuid, $pea0$Se pierde, porque no está en el plan nuevo.$pea0$, false, 1, $pea0$El reglamento prevé reconocerla de otro modo.$pea0$, null::int, null),
  ('3fb44398-cff0-43d3-8892-dee7423b9cb6'::uuid, $pea0$Puede considerarse como electiva en el plan nuevo.$pea0$, true, 2, $pea0$Así lo establece el reglamento para materias que no pertenecen al plan nuevo.$pea0$, null::int, null),
  ('4517de5b-784c-4753-8f3d-fa5776673a1a'::uuid, $pea0$Se reconoce automáticamente por cualquier materia obligatoria del plan nuevo.$pea0$, false, 3, $pea0$La equivalencia automática es solo para materias que están en los dos planes.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'd32ce0d1-1995-462e-8041-6bcb0d3aee45'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'e8dad6b6-9a92-4e20-87fd-1f4de47ab79e'::uuid, 'verdadero_falso', $pea0$Cuando entra un plan nuevo, la Universidad siempre espera la duración teórica de la carrera más un año antes de migrar a alguien.$pea0$, $pea0$Ese plazo es de conservación posible, no garantizado; si el cambio responde a estándares de autoevaluación, puede migrar sin esperar.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'b6a5cf93-414c-4287-8d12-3c8a12eeebda'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'b6a5cf93-414c-4287-8d12-3c8a12eeebda'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'e8dad6b6-9a92-4e20-87fd-1f4de47ab79e'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'e8dad6b6-9a92-4e20-87fd-1f4de47ab79e'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('c3d55d77-ce75-4641-88c2-4ff0efac7d28'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('4d004cf6-ee41-4c94-86dd-ecb7eed93da1'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'e8dad6b6-9a92-4e20-87fd-1f4de47ab79e'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '0c5a2f5c-1591-406a-83d5-4a8612cc7208'::uuid, 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid, 18, $pea0$Correlativas$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Daiana","canal":"whatsapp","consulta":"Hola! Promocioné una materia pero todavía no aprobé la correlativa anterior. ¿Pierdo la promoción?"},{"tipo":"preguntar","opciones":[{"texto":"¿Hace cuánto terminó la materia?","clave":true,"porque":"Tiene 60 días para aprobar la correlativa anterior."},{"texto":"¿La correlativa está regular o aprobada?","clave":true,"porque":"Regular alcanza para inscribirse; para aprobar o promocionar, tiene que estar aprobada."},{"texto":"¿Sabe dónde ver las correlativas?","clave":true,"porque":"Están en el Portal de Estudiantes, en el plan de estudio de su carrera."},{"texto":"¿Qué nota sacó en los parciales?","clave":false,"porque":"Ya cumplió la promoción: lo que falta es la correlativa."}]},{"tipo":"idea","titulo":"Regular para cursar, aprobada para aprobar","texto":"El plan de correlatividades fija el orden en que se cursan las materias. Para inscribirse a una materia, sus correlativas tienen que estar regulares; para aprobarla o promocionarla, tienen que estar aprobadas.","clave":"Inscribirse: correlativa regular. Aprobar o promocionar: correlativa aprobada."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"60 días para no perder la promoción","texto":"Si cumplió la promoción pero la correlativa anterior sigue regular, tiene 60 días desde que terminó la materia para aprobarla. Si no, la materia queda Regular y la rinde en un final.","clave":"60 días para aprobar la correlativa; si no, la materia queda Regular.","ejemplo":"Daiana todavía puede promocionar si aprueba la correlativa dentro de los 60 días."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Las correlativas no se responden de memoria: están en el Portal de Estudiantes, en su carrera, Plan de Estudio, Ver Correlativas. Ahí también está Ver Programa."},{"tipo":"probalo","n":3},{"tipo":"cierre","resolucion":"A Daiana le explicás que no pierde la promoción todavía: tiene 60 días desde que terminó la materia para aprobar la correlativa anterior. Si no la aprueba en ese plazo, la materia queda Regular y tiene que rendir el final.","recordar":"Promoción con correlativa pendiente: 60 días para aprobarla."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-correlativas$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '0c5a2f5c-1591-406a-83d5-4a8612cc7208'::uuid and id not in ('9d818327-6a0c-4fe4-87c2-7334bda05bd3'::uuid, '43271fac-477f-4c91-8d4a-02daaf47aca8'::uuid, '6c59ada9-633b-4c55-8bbc-6bfcc3c9afdf'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '9d818327-6a0c-4fe4-87c2-7334bda05bd3'::uuid, 'opcion_multiple', $pea0$Pablo cursa EDH y quiere inscribirse a una materia. Tiene la correlativa regular, pero todavía no la aprobó. ¿Qué le decís?$pea0$, $pea0$Inscribirse: correlativas regulares. Aprobar o promocionar: correlativas aprobadas.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0c5a2f5c-1591-406a-83d5-4a8612cc7208'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '0c5a2f5c-1591-406a-83d5-4a8612cc7208'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '9d818327-6a0c-4fe4-87c2-7334bda05bd3'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '9d818327-6a0c-4fe4-87c2-7334bda05bd3'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('98312826-db17-4ab6-814c-6296d0fda5da'::uuid, $pea0$Que no puede: la correlativa tiene que estar aprobada para inscribirse.$pea0$, false, 1, $pea0$Para inscribirse alcanza con que esté regular.$pea0$, null::int, null),
  ('ab4ced1f-53e8-4c25-8fdb-6b065e0556ba'::uuid, $pea0$Que puede inscribirse, pero para aprobar o promocionar la materia va a necesitar la correlativa aprobada.$pea0$, true, 2, $pea0$Regular para cursar, aprobada para aprobar.$pea0$, null::int, null),
  ('e0e23e54-8315-4e0d-8857-300d6916be9c'::uuid, $pea0$Que puede inscribirse y la correlativa ya no le afecta.$pea0$, false, 3, $pea0$Sigue siendo necesaria para aprobar o promocionar.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '9d818327-6a0c-4fe4-87c2-7334bda05bd3'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '43271fac-477f-4c91-8d4a-02daaf47aca8'::uuid, 'opcion_multiple', $pea0$Lara cumplió las condiciones de promoción de una materia que terminó hace 30 días, pero su correlativa anterior sigue regular. ¿Qué le explicás?$pea0$, $pea0$Hay 60 días desde el fin del cursado para aprobar la correlativa y conservar la promoción.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0c5a2f5c-1591-406a-83d5-4a8612cc7208'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '0c5a2f5c-1591-406a-83d5-4a8612cc7208'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '43271fac-477f-4c91-8d4a-02daaf47aca8'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '43271fac-477f-4c91-8d4a-02daaf47aca8'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('edd8b227-8397-4645-8608-5ef7ddfe8f8f'::uuid, $pea0$Que ya perdió la promoción y la materia quedó Regular.$pea0$, false, 1, $pea0$Todavía está dentro del plazo de 60 días.$pea0$, null::int, null),
  ('ef9b31df-2552-4fa6-819e-36ba3483c464'::uuid, $pea0$Que si aprueba la correlativa dentro de los 60 días desde que terminó la materia, promociona; si no, queda Regular y rinde final.$pea0$, true, 2, $pea0$Es la regla de los 60 días.$pea0$, null::int, null),
  ('c3726130-bb7f-41d4-8df1-bdad73502a63'::uuid, $pea0$Que la materia queda Libre y tiene que recursarla.$pea0$, false, 3, $pea0$Sin la correlativa aprobada, la materia queda Regular, no Libre.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '43271fac-477f-4c91-8d4a-02daaf47aca8'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '6c59ada9-633b-4c55-8bbc-6bfcc3c9afdf'::uuid, 'ordenar', $pea0$Un alumno quiere saber qué correlativas tiene una materia. Ordená los pasos que le indicás en el Portal de Estudiantes.$pea0$, $pea0$Las correlativas y el programa de cada materia están en el Plan de Estudio de la carrera, en el Portal.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0c5a2f5c-1591-406a-83d5-4a8612cc7208'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '0c5a2f5c-1591-406a-83d5-4a8612cc7208'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '6c59ada9-633b-4c55-8bbc-6bfcc3c9afdf'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'e3a09525-da75-41c0-827b-bb9e91335610'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '6c59ada9-633b-4c55-8bbc-6bfcc3c9afdf'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('9e3ebc1e-89e4-4b43-865f-705648e0c9df'::uuid, $pea0$Ingresar al Portal de Estudiantes.$pea0$, false, 1, null, 1::int, null),
  ('0dcd09dc-6465-443e-8ec0-0157f4abdaa4'::uuid, $pea0$Hacer clic en su carrera.$pea0$, false, 2, null, 2::int, null),
  ('6ebb1696-5e79-484c-843e-325f197ee2ac'::uuid, $pea0$Revisar el Plan de Estudio.$pea0$, false, 3, null, 3::int, null),
  ('9c994155-a49e-4acf-8502-939f001818f7'::uuid, $pea0$Hacer clic en Ver Correlativas de la materia.$pea0$, false, 4, null, 4::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '6c59ada9-633b-4c55-8bbc-6bfcc3c9afdf'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '1311ce80-81e8-4b51-8d5e-f04bf6c3cf98'::uuid, 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid, 19, $pea0$Universitarios 21$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Brian","canal":"whatsapp","consulta":"Hola, no me deja anotarme a una materia de cuarto cuatrimestre. ¿Qué pasa?"},{"tipo":"preguntar","opciones":[{"texto":"¿Tiene aprobadas las dos materias de Universitarios 21?","clave":true,"porque":"Hay que aprobarlas para inscribirse a materias de cuarto cuatrimestre."},{"texto":"¿Tiene 5 o más materias aprobadas en el legajo, contando equivalencias?","clave":true,"porque":"Con 5 o más queda eximido de Universitarios 21."},{"texto":"¿Tiene regulares las correlativas de esa materia?","clave":true,"porque":"Las correlativas también pueden frenar la inscripción."},{"texto":"¿En qué turno cursa?","clave":false,"porque":"No tiene que ver con Universitarios 21."}]},{"tipo":"idea","titulo":"Qué es Universitarios 21","texto":"Es el programa de ingreso de grado y pregrado: dos materias del primer semestre, Aprender en el Siglo 21 y Tecnología, Humanidades y Modelos Globales. Se cursan y evalúan con las mismas reglas que el resto de las materias de su modalidad, y hay que aprobar las dos para inscribirse a materias de cuarto cuatrimestre.","clave":"Las dos materias aprobadas, para anotarse en cuarto cuatrimestre.","ejemplo":"Si a Brian le falta aprobar una de las dos, por eso no lo deja anotarse."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"La eximición","texto":"Una equivalencia externa no reemplaza a estas materias. Pero si con equivalencias externas, solas o sumadas a materias cursadas en Siglo 21, llega a 5 o más aprobadas en su legajo, queda eximido de las dos.","clave":"Con 5 o más aprobadas en el legajo, queda eximido."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Una equivalencia externa por una de estas dos materias no sirve: lo que exime es llegar a 5 aprobadas en el legajo.\nParte de la bibliografía de Aprender en el Siglo 21 es el Reglamento Institucional."},{"tipo":"cierre","resolucion":"A Brian le explicás que, para anotarse a materias de cuarto cuatrimestre, tiene que tener aprobadas las dos materias de Universitarios 21, salvo que tenga 5 o más materias aprobadas en el legajo, que lo eximen.","recordar":"Cuarto cuatrimestre: Universitarios 21 aprobado, o 5 aprobadas en el legajo."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-universitarios21$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '1311ce80-81e8-4b51-8d5e-f04bf6c3cf98'::uuid and id not in ('233aad7a-517e-4f9b-8ab7-268f7944dc92'::uuid, '07044a1a-9876-4989-8762-16f230dc8c98'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '233aad7a-517e-4f9b-8ab7-268f7944dc92'::uuid, 'opcion_multiple', $pea0$Emilia cursa EDH y no puede inscribirse a una materia de 4.º cuatrimestre. Aprobó Aprender en el Siglo 21, pero tiene regular Tecnología, Humanidades y Modelos Globales. ¿Qué le explicás?$pea0$, $pea0$Universitarios 21 completo y aprobado es condición para inscribirse a materias de 4.º cuatrimestre.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '1311ce80-81e8-4b51-8d5e-f04bf6c3cf98'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '1311ce80-81e8-4b51-8d5e-f04bf6c3cf98'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '233aad7a-517e-4f9b-8ab7-268f7944dc92'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '233aad7a-517e-4f9b-8ab7-268f7944dc92'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('0f0518fa-444a-426f-87b7-c85d5dbfb4b9'::uuid, $pea0$Que es un error del sistema, porque con la materia regular alcanza.$pea0$, false, 1, $pea0$Regular alcanza para correlativas comunes, pero Universitarios 21 tiene que estar aprobado.$pea0$, null::int, null),
  ('ad4879aa-4505-446d-8269-fcfd4bcf4001'::uuid, $pea0$Que para anotarse a materias de 4.º cuatrimestre necesita aprobadas las dos materias de Universitarios 21.$pea0$, true, 2, $pea0$Es el requisito del programa de ingreso.$pea0$, null::int, null),
  ('a051fd7e-b416-4ce8-8d43-3f064043fea6'::uuid, $pea0$Que pida una equivalencia externa para reemplazar esa materia.$pea0$, false, 3, $pea0$El reconocimiento de materias externas no exime de Universitarios 21.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '233aad7a-517e-4f9b-8ab7-268f7944dc92'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '07044a1a-9876-4989-8762-16f230dc8c98'::uuid, 'opcion_multiple', $pea0$Gonzalo ingresa con 6 materias reconocidas por equivalencias externas y pregunta si tiene que cursar Universitarios 21. ¿Qué le respondés?$pea0$, $pea0$No hay equivalencia que reemplace a una materia de U21, pero con 5 o más aprobadas en el legajo se exime todo el programa.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '1311ce80-81e8-4b51-8d5e-f04bf6c3cf98'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '1311ce80-81e8-4b51-8d5e-f04bf6c3cf98'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '07044a1a-9876-4989-8762-16f230dc8c98'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '07044a1a-9876-4989-8762-16f230dc8c98'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('838ad7c0-d6c3-495a-8ed4-257942a2ce68'::uuid, $pea0$Que sí, porque ninguna equivalencia externa exime de Universitarios 21.$pea0$, false, 1, $pea0$Una equivalencia no reemplaza a esas materias, pero con 5 o más aprobadas en el legajo queda eximido.$pea0$, null::int, null),
  ('c6328169-20b4-48e6-810b-3732aec4e064'::uuid, $pea0$Que no: con 5 o más materias aprobadas en su legajo queda eximido de las dos materias.$pea0$, true, 2, $pea0$La eximición cuenta equivalencias externas, solas o sumadas a materias cursadas en Siglo 21.$pea0$, null::int, null),
  ('a228721c-ccf4-4b58-8745-3eab616203e2'::uuid, $pea0$Que solo tiene que cursar Aprender en el Siglo 21.$pea0$, false, 3, $pea0$La eximición abarca las dos materias del programa.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '07044a1a-9876-4989-8762-16f230dc8c98'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'c51091da-e129-4679-8501-c7e57fa62334'::uuid, '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid, 20, $pea0$Tipos de materias y trabajos prácticos$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Yamila","canal":"whatsapp","consulta":"Hola! Me saqué un 4 en el TP1. ¿Lo puedo rehacer?"},{"tipo":"preguntar","opciones":[{"texto":"¿La materia es MEC, MAP, MIA o MIP?","clave":true,"porque":"Las reglas de entrega cambian según el tipo de materia."},{"texto":"¿El cronograma del SAM sigue abierto?","clave":true,"porque":"En MEC y MAP se rehace dentro de los plazos del SAM."},{"texto":"¿Cómo le fue en los otros TP?","clave":true,"porque":"Para regularizar hay que aprobar al menos 3 de 4, con 5 o más."},{"texto":"¿Hizo las Actividades Prácticas?","clave":false,"porque":"Son opcionales: no cuentan para regularizar."}]},{"tipo":"idea","titulo":"4 TP, al menos 3 aprobados","texto":"Cada materia tiene 4 módulos y 4 TP obligatorios: para regularizar hay que aprobar al menos 3, con nota 5 o más. Las Actividades Prácticas son opcionales: sirven para autoevaluarse.","clave":"Regulariza con 3 de 4 TP aprobados con 5 o más."},{"tipo":"idea","titulo":"MEC y MAP: se puede rehacer","texto":"En MEC y MAP los TP se rehacen sin límite dentro del cronograma del SAM y vale la última nota. Entregar tarde resta 5 puntos por día de demora, pero la demora nunca lo baja de 5.","clave":"MEC y MAP: se rehace sin límite en fecha; tarde resta 5 por día, sin bajar de 5.","ejemplo":"Si la materia de Yamila es MEC, puede rehacer el TP1 mientras el SAM esté abierto."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"MIA y MIP: una sola entrega","texto":"En MIA y MIP cada TP se entrega una sola vez, en la fecha del calendario; si no lo entrega, es 0 y promedia. Además suman foros grupales obligatorios (MIA en TP2 y TP3; MIP en TP1 y TP3), aunque el TP es individual.","clave":"MIA y MIP: una sola entrega en fecha; si no entrega, 0 y promedia."},{"tipo":"probalo","n":2},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"En MIP es obligatorio aprobar el TP4 con 5 o más.\nConviene que verifique en el SAM que las notas de los TP queden registradas. La bibliografía obligatoria la consigue cada estudiante."},{"tipo":"cierre","resolucion":"A Yamila le preguntás qué tipo de materia es: si es MEC o MAP, puede rehacer el TP1 dentro del cronograma del SAM y vale la última nota; si es MIA o MIP, el TP se entrega una sola vez, así que el 4 queda y para regularizar necesita aprobar al menos 3 de los 4 TP.","recordar":"MEC y MAP se rehacen; MIA y MIP, una sola entrega."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'c51091da-e129-4679-8501-c7e57fa62334'::uuid and id not in ('1572d416-66d1-46a4-8a15-5d246854ae75'::uuid, '91178283-a39e-40c6-8716-357a81e78d99'::uuid, 'e0b61f97-d12f-4e7f-819c-07e3a8faf88d'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '1572d416-66d1-46a4-8a15-5d246854ae75'::uuid, 'opcion_multiple', $pea0$Micaela cursa en ED, sacó 4 en el TP1 de una MEC y el cronograma del SAM todavía está abierto. ¿Qué le decís?$pea0$, $pea0$MEC y MAP: TP sin límite dentro del cronograma y vale la última nota. MIA y MIP: una sola entrega.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c51091da-e129-4679-8501-c7e57fa62334'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'c51091da-e129-4679-8501-c7e57fa62334'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '1572d416-66d1-46a4-8a15-5d246854ae75'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '1572d416-66d1-46a4-8a15-5d246854ae75'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('f8c372b3-ead4-4ffb-887a-d61994b141d2'::uuid, $pea0$Que no puede rehacerlo: cada TP se entrega una sola vez.$pea0$, false, 1, $pea0$Eso es en MIA y MIP; en MEC se rehace.$pea0$, null::int, null),
  ('aae31868-ddc1-451c-8e69-746fb52a5a50'::uuid, $pea0$Que puede rehacerlo las veces que quiera dentro del cronograma del SAM, y vale la última nota.$pea0$, true, 2, $pea0$Es la regla de MEC y MAP.$pea0$, null::int, null),
  ('406239fd-d356-489b-82a4-6ddd4dc702bb'::uuid, $pea0$Que puede rehacerlo, pero se promedian todas las notas que saque.$pea0$, false, 3, $pea0$Vale la última nota, no un promedio de intentos.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '1572d416-66d1-46a4-8a15-5d246854ae75'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '91178283-a39e-40c6-8716-357a81e78d99'::uuid, 'opcion_multiple', $pea0$Facundo cursa EDH y no entregó en fecha el TP1 de una MIA. Los otros TP los tiene al día. ¿Qué le explicás?$pea0$, $pea0$En MIA y MIP el TP no entregado es 0 y promedia; la regularidad pide 3 de 4 TP con 5 o más, foros y parciales.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c51091da-e129-4679-8501-c7e57fa62334'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'c51091da-e129-4679-8501-c7e57fa62334'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '91178283-a39e-40c6-8716-357a81e78d99'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '91178283-a39e-40c6-8716-357a81e78d99'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('b3b614bc-eab9-4e48-879e-fe1b1a5f705f'::uuid, $pea0$Que puede entregarlo tarde con 5 puntos menos por día de demora.$pea0$, false, 1, $pea0$La entrega tardía con descuento es de MEC y MAP.$pea0$, null::int, null),
  ('d760f9fb-8874-4b50-8394-e88f04986644'::uuid, $pea0$Que ese TP queda con 0 y se promedia, pero puede regularizar si aprueba los otros 3 TP con 5 o más y cumple foros y parciales.$pea0$, true, 2, $pea0$En MIA el TP se entrega una sola vez; regulariza con 3 de 4 aprobados.$pea0$, null::int, null),
  ('de81bc6f-d6dc-41fa-8990-a27a2af96a22'::uuid, $pea0$Que quedó libre en la materia.$pea0$, false, 3, $pea0$Un TP sin entregar no lo deja libre; le quedan 3 para regularizar.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '91178283-a39e-40c6-8716-357a81e78d99'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'e0b61f97-d12f-4e7f-819c-07e3a8faf88d'::uuid, 'clasificar', $pea0$Clasificá cada regla de TP según el tipo de materia.$pea0$, $pea0$Antes de responder sobre un TP, preguntá el tipo de materia: las reglas de MEC/MAP y de MIA/MIP son opuestas.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c51091da-e129-4679-8501-c7e57fa62334'::uuid, $pea0${"columnas":["MEC y MAP","MIA y MIP"]}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'c51091da-e129-4679-8501-c7e57fa62334'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'e0b61f97-d12f-4e7f-819c-07e3a8faf88d'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'e0b61f97-d12f-4e7f-819c-07e3a8faf88d'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('75ec7504-3f24-4739-8a2f-f4718aa9397f'::uuid, $pea0$Se rehace sin límite y vale la última nota$pea0$, false, 1, null, null::int, $pea0$MEC y MAP$pea0$),
  ('c704c667-6eb1-4532-863a-08572aff7174'::uuid, $pea0$Se entrega una sola vez, en la fecha del calendario$pea0$, false, 2, null, null::int, $pea0$MIA y MIP$pea0$),
  ('b9e1b890-1abd-476d-8c12-9b15ae233b0d'::uuid, $pea0$Entregar tarde resta 5 puntos por día, sin bajar de 5$pea0$, false, 3, null, null::int, $pea0$MEC y MAP$pea0$),
  ('158cd65d-862f-497a-81e8-7b64948c9fc3'::uuid, $pea0$Tiene foros grupales obligatorios en algunos TP$pea0$, false, 4, null, null::int, $pea0$MIA y MIP$pea0$),
  ('5a303bd6-20e3-469c-8e4d-40e3189b94bf'::uuid, $pea0$Si no lo entrega, es 0 y promedia$pea0$, false, 5, null, null::int, $pea0$MIA y MIP$pea0$)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'e0b61f97-d12f-4e7f-819c-07e3a8faf88d'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '3bd31396-9081-42be-8037-888a17438850'::uuid, '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid, 21, $pea0$Parciales, recuperatorios e integradores$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Leandro","canal":"whatsapp","consulta":"Hola! Saqué 6 y 6 en los parciales. ¿Puedo hacer algo para promocionar?"},{"tipo":"preguntar","opciones":[{"texto":"¿Qué nota tiene en cada parcial?","clave":true,"porque":"De eso depende si recupera o rinde el integrador."},{"texto":"¿Cumple los TP y las demás condiciones de promoción?","clave":true,"porque":"Con 7 en el integrador promociona solo si cumple el resto."},{"texto":"¿Ya se inscribió a algún recuperatorio o integrador?","clave":true,"porque":"Si se inscribe y no se presenta, la nota es 0 y cuenta."},{"texto":"¿En qué horario prefiere rendir?","clave":false,"porque":"No cambia lo que puede rendir."}]},{"tipo":"idea","titulo":"Los parciales","texto":"Los parciales tienen 20 preguntas de opción múltiple y se aprueban con 5 (9 correctas): el 1.º toma los módulos 1 y 2; el 2.º, los 3 y 4. Duran 40 minutos. Un parcial con 7 o más no se recupera.","clave":"20 preguntas, aprueba con 5; un 7 o más no se recupera."},{"tipo":"idea","titulo":"El recuperatorio","texto":"Se rinde si sacó menos de 5 o faltó a un parcial, o para llevar a 7 un parcial si el otro ya es 7 o más. Dura 40 minutos y la nota nueva reemplaza a la anterior, sea mayor o menor.","clave":"Se recupera con menos de 5, ausente, o para llevar a 7 si el otro ya es 7."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"El integrador","texto":"Tiene 30 preguntas de los dos parciales y dura 60 minutos. Lo rinde quien desaprobó o faltó a ambos, o los aprobó con 5 o 6. Aprueba con 5 y promociona con 7, y su nota también reemplaza a la de los parciales, aunque sea menor.","clave":"Integrador con 5 o 6 en los dos: promociona con 7 y reemplaza aunque baje.","ejemplo":"Leandro, con 6 y 6, puede rendir el integrador para promocionar."},{"tipo":"probalo","n":2},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Si se inscribe a un recuperatorio o integrador y no se presenta, la nota es 0 y cuenta para la materia."},{"tipo":"cierre","resolucion":"A Leandro le explicás que, con 6 y 6, puede rendir el integrador: con 7 o más accede a la promoción directa si cumple los TP y las demás condiciones. Que tenga en cuenta que la nota del integrador reemplaza a la de los parciales, aunque sea menor.","recordar":"Con 5 o 6 en los dos, integrador; reemplaza la nota aunque baje."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '3bd31396-9081-42be-8037-888a17438850'::uuid and id not in ('2cb05b60-ec80-416d-82c6-8269024b0ae0'::uuid, '2082d590-1f43-4add-8bff-3b0ed1127bf9'::uuid, '9a9e7371-0d06-422d-8316-bb3ef91b1a9d'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '2cb05b60-ec80-416d-82c6-8269024b0ae0'::uuid, 'opcion_multiple', $pea0$Martina cursa EDH. Sacó 6 en el parcial 1 y 8 en el parcial 2, y quiere promocionar. ¿Qué le decís?$pea0$, $pea0$Si un parcial tiene 7 o más y el otro 5 o 6, solo se recupera el más bajo. La nota del recuperatorio reemplaza a la anterior, sea mayor o menor.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3bd31396-9081-42be-8037-888a17438850'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '3bd31396-9081-42be-8037-888a17438850'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '2cb05b60-ec80-416d-82c6-8269024b0ae0'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '2cb05b60-ec80-416d-82c6-8269024b0ae0'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('15f58964-ecf6-460f-8278-70e064cc37d4'::uuid, $pea0$Que rinda el integrador, que toma los dos parciales.$pea0$, false, 1, $pea0$El integrador es para quien desaprobó o faltó a los dos parciales, o los aprobó a ambos con 5 o 6.$pea0$, null::int, null),
  ('e3e894e4-eecd-45a5-8487-70e649d2be4c'::uuid, $pea0$Que puede rendir el recuperatorio del parcial 1 para intentar llegar a 7.$pea0$, true, 2, $pea0$Con un parcial de 7 o más y el otro con 5 o 6 corresponde recuperar el más bajo, y así puede acceder a la promoción directa.$pea0$, null::int, null),
  ('c9c665b8-2b33-40ba-87ec-cef66d8ace9a'::uuid, $pea0$Que recupere el parcial 2 para subir el promedio.$pea0$, false, 3, $pea0$Un parcial con 7 o más no se recupera.$pea0$, null::int, null),
  ('79ee031c-99f8-4a5e-8c17-f55ffccdc445'::uuid, $pea0$Que elija entre recuperatorio e integrador, lo que le resulte más cómodo.$pea0$, false, 4, $pea0$Esa opción existe solo cuando un parcial está desaprobado o ausente y el otro aprobado.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '2cb05b60-ec80-416d-82c6-8269024b0ae0'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '2082d590-1f43-4add-8bff-3b0ed1127bf9'::uuid, 'opcion_multiple', $pea0$Tomás cursa ED, tiene 5 y 6 en los parciales y quiere rendir el integrador "total no pierde nada". ¿Qué le advertís?$pea0$, $pea0$El integrador reemplaza siempre la nota de los parciales. Se aprueba con 5, y para la promoción directa hace falta 7 o más, además de los TP y las demás condiciones.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3bd31396-9081-42be-8037-888a17438850'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '3bd31396-9081-42be-8037-888a17438850'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '2082d590-1f43-4add-8bff-3b0ed1127bf9'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '2082d590-1f43-4add-8bff-3b0ed1127bf9'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('6ec40bf3-52cb-4428-853b-9105e3a1a64b'::uuid, $pea0$Que si le va mal se queda con el 5 y el 6.$pea0$, false, 1, $pea0$Error común: la nota del integrador siempre reemplaza a la de los parciales.$pea0$, null::int, null),
  ('534e8723-f3f5-4ea6-8f8c-91654bffdcae'::uuid, $pea0$Que si se inscribe y después no va, solo queda Ausente.$pea0$, false, 2, $pea0$Si se inscribe a un integrador y no se presenta, se lo califica con 0 y esa nota cuenta para la materia.$pea0$, null::int, null),
  ('f22fe23b-289c-46d9-8e83-b2b1dee96382'::uuid, $pea0$Que la nota del integrador reemplaza a la de los parciales aunque sea menor, y que para la promoción directa necesita 7.$pea0$, true, 3, $pea0$Eso es lo que tiene que saber antes de decidir.$pea0$, null::int, null),
  ('abe9ff29-53a9-4a40-87d8-6bd3aa1b448c'::uuid, $pea0$Que con aprobar el integrador con 5 ya promociona en forma directa.$pea0$, false, 4, $pea0$El integrador se aprueba con 5, pero para la promoción directa hace falta 7 o más.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '2082d590-1f43-4add-8bff-3b0ed1127bf9'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '9a9e7371-0d06-422d-8316-bb3ef91b1a9d'::uuid, 'clasificar', $pea0$Clasificá qué puede rendir cada alumno según las notas de sus parciales (P1 y P2).$pea0$, $pea0$Uno desaprobado o ausente y el otro aprobado: recuperatorio o integrador. 7 o más y 5/6: recuperatorio del más bajo. Los dos con 5/6, o los dos desaprobados o ausentes: integrador. Un parcial con 7 o más no se recupera.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3bd31396-9081-42be-8037-888a17438850'::uuid, $pea0${"columnas":["Recuperatorio o integrador","Solo recuperatorio","Solo integrador","Nada que rendir"]}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '3bd31396-9081-42be-8037-888a17438850'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '9a9e7371-0d06-422d-8316-bb3ef91b1a9d'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '9a9e7371-0d06-422d-8316-bb3ef91b1a9d'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('9fec5444-559c-4fff-842f-f5584d3d0ae3'::uuid, $pea0$P1: 4 · P2: 7$pea0$, false, 1, null, null::int, $pea0$Recuperatorio o integrador$pea0$),
  ('1916a589-05c8-439b-8af0-c9b6f907be13'::uuid, $pea0$P1: ausente · P2: 6$pea0$, false, 2, null, null::int, $pea0$Recuperatorio o integrador$pea0$),
  ('6dbc0a4b-9f05-4280-8b1a-a09fa4e0b085'::uuid, $pea0$P1: 7 · P2: 5$pea0$, false, 3, null, null::int, $pea0$Solo recuperatorio$pea0$),
  ('0b69d9d9-f8a6-4b1c-8d35-9e741c2f500c'::uuid, $pea0$P1: 6 · P2: 6$pea0$, false, 4, null, null::int, $pea0$Solo integrador$pea0$),
  ('bd1d5b11-4f0c-4b66-8528-e3b82d262a65'::uuid, $pea0$P1: ausente · P2: 3$pea0$, false, 5, null, null::int, $pea0$Solo integrador$pea0$),
  ('3a0e3633-3133-463f-8859-d07d35159538'::uuid, $pea0$P1: 8 · P2: 9$pea0$, false, 6, null, null::int, $pea0$Nada que rendir$pea0$)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '9a9e7371-0d06-422d-8316-bb3ef91b1a9d'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '56017845-afc2-40e3-843c-ef094ad2f073'::uuid, '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid, 22, $pea0$Inscripción a exámenes (ED, EDH y PD)$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Carolina","canal":"whatsapp","consulta":"Hola! Quiero rendir el final el lunes. ¿Me anoto el viernes?"},{"tipo":"preguntar","opciones":[{"texto":"¿Qué examen quiere rendir: parcial, recuperatorio, integrador o final?","clave":true,"porque":"Cada uno tiene su plazo de inscripción y de anulación."},{"texto":"¿En qué modalidad cursa?","clave":true,"porque":"En PD los parciales no requieren inscripción."},{"texto":"¿Tiene la matrícula paga y el DNI vigente?","clave":true,"porque":"Son requisitos para rendir."},{"texto":"¿Qué nota espera sacar?","clave":false,"porque":"No cambia los plazos."}]},{"tipo":"idea","titulo":"Parciales en ED y EDH","texto":"La inscripción al parcial es hasta 24 horas antes, y no se anula ni se modifica. En PD, los parciales no requieren inscripción.","clave":"Parcial: hasta 24 h antes y sin anular (en PD, sin inscripción)."},{"tipo":"probalo","n":1},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Recuperatorios, integradores y finales","texto":"Recuperatorio o integrador: inscripción hasta 24 horas antes, y se puede anular hasta 48 horas antes. Final: con al menos 4 días corridos de anticipación, y se anula antes de que sea aceptada, hasta 8 días corridos antes. En PD rigen los mismos plazos.","clave":"Recuperatorio e integrador: 24 h (anula 48 h). Final: 4 días corridos (anula 8).","ejemplo":"Para rendir el lunes, a Carolina no le alcanza anotarse el viernes."},{"tipo":"probalo","n":3},{"tipo":"idea","titulo":"Para rendir","texto":"Tiene que llevar DNI vigente, tener la matrícula paga, estar inscripto y, si corresponde, una notebook con el navegador institucional. La tolerancia es de 15 minutos. El EFIP se pide hasta 6 días corridos antes y se anula hasta 7 días antes; sus fechas salen en la Cartelera del Portal.","clave":"DNI, matrícula paga, inscripción y 15 minutos de tolerancia."},{"tipo":"ojo","texto":"Si se anota a un recuperatorio y no se presenta, la nota es 0 y cuenta para la materia: que anule a tiempo.\nLos turnos dependen de la disponibilidad de la sede o CAU, y en materias virtuales la mesa de final se pide cuando está cargada la condición al terminar el bimestre."},{"tipo":"cierre","resolucion":"A Carolina le explicás que el viernes ya no llega: el final se pide con al menos 4 días corridos de anticipación. Que busque la próxima fecha que publique su sede o CAU y se anote a tiempo.","recordar":"Final: 4 días corridos antes; se anula hasta 8 días antes."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '56017845-afc2-40e3-843c-ef094ad2f073'::uuid and id not in ('dc462016-2585-44ea-8ee1-6bdab95b72ec'::uuid, '47b33b58-af32-427f-8382-6413f4deb85f'::uuid, '5176d910-dabd-40a5-8b84-a7821022dc21'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'dc462016-2585-44ea-8ee1-6bdab95b72ec'::uuid, 'opcion_multiple', $pea0$Sofía cursa ED. Se anotó a un parcial para mañana y le surgió un viaje de trabajo. ¿Qué le decís?$pea0$, $pea0$En ED y EDH la inscripción al parcial se hace hasta 24 horas antes y no se puede anular ni modificar. Si falta, queda Ausente y puede recuperar.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '56017845-afc2-40e3-843c-ef094ad2f073'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '56017845-afc2-40e3-843c-ef094ad2f073'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'dc462016-2585-44ea-8ee1-6bdab95b72ec'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'dc462016-2585-44ea-8ee1-6bdab95b72ec'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('49a9edd4-53c4-49cd-8354-a7e1eca637bd'::uuid, $pea0$Que anule la inscripción desde el portal antes de que falten 24 horas.$pea0$, false, 1, $pea0$En ED y EDH la inscripción al parcial no se puede anular en ningún caso.$pea0$, null::int, null),
  ('e43ccf3c-5b8f-4ae6-839c-bd449fb2f808'::uuid, $pea0$Que pida reprogramarlo presentando una constancia laboral.$pea0$, false, 2, $pea0$Las razones laborales no habilitan a reprogramar un examen.$pea0$, null::int, null),
  ('f15333eb-5433-4c6c-829a-c26ee658768f'::uuid, $pea0$Que la inscripción no se anula ni se modifica: si no va, queda Ausente y después puede ir al recuperatorio.$pea0$, true, 3, $pea0$Faltar a un parcial habilita el recuperatorio.$pea0$, null::int, null),
  ('c7a10173-c126-4159-8e9e-64130b20410e'::uuid, $pea0$Que cambie la fecha por otra dentro de las semanas 1 a 4.$pea0$, false, 4, $pea0$La inscripción al parcial tampoco se puede modificar.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'dc462016-2585-44ea-8ee1-6bdab95b72ec'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '47b33b58-af32-427f-8382-6413f4deb85f'::uuid, 'opcion_multiple', $pea0$Diego cursa en PD y pregunta hasta cuándo puede anotarse al primer parcial. ¿Qué le respondés?$pea0$, $pea0$Antes de responder, preguntá la modalidad: en PD los parciales no llevan inscripción; en ED y EDH sí.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '56017845-afc2-40e3-843c-ef094ad2f073'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '56017845-afc2-40e3-843c-ef094ad2f073'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '47b33b58-af32-427f-8382-6413f4deb85f'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '47b33b58-af32-427f-8382-6413f4deb85f'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('823adb15-d8b3-44c8-8113-30bc518c0247'::uuid, $pea0$Hasta 24 horas antes, y que no se puede anular.$pea0$, false, 1, $pea0$Esa es la regla de ED y EDH.$pea0$, null::int, null),
  ('d79cf3b1-e1d4-4c42-82aa-ab6a41420994'::uuid, $pea0$Que en PD los parciales no requieren inscripción.$pea0$, true, 2, $pea0$En PD solo se inscribe a finales, recuperatorios e integradores.$pea0$, null::int, null),
  ('79a31340-d41f-4d3f-8922-9710bef943da'::uuid, $pea0$Con al menos 4 días corridos de anticipación.$pea0$, false, 3, $pea0$Ese es el plazo de los finales.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '47b33b58-af32-427f-8382-6413f4deb85f'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '5176d910-dabd-40a5-8b84-a7821022dc21'::uuid, 'clasificar', $pea0$Clasificá cada caso de un alumno de ED según si todavía puede anular la inscripción.$pea0$, $pea0$Recuperatorio o integrador: se anula hasta 48 horas antes. Final: hasta 8 días corridos antes, mientras no esté aceptado. Parcial en ED/EDH: nunca.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '56017845-afc2-40e3-843c-ef094ad2f073'::uuid, $pea0${"columnas":["Puede anular","Ya no puede anular"]}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '56017845-afc2-40e3-843c-ef094ad2f073'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '5176d910-dabd-40a5-8b84-a7821022dc21'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '5176d910-dabd-40a5-8b84-a7821022dc21'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('e8439c2a-e62b-4632-8177-fd7c5e6c544f'::uuid, $pea0$Recuperatorio dentro de 3 días$pea0$, false, 1, null, null::int, $pea0$Puede anular$pea0$),
  ('9045adb0-580a-4690-83de-3cef72e7d39b'::uuid, $pea0$Integrador mañana$pea0$, false, 2, null, null::int, $pea0$Ya no puede anular$pea0$),
  ('14f7358e-f20b-49e5-8e0e-22cb1bd5d864'::uuid, $pea0$Parcial dentro de una semana$pea0$, false, 3, null, null::int, $pea0$Ya no puede anular$pea0$),
  ('b634b955-07c9-47fb-8b8e-30b262cad1b7'::uuid, $pea0$Final dentro de 10 días, todavía no aceptado$pea0$, false, 4, null, null::int, $pea0$Puede anular$pea0$),
  ('8cf6ca47-44ed-43cf-8226-e43d3ed54526'::uuid, $pea0$Final dentro de 5 días$pea0$, false, 5, null, null::int, $pea0$Ya no puede anular$pea0$)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '5176d910-dabd-40a5-8b84-a7821022dc21'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '3039650a-f7a0-4135-8566-df7fb2192825'::uuid, '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid, 23, $pea0$Ausencia a un examen y pedido de revisión$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Gisela","canal":"whatsapp","consulta":"Hola, ayer no pude ir al parcial porque tuve fiebre. ¿Me lo reprograman?"},{"tipo":"preguntar","opciones":[{"texto":"¿A qué examen faltó: parcial, recuperatorio, integrador o final?","clave":true,"porque":"En un final el ausente consume una oportunidad; en un recuperatorio o integrador inscripto, es 0."},{"texto":"¿Su situación puede estar entre los casos especiales regulados?","clave":true,"porque":"La Res. CS 535/2017 prevé excepciones: esos casos se derivan."},{"texto":"¿Quiere pedir revisión de un examen que ya rindió?","clave":true,"porque":"Solo se pide en el sistema, al terminar el examen."},{"texto":"¿En qué horario era el parcial?","clave":false,"porque":"No cambia que quede Ausente."}]},{"tipo":"idea","titulo":"Faltar no se reprograma","texto":"Faltar a un examen, por cualquier motivo (personal, laboral, médico o un paro), no permite reprogramarlo: queda Ausente. En un final, además, el ausente consume una de las 3 oportunidades antes de quedar Libre. Y si se inscribió a un recuperatorio o integrador y no se presentó, se califica con 0 y cuenta para la nota.","clave":"El ausente no se reprograma; en un final consume una oportunidad.","ejemplo":"Gisela queda Ausente en el parcial, aunque haya tenido fiebre."},{"tipo":"probalo","n":1},{"tipo":"probalo","n":3},{"tipo":"idea","titulo":"La revisión, al terminar","texto":"La revisión se pide en el sistema al terminar el examen: 10 minutos en parciales y 15 en finales. No hay otra vía, y si no completa todos los datos del pedido, es nulo. La respuesta llega en 15 días; si estaba desaprobado, puede cambiar la nota o habilitarse a rendir otra vez.","clave":"Revisión en el sistema al terminar: 10 minutos en parciales, 15 en finales."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Hay casos especiales regulados (Res. CS 535/2017) que son excepción a esta regla: no los resuelvas vos, derivá."},{"tipo":"cierre","resolucion":"A Gisela le explicás que faltar por razones médicas no permite reprogramar el parcial: queda Ausente. Si su situación pudiera entrar entre los casos especiales regulados, la derivás.","recordar":"El ausente no se reprograma; la revisión, solo al terminar el examen."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '3039650a-f7a0-4135-8566-df7fb2192825'::uuid and id not in ('70dd4a87-8fd7-436d-87db-287a1b71760b'::uuid, 'fdc9d327-c8dd-43f6-8b1c-26af8e2bb83c'::uuid, '32e4e2e9-ea15-4633-84ce-68c9f89ae7c8'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '70dd4a87-8fd7-436d-87db-287a1b71760b'::uuid, 'opcion_multiple', $pea0$Lucas cursa EDH. Se inscribió al integrador y no se presentó porque se enfermó. Pregunta si lo puede rendir otro día. ¿Qué le decís?$pea0$, $pea0$Faltar no habilita a reprogramar. En recuperatorios e integradores con inscripción, el no presentarse se califica con 0.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3039650a-f7a0-4135-8566-df7fb2192825'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '3039650a-f7a0-4135-8566-df7fb2192825'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '70dd4a87-8fd7-436d-87db-287a1b71760b'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '70dd4a87-8fd7-436d-87db-287a1b71760b'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('ab3321bc-cd49-4021-8518-d3ee588fd881'::uuid, $pea0$Que lo reprogramen presentando el certificado médico.$pea0$, false, 1, $pea0$Las razones médicas no habilitan a reprogramar.$pea0$, null::int, null),
  ('7611472d-53cb-48eb-8f3f-3f4787313d80'::uuid, $pea0$Que queda Ausente, sin nota, y puede inscribirse al próximo.$pea0$, false, 2, $pea0$Inscripto a un integrador y sin presentarse, se lo califica con 0 y esa nota cuenta para la materia.$pea0$, null::int, null),
  ('f98fc609-ee9d-42d6-8bc5-d69a34add619'::uuid, $pea0$Que no se reprograma y que el integrador queda con 0, que cuenta para la nota; si su caso pudiera ser una excepción reglada, lo derivás.$pea0$, true, 3, $pea0$Es la regla general, con la salvedad de las situaciones de la Res. CS 535/2017.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '70dd4a87-8fd7-436d-87db-287a1b71760b'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'fdc9d327-c8dd-43f6-8b1c-26af8e2bb83c'::uuid, 'opcion_multiple', $pea0$Valentina rindió un final hace dos horas y cree que una pregunta estaba mal corregida. ¿Qué le decís?$pea0$, $pea0$La revisión se pide solo en el sistema, al terminar el examen: 10 minutos en parciales, 15 en finales. La respuesta llega en 15 días.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3039650a-f7a0-4135-8566-df7fb2192825'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '3039650a-f7a0-4135-8566-df7fb2192825'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'fdc9d327-c8dd-43f6-8b1c-26af8e2bb83c'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'fdc9d327-c8dd-43f6-8b1c-26af8e2bb83c'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('391e577c-f0e3-4266-8eab-000c0f91b37b'::uuid, $pea0$Que le escriba al docente con una captura de la pregunta.$pea0$, false, 1, $pea0$No hay otra vía de revisión que la del sistema al terminar el examen.$pea0$, null::int, null),
  ('41b9a93f-e086-4a2f-8aee-f3749d3a6434'::uuid, $pea0$Que pida la revisión en el CAU dentro de los 15 días.$pea0$, false, 2, $pea0$Los 15 días son el plazo de respuesta, no el plazo para pedirla.$pea0$, null::int, null),
  ('4bf5d2d5-62df-4db7-8b57-74492bd1a92e'::uuid, $pea0$Que ya no puede pedirla: en los finales la revisión se solicita en el sistema dentro de los 15 minutos posteriores.$pea0$, true, 3, $pea0$Pasado ese plazo, no hay otra instancia.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'fdc9d327-c8dd-43f6-8b1c-26af8e2bb83c'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '32e4e2e9-ea15-4633-84ce-68c9f89ae7c8'::uuid, 'verdadero_falso', $pea0$Si un alumno falta a un final por un paro de transporte, no pierde esa oportunidad.$pea0$, $pea0$El paro no habilita a reprogramar. En un final, el ausente consume una de las oportunidades.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3039650a-f7a0-4135-8566-df7fb2192825'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '3039650a-f7a0-4135-8566-df7fb2192825'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '32e4e2e9-ea15-4633-84ce-68c9f89ae7c8'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '32e4e2e9-ea15-4633-84ce-68c9f89ae7c8'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('8b1d8de9-9b7c-4049-8eec-273c6ce7c3a7'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('fd312e20-917a-481d-8866-8f68f9a96675'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '32e4e2e9-ea15-4633-84ce-68c9f89ae7c8'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '184d1130-cf11-41be-8840-e304df55102c'::uuid, 'ded24f8c-0a3b-444b-8201-48f555f45573'::uuid, 24, $pea0$Condiciones de aprobación y escala de notas$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Rodrigo","canal":"whatsapp","consulta":"Hola! Quedé regular en una materia. ¿Con cuánto apruebo el final y cuántas veces lo puedo rendir?"},{"tipo":"preguntar","opciones":[{"texto":"¿Qué condición tiene en la materia: regular o libre por nota?","clave":true,"porque":"El final, la vigencia y las oportunidades cambian según la condición."},{"texto":"¿En qué modalidad cursa?","clave":true,"porque":"En ED y PD se pide 75% de asistencia; en EDH no."},{"texto":"¿Tiene las correlativas aprobadas?","clave":true,"porque":"Sin correlativas aprobadas no hay promoción."},{"texto":"¿Cuántas horas estudia por semana?","clave":false,"porque":"No cambia las condiciones."}]},{"tipo":"idea","titulo":"Regular o promoción","texto":"Regular: 3 de 4 TP con 5 o más y 2 parciales con 5 o más (puede mediar recuperatorio o integrador); rinde final. Promoción directa: 3 de 4 TP con 7 o más, 2 parciales con 7 o más y correlativas aprobadas. Promoción indirecta: 4 de 4 TP con 7 o más, parciales con 5 o 6 y correlativas aprobadas. Las dos promociones aprueban sin final.","clave":"Promoción directa: todo con 7. Indirecta: 4 TP con 7 y parciales con 5 o 6."},{"tipo":"probalo","n":1},{"tipo":"probalo","n":3},{"tipo":"idea","titulo":"El final regular","texto":"El final regular tiene 30 preguntas y se aprueba con 4 (14 correctas). La regularidad dura 18 meses y da 3 oportunidades.","clave":"Final regular: 30 preguntas, aprueba con 4; 18 meses y 3 oportunidades.","ejemplo":"Rodrigo aprueba con 14 de 30 y tiene 3 oportunidades en 18 meses."},{"tipo":"idea","titulo":"Libre por nota","texto":"Si queda libre por nota, tiene 3 meses y una sola oportunidad para un final de 50 preguntas, que aprueba con 24 correctas.","clave":"Libre por nota: 50 preguntas, 3 meses, una oportunidad."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"La asistencia del 75% se pide en ED y PD; en EDH no aplica.\nEn PD, en MEC, MIA y MAP, el final suma un oral si aprueba el escrito (en MIP no). Idiomas no tiene promoción indirecta."},{"tipo":"cierre","resolucion":"A Rodrigo le explicás que el final regular tiene 30 preguntas y se aprueba con 4, es decir, con 14 correctas, y que tiene 3 oportunidades dentro de los 18 meses de vigencia de la regularidad.","recordar":"Regular: final de 30, aprueba con 4; 18 meses y 3 oportunidades."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'ded24f8c-0a3b-444b-8201-48f555f45573'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '184d1130-cf11-41be-8840-e304df55102c'::uuid and id not in ('44e1c16f-3b31-4f74-8690-e54e4aade280'::uuid, 'c394e7c0-5f3e-46cd-8ad4-ff4ea9c820ec'::uuid, 'fd42d2d6-4e48-41d2-88ef-6d8567f0456b'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'ded24f8c-0a3b-444b-8201-48f555f45573'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '44e1c16f-3b31-4f74-8690-e54e4aade280'::uuid, 'opcion_multiple', $pea0$Agustina cursa ED, cumplió la asistencia, tiene los 4 TP con 8, parciales con 6 y 5, y las correlativas aprobadas. ¿Qué condición tiene?$pea0$, $pea0$La promoción indirecta pide los 4 TP con 7 o más, parciales con 5 o 6 y las correlativas aprobadas. No aplica en Idiomas.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '184d1130-cf11-41be-8840-e304df55102c'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '184d1130-cf11-41be-8840-e304df55102c'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'ded24f8c-0a3b-444b-8201-48f555f45573'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '44e1c16f-3b31-4f74-8690-e54e4aade280'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'ded24f8c-0a3b-444b-8201-48f555f45573'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '44e1c16f-3b31-4f74-8690-e54e4aade280'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('fe28cccf-6a12-4a29-899d-886e29fd0c2f'::uuid, $pea0$Regular: tiene que rendir el final.$pea0$, false, 1, $pea0$Con 4 de 4 TP con 7 o más y parciales con 5 o 6 no queda regular.$pea0$, null::int, null),
  ('941f5649-599d-4cc7-8e1f-9de16fc4dd76'::uuid, $pea0$Promoción indirecta: aprueba sin final.$pea0$, true, 2, $pea0$4 de 4 TP con 7 o más, parciales con 5 o 6 y correlativas aprobadas.$pea0$, null::int, null),
  ('29824a9c-714f-4acb-8df4-ce91a4feca95'::uuid, $pea0$Promoción directa.$pea0$, false, 3, $pea0$La directa exige los dos parciales con 7 o más.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '44e1c16f-3b31-4f74-8690-e54e4aade280'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'c394e7c0-5f3e-46cd-8ad4-ff4ea9c820ec'::uuid, 'opcion_multiple', $pea0$Ramiro cursa EDH y quedó libre por nota en una materia. Pregunta qué opciones tiene. ¿Qué le decís?$pea0$, $pea0$Libre por nota: final de 50 preguntas, nota 4 (24 correctas), vigencia de 3 meses y una sola oportunidad.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '184d1130-cf11-41be-8840-e304df55102c'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '184d1130-cf11-41be-8840-e304df55102c'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'ded24f8c-0a3b-444b-8201-48f555f45573'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'c394e7c0-5f3e-46cd-8ad4-ff4ea9c820ec'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'ded24f8c-0a3b-444b-8201-48f555f45573'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'c394e7c0-5f3e-46cd-8ad4-ff4ea9c820ec'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('4e889188-d7af-4554-88a6-12abc05a53ac'::uuid, $pea0$Que tiene 18 meses y 3 oportunidades para el final.$pea0$, false, 1, $pea0$Eso corresponde al final regular.$pea0$, null::int, null),
  ('bc034b2c-03af-445b-800e-a3a3517aa487'::uuid, $pea0$Que tiene 3 meses y una sola oportunidad para un final de 50 preguntas, que aprueba con 24 correctas.$pea0$, true, 2, $pea0$Esas son las condiciones del libre por nota.$pea0$, null::int, null),
  ('c7f365b9-eed4-46f0-8ac3-76f011c619ea'::uuid, $pea0$Que tiene que recursar la materia sí o sí.$pea0$, false, 3, $pea0$Recursa quien queda Libre, no quien queda libre por nota.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'c394e7c0-5f3e-46cd-8ad4-ff4ea9c820ec'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'fd42d2d6-4e48-41d2-88ef-6d8567f0456b'::uuid, 'clasificar', $pea0$Clasificá la condición de cada alumno de EDH, en una materia MEC.$pea0$, $pea0$Si al terminar el cursado no tiene las correlativas aprobadas, la materia queda Regular aunque las notas alcancen para promocionar.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '184d1130-cf11-41be-8840-e304df55102c'::uuid, $pea0${"columnas":["Promoción directa","Promoción indirecta","Regular"]}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '184d1130-cf11-41be-8840-e304df55102c'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'ded24f8c-0a3b-444b-8201-48f555f45573'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'fd42d2d6-4e48-41d2-88ef-6d8567f0456b'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'ded24f8c-0a3b-444b-8201-48f555f45573'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'fd42d2d6-4e48-41d2-88ef-6d8567f0456b'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('e7e2cf3f-b645-416e-8d15-8103b23226c8'::uuid, $pea0$3 TP con 7, parciales con 7 y 8, correlativas aprobadas$pea0$, false, 1, null, null::int, $pea0$Promoción directa$pea0$),
  ('a9faaefb-3589-48fd-8f03-9db09f82ff6b'::uuid, $pea0$4 TP con 9, parciales con 5 y 6, correlativas aprobadas$pea0$, false, 2, null, null::int, $pea0$Promoción indirecta$pea0$),
  ('b8fa2543-8fcd-48b7-8252-b11fcdad98ff'::uuid, $pea0$3 TP con 6, parciales con 5 y 5$pea0$, false, 3, null, null::int, $pea0$Regular$pea0$),
  ('84f03fc5-aade-4341-8bc9-873691c10c13'::uuid, $pea0$3 TP con 9, parciales con 8 y 9, debe una correlativa$pea0$, false, 4, null, null::int, $pea0$Regular$pea0$)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'fd42d2d6-4e48-41d2-88ef-6d8567f0456b'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'af8288cb-e294-424d-835d-bd4be9907e56'::uuid, '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid, 25, $pea0$Materias de proceso e idiomas en distancia$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Andrés","canal":"whatsapp","consulta":"Hola, terminé la Práctica Profesional pero no llegué a las 250 horas. ¿La puedo rendir libre?"},{"tipo":"preguntar","opciones":[{"texto":"¿Qué práctica es: Solidaria o Profesional?","clave":true,"porque":"Las horas, la nota de la organización y las correlativas cambian."},{"texto":"¿Cumplió la carga horaria y la nota de la organización?","clave":true,"porque":"Sin las horas no se aprueba."},{"texto":"¿Aprobó 3 de 4 TP, incluido el TP4?","clave":true,"porque":"Es condición en las dos prácticas."},{"texto":"¿En qué organización la hizo?","clave":false,"porque":"No cambia las condiciones."}]},{"tipo":"idea","titulo":"Las materias de proceso","texto":"Las materias de proceso no se promocionan ni se rinden libres: si no se cumplen las condiciones, quedan Libres y se recursan. Los TP de las prácticas vencen en las semanas 6, 8, 12 y 15, el domingo a las 23:59.","clave":"No se promocionan ni se rinden libres: si no cumple, se recursa.","ejemplo":"Andrés no puede rendirla libre: sin las horas, la recursa."},{"tipo":"idea","titulo":"Solidaria y Profesional","texto":"Práctica Solidaria: carga horaria completa con nota 5 o más de la organización y 3 de 4 TP con el TP4 aprobado; la nota es el promedio de los TP, sin final. Práctica Profesional: 250 horas con nota 7 o más de la organización, 3 de 4 TP con el TP4 aprobado y correlativas aprobadas; si le falta una correlativa, queda Regular hasta aprobarla, con un máximo de 18 meses.","clave":"Solidaria: horas, nota 5 y TP4. Profesional: 250 h, nota 7, TP4 y correlativas."},{"tipo":"probalo","n":1},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Idiomas","texto":"Idiomas tiene un placement test único. Queda regular con 6 niveles seguidos al 70% o con Avanzado 3, y rinde un integrador de 50 preguntas que aprueba con 4. Si no alcanza la regularidad en el año de cursado, pierde el avance y reinicia la materia. No se permiten diccionarios, glosarios ni listas de verbos.","clave":"Idiomas: regular dentro del año; si no, reinicia. Integrador de 50, aprueba con 4."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Para cursar el último semestre necesita todos los niveles de idioma aprobados.\nEn distancia, el Seminario de Práctica queda Regular y su nota es la del EFIP I."},{"tipo":"cierre","resolucion":"A Andrés le explicás que la Práctica Profesional es una materia de proceso: no se rinde libre. Sin las 250 horas no se aprueba, queda Libre y tiene que recursarla.","recordar":"En las prácticas, sin las horas o sin el TP4, se recursa."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'af8288cb-e294-424d-835d-bd4be9907e56'::uuid and id not in ('60fdca89-8cf5-40bc-8b7e-bb12210864fb'::uuid, '865f2ebb-0e64-49aa-836b-18ad7c4f6b42'::uuid, 'd2d686ba-7ea8-49e4-8855-7c9f2495854f'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '60fdca89-8cf5-40bc-8b7e-bb12210864fb'::uuid, 'opcion_multiple', $pea0$Camila cursa ED. Terminó la Práctica Profesional con las 250 horas, evaluación 8 de la organización y 3 de 4 TP aprobados, incluido el TP4, pero le falta aprobar una correlativa. ¿Qué le decís?$pea0$, $pea0$En la Práctica Profesional, sin las correlativas aprobadas queda Regular hasta 18 meses; vencido el plazo, la pierde y recursa.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'af8288cb-e294-424d-835d-bd4be9907e56'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'af8288cb-e294-424d-835d-bd4be9907e56'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '60fdca89-8cf5-40bc-8b7e-bb12210864fb'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '60fdca89-8cf5-40bc-8b7e-bb12210864fb'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('05e272ff-cb94-42ba-85f7-12e9570e3a77'::uuid, $pea0$Que la práctica queda aprobada igual: la correlativa no influye.$pea0$, false, 1, $pea0$Sin las correlativas aprobadas la práctica no se aprueba.$pea0$, null::int, null),
  ('d879e955-da24-448e-83cd-9a3a87882a2a'::uuid, $pea0$Que queda Libre y tiene que recursarla.$pea0$, false, 2, $pea0$Cumplió las demás condiciones: queda Regular, no Libre.$pea0$, null::int, null),
  ('97bf8ced-311e-42c9-8383-f34f6dc5e5ca'::uuid, $pea0$Que queda Regular hasta aprobar la correlativa, con un máximo de 18 meses; si no la aprueba en ese plazo, recursa.$pea0$, true, 3, $pea0$Es la regla de la Práctica Profesional.$pea0$, null::int, null),
  ('6a18df1c-89c6-403a-845f-8bb7be18c3f9'::uuid, $pea0$Que apruebe la correlativa y después rinda el final de la práctica.$pea0$, false, 4, $pea0$Las materias de proceso no tienen final: la nota es el promedio de los TP.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '60fdca89-8cf5-40bc-8b7e-bb12210864fb'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '865f2ebb-0e64-49aa-836b-18ad7c4f6b42'::uuid, 'opcion_multiple', $pea0$Nicolás cursa EDH. Cumplió las horas de la Práctica Solidaria con nota 6 de la organización, aprobó el TP1, el TP2 y el TP3, pero desaprobó el TP4. ¿Qué pasa?$pea0$, $pea0$Práctica Solidaria: carga horaria completa, nota de 5 o más de la organización y 3 de 4 TP con el TP4 aprobado. Si no cumple, queda Libre.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'af8288cb-e294-424d-835d-bd4be9907e56'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'af8288cb-e294-424d-835d-bd4be9907e56'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '865f2ebb-0e64-49aa-836b-18ad7c4f6b42'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '865f2ebb-0e64-49aa-836b-18ad7c4f6b42'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('1b9a5aec-7c39-47d4-8c66-68949a04326c'::uuid, $pea0$Aprueba, porque tiene 3 de 4 TP.$pea0$, false, 1, $pea0$Error común: el TP4 es obligatorio.$pea0$, null::int, null),
  ('1da5a069-e4fb-4cf7-8990-9f66024e2153'::uuid, $pea0$Queda Libre y tiene que recursar la materia.$pea0$, true, 2, $pea0$Sin el TP4 aprobado no cumple las condiciones, y las materias de proceso no tienen otra instancia.$pea0$, null::int, null),
  ('fd591761-1093-4fb4-83bf-f8244376ce64'::uuid, $pea0$Rinde un examen final para compensar el TP4.$pea0$, false, 3, $pea0$La Práctica Solidaria no tiene examen final.$pea0$, null::int, null),
  ('a5068f1f-dfd0-4343-8379-0d37d3fd3aa5'::uuid, $pea0$La puede rendir como libre por nota.$pea0$, false, 4, $pea0$Las materias de proceso no se rinden libres por nota.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '865f2ebb-0e64-49aa-836b-18ad7c4f6b42'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'd2d686ba-7ea8-49e4-8855-7c9f2495854f'::uuid, 'opcion_multiple', $pea0$Julieta empezó Inglés en la plataforma en el primer semestre y, al terminar el segundo, aprobó solo hasta el nivel 4. ¿Qué le decís?$pea0$, $pea0$Idiomas se regulariza en el año de cursado, con 6 niveles consecutivos al 70% o el Avanzado 3. Si no, se reinicia.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'af8288cb-e294-424d-835d-bd4be9907e56'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'af8288cb-e294-424d-835d-bd4be9907e56'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'd2d686ba-7ea8-49e4-8855-7c9f2495854f'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'd2d686ba-7ea8-49e4-8855-7c9f2495854f'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('3cae5515-935c-4953-8325-6167cae67dab'::uuid, $pea0$Que conserva los niveles aprobados y sigue el año que viene.$pea0$, false, 1, $pea0$Si no alcanza la regularidad en el año de cursado, pierde todo el avance.$pea0$, null::int, null),
  ('04d7e7ca-7074-493f-86da-fb0103c60234'::uuid, $pea0$Que igual puede rendir el examen final integrador.$pea0$, false, 2, $pea0$Para rendirlo necesita aprobar el nivel 6 o el Avanzado 3.$pea0$, null::int, null),
  ('a2fd4339-d582-41cb-8420-bbd7015a4dcb'::uuid, $pea0$Que pierde el avance y tiene que reiniciar la materia desde el comienzo.$pea0$, true, 3, $pea0$Es la regla para quien no regulariza en el año.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'd2d686ba-7ea8-49e4-8855-7c9f2495854f'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '8d2c9c40-243e-47a0-8b05-a293d6dd3ae6'::uuid, '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid, 26, $pea0$EFIP I y EFIP II$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Sebastián","canal":"mostrador","consulta":"Hola, curso una carrera de grado en EDH. ¿Cuándo rindo el EFIP y qué necesito?"},{"tipo":"preguntar","opciones":[{"texto":"¿Es una carrera de grado o de pregrado?","clave":true,"porque":"El EFIP es solo para grado en ED y EDH."},{"texto":"¿Tiene el Seminario de Práctica regular, o el Módulo EFIP I cursando o regular?","clave":true,"porque":"Es requisito para rendir el EFIP I, junto con las correlativas."},{"texto":"¿Su carrera tiene idiomas?","clave":true,"porque":"Entonces el EFIP I suma la producción en idioma."},{"texto":"¿Prefiere rendir a la mañana o a la tarde?","clave":false,"porque":"No es lo que define cuándo rinde."}]},{"tipo":"idea","titulo":"Qué es el EFIP","texto":"Es solo para carreras de grado en ED y EDH; no para pregrado ni ciclos de complementación. Se rinde presencial, ante un tribunal. Las fechas salen en la Cartelera del Portal de estudiante al inicio de cada año, y se inscribe hasta 6 días corridos antes.","clave":"Grado en ED y EDH, presencial ante un tribunal; fechas en la Cartelera."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"El EFIP I","texto":"Tiene integración curricular (escrita y oral) y, si la carrera tiene idiomas, producción en idioma: hay que aprobar las dos en el mismo turno. Para rendirlo: Seminario de Práctica Regular, o el Módulo EFIP I cursando o Regular, y las correlativas aprobadas. Se rinde hasta 3 veces; si no aprueba, vuelve a cursar el Módulo EFIP I o el Seminario de Práctica.","clave":"EFIP I: integración e idioma en el mismo turno; hasta 3 veces.","ejemplo":"Si la carrera de Sebastián tiene idiomas, rinde también la producción en idioma."},{"tipo":"probalo","n":2},{"tipo":"probalo","n":3},{"tipo":"idea","titulo":"El EFIP II","texto":"Pide todas las materias aprobadas (con Práctica Solidaria y electivas), Seminario Final Regular, el visado del analítico aprobado y no tener deuda. Es requisito para la defensa del TFG.","clave":"EFIP II: todo aprobado, Seminario Final regular y sin deuda."},{"tipo":"ojo","texto":"Aprobar el Seminario de Práctica no aprueba el EFIP I: igual tiene que rendirlo. Y sin EFIP I aprobado no puede inscribirse a cursar Seminario Final.\nRendirlo en un CAU con tecnología es excepcional: a criterio de la Universidad, ante una imposibilidad permanente de viajar acreditada."},{"tipo":"cierre","resolucion":"A Sebastián le explicás que el EFIP I se rinde presencial ante un tribunal, en las fechas de la Cartelera del Portal, con inscripción hasta 6 días corridos antes, y que necesita el Seminario de Práctica regular (o el Módulo EFIP I cursando o regular) y las correlativas aprobadas.","recordar":"EFIP: solo grado a distancia; el EFIP I, hasta 3 veces."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-4-5-sitema-de-evaluacion-de-los-aprendizajes-eva-21$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '8d2c9c40-243e-47a0-8b05-a293d6dd3ae6'::uuid and id not in ('d0777b37-f1f0-4aba-88b1-5064afedafa3'::uuid, '8080da1a-b662-44a5-83a1-fccff0a8be67'::uuid, '46488501-3675-4b12-8e07-21d9c4ff53ca'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'd0777b37-f1f0-4aba-88b1-5064afedafa3'::uuid, 'opcion_multiple', $pea0$Paula cursa una tecnicatura (pregrado) en ED y pregunta cuándo rinde el EFIP. ¿Qué le decís?$pea0$, $pea0$El EFIP aplica exclusivamente a carreras de grado en ED y EDH. No lo rinden el pregrado, los ciclos de complementación ni PD.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '8d2c9c40-243e-47a0-8b05-a293d6dd3ae6'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '8d2c9c40-243e-47a0-8b05-a293d6dd3ae6'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'd0777b37-f1f0-4aba-88b1-5064afedafa3'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'd0777b37-f1f0-4aba-88b1-5064afedafa3'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('1221705c-6931-4df9-8cfc-4c318ede2c41'::uuid, $pea0$Que mire las fechas en la Cartelera del Portal y se inscriba hasta 6 días antes.$pea0$, false, 1, $pea0$Da por hecho que el EFIP le corresponde, y no es así.$pea0$, null::int, null),
  ('f5a70644-8e61-45d5-8456-3ace5d5578c9'::uuid, $pea0$Que no rinde EFIP: es solo para carreras de grado en ED y EDH.$pea0$, true, 2, $pea0$El pregrado está excluido del EFIP; su instancia final es Integración Profesional - Estudio del Caso.$pea0$, null::int, null),
  ('be7d1859-4b97-49fa-81cc-167255393b69'::uuid, $pea0$Que rinde solo el EFIP I, porque el EFIP II es para grado.$pea0$, false, 3, $pea0$El pregrado no rinde ninguno de los dos.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'd0777b37-f1f0-4aba-88b1-5064afedafa3'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '8080da1a-b662-44a5-83a1-fccff0a8be67'::uuid, 'opcion_multiple', $pea0$Martín cursa una carrera de grado en EDH que incluye idiomas, y ya aprobó el Examen Integrador de Inglés en la plataforma. ¿Qué rinde en el EFIP I?$pea0$, $pea0$Quien aprobó el integrador de idioma en la plataforma, o fue eximido de Idiomas, no rinde el módulo de idioma del EFIP I.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '8d2c9c40-243e-47a0-8b05-a293d6dd3ae6'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '8d2c9c40-243e-47a0-8b05-a293d6dd3ae6'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '8080da1a-b662-44a5-83a1-fccff0a8be67'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '8080da1a-b662-44a5-83a1-fccff0a8be67'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('ae217f65-451f-4a4b-8a25-81cacbd43e1d'::uuid, $pea0$Integración curricular y producción en idioma, como todos.$pea0$, false, 1, $pea0$Con el integrador de idioma aprobado queda eximido del módulo de idioma.$pea0$, null::int, null),
  ('e934abda-bef1-40ba-8390-a95a5d3c7d2c'::uuid, $pea0$Solo la integración curricular, escrita y oral.$pea0$, true, 2, $pea0$Queda eximido del módulo de idioma del EFIP I.$pea0$, null::int, null),
  ('07252fea-1dd1-4c59-8144-281b8182ea62'::uuid, $pea0$Solo el módulo de idioma.$pea0$, false, 3, $pea0$La integración curricular es obligatoria siempre.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '8080da1a-b662-44a5-83a1-fccff0a8be67'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '46488501-3675-4b12-8e07-21d9c4ff53ca'::uuid, 'opcion_multiple', $pea0$Florencia desaprobó tres veces el EFIP I. Su carrera no tiene Módulo de cursado EFIP I. ¿Qué le decís?$pea0$, $pea0$Con 3 reprobaciones o ausencias en el EFIP I: si la carrera tiene Módulo EFIP I, se reinscribe a él; si no, recursa el Seminario correspondiente.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '8d2c9c40-243e-47a0-8b05-a293d6dd3ae6'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '8d2c9c40-243e-47a0-8b05-a293d6dd3ae6'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '46488501-3675-4b12-8e07-21d9c4ff53ca'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '46488501-3675-4b12-8e07-21d9c4ff53ca'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('bcbc823f-d0ad-4062-8e66-0aeaadc0f559'::uuid, $pea0$Que pida una cuarta oportunidad por excepción.$pea0$, false, 1, $pea0$El tope son 3 veces; la regla dice qué hacer después.$pea0$, null::int, null),
  ('0863b741-a1d9-460c-8e57-a485cd7a3d60'::uuid, $pea0$Que se inscriba al Módulo de cursado EFIP I.$pea0$, false, 2, $pea0$Esa es la salida solo para las carreras que tienen el Módulo.$pea0$, null::int, null),
  ('80deb3e3-aa4b-47bc-85db-19cfc2afd9e9'::uuid, $pea0$Que tiene que recursar Seminario de Práctica o Seminario de Planificación y Control de Gestión, según su carrera.$pea0$, true, 3, $pea0$Es lo que corresponde cuando la carrera no tiene Módulo EFIP I.$pea0$, null::int, null),
  ('34ffb8fe-ad36-427c-8c07-6e3570eab0b7'::uuid, $pea0$Que como ya aprobó el Seminario de Práctica, el EFIP I se da por aprobado.$pea0$, false, 4, $pea0$Aprobar el Seminario no aprueba el EFIP I.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '46488501-3675-4b12-8e07-21d9c4ff53ca'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '4434f5d7-adf9-4696-8f1e-1bf7ad66bc32'::uuid, '2594b0a0-0047-4677-845e-19307b8d00ef'::uuid, 27, $pea0$Sanciones$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Tamara","canal":"whatsapp","consulta":"Hola, en el examen online me marcaron una falta por mirar para el costado. ¿Qué me va a pasar?"},{"tipo":"preguntar","opciones":[{"texto":"¿Qué conducta le marcaron?","clave":true,"porque":"Desviar la mirada en forma sostenida puede ser falta leve."},{"texto":"¿Hubo otra anomalía en el mismo examen?","clave":true,"porque":"Si se suma otra falta leve, pasa a grave."},{"texto":"¿Quién está resolviendo el caso?","clave":true,"porque":"Lo resuelve la Universidad, no el CAU."},{"texto":"¿Qué nota esperaba sacar?","clave":false,"porque":"No cambia la falta."}]},{"tipo":"idea","titulo":"Faltas y sanciones","texto":"Las faltas son leves, graves, muy graves o gravísimas, y el plagio también se gradúa. Según la gravedad: llamado de atención, apercibimiento, suspensión o expulsión. Además se pone 0 en la actividad; desde el apercibimiento la materia queda Libre, y la suspensión aparta al alumno de toda actividad hasta 1 año.","clave":"Leve: llamado de atención y 0. Desde el apercibimiento, materia Libre."},{"tipo":"idea","titulo":"Copiar un TP","texto":"Una copia menor al 50% es falta leve: llamado de atención y 0 en el TP. Mayor al 50% es grave: apercibimiento, 0, la materia queda Libre y queda registrado en el analítico.","clave":"Copia de menos del 50%: leve. De más del 50%: grave y materia Libre."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"En los exámenes online","texto":"Son faltas leves leer en voz alta, usar el teclado o auriculares, desviar la mirada en forma sostenida, tapar parcialmente la cámara o bajar el micrófono. Una falta leve es llamado de atención y 0 en ese examen; si se suma otra anomalía leve en el mismo examen, pasa a grave. Lo resuelve la Universidad, no el CAU.","clave":"Leve en examen: llamado de atención y 0; dos en el mismo examen, grave.","ejemplo":"A Tamara, si fue solo la mirada, le corresponde llamado de atención y 0 en ese examen."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Todas las sanciones, salvo el llamado de atención, quedan en el certificado analítico; el llamado de atención queda solo en el legajo. La expulsión es definitiva y se comunica a todo el Sistema Universitario Nacional."},{"tipo":"probalo","n":3},{"tipo":"cierre","resolucion":"A Tamara le explicás que desviar la mirada en forma sostenida puede ser una falta leve: llamado de atención y 0 en ese examen, que no queda en el analítico. Si en el mismo examen hubo otra anomalía leve, pasa a grave. Y que lo resuelve la Universidad, no el CAU.","recordar":"Falta leve: llamado de atención y 0; no va al analítico."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-13-1-regimen-general-de-sanciones$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '2594b0a0-0047-4677-845e-19307b8d00ef'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '4434f5d7-adf9-4696-8f1e-1bf7ad66bc32'::uuid and id not in ('ae46221c-c43a-42d0-8d74-1a86434c2e35'::uuid, '1d961ece-56bb-4339-8cc7-766698e3ccce'::uuid, 'a93eda91-62ea-4c21-8090-8636b6efb64e'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '2594b0a0-0047-4677-845e-19307b8d00ef'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'ae46221c-c43a-42d0-8d74-1a86434c2e35'::uuid, 'opcion_multiple', $pea0$Federico entregó un TP en el que más de la mitad estaba copiada de un compañero. Pregunta qué le puede pasar. ¿Qué le decís?$pea0$, $pea0$En los TP, una copia menor al 50% es leve y una mayor al 50% es grave. La sanción la resuelve la Universidad, no el CAU.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '4434f5d7-adf9-4696-8f1e-1bf7ad66bc32'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '4434f5d7-adf9-4696-8f1e-1bf7ad66bc32'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '2594b0a0-0047-4677-845e-19307b8d00ef'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'ae46221c-c43a-42d0-8d74-1a86434c2e35'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '2594b0a0-0047-4677-845e-19307b8d00ef'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'ae46221c-c43a-42d0-8d74-1a86434c2e35'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('1e37bf34-fef1-4cfe-850f-e7d8b856d965'::uuid, $pea0$Que es una falta leve: llamado de atención y 0 en el TP.$pea0$, false, 1, $pea0$Eso corresponde a una copia menor al 50%.$pea0$, null::int, null),
  ('ef3a6959-fbe7-4e31-8928-f7782ff589bc'::uuid, $pea0$Que puede ser una falta grave: apercibimiento, 0 en el TP, la materia Libre, y queda registrada en el analítico.$pea0$, true, 2, $pea0$Una copia superior al 50% es falta grave.$pea0$, null::int, null),
  ('d2e90a1e-8c61-49a5-8225-005103d8dbd1'::uuid, $pea0$Que lo pueden expulsar de la Universidad.$pea0$, false, 3, $pea0$La expulsión es para las faltas gravísimas, como presentar documentos falsos.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'ae46221c-c43a-42d0-8d74-1a86434c2e35'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '1d961ece-56bb-4339-8cc7-766698e3ccce'::uuid, 'clasificar', $pea0$Clasificá cada conducta durante un examen online según el tipo de falta.$pea0$, $pea0$Las leves dificultan la auditoría (voz alta, teclado, auriculares, mirada). Las graves suponen ayuda externa o materiales. Ser reemplazado por otra persona es muy grave.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '4434f5d7-adf9-4696-8f1e-1bf7ad66bc32'::uuid, $pea0${"columnas":["Leve","Grave","Muy grave"]}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '4434f5d7-adf9-4696-8f1e-1bf7ad66bc32'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '2594b0a0-0047-4677-845e-19307b8d00ef'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '1d961ece-56bb-4339-8cc7-766698e3ccce'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '2594b0a0-0047-4677-845e-19307b8d00ef'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '1d961ece-56bb-4339-8cc7-766698e3ccce'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('0c32d29a-b569-4ecf-8f1b-c52006cb13c3'::uuid, $pea0$Leer en voz alta las consignas$pea0$, false, 1, null, null::int, $pea0$Leve$pea0$),
  ('b09076de-3992-41a6-86f1-3d2e0963bfcd'::uuid, $pea0$Usar auriculares$pea0$, false, 2, null, null::int, $pea0$Leve$pea0$),
  ('6cbdf86b-1695-43a9-8af3-e433346390e2'::uuid, $pea0$Que se escuche otra voz en la habitación$pea0$, false, 3, null, null::int, $pea0$Grave$pea0$),
  ('09e7fc98-2a0b-4fae-8f6f-0ca8b85da2ae'::uuid, $pea0$Usar el celular$pea0$, false, 4, null, null::int, $pea0$Grave$pea0$),
  ('3f465e6b-9b51-4732-8a70-76e53cf93ee8'::uuid, $pea0$Ausentarse más de 30 segundos sin aviso$pea0$, false, 5, null, null::int, $pea0$Grave$pea0$),
  ('6ad164ad-2f86-4f53-8255-c35ccfe1be3e'::uuid, $pea0$Que otra persona rinda en su lugar$pea0$, false, 6, null, null::int, $pea0$Muy grave$pea0$)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '1d961ece-56bb-4339-8cc7-766698e3ccce'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'a93eda91-62ea-4c21-8090-8636b6efb64e'::uuid, 'verdadero_falso', $pea0$El llamado de atención queda registrado en el certificado analítico.$pea0$, $pea0$El llamado de atención consta solo en el legajo. Las demás sanciones quedan en el analítico.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '4434f5d7-adf9-4696-8f1e-1bf7ad66bc32'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '4434f5d7-adf9-4696-8f1e-1bf7ad66bc32'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '2594b0a0-0047-4677-845e-19307b8d00ef'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'a93eda91-62ea-4c21-8090-8636b6efb64e'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '2594b0a0-0047-4677-845e-19307b8d00ef'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'a93eda91-62ea-4c21-8090-8636b6efb64e'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('2a477e1b-8f0d-44bb-883a-12ba3c5d1939'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('6dbf4209-91f8-4d9a-8630-5cc2eceabd50'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'a93eda91-62ea-4c21-8090-8636b6efb64e'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '20292778-d608-4f42-8e8c-13f8a66040dd'::uuid, 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid, 28, $pea0$Condiciones para la graduación$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Natalia","canal":"whatsapp","consulta":"Hola! Estoy terminando la carrera. ¿Qué me falta para recibirme? ¿Tengo que hacer un trabajo final?"},{"tipo":"preguntar","opciones":[{"texto":"¿Es una carrera de grado o de pregrado?","clave":true,"porque":"En grado es el TFG con defensa; en pregrado, Integración Profesional - Estudio del Caso."},{"texto":"¿Cuándo regularizó Seminario Final?","clave":true,"porque":"El TFG se aprueba en hasta 18 meses desde ahí."},{"texto":"¿Sabe que las citas van con normas APA?","clave":true,"porque":"Omitirlas es una falta por plagio."},{"texto":"¿Qué tema le gustaría investigar?","clave":false,"porque":"No cambia los requisitos."}]},{"tipo":"idea","titulo":"La evaluación integral","texto":"Para egresar hay una evaluación integral: en pregrado, la materia Integración Profesional - Estudio del Caso; en grado, el Trabajo Final de Graduación (TFG) con defensa oral.","clave":"Grado: TFG con defensa. Pregrado: Integración Profesional - Estudio del Caso."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"18 meses para el TFG","texto":"En grado, el TFG se aprueba en un máximo de 18 meses desde que regulariza Seminario Final; si no, queda Libre en Seminario Final y tiene que recursarla.","clave":"TFG: hasta 18 meses desde que regulariza Seminario Final.","ejemplo":"Si Natalia regularizó Seminario Final, desde ahí corren sus 18 meses."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Citas con APA","texto":"En todos los casos las citas van con normas APA: omitirlas es una falta por plagio, no un error de formato.","clave":"Sin citas APA, hay plagio."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Después del egreso siguen el trámite del título (tasa y emisión en hasta 120 días corridos con el legajo completo) y la colación: son otros trámites."},{"tipo":"cierre","resolucion":"A Natalia le explicás que, en grado, para egresar tiene que aprobar el Trabajo Final de Graduación con defensa oral, dentro de los 18 meses desde que regulariza Seminario Final, y que las citas van con normas APA: omitirlas es plagio.","recordar":"Grado: TFG con defensa en 18 meses; citas con APA."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-12-1-condiciones-para-la-graduacion$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '20292778-d608-4f42-8e8c-13f8a66040dd'::uuid and id not in ('5bf6758d-c69c-4aae-8d01-435c43d5ab12'::uuid, 'e99490cd-5a26-45c7-8b38-aabea1d54cc3'::uuid, '53b4d64a-e17a-4548-8431-f9203dbf4d89'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '5bf6758d-c69c-4aae-8d01-435c43d5ab12'::uuid, 'opcion_multiple', $pea0$Gonzalo cursa una carrera de grado en EDH. Regularizó Seminario Final hace 20 meses y todavía no aprobó el TFG. Quiere saber si puede seguir con el mismo trabajo. ¿Qué le decís?$pea0$, $pea0$En grado, el TFG se aprueba dentro de los 18 meses de regularizar Seminario Final. Si no, queda Libre y hay que hacer un TFG nuevo.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '20292778-d608-4f42-8e8c-13f8a66040dd'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '20292778-d608-4f42-8e8c-13f8a66040dd'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '5bf6758d-c69c-4aae-8d01-435c43d5ab12'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '5bf6758d-c69c-4aae-8d01-435c43d5ab12'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('b3d6bdff-9fb7-4314-806f-2834b8691c97'::uuid, $pea0$Que sí, que pida una prórroga de la regularidad.$pea0$, false, 1, $pea0$El plazo de 18 meses no tiene prórroga.$pea0$, null::int, null),
  ('7f359767-867d-4592-8cb6-3caf7a85024b'::uuid, $pea0$Que no: pasaron los 18 meses, queda Libre en Seminario Final y tiene que recursarla para hacer un nuevo TFG.$pea0$, true, 2, $pea0$Es la regla del plazo máximo.$pea0$, null::int, null),
  ('49d0077a-97ce-4fb9-85d3-b83f2060cfe8'::uuid, $pea0$Que sí, siempre que tenga el EFIP II aprobado.$pea0$, false, 3, $pea0$El EFIP II no extiende el plazo del TFG.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '5bf6758d-c69c-4aae-8d01-435c43d5ab12'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'e99490cd-5a26-45c7-8b38-aabea1d54cc3'::uuid, 'opcion_multiple', $pea0$Carla estudia una tecnicatura a distancia y pregunta cómo es su trabajo final. ¿Qué le decís?$pea0$, $pea0$Para egresar siempre hay una evaluación integral: en pregrado, Integración Profesional - Estudio del Caso; en grado, el TFG con defensa oral.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '20292778-d608-4f42-8e8c-13f8a66040dd'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '20292778-d608-4f42-8e8c-13f8a66040dd'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'e99490cd-5a26-45c7-8b38-aabea1d54cc3'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'e99490cd-5a26-45c7-8b38-aabea1d54cc3'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('638f3f4c-8e99-439d-86e0-60b05108559e'::uuid, $pea0$Que hace un TFG con defensa oral, como en grado.$pea0$, false, 1, $pea0$El TFG con defensa oral es de las carreras de grado.$pea0$, null::int, null),
  ('b3278753-1e9e-4e15-8e75-41295a29cbd7'::uuid, $pea0$Que su instancia final es la materia Integración Profesional - Estudio del Caso.$pea0$, true, 2, $pea0$Es la evaluación integral del pregrado.$pea0$, null::int, null),
  ('8e9e22d5-8294-4ea9-884f-c42d3ebea061'::uuid, $pea0$Que en pregrado no hay ninguna instancia final integral.$pea0$, false, 3, $pea0$Todas las carreras tienen una evaluación integral para egresar.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'e99490cd-5a26-45c7-8b38-aabea1d54cc3'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '53b4d64a-e17a-4548-8431-f9203dbf4d89'::uuid, 'verdadero_falso', $pea0$En el trabajo final, no citar con normas APA es solo un error de formato y no tiene sanción.$pea0$, $pea0$Omitir las citas APA es una falta pasible de sanción, según el régimen de plagio.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '20292778-d608-4f42-8e8c-13f8a66040dd'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '20292778-d608-4f42-8e8c-13f8a66040dd'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '53b4d64a-e17a-4548-8431-f9203dbf4d89'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '53b4d64a-e17a-4548-8431-f9203dbf4d89'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('ebf0b377-9cf0-4c6e-8b52-cca9670a4b89'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('17bbcea3-1692-4441-8266-09c433571a14'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '53b4d64a-e17a-4548-8431-f9203dbf4d89'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '9ed54b62-6be5-44f2-897d-871d98de3293'::uuid, 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid, 29, $pea0$Trabajo Final de Graduación (TFG)$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Pilar","canal":"whatsapp","consulta":"Hola! Ya regularicé Seminario Final. ¿Qué sigue ahora para defender?"},{"tipo":"preguntar","opciones":[{"texto":"¿Ya le asignaron una CAE?","clave":true,"porque":"La CAE evalúa el TFG en 60 días corridos."},{"texto":"¿Tiene el visado del analítico y, en ED o EDH, el EFIP II aprobado?","clave":true,"porque":"Son requisitos para la Defensa Oral."},{"texto":"¿Es un ciclo de complementación?","clave":true,"porque":"En los ciclos no se pide el EFIP II."},{"texto":"¿Hizo el TFG con un compañero?","clave":false,"porque":"No hace falta preguntarlo: el TFG es individual."}]},{"tipo":"idea","titulo":"Tres etapas","texto":"El TFG tiene 3 etapas: Seminario Final, Comisión Académica Evaluadora (CAE) y Defensa Oral. En distancia, Seminario Final se regulariza cumpliendo las entregas de avance del tutor, sin prórrogas.","clave":"Seminario Final, CAE y Defensa Oral; sin prórrogas."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"La CAE","texto":"La CAE evalúa el TFG en 60 días corridos: puede habilitar la defensa, pedir ajustes con un plazo o no aprobarlo. Si pide ajustes, el alumno recibe un acta rúbrica con las recomendaciones y el plazo para entregar el trabajo ajustado.","clave":"CAE: 60 días corridos; si pide ajustes, acta rúbrica con plazo.","ejemplo":"Pilar ya regularizó: ahora le asignan una CAE."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"La Defensa Oral","texto":"Habilitado, se inscribe a la mesa de Defensa Oral en un máximo de 30 días corridos. Necesita el visado del analítico y, en ED y EDH, el EFIP II aprobado (salvo en los ciclos de complementación). La nota final pondera Seminario Final, CAE y defensa; con menos de 4 se recursa Seminario Final.","clave":"Defensa: inscripción en 30 días, con visado y EFIP II (salvo ciclos)."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"No hay prórrogas para las entregas de avance de Seminario Final, y el TFG es individual."},{"tipo":"cierre","resolucion":"A Pilar le explicás que ahora le asignan una CAE, que evalúa su trabajo en 60 días corridos. Si la habilita, tiene 30 días corridos para inscribirse a la Defensa Oral, con el visado del analítico y el EFIP II aprobado.","recordar":"Seminario Final, CAE en 60 días y Defensa con inscripción en 30 días."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$rg-12-2-trabajo-final-de-graduacion$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '9ed54b62-6be5-44f2-897d-871d98de3293'::uuid and id not in ('0146e795-39b5-4d65-8b4f-3ef76d6ee451'::uuid, '2d9ca37e-5a12-46e1-8093-72726e5cfbe8'::uuid, '2c8d2508-72a4-4863-8a24-1a9ed0699e73'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '0146e795-39b5-4d65-8b4f-3ef76d6ee451'::uuid, 'ordenar', $pea0$Ordená el recorrido de un alumno de ED desde Seminario Final hasta la nota del TFG.$pea0$, $pea0$Las etapas son Seminario Final, CAE y Defensa Oral. Cada paso tiene un plazo, y no hay prórrogas.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '9ed54b62-6be5-44f2-897d-871d98de3293'::uuid, null, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '9ed54b62-6be5-44f2-897d-871d98de3293'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '0146e795-39b5-4d65-8b4f-3ef76d6ee451'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '0146e795-39b5-4d65-8b4f-3ef76d6ee451'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('bd36c162-b281-4a3f-83ea-3c0248fe7e5c'::uuid, $pea0$Regulariza Seminario Final cumpliendo las entregas de avance.$pea0$, false, 1, null, 1::int, null),
  ('2fbaa871-d933-4eb8-8303-36ed647005ee'::uuid, $pea0$La CAE evalúa el TFG dentro de los 60 días corridos.$pea0$, false, 2, null, 2::int, null),
  ('b8069f0c-7d7d-4023-81b9-c057d5460a2d'::uuid, $pea0$Habilitado a defensa, se inscribe a la mesa de Defensa Oral dentro de los 30 días corridos.$pea0$, false, 3, null, 3::int, null),
  ('032a7233-5b74-4ccc-8ef8-9de407ce4053'::uuid, $pea0$Rinde la Defensa Oral y recibe la nota ponderada con la de Seminario Final y la CAE.$pea0$, false, 4, null, 4::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '0146e795-39b5-4d65-8b4f-3ef76d6ee451'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '2d9ca37e-5a12-46e1-8093-72726e5cfbe8'::uuid, 'opcion_multiple', $pea0$Julián cursa ED y recibió de la CAE un acta rúbrica con ajustes para su TFG. Pregunta qué pasa si no los entrega a tiempo. ¿Qué le decís?$pea0$, $pea0$Si la CAE pide ajustes, hay que entregarlos dentro del plazo y respondiendo a lo pedido. Si no, se desaprueba Seminario Final.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '9ed54b62-6be5-44f2-897d-871d98de3293'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '9ed54b62-6be5-44f2-897d-871d98de3293'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '2d9ca37e-5a12-46e1-8093-72726e5cfbe8'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '2d9ca37e-5a12-46e1-8093-72726e5cfbe8'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('94f9fcd8-b523-4593-8b03-33da05ab13b3'::uuid, $pea0$Que le pida una prórroga al tutor de Seminario Final.$pea0$, false, 1, $pea0$La fuente no prevé prórrogas para la entrega ajustada.$pea0$, null::int, null),
  ('bc503d25-0bed-4b00-872a-4e7e56aa7f91'::uuid, $pea0$Que si no entrega dentro del plazo (30 días corridos) o no responde a lo pedido, Seminario Final queda desaprobado y tiene que recursarla con un nuevo TFG.$pea0$, true, 2, $pea0$Es la consecuencia prevista.$pea0$, null::int, null),
  ('f60dc8b9-6de7-4a8b-87a6-96d71d4d16ce'::uuid, $pea0$Que pasa igual a la defensa, con una nota más baja.$pea0$, false, 3, $pea0$Sin los ajustes no queda habilitado a la defensa.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '2d9ca37e-5a12-46e1-8093-72726e5cfbe8'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '2c8d2508-72a4-4863-8a24-1a9ed0699e73'::uuid, 'opcion_multiple', $pea0$Rocío cursa una carrera de grado en EDH (no es un ciclo de complementación). Fue habilitada a Defensa Oral pero todavía no aprobó el EFIP II. ¿Puede rendir la defensa?$pea0$, $pea0$En ED y EDH, sin el EFIP II aprobado no hay Defensa Oral. La excepción son los ciclos de complementación.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '9ed54b62-6be5-44f2-897d-871d98de3293'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '9ed54b62-6be5-44f2-897d-871d98de3293'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '2c8d2508-72a4-4863-8a24-1a9ed0699e73'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '2c8d2508-72a4-4863-8a24-1a9ed0699e73'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('5466cd8a-4751-4a9c-8ba3-be6b6c3048a9'::uuid, $pea0$Sí: el EFIP II se rinde después de la defensa.$pea0$, false, 1, $pea0$El EFIP II es requisito previo de la defensa.$pea0$, null::int, null),
  ('b5325603-3f3f-47be-8555-c87f521b98f0'::uuid, $pea0$Sí, si tiene todas las materias aprobadas.$pea0$, false, 2, $pea0$Las materias aprobadas no reemplazan al EFIP II.$pea0$, null::int, null),
  ('8e770297-538e-4de4-8640-ad0001642ed2'::uuid, $pea0$No: en ED/EDH necesita el EFIP II aprobado, además del visado del analítico.$pea0$, true, 3, $pea0$Son condiciones para la Defensa Oral.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '2c8d2508-72a4-4863-8a24-1a9ed0699e73'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'c886f8d7-6dbe-4f3d-8e48-129e52eaf434'::uuid, '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid, 30, $pea0$Portal de Estudiantes$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Kevin","canal":"whatsapp","consulta":"Hola, no puedo entrar al portal, me da error. ¿Qué hago?"},{"tipo":"preguntar","opciones":[{"texto":"¿Con qué usuario está entrando?","clave":true,"porque":"Se entra con la cuenta institucional: usuario@soysiglo.21.edu.ar."},{"texto":"¿Probó borrar cookies y caché, u otro navegador?","clave":true,"porque":"Es lo primero cuando da error al entrar."},{"texto":"¿Es ingresante y le llegaron los datos de acceso?","clave":true,"porque":"Llegan al mail que informó al inscribirse y pueden demorar hasta 48 hs hábiles."},{"texto":"¿Qué celular tiene?","clave":false,"porque":"No cambia los pasos para entrar."}]},{"tipo":"idea","titulo":"Cómo se entra","texto":"Se entra con la cuenta institucional: usuario@soysiglo.21.edu.ar y su contraseña. A los ingresantes, los datos de acceso les llegan al mail que informaron al inscribirse: que revisen el correo no deseado y tengan en cuenta que pueden demorar hasta 48 hs hábiles.","clave":"Usuario institucional; los ingresantes reciben los datos por mail (hasta 48 hs hábiles)."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Si da error","texto":"Si da error al entrar: que borre las cookies y la caché del navegador y vuelva a intentar; si sigue, que pruebe otro navegador o una ventana de incógnito. Si olvidó la contraseña, la restablece desde el portal: el usuario va sin el dominio y el enlace llega al mail personal registrado.","clave":"Borrar cookies y caché, otro navegador o incógnito.","ejemplo":"Antes que nada, a Kevin le pedís que borre cookies y caché."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Qué se hace en el Portal","texto":"En el Portal ve su carrera y su avance, se inscribe a materias y exámenes, paga por ePagos y usa el simulador de pagos. En \"Más opciones\" hay una guía del portal, cambio de contraseña y datos de contacto.","clave":"Carrera, inscripciones, pagos y simulador, todo en el Portal."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"El simulador de pagos es estimativo: la estimación vale 24 hs y los descuentos y becas pueden variar."},{"tipo":"cierre","resolucion":"A Kevin le explicás que borre las cookies y la caché del navegador y vuelva a intentar, y si sigue, que pruebe otro navegador o una ventana de incógnito. Que entre con su usuario institucional (usuario@soysiglo.21.edu.ar) y, si olvidó la contraseña, que la restablezca desde el portal.","recordar":"Error al entrar: cookies y caché, otro navegador o incógnito."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-portal-de-estudiantes$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'c886f8d7-6dbe-4f3d-8e48-129e52eaf434'::uuid and id not in ('df467d01-3f9f-40ca-8005-d511d4203049'::uuid, 'acf420a9-cdad-433e-8888-0658b4d80928'::uuid, 'a1f26b77-a60b-4611-899e-2edaf689e1eb'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'df467d01-3f9f-40ca-8005-d511d4203049'::uuid, 'opcion_multiple', $pea0$Bruno es ingresante, se inscribió hace un día hábil y dice que nunca le llegaron los datos para entrar al Portal. ¿Qué le decís?$pea0$, $pea0$A los ingresantes los datos de acceso les llegan al mail informado al inscribirse. Hay que revisar el correo no deseado y tener en cuenta que puede demorar 48 hs hábiles.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c886f8d7-6dbe-4f3d-8e48-129e52eaf434'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'c886f8d7-6dbe-4f3d-8e48-129e52eaf434'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'df467d01-3f9f-40ca-8005-d511d4203049'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'df467d01-3f9f-40ca-8005-d511d4203049'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('b84b0ee7-4071-4121-81d2-b7c490d465d5'::uuid, $pea0$Que entre con su DNI como usuario.$pea0$, false, 1, $pea0$Se entra con la cuenta institucional, no con el DNI.$pea0$, null::int, null),
  ('97e98095-0cb2-4cfd-8ab2-1b286ab36606'::uuid, $pea0$Que restablezca la contraseña desde el portal.$pea0$, false, 2, $pea0$Sin haber recibido todavía el usuario, primero hay que verificar el correo.$pea0$, null::int, null),
  ('f752d813-87d3-4af6-8108-7990a3df6e1f'::uuid, $pea0$Que revise el correo no deseado del mail que informó al inscribirse, y que puede demorar hasta 48 hs hábiles.$pea0$, true, 3, $pea0$Es lo que indica la guía para ingresantes.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'df467d01-3f9f-40ca-8005-d511d4203049'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'acf420a9-cdad-433e-8888-0658b4d80928'::uuid, 'ordenar', $pea0$Ordená los pasos para recuperar la contraseña del Portal de Estudiantes.$pea0$, $pea0$El usuario va sin el dominio, y el mail de recuperación es el personal registrado en el portal.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c886f8d7-6dbe-4f3d-8e48-129e52eaf434'::uuid, null, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'c886f8d7-6dbe-4f3d-8e48-129e52eaf434'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'acf420a9-cdad-433e-8888-0658b4d80928'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'acf420a9-cdad-433e-8888-0658b4d80928'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('ed5f943a-6d45-44d0-8b9e-30cd0c250b6f'::uuid, $pea0$Hacer clic en "Si no conocés o si olvidaste tu contraseña, podés restablecerla desde aquí".$pea0$, false, 1, null, 1::int, null),
  ('08406a22-14cc-43a3-848a-f9e82f5b0183'::uuid, $pea0$Escribir el usuario institucional sin @soysiglo.21.edu.ar.$pea0$, false, 2, null, 2::int, null),
  ('cefd33f2-2f75-4279-8c7e-f74b1ec2ac34'::uuid, $pea0$Confirmar el correo de recuperación (el mail personal registrado) y hacer clic en "Enviar contraseña".$pea0$, false, 3, null, 3::int, null),
  ('ac6172bd-99d7-4fe8-88c5-530af5187919'::uuid, $pea0$Seguir el enlace del mail que llega y crear una nueva clave.$pea0$, false, 4, null, 4::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'acf420a9-cdad-433e-8888-0658b4d80928'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'a1f26b77-a60b-4611-899e-2edaf689e1eb'::uuid, 'opcion_multiple', $pea0$Lara usó ayer el simulador de precios y hoy, al pagar, ve otro monto. Cree que hay un error. ¿Qué le decís?$pea0$, $pea0$El simulador sirve para estimar gastos: los precios pueden variar, y la estimación tiene una vigencia de 24 hs.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c886f8d7-6dbe-4f3d-8e48-129e52eaf434'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'c886f8d7-6dbe-4f3d-8e48-129e52eaf434'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'a1f26b77-a60b-4611-899e-2edaf689e1eb'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'a1f26b77-a60b-4611-899e-2edaf689e1eb'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('73f81558-7c6e-464a-8ce5-ccd9d457eb24'::uuid, $pea0$Que el simulador da un precio fijo y tiene que reclamar la diferencia.$pea0$, false, 1, $pea0$El simulador no garantiza el precio.$pea0$, null::int, null),
  ('1d109db7-85be-4678-8ba2-b55fa8792dd1'::uuid, $pea0$Que el simulador es estimativo, que la estimación vale 24 hs y que los descuentos y becas pueden variar.$pea0$, true, 2, $pea0$Es lo que aclara la guía del portal.$pea0$, null::int, null),
  ('f565c580-78f7-4030-8e92-5f8ddc007230'::uuid, $pea0$Que es un error de ePagos y tiene que pagar igual el monto de ayer.$pea0$, false, 3, $pea0$No hay error: el monto del simulador era una estimación.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'a1f26b77-a60b-4611-899e-2edaf689e1eb'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'd36cf7d1-c546-495d-8749-ea007754750c'::uuid, '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid, 31, $pea0$Aula Virtual (Canvas)$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Ailén","canal":"telefono","consulta":"Hola, olvidé la contraseña del aula virtual y tengo que entregar un TP hoy. ¿Cómo la recupero?"},{"tipo":"preguntar","opciones":[{"texto":"¿Cómo escribe el usuario en la pantalla de recuperación?","clave":true,"porque":"Va sin el @soysiglo.21.edu.ar."},{"texto":"¿El mail personal registrado en el Portal está actualizado?","clave":true,"porque":"La nueva clave llega a ese mail."},{"texto":"¿Revisó el correo no deseado?","clave":true,"porque":"Es donde suele quedar el mail de recuperación."},{"texto":"¿Qué materia tiene que entregar?","clave":false,"porque":"No cambia cómo recupera la clave."}]},{"tipo":"idea","titulo":"El aula es Canvas","texto":"El Aula Virtual es Canvas: ahí están las materias, se presentan las actividades y se contacta al docente. Se entra eligiendo Soy Estudiante y la cuenta institucional.","clave":"Canvas: se entra con Soy Estudiante y la cuenta institucional."},{"tipo":"idea","titulo":"Recuperar la contraseña","texto":"Si olvidó la contraseña, la restablece desde el enlace de recuperación, con su usuario sin @soysiglo.21.edu.ar. La nueva clave llega al mail personal registrado en el Portal de Estudiantes: si ese mail está viejo, que lo actualice primero.","clave":"Usuario sin el dominio; la clave llega al mail personal registrado.","ejemplo":"Si Ailén escribe el correo completo, la recuperación no funciona."},{"tipo":"probalo","n":1},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Las dudas de la materia","texto":"Las dudas de contenido de cada materia van al docente, por la mensajería del Aula Virtual.","clave":"Dudas de contenido: al docente, por la mensajería del aula."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Si el mail personal registrado en el Portal está viejo, la clave nueva nunca le va a llegar: que lo actualice antes de pedir la recuperación."},{"tipo":"cierre","resolucion":"A Ailén le explicás que entre al enlace de recuperación y escriba su usuario sin @soysiglo.21.edu.ar. La nueva clave le llega al mail personal registrado en el Portal de Estudiantes; si ese mail está viejo, que lo actualice primero.","recordar":"Usuario sin dominio; la clave llega al mail personal del Portal."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-aula-virtual$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'd36cf7d1-c546-495d-8749-ea007754750c'::uuid and id not in ('9b6c1d17-3db5-4d0b-839f-9928199ef12f'::uuid, '1d98327f-f4d9-4a89-8b27-15b314168fed'::uuid, 'f30ce66a-708b-4b72-8cea-dbc53bfe2b0f'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '9b6c1d17-3db5-4d0b-839f-9928199ef12f'::uuid, 'opcion_multiple', $pea0$Martín (EDH) llama porque no puede recuperar la contraseña del aula: en la pantalla de recuperación escribió su correo institucional completo, N.PEREZ@soysiglo.21.edu.ar. ¿Qué le decís?$pea0$, $pea0$Para iniciar sesión se usa el correo institucional completo; para recuperar la clave, el usuario sin @soysiglo.21.edu.ar.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd36cf7d1-c546-495d-8749-ea007754750c'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'd36cf7d1-c546-495d-8749-ea007754750c'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '9b6c1d17-3db5-4d0b-839f-9928199ef12f'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '9b6c1d17-3db5-4d0b-839f-9928199ef12f'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('972dad70-a639-4a97-81e5-99550bb86268'::uuid, $pea0$Que pida un usuario nuevo por Consulta Alumnos.$pea0$, false, 1, $pea0$No hace falta un usuario nuevo: el problema es cómo lo está escribiendo.$pea0$, null::int, null),
  ('49bf06f3-2f76-4785-8a39-4622a528bdce'::uuid, $pea0$Que escriba solo N.PEREZ, sin el @soysiglo.21.edu.ar, y confirme su correo de recuperación.$pea0$, true, 2, $pea0$La recuperación pide el usuario sin el dominio; después se confirma el mail de recuperación.$pea0$, null::int, null),
  ('3610a6ad-2cb7-49e2-8aa9-b5f34e9c1a32'::uuid, $pea0$Que escriba su DNI en lugar del usuario.$pea0$, false, 3, $pea0$La recuperación de Canvas no usa el DNI sino el usuario institucional.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '9b6c1d17-3db5-4d0b-839f-9928199ef12f'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '1d98327f-f4d9-4a89-8b27-15b314168fed'::uuid, 'opcion_multiple', $pea0$Sofía (ED) ya pidió restablecer la clave del aula, pero dice que el mail nunca le llegó. ¿Qué revisás primero con ella?$pea0$, $pea0$La nueva clave se genera desde el mail personal registrado en el Portal de Estudiantes: si está desactualizado, no le va a llegar.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd36cf7d1-c546-495d-8749-ea007754750c'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'd36cf7d1-c546-495d-8749-ea007754750c'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '1d98327f-f4d9-4a89-8b27-15b314168fed'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '1d98327f-f4d9-4a89-8b27-15b314168fed'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('e260bc48-1466-4742-8580-a650b5279b7a'::uuid, $pea0$Que mire la casilla del correo institucional.$pea0$, false, 1, $pea0$Si no puede entrar con la clave, tampoco puede leer el correo institucional: el envío va a otro mail.$pea0$, null::int, null),
  ('ee59d077-9d02-45f2-8388-8a594e78903d'::uuid, $pea0$Que le escriba al docente por la mensajería de Canvas.$pea0$, false, 2, $pea0$El docente no gestiona claves y, además, ella no puede entrar al aula.$pea0$, null::int, null),
  ('4b7917c7-1e19-4b42-8666-35d913316690'::uuid, $pea0$Qué mail personal tiene registrado en el Portal de Estudiantes, porque ahí llega la recuperación.$pea0$, true, 3, $pea0$El correo de recuperación es el mail personal registrado en el Portal.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '1d98327f-f4d9-4a89-8b27-15b314168fed'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'f30ce66a-708b-4b72-8cea-dbc53bfe2b0f'::uuid, 'opcion_multiple', $pea0$Lucas (EDH) pregunta cómo escribirle al profesor por una duda del TP. ¿Qué le indicás?$pea0$, $pea0$Las consultas al docente van por la Bandeja de Entrada de Canvas, con asunto específico y firma con nombre completo y DNI.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd36cf7d1-c546-495d-8749-ea007754750c'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'd36cf7d1-c546-495d-8749-ea007754750c'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'f30ce66a-708b-4b72-8cea-dbc53bfe2b0f'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'f30ce66a-708b-4b72-8cea-dbc53bfe2b0f'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('d297d76b-e02a-4be8-83be-8312a3fe6cfb'::uuid, $pea0$Que mande un mail al CAU para que se lo reenvíen.$pea0$, false, 1, $pea0$El CAU no intermedia consultas de contenido: van directo al docente.$pea0$, null::int, null),
  ('7acae9d9-5565-49d4-8dba-14b9e7b6951c'::uuid, $pea0$Bandeja de Entrada de Canvas, Redactar: elige la materia y al profesor, pone un asunto claro y firma con nombre completo y DNI.$pea0$, true, 2, $pea0$Es el procedimiento que indica la guía del Aula Virtual.$pea0$, null::int, null),
  ('af5ba26c-9c0d-46d0-8588-52e403d7e3b8'::uuid, $pea0$Que lo pregunte en el foro de la materia.$pea0$, false, 3, $pea0$Los foros son para trabajo colaborativo con compañeros, no el canal de consulta al docente.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'f30ce66a-708b-4b72-8cea-dbc53bfe2b0f'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '3ff5fecf-dfe1-40b9-8105-6c44641d758e'::uuid, '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid, 32, $pea0$Exámenes online con Klarway$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Ludmila","canal":"whatsapp","consulta":"Hola! El jueves rindo mi primer parcial online. ¿Lo puedo hacer desde el celular? ¿Qué tengo que preparar?"},{"tipo":"preguntar","opciones":[{"texto":"¿Ya se registró en Klarway?","clave":true,"porque":"El registro se valida en hasta 24 horas hábiles."},{"texto":"¿Con qué equipo va a rendir?","clave":true,"porque":"Klarway es de escritorio: PC y algunas Mac, no celular."},{"texto":"¿Dónde va a rendir?","clave":true,"porque":"Hace falta buena luz, un lugar silencioso y sin auriculares."},{"texto":"¿Qué materia rinde?","clave":false,"porque":"No cambia cómo se usa Klarway."}]},{"tipo":"idea","titulo":"Klarway y el registro","texto":"Los exámenes online se rinden por el SOE (Sistema Online de Exámenes), con la app Klarway: es de escritorio, para PC y algunas Mac, con validación de identidad. Antes hay que registrarse una vez con DNI (digital o físico) o pasaporte, en un lugar iluminado, con fondo liso y sin auriculares. El registro se valida en hasta 24 horas hábiles.","clave":"Klarway en PC o Mac, con registro previo que tarda hasta 24 h hábiles.","ejemplo":"Ludmila no puede rendir desde el celular y tiene que registrarse ya."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"El día del examen","texto":"Al rendir: cerrar los programas, entrar con las credenciales del Portal, validar el rostro y aceptar las condiciones. Conviene buena luz, batería al 80% o cargador, micrófono encendido y un lugar silencioso.","clave":"Programas cerrados, rostro validado, buena luz y micrófono encendido."},{"tipo":"idea","titulo":"Si falla","texto":"Si Klarway falla rindiendo desde casa, que saque una captura del error con fecha y hora visibles y la envíe por Consulta Alumnos, Área Tecnológica, Sistema de Examen. También puede contactar a su CAU.","clave":"Captura con fecha y hora, por Consulta Alumnos, Área Tecnológica."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Una vez iniciado el examen, usar auriculares, bajar el micrófono o tapar la cámara son faltas según el Régimen General de Sanciones, aunque no hable con nadie."},{"tipo":"probalo","n":3},{"tipo":"cierre","resolucion":"A Ludmila le explicás que desde el celular no se puede: Klarway es una app de escritorio para PC y algunas Mac. Que se registre hoy, porque el registro tarda hasta 24 horas hábiles en validarse, y que el jueves rinda con buena luz, el micrófono encendido y sin auriculares.","recordar":"Klarway en PC o Mac, registrado con 24 h hábiles de anticipación."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-klarway$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '3ff5fecf-dfe1-40b9-8105-6c44641d758e'::uuid and id not in ('4239eb9f-3b8f-485f-84ff-d4f0c8383322'::uuid, 'd8449da0-d8fa-48f7-8fb7-f4378449bb12'::uuid, '63116713-017d-47bf-878e-9bf15e47aef2'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '4239eb9f-3b8f-485f-84ff-d4f0c8383322'::uuid, 'opcion_multiple', $pea0$Valentina (EDH) rinde su primer parcial online pasado mañana y todavía no se registró en Klarway. ¿Qué le decís?$pea0$, $pea0$Sin registro aprobado no se puede rendir. Conviene hacerlo con anticipación porque la validación puede demorar.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3ff5fecf-dfe1-40b9-8105-6c44641d758e'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '3ff5fecf-dfe1-40b9-8105-6c44641d758e'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '4239eb9f-3b8f-485f-84ff-d4f0c8383322'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '4239eb9f-3b8f-485f-84ff-d4f0c8383322'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('6f069635-fc99-49c7-8cf2-c5e42fa19b58'::uuid, $pea0$Que se registre el mismo día, unos minutos antes de rendir.$pea0$, false, 1, $pea0$La validación del registro puede demorar hasta 24 horas hábiles: si lo deja para último momento, puede no estar aprobado.$pea0$, null::int, null),
  ('a9227629-7986-4066-8ef2-6f53561a6a33'::uuid, $pea0$Que se registre ya, con su DNI o pasaporte, en un lugar iluminado, fondo liso y sin auriculares, y verifique que el registro quede aprobado.$pea0$, true, 2, $pea0$El registro se hace una vez, antes de rendir, y puede quedar en revisión hasta 24 horas hábiles.$pea0$, null::int, null),
  ('db9d1715-c3f7-420a-8e3c-9915452ea50d'::uuid, $pea0$Que no hace falta: se registra automáticamente al entrar al examen.$pea0$, false, 3, $pea0$El empadronamiento es un paso previo obligatorio para validar la identidad.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '4239eb9f-3b8f-485f-84ff-d4f0c8383322'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'd8449da0-d8fa-48f7-8fb7-f4378449bb12'::uuid, 'opcion_multiple', $pea0$Tomás (ED) rindió en su casa y Klarway se colgó a mitad del parcial. Llama al CAU. ¿Qué le indicás?$pea0$, $pea0$Si rindió en su casa, el error se reporta con una captura que muestre día y hora, por Consulta Alumnos (Área Tecnológica, Sistema de Examen).$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3ff5fecf-dfe1-40b9-8105-6c44641d758e'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '3ff5fecf-dfe1-40b9-8105-6c44641d758e'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'd8449da0-d8fa-48f7-8fb7-f4378449bb12'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'd8449da0-d8fa-48f7-8fb7-f4378449bb12'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('2187a6ae-0b0d-4ddb-8697-2e064be4ce13'::uuid, $pea0$Que se inscriba de nuevo al parcial en el Portal para otra fecha.$pea0$, false, 1, $pea0$No se reprograma por inscripción. Primero hay que reportar el error con evidencia.$pea0$, null::int, null),
  ('c9a56592-bc74-4e1d-88d5-cd4d38ed863a'::uuid, $pea0$Que le escriba al docente por Canvas explicando lo que pasó.$pea0$, false, 2, $pea0$El canal para fallas del sistema de examen es Consulta Alumnos, Área Tecnológica.$pea0$, null::int, null),
  ('27a6163f-35d3-47b7-82fc-0ef61e7136f8'::uuid, $pea0$Que mande una captura del error, con día y hora visibles, por Consulta Alumnos > Área Tecnológica > Sistema de Examen.$pea0$, true, 3, $pea0$Es el procedimiento indicado cuando se rinde desde el hogar.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'd8449da0-d8fa-48f7-8fb7-f4378449bb12'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '63116713-017d-47bf-878e-9bf15e47aef2'::uuid, 'verdadero_falso', $pea0$Si el alumno se pone auriculares durante el examen online pero no habla con nadie, no hay problema.$pea0$, $pea0$El uso de cualquier tipo de auricular una vez iniciado el examen es una falta según el Régimen General de Sanciones.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3ff5fecf-dfe1-40b9-8105-6c44641d758e'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '3ff5fecf-dfe1-40b9-8105-6c44641d758e'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '63116713-017d-47bf-878e-9bf15e47aef2'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '63116713-017d-47bf-878e-9bf15e47aef2'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('a3240920-a128-415f-83a3-79e50de37a63'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('fa69b95f-654b-4a8d-885a-4f6d46eb9fb6'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '63116713-017d-47bf-878e-9bf15e47aef2'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '5862ba03-4027-4188-81b3-64dc1c964e32'::uuid, '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid, 33, $pea0$Canales de contacto$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Melina","canal":"whatsapp","consulta":"Hola! Tengo una duda de un tema de una materia y además quiero dejar un reclamo por escrito. ¿A dónde escribo?"},{"tipo":"preguntar","opciones":[{"texto":"¿La duda es de contenido de una materia?","clave":true,"porque":"Va al docente, por la mensajería del aula."},{"texto":"¿Necesita dejarlo por escrito o resolverlo en el momento?","clave":true,"porque":"Por escrito, Consulta Alumnos; en el momento, el chat con un Asesor Institucional."},{"texto":"¿Tiene más de un legajo?","clave":true,"porque":"En Consultar elige el legajo de la consulta."},{"texto":"¿Desde qué dispositivo escribe?","clave":false,"porque":"No cambia el canal."}]},{"tipo":"idea","titulo":"Dudas de contenido","texto":"Las dudas de contenido de una materia van al docente, por la mensajería del Aula Virtual.","clave":"Contenido de la materia: al docente, por el aula."},{"tipo":"idea","titulo":"Por escrito o en el momento","texto":"Por escrito, en Consulta Alumnos, pestaña Consultar: elige el legajo, el motivo en Título de tipificación, describe el caso y adjunta un archivo si hace falta. La respuesta llega por mail. Si quiere hablar con alguien ahora, puede chatear con un Asesor Institucional.","clave":"Por escrito: Consultar, con respuesta por mail. Ya: chat con un Asesor Institucional.","ejemplo":"El reclamo de Melina va por Consultar, y la respuesta le llega por mail."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Otros contactos","texto":"Los datos de cada CAU están en el mapa de Sedes y Centros, y los directores de carrera tienen su mail publicado. Para contactarse con otros estudiantes, puede sumarse a ComunidadNET.","clave":"Datos del CAU en Sedes y Centros; otros estudiantes, en ComunidadNET."},{"tipo":"probalo","n":1},{"tipo":"ojo","texto":"Una duda de contenido no va a Consulta Alumnos: la resuelve el docente de la materia, por la mensajería del aula."},{"tipo":"cierre","resolucion":"A Melina le explicás que la duda del tema se la escribe al docente por la mensajería del Aula Virtual, y que el reclamo lo deja en Consulta Alumnos, en Consultar, eligiendo el legajo y el motivo; la respuesta le llega por mail.","recordar":"Contenido, al docente; lo demás, por Consultar o el chat."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-canales-de-contacto$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '5862ba03-4027-4188-81b3-64dc1c964e32'::uuid and id not in ('2e99d294-e92f-42fd-8baf-ca7f2734133d'::uuid, 'abd32c2b-1fda-43f2-842e-5283775866da'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '2e99d294-e92f-42fd-8baf-ca7f2734133d'::uuid, 'clasificar', $pea0$Clasificá cada consulta según el canal al que corresponde derivarla.$pea0$, $pea0$Contenido de la materia: docente por Canvas. Gestiones escritas: Consulta Alumnos. Atención inmediata: chat con un Asesor Institucional.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '5862ba03-4027-4188-81b3-64dc1c964e32'::uuid, $pea0${"columnas":["Docente, por mensajería de Canvas","Consulta Alumnos, pestaña Consultar","Chat con un Asesor Institucional","ComunidadNET"]}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '5862ba03-4027-4188-81b3-64dc1c964e32'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '2e99d294-e92f-42fd-8baf-ca7f2734133d'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '2e99d294-e92f-42fd-8baf-ca7f2734133d'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('1f95b85f-369f-484a-8b0c-f76329f0423a'::uuid, $pea0$Duda sobre un tema del módulo 2 de una materia$pea0$, false, 1, null, null::int, $pea0$Docente, por mensajería de Canvas$pea0$),
  ('f5d925fb-2494-4c63-829a-5818b57a2863'::uuid, $pea0$Reclamo que el alumno quiere dejar por escrito con un comprobante adjunto$pea0$, false, 2, null, null::int, $pea0$Consulta Alumnos, pestaña Consultar$pea0$),
  ('941901c4-7ad8-4a3a-869d-416228a6b3a3'::uuid, $pea0$Quiere que alguien lo oriente ahora mismo, en línea$pea0$, false, 3, null, null::int, $pea0$Chat con un Asesor Institucional$pea0$),
  ('fba2645a-0a44-4b62-8dc8-94570005ca67'::uuid, $pea0$No entiende la consigna del TP 3$pea0$, false, 4, null, null::int, $pea0$Docente, por mensajería de Canvas$pea0$),
  ('3c612277-9af1-415e-8c8a-a5be14052494'::uuid, $pea0$Quiere conocer a otros estudiantes de su carrera$pea0$, false, 5, null, null::int, $pea0$ComunidadNET$pea0$)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '2e99d294-e92f-42fd-8baf-ca7f2734133d'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'abd32c2b-1fda-43f2-842e-5283775866da'::uuid, 'opcion_multiple', $pea0$Paula (ED, dos carreras) dejó una consulta escrita ayer y pregunta dónde va a ver la respuesta. ¿Qué le decís?$pea0$, $pea0$La consulta escrita se carga en Consulta Alumnos > Consultar, eligiendo legajo y motivo; la respuesta llega por mail al resolverse.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '5862ba03-4027-4188-81b3-64dc1c964e32'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '5862ba03-4027-4188-81b3-64dc1c964e32'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'abd32c2b-1fda-43f2-842e-5283775866da'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'abd32c2b-1fda-43f2-842e-5283775866da'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('21a9de33-08c5-46ab-852f-9a15db5f6f89'::uuid, $pea0$Que la respuesta aparece en la Bandeja de Entrada de Canvas.$pea0$, false, 1, $pea0$Canvas es para comunicarse con docentes y tutores; la consulta escrita no responde por ahí.$pea0$, null::int, null),
  ('d130384d-391e-4af3-8c51-a9ec63e194c7'::uuid, $pea0$Que le llega por mail cuando el caso se resuelva, y que verifique que la cargó en el legajo correcto.$pea0$, true, 2, $pea0$La fuente indica que la respuesta llega por mail; el legajo elegido define a qué carrera corresponde.$pea0$, null::int, null),
  ('a81c0c77-139d-46c9-828f-e95e08e67e8e'::uuid, $pea0$Que tiene que volver a llamar al CAU para que se la lean.$pea0$, false, 3, $pea0$No hace falta: la respuesta se envía por mail.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'abd32c2b-1fda-43f2-842e-5283775866da'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'acba49f6-9e64-4d80-8562-653a61b4346d'::uuid, '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid, 34, $pea0$Profesores Tutores Virtuales$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Thiago","canal":"whatsapp","consulta":"Hola, soy nuevo y no sé cómo organizarme con las materias. ¿A quién le pregunto?"},{"tipo":"preguntar","opciones":[{"texto":"¿Está en su primer año?","clave":true,"porque":"El Profesor Tutor Virtual acompaña el primer año."},{"texto":"¿La duda es de organización o de contenido de una materia?","clave":true,"porque":"La organización va al tutor; el contenido, al docente."},{"texto":"¿Le sirve un taller de hábitos de estudio?","clave":true,"porque":"Para eso están los Talleres Potenciar 21."},{"texto":"¿Qué nota sacó en el primer TP?","clave":false,"porque":"No cambia a quién acudir."}]},{"tipo":"idea","titulo":"El tutor del primer año","texto":"El Centro de Profesores Tutores Virtuales (CPV) acompaña el primer año: organización, cursado, plataforma y modelo de aprendizaje. Al tutor se le escribe desde la Bandeja de Entrada de Canvas, y también hay consultas por Teams en horarios fijos.","clave":"Primer año: el tutor ayuda con organización, cursado y plataforma.","ejemplo":"A Thiago lo acompaña su Profesor Tutor Virtual."},{"tipo":"idea","titulo":"El contenido, al docente","texto":"Las dudas de contenido de cada materia no van al tutor: van al docente a cargo, por la mensajería de Canvas.","clave":"Contenido de la materia: al docente, no al tutor."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Talleres Potenciar 21","texto":"Los Talleres Potenciar 21 trabajan hábitos de estudio y organización. El cronograma está en los anuncios de cada materia.","clave":"Talleres Potenciar 21: el cronograma está en los anuncios de la materia."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Si le preguntó al tutor una duda de contenido y no se la resolvió, no es un error del tutor: esas dudas van al docente de la materia."},{"tipo":"cierre","resolucion":"A Thiago le explicás que en el primer año lo acompaña su Profesor Tutor Virtual, al que le escribe desde la Bandeja de Entrada de Canvas, y que puede sumarse a los Talleres Potenciar 21, cuyo cronograma está en los anuncios de cada materia.","recordar":"Organización, al tutor; contenido, al docente."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-tutoresvirtuales$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'acba49f6-9e64-4d80-8562-653a61b4346d'::uuid and id not in ('b10eff4a-edce-4a92-81cd-c7aaa6eb5d75'::uuid, '39ccc7a9-d86f-49d0-89a5-ec516b83366b'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'b10eff4a-edce-4a92-81cd-c7aaa6eb5d75'::uuid, 'clasificar', $pea0$Un alumno de primer año (EDH) trae estas dudas. Clasificá a quién le corresponde cada una.$pea0$, $pea0$El tutor acompaña cursado, organización, plataforma y modelo de aprendizaje; el contenido específico de cada materia va al docente.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'acba49f6-9e64-4d80-8562-653a61b4346d'::uuid, $pea0${"columnas":["Profesor Tutor Virtual","Docente a cargo"]}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'acba49f6-9e64-4d80-8562-653a61b4346d'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'b10eff4a-edce-4a92-81cd-c7aaa6eb5d75'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'b10eff4a-edce-4a92-81cd-c7aaa6eb5d75'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('965468cd-bc0c-463b-868e-e07003e0c3b6'::uuid, $pea0$No sabe cómo organizar sus semanas de estudio$pea0$, false, 1, null, null::int, $pea0$Profesor Tutor Virtual$pea0$),
  ('c239c09d-f3c4-4a86-8498-f3742d575c55'::uuid, $pea0$No entiende un concepto de la lectura 2 de la materia$pea0$, false, 2, null, null::int, $pea0$Docente a cargo$pea0$),
  ('b047e5a5-96d4-4808-8dc2-e9e0ab381061'::uuid, $pea0$No encuentra dónde se entregan los TP en Canvas$pea0$, false, 3, null, null::int, $pea0$Profesor Tutor Virtual$pea0$),
  ('8335c3f2-9db6-4a5c-8d95-efb4fffdce31'::uuid, $pea0$Tiene dudas sobre la resolución de un ejercicio del parcial de práctica$pea0$, false, 4, null, null::int, $pea0$Docente a cargo$pea0$),
  ('4225c579-0939-49c8-8d95-2601498eaca4'::uuid, $pea0$No entiende cómo funciona el modelo de aprendizaje de la universidad$pea0$, false, 5, null, null::int, $pea0$Profesor Tutor Virtual$pea0$)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'b10eff4a-edce-4a92-81cd-c7aaa6eb5d75'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '39ccc7a9-d86f-49d0-89a5-ec516b83366b'::uuid, 'opcion_multiple', $pea0$Camila (ED, primer cuatrimestre) quiere sumarse a un taller de hábitos de estudio y a una consulta en vivo con el tutor, pero no sabe cuándo son. ¿Dónde le decís que busque?$pea0$, $pea0$Los Talleres Potenciar 21 y los horarios de consulta por Teams se publican en los anuncios de cada materia en Canvas.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'acba49f6-9e64-4d80-8562-653a61b4346d'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'acba49f6-9e64-4d80-8562-653a61b4346d'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '39ccc7a9-d86f-49d0-89a5-ec516b83366b'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '39ccc7a9-d86f-49d0-89a5-ec516b83366b'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('bd0a59f5-e35c-410b-8c3f-43b97d6a5fe7'::uuid, $pea0$En el Portal de Estudiantes, sección Exámenes.$pea0$, false, 1, $pea0$Ahí se gestionan inscripciones a exámenes, no talleres ni consultas con tutores.$pea0$, null::int, null),
  ('6ec1e189-c357-4ee0-84c6-e90a8ebf1fdb'::uuid, $pea0$En la sección Anuncios de sus materias en Canvas, donde están el cronograma de Potenciar 21 y los horarios de consulta por Teams.$pea0$, true, 2, $pea0$La fuente indica que los anuncios de cada materia tienen ese cronograma.$pea0$, null::int, null),
  ('dcf86099-52db-4a94-8e0a-f04b44a935a2'::uuid, $pea0$Que llame al CAU para que la anoten.$pea0$, false, 3, $pea0$El CAU no gestiona esos espacios; la información está en el aula.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '39ccc7a9-d86f-49d0-89a5-ec516b83366b'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'fa3f849b-6994-4c30-8d5c-0278e45215f7'::uuid, '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid, 35, $pea0$Inscribirse a exámenes en el Portal$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Lisandro","canal":"whatsapp","consulta":"Hola! Todavía no rendí el primer parcial. ¿Ya me puedo anotar al segundo? ¿Cómo hago?"},{"tipo":"preguntar","opciones":[{"texto":"¿En qué modalidad cursa?","clave":true,"porque":"En PD no se inscribe a los parciales: se asignan según el cronograma."},{"texto":"¿Sigue abierto el plazo de inscripción?","clave":true,"porque":"Si venció, el sistema le asigna una fecha automáticamente."},{"texto":"¿Es un parcial, un recuperatorio o un integrador?","clave":true,"porque":"Recuperatorio e integrador: se inscribe a uno solo, hasta 24 horas antes."},{"texto":"¿Qué nota sacó en los TP?","clave":false,"porque":"No cambia cómo se inscribe."}]},{"tipo":"idea","titulo":"Cómo se inscribe en ED y EDH","texto":"En el Portal de Estudiantes: Exámenes, Nueva inscripción; elige la materia, el lugar, la fecha y la franja horaria, revisa el resumen y confirma con Inscribirme al examen. Desde la primera semana de cursado se puede inscribir al Parcial 1 y al Parcial 2: no hace falta esperar a rendir el primero.","clave":"Exámenes, Nueva inscripción; desde la primera semana, a los dos parciales.","ejemplo":"Lisandro ya se puede anotar al segundo parcial, aunque no haya rendido el primero."},{"tipo":"probalo","n":3},{"tipo":"idea","titulo":"Si no se anota, o si cursa PD","texto":"Si no se inscribe dentro del plazo, el sistema le asigna una fecha automáticamente: que la revise en el Portal. En PD no se inscribe a los parciales: fecha, lugar y franja se asignan según el cronograma y se ven en el Portal.","clave":"Fuera de plazo, fecha automática. En PD, el parcial ya viene asignado."},{"tipo":"probalo","n":1},{"tipo":"ojo","texto":"Si falta a un parcial, recuperatorio o integrador queda Ausente y no se reprograma; en un final, además, pierde una oportunidad antes de quedar Libre.\nPara recuperatorio o integrador, cuando puede elegir, se inscribe solo a uno de los dos, hasta 24 horas antes."},{"tipo":"probalo","n":2},{"tipo":"cierre","resolucion":"A Lisandro le explicás que sí: desde la primera semana de cursado se puede anotar a los dos parciales. En el Portal entra a Exámenes, Nueva inscripción, elige la materia, el lugar, la fecha y la franja, y confirma con Inscribirme al examen.","recordar":"Desde la primera semana, a los dos parciales; fuera de plazo, fecha automática."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-inscripcion-a-examenes$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'fa3f849b-6994-4c30-8d5c-0278e45215f7'::uuid and id not in ('c1387fe8-abc5-4013-8667-8c06e508b862'::uuid, '6063fc98-61bf-4610-834f-9fccce26d79c'::uuid, '871f0d2c-e080-4229-8223-bdf5e6c533bf'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'c1387fe8-abc5-4013-8667-8c06e508b862'::uuid, 'opcion_multiple', $pea0$Agustina (PD) llama preocupada: no encuentra cómo inscribirse al Parcial 1 en el Portal. ¿Qué le respondés?$pea0$, $pea0$Antes de explicar pasos, preguntá la modalidad: ED/EDH se inscriben a los parciales; en PD se asignan por cronograma.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'fa3f849b-6994-4c30-8d5c-0278e45215f7'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'fa3f849b-6994-4c30-8d5c-0278e45215f7'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'c1387fe8-abc5-4013-8667-8c06e508b862'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'c1387fe8-abc5-4013-8667-8c06e508b862'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('8894013e-6224-40f0-8603-c68c24a1e19c'::uuid, $pea0$Que el plazo venció y el sistema le va a asignar una fecha automática.$pea0$, false, 1, $pea0$Eso aplica a ED/EDH cuando no se inscriben a tiempo. En PD no hay inscripción a parciales.$pea0$, null::int, null),
  ('8ec5ffe6-6137-48fc-802c-9ce04add66ac'::uuid, $pea0$Que en PD no se inscribe: fecha, lugar y franja se asignan según el cronograma y los ve en su Portal.$pea0$, true, 2, $pea0$Así lo indica la guía para la modalidad Presencial Distribuida.$pea0$, null::int, null),
  ('2f40e43f-320d-48b7-8613-9bed71904697'::uuid, $pea0$Que entre en Exámenes, Nueva inscripción, y elija fecha y franja.$pea0$, false, 3, $pea0$Es el procedimiento de ED/EDH; en PD el parcial ya viene asignado.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'c1387fe8-abc5-4013-8667-8c06e508b862'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '6063fc98-61bf-4610-834f-9fccce26d79c'::uuid, 'opcion_multiple', $pea0$Federico (EDH) faltó al Parcial 2 y quiere que se lo reprogramen. ¿Qué le explicás?$pea0$, $pea0$Ausente en un parcial no se reprograma. Perder una oportunidad camino a Libre es una consecuencia de los finales.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'fa3f849b-6994-4c30-8d5c-0278e45215f7'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'fa3f849b-6994-4c30-8d5c-0278e45215f7'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '6063fc98-61bf-4610-834f-9fccce26d79c'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '6063fc98-61bf-4610-834f-9fccce26d79c'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('c0b40ac1-06c3-40c8-8908-3002d4a9f3dc'::uuid, $pea0$Que se inscriba otra vez al Parcial 2 en otra franja.$pea0$, false, 1, $pea0$La inasistencia no habilita reprogramar el parcial.$pea0$, null::int, null),
  ('925de17d-4083-44cf-804b-6db9eb5797c7'::uuid, $pea0$Que queda registrado como Ausente y no se reprograma; según su situación, puede inscribirse al recuperatorio o integrador hasta 24 horas antes.$pea0$, true, 2, $pea0$La fuente indica que en parciales la inasistencia no habilita reprogramación; la inscripción a recuperatorio o integrador cierra 24 horas antes.$pea0$, null::int, null),
  ('40163dc1-dfb1-4e26-84f5-39426d725288'::uuid, $pea0$Que perdió una oportunidad y quedó libre en la materia.$pea0$, false, 3, $pea0$Perder una oportunidad aplica a los finales, no a los parciales.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '6063fc98-61bf-4610-834f-9fccce26d79c'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '871f0d2c-e080-4229-8223-bdf5e6c533bf'::uuid, 'ordenar', $pea0$Ordená los pasos para inscribirse a un parcial en el Portal (ED/EDH).$pea0$, $pea0$El resumen se revisa antes de confirmar; no hace falta haber rendido el P1 para anotarse al P2.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'fa3f849b-6994-4c30-8d5c-0278e45215f7'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'fa3f849b-6994-4c30-8d5c-0278e45215f7'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '871f0d2c-e080-4229-8223-bdf5e6c533bf'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '8c4605a5-9df3-4fd3-8577-00afba728ba5'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '871f0d2c-e080-4229-8223-bdf5e6c533bf'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('31fc0670-e040-4493-845e-eed8f6d3c5a8'::uuid, $pea0$Ir a Exámenes y hacer clic en Nueva inscripción.$pea0$, false, 1, null, 1::int, null),
  ('38f6a61c-a310-492e-819c-9770ca775f55'::uuid, $pea0$Elegir la materia y el parcial (1 o 2).$pea0$, false, 2, null, 2::int, null),
  ('f5aabd67-dba3-43b5-8de7-ddffe4e2574e'::uuid, $pea0$Elegir el lugar, el día en el calendario y la franja horaria.$pea0$, false, 3, null, 3::int, null),
  ('6b90a11b-9540-43ca-82c6-0c0f885ad88a'::uuid, $pea0$Revisar el resumen de inscripción.$pea0$, false, 4, null, 4::int, null),
  ('5414be4b-e5c3-4dd7-878a-5a8b36fc73ee'::uuid, $pea0$Confirmar con Inscribirme al examen.$pea0$, false, 5, null, 5::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '871f0d2c-e080-4229-8223-bdf5e6c533bf'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'c4c2e72c-bbb1-4946-8b80-ce01f5f4d17b'::uuid, '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid, 36, $pea0$App Siglo 21$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Morena","canal":"mostrador","consulta":"Hola, hoy es mi primera Open Class. ¿Cómo registro la asistencia con la app?"},{"tipo":"preguntar","opciones":[{"texto":"¿Tiene la app instalada y entró con los datos del Portal?","clave":true,"porque":"La app usa los mismos datos del Portal de Estudiantes."},{"texto":"¿Le dio permiso a la cámara?","clave":true,"porque":"La primera vez hace falta para escanear el QR."},{"texto":"¿Tiene más de un legajo?","clave":true,"porque":"La app permite consultar cada legajo por separado."},{"texto":"¿Qué celular tiene?","clave":false,"porque":"No cambia cómo se registra la asistencia."}]},{"tipo":"idea","titulo":"Qué se hace con la app","texto":"La app se descarga de la tienda del celular y se entra con los datos del Portal de Estudiantes. Desde ahí ve sus legajos, el historial de materias, las calificaciones y la agenda, se inscribe a materias y exámenes y paga en forma electrónica. Si estudia dos carreras, cambia de legajo desde Tu Legajo.","clave":"Mismos datos del Portal; cada legajo se consulta desde Tu Legajo."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"La asistencia con el QR","texto":"La asistencia se registra escaneando con la app el QR que muestra el profesor: se toca el ícono del QR arriba en la pantalla. La primera vez tiene que dar permiso a la cámara. En ED se exige el 75% de asistencia en cada materia, y sin el escaneo no queda registrada.","clave":"Escanear el QR del profesor; la primera vez, permiso a la cámara.","ejemplo":"Morena toca el ícono del QR, da permiso a la cámara y escanea."},{"tipo":"probalo","n":1},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Estar en la Open Class no alcanza: si no escaneó el QR, la asistencia no queda registrada.\nSi olvidó la contraseña de la app, la resetea desde ¿Olvidaste tu contraseña?"},{"tipo":"cierre","resolucion":"A Morena le explicás que abra la app con los datos del Portal, toque el ícono del QR arriba en la pantalla y escanee el QR que muestra el profesor. Como es la primera vez, la app le va a pedir permiso para usar la cámara.","recordar":"Asistencia: escanear el QR del profesor con la app."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-app-siglo-21$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'c4c2e72c-bbb1-4946-8b80-ce01f5f4d17b'::uuid and id not in ('007dc56a-13f7-472a-8d5e-fdbe04cd4acc'::uuid, '6b31550c-d8c7-4f0d-86ec-1d0a0343f4c3'::uuid, '00325340-a91f-467e-8e68-54dc05a38cfe'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '007dc56a-13f7-472a-8d5e-fdbe04cd4acc'::uuid, 'opcion_multiple', $pea0$Nicolás (ED) quiere registrar la asistencia de la Open Class con la app, pero al tocar el ícono del QR no pasa nada y la cámara no abre. Es la primera vez que la usa. ¿Qué le decís?$pea0$, $pea0$La primera vez que se registra asistencia hay que dar permiso a la cámara; después se escanea el QR desde el ícono de la parte superior.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c4c2e72c-bbb1-4946-8b80-ce01f5f4d17b'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'c4c2e72c-bbb1-4946-8b80-ce01f5f4d17b'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '007dc56a-13f7-472a-8d5e-fdbe04cd4acc'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '007dc56a-13f7-472a-8d5e-fdbe04cd4acc'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('92dda046-dcd4-4a39-8b94-6a602bbc4f0c'::uuid, $pea0$Que le pida al tutor que lo anote a mano.$pea0$, false, 1, $pea0$La asistencia se registra con la app; primero hay que resolver el permiso.$pea0$, null::int, null),
  ('29213e4f-2500-4425-8dbe-518737d99d3b'::uuid, $pea0$Que acepte el permiso de cámara que pide la app la primera vez y vuelva a escanear el QR.$pea0$, true, 2, $pea0$La primera vez la app pide permiso para usar la cámara del celular.$pea0$, null::int, null),
  ('35a4dfb3-ca03-49d9-8150-be5a805c9332'::uuid, $pea0$Que reinstale la app y entre con un usuario nuevo.$pea0$, false, 3, $pea0$No hace falta otro usuario: se entra con los datos del Portal.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '007dc56a-13f7-472a-8d5e-fdbe04cd4acc'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '6b31550c-d8c7-4f0d-86ec-1d0a0343f4c3'::uuid, 'opcion_multiple', $pea0$Julieta estudia dos carreras y quiere ver en la app las notas de la segunda, pero solo le aparece una. ¿Qué le indicás?$pea0$, $pea0$Con un solo usuario (el del Portal) se consultan todos los legajos desde la app.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c4c2e72c-bbb1-4946-8b80-ce01f5f4d17b'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'c4c2e72c-bbb1-4946-8b80-ce01f5f4d17b'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '6b31550c-d8c7-4f0d-86ec-1d0a0343f4c3'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '6b31550c-d8c7-4f0d-86ec-1d0a0343f4c3'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('fb3eecfb-78f4-43cc-8a60-947e9aa68984'::uuid, $pea0$Que necesita un usuario distinto para cada carrera.$pea0$, false, 1, $pea0$Se entra con los mismos datos del Portal; los legajos se ven dentro de la app.$pea0$, null::int, null),
  ('2572b505-3aaf-4749-83fd-e4f8ac59353b'::uuid, $pea0$Que cambie de legajo desde Tu Legajo: la app permite consultar cada uno.$pea0$, true, 2, $pea0$La app muestra la información de cada legajo si estudia varias carreras.$pea0$, null::int, null),
  ('1cc3c2dc-68bc-4d82-8a09-101e2c939f85'::uuid, $pea0$Que eso solo se ve en la computadora, desde el Portal.$pea0$, false, 3, $pea0$La app también muestra legajos, historial y calificaciones.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '6b31550c-d8c7-4f0d-86ec-1d0a0343f4c3'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '00325340-a91f-467e-8e68-54dc05a38cfe'::uuid, 'verdadero_falso', $pea0$En ED, si el alumno estuvo en la Open Class pero no escaneó el QR de la app, la asistencia igual queda registrada.$pea0$, $pea0$En ED la asistencia se toma con la App Siglo 21 y se exige el 75% en cada materia (fuente: modalidad ED). Sin el escaneo, no queda registrada.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'c4c2e72c-bbb1-4946-8b80-ce01f5f4d17b'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'c4c2e72c-bbb1-4946-8b80-ce01f5f4d17b'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '00325340-a91f-467e-8e68-54dc05a38cfe'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '30ea230c-fdc6-41a9-8eee-304ca7965041'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '00325340-a91f-467e-8e68-54dc05a38cfe'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('bbe95879-3667-41ac-8041-9e928a8635d8'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('3dd39755-df6c-44df-8709-63a9b34a3db4'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '00325340-a91f-467e-8e68-54dc05a38cfe'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '2bdca9f6-e70b-439f-852d-e32c79ab3538'::uuid, 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid, 37, $pea0$Defensa Oral$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Emiliano","canal":"whatsapp","consulta":"Hola! La CAE me aprobó el TFG. ¿Cómo pido la defensa? ¿La puedo hacer desde mi ciudad?"},{"tipo":"preguntar","opciones":[{"texto":"¿Cursa ED o EDH y tiene el EFIP II aprobado?","clave":true,"porque":"En distancia, sin el EFIP II no puede pedir la mesa."},{"texto":"¿Ya pagó la Tasa de Graduación?","clave":true,"porque":"La tasa activa el visado, que puede tardar hasta 10 días hábiles."},{"texto":"¿Tiene la matrícula del semestre paga?","clave":true,"porque":"Tiene que estarlo al iniciar el visado y al rendir."},{"texto":"¿Quién fue su tutor?","clave":false,"porque":"No cambia los pasos para pedir la defensa."}]},{"tipo":"idea","titulo":"Presencial, con el EFIP II","texto":"La defensa se habilita cuando la CAE aprueba el TFG. Todas las defensas orales son presenciales, en el Campus de la Universidad. En distancia (ED y EDH) necesita el EFIP II aprobado antes de pedir la mesa, salvo en la Licenciatura en Educación.","clave":"Defensa presencial en el Campus; en distancia, con el EFIP II aprobado.","ejemplo":"Emiliano no puede defender desde su ciudad: es en el Campus."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Los pasos","texto":"Paga la Tasa de Graduación (el ticket aparece en Pago Electrónico) y arranca el visado solo, que puede tardar hasta 10 días hábiles: constata que no adeuda materias y que están al día documentación, administración, biblioteca y CAE. Después completa el formulario con el link al TFG final y envía la solicitud; la mesa se coordina en hasta 10 días hábiles.","clave":"Tasa, visado (hasta 10 días hábiles), formulario y fecha."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Una vez pedida la fecha de la defensa, no se puede anular.\nLa matrícula del semestre tiene que estar paga al iniciar el visado y al rendir. La Tasa de Graduación incluye la gestión del diploma y el analítico con legalización, la opción de envío del título al CAU y la invitación a la colación."},{"tipo":"probalo","n":3},{"tipo":"cierre","resolucion":"A Emiliano le explicás que la defensa es presencial, en el Campus. Para pedirla, paga la Tasa de Graduación, espera el visado (hasta 10 días hábiles), completa el formulario con el link al TFG final y recibe la fecha. Si cursa a distancia, necesita además el EFIP II aprobado.","recordar":"Presencial en el Campus; tasa, visado y formulario; con el EFIP II en distancia."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-defensa-oral$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '2bdca9f6-e70b-439f-852d-e32c79ab3538'::uuid and id not in ('bfaccff1-04ee-4d42-87a9-3fed159462aa'::uuid, 'b629688c-7341-4974-86de-d02e774ed4dc'::uuid, 'fb752522-4668-4dfd-8d7b-668d20ea40e2'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'bfaccff1-04ee-4d42-87a9-3fed159462aa'::uuid, 'opcion_multiple', $pea0$Rocío (EDH, Lic. en Administración) tiene el TFG aprobado por la CAE, pagó la Tasa de Graduación hace 3 días y todavía no aprobó el EFIP II. Quiere saber por qué no avanza su pedido de defensa. ¿Qué le explicás?$pea0$, $pea0$En distancia, el visado exige todas las materias, electivas, EFIP II aprobado y Seminario Final regular. La única excepción al EFIP II es la Licenciatura en Educación.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '2bdca9f6-e70b-439f-852d-e32c79ab3538'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '2bdca9f6-e70b-439f-852d-e32c79ab3538'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'bfaccff1-04ee-4d42-87a9-3fed159462aa'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'bfaccff1-04ee-4d42-87a9-3fed159462aa'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('4ae4c26a-bba1-4a05-8239-57170be7a87d'::uuid, $pea0$Que el visado se pide aparte, por Consulta Alumnos.$pea0$, false, 1, $pea0$El visado no se solicita: arranca automáticamente al pagar la tasa.$pea0$, null::int, null),
  ('69d0e05c-5b05-44ef-801e-c545d0621ceb'::uuid, $pea0$Que en EDH necesita el EFIP II aprobado para el visado y para pedir la mesa; sin eso no avanza.$pea0$, true, 2, $pea0$En ED/EDH el EFIP II aprobado es requisito del visado y de la solicitud de mesa.$pea0$, null::int, null),
  ('2b4767f6-0ce5-4291-8226-2d5c3cf15668'::uuid, $pea0$Que es normal: el visado tarda hasta 10 días hábiles y después sigue solo.$pea0$, false, 3, $pea0$Los plazos corren cuando se cumplen todos los requisitos; sin EFIP II aprobado, no avanza.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'bfaccff1-04ee-4d42-87a9-3fed159462aa'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'b629688c-7341-4974-86de-d02e774ed4dc'::uuid, 'ordenar', $pea0$Ordená el proceso para llegar a la Defensa Oral una vez que la CAE aprobó el TFG.$pea0$, $pea0$La tasa dispara el visado; con el visado completo se pide la mesa, que se coordina en hasta 10 días hábiles.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '2bdca9f6-e70b-439f-852d-e32c79ab3538'::uuid, null, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '2bdca9f6-e70b-439f-852d-e32c79ab3538'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'b629688c-7341-4974-86de-d02e774ed4dc'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'b629688c-7341-4974-86de-d02e774ed4dc'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('a0ccef94-01b9-421c-807c-2e57f08fae15'::uuid, $pea0$Pagar la Tasa de Graduación desde Pago Electrónico.$pea0$, false, 1, null, 1::int, null),
  ('8fe87408-dfb2-42c5-8225-d71273556c05'::uuid, $pea0$Esperar que termine el visado automático (hasta 10 días hábiles).$pea0$, false, 2, null, 2::int, null),
  ('bbac9dc2-0758-4c40-815f-3b722d0f7164'::uuid, $pea0$Completar el formulario de solicitud de mesa con el link al TFG final.$pea0$, false, 3, null, 3::int, null),
  ('a3db8c46-3750-49ed-8d24-970c1a25a6f2'::uuid, $pea0$Recibir por mail la citación con fecha y hora y confirmar asistencia.$pea0$, false, 4, null, 4::int, null),
  ('8b46356c-6d7a-487b-89c3-7ff0cc722710'::uuid, $pea0$Presentarse en el Campus con DNI a rendir la defensa.$pea0$, false, 5, null, 5::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'b629688c-7341-4974-86de-d02e774ed4dc'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'fb752522-4668-4dfd-8d7b-668d20ea40e2'::uuid, 'opcion_multiple', $pea0$Diego (ED) ya pidió la mesa de defensa y ahora quiere anularla porque le cayó un viaje laboral. ¿Qué le decís?$pea0$, $pea0$La fecha de Defensa Oral no se anula una vez pedida, y siempre se rinde en el Campus.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '2bdca9f6-e70b-439f-852d-e32c79ab3538'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '2bdca9f6-e70b-439f-852d-e32c79ab3538'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'fb752522-4668-4dfd-8d7b-668d20ea40e2'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'd51876dc-9913-421a-8cf0-44f5895e5c2b'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'fb752522-4668-4dfd-8d7b-668d20ea40e2'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('681f2be6-c464-4646-8aac-0d27ff2e50ed'::uuid, $pea0$Que la anule desde el Portal hasta 8 días antes, como un final.$pea0$, false, 1, $pea0$Ese plazo es de los exámenes finales; la defensa oral tiene su propia regla.$pea0$, null::int, null),
  ('d2c0cd35-e9fd-4c10-830d-36506f5065d9'::uuid, $pea0$Que una vez solicitada la fecha de la Defensa Oral, no se puede anular.$pea0$, true, 2, $pea0$La fuente lo dice textualmente.$pea0$, null::int, null),
  ('ba8afcb0-92fa-4bd0-8210-16e0089f0077'::uuid, $pea0$Que pida rendirla en su CAU para no viajar.$pea0$, false, 3, $pea0$Todas las defensas orales son presenciales en el Campus de la Universidad.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'fb752522-4668-4dfd-8d7b-668d20ea40e2'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'd3a159c7-0420-4c1c-81a5-6773c969f70b'::uuid, '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid, 38, $pea0$Eximición de idiomas$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Josefina","canal":"whatsapp","consulta":"Hola! Tengo un certificado de inglés. ¿Tengo que cursar inglés igual?"},{"tipo":"preguntar","opciones":[{"texto":"¿Qué certificado rindió, y en qué versión?","clave":true,"porque":"No todos están en la lista, y algunos dependen de la versión (por ejemplo, TOEFL iBT)."},{"texto":"¿Qué nota o nivel tiene?","clave":true,"porque":"Algunos piden un puntaje mínimo, como TOEFL iBT 60 o TOEIC 600."},{"texto":"¿El certificado es comprobable?","clave":true,"porque":"Se pide que sea comprobable antes de confirmar."},{"texto":"¿Hace cuánto que estudia inglés?","clave":false,"porque":"Lo que cuenta es la certificación, no los años de estudio."}]},{"tipo":"idea","titulo":"Qué certificados eximen","texto":"Puede pedir la eximición de Idioma Extranjero quien tiene una certificación internacional de inglés comprobable. Se aceptan, entre otros: FCE, CAE o CPE de Cambridge; TOEFL iBT 60 o más; TOEIC 600 o más; Bachillerato Internacional Inglés B con 5 o más.","clave":"Certificación internacional comprobable, con el nivel o puntaje mínimo.","ejemplo":"Si Josefina tiene el First (FCE), puede pedir la eximición."},{"tipo":"probalo","n":2},{"tipo":"probalo","n":3},{"tipo":"idea","titulo":"Qué exime cada uno","texto":"Oxford University Press (nivel B2) exime del placement test y de los niveles de inglés del plan; Cambridge International (B2) solo exime del inglés del curso de ingreso. Para portugués: títulos de grado o terciarios de inglés o portugués, o Celpe-Bras, por el trámite de equivalencias.","clave":"Oxford B2: todo el inglés del plan. Cambridge International B2: solo el ingreso."},{"tipo":"probalo","n":1},{"tipo":"ojo","texto":"Antes de confirmar, preguntá qué certificado y qué versión rindió (por ejemplo, TOEFL iBT, Computer o Paper) y pedí que sea comprobable."},{"tipo":"cierre","resolucion":"A Josefina le preguntás qué certificado rindió, en qué versión y con qué nota. Si está en la lista y alcanza el mínimo (por ejemplo, FCE de Cambridge o TOEFL iBT 60 o más), puede pedir la eximición con el certificado comprobable.","recordar":"Eximición: certificación de la lista, con su mínimo y comprobable."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-eximicion-idiomas$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'd3a159c7-0420-4c1c-81a5-6773c969f70b'::uuid and id not in ('5fb9eeda-39a7-4a1f-8423-d203f91a314e'::uuid, 'be9088a1-00ab-425f-8406-a2bc577f8373'::uuid, '0a16f6cc-e8f8-4cd4-818a-0cad7792d529'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '5fb9eeda-39a7-4a1f-8423-d203f91a314e'::uuid, 'opcion_multiple', $pea0$Ignacio (EDH) tiene un certificado de Cambridge Assessment International Education con nivel B2 y pregunta si queda eximido de todo el inglés de su carrera. ¿Qué le respondés?$pea0$, $pea0$No todos los B2 eximen de lo mismo: Oxford B2 cubre placement y niveles del plan; Cambridge International B2, solo el inglés del curso de ingreso.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd3a159c7-0420-4c1c-81a5-6773c969f70b'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'd3a159c7-0420-4c1c-81a5-6773c969f70b'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '5fb9eeda-39a7-4a1f-8423-d203f91a314e'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '5fb9eeda-39a7-4a1f-8423-d203f91a314e'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('2d1829bd-6d86-40b4-8728-c0465b755eaa'::uuid, $pea0$Sí: cualquier certificado de Cambridge con B2 exime de todos los niveles.$pea0$, false, 1, $pea0$Los certificados de Cambridge English (FCE, CAE, CPE) son otra cosa; Cambridge International tiene un alcance distinto.$pea0$, null::int, null),
  ('75855dd1-a408-4539-8281-f634dfac76c7'::uuid, $pea0$No: Cambridge International con B2 exime de cursar y rendir el inglés del curso de ingreso, no de todos los niveles.$pea0$, true, 2, $pea0$Es el alcance que fija la fuente para Cambridge International.$pea0$, null::int, null),
  ('947435f4-3624-4667-89e9-fa1c63dc04c3'::uuid, $pea0$Sí, igual que con un certificado de Oxford B2.$pea0$, false, 3, $pea0$Oxford B2 exime del placement test y de los niveles del plan; Cambridge International no tiene el mismo alcance.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '5fb9eeda-39a7-4a1f-8423-d203f91a314e'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'be9088a1-00ab-425f-8406-a2bc577f8373'::uuid, 'opcion_multiple', $pea0$Carla (ED) dice "rendí el TOEFL y saqué 520". ¿Qué hacés antes de responder?$pea0$, $pea0$Con TOEFL, primero averiguá la versión (iBT, Computer o Paper): cada una tiene un puntaje mínimo distinto.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd3a159c7-0420-4c1c-81a5-6773c969f70b'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'd3a159c7-0420-4c1c-81a5-6773c969f70b'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'be9088a1-00ab-425f-8406-a2bc577f8373'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'be9088a1-00ab-425f-8406-a2bc577f8373'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('955775f0-6f42-46fc-847b-50b9e8feb68c'::uuid, $pea0$Le decís que no alcanza, porque se pide 60 o más.$pea0$, false, 1, $pea0$60 es el mínimo del TOEFL iBT; 520 corresponde a otra escala.$pea0$, null::int, null),
  ('46ee9245-b6d0-4f39-84f5-8c77fa1cda0c'::uuid, $pea0$Le preguntás qué versión rindió: en TOEFL Paper se acepta 500 o más, así que podría alcanzar si es comprobable.$pea0$, true, 2, $pea0$Cada versión tiene su mínimo: iBT 60, Computer 173, Paper 500.$pea0$, null::int, null),
  ('92f2c5ec-28cf-406a-8769-02c60abe826b'::uuid, $pea0$Le decís que el TOEFL no está entre las certificaciones aceptadas.$pea0$, false, 3, $pea0$El TOEFL sí está aceptado, en sus tres versiones.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'be9088a1-00ab-425f-8406-a2bc577f8373'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '0a16f6cc-e8f8-4cd4-818a-0cad7792d529'::uuid, 'clasificar', $pea0$Clasificá cada certificación según si figura o no en la lista de eximición de inglés.$pea0$, $pea0$IELTS 5 a 9, TOEIC 600 o más, TOEFL iBT 60 o más y GESE 7-8-9 figuran en la lista; por debajo de esos mínimos no corresponde la eximición.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd3a159c7-0420-4c1c-81a5-6773c969f70b'::uuid, $pea0${"columnas":["Aceptada","No alcanza"]}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'd3a159c7-0420-4c1c-81a5-6773c969f70b'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '0a16f6cc-e8f8-4cd4-818a-0cad7792d529'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '0a16f6cc-e8f8-4cd4-818a-0cad7792d529'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('24d01596-c782-40c1-8ba5-1c575448a1c1'::uuid, $pea0$IELTS con banda 6$pea0$, false, 1, null, null::int, $pea0$Aceptada$pea0$),
  ('599b8cba-eb87-4ae6-8315-36268e00b246'::uuid, $pea0$TOEIC con 650$pea0$, false, 2, null, null::int, $pea0$Aceptada$pea0$),
  ('db3a5789-b023-4aa1-8954-d4f3321913f7'::uuid, $pea0$TOEFL iBT con 55$pea0$, false, 3, null, null::int, $pea0$No alcanza$pea0$),
  ('7ffb1d61-8f92-4cff-88b4-44bef32cdc3f'::uuid, $pea0$Trinity GESE grado 8$pea0$, false, 4, null, null::int, $pea0$Aceptada$pea0$),
  ('a5723c96-2314-4636-83c6-0d52a82931af'::uuid, $pea0$TOEIC con 500$pea0$, false, 5, null, null::int, $pea0$No alcanza$pea0$)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '0a16f6cc-e8f8-4cd4-818a-0cad7792d529'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'bf74500f-6fef-4705-8fcb-5624bc1c5b59'::uuid, 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid, 39, $pea0$Módulo 0$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Valentín","canal":"whatsapp","consulta":"Hola! Me apareció un \"Módulo 0\" en Canvas y todavía no empezaron las clases. ¿Qué es? ¿Es obligatorio?"},{"tipo":"preguntar","opciones":[{"texto":"¿En qué materia le aparece?","clave":true,"porque":"Solo algunas materias troncales tienen Módulo 0."},{"texto":"¿Cuánto falta para el inicio de clases?","clave":true,"porque":"El Módulo 0 se habilita un mes antes."},{"texto":"¿Tiene dudas con algún ejercicio?","clave":true,"porque":"Las consultas del Módulo 0 van al tutor virtual, por la mensajería de la materia."},{"texto":"¿Qué nota sacó en el secundario?","clave":false,"porque":"No cambia qué es el Módulo 0."}]},{"tipo":"idea","titulo":"Qué es el Módulo 0","texto":"Es un programa preparatorio con contenido y clases niveladoras para empezar mejor el cursado: un módulo de lecturas dentro de la materia, en el Aula Virtual (Canvas), con un recorrido breve y guiado. Se habilita un mes antes del inicio de clases.","clave":"Lecturas niveladoras en Canvas, un mes antes de empezar.","ejemplo":"Lo que ve Valentín es eso: un repaso para llegar mejor al inicio de clases."},{"tipo":"idea","titulo":"No todas las materias lo tienen","texto":"Lo tienen algunas materias troncales, por ejemplo Herramientas Matemáticas, Introducción al Derecho o Estadística y Probabilidad. El listado está en La Nube.","clave":"Solo algunas materias troncales; el listado, en La Nube."},{"tipo":"probalo","n":1},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Si tiene dudas con un ejercicio del Módulo 0, la consulta va al tutor virtual, por la mensajería de la materia en Canvas."},{"tipo":"probalo","n":2},{"tipo":"cierre","resolucion":"A Valentín le explicás que el Módulo 0 es un recorrido breve de lecturas niveladoras dentro de la materia, en Canvas, que se habilita un mes antes del inicio de clases para que llegue con los temas centrales más claros. Si tiene dudas, le escribe al tutor virtual por la mensajería de la materia.","recordar":"Módulo 0: lecturas niveladoras en Canvas, solo en algunas materias."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-modulo0$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'bf74500f-6fef-4705-8fcb-5624bc1c5b59'::uuid and id not in ('34953aa7-2ffd-4dde-80c4-ce7f244b77fc'::uuid, 'c4e189b1-afef-40ad-878e-046247fe7462'::uuid, 'e0106235-69ea-4ece-86d8-e8746d4001ad'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '34953aa7-2ffd-4dde-80c4-ce7f244b77fc'::uuid, 'opcion_multiple', $pea0$Brenda (EDH) se inscribió a Introducción al Derecho y a Derecho Romano, y pregunta por qué solo le aparece Módulo 0 en una de las dos. ¿Qué le decís?$pea0$, $pea0$Antes de responder, chequeá la materia contra el listado: no todas tienen Módulo 0.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'bf74500f-6fef-4705-8fcb-5624bc1c5b59'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'bf74500f-6fef-4705-8fcb-5624bc1c5b59'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '34953aa7-2ffd-4dde-80c4-ce7f244b77fc'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '34953aa7-2ffd-4dde-80c4-ce7f244b77fc'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('0f78d1be-f80d-4056-8189-3044ee190177'::uuid, $pea0$Que es un error de Canvas y lo reporte por Consulta Alumnos.$pea0$, false, 1, $pea0$No es un error: el Módulo 0 solo está en algunas materias.$pea0$, null::int, null),
  ('1afe24c5-741e-4e28-8394-5af4fdde9d88'::uuid, $pea0$Que el Módulo 0 solo está en las materias del listado de La Nube; Introducción al Derecho figura y Derecho Romano no.$pea0$, true, 2, $pea0$El módulo se habilita únicamente en las materias del listado.$pea0$, null::int, null),
  ('138415f0-a100-4bfe-890c-796a3d64e9c5'::uuid, $pea0$Que el Módulo 0 de la otra materia se habilita recién al comenzar las clases.$pea0$, false, 3, $pea0$Se habilita un mes antes del cursado, y solo en las materias del listado.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '34953aa7-2ffd-4dde-80c4-ce7f244b77fc'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'c4e189b1-afef-40ad-878e-046247fe7462'::uuid, 'opcion_multiple', $pea0$Ezequiel (ED) está haciendo el Módulo 0 de Herramientas Matemáticas I y no entiende un ejercicio de repaso. ¿A quién le indicás que consulte?$pea0$, $pea0$El Módulo 0 se cursa en Canvas con cuatro lecturas, actividades con feedback inmediato y un tutor virtual por mensajería.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'bf74500f-6fef-4705-8fcb-5624bc1c5b59'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'bf74500f-6fef-4705-8fcb-5624bc1c5b59'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'c4e189b1-afef-40ad-878e-046247fe7462'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'c4e189b1-afef-40ad-878e-046247fe7462'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('5f773f22-3892-4578-890b-572bff060432'::uuid, $pea0$Al CAU, que le explica el ejercicio.$pea0$, false, 1, $pea0$El CAU no responde contenido de materias.$pea0$, null::int, null),
  ('2ba4d688-52e0-4fb1-8b34-d7820049be98'::uuid, $pea0$Al tutor virtual, por la mensajería de la materia en Canvas.$pea0$, true, 2, $pea0$En Módulo 0 lo acompaña un tutor virtual por la mensajería de Canvas, que lo orienta y le resuelve dudas.$pea0$, null::int, null),
  ('27c3dab0-fc53-45da-89c2-c328d72c739e'::uuid, $pea0$A nadie: el Módulo 0 es autoadministrado y no tiene acompañamiento.$pea0$, false, 3, $pea0$Tiene acompañamiento personalizado de un tutor virtual.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'c4e189b1-afef-40ad-878e-046247fe7462'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'e0106235-69ea-4ece-86d8-e8746d4001ad'::uuid, 'ordenar', $pea0$Ordená cómo se accede a una lectura del Módulo 0.$pea0$, $pea0$Las actividades de repaso dan feedback inmediato con la respuesta correcta y su justificación.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'bf74500f-6fef-4705-8fcb-5624bc1c5b59'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'bf74500f-6fef-4705-8fcb-5624bc1c5b59'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'e0106235-69ea-4ece-86d8-e8746d4001ad'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = 'c07fdef2-d72d-4f2c-8aa6-1b2ba9d7227f'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'e0106235-69ea-4ece-86d8-e8746d4001ad'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('d63ee48e-bde9-47f5-841b-82df4a5f7971'::uuid, $pea0$Entrar a Canvas, en la materia que tiene el módulo habilitado.$pea0$, false, 1, null, 1::int, null),
  ('a102b7ed-24c7-4a57-868b-633cd5c82362'::uuid, $pea0$Hacer clic en módulo 0 en la página de inicio.$pea0$, false, 2, null, 2::int, null),
  ('047550c4-1b42-44ef-8c2d-f56ff5d83f23'::uuid, $pea0$Elegir una de las cuatro lecturas y hacer clic en Ver lectura.$pea0$, false, 3, null, 3::int, null),
  ('5f440eea-9163-4bdf-8523-90c92cfd0346'::uuid, $pea0$Hacer las actividades de repaso del final de la lectura.$pea0$, false, 4, null, 4::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'e0106235-69ea-4ece-86d8-e8746d4001ad'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '444e3f43-cdbe-4389-81a6-5b8c27daf134'::uuid, '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid, 40, $pea0$Gabinete de Bienestar$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Abril","canal":"telefono","consulta":"Hola, estoy muy angustiada con la facultad y no sé cómo organizarme. ¿Hay alguien con quien pueda hablar?"},{"tipo":"preguntar","opciones":[{"texto":"¿Quiere un encuentro individual con un profesional?","clave":true,"porque":"Se pide desde la sección del Gabinete de Bienestar en La Nube."},{"texto":"¿Tiene por delante el EFIP o la Defensa Oral?","clave":true,"porque":"El Gabinete tiene ciclos de preparación para los dos."},{"texto":"¿Su dificultad es de organización del estudio?","clave":true,"porque":"El Gabinete también acompaña la organización y el aprender a estudiar."},{"texto":"¿En qué modalidad cursa?","clave":false,"porque":"El Gabinete es para todas las modalidades."}]},{"tipo":"idea","titulo":"Qué hace el Gabinete de Bienestar","texto":"Acompaña la vida académica: organización del estudio, aprender a estudiar y manejo de las emociones. Lo integran psicólogos y psicólogas egresados de Siglo 21, y es para estudiantes de todas las modalidades. Se puede pedir un encuentro individual con un profesional desde la sección del Gabinete de Bienestar en La Nube.","clave":"Psicólogos para todas las modalidades; encuentro individual desde La Nube.","ejemplo":"Abril puede pedir un encuentro individual con un profesional del Gabinete."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Preparación para el EFIP y la defensa","texto":"El Gabinete tiene ciclos de preparación para el EFIP y para la Defensa Oral, con herramientas técnicas y emocionales.","clave":"Ciclos para el EFIP y la Defensa Oral, técnicos y emocionales."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Que nadie se quede afuera por creer que el Gabinete es solo para presenciales: es para todas las modalidades, también ED y EDH."},{"tipo":"cierre","resolucion":"A Abril le explicás que puede pedir un encuentro individual con un profesional del Gabinete de Bienestar, desde su sección en La Nube, y que el Gabinete también acompaña la organización del estudio y el manejo de las emociones.","recordar":"Gabinete de Bienestar: encuentro individual desde La Nube, para todas las modalidades."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$ln-gabinete-de-bienestar-1$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '444e3f43-cdbe-4389-81a6-5b8c27daf134'::uuid and id not in ('ec9975a2-9339-4da8-807b-3ee87d1af53e'::uuid, '68948be4-b0e4-4c41-840a-fec5c797d77f'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'ec9975a2-9339-4da8-807b-3ee87d1af53e'::uuid, 'opcion_multiple', $pea0$Mariana (EDH) rinde el EFIP en unas semanas, está muy ansiosa y cree que el Gabinete de Bienestar es solo para alumnos presenciales. ¿Qué le decís?$pea0$, $pea0$El Gabinete de Bienestar es para todas las modalidades y tiene ciclos para EFIP y Defensa Oral, además de encuentros individuales.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '444e3f43-cdbe-4389-81a6-5b8c27daf134'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '444e3f43-cdbe-4389-81a6-5b8c27daf134'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'ec9975a2-9339-4da8-807b-3ee87d1af53e'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'ec9975a2-9339-4da8-807b-3ee87d1af53e'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('bfd061ee-9c2a-4eef-8552-3176ff59061d'::uuid, $pea0$Que el Gabinete atiende solo en el Campus y le conviene hablar con su tutor.$pea0$, false, 1, $pea0$El Gabinete acompaña sin importar la modalidad de cursado.$pea0$, null::int, null),
  ('be27f6ea-5cb4-4249-8dba-db874f82dcaa'::uuid, $pea0$Que el Gabinete es para todas las modalidades: puede sumarse al Ciclo de bienestar y preparación para EFIP o pedir un encuentro individual.$pea0$, true, 2, $pea0$La fuente aclara que es para cualquier modalidad y ofrece las dos opciones.$pea0$, null::int, null),
  ('b1c1e393-2c19-4b6e-87a0-a250f8429a1f'::uuid, $pea0$Que le pida al docente que le reprograme el examen.$pea0$, false, 3, $pea0$La ansiedad no es motivo de reprogramación; el acompañamiento es por el Gabinete.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'ec9975a2-9339-4da8-807b-3ee87d1af53e'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '68948be4-b0e4-4c41-840a-fec5c797d77f'::uuid, 'opcion_multiple', $pea0$Gonzalo (ED) tiene fecha de Defensa Oral y dice que se traba armando la presentación y que lo paraliza el miedo a exponer. ¿Qué le recomendás?$pea0$, $pea0$Para la defensa, el Gabinete ofrece un ciclo que combina preparación técnica (estructura, visuales, simulacros) y emocional.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '444e3f43-cdbe-4389-81a6-5b8c27daf134'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '444e3f43-cdbe-4389-81a6-5b8c27daf134'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '68948be4-b0e4-4c41-840a-fec5c797d77f'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '68dfd532-3a2f-4662-8fc5-75c65d7f8f0a'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '68948be4-b0e4-4c41-840a-fec5c797d77f'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('b859c67d-5b77-467c-8d13-d9663e905caf'::uuid, $pea0$Un encuentro con su Profesor Tutor Virtual.$pea0$, false, 1, $pea0$El CPV acompaña el primer año en organización y cursado, no la preparación de la defensa.$pea0$, null::int, null),
  ('83865ede-24b9-45db-8f0e-bbe03fb16c28'::uuid, $pea0$El ciclo de dos talleres del Gabinete para la Defensa Oral: guion, materiales visuales, práctica cronometrada y manejo de la ansiedad.$pea0$, true, 2, $pea0$Ese ciclo integra herramientas técnicas y emocionales para la defensa.$pea0$, null::int, null),
  ('433c3d4a-f769-46eb-864b-a7afa1e63524'::uuid, $pea0$Que pida rendir la defensa desde su casa para estar más tranquilo.$pea0$, false, 3, $pea0$Todas las defensas orales son presenciales en el Campus.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '68948be4-b0e4-4c41-840a-fec5c797d77f'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '4055f513-d6b8-4df2-8155-d1b46ab349e2'::uuid, '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid, 41, $pea0$Mesas y reprogramaciones de exámenes$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Tomás","canal":"whatsapp","consulta":"Hola! Me asignaron el parcial de Estadística el martes a las 9 y a esa hora trabajo. ¿Me lo pueden pasar a otro día?"},{"tipo":"preguntar","opciones":[{"texto":"¿En qué modalidad cursa: ED, EDH o PD?","clave":true,"porque":"En ED y EDH lo gestiona el CAU; en PD va por formulario y lo carga el supervisor."},{"texto":"¿Ya empezó el examen o todavía no?","clave":true,"porque":"Si lo empezó, ya no se reprograma."},{"texto":"¿El examen sigue dentro del período habilitado?","clave":true,"porque":"Fuera del período no corresponde reprogramar."},{"texto":"¿Qué nota sacó en el parcial anterior?","clave":false,"porque":"No cambia si corresponde la reprogramación."}]},{"tipo":"idea","titulo":"En ED y EDH, la reprograma el CAU","texto":"Si el estudiante no puede rendir en la fecha que le asignó la Universidad, el CAU puede pedir hasta 4 reprogramaciones por examen, siempre que esté dentro del período y no lo haya iniciado. Motivos: no estar de acuerdo con la inscripción automática, o una caída de Internet o un corte de luz en el CAU. Se pide por HubSpot a Sistema Q, tipificación \"Reprogramación de exámenes\".","clave":"ED y EDH: hasta 4 reprogramaciones por examen, si no lo empezó y está en período.","ejemplo":"Tomás no puede el martes a las 9: le pedís la reprogramación con una fecha aproximada que le sirva."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Qué lleva el ticket","texto":"En la nota interna van: DNI, legajo, materia, instancia del examen, motivo, una captura del inconveniente con fecha y hora, y la nueva fecha y hora aproximada que pide. Sistema Q tiene 72 horas hábiles para resolver.","clave":"Datos completos y una fecha aproximada: Sistema Q responde en 72 h hábiles."},{"tipo":"idea","titulo":"En PD, por formulario y sin finales","texto":"En PD los finales no se reprograman. Los parciales, recuperatorios e integradores se reprograman solo por motivos previstos (deportista federado, error de Klarway, o falta de Internet o luz en la sede) y por un formulario que carga el supervisor, no por HubSpot. El asesor puede consultar el estado en la planilla de seguimiento.","clave":"PD: finales no; el resto, por formulario que carga el supervisor."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Si el estudiante no ve mesas para inscribirse, no se piden cupos por preferencia de día u horario: primero revisá otros días, otras mesas del CAU y que la inscripción siga abierta. Solo si es un problema de publicación, va a Sistema Q como \"Disponibilidad de mesas de examen\".\nSi inició el examen y Klarway lo cortó, no es reprogramación: es una anulación por excepción."},{"tipo":"cierre","resolucion":"A Tomás le pedís la reprogramación por HubSpot a Sistema Q, con sus datos, la materia, la instancia, el motivo y un día y horario aproximado en el que sí pueda. Le avisás que la respuesta puede tardar hasta 72 horas hábiles.","recordar":"ED y EDH: el CAU reprograma hasta 4 veces; en PD, formulario y finales no."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-38-gestion-de-examenes-sai$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '4055f513-d6b8-4df2-8155-d1b46ab349e2'::uuid and id not in ('db4034ca-d7ba-4941-8ba3-3042968a890d'::uuid, 'f169a431-51c1-4f1f-8e73-bb8fa57a7c7d'::uuid, '42d38842-4cb7-4bfc-8fe8-24bd1aa3bcd0'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'db4034ca-d7ba-4941-8ba3-3042968a890d'::uuid, 'opcion_multiple', $pea0$Micaela cursa ED. La inscripción automática le puso el parcial en un horario en que trabaja y todavía no lo empezó. ¿Qué hacés?$pea0$, $pea0$En ED y EDH, si no puede en la fecha asignada, el CAU pide la reprogramación a Sistema Q, hasta 4 veces por examen.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '4055f513-d6b8-4df2-8155-d1b46ab349e2'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '4055f513-d6b8-4df2-8155-d1b46ab349e2'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'db4034ca-d7ba-4941-8ba3-3042968a890d'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'db4034ca-d7ba-4941-8ba3-3042968a890d'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('2e8361f5-d849-4f22-8222-c68666f0f2a5'::uuid, $pea0$Le decís que no se puede: el horario asignado es obligatorio.$pea0$, false, 1, $pea0$En ED y EDH el CAU puede reprogramar si no está de acuerdo con la inscripción automática.$pea0$, null::int, null),
  ('0007b9d7-f6de-4782-8201-d23fcad9aca1'::uuid, $pea0$Pedís la reprogramación por HubSpot a Sistema Q, con sus datos y una fecha aproximada que le sirva.$pea0$, true, 2, $pea0$Es el circuito: hasta 4 reprogramaciones por examen, si no lo inició y está en período.$pea0$, null::int, null),
  ('bc9b2dd6-310d-4a3d-8a52-604b0e87f739'::uuid, $pea0$Le pedís que rinda igual y después solicite la anulación.$pea0$, false, 3, $pea0$La anulación es solo para errores durante el examen, no para cambiar el horario.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'db4034ca-d7ba-4941-8ba3-3042968a890d'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'f169a431-51c1-4f1f-8e73-bb8fa57a7c7d'::uuid, 'opcion_multiple', $pea0$Franco cursa PD y pide reprogramar un examen final porque viaja. ¿Qué le respondés?$pea0$, $pea0$En PD los finales no se reprograman; el resto, solo por motivos previstos y con el formulario del supervisor.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '4055f513-d6b8-4df2-8155-d1b46ab349e2'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '4055f513-d6b8-4df2-8155-d1b46ab349e2'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'f169a431-51c1-4f1f-8e73-bb8fa57a7c7d'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'f169a431-51c1-4f1f-8e73-bb8fa57a7c7d'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('1f321f7c-b332-4237-89c4-fe0ce4aadbdb'::uuid, $pea0$Que cargás la reprogramación por HubSpot.$pea0$, false, 1, $pea0$En PD las reprogramaciones no van por HubSpot.$pea0$, null::int, null),
  ('4f14e77c-05a2-4a58-8c2a-c87aaaabf5fa'::uuid, $pea0$Que el supervisor lo carga en el formulario.$pea0$, false, 2, $pea0$El formulario es para parciales, recuperatorios e integradores, y por motivos previstos.$pea0$, null::int, null),
  ('45bd73c6-ad3a-436e-8954-8e6bfc1f2596'::uuid, $pea0$Que en PD los finales no se reprograman.$pea0$, true, 3, $pea0$Solo se reprograman parciales, recuperatorios e integradores, por los motivos previstos.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'f169a431-51c1-4f1f-8e73-bb8fa57a7c7d'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '42d38842-4cb7-4bfc-8fe8-24bd1aa3bcd0'::uuid, 'verdadero_falso', $pea0$Si un estudiante no ve mesas en el horario que prefiere, corresponde pedir que amplíen los cupos.$pea0$, $pea0$No se piden cupos por preferencia: tiene que elegir entre las mesas disponibles. Solo se deriva si hay un problema de publicación.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '4055f513-d6b8-4df2-8155-d1b46ab349e2'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '4055f513-d6b8-4df2-8155-d1b46ab349e2'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '42d38842-4cb7-4bfc-8fe8-24bd1aa3bcd0'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '42d38842-4cb7-4bfc-8fe8-24bd1aa3bcd0'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('b53e00a5-7ec7-41d0-8bd6-d76274390538'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('490ee630-2de6-4fa3-8a92-49dce0929c44'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '42d38842-4cb7-4bfc-8fe8-24bd1aa3bcd0'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'a1942a48-bc89-44b9-868d-3dc11f80e615'::uuid, '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid, 42, $pea0$Problemas en el examen: anulación, revisión y notas$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Brenda","canal":"mostrador","consulta":"Estaba rindiendo el final en Klarway, se cerró solo a la mitad y me quedó un 2. ¡No llegué a responder ni la mitad!"},{"tipo":"preguntar","opciones":[{"texto":"¿Pudo iniciar el examen?","clave":true,"porque":"Si no pudo entrar, no es anulación: es reprogramación."},{"texto":"¿Se cortó durante el examen por un error de la plataforma?","clave":true,"porque":"La anulación por excepción es solo para errores de Klarway o de la Universidad durante la evaluación."},{"texto":"¿Quedó una nota registrada en el sistema?","clave":true,"porque":"Es una de las condiciones para pedir la anulación."},{"texto":"¿Estudió con la bibliografía básica?","clave":false,"porque":"No cambia la gestión."}]},{"tipo":"idea","titulo":"La anulación, solo por un error durante el examen","texto":"Se pide la anulación por excepción cuando el estudiante inició el examen, la plataforma o la Universidad lo cortó antes de tiempo y quedó una nota registrada. No corresponde por motivos personales (enfermedad, viaje, mudanza) ni si no pudo ingresar: eso es reprogramación. Va por HubSpot a Sistema Q, con capturas si las hay; 72 horas hábiles.","clave":"Anulación: inició, Klarway lo cortó y quedó nota. Si no pudo entrar, se reprograma.","ejemplo":"Brenda inició el final y se cerró solo: pedís la anulación con fecha, hora y su descripción."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"La revisión empieza en Klarway","texto":"La revisión se pide en Klarway al terminar: 10 minutos en parciales y 15 en finales, completando todos los datos. Es la única instancia para revisar preguntas. Solo se deriva a Sistema Q si la pidió en plazo, ya le respondieron y sigue en desacuerdo.","clave":"Revisión en Klarway (10 o 15 min); se deriva solo si ya le respondieron y sigue en desacuerdo."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"La nota que no aparece","texto":"Primero mirá el historial académico. En ED y EDH la nota del sistema es la definitiva: si no está, se pide a Sistema Q la carga. En PD, la definitiva es la del oral y la carga el docente: en finales, esperá 24 horas desde el examen antes de derivar.","clave":"Revisá el historial; en PD, esperá 24 h en finales antes de pedir la carga."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Empadronamiento en Klarway en estado \"Revisión\": no se deriva, puede tardar hasta 72 horas hábiles. Solo se deriva si hay un error que impide registrarse.\nLa extensión de tiempo por discapacidad requiere la marca de discapacidad en HubSpot y se pide con 72 horas hábiles de anticipación; en finales, con la mesa ya aceptada."},{"tipo":"cierre","resolucion":"A Brenda le pedís la anulación del final por excepción: va por HubSpot a Sistema Q con su DNI, legajo, carrera, materia, fecha y hora, modalidad, la descripción de lo que pasó y capturas si tiene. Le avisás que tarda hasta 72 horas hábiles.","recordar":"Anulación si Klarway cortó el examen; revisión, primero en Klarway; la nota, primero en el historial."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-38-gestion-de-examenes-sai$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'a1942a48-bc89-44b9-868d-3dc11f80e615'::uuid and id not in ('f702717d-857d-48a1-8494-e6b4909e91ca'::uuid, 'f38cc434-a337-43b3-830c-547ccd7beee0'::uuid, 'ac0804d4-768a-4ff1-8f0a-4c28c1b058f8'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'f702717d-857d-48a1-8494-e6b4909e91ca'::uuid, 'opcion_multiple', $pea0$Joaquín no pudo entrar al parcial porque Klarway no le cargaba. Pide que se lo anulen. ¿Qué hacés?$pea0$, $pea0$Si no pudo ingresar al examen, se reprograma. La anulación es solo si lo inició y la plataforma lo cortó.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a1942a48-bc89-44b9-868d-3dc11f80e615'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'a1942a48-bc89-44b9-868d-3dc11f80e615'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'f702717d-857d-48a1-8494-e6b4909e91ca'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'f702717d-857d-48a1-8494-e6b4909e91ca'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('28b1bcf9-96a4-47e8-8928-6c9d5da4a7af'::uuid, $pea0$Pedís la anulación por excepción a Sistema Q.$pea0$, false, 1, $pea0$La anulación es para exámenes iniciados que se cortaron; si no pudo entrar, no corresponde.$pea0$, null::int, null),
  ('c8b87154-9088-46af-8901-2ba749131a04'::uuid, $pea0$Gestionás una reprogramación del examen.$pea0$, true, 2, $pea0$Si no pudo ingresar, el camino es la reprogramación.$pea0$, null::int, null),
  ('ec1550aa-a113-47ec-8bf7-938fd35d5946'::uuid, $pea0$Le decís que queda Ausente y no hay nada para hacer.$pea0$, false, 3, $pea0$Hay una gestión: la reprogramación.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'f702717d-857d-48a1-8494-e6b4909e91ca'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'f38cc434-a337-43b3-830c-547ccd7beee0'::uuid, 'opcion_multiple', $pea0$Paula rindió un final hace dos días, no pidió revisión en Klarway y ahora quiere reclamar una pregunta. ¿Qué le decís?$pea0$, $pea0$La revisión se pide en Klarway al terminar: 10 minutos en parciales, 15 en finales. Es la única instancia.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a1942a48-bc89-44b9-868d-3dc11f80e615'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'a1942a48-bc89-44b9-868d-3dc11f80e615'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'f38cc434-a337-43b3-830c-547ccd7beee0'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'f38cc434-a337-43b3-830c-547ccd7beee0'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('cc5ea670-e4f8-4376-8c62-f70a43ea22e5'::uuid, $pea0$Que generás la revisión por HubSpot a Sistema Q.$pea0$, false, 1, $pea0$Solo se deriva si la pidió en Klarway en plazo y ya le respondieron.$pea0$, null::int, null),
  ('64d6a131-b2d3-4eb2-8f03-1127a1b82cf2'::uuid, $pea0$Que la revisión se pedía en Klarway en los 15 minutos siguientes al final, y era la única instancia.$pea0$, true, 2, $pea0$Pasado ese plazo, no hay otra vía.$pea0$, null::int, null),
  ('b4777d14-5bfa-41ec-8e11-cdfc4cfdad5d'::uuid, $pea0$Que tiene 15 días hábiles para pedirla.$pea0$, false, 3, $pea0$El plazo es de 15 minutos, en Klarway.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'f38cc434-a337-43b3-830c-547ccd7beee0'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'ac0804d4-768a-4ff1-8f0a-4c28c1b058f8'::uuid, 'opcion_multiple', $pea0$Lautaro cursa PD, rindió el oral del final hace 3 horas y no ve la nota. ¿Qué hacés?$pea0$, $pea0$En PD la nota definitiva es la del oral y la carga el docente: se deriva recién después de 24 horas.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a1942a48-bc89-44b9-868d-3dc11f80e615'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'a1942a48-bc89-44b9-868d-3dc11f80e615'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'ac0804d4-768a-4ff1-8f0a-4c28c1b058f8'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '831fe14c-2f13-4c3f-872b-08ecde33344e'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'ac0804d4-768a-4ff1-8f0a-4c28c1b058f8'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('92af8a3f-3eb1-4c27-8ff1-53e46689d128'::uuid, $pea0$Pedís ya la carga de nota a Sistema Q.$pea0$, false, 1, $pea0$En PD la carga el docente: hay que esperar 24 horas.$pea0$, null::int, null),
  ('6216cc8c-e981-4144-8cb7-cf2435be6c0d'::uuid, $pea0$Le explicás que en PD la carga el docente y que, si a las 24 horas no está, se pide la carga a Sistema Q.$pea0$, true, 2, $pea0$Es la consideración para finales en PD.$pea0$, null::int, null),
  ('b5fdaac4-9e3d-4a10-81bc-d5605d622c07'::uuid, $pea0$Le decís que la nota de la instancia virtual es la definitiva.$pea0$, false, 3, $pea0$En PD la definitiva es la del oral.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'ac0804d4-768a-4ff1-8f0a-4c28c1b058f8'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'd2ba13be-bdd4-45b4-8a03-d7a5de3f21dc'::uuid, '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid, 43, $pea0$Gestiones de EFIP: inscripción, anulación y nota$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Ezequiel","canal":"telefono","consulta":"Quiero rendir el EFIP I en el CAU, pero cuando entro al portal no me deja inscribirme. ¿Me podés anotar vos?"},{"tipo":"preguntar","opciones":[{"texto":"¿Tiene la matrícula activa?","clave":true,"porque":"Es requisito para inscribirse y para pedir una anulación."},{"texto":"¿Tiene el módulo de EFIP I cursando o regular, o el Seminario de práctica o planificación regular?","clave":true,"porque":"Sin esa condición no puede inscribirse."},{"texto":"¿Faltan al menos 6 días para la mesa?","clave":true,"porque":"La inscripción tiene que respetar esa anticipación."},{"texto":"¿En qué turno cursa?","clave":false,"porque":"No cambia la gestión."}]},{"tipo":"idea","titulo":"Se inscribe el estudiante","texto":"La inscripción a EFIP I y II la hace el estudiante en Portal de Estudiantes > Exámenes > + Nueva inscripción, eligiendo sede o CAU según cupos y con 6 días de anticipación. El asesor también puede inscribirlo con el botón \"Inscribir a examen\". Solo se deriva a SAI si hay plan desactualizado, un error o no se puede de ninguna de las dos formas.","clave":"Inscribe el estudiante (o el asesor con el botón); a SAI solo si da error.","ejemplo":"Si Ezequiel cumple los requisitos, probás el botón \"Inscribir a examen\"; si falla, derivás a SAI."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Los requisitos de cada uno","texto":"EFIP I: matrícula activa; el módulo de EFIP I cursando o regular, o el Seminario de práctica o planificación regular (según carrera); y las correlativas aprobadas. EFIP II: matrícula activa, Seminario Final regular y los créditos de electivas de su carrera. Al EFIP II puede inscribirse las veces que quiera.","clave":"EFIP I: módulo o Seminario regular y correlativas; EFIP II: Seminario Final regular y electivas."},{"tipo":"idea","titulo":"Anular y reclamar la nota","texto":"La anulación por excepción se pide con al menos 7 días corridos antes de la mesa y con matrícula activa; fuera de plazo no se hace. Si la nota no aparece o es incorrecta, se deriva a SAI. Todo va por HubSpot a SAI y tarda 3 días hábiles.","clave":"Anulación: 7 días corridos antes; nota que falta o está mal: a SAI."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Si la nota del EFIP II ya figura en el Historial Académico (SGU), está bien registrada aunque no se vea en el Portal: es un examen final, no una materia. No hace falta derivar.\nRecordale que, si no va a poder ir, anule la inscripción a tiempo: libera el cupo para otra persona."},{"tipo":"cierre","resolucion":"A Ezequiel le revisás la matrícula, la condición del módulo o seminario, las correlativas y que falten 6 días. Si cumple, lo inscribís con el botón; si da error, lo derivás a SAI por HubSpot con su carrera, la fecha y la sede que quiere, y el motivo. Tarda 3 días hábiles.","recordar":"Inscribe el estudiante o el asesor; SAI, solo si hay error; anular, 7 días antes."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-24-gestiones-efip$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'd2ba13be-bdd4-45b4-8a03-d7a5de3f21dc'::uuid and id not in ('e71d6e4f-5d95-43f5-85f3-6f83143f3ad0'::uuid, 'fa41396a-3388-4c8a-8be8-a5d4821fd453'::uuid, 'ef05d3ba-e80d-420c-856a-9e7d0dbcf408'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'e71d6e4f-5d95-43f5-85f3-6f83143f3ad0'::uuid, 'opcion_multiple', $pea0$Carla quiere anular su inscripción al EFIP II y faltan 4 días para la mesa. ¿Qué le decís?$pea0$, $pea0$La anulación de EFIP se pide con al menos 7 días corridos antes de la mesa y con matrícula activa.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd2ba13be-bdd4-45b4-8a03-d7a5de3f21dc'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'd2ba13be-bdd4-45b4-8a03-d7a5de3f21dc'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'e71d6e4f-5d95-43f5-85f3-6f83143f3ad0'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'e71d6e4f-5d95-43f5-85f3-6f83143f3ad0'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('edc78699-3373-4a6c-811d-0de1f606c9c8'::uuid, $pea0$Que pedís la anulación por excepción a SAI.$pea0$, false, 1, $pea0$Tiene que pedirse con al menos 7 días corridos de anticipación.$pea0$, null::int, null),
  ('7073f638-c4f6-44bd-8154-1d7e1951187a'::uuid, $pea0$Que ya no se puede anular: el plazo es de 7 días corridos antes de la mesa.$pea0$, true, 2, $pea0$Fuera de ese plazo no procede la anulación.$pea0$, null::int, null),
  ('b1937b33-9aad-464a-8acd-f08112c7193d'::uuid, $pea0$Que la anule ella desde el Portal el mismo día.$pea0$, false, 3, $pea0$No hay anulación fuera del plazo.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'e71d6e4f-5d95-43f5-85f3-6f83143f3ad0'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'fa41396a-3388-4c8a-8be8-a5d4821fd453'::uuid, 'opcion_multiple', $pea0$Martín ve su nota del EFIP II en el Historial Académico, pero no en el Portal de Estudiantes. ¿Qué hacés?$pea0$, $pea0$Si la nota de EFIP II figura en el Historial Académico (SGU), está correcta aunque no aparezca en el Portal.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd2ba13be-bdd4-45b4-8a03-d7a5de3f21dc'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'd2ba13be-bdd4-45b4-8a03-d7a5de3f21dc'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'fa41396a-3388-4c8a-8be8-a5d4821fd453'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'fa41396a-3388-4c8a-8be8-a5d4821fd453'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('63edbbaa-5e8a-495e-8f28-52fb41c56c3c'::uuid, $pea0$Derivás a SAI la carga de nota.$pea0$, false, 1, $pea0$Si está en el Historial Académico, ya está registrada.$pea0$, null::int, null),
  ('e72d72d4-a94e-4d51-8985-b7e2de5355b9'::uuid, $pea0$Le explicás que la nota está bien registrada: no se ve en el Portal porque es un examen final, no una materia.$pea0$, true, 2, $pea0$Es la consideración para EFIP II.$pea0$, null::int, null),
  ('3696d094-be20-46b6-8bd7-2b7eff5b4fe2'::uuid, $pea0$Le pedís que vuelva a rendir.$pea0$, false, 3, $pea0$La nota ya está registrada.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'fa41396a-3388-4c8a-8be8-a5d4821fd453'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'ef05d3ba-e80d-420c-856a-9e7d0dbcf408'::uuid, 'verdadero_falso', $pea0$Al EFIP II el estudiante puede inscribirse una cantidad ilimitada de veces.$pea0$, $pea0$El estudiante tiene posibilidades ilimitadas de inscripción a EFIP II.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd2ba13be-bdd4-45b4-8a03-d7a5de3f21dc'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'd2ba13be-bdd4-45b4-8a03-d7a5de3f21dc'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'ef05d3ba-e80d-420c-856a-9e7d0dbcf408'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '0ba24b95-30a6-4f75-88ec-f101f5bc73ed'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'ef05d3ba-e80d-420c-856a-9e7d0dbcf408'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('1db06ee6-0b60-44c5-829d-1f23c6717e9f'::uuid, $pea0$Verdadero$pea0$, true, 1, null, null::int, null),
  ('29f9f99d-4e42-407f-87b1-3a1dc00feb6e'::uuid, $pea0$Falso$pea0$, false, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'ef05d3ba-e80d-420c-856a-9e7d0dbcf408'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'fad4a27a-dc6d-47e0-81fe-3ef132d514a1'::uuid, '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid, 44, $pea0$Medios de pago y pagos rechazados$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Noelia","canal":"whatsapp","consulta":"Quiero pagar el semestre con la tarjeta y me lo rechaza. ¿Qué pasa con la página? ¿Hay otra forma de pagar?"},{"tipo":"preguntar","opciones":[{"texto":"¿Qué mensaje le aparece al pagar?","clave":true,"porque":"Ayuda a ver si es un error de carga o un rechazo de la tarjeta."},{"texto":"¿Copió y pegó el número de la tarjeta?","clave":true,"porque":"Hay que tipearlo: pegarlo muchas veces no deja avanzar."},{"texto":"¿Tiene tarjeta de crédito o solo débito?","clave":true,"porque":"Hay opciones para cada caso."},{"texto":"¿En qué año de la carrera está?","clave":false,"porque":"No cambia los medios de pago."}]},{"tipo":"idea","titulo":"El rechazo lo ve el estudiante con su tarjeta","texto":"Cuando un pago se rechaza, no es un error de la Universidad: puede ser el límite, que pida autorización o una regla de la tarjeta. Lo resuelve el estudiante con su banco. Sirve probar con un monto menor, por ejemplo matrícula y Ticket A. Antes, revisá que haya tipeado el número (no pegado) y la fecha de vencimiento en el formato que pide.","clave":"Pago rechazado: lo resuelve con su tarjeta; probar un monto menor y tipear los datos.","ejemplo":"Noelia puede probar pagando primero matrícula y Ticket A, tipeando el número."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Las formas de pagar","texto":"Todo se paga desde Pago Electrónico: en efectivo, con el cupón para Rapipago o Pago Fácil, o con tarjeta. Hay más opciones: Mobbex en una cuota con descuento, Go Cuotas con tarjeta de débito, pagar con dos tarjetas, y Rebanking para quien no tiene tarjeta de crédito (seis cuotas sin interés). Recargos, cuotas y bancos están en el documento oficial: verificalo siempre antes de asesorar.","clave":"Pago Electrónico: efectivo o tarjeta; sin tarjeta de crédito, Rebanking."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"Con dos tarjetas, si la segunda operación no se aprueba (o se cierra la página), el pago entero se anula: no queda pagado a medias.\nLa Tarjeta Naranja permite hasta 3 cuotas sin interés en Plan Z solo si es Naranja común (empieza con 589562), no Visa ni Mastercard."},{"tipo":"cierre","resolucion":"A Noelia le explicás que el rechazo lo tiene que ver con su tarjeta (límite o autorización), que tipee el número y revise el vencimiento, y que pruebe con un monto menor. Si no, puede pagar en efectivo con el cupón o, si no tiene tarjeta de crédito, con Rebanking.","recordar":"El rechazo lo resuelve con su tarjeta; opciones y cuotas, siempre en el documento oficial."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-39-formas-de-pago-y-financiacion$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'fad4a27a-dc6d-47e0-81fe-3ef132d514a1'::uuid and id not in ('0a4bf0e9-7133-49c4-8769-7e8209f591ac'::uuid, 'ddf7f1c3-ab21-4df0-807a-3c9663efaf55'::uuid, '0a251c68-3d14-4e6b-892f-e78282f77611'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '0a4bf0e9-7133-49c4-8769-7e8209f591ac'::uuid, 'opcion_multiple', $pea0$Un estudiante dice que no tiene tarjeta de crédito y quiere pagar el semestre en cuotas. ¿Qué le ofrecés?$pea0$, $pea0$Para quien no tiene tarjeta de crédito existe Rebanking: seis cuotas sin interés.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'fad4a27a-dc6d-47e0-81fe-3ef132d514a1'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'fad4a27a-dc6d-47e0-81fe-3ef132d514a1'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '0a4bf0e9-7133-49c4-8769-7e8209f591ac'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '0a4bf0e9-7133-49c4-8769-7e8209f591ac'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('3c5394ac-4a31-4d77-88a3-a749f810b1e1'::uuid, $pea0$Le decís que sin tarjeta de crédito solo puede pagar en efectivo.$pea0$, false, 1, $pea0$Hay una opción en cuotas sin tarjeta de crédito.$pea0$, null::int, null),
  ('4e95de8f-bcb3-422d-8dd9-9b009b402a10'::uuid, $pea0$Le contás de Rebanking, que le da una tarjeta para pagar en seis cuotas sin interés.$pea0$, true, 2, $pea0$Es la alternativa para quien no tiene tarjeta de crédito.$pea0$, null::int, null),
  ('b024c689-53ba-445e-8681-c88e1671cb84'::uuid, $pea0$Le pedís que pague con la tarjeta de un familiar.$pea0$, false, 3, $pea0$No es una opción que corresponda ofrecer.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '0a4bf0e9-7133-49c4-8769-7e8209f591ac'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'ddf7f1c3-ab21-4df0-807a-3c9663efaf55'::uuid, 'opcion_multiple', $pea0$Una estudiante pagó con dos tarjetas: la primera se aprobó y la segunda no. ¿Qué pasa con el pago?$pea0$, $pea0$En el pago con dos tarjetas, las dos operaciones tienen que aprobarse; si no, el pago se anula.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'fad4a27a-dc6d-47e0-81fe-3ef132d514a1'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'fad4a27a-dc6d-47e0-81fe-3ef132d514a1'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'ddf7f1c3-ab21-4df0-807a-3c9663efaf55'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'ddf7f1c3-ab21-4df0-807a-3c9663efaf55'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('61998f64-095f-4df6-8515-54b2788655ff'::uuid, $pea0$Queda pagado lo de la primera tarjeta y debe la diferencia.$pea0$, false, 1, $pea0$Si no se aprueban las dos operaciones, se anula todo.$pea0$, null::int, null),
  ('01418667-456a-47f3-8e0b-60a56cd12a99'::uuid, $pea0$Se anula todo: tiene que volver a hacer el pago completo.$pea0$, true, 2, $pea0$Los pagos con dos tarjetas que no completan las dos operaciones quedan como no realizados.$pea0$, null::int, null),
  ('9b8cc4d1-313e-49bf-8f6e-b8201f489491'::uuid, $pea0$Se aprueba igual en 72 horas.$pea0$, false, 3, $pea0$No se aprueba: se anula.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'ddf7f1c3-ab21-4df0-807a-3c9663efaf55'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '0a251c68-3d14-4e6b-892f-e78282f77611'::uuid, 'verdadero_falso', $pea0$Si el pago con tarjeta es rechazado, el asesor tiene que derivar el caso como un error de la Universidad.$pea0$, $pea0$El rechazo lo resuelve el estudiante con su tarjeta (límite, autorización o reglas del banco).$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'fad4a27a-dc6d-47e0-81fe-3ef132d514a1'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'fad4a27a-dc6d-47e0-81fe-3ef132d514a1'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '0a251c68-3d14-4e6b-892f-e78282f77611'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '0a251c68-3d14-4e6b-892f-e78282f77611'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('50a0bb83-2275-4020-8c09-64d261ea4256'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('05b0f59c-287b-4d8a-8275-893fbc5542b0'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '0a251c68-3d14-4e6b-892f-e78282f77611'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'b4579c7e-033f-403d-8eb6-5f43e532d8d8'::uuid, '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid, 45, $pea0$Deuda, saldo a favor y notas de crédito$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Ramiro","canal":"mostrador","consulta":"Pagué el semestre completo pero al final no cursé ninguna materia. ¿Me devuelven la plata? ¿También la matrícula?"},{"tipo":"preguntar","opciones":[{"texto":"¿Qué aranceles de cursado pagó: Ticket A, Ticket B o los dos?","clave":true,"porque":"El reconocimiento se calcula sobre esos tickets."},{"texto":"¿A cuántas materias se inscribió y cuántas cursó, incluido Inglés?","clave":true,"porque":"Inglés se paga y cuenta como materia cursada."},{"texto":"¿Ya terminó el semestre o la inscripción al segundo bimestre?","clave":true,"porque":"Recién ahí se puede pedir la nota de crédito."},{"texto":"¿Con qué tarjeta pagó?","clave":false,"porque":"No cambia el análisis."}]},{"tipo":"idea","titulo":"La nota de crédito por período no cursado","texto":"En ED y EDH se reconocen los aranceles de cursado (Ticket A y B) que pagó sin cursar, nunca la matrícula. Se pide cuando terminó el semestre o la inscripción al segundo bimestre, desde el botón de nota de crédito por período no cursado en SGU o Campus. Solo se deriva si una falla impide hacerla desde el botón.","clave":"Nota de crédito: solo Ticket A y B, nunca la matrícula; se hace desde el botón.","ejemplo":"Ramiro pagó A y B y no cursó nada: se puede reconocer hasta el 100 % del cursado, sin la matrícula."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Cuánto se reconoce en grado","texto":"Si pagó solo el Ticket B y no cursó, hasta el 50 %. Si pagó A y B y no cursó ninguna, hasta el 100 % del cursado. Si pagó A y B y cursó de 1 a 3 materias, hasta el 40 % del Ticket B. Antes, validá que no haya una nota de crédito previa por lo mismo. Inglés, desde el período 2/25, no se puede anular y cuenta como cursada.","clave":"Sin cursar: B hasta 50 %, A y B hasta 100 %; con 1 a 3 cursadas, hasta 40 %."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Deuda que no se entiende y saldo a favor","texto":"Si tiene una deuda que no podés explicar, revisá la cuenta corriente, facturas, recibos y notas de crédito o débito, y si cambió de submodalidad o pagó duplicado. Si igual no se entiende, va por HubSpot como \"Análisis motivo de deuda\". El saldo a favor se puede usar para un trámite si cubre todo el importe.","clave":"Deuda sin explicación: revisá todo y derivá; saldo a favor, si cubre el importe."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Estas derivaciones van por HubSpot con la nota \"#GESTIONES SOPER – DERIVACIÓN\", con nombre, DNI, legajo, período y motivo. Tardan 3 días hábiles.\nEn pregrado los porcentajes son otros: revisalos en la fuente antes de responder."},{"tipo":"cierre","resolucion":"A Ramiro le explicás que la matrícula no se devuelve, porque cubre su alta en la Universidad, y que por los aranceles de cursado puede pedir una nota de crédito desde el botón, cuando termine el semestre o la inscripción al segundo bimestre. Si pagó A y B y no cursó nada, ni siquiera Inglés, se reconoce hasta el 100 % del cursado.","recordar":"La nota de crédito reconoce el cursado pagado y no cursado, nunca la matrícula."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-36-gestiones-administrativas-soper$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'b4579c7e-033f-403d-8eb6-5f43e532d8d8'::uuid and id not in ('a182985c-eb22-4fe6-825e-0a6d61f343fa'::uuid, '9175d6e8-1337-4055-89cc-754e3e7d8fc3'::uuid, '0bb7b2b0-e7bf-40d2-8c5a-761eb1cbc1a9'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'a182985c-eb22-4fe6-825e-0a6d61f343fa'::uuid, 'opcion_multiple', $pea0$Sofía pagó la matrícula y los tickets A y B, y no cursó ninguna materia. Pide que le reconozcan todo lo que pagó. ¿Qué le decís?$pea0$, $pea0$La nota de crédito reconoce los aranceles de cursado no usados (A y B); la matrícula queda afuera.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'b4579c7e-033f-403d-8eb6-5f43e532d8d8'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'b4579c7e-033f-403d-8eb6-5f43e532d8d8'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'a182985c-eb22-4fe6-825e-0a6d61f343fa'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'a182985c-eb22-4fe6-825e-0a6d61f343fa'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('e38d7c3d-5734-4ae0-8451-0cb21f8c7859'::uuid, $pea0$Que se le reconoce el 100 % de todo, matrícula incluida.$pea0$, false, 1, $pea0$La matrícula nunca se reconoce.$pea0$, null::int, null),
  ('50d220b5-8cc4-4961-8594-cbba9bc3b6cc'::uuid, $pea0$Que puede pedir una nota de crédito de hasta el 100 % del cursado (A y B), pero no de la matrícula.$pea0$, true, 2, $pea0$Es el criterio para grado sin materias cursadas.$pea0$, null::int, null),
  ('4728f980-3f30-4e67-870c-6befe29bb470'::uuid, $pea0$Que no corresponde nada porque ya pagó.$pea0$, false, 3, $pea0$Si no cursó, puede pedir el reconocimiento del cursado.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'a182985c-eb22-4fe6-825e-0a6d61f343fa'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '9175d6e8-1337-4055-89cc-754e3e7d8fc3'::uuid, 'opcion_multiple', $pea0$Diego pagó A y B, cursó solo Inglés y pide la nota de crédito como si no hubiera cursado nada. ¿Qué tenés en cuenta?$pea0$, $pea0$Desde el período 2/25, Inglés no se puede anular y cuenta como materia cursada para la nota de crédito.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'b4579c7e-033f-403d-8eb6-5f43e532d8d8'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'b4579c7e-033f-403d-8eb6-5f43e532d8d8'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '9175d6e8-1337-4055-89cc-754e3e7d8fc3'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '9175d6e8-1337-4055-89cc-754e3e7d8fc3'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('ebb52798-224a-48e1-826b-11b2b8fe6363'::uuid, $pea0$Que Inglés no cuenta, así que corresponde el 100 %.$pea0$, false, 1, $pea0$Desde 2/25 Inglés se considera materia cursada.$pea0$, null::int, null),
  ('9c36d3fa-77bb-4e1c-8d8a-2177776e597e'::uuid, $pea0$Que Inglés cuenta como materia cursada, así que no corresponde el reconocimiento de "sin cursar".$pea0$, true, 2, $pea0$Inglés se paga, no se puede anular y cuenta como cursada.$pea0$, null::int, null),
  ('2e4df923-4fdc-444f-8b52-1df5d832761e'::uuid, $pea0$Que primero hay que anularle Inglés.$pea0$, false, 3, $pea0$Inglés no se puede anular.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '9175d6e8-1337-4055-89cc-754e3e7d8fc3'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '0bb7b2b0-e7bf-40d2-8c5a-761eb1cbc1a9'::uuid, 'opcion_multiple', $pea0$Un estudiante tiene una deuda y no encontrás de dónde sale después de revisar su cuenta corriente y sus comprobantes. ¿Qué hacés?$pea0$, $pea0$Si el origen de la deuda no se puede determinar con la información disponible, se deriva como "Análisis motivo de deuda".$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'b4579c7e-033f-403d-8eb6-5f43e532d8d8'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'b4579c7e-033f-403d-8eb6-5f43e532d8d8'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '0bb7b2b0-e7bf-40d2-8c5a-761eb1cbc1a9'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '0bb7b2b0-e7bf-40d2-8c5a-761eb1cbc1a9'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('b56bbc3a-a71b-45bf-8a58-102f934d3488'::uuid, $pea0$Le decís que pague igual.$pea0$, false, 1, $pea0$Primero hay que entender el origen.$pea0$, null::int, null),
  ('865cda7a-3322-41bc-8d41-c6c02a15cd21'::uuid, $pea0$Derivás por HubSpot "Análisis motivo de deuda", con la nota #GESTIONES SOPER y sus datos.$pea0$, true, 2, $pea0$Es la gestión cuando el origen no se puede determinar.$pea0$, null::int, null),
  ('173c88a4-010a-4245-8e0e-a311679d29fc'::uuid, $pea0$Le hacés una nota de crédito por el monto.$pea0$, false, 3, $pea0$La nota de crédito es para otra situación.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '0bb7b2b0-e7bf-40d2-8c5a-761eb1cbc1a9'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '6c5874ca-1e73-4029-885d-3f24ce8bd70b'::uuid, '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid, 46, $pea0$Cuando un estudiante quiere darse de baja$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Julieta","canal":"telefono","consulta":"Hola, quiero darme de baja. Con el trabajo no puedo seguir y además no me alcanza la plata. ¿Me devuelven lo que pagué?"},{"tipo":"preguntar","opciones":[{"texto":"¿Cuál es el motivo: económico, académico o personal?","clave":true,"porque":"Hay que entenderlo bien para registrarlo y buscar alternativas."},{"texto":"¿Tiene deuda o aranceles pendientes?","clave":true,"porque":"Con deuda no se deriva a Grupo de Riesgo hasta regularizar."},{"texto":"¿Qué beneficios tiene vigentes y cómo viene su actividad académica?","clave":true,"porque":"Sirve para ver qué herramientas de persistencia le corresponden."},{"texto":"¿En qué CAU se inscribió el primer año?","clave":false,"porque":"No cambia la gestión."}]},{"tipo":"idea","titulo":"Primero escuchar","texto":"Ante un pedido de baja, preguntá con empatía el motivo y desde cuándo le pasa, y si hay algo que la ayudaría a seguir. Revisá deuda, actividad, fechas de pago y beneficios. Según el caso, contale las herramientas de persistencia: Garantía de Adaptación, nota de crédito, Seguro de Continuidad o becas. Si mantiene su decisión, no insistas.","clave":"Escuchá el motivo, revisá su situación y ofrecé alternativas sin insistir.","ejemplo":"A Julieta, por lo económico, le contás de las becas y, si quien paga perdió el trabajo, del Seguro de Continuidad."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Lo que no se ofrece","texto":"El asesor no ofrece reintegros, anulaciones de pagos, traspasos de fondos entre alumnos ni excepciones arancelarias: eso lo analiza Grupo de Riesgo. Si tiene deuda, primero tiene que regularizarla. Para un traspaso de aranceles, el legajo tiene que estar dado de baja.","clave":"No prometas reintegros ni excepciones: lo analiza Grupo de Riesgo."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"La derivación a Grupo de Riesgo","texto":"Va por HubSpot a Grupo de Riesgo, tipificación \"Riesgo de baja\", con nombre, DNI, legajo, un teléfono actualizado, el motivo y las alternativas que le ofreciste. Avisale que la contactan en 72 horas hábiles y que la gestión puede tardar hasta 7 días hábiles.","clave":"HubSpot a Grupo de Riesgo con teléfono y alternativas ofrecidas: contacto en 72 h."},{"tipo":"ojo","texto":"Este circuito también aplica si pide documentación para cambiarse de universidad (analítico parcial, programas, constancia de baja o de no sanción), o si quiere la baja por enojo con una gestión anterior.\nLa Garantía de Adaptación es solo para ingresantes con más de un ticket pagado, sin materias aprobadas, dentro de los 2 años de su ingreso y que no la hayan usado antes."},{"tipo":"cierre","resolucion":"A Julieta le preguntás bien el motivo, revisás si tiene deuda y le contás las alternativas que le corresponden. Si igual quiere la baja, la derivás a Grupo de Riesgo con su teléfono, sin prometerle un reintegro. La contactan en 72 horas hábiles.","recordar":"Escuchar, ofrecer alternativas y derivar a Grupo de Riesgo, sin prometer reintegros."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-42-reintegros$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '6c5874ca-1e73-4029-885d-3f24ce8bd70b'::uuid and id not in ('ea5bbfc8-af1b-4f68-8aff-6156f1bdd97b'::uuid, '8b214e8b-8b84-4e47-80a9-4c179169ddc8'::uuid, '493c87ce-608b-4231-8cc2-cba0fce569cb'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'ea5bbfc8-af1b-4f68-8aff-6156f1bdd97b'::uuid, 'opcion_multiple', $pea0$Un estudiante pide la baja y que le devuelvan lo que pagó. ¿Qué le respondés sobre el reintegro?$pea0$, $pea0$El asesor no ofrece reintegros ni anulaciones: releva, ofrece alternativas y deriva a Grupo de Riesgo.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '6c5874ca-1e73-4029-885d-3f24ce8bd70b'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '6c5874ca-1e73-4029-885d-3f24ce8bd70b'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'ea5bbfc8-af1b-4f68-8aff-6156f1bdd97b'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'ea5bbfc8-af1b-4f68-8aff-6156f1bdd97b'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('c5a1bff9-5e80-413f-8350-8b03904ed2a1'::uuid, $pea0$Que se lo devuelven en 7 días hábiles.$pea0$, false, 1, $pea0$El asesor no promete reintegros.$pea0$, null::int, null),
  ('b11f4a3c-d7f9-4756-8259-bc731094748a'::uuid, $pea0$Que el reintegro no lo define el CAU: registrás el caso y Grupo de Riesgo lo analiza y lo contacta.$pea0$, true, 2, $pea0$El asesor no ofrece reintegros ni excepciones; lo evalúa el área especializada.$pea0$, null::int, null),
  ('88bf9a1d-8e72-4919-8107-811da2f292c7'::uuid, $pea0$Que no corresponde ningún reintegro.$pea0$, false, 3, $pea0$Tampoco lo podés negar vos: lo analiza Grupo de Riesgo.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'ea5bbfc8-af1b-4f68-8aff-6156f1bdd97b'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '8b214e8b-8b84-4e47-80a9-4c179169ddc8'::uuid, 'opcion_multiple', $pea0$Una estudiante quiere darse de baja y tiene dos cuotas impagas. ¿Qué hacés?$pea0$, $pea0$Si tiene deuda o aranceles pendientes, no se deriva a Grupo de Riesgo hasta que regularice.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '6c5874ca-1e73-4029-885d-3f24ce8bd70b'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '6c5874ca-1e73-4029-885d-3f24ce8bd70b'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '8b214e8b-8b84-4e47-80a9-4c179169ddc8'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '8b214e8b-8b84-4e47-80a9-4c179169ddc8'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('08555e75-f476-49ef-83ab-9ca779ef0dd3'::uuid, $pea0$La derivás igual a Grupo de Riesgo.$pea0$, false, 1, $pea0$Con deuda no corresponde derivar hasta regularizar.$pea0$, null::int, null),
  ('4238d3ce-bed7-4b35-88c1-42089b20d19b'::uuid, $pea0$Le explicás que primero tiene que regularizar la deuda y después se deriva el caso.$pea0$, true, 2, $pea0$Es la condición previa a la derivación.$pea0$, null::int, null),
  ('1afc26dc-4d0a-49b5-8fb6-fb552bd6bc16'::uuid, $pea0$Le anulás la deuda para que pueda darse de baja.$pea0$, false, 3, $pea0$El asesor no anula deudas.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '8b214e8b-8b84-4e47-80a9-4c179169ddc8'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '493c87ce-608b-4231-8cc2-cba0fce569cb'::uuid, 'verdadero_falso', $pea0$Si el estudiante mantiene firme su decisión de darse de baja, el asesor debe seguir insistiendo con alternativas.$pea0$, $pea0$Se ofrecen alternativas, pero no se insiste si mantiene su decisión: se registra y se deriva.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '6c5874ca-1e73-4029-885d-3f24ce8bd70b'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '6c5874ca-1e73-4029-885d-3f24ce8bd70b'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '493c87ce-608b-4231-8cc2-cba0fce569cb'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '493c87ce-608b-4231-8cc2-cba0fce569cb'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('1b7ed15b-3fd9-4d50-814a-e55178335224'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('e4cf547c-971f-479b-8cda-fb1de63a9cc5'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '493c87ce-608b-4231-8cc2-cba0fce569cb'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '86c3de66-c2b7-4f9d-88a5-aaab480e412c'::uuid, '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid, 47, $pea0$Anulaciones de tickets y de pagos$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Agustina","canal":"whatsapp","consulta":"Hola! Hoy a la mañana pagué el semestre dos veces sin querer, con la misma tarjeta. ¿Me pueden anular uno de los pagos?"},{"tipo":"preguntar","opciones":[{"texto":"¿Cuándo hizo el pago?","clave":true,"porque":"Antes de las 18 h del mismo día se anula sin impacto; hasta 48 h se devuelve; después, ya no es anulación."},{"texto":"¿Por qué canal pagó?","clave":true,"porque":"Solo se revisan pagos online, por Pago Electrónico o Rapipago telefónico; Posnet va a SOPER."},{"texto":"¿Tiene el ID o el comprobante del pago?","clave":true,"porque":"Es obligatorio para la derivación."},{"texto":"¿Qué materias cursa este semestre?","clave":false,"porque":"No cambia una anulación por pago duplicado."}]},{"tipo":"idea","titulo":"Anular un pago: cuándo y cómo","texto":"Si se pide antes de las 18 h del mismo día, el pago se anula y no aparece en el resumen. Hasta 48 horas después, se devuelve y figura con una nota de crédito por el mismo importe. Pasadas las 48 horas, no es anulación: corresponde un Riesgo de Baja. Va por HubSpot a Cobranzas con DNI, legajo e ID de pago (el de Paypertic empieza con 77) o el comprobante; 3 días hábiles.","clave":"Antes de las 18 h se anula; hasta 48 h se devuelve; después, Riesgo de Baja.","ejemplo":"Agustina pagó dos veces hoy: pedís \"Anulación de pago por pago duplicado\" con el ID de uno de los pagos."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Lo que trae una anulación","texto":"Salvo en el pago duplicado, anular un pago genera deuda, porque el arancel ya está facturado, y Cobranzas da de baja administrativa el legajo: para volver, paga a cuenta el semestre. Si el pago tenía un descuento por medio de pago, como Mobbex en una cuota, se pierde. Si el pago quedó en otro alumno, no se anula: se pide un traspaso.","clave":"Salvo el duplicado, anular genera deuda y baja administrativa; y se pierde el descuento del medio de pago."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Anular un ticket","texto":"Primero se intenta desde la botonera del Portal, SGU o Campus. Se deriva a Cobranzas solo si da error o es una excepción fundamentada, con el número de ticket y una captura; 2 días hábiles. Si cursó y pagó, no se anula: se factura. Si no cursó y las materias quedaron Libre por Nota, primero SOA anula la inscripción.","clave":"El ticket se anula desde la botonera; a Cobranzas, solo por error o excepción."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"No se anulan pagos de trámites ya facturados. Si quiere la baja definitiva, primero se gestiona con Trámites.\nSi una promoción no se aplicó por un error del sistema, que no pague a cuenta hasta que se corrija."},{"tipo":"cierre","resolucion":"A Agustina le pedís el ID o el comprobante y derivás a Cobranzas una anulación por pago duplicado. Como es del mismo día, se anula uno de los pagos; mientras tanto puede ver un saldo a favor, que se regulariza cuando el banco confirma el contracargo.","recordar":"Pago: antes de las 18 h se anula, hasta 48 h se devuelve; ticket, desde la botonera."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-49-gestiones-de-cobranzas$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '86c3de66-c2b7-4f9d-88a5-aaab480e412c'::uuid and id not in ('d0a7d0d1-637e-4585-814d-c891bd1e77ca'::uuid, '4f714560-b01c-4dc0-8206-4f14522c88e3'::uuid, '90d3169e-addf-40d3-8fa8-8f1a4be1b0c2'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'd0a7d0d1-637e-4585-814d-c891bd1e77ca'::uuid, 'opcion_multiple', $pea0$Gonzalo pagó el semestre hace cuatro días y ahora quiere que le anulen el pago porque no va a cursar. ¿Qué hacés?$pea0$, $pea0$Pasadas las 48 horas desde el pago, no se anula: corresponde gestionar un Riesgo de Baja.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '86c3de66-c2b7-4f9d-88a5-aaab480e412c'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '86c3de66-c2b7-4f9d-88a5-aaab480e412c'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'd0a7d0d1-637e-4585-814d-c891bd1e77ca'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'd0a7d0d1-637e-4585-814d-c891bd1e77ca'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('296f00cd-55df-4beb-81d8-b14fa765c78e'::uuid, $pea0$Pedís la anulación de pago a Cobranzas.$pea0$, false, 1, $pea0$Pasaron más de 48 horas: ya no corresponde una anulación.$pea0$, null::int, null),
  ('bfbd8e87-610c-4756-824c-b36a62b859db'::uuid, $pea0$Gestionás un Riesgo de Baja.$pea0$, true, 2, $pea0$Es lo que corresponde cuando pasaron más de 48 horas desde el pago.$pea0$, null::int, null),
  ('7364b9df-601f-4bb8-8bcf-0b6bc5e61b70'::uuid, $pea0$Le hacés una nota de crédito por período no cursado.$pea0$, false, 3, $pea0$Primero hay que gestionar su situación como Riesgo de Baja.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'd0a7d0d1-637e-4585-814d-c891bd1e77ca'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '4f714560-b01c-4dc0-8206-4f14522c88e3'::uuid, 'opcion_multiple', $pea0$Una estudiante pagó con Mobbex en una cuota y pide anular el pago por un error en el plan de pagos. ¿Qué tenés que avisarle?$pea0$, $pea0$Anular un pago genera deuda y baja administrativa, y si tenía descuento por medio de pago, se pierde.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '86c3de66-c2b7-4f9d-88a5-aaab480e412c'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '86c3de66-c2b7-4f9d-88a5-aaab480e412c'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '4f714560-b01c-4dc0-8206-4f14522c88e3'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '4f714560-b01c-4dc0-8206-4f14522c88e3'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('5f9e744f-19c0-4b23-8a83-cc85c8381702'::uuid, $pea0$Que conserva el descuento si vuelve a pagar.$pea0$, false, 1, $pea0$Al anular el pago, se pierde el descuento por medio de pago.$pea0$, null::int, null),
  ('1335cd9c-62e3-4638-8a90-8ac5c75c5ff3'::uuid, $pea0$Que pierde el descuento de Mobbex, que la anulación genera deuda y una baja administrativa hasta que pague a cuenta con el plan correcto.$pea0$, true, 2, $pea0$Son las consecuencias de anular un pago por error en el plan.$pea0$, null::int, null),
  ('7eb26e63-cb37-470f-83d0-9e7142dab3bc'::uuid, $pea0$Que no se puede anular un pago de Mobbex.$pea0$, false, 3, $pea0$Se puede, con esas consecuencias.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '4f714560-b01c-4dc0-8206-4f14522c88e3'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '90d3169e-addf-40d3-8fa8-8f1a4be1b0c2'::uuid, 'opcion_multiple', $pea0$Un estudiante cursó y pagó dos materias extra y ahora pide anular ese ticket. ¿Qué le decís?$pea0$, $pea0$Si el estudiante cursó y abonó, el ticket no se anula: se factura.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '86c3de66-c2b7-4f9d-88a5-aaab480e412c'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '86c3de66-c2b7-4f9d-88a5-aaab480e412c'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '90d3169e-addf-40d3-8fa8-8f1a4be1b0c2'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '90d3169e-addf-40d3-8fa8-8f1a4be1b0c2'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('2aa6edc9-4245-4e50-8851-4c3b1b52918d'::uuid, $pea0$Que lo anulás por excepción en Cobranzas.$pea0$, false, 1, $pea0$Si cursó y pagó, no corresponde anular.$pea0$, null::int, null),
  ('b85c4c7d-840d-4fc7-8b09-24a8303560df'::uuid, $pea0$Que no corresponde anular el ticket: lo cursó y lo pagó, así que se factura.$pea0$, true, 2, $pea0$Es el criterio de Cobranzas.$pea0$, null::int, null),
  ('fdf1520e-49ed-4523-8fe9-f58396826208'::uuid, $pea0$Que lo anula SOA.$pea0$, false, 3, $pea0$SOA anula inscripciones, no tickets pagados y cursados.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '90d3169e-addf-40d3-8fa8-8f1a4be1b0c2'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'd298b519-3bbe-42f7-810e-52e7dfe7384a'::uuid, '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid, 48, $pea0$Alumno recupero: volver a estudiar$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Hernán","canal":"telefono","consulta":"Hace como dos años que dejé de cursar Administración, a distancia. Me gustaría retomar, pero no sé cuánto debo ni si me conviene."},{"tipo":"preguntar","opciones":[{"texto":"¿Cuántas matrículas tiene sin pagar y cuál fue la última que pagó?","clave":true,"porque":"Recupero es para quien tiene dos o más matrículas impagas."},{"texto":"¿En qué modalidad quiere retomar?","clave":true,"porque":"Aplica en ED y EDH; en PD, no."},{"texto":"¿Quiere seguir la misma carrera o cambiar de carrera, modalidad o CAU?","clave":true,"porque":"Recupero permite cambios, y el orden de la gestión importa."},{"texto":"¿Por qué dejó de cursar hace dos años?","clave":false,"porque":"Es bueno escucharlo, pero no cambia si le corresponde."}]},{"tipo":"idea","titulo":"A quién le corresponde","texto":"Recupero es para quien dejó de cursar y tiene dos o más matrículas sin pagar (revisá en la fuente el período de referencia vigente). Aplica en ED y EDH, no en PD. Se anulan las entradas pendientes de años anteriores y se aplica un descuento extraordinario en los aranceles. Hay que ofrecerlo de forma proactiva.","clave":"Dos o más matrículas impagas, en ED o EDH: ofrecé recupero vos.","ejemplo":"Hernán dejó hace dos años y cursa a distancia: revisás sus matrículas y le ofrecés recupero."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Paga todo junto","texto":"El descuento (60 % sobre los aranceles) se aplica solo si paga el semestre completo de una vez: matrícula, Ticket A y Ticket B, o matrícula y ticket diferencial. Si paga primero la matrícula y después los aranceles, pierde el descuento. Al terminar el semestre, lo que pagó vuelve como descuento fijo para el semestre siguiente, mitad en el Arancel A y mitad en el B.","clave":"Todo en un solo pago; después vuelve como descuento del semestre siguiente."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Qué hacés según lo que decida","texto":"Si acepta, tomás el pago y cerrás el ticket en primera línea (Grupo Recupero, \"Alumno recupero\"). Si le interesa pero no puede pagar ahora, derivás a Grupo Recupero con legajo, horario de contacto y motivo. Si rechaza, derivás igual con el motivo de descarte. Si quiere darse de baja, no es recupero: es Riesgo de Baja.","clave":"Acepta: pago y cerrás; le interesa sin pagar o rechaza: derivás a Grupo Recupero."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Recupero permite cambiar de carrera, modalidad o CAU sin tener la matrícula activa. Si cambia de carrera, primero se hace el cambio y después se aplica la promoción en el legajo nuevo. Si tiene plan desactualizado, primero se actualiza.\nValidá también que tenga el usuario institucional y pedí que le activen el aula virtual.\nSi generó los tickets y no le aparece la promoción, va a Cobranzas como \"NC Recupero\"; si tiene deuda de períodos anteriores, a SOPER como \"NC Promoción no aplicada\"."},{"tipo":"cierre","resolucion":"A Hernán le revisás cuántas matrículas debe. Si son dos o más y sigue en ED o EDH, le ofrecés recupero: le explicás que paga el semestre completo de una vez con el descuento y que lo que pague vuelve como descuento el semestre siguiente. Si acepta, tomás el pago y cerrás el ticket.","recordar":"Recupero: dos o más matrículas impagas, en ED o EDH, y todo el semestre en un solo pago."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-60-grupo-recupero$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'd298b519-3bbe-42f7-810e-52e7dfe7384a'::uuid and id not in ('b33de5c6-cb0d-4a1c-8fc2-6147b5d66a2a'::uuid, 'bf21ab26-4281-4ea1-8100-758bcad45214'::uuid, 'b48587eb-f650-4efc-8259-75dd2d48e2f6'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'b33de5c6-cb0d-4a1c-8fc2-6147b5d66a2a'::uuid, 'opcion_multiple', $pea0$Valeria aplica para recupero, pagó la matrícula ayer y hoy quiere pagar los aranceles con el descuento. ¿Qué le decís?$pea0$, $pea0$La promoción recupero aplica solo si abona los conceptos completos de una vez; pagando primero la matrícula, la pierde.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd298b519-3bbe-42f7-810e-52e7dfe7384a'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'd298b519-3bbe-42f7-810e-52e7dfe7384a'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'b33de5c6-cb0d-4a1c-8fc2-6147b5d66a2a'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'b33de5c6-cb0d-4a1c-8fc2-6147b5d66a2a'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('17081ec1-1f80-4841-8c3d-e3f012b97910'::uuid, $pea0$Que el descuento se aplica igual sobre los aranceles.$pea0$, false, 1, $pea0$El descuento solo se aplica si paga todo el semestre en un solo pago.$pea0$, null::int, null),
  ('e380868a-7ac8-40e1-8b8e-110e517eb421'::uuid, $pea0$Que el descuento de recupero se aplica solo si paga todo junto: al haber pagado primero la matrícula, no lo tiene.$pea0$, true, 2, $pea0$Es la condición de la promoción.$pea0$, null::int, null),
  ('fc2e683b-351b-43cc-8a3b-9b6872fa391f'::uuid, $pea0$Que el descuento se lo devuelven el semestre siguiente.$pea0$, false, 3, $pea0$Lo que vuelve el semestre siguiente es lo pagado con la promoción, no un descuento perdido.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'b33de5c6-cb0d-4a1c-8fc2-6147b5d66a2a'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'bf21ab26-4281-4ea1-8100-758bcad45214'::uuid, 'opcion_multiple', $pea0$Un estudiante con tres matrículas impagas llama porque quiere darse de baja definitivamente. ¿Qué hacés?$pea0$, $pea0$Si el estudiante habla de dar de baja la carrera, no se deriva a recupero sino a Riesgo de Baja.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd298b519-3bbe-42f7-810e-52e7dfe7384a'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'd298b519-3bbe-42f7-810e-52e7dfe7384a'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'bf21ab26-4281-4ea1-8100-758bcad45214'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'bf21ab26-4281-4ea1-8100-758bcad45214'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('0d798fe2-872b-4427-8cef-93e91c38a81b'::uuid, $pea0$Lo derivás a Grupo Recupero.$pea0$, false, 1, $pea0$Si el tema es la baja, no corresponde recupero.$pea0$, null::int, null),
  ('e2cb865c-c5c0-4d40-81ca-7998fcead69a'::uuid, $pea0$Lo gestionás como Riesgo de Baja, con su tipificación.$pea0$, true, 2, $pea0$Las consultas de baja van a Riesgo de Baja, no a recupero.$pea0$, null::int, null),
  ('3d2232b7-07f0-4fa9-880a-6e98bd15d0bd'::uuid, $pea0$Le aplicás recupero para que no se vaya.$pea0$, false, 3, $pea0$Si quiere la baja, el circuito es Riesgo de Baja.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'bf21ab26-4281-4ea1-8100-758bcad45214'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'b48587eb-f650-4efc-8259-75dd2d48e2f6'::uuid, 'verdadero_falso', $pea0$Un estudiante que retoma en PD puede acceder a la promoción recupero.$pea0$, $pea0$La promoción recupero no aplica en PD, ni como modalidad de origen ni de destino.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'd298b519-3bbe-42f7-810e-52e7dfe7384a'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'd298b519-3bbe-42f7-810e-52e7dfe7384a'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'b48587eb-f650-4efc-8259-75dd2d48e2f6'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '76245ecd-e9fa-4ed3-80a7-b09b0791dd31'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'b48587eb-f650-4efc-8259-75dd2d48e2f6'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('76ab6993-eba7-4e05-831c-727ebf25077e'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('9a743495-5224-496d-8cce-0dcda00b4d7b'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'b48587eb-f650-4efc-8259-75dd2d48e2f6'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '361dc458-3d82-45d4-803b-d1552cb0ca8d'::uuid, '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid, 49, $pea0$Cambio de CAU$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Celeste","canal":"mostrador","consulta":"Me mudo a otra ciudad el mes que viene. ¿Puedo seguir cursando en el CAU de allá sin perder nada?"},{"tipo":"preguntar","opciones":[{"texto":"¿Tiene deuda administrativa?","clave":true,"porque":"Con deuda no se puede gestionar el cambio."},{"texto":"¿Está anotada a una mesa de examen final?","clave":true,"porque":"Con un final solicitado, el cambio no se gestiona."},{"texto":"¿Su carrera se dicta en el CAU al que quiere ir?","clave":true,"porque":"Si no se dicta, la solicitud se puede rechazar."},{"texto":"¿Cuántas materias aprobó?","clave":false,"porque":"No cambia el cambio de CAU."}]},{"tipo":"idea","titulo":"Qué tiene que cumplir","texto":"Para cambiar de CAU no tiene que tener deuda administrativa ni una mesa de final solicitada, y su carrera tiene que dictarse en el CAU de destino. Verificar eso es responsabilidad del estudiante: revisá con él la oferta académica vigente. Se pide dentro de las fechas del calendario de trámites.","clave":"Sin deuda, sin final anotado y con su carrera en el CAU de destino.","ejemplo":"Celeste revisa que su carrera esté en el CAU de su nueva ciudad y que no tenga un final anotado."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Cómo se pide","texto":"El estudiante completa el formulario de cambio de CAU (el enlace está en la fuente). El ticket va por HubSpot a Gestiones N2, tipificación \"Cambio de CAU\", con DNI, nombre y apellido, legajo, CAU de origen, CAU de destino y motivo. Tarda 3 días hábiles. También va a Gestiones N2 si pregunta por el estado, si se lo rechazaron o si tuvo problemas después del cambio.","clave":"Formulario del estudiante y ticket a Gestiones N2: 3 días hábiles."},{"tipo":"probalo","n":2},{"tipo":"ojo","texto":"No se puede pasar a un CAU Social: Maldonado, Asunción y Warmi (Abra Pampa) están excluidos. Tampoco a un CAU con restricciones operativas vigentes.\nLa disponibilidad de carreras y servicios cambia de un CAU a otro."},{"tipo":"cierre","resolucion":"A Celeste le revisás que no tenga deuda administrativa ni un final anotado, y que su carrera se dicte en el CAU de su nueva ciudad. Le pasás el formulario de cambio de CAU y generás el ticket a Gestiones N2 con sus datos, los dos CAU y el motivo. Tarda 3 días hábiles.","recordar":"Cambio de CAU: sin deuda, sin final anotado, con la carrera en destino; formulario y Gestiones N2."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-12-modificaciones-en-el-legajo-modalidad-carrera-cau-plan-y-tur$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '361dc458-3d82-45d4-803b-d1552cb0ca8d'::uuid and id not in ('3ee5af87-6d32-497e-8494-e785993184d0'::uuid, 'ccfec50d-a2b4-40b4-87e4-8bf236401975'::uuid, 'd80d738c-2855-463b-81f1-5edd45eec62a'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '3ee5af87-6d32-497e-8494-e785993184d0'::uuid, 'opcion_multiple', $pea0$Ignacio quiere cambiar de CAU y tiene un final solicitado para la semana próxima. ¿Qué le decís?$pea0$, $pea0$Una mesa de examen final solicitada, igual que la deuda administrativa, impide gestionar el cambio de CAU.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '361dc458-3d82-45d4-803b-d1552cb0ca8d'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '361dc458-3d82-45d4-803b-d1552cb0ca8d'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '3ee5af87-6d32-497e-8494-e785993184d0'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '3ee5af87-6d32-497e-8494-e785993184d0'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('a0325c3c-f9f9-4f9c-8e7d-acf323232b32'::uuid, $pea0$Que generás el ticket igual y el final se pasa al CAU nuevo.$pea0$, false, 1, $pea0$Con una mesa de final solicitada, el cambio no se puede gestionar.$pea0$, null::int, null),
  ('5594518a-7867-4387-8229-03967dced5b7'::uuid, $pea0$Que primero rinda (o se dé de baja de esa mesa) y después se gestiona el cambio de CAU.$pea0$, true, 2, $pea0$Tener un final solicitado impide el cambio.$pea0$, null::int, null),
  ('81673297-fa65-4b52-8d9d-8ce5fe2ed642'::uuid, $pea0$Que lo cambiás ahora y anulás el final.$pea0$, false, 3, $pea0$El asesor no anula la mesa para hacer el cambio.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '3ee5af87-6d32-497e-8494-e785993184d0'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'ccfec50d-a2b4-40b4-87e4-8bf236401975'::uuid, 'opcion_multiple', $pea0$Una estudiante pide pasarse al CAU Asunción. ¿Qué le respondés?$pea0$, $pea0$No se puede solicitar cambio de CAU hacia los CAU Sociales: Maldonado, Asunción y Warmi.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '361dc458-3d82-45d4-803b-d1552cb0ca8d'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '361dc458-3d82-45d4-803b-d1552cb0ca8d'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'ccfec50d-a2b4-40b4-87e4-8bf236401975'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'ccfec50d-a2b4-40b4-87e4-8bf236401975'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('264856fc-80f5-4d6c-8bb6-82faa96a2ae8'::uuid, $pea0$Que completa el formulario y lo derivás a Gestiones N2.$pea0$, false, 1, $pea0$Asunción es un CAU Social: está excluido.$pea0$, null::int, null),
  ('765514f8-60f6-483c-8548-3ac97ea8c151'::uuid, $pea0$Que no se puede pedir el cambio a ese CAU: los CAU Sociales están excluidos.$pea0$, true, 2, $pea0$No es posible solicitar cambio hacia CAU Sociales.$pea0$, null::int, null),
  ('0d32d6b0-17df-440d-8e4d-6e0ba20bfadc'::uuid, $pea0$Que lo pida a Trámites.$pea0$, false, 3, $pea0$No es un problema de área: ese destino está excluido.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'ccfec50d-a2b4-40b4-87e4-8bf236401975'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'd80d738c-2855-463b-81f1-5edd45eec62a'::uuid, 'verdadero_falso', $pea0$Verificar que la carrera se dicte en el CAU de destino es responsabilidad del estudiante.$pea0$, $pea0$Es responsabilidad del estudiante verificarlo; si la carrera no se ofrece en destino, la solicitud puede rechazarse.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '361dc458-3d82-45d4-803b-d1552cb0ca8d'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '361dc458-3d82-45d4-803b-d1552cb0ca8d'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'd80d738c-2855-463b-81f1-5edd45eec62a'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'd80d738c-2855-463b-81f1-5edd45eec62a'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('d7c331aa-ff9d-4b5d-800e-afaab2fd9bb6'::uuid, $pea0$Verdadero$pea0$, true, 1, null, null::int, null),
  ('48ea6a64-5608-4f44-802f-5a6ddb32d65b'::uuid, $pea0$Falso$pea0$, false, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'd80d738c-2855-463b-81f1-5edd45eec62a'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'e9f8c14a-27dd-4f8f-810e-9598b1f869c5'::uuid, '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid, 50, $pea0$Cambio de carrera y actualización de plan$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Nicolás","canal":"whatsapp","consulta":"Hola, estoy en Marketing pero me di cuenta de que lo mío es Administración. ¿Me puedo cambiar? Tengo dos materias cursando ahora."},{"tipo":"preguntar","opciones":[{"texto":"¿Tiene deuda administrativa, un final anotado o notas finales pendientes de carga?","clave":true,"porque":"Cualquiera de esas situaciones impide el cambio."},{"texto":"¿Tiene la documentación obligatoria del legajo presentada?","clave":true,"porque":"Sin la documentación completa, el cambio no se hace."},{"texto":"¿Sabe qué pasa con las materias que está cursando?","clave":true,"porque":"Las materias Cursando y Libre por Nota se pierden; tiene que aceptarlo."},{"texto":"¿Qué promedio tiene?","clave":false,"porque":"No cambia la gestión."}]},{"tipo":"idea","titulo":"Qué tiene que cumplir","texto":"Para cambiar de carrera tiene que cumplir las condiciones de ingreso de la carrera y modalidad de destino, no tener deuda administrativa, no estar anotado a una mesa de final ni tener notas pendientes de carga, y tener presentada la documentación obligatoria del legajo. Se pide dentro de las fechas del calendario de trámites.","clave":"Sin deuda, sin final anotado ni notas pendientes, y con el legajo completo.","ejemplo":"Nicolás puede pedir el cambio si cumple eso y acepta perder las 2 materias que cursa."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"El ticket a Trámites","texto":"Va por HubSpot a Trámites, tipificación \"Cambio de carrera\", con DNI, legajo de origen, carrera, modalidad y CAU de destino, y turno si corresponde. Tiene que quedar registrado que acepta perder las materias Cursando y Libre por Nota, qué pasa con las Regulares y las condiciones de EFIP si corresponden. Tarda hasta 5 días hábiles.","clave":"Ticket a Trámites con la aceptación del estudiante: hasta 5 días hábiles."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Actualizar el plan de estudios","texto":"Si pide pasar a un plan más nuevo, el ticket va a Trámites como \"Cambio de plan de estudio\". Antes, explicale cómo pueden quedar sus materias Regulares o Libre por Nota, y que incorpora las materias del plan nuevo (y las de Universitario 21 cuando corresponda). Su aceptación queda en el ticket. Un cambio de modalidad puede pasarlo solo al plan vigente.","clave":"Plan nuevo: explicá el impacto en sus materias y dejá su aceptación en el ticket."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Para pasar a un Ciclo de Complementación, la documentación requerida tiene que estar adjunta en el mismo ticket de HubSpot: sin eso, no se hace el pase.\nSi después de un pase una materia quedó con una condición incorrecta, va a Trámites como \"Revisión de condición de materias tras el pase\". El Seminario Final mantiene la regularidad siempre: verificalo antes de reportar."},{"tipo":"cierre","resolucion":"A Nicolás le revisás que no tenga deuda, finales anotados ni notas pendientes, y que tenga el legajo completo. Le explicás que las 2 materias que cursa quedan Libre por Pase. Si acepta, generás el ticket a Trámites con sus datos y su aceptación, dentro del calendario de trámites.","recordar":"Cambio de carrera: requisitos, aceptación de lo que se pierde y ticket a Trámites."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-12-modificaciones-en-el-legajo-modalidad-carrera-cau-plan-y-tur$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'e9f8c14a-27dd-4f8f-810e-9598b1f869c5'::uuid and id not in ('1e400496-95ea-42d6-8e97-8752a275a05a'::uuid, '57c86c22-4e33-45bc-891f-63662f763ce2'::uuid, '89bae315-ffbf-4c52-8167-ea83a6b450a0'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '1e400496-95ea-42d6-8e97-8752a275a05a'::uuid, 'opcion_multiple', $pea0$Lucila quiere cambiarse de carrera, pero le falta presentar documentación obligatoria del legajo. ¿Qué le decís?$pea0$, $pea0$Sin la documentación obligatoria del legajo presentada, el cambio de carrera no se puede hacer.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'e9f8c14a-27dd-4f8f-810e-9598b1f869c5'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'e9f8c14a-27dd-4f8f-810e-9598b1f869c5'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '1e400496-95ea-42d6-8e97-8752a275a05a'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '1e400496-95ea-42d6-8e97-8752a275a05a'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('850e10af-0c1b-4452-86ed-8e35d2e90d46'::uuid, $pea0$Que generás el ticket y la documentación la presenta después.$pea0$, false, 1, $pea0$Sin la documentación obligatoria completa, el cambio no se realiza.$pea0$, null::int, null),
  ('5ef6891e-7812-4180-8a05-da1e8e760970'::uuid, $pea0$Que primero tiene que completar la documentación del legajo y después se gestiona el cambio.$pea0$, true, 2, $pea0$Es una de las validaciones previas.$pea0$, null::int, null),
  ('6010bb6b-a25e-4189-81eb-00fbb50dbb09'::uuid, $pea0$Que el cambio de carrera no pide documentación.$pea0$, false, 3, $pea0$La documentación obligatoria del legajo es requisito.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '1e400496-95ea-42d6-8e97-8752a275a05a'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '57c86c22-4e33-45bc-891f-63662f763ce2'::uuid, 'opcion_multiple', $pea0$Un estudiante cambia de carrera y tiene una materia en estado Cursando. ¿Qué pasa con ella?$pea0$, $pea0$En el cambio de carrera se pierden las materias Cursando y Libre por Nota, y el estudiante tiene que aceptarlo.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'e9f8c14a-27dd-4f8f-810e-9598b1f869c5'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'e9f8c14a-27dd-4f8f-810e-9598b1f869c5'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '57c86c22-4e33-45bc-891f-63662f763ce2'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '57c86c22-4e33-45bc-891f-63662f763ce2'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('5da1bf6a-d0fe-4147-8f66-3dc1d226a45e'::uuid, $pea0$La conserva en la carrera nueva.$pea0$, false, 1, $pea0$Las materias Cursando se pierden con el pase.$pea0$, null::int, null),
  ('a6a7a2d7-9cd4-425b-880c-c042f1a5a5e7'::uuid, $pea0$La pierde: tiene que aceptarlo y queda registrado en el ticket.$pea0$, true, 2, $pea0$Las materias Cursando y Libre por Nota se pierden en el pase.$pea0$, null::int, null),
  ('2968cbad-89ea-4a13-814b-927f484ddb38'::uuid, $pea0$Queda Regular.$pea0$, false, 3, $pea0$Las Regulares conservan su condición; las Cursando, no.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '57c86c22-4e33-45bc-891f-63662f763ce2'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '89bae315-ffbf-4c52-8167-ea83a6b450a0'::uuid, 'opcion_multiple', $pea0$Después de cambiarse de carrera, Marcos ve que el Seminario Final ya no figura como regular. ¿Qué tenés en cuenta?$pea0$, $pea0$El Seminario Final conserva su regularidad en todos los pases; si no figura así, se pide la revisión a Trámites.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'e9f8c14a-27dd-4f8f-810e-9598b1f869c5'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'e9f8c14a-27dd-4f8f-810e-9598b1f869c5'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '89bae315-ffbf-4c52-8167-ea83a6b450a0'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '89bae315-ffbf-4c52-8167-ea83a6b450a0'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('8a3aeb53-6c65-448f-854d-44f8035ddfd7'::uuid, $pea0$Que es normal: el Seminario Final se pierde con el pase.$pea0$, false, 1, $pea0$El Seminario Final regular se mantiene en todos los casos.$pea0$, null::int, null),
  ('7889317d-98c1-4582-8439-5b479de1498f'::uuid, $pea0$Que el Seminario Final mantiene la regularidad siempre: si no figura, se reporta a Trámites como revisión de condición tras el pase.$pea0$, true, 2, $pea0$Es la verificación previa antes de reportar.$pea0$, null::int, null),
  ('5fb4da34-5581-4bb3-8855-ad303c2084b6'::uuid, $pea0$Que tiene que volver a cursarlo.$pea0$, false, 3, $pea0$No corresponde: la regularidad se mantiene.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '89bae315-ffbf-4c52-8167-ea83a6b450a0'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'a30db4f8-2196-40c2-8467-e77bdfbfd87a'::uuid, '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid, 51, $pea0$Datos y estado del legajo$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Rocío","canal":"mostrador","consulta":"En el sistema tengo mal el apellido y además me aparece el legajo dado de baja, pero yo quiero seguir estudiando."},{"tipo":"preguntar","opciones":[{"texto":"¿Ya mandó una copia de su DNI, frente y dorso?","clave":true,"porque":"Sin la copia del DNI no se puede derivar la corrección."},{"texto":"¿Qué estado tiene el legajo y por qué?","clave":true,"porque":"Una baja administrativa por anulación de pago no se resuelve igual que otras bajas."},{"texto":"¿Tiene alguna deuda pendiente?","clave":true,"porque":"En la baja administrativa, el legajo se reactiva cuando paga la deuda."},{"texto":"¿En qué turno cursa?","clave":false,"porque":"No cambia la gestión."}]},{"tipo":"idea","titulo":"Corregir datos personales","texto":"Primero verificá si ya mandó la copia del DNI físico, frente y dorso (no sirve el de Mi Argentina); si no, pedísela. Con la copia, el ticket va a Gestiones N2 como \"Modificación de datos en el legajo\", con legajo, nombre, apellido y DNI correctos. Se corrigen todos los datos que figuran en el DNI, no solo el que pidió.","clave":"Con la copia del DNI físico, a Gestiones N2: se corrige todo el registro de una vez.","ejemplo":"A Rocío le pedís foto del DNI de frente y dorso y derivás la corrección del apellido."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Baja administrativa y reapertura","texto":"La baja administrativa la aplica Administración cuando se anula un pago: queda deuda y el legajo inactivo hasta que la pague; después se reactiva. Si la baja fue por anulación de pago, la reapertura no se pide directo: primero Cobranzas valida el pago y la autoriza. En otros casos, la reapertura va a Gestiones N2.","clave":"Baja administrativa: se reactiva al pagar la deuda; si hubo anulación de pago, primero Cobranzas."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Cuándo se pide una baja de legajo","texto":"La baja de legajo a Gestiones N2 es solo para un legajo duplicado, una preinscripción vencida de un período anterior o un legajo inactivo. Si el estudiante quiere dejar de estudiar, no es esta gestión: sigue el circuito de Riesgo de Baja.","clave":"Baja de legajo: duplicado, preinscripción vencida o inactivo; si quiere dejar, Riesgo de Baja."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Si a un campo no le corresponde cambio, va \"S/D\" (sin dato) y no se modifica. Si dos estudiantes tienen el mismo número de DNI, la segunda línea lo revisa con SITA.\nAvisale que la corrección puede requerir un usuario nuevo o cambios en Canvas: hay campos en el ticket para eso."},{"tipo":"cierre","resolucion":"A Rocío le pedís la foto del DNI físico, frente y dorso, para corregir el apellido por Gestiones N2. Revisás por qué está dado de baja el legajo: si es una baja administrativa por una anulación de pago, se reactiva cuando paga la deuda; si hace falta reabrirlo, primero lo valida Cobranzas.","recordar":"Datos: con el DNI físico a Gestiones N2; baja por anulación de pago: primero Cobranzas."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-12-modificaciones-en-el-legajo-modalidad-carrera-cau-plan-y-tur$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'a30db4f8-2196-40c2-8467-e77bdfbfd87a'::uuid and id not in ('e8081c15-bb94-4216-80cd-e4851df4487e'::uuid, 'f331ff58-1247-4389-8fde-291bda05305f'::uuid, '5ff81262-356b-414e-8677-4faee1ba84b4'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'e8081c15-bb94-4216-80cd-e4851df4487e'::uuid, 'opcion_multiple', $pea0$Un estudiante pide corregir su fecha de nacimiento y te manda una captura del DNI de Mi Argentina. ¿Qué hacés?$pea0$, $pea0$La modificación de datos requiere la copia del DNI físico, frente y dorso; no se acepta el de Mi Argentina.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a30db4f8-2196-40c2-8467-e77bdfbfd87a'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'a30db4f8-2196-40c2-8467-e77bdfbfd87a'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'e8081c15-bb94-4216-80cd-e4851df4487e'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'e8081c15-bb94-4216-80cd-e4851df4487e'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('f236d342-f5ad-434f-8409-fb7e7c363a35'::uuid, $pea0$Derivás la corrección con esa captura.$pea0$, false, 1, $pea0$No se acepta el DNI de Mi Argentina.$pea0$, null::int, null),
  ('8eec3e9b-cd12-4779-8544-0ee7ce451e22'::uuid, $pea0$Le pedís una foto del DNI físico, frente y dorso, antes de derivar.$pea0$, true, 2, $pea0$Toda validación documental requiere el DNI físico.$pea0$, null::int, null),
  ('d6d0aca4-031a-4ded-8338-8ac4455d1f2d'::uuid, $pea0$Corregís solo la fecha de nacimiento en el momento.$pea0$, false, 3, $pea0$La corrección la hace la segunda línea con el DNI válido.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'e8081c15-bb94-4216-80cd-e4851df4487e'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'f331ff58-1247-4389-8fde-291bda05305f'::uuid, 'opcion_multiple', $pea0$Daniela tiene el legajo en baja administrativa por una anulación de pago y pide que se lo reabran. ¿Qué hacés?$pea0$, $pea0$Si la baja es por anulación de pago, Cobranzas valida el pago y autoriza; recién después Gestiones N2 reabre el legajo.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a30db4f8-2196-40c2-8467-e77bdfbfd87a'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'a30db4f8-2196-40c2-8467-e77bdfbfd87a'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'f331ff58-1247-4389-8fde-291bda05305f'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'f331ff58-1247-4389-8fde-291bda05305f'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('8a69eabb-e264-49b5-8901-9bc5e8f3d1fb'::uuid, $pea0$Pedís la reapertura directo a Gestiones N2.$pea0$, false, 1, $pea0$Con baja por anulación de pago, primero tiene que intervenir Cobranzas.$pea0$, null::int, null),
  ('5e2c78e6-d36f-459b-8772-a0f807fe7386'::uuid, $pea0$Derivás primero a Cobranzas para que valide el pago y autorice la reapertura.$pea0$, true, 2, $pea0$Es el paso previo obligatorio en esa situación.$pea0$, null::int, null),
  ('ebb3f1bc-2eea-4393-8eff-9ab47228792a'::uuid, $pea0$Le decís que no se puede reabrir nunca.$pea0$, false, 3, $pea0$Se puede, una vez regularizado y autorizado.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'f331ff58-1247-4389-8fde-291bda05305f'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '5ff81262-356b-414e-8677-4faee1ba84b4'::uuid, 'verdadero_falso', $pea0$Si un estudiante dice que quiere abandonar sus estudios, el asesor pide una baja de legajo a Gestiones N2.$pea0$, $pea0$Si quiere abandonar, corresponde el circuito de Riesgo de Baja; la baja de legajo es para duplicados, preinscripciones vencidas o legajos inactivos.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a30db4f8-2196-40c2-8467-e77bdfbfd87a'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'a30db4f8-2196-40c2-8467-e77bdfbfd87a'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '5ff81262-356b-414e-8677-4faee1ba84b4'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '4b76d45b-9828-41e8-8e9f-c2cd2148e1b0'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '5ff81262-356b-414e-8677-4faee1ba84b4'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('fb2a36fc-68c9-49ba-826a-344e7331e5c5'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('2f42af3b-6ebc-4584-84d9-b799c805a1c4'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '5ff81262-356b-414e-8677-4faee1ba84b4'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '3616f97d-e77d-4e1d-8bbd-d6cb2b505797'::uuid, '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid, 52, $pea0$Certificados para estudiantes$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Matías","canal":"whatsapp","consulta":"Necesito un certificado de alumno regular para la obra social. ¿Cómo lo pido? ¿Tarda mucho?"},{"tipo":"preguntar","opciones":[{"texto":"¿Ya intentó descargarlo del Portal de Estudiantes?","clave":true,"porque":"El de alumno regular se descarga ahí y tiene plena validez."},{"texto":"¿La entidad le pide expresamente firma digital?","clave":true,"porque":"Solo en ese caso se pide la versión firmada."},{"texto":"¿Para qué trámite y ante qué institución lo presenta?","clave":true,"porque":"Define qué certificado corresponde y es obligatorio en el pedido con firma digital."},{"texto":"¿Cuántas materias cursa?","clave":false,"porque":"No cambia el pedido."}]},{"tipo":"idea","titulo":"Alumno regular: del Portal, y con firma digital si se la piden","texto":"El certificado de alumno regular se descarga del Portal de Estudiantes y tiene plena validez. Solo si la entidad pide expresamente firma digital (por ejemplo, una obra social u organismo público), se pide por HubSpot a Trámites, \"Certificado de Alumno Regular con Firma Digital\", con DNI, legajo, carrera y el motivo, que es obligatorio. Tarda 3 días hábiles.","clave":"Del Portal tiene plena validez; con firma digital, solo si la entidad la exige.","ejemplo":"Matías lo descarga del Portal; si la obra social pide firma digital, lo pedís a Trámites con ese motivo."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Otros certificados por Trámites","texto":"Se piden por HubSpot a Trámites, con DNI, legajo y carrera, y tardan 10 días hábiles: el certificado de no sanción, el de porcentaje de avance y el de baja. El de baja se pide solo si el legajo ya está dado de baja; si no, primero se gestiona la baja (por Grupo de Riesgo).","clave":"No sanción, porcentaje de avance y baja: a Trámites, 10 días hábiles."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Extranjeros ante Migraciones","texto":"El certificado de alumno regular con legalización ministerial es solo para estudiantes extranjeros que lo presentan en la Dirección Nacional de Migraciones. Se pide junto con el analítico con legalización ministerial, porque el Ministerio no lo acepta por separado. Va a Secretaría Académica y tarda unos 90 días hábiles.","clave":"Legalización ministerial: extranjeros ante Migraciones, y siempre junto con el analítico."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Antes de derivar, revisá que los datos del estudiante estén bien: un error demora la gestión.\nPara el certificado de baja, verificá el estado del legajo antes de derivar, así no lo rechazan."},{"tipo":"cierre","resolucion":"A Matías le explicás que el certificado de alumno regular lo descarga del Portal de Estudiantes y tiene plena validez. Si la obra social le exige firma digital, lo pedís por HubSpot a Trámites con sus datos y ese motivo, y tarda 3 días hábiles.","recordar":"Alumno regular: del Portal; con firma digital solo si la entidad la pide."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-26-certificados-constancias-y-analiticos$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '3616f97d-e77d-4e1d-8bbd-d6cb2b505797'::uuid and id not in ('775af5b6-21a0-4446-8a9a-c6e07a72156c'::uuid, 'a6c206cf-624d-4791-859c-321bbda0841a'::uuid, '527e49ae-2e54-4cd3-8c93-b5f21cab8d6d'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '775af5b6-21a0-4446-8a9a-c6e07a72156c'::uuid, 'opcion_multiple', $pea0$Una estudiante pide el certificado de alumno regular para presentar en el trabajo, y no le pidieron firma digital. ¿Qué hacés?$pea0$, $pea0$El certificado de alumno regular se descarga del Portal y tiene plena validez; con firma digital, solo si la entidad lo pide.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3616f97d-e77d-4e1d-8bbd-d6cb2b505797'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '3616f97d-e77d-4e1d-8bbd-d6cb2b505797'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '775af5b6-21a0-4446-8a9a-c6e07a72156c'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '775af5b6-21a0-4446-8a9a-c6e07a72156c'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('d8cf0328-a238-4fff-8deb-3a6baab433a3'::uuid, $pea0$Lo pedís a Trámites con firma digital, por las dudas.$pea0$, false, 1, $pea0$Solo se deriva si la entidad exige expresamente firma digital.$pea0$, null::int, null),
  ('e6477b51-64a7-4ef5-8517-8f6793e3d0df'::uuid, $pea0$Le indicás que lo descargue del Portal de Estudiantes: tiene plena validez.$pea0$, true, 2, $pea0$Es lo que corresponde si no le exigen firma digital.$pea0$, null::int, null),
  ('c3df91af-0263-4701-85e4-661335a660b1'::uuid, $pea0$Le pedís que espere 10 días hábiles.$pea0$, false, 3, $pea0$Lo puede descargar en el momento.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '775af5b6-21a0-4446-8a9a-c6e07a72156c'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'a6c206cf-624d-4791-859c-321bbda0841a'::uuid, 'opcion_multiple', $pea0$Un estudiante pide el certificado de baja, pero su legajo sigue activo. ¿Qué hacés?$pea0$, $pea0$El certificado de baja se pide solo cuando el legajo ya está dado de baja; si no, primero se gestiona la baja.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3616f97d-e77d-4e1d-8bbd-d6cb2b505797'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '3616f97d-e77d-4e1d-8bbd-d6cb2b505797'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'a6c206cf-624d-4791-859c-321bbda0841a'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'a6c206cf-624d-4791-859c-321bbda0841a'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('59c26f80-4b3a-416b-8db8-bdb49ab874f5'::uuid, $pea0$Derivás el certificado a Trámites igual.$pea0$, false, 1, $pea0$El legajo tiene que estar dado de baja antes de pedir el certificado.$pea0$, null::int, null),
  ('22c31da0-7b53-4947-8a27-5660ec9dd919'::uuid, $pea0$Primero se gestiona la baja (circuito de Grupo de Riesgo) y después se pide el certificado.$pea0$, true, 2, $pea0$El estudiante debe estar dado de baja al momento de solicitarlo.$pea0$, null::int, null),
  ('c5eb270a-fa54-4693-83a5-e21218a99f92'::uuid, $pea0$Le hacés un certificado de no sanción en su lugar.$pea0$, false, 3, $pea0$Son certificados distintos.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'a6c206cf-624d-4791-859c-321bbda0841a'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '527e49ae-2e54-4cd3-8c93-b5f21cab8d6d'::uuid, 'opcion_multiple', $pea0$Un estudiante extranjero necesita el certificado de alumno regular legalizado para Migraciones. ¿Qué tenés en cuenta?$pea0$, $pea0$El alumno regular con legalización ministerial es para extranjeros ante Migraciones y se pide junto con el analítico legalizado.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '3616f97d-e77d-4e1d-8bbd-d6cb2b505797'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '3616f97d-e77d-4e1d-8bbd-d6cb2b505797'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '527e49ae-2e54-4cd3-8c93-b5f21cab8d6d'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '527e49ae-2e54-4cd3-8c93-b5f21cab8d6d'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('1b2f6ea3-2de2-437c-8b5d-d7fef6028442'::uuid, $pea0$Que lo descarga del Portal.$pea0$, false, 1, $pea0$El del Portal no tiene legalización ministerial.$pea0$, null::int, null),
  ('104b50e7-f0a5-4834-8b25-5f99a2304e84'::uuid, $pea0$Que se pide junto con el analítico con legalización ministerial, a Secretaría Académica, y tarda unos 90 días hábiles.$pea0$, true, 2, $pea0$El Ministerio no admite gestionarlo por separado.$pea0$, null::int, null),
  ('c6c97d65-fbda-426f-8c09-89c08cf8f469'::uuid, $pea0$Que se pide a Trámites con firma digital y tarda 3 días.$pea0$, false, 3, $pea0$La firma digital no reemplaza la legalización ministerial.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '527e49ae-2e54-4cd3-8c93-b5f21cab8d6d'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'f7f2fbd2-c2f2-4b56-85c0-bd1096fef140'::uuid, '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid, 53, $pea0$Analíticos parciales$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Gabriela","canal":"mostrador","consulta":"Me voy a cambiar de universidad y me piden el analítico con los programas de las materias. Pagué la tasa hace como cuatro meses. ¿Me lo hacen?"},{"tipo":"preguntar","opciones":[{"texto":"¿Necesita el analítico con programas o sin programas?","clave":true,"porque":"Son trámites distintos, con tasas distintas."},{"texto":"¿Cuándo pagó la tasa y para qué trámite?","clave":true,"porque":"El comprobante vale 3 meses y tiene que corresponder a ese analítico."},{"texto":"¿Tiene cargados el DNI frente y dorso, el analítico secundario y la documentación obligatoria de su carrera?","clave":true,"porque":"Sin la documentación completa y legible, no se deriva."},{"texto":"¿En qué turno cursaba?","clave":false,"porque":"No cambia el trámite."}]},{"tipo":"idea","titulo":"Qué necesita para pedirlo","texto":"Para cualquier analítico parcial tiene que tener el DNI frente y dorso digitalizado, el analítico secundario digitalizado, la documentación obligatoria de su carrera completa y la tasa abonada y facturada. El comprobante de pago vale 3 meses: si pagó antes y el arancel aumentó, primero paga la diferencia.","clave":"DNI, analítico secundario, legajo completo y tasa pagada (vale 3 meses).","ejemplo":"Gabriela pagó hace cuatro meses: si el arancel aumentó, primero paga la diferencia."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Sin programas, con programas o legalizado","texto":"Todos van por HubSpot a Secretaría Académica con DNI y legajo, y tardan 5 días hábiles: el analítico sin programas, el analítico con programas (la tasa tiene que ser específica de ese trámite) y el analítico con programas y legalización ministerial. Este último, además, tarda unos 90 días hábiles en el Ministerio y lleva el país y la institución donde lo presenta.","clave":"A Secretaría Académica, 5 días hábiles; con legalización ministerial, unos 90 más."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"En papel, solo si la entidad no acepta digital","texto":"El analítico se emite en formato digital. Solo de forma excepcional se pide en papel, si la entidad externa no acepta documentación digital: tiene que mandar una nota que lo diga, firmada por la propia entidad, y en el ticket se indica el CAU de envío.","clave":"Papel, solo con nota de la entidad que no acepta digital, y el CAU de envío."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"No hace falta un formulario: el analítico se pide solo por ticket de HubSpot.\nSi pide el analítico para cambiarse de universidad, también puede estar por darse de baja: aplicá el circuito de Riesgo de Baja."},{"tipo":"cierre","resolucion":"A Gabriela le revisás que tenga el DNI, el analítico secundario y la documentación de su carrera cargados. Como pagó la tasa hace más de 3 meses, si el arancel cambió, primero paga la diferencia. Después pedís por HubSpot a Secretaría Académica el analítico con programas, que tarda 5 días hábiles.","recordar":"Analítico: documentación completa, tasa vigente y ticket a Secretaría Académica."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-26-certificados-constancias-y-analiticos$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'f7f2fbd2-c2f2-4b56-85c0-bd1096fef140'::uuid and id not in ('aa2cf104-58a9-4601-8267-4b2dd7d30065'::uuid, '009bd9ec-d9ee-431f-8050-eaff873d0468'::uuid, '6015e9f4-8060-4766-8231-ae9f9f3e8604'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'aa2cf104-58a9-4601-8267-4b2dd7d30065'::uuid, 'opcion_multiple', $pea0$Un estudiante pagó la tasa del analítico sin programas hace 4 meses y desde entonces aumentó el arancel. ¿Qué le decís?$pea0$, $pea0$El comprobante de pago vale 3 meses: si el arancel aumentó y pagó antes, abona la diferencia antes de iniciar el trámite.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'f7f2fbd2-c2f2-4b56-85c0-bd1096fef140'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'f7f2fbd2-c2f2-4b56-85c0-bd1096fef140'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'aa2cf104-58a9-4601-8267-4b2dd7d30065'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'aa2cf104-58a9-4601-8267-4b2dd7d30065'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('a59f2f5e-9f60-408b-821c-4e60402688d9'::uuid, $pea0$Que lo pedís igual: ya pagó.$pea0$, false, 1, $pea0$El comprobante vale 3 meses.$pea0$, null::int, null),
  ('6cdb2c91-5516-40ef-8cc0-f2b1f679d984'::uuid, $pea0$Que primero tiene que pagar la diferencia y después se pide el analítico.$pea0$, true, 2, $pea0$Si hubo una actualización y el pago tiene más de 3 meses, abona la diferencia antes.$pea0$, null::int, null),
  ('b8a68466-0f16-4da4-85e6-11d0fa0a86d6'::uuid, $pea0$Que tiene que pagar la tasa completa de nuevo.$pea0$, false, 3, $pea0$Solo paga la diferencia.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'aa2cf104-58a9-4601-8267-4b2dd7d30065'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '009bd9ec-d9ee-431f-8050-eaff873d0468'::uuid, 'opcion_multiple', $pea0$Una estudiante necesita el analítico con programas para presentar en otro país, con legalización. ¿Cuánto tarda y qué datos agregás?$pea0$, $pea0$El analítico con programas y legalización ministerial lleva el país y la institución, y suma unos 90 días hábiles ante el Ministerio.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'f7f2fbd2-c2f2-4b56-85c0-bd1096fef140'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'f7f2fbd2-c2f2-4b56-85c0-bd1096fef140'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '009bd9ec-d9ee-431f-8050-eaff873d0468'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '009bd9ec-d9ee-431f-8050-eaff873d0468'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('74df8b71-15ff-42bb-8db3-7f71a96add52'::uuid, $pea0$5 días hábiles, solo con DNI y legajo.$pea0$, false, 1, $pea0$La legalización ministerial suma el trámite ante el Ministerio.$pea0$, null::int, null),
  ('f21e1688-e1d8-4a6e-8688-962215f179a1'::uuid, $pea0$5 días hábiles del área más unos 90 días hábiles en el Ministerio, e indicás el país y la institución donde lo presenta.$pea0$, true, 2, $pea0$Son los plazos y datos del analítico con legalización ministerial.$pea0$, null::int, null),
  ('c75d4055-6fac-48de-8fa0-732938f78f35'::uuid, $pea0$3 días hábiles, por Trámites.$pea0$, false, 3, $pea0$Va a Secretaría Académica.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '009bd9ec-d9ee-431f-8050-eaff873d0468'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '6015e9f4-8060-4766-8231-ae9f9f3e8604'::uuid, 'verdadero_falso', $pea0$El analítico parcial sin programas se pide completando un formulario aparte, además del ticket.$pea0$, $pea0$No requiere formulario: se gestiona solo con ticket de HubSpot.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'f7f2fbd2-c2f2-4b56-85c0-bd1096fef140'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'f7f2fbd2-c2f2-4b56-85c0-bd1096fef140'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '6015e9f4-8060-4766-8231-ae9f9f3e8604'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '6015e9f4-8060-4766-8231-ae9f9f3e8604'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('5b22504e-1f20-4376-8e62-937a69cb4039'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('2485c2c1-5c14-4635-84b4-2994c127e11c'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '6015e9f4-8060-4766-8231-ae9f9f3e8604'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'ad18eb5d-d62f-413e-879b-3ae42fc2e648'::uuid, '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid, 54, $pea0$Certificados para egresados$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Federico","canal":"telefono","consulta":"Terminé la carrera hace dos semanas y para un trabajo me piden algo que diga que el título está en trámite. ¿Qué tengo que pedir?"},{"tipo":"preguntar","opciones":[{"texto":"¿Figura como activo o egresado en SGU?","clave":true,"porque":"Es la primera validación para el certificado de título en trámite."},{"texto":"¿El trámite del título ya figura como \"Trámite Finalizado\" en SIDCer?","clave":true,"porque":"Si ya está finalizado, no corresponde el certificado de título en trámite."},{"texto":"¿Tiene completa la documentación de su carrera, con el DNI físico?","clave":true,"porque":"Sin la documentación completa no se emite."},{"texto":"¿Qué nota sacó en el trabajo final?","clave":false,"porque":"No cambia el pedido."}]},{"tipo":"idea","titulo":"Título en trámite","texto":"Acredita que terminó la carrera y que el título se está emitiendo. Antes de derivar, validá que figure activo o egresado en SGU, que el título no esté \"Trámite Finalizado\" en SIDCer y que la documentación esté completa. Va por HubSpot a Operación Títulos, con DNI y legajo (y si es título intermedio). Tarda 7 días hábiles.","clave":"Activo o egresado en SGU, sin \"Trámite Finalizado\" en SIDCer y documentación completa.","ejemplo":"Federico terminó hace dos semanas: validás SGU y SIDCer y lo pedís a Operación Títulos."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Digital, y vale un año","texto":"El certificado se emite en formato digital: se puede compartir todas las veces que haga falta, pero si se imprime pierde su validez como original. Vence al año de emitido. En papel, solo si la institución que lo pide manda una nota firmada y sellada por ella diciendo que no acepta firma digital.","clave":"Digital, se comparte las veces que quiera; impreso pierde validez; vence al año."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Constancia de egreso y certificado de horas","texto":"La constancia de egreso certifica que aprobó todos los requisitos de la carrera: figura como egresado y va a Operación Títulos con DNI, legajo y el correo de la institución que la pide. El certificado de horas es solo para egresados, va a Trámites y hay que indicar si es de horas cátedra o reloj; tarda 10 días hábiles.","clave":"Constancia de egreso a Operación Títulos; horas, solo egresados y aclarando cátedra o reloj."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"No sirve el DNI descargado de Mi Argentina: tiene que ser la imagen del DNI físico vigente.\nEn Enfermería y Psicología, para poder ejercer con matrícula provisoria, se envía además el certificado de matrícula y el analítico parcial sin programas, sin costo."},{"tipo":"cierre","resolucion":"A Federico le corresponde el certificado de título en trámite. Validás que figure en SGU como activo o egresado, que el título no esté finalizado en SIDCer y que su documentación esté completa. Lo pedís a Operación Títulos y le avisás que llega en formato digital, que lo puede compartir sin imprimirlo y que vence al año.","recordar":"Título en trámite: validás SGU y SIDCer; digital, sin imprimir, vale un año."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-26-certificados-constancias-y-analiticos$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'ad18eb5d-d62f-413e-879b-3ae42fc2e648'::uuid and id not in ('7c93b768-f8f4-4d5c-8233-7bb4ea8bd976'::uuid, '65680031-86ba-4cbb-8bea-882bff0a2081'::uuid, '90df7bb3-0bcd-4280-811a-459cef821820'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '7c93b768-f8f4-4d5c-8233-7bb4ea8bd976'::uuid, 'opcion_multiple', $pea0$En SIDCer el título de una egresada figura como "Trámite Finalizado" y pide el certificado de título en trámite. ¿Qué hacés?$pea0$, $pea0$Si el título figura como "Trámite Finalizado" en SIDCer, no corresponde pedir el certificado de título en trámite.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'ad18eb5d-d62f-413e-879b-3ae42fc2e648'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'ad18eb5d-d62f-413e-879b-3ae42fc2e648'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '7c93b768-f8f4-4d5c-8233-7bb4ea8bd976'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '7c93b768-f8f4-4d5c-8233-7bb4ea8bd976'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('d2fe536d-0b77-4265-82a8-87f81ecea0a9'::uuid, $pea0$Lo pedís igual a Operación Títulos.$pea0$, false, 1, $pea0$Si el trámite figura finalizado, no corresponde ese certificado.$pea0$, null::int, null),
  ('d5254579-f5c6-420e-84aa-e4f74b1db48a'::uuid, $pea0$Le explicás que no corresponde: el trámite del título ya está finalizado.$pea0$, true, 2, $pea0$Es la validación previa a la derivación.$pea0$, null::int, null),
  ('de21bf53-a724-410e-87a1-bcb7bd1d4764'::uuid, $pea0$Le pedís la constancia de egreso en su lugar, sin consultarle.$pea0$, false, 3, $pea0$Primero hay que entender qué necesita; el de título en trámite no corresponde.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '7c93b768-f8f4-4d5c-8233-7bb4ea8bd976'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '65680031-86ba-4cbb-8bea-882bff0a2081'::uuid, 'opcion_multiple', $pea0$Un egresado imprimió su certificado de título en trámite y lo presentó en papel. ¿Qué tenés que saber?$pea0$, $pea0$El certificado de título en trámite es digital: se comparte tantas veces como haga falta, pero impreso pierde validez.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'ad18eb5d-d62f-413e-879b-3ae42fc2e648'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'ad18eb5d-d62f-413e-879b-3ae42fc2e648'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '65680031-86ba-4cbb-8bea-882bff0a2081'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '65680031-86ba-4cbb-8bea-882bff0a2081'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('fd4877a7-dd5b-4073-8a77-e196915fada6'::uuid, $pea0$Que impreso vale igual.$pea0$, false, 1, $pea0$Impreso pierde su validez como original digital.$pea0$, null::int, null),
  ('52ac6043-95cc-450f-8c09-d2e5d1c6056d'::uuid, $pea0$Que al imprimirlo pierde la validez de original: tiene que compartirlo en formato digital.$pea0$, true, 2, $pea0$El certificado se emite digital y se comparte por medios digitales.$pea0$, null::int, null),
  ('1936e744-fe23-46ae-8e80-6509af0df97f'::uuid, $pea0$Que tiene que pedir uno nuevo en papel sin ninguna nota.$pea0$, false, 3, $pea0$En papel solo con nota firmada y sellada por la institución.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '65680031-86ba-4cbb-8bea-882bff0a2081'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '90df7bb3-0bcd-4280-811a-459cef821820'::uuid, 'verdadero_falso', $pea0$El certificado de horas lo puede pedir un estudiante que todavía está cursando.$pea0$, $pea0$El certificado de horas es solo para egresados, y hay que indicar si es de horas cátedra o reloj.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'ad18eb5d-d62f-413e-879b-3ae42fc2e648'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'ad18eb5d-d62f-413e-879b-3ae42fc2e648'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '90df7bb3-0bcd-4280-811a-459cef821820'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '90df7bb3-0bcd-4280-811a-459cef821820'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('4b213b36-8379-4d59-871d-64a8a3f8a96b'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('2ff63a3c-ea7b-477e-81fa-ed725e61296b'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '90df7bb3-0bcd-4280-811a-459cef821820'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'a874beba-a5ae-41bc-8344-5d9150ed4be6'::uuid, '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid, 55, $pea0$Equivalencias externas: con regla y sin regla$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Lorena","canal":"whatsapp","consulta":"Hice tres años de Contador en otra universidad. ¿Cómo pido que me reconozcan las materias? ¿Cuánto tarda?"},{"tipo":"preguntar","opciones":[{"texto":"¿Su carrera y plan de origen tienen predictamen con la carrera de Siglo 21?","clave":true,"porque":"Con predictamen (con regla) tarda 3 días hábiles; sin regla, 30."},{"texto":"¿Tiene el analítico y el plan de estudios legalizados por la institución de origen?","clave":true,"porque":"Son la documentación básica de cualquier trámite."},{"texto":"¿Tiene los programas de las materias, si hace falta análisis?","clave":true,"porque":"Las materias sin regla necesitan los programas legalizados."},{"texto":"¿Qué promedio tenía en la otra universidad?","clave":false,"porque":"No define el tipo de trámite."}]},{"tipo":"idea","titulo":"Se pide en el Portal de Equivalencias","texto":"El estudiante inicia el trámite en tusestudiosprevios.21.edu.ar: elige equivalencias externas, carga sus datos, la institución, la carrera y el plan de origen, y el portal le sugiere las carreras con predictamen y las materias equivalentes. Al final adjunta la documentación y recibe un número de solicitud por mail. El asesor puede probar antes el simulador.","clave":"El trámite lo hace el estudiante en el Portal de Equivalencias; el asesor tiene el simulador.","ejemplo":"Lorena carga su carrera de Contador y su plan: el portal le muestra qué materias tienen regla."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Con regla o sin regla","texto":"Con regla (con predictamen) no hace falta análisis de un tutor ni programas: alcanzan el analítico y el plan legalizados, y tarda 3 días hábiles. Sin regla, el estudiante elige la materia de Siglo 21 que considera equivalente por los contenidos mínimos, adjunta los programas legalizados y lo analiza un tutor: 30 días hábiles. Si mezcla las dos, es mixta y se resuelve en partes.","clave":"Con regla: 3 días hábiles, sin programas. Sin regla: 30 días hábiles, con programas y tutor."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Si el tutor rechaza una sugerencia","texto":"El tutor puede rechazar la materia que sugirió el estudiante y reconocer la de origen por otra materia de Siglo 21 que sí considera equivalente. En el portal, el estudiante ve el motivo del rechazo de cada materia y cuál se le otorgó.","clave":"Una sugerencia rechazada puede reconocerse por otra materia de Siglo 21."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Si el estudiante tiene dudas sobre qué documentación le falta o le observaron, va por HubSpot a Equivalencias como \"Consulta documentación de equivalencias\", aclarando el tipo de trámite y qué documentación se consulta."},{"tipo":"cierre","resolucion":"A Lorena le explicás que inicia el trámite en el Portal de Equivalencias con su carrera y plan de origen. Si hay predictamen, alcanza con el analítico y el plan legalizados, y tarda 3 días hábiles. Las materias sin regla necesitan los programas legalizados y las analiza un tutor en 30 días hábiles.","recordar":"Con regla, 3 días hábiles; sin regla, programas, tutor y 30 días hábiles."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-30-equivalencias-externas$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'a874beba-a5ae-41bc-8344-5d9150ed4be6'::uuid and id not in ('2a232620-46fc-48e4-83dd-22ad441701f5'::uuid, 'c2eccfc4-443c-464f-827c-132193098017'::uuid, '50539a92-9185-4616-81ad-ff8626998dbf'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '2a232620-46fc-48e4-83dd-22ad441701f5'::uuid, 'opcion_multiple', $pea0$La carrera de origen de un estudiante tiene predictamen con su carrera de Siglo 21. ¿Qué documentación necesita y cuánto tarda?$pea0$, $pea0$Con regla (predictamen), alcanza con el analítico y el plan legalizados, sin análisis del tutor: 3 días hábiles.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a874beba-a5ae-41bc-8344-5d9150ed4be6'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'a874beba-a5ae-41bc-8344-5d9150ed4be6'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '2a232620-46fc-48e4-83dd-22ad441701f5'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '2a232620-46fc-48e4-83dd-22ad441701f5'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('22869b19-5a68-4569-8d7b-6d573df0620c'::uuid, $pea0$Analítico, plan y programas de todas las materias; 30 días hábiles.$pea0$, false, 1, $pea0$Con regla no hacen falta programas ni análisis del tutor.$pea0$, null::int, null),
  ('0f974ef7-d556-4349-8cdf-655e4fb8df7c'::uuid, $pea0$El analítico y el plan de estudios legalizados; 3 días hábiles.$pea0$, true, 2, $pea0$Es el trámite con regla, con predictamen automático.$pea0$, null::int, null),
  ('ed4ccfc1-4763-40f4-8881-7b6013261049'::uuid, $pea0$Solo el DNI; se resuelve en el día.$pea0$, false, 3, $pea0$Hace falta el analítico y el plan legalizados.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '2a232620-46fc-48e4-83dd-22ad441701f5'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'c2eccfc4-443c-464f-827c-132193098017'::uuid, 'opcion_multiple', $pea0$Un estudiante pide equivalencias de materias sin regla. ¿Qué tiene que hacer?$pea0$, $pea0$En las materias sin regla, el estudiante sugiere la equivalente por contenidos mínimos, adjunta programas y un tutor lo analiza en 30 días hábiles.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a874beba-a5ae-41bc-8344-5d9150ed4be6'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'a874beba-a5ae-41bc-8344-5d9150ed4be6'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'c2eccfc4-443c-464f-827c-132193098017'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'c2eccfc4-443c-464f-827c-132193098017'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('7da68381-5cd3-4d8c-8258-607c2e4329b9'::uuid, $pea0$Nada: el sistema le asigna las materias solo.$pea0$, false, 1, $pea0$Sin regla, el estudiante sugiere las materias equivalentes.$pea0$, null::int, null),
  ('06adc194-5efe-45f6-8225-9112ee782eb3'::uuid, $pea0$Elegir la materia de Siglo 21 que considera equivalente por los contenidos mínimos y adjuntar los programas legalizados; lo analiza un tutor.$pea0$, true, 2, $pea0$Es el proceso sin predictamen.$pea0$, null::int, null),
  ('5084ed89-2fc3-42e9-8c7c-ec6e91bbe3f1'::uuid, $pea0$Pedirle al asesor que cargue las equivalencias.$pea0$, false, 3, $pea0$El trámite lo inicia el estudiante en el Portal.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'c2eccfc4-443c-464f-827c-132193098017'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '50539a92-9185-4616-81ad-ff8626998dbf'::uuid, 'verdadero_falso', $pea0$Si el tutor rechaza la materia que sugirió el estudiante, la de origen no puede reconocerse por ninguna otra.$pea0$, $pea0$El tutor puede reconocerla por otra materia de Siglo 21 que considere equivalente.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'a874beba-a5ae-41bc-8344-5d9150ed4be6'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'a874beba-a5ae-41bc-8344-5d9150ed4be6'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '50539a92-9185-4616-81ad-ff8626998dbf'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '50539a92-9185-4616-81ad-ff8626998dbf'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('3434f94e-7f21-464f-8bc6-ddfe7e84917e'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('ddd89504-5d6b-4efb-8dd7-5efc298f242f'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '50539a92-9185-4616-81ad-ff8626998dbf'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select '0e756ed5-47e2-4313-8b5f-9bffd743d8f2'::uuid, '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid, 56, $pea0$Equivalencias condicionales y seguimiento$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Santiago","canal":"mostrador","consulta":"Me dieron materias por equivalencia pero figuran como \"Regular condicional\". ¿Qué significa? ¿Las puedo perder?"},{"tipo":"preguntar","opciones":[{"texto":"¿Ya presentó la documentación definitiva y completa?","clave":true,"porque":"Las condicionales se confirman cuando la presenta en plazo."},{"texto":"¿Su trámite era con regla o sin regla?","clave":true,"porque":"Con regla queda \"Regular condicional\"; sin regla, \"Regular condicional por sugerencia\"."},{"texto":"¿Tiene el número de solicitud?","clave":true,"porque":"Con el número y su DNI ve el estado en el Portal."},{"texto":"¿En qué CAU se inscribió?","clave":false,"porque":"No cambia el estado del trámite."}]},{"tipo":"idea","titulo":"Qué es una equivalencia condicional","texto":"Si hay predictamen pero todavía no presentó la documentación completa y definitiva, las materias se otorgan como \"Regular condicional\" desde el primer día del período que pidió. Si no completa la documentación en el plazo, esas materias, y las correlativas que haya cursado, quedan Libre. En las materias sin regla quedan \"Regular condicional por sugerencia\" hasta que se resuelva.","clave":"Condicional: tiene que completar la documentación en plazo o quedan Libre, con sus correlativas.","ejemplo":"Santiago tiene que presentar el analítico y el plan legalizados antes del plazo para conservarlas."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"Cómo se sigue el trámite","texto":"El estudiante ve el estado en el Portal de Equivalencias con su número de solicitud y su DNI, incluido el motivo de rechazo de cada materia. El asesor lo consulta en el seguimiento de equivalencias, entrando con su usuario del Campus Virtual y buscando por DNI. Recién si hace falta, va por HubSpot a Equivalencias como \"Estado de trámites de equivalencias\", con el número de solicitud.","clave":"El estudiante, en el Portal; el asesor, en el seguimiento por DNI; derivás solo si hace falta."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Revisión, sin un formulario nuevo","texto":"Si no está conforme con el resultado, pide la revisión desde el Portal de Equivalencias, siguiendo el paso a paso de revisión (carga sus datos, la institución, la carrera y el plan), sin generar un formulario nuevo.","clave":"La revisión se pide en el Portal, sin generar un formulario nuevo."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Si una materia sugerida se rechaza y queda Libre, también quedan Libre las correlativas que dependen de ella.\nEl plazo exacto para completar la documentación figura en el formulario y se avisa por mail: confirmalo en el trámite del estudiante, porque la base menciona más de un plazo."},{"tipo":"cierre","resolucion":"A Santiago le explicás que \"Regular condicional\" significa que le otorgaron las materias, pero que tiene que presentar la documentación definitiva en el plazo que figura en su trámite. Si no la presenta, esas materias y las correlativas que haya cursado quedan Libre. Puede seguir el estado en el Portal con su número de solicitud y su DNI.","recordar":"Condicional: documentación en plazo o quedan Libre; el estado, en el Portal."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-30-equivalencias-externas$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = '0e756ed5-47e2-4313-8b5f-9bffd743d8f2'::uuid and id not in ('149598c2-2599-4dc2-87c4-affb6a24f623'::uuid, '57a546cd-262b-4726-8802-60c71456fad7'::uuid, '86cbc9dc-3418-475e-8345-a8379ed148bc'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '149598c2-2599-4dc2-87c4-affb6a24f623'::uuid, 'opcion_multiple', $pea0$Una estudiante tiene materias en "Regular condicional" y no presentó la documentación en el plazo. ¿Qué pasa?$pea0$, $pea0$Si no completa la documentación en plazo, las materias condicionales y sus correlativas cursadas quedan Libre.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0e756ed5-47e2-4313-8b5f-9bffd743d8f2'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = '0e756ed5-47e2-4313-8b5f-9bffd743d8f2'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '149598c2-2599-4dc2-87c4-affb6a24f623'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '149598c2-2599-4dc2-87c4-affb6a24f623'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('8ba0f201-27ae-40f2-899e-85aba2ebad81'::uuid, $pea0$Se quedan regulares igual.$pea0$, false, 1, $pea0$Sin la documentación en plazo, pierden la condición.$pea0$, null::int, null),
  ('064868c8-d662-45cc-8e68-2b97dea460a5'::uuid, $pea0$Las materias, y las correlativas que haya cursado, quedan Libre.$pea0$, true, 2, $pea0$Es la consecuencia de no completar la documentación.$pea0$, null::int, null),
  ('8345d102-8069-42d9-8221-b8b8a786241b'::uuid, $pea0$Se extiende el plazo automáticamente.$pea0$, false, 3, $pea0$No hay extensión automática.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '149598c2-2599-4dc2-87c4-affb6a24f623'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '57a546cd-262b-4726-8802-60c71456fad7'::uuid, 'opcion_multiple', $pea0$Un estudiante pregunta cómo va su trámite de equivalencias. ¿Qué hacés primero?$pea0$, $pea0$Primero se revisa el estado en el seguimiento (por DNI) o en el Portal; recién después, si hace falta, se deriva con el número de solicitud.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0e756ed5-47e2-4313-8b5f-9bffd743d8f2'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = '0e756ed5-47e2-4313-8b5f-9bffd743d8f2'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '57a546cd-262b-4726-8802-60c71456fad7'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '57a546cd-262b-4726-8802-60c71456fad7'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('4890e8cc-8829-4293-81bb-92725c8af0a2'::uuid, $pea0$Derivás a Equivalencias sin revisar nada.$pea0$, false, 1, $pea0$Antes de derivar se verifica el estado en las herramientas de seguimiento.$pea0$, null::int, null),
  ('fa064015-e028-4ad6-855a-e673596fa583'::uuid, $pea0$Consultás el seguimiento por su DNI y le explicás que también lo ve en el Portal con su número de solicitud.$pea0$, true, 2, $pea0$Es la validación previa; solo después, si hace falta, se deriva.$pea0$, null::int, null),
  ('3472d36e-390a-49d5-84a1-7b40069bbd2d'::uuid, $pea0$Le pedís que cargue un formulario nuevo.$pea0$, false, 3, $pea0$No hace falta un formulario nuevo para saber el estado.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '57a546cd-262b-4726-8802-60c71456fad7'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '86cbc9dc-3418-475e-8345-a8379ed148bc'::uuid, 'verdadero_falso', $pea0$Para pedir una revisión del resultado de equivalencias, el estudiante tiene que cargar un formulario nuevo.$pea0$, $pea0$La revisión se pide sin generar un formulario nuevo.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', '0e756ed5-47e2-4313-8b5f-9bffd743d8f2'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = '0e756ed5-47e2-4313-8b5f-9bffd743d8f2'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '86cbc9dc-3418-475e-8345-a8379ed148bc'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '86cbc9dc-3418-475e-8345-a8379ed148bc'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('0916f2f2-a8c5-4acf-81d1-99026bca6169'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('93d43a0a-daeb-4d42-837c-3af4f623afd5'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '86cbc9dc-3418-475e-8345-a8379ed148bc'::uuid)
on conflict do nothing;

insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select 'e1275742-2eff-42c9-8ead-b75247dcfc58'::uuid, '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid, 57, $pea0$Segunda carrera y doble titulación$pea0$, 'leccion', a.id,
       $pea0${"version":2,"tarjetas":[{"tipo":"caso","persona":"Pilar","canal":"telefono","consulta":"Estoy terminando Administración y quiero hacer también Recursos Humanos. ¿Me reconocen las materias que ya tengo?"},{"tipo":"preguntar","opciones":[{"texto":"¿Ya tiene creado el legajo de la carrera de destino?","clave":true,"porque":"Tiene que existir antes; en el CAU lo podés generar vos."},{"texto":"¿Tiene otro legajo de esa carrera con materias cargadas?","clave":true,"porque":"No hay que crear uno nuevo: impediría trasladar las materias."},{"texto":"¿Esas dos carreras tienen doble titulación entre sí?","clave":true,"porque":"Si la tienen, no se puede gestionar como segunda carrera."},{"texto":"¿En qué año empezó la primera carrera?","clave":false,"porque":"No define el reconocimiento."}]},{"tipo":"idea","titulo":"Segunda carrera: legajo y matriz","texto":"Antes de nada, revisá que el legajo de destino esté creado y que no haya legajos duplicados. Para saber qué materias se reconocen, consultá la Matriz de Equivalencias Internas: carrera de origen, carrera de destino, plan operativo (el de SGU) y resolución. Las materias con el mismo código y nombre se reconocen solas y no aparecen en la matriz.","clave":"Legajo de destino creado, sin duplicados, y la Matriz de Equivalencias Internas.","ejemplo":"Para Pilar buscás en la matriz Administración a Recursos Humanos con su plan y su resolución."},{"tipo":"probalo","n":1},{"tipo":"idea","titulo":"El ticket a Equivalencias","texto":"La segunda carrera va por HubSpot a Equivalencias, tipificación \"Equivalencias internas por segunda carrera\", con DNI, legajos de origen y de destino, carreras de origen y de destino, y el detalle del pedido. Mostrale al estudiante cómo identificar su carrera, su plan operativo y la resolución en la matriz.","clave":"A Equivalencias con los dos legajos y las dos carreras."},{"tipo":"probalo","n":2},{"tipo":"idea","titulo":"Doble titulación","texto":"Si las carreras tienen doble titulación, no va como segunda carrera. Si todavía no egresó de la primera, las materias por competencia se otorgan como aprobadas condicionales y pasan a definitivas cuando egresa. Si ya egresó, se otorgan definitivas. El Seminario Final se pide recién después de aprobar el EFIP II. Va a Equivalencias como \"Equivalencias internas por doble titulación\".","clave":"Doble titulación: condicionales hasta egresar; el Seminario Final, después del EFIP II."},{"tipo":"probalo","n":3},{"tipo":"ojo","texto":"Que una materia no figure en la matriz no quiere decir que no se reconozca: primero mirá si tiene el mismo código y nombre en las dos carreras.\nSi las carreras tienen doble titulación pero todavía no cumple los requisitos, puede esperar a cumplirlos o pedir un cambio de carrera."},{"tipo":"cierre","resolucion":"A Pilar le revisás que tenga creado el legajo de Recursos Humanos, sin duplicados, y si esas carreras tienen doble titulación. Consultás la matriz con su plan y resolución para contarle qué materias se le reconocen, y derivás a Equivalencias con los dos legajos y las dos carreras.","recordar":"Segunda carrera: legajo correcto, matriz y ticket a Equivalencias."}]}$pea0$::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = $pea0$kb-28-equivalencias-internas$pea0$ and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.preguntas
where item_id = 'e1275742-2eff-42c9-8ead-b75247dcfc58'::uuid and id not in ('5693d69d-9af3-4a20-8170-b6bdd3b949fc'::uuid, '29c09d34-fef0-41af-879a-a63e07a1ad1e'::uuid, 'df17e043-09c5-45c9-895f-a3b47c5aa056'::uuid)
  and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '5693d69d-9af3-4a20-8170-b6bdd3b949fc'::uuid, 'opcion_multiple', $pea0$Un estudiante quiere empezar una segunda carrera y ya tiene un legajo de esa carrera con materias cargadas. ¿Qué hacés?$pea0$, $pea0$Antes de gestionar una segunda carrera, se verifica que no haya legajos duplicados; si ya existe uno con materias, se usa ese.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'e1275742-2eff-42c9-8ead-b75247dcfc58'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 1
where exists (select 1 from public.items where id = 'e1275742-2eff-42c9-8ead-b75247dcfc58'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '5693d69d-9af3-4a20-8170-b6bdd3b949fc'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '5693d69d-9af3-4a20-8170-b6bdd3b949fc'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('f25f52fe-063b-4aa9-86c0-063e5561dea2'::uuid, $pea0$Le creás un legajo nuevo para empezar de cero.$pea0$, false, 1, $pea0$Un legajo adicional puede impedir el traslado de las materias.$pea0$, null::int, null),
  ('5363c4b4-b611-4ff8-8bf5-bcd89bea9bd0'::uuid, $pea0$Usás el legajo que ya existe: no hay que crear uno nuevo.$pea0$, true, 2, $pea0$Hay que evitar legajos duplicados.$pea0$, null::int, null),
  ('cd97c7c9-2bcd-49d5-8c3a-48fb7cac3da3'::uuid, $pea0$Derivás a Admisión para que lo dupliquen.$pea0$, false, 3, $pea0$No corresponde duplicar el legajo.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '5693d69d-9af3-4a20-8170-b6bdd3b949fc'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select '29c09d34-fef0-41af-879a-a63e07a1ad1e'::uuid, 'opcion_multiple', $pea0$Una materia de la carrera de origen no aparece en la Matriz de Equivalencias Internas. ¿Qué tenés en cuenta?$pea0$, $pea0$Las materias con el mismo código y nombre se reconocen automáticamente y por eso no aparecen en la matriz.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'e1275742-2eff-42c9-8ead-b75247dcfc58'::uuid, $pea0${"una":true}$pea0$::jsonb, now() + interval '1 millisecond' * 2
where exists (select 1 from public.items where id = 'e1275742-2eff-42c9-8ead-b75247dcfc58'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = '29c09d34-fef0-41af-879a-a63e07a1ad1e'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, '29c09d34-fef0-41af-879a-a63e07a1ad1e'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('f5747e0e-e6ce-4d49-8d53-5a9299ecf992'::uuid, $pea0$Que no se reconoce.$pea0$, false, 1, $pea0$La ausencia en la matriz no significa que no se reconozca.$pea0$, null::int, null),
  ('fe0c024d-fcc6-49ff-833d-184cbe1dcdcf'::uuid, $pea0$Que puede reconocerse sola si tiene el mismo código y nombre en las dos carreras: eso no figura en la matriz.$pea0$, true, 2, $pea0$Las materias de igual código y nombre se reconocen al crear el legajo de destino.$pea0$, null::int, null),
  ('caac6199-661b-4c56-8562-7e2eb30215ce'::uuid, $pea0$Que hay que pedir un análisis de tutor.$pea0$, false, 3, $pea0$Primero se verifica si coincide el código y el nombre.$pea0$, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = '29c09d34-fef0-41af-879a-a63e07a1ad1e'::uuid)
on conflict do nothing;

insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config, created_at)
select 'df17e043-09c5-45c9-895f-a3b47c5aa056'::uuid, 'verdadero_falso', $pea0$Si dos carreras tienen doble titulación entre sí, el estudiante puede gestionarlas como segunda carrera.$pea0$, $pea0$Las carreras con doble titulación entre sí no pueden gestionarse como segunda carrera.$pea0$, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', 'e1275742-2eff-42c9-8ead-b75247dcfc58'::uuid, null, now() + interval '1 millisecond' * 3
where exists (select 1 from public.items where id = 'e1275742-2eff-42c9-8ead-b75247dcfc58'::uuid)
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config, created_at = excluded.created_at
where exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

delete from public.opciones where pregunta_id = 'df17e043-09c5-45c9-895f-a3b47c5aa056'::uuid and exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = '6e4190d9-c64f-44b2-86d1-aefc20de8215'::uuid and c.estado = 'borrador');

insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, 'df17e043-09c5-45c9-895f-a3b47c5aa056'::uuid, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
  ('3ddd8f80-f6a3-4c52-8b08-b4aa23781324'::uuid, $pea0$Verdadero$pea0$, false, 1, null, null::int, null),
  ('f476735a-be36-4ccd-821a-efe7a7bbf0c5'::uuid, $pea0$Falso$pea0$, true, 2, null, null::int, null)
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = 'df17e043-09c5-45c9-895f-a3b47c5aa056'::uuid)
on conflict do nothing;
