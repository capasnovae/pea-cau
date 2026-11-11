-- PEA · Robustez a largo plazo (relevamiento de seguridad y código, noviembre 2026)

-- 1) La historia no se borra en cascada: un curso con certificaciones o un examen con intentos se archiva, no se borra.
alter table public.certificaciones drop constraint certificaciones_curso_id_fkey;
alter table public.certificaciones add constraint certificaciones_curso_id_fkey
  foreign key (curso_id) references public.cursos (id) on delete restrict;
alter table public.intentos drop constraint intentos_examen_id_fkey;
alter table public.intentos add constraint intentos_examen_id_fkey
  foreign key (examen_id) references public.examenes (id) on delete restrict;

-- 2) Permisos de tabla mínimos: anon no toca tablas (la verificación pública va por RPC) y nadie puede vaciarlas.
revoke all on all tables in schema public from anon;
revoke truncate on all tables in schema public from authenticated;
alter default privileges in schema public revoke all on tables from anon;
alter default privileges in schema public revoke truncate on tables from authenticated;

-- 3) Índice para cada clave foránea que no lo tenga (joins, RLS y borrados no recorren la tabla entera)
do $$
declare r record;
begin
  for r in
    select c.conrelid::regclass::text as tabla, a.attname as columna
    from pg_constraint c
    join pg_attribute a on a.attrelid = c.conrelid and a.attnum = c.conkey[1]
    where c.contype = 'f' and c.connamespace = 'public'::regnamespace
      and not exists (select 1 from pg_index i where i.indrelid = c.conrelid and i.indkey[0] = c.conkey[1])
    group by 1, 2
  loop
    execute format('create index if not exists %I on public.%I (%I)',
                   left(r.tabla || '_' || r.columna || '_fk_idx', 63), r.tabla, r.columna);
  end loop;
end $$;
