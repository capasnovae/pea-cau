-- Actualizaciones obligatorias: solo el admin publica, se asignan a quien cumplió el contenido, mini examen e insignia
begin;
select plan(14);
select tests.escenario();
select tests.escenario_cursos();
select tests.escenario_examenes();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;

-- Un paso que usa un artículo; ase1 lo cumplió, ase2 no
create temp table art as select id from public.articulos where alcance = 'global' and estado = 'publicado' order by id limit 1;
create temp table art2 as select id from public.articulos where alcance = 'global' and estado = 'publicado' order by id offset 1 limit 1;
grant select on art, art2 to authenticated;
insert into public.modulos (id, curso_id, orden, titulo) values ('e2000000-0000-4000-8000-000000000071', 'e1000000-0000-4000-8000-000000000001', 3, 'MA');
insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, requisito)
values ('e3000000-0000-4000-8000-000000000071', 'e2000000-0000-4000-8000-000000000071', 1, 'Art', 'articulo', (select id from art), 'ver');
select tests.como(tests.uid('ase1@t'));
select public.marcar_item('e3000000-0000-4000-8000-000000000071', 'visto');
select tests.como_postgres();
insert into public.examenes (id, titulo, tipo, categoria_id, cantidad_preguntas, alcance, estado)
values ('f1000000-0000-4000-8000-000000000071', 'T-Actualización', 'actualizacion', (select id from public.categorias where slug = 'reglamento'), 1, 'global', 'publicado');

select tests.como(tests.uid('coordS@t'));
select throws_ok($$select public.publicar_actualizacion(jsonb_build_object('titulo', 'x', 'plazo_dias', 10, 'articulo_id', (select id from art)))$$,
  'P0001', 'sin permiso', 'solo el admin publica');
select tests.como_postgres();

create temp table ids (k text primary key, v uuid);
grant all on ids to authenticated;
select tests.como(tests.uid('adm@t'));
insert into ids select 'a', public.publicar_actualizacion(jsonb_build_object('titulo', 'Cambió la inscripción', 'descripcion_md', 'Nuevo plazo.',
  'plazo_dias', 10, 'articulo_id', (select id from art), 'examen_id', 'f1000000-0000-4000-8000-000000000071'));
insert into ids select 'nadie', public.publicar_actualizacion(jsonb_build_object('titulo', 'Sin lectores', 'plazo_dias', 5, 'articulo_id', (select id from art2)));
insert into ids select 'm', public.publicar_actualizacion(jsonb_build_object('titulo', 'Cambió el módulo', 'plazo_dias', 7, 'modulo_id', 'e2000000-0000-4000-8000-000000000071'));
select tests.como_postgres();

select results_eq($$select p.email::text from public.actualizacion_asignaciones s join public.perfiles p on p.id = s.usuario_id
                    where s.actualizacion_id = (select v from ids where k = 'a')$$, $$values ('ase1@t')$$, 'se asigna solo a quien cumplió el contenido');
select is((select count(*)::int from public.actualizacion_asignaciones where actualizacion_id = (select v from ids where k = 'nadie')), 0,
  'si nadie lo cumplió no asigna a nadie');
select ok((select vence_at between now() + interval '9 days 23 hours' and now() + interval '10 days 1 hour'
           from public.actualizacion_asignaciones where actualizacion_id = (select v from ids where k = 'a')), 'vence en el plazo');
select is((select count(*)::int from public.alertas where usuario_id = tests.uid('ase1@t') and clave = 'actualizacion:' || (select v from ids where k = 'a')), 1,
  'avisa a cada asignado');

select tests.como(tests.uid('ase2@t'));
select ok(not public.puede_rendir('f1000000-0000-4000-8000-000000000071'), 'un no asignado no rinde el mini examen');
select is((select count(*)::int from public.actualizacion_asignaciones), 0, 'ni ve asignaciones ajenas');
select throws_ok($$select public.marcar_actualizacion_leida((select id from public.actualizacion_asignaciones s where false union all
  select '00000000-0000-4000-8000-000000000000'::uuid limit 1))$$, 'P0001', null, 'ni marca asignaciones que no son suyas');
select tests.como_postgres();

select tests.como(tests.uid('ase1@t'));
select ok(public.puede_rendir('f1000000-0000-4000-8000-000000000071'), 'el asignado rinde el mini examen');
select is((select count(*)::int from public.actualizaciones), 2, 'el asignado ve sus actualizaciones (y no la que no le tocó)');
select public.marcar_actualizacion_leida((select id from public.actualizacion_asignaciones where actualizacion_id = (select v from ids where k = 'a')));
select is((select estado::text from public.actualizacion_asignaciones where actualizacion_id = (select v from ids where k = 'a')), 'pendiente',
  'leer no alcanza si hay mini examen');
select public.marcar_actualizacion_leida((select id from public.actualizacion_asignaciones where actualizacion_id = (select v from ids where k = 'm')));
select is((select estado::text from public.actualizacion_asignaciones where actualizacion_id = (select v from ids where k = 'm')), 'cumplida',
  'sin mini examen, leerla la cumple');
select tests.como_postgres();

insert into ids select 'i', gen_random_uuid();
insert into public.intentos (id, usuario_id, examen_id, estado, entregado_at, cerrado_at, nota, aprobado)
values ((select v from ids where k = 'i'), tests.uid('ase1@t'), 'f1000000-0000-4000-8000-000000000071', 'cerrado', now(), now(), 100, true);
select public.aplicar_efectos((select v from ids where k = 'i'));
select is((select estado::text from public.actualizacion_asignaciones where actualizacion_id = (select v from ids where k = 'a')), 'cumplida',
  'leída y con el mini examen aprobado queda cumplida');

-- Una actualización vencida del nivel quita la insignia aunque la certificación siga vigente
insert into public.certificaciones (usuario_id, curso_id, origen) values (tests.uid('ase1@t'), 'e1000000-0000-4000-8000-000000000001', 'examen');
update public.actualizacion_asignaciones set estado = 'vencida', leida_at = null, aprobada_at = null
where actualizacion_id = (select v from ids where k = 'a');
select public.sincronizar_insignias_de(tests.uid('ase1@t'));
select is((select motivo_perdida from public.usuario_insignias ui join public.insignias i on i.id = ui.insignia_id
           where ui.usuario_id = tests.uid('ase1@t') and i.curso_id = 'e1000000-0000-4000-8000-000000000001'), 'actualizacion',
  'una actualización vencida del nivel quita la insignia');

select * from finish();
rollback;
