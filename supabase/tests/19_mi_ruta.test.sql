begin;
select plan(5);
select tests.escenario();
select tests.escenario_cursos();
update public.cursos set estado = 'borrador' where tipo = 'nivel' and nivel_orden < 8;
select tests.crear_usuario('aseFront@t', 'asesor', 'T-Neuquén', 'servicio');
insert into public.perfil_subroles (perfil_id, subrol_id) select tests.uid('aseFront@t'), id from public.subroles where nombre = 'Front';
insert into public.cursos (id, tipo, titulo, alcance, estado) values
  ('e1000000-0000-4000-8000-000000000011', 'capacitacion', 'T-Cap Front', 'global', 'publicado'),
  ('e1000000-0000-4000-8000-000000000012', 'capacitacion', 'T-Cap CEO', 'global', 'publicado');
insert into public.ruta_cursos (curso_id, subrol_id, obligatorio) values
  ('e1000000-0000-4000-8000-000000000011', (select id from public.subroles where nombre = 'Front'), true),
  ('e1000000-0000-4000-8000-000000000012', (select id from public.subroles where nombre = 'CEO'), true);

select tests.como(tests.uid('aseFront@t'));
select results_eq($$select titulo from public.mi_ruta() where titulo like 'T-%' order by titulo$$,
  $$values ('T-Cap Front'), ('T-Nivel A'), ('T-Nivel B')$$, 've los niveles y la capacitación de su subrol, no la de CEO');
select ok((select obligatorio from public.mi_ruta() where titulo = 'T-Cap Front'), 'la capacitación de su ruta es obligatoria');
select results_eq($$select items_total, items_cumplidos, siguiente_item from public.mi_ruta() where titulo = 'T-Nivel A'$$,
  $$values (3, 0, 'e3000000-0000-4000-8000-000000000001'::uuid)$$, 'avance 0 de 3 y el siguiente es i1');
select public.marcar_item('e3000000-0000-4000-8000-000000000001', 'visto');
select results_eq($$select items_cumplidos, siguiente_item from public.mi_ruta() where titulo = 'T-Nivel A'$$,
  $$values (1, 'e3000000-0000-4000-8000-000000000002'::uuid)$$, 'después de i1, el siguiente es i2');
select ok(not (select desbloqueado from public.mi_ruta() where titulo = 'T-Nivel B'), 'el nivel B sigue bloqueado');
select tests.como_postgres();

select * from finish();
rollback;
