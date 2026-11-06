-- PEA · Etapa 5 · Calendario, favoritos y resumen de trabajo (spec §4.9)

create or replace function public.hoy_ar() returns date
language sql stable set search_path = '' as $$
  select (now() at time zone 'America/Argentina/Buenos_Aires')::date
$$;

create type public.tipo_evento as enum ('capacitacion', 'evento');

create table public.eventos (
  id uuid primary key default gen_random_uuid(),
  titulo text not null check (char_length(titulo) between 1 and 120),
  descripcion text not null default '' check (char_length(descripcion) <= 2000),
  fecha date not null,
  hora time,
  tipo public.tipo_evento not null default 'evento',
  sede_id uuid references public.sedes (id) on delete cascade,
  creado_por uuid references public.perfiles (id) on delete set null,
  created_at timestamptz not null default now()
);
create index eventos_fecha_idx on public.eventos (fecha);

create or replace function public.fijar_creador_evento() returns trigger
language plpgsql set search_path = '' as $$
begin
  if auth.uid() is not null then new.creado_por := auth.uid(); end if;
  return new;
end $$;
create trigger fijar_creador_evento before insert on public.eventos
  for each row execute function public.fijar_creador_evento();

create or replace function public.puede_gestionar_evento(p_sede uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select public.mi_perfil_activo() and (
    public.mi_rol() in ('director', 'admin')
    or (public.mi_rol() = 'coordinador' and p_sede is not null and p_sede = public.mi_sede()))
$$;
revoke all on function public.puede_gestionar_evento(uuid) from public, anon;
grant execute on function public.puede_gestionar_evento(uuid) to authenticated;

alter table public.eventos enable row level security;
create policy eventos_leer on public.eventos for select to authenticated
  using (public.mi_perfil_activo() and (sede_id is null or sede_id = public.mi_sede() or public.mi_rol() in ('director', 'admin')));
create policy eventos_crear on public.eventos for insert to authenticated with check (public.puede_gestionar_evento(sede_id));
create policy eventos_editar on public.eventos for update to authenticated
  using (public.puede_gestionar_evento(sede_id)) with check (public.puede_gestionar_evento(sede_id));
create policy eventos_borrar on public.eventos for delete to authenticated using (public.puede_gestionar_evento(sede_id));

-- Favoritos
create table public.cursos_favoritos (
  usuario_id uuid not null default auth.uid() references public.perfiles (id) on delete cascade,
  curso_id uuid not null references public.cursos (id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (usuario_id, curso_id)
);
alter table public.cursos_favoritos enable row level security;
create policy favoritos_leer on public.cursos_favoritos for select to authenticated using (usuario_id = auth.uid());
create policy favoritos_crear on public.cursos_favoritos for insert to authenticated
  with check (usuario_id = auth.uid() and public.puede_leer_curso(curso_id));
create policy favoritos_borrar on public.cursos_favoritos for delete to authenticated using (usuario_id = auth.uid());

-- Calendario del usuario (con su RLS)
create or replace function public.mi_calendario(p_desde date, p_hasta date)
returns table (fecha date, hora time, titulo text, categoria text, ref_id uuid, estado text)
language plpgsql stable security invoker set search_path = '' as $$
begin
  if p_desde is null or p_hasta is null or p_hasta < p_desde or p_hasta - p_desde > 62 then
    raise exception 'rango inválido' using errcode = 'P0001';
  end if;
  return query
  select a.vence_el, null::time, c.titulo, 'consigna'::text, a.id, a.estado::text
  from public.consigna_asignaciones a join public.consignas c on c.id = a.consigna_id
  where a.usuario_id = auth.uid() and a.vence_el between p_desde and p_hasta
  union all
  select e.fecha, e.hora, e.titulo, e.tipo::text, e.id, null::text
  from public.eventos e
  where e.fecha between p_desde and p_hasta
  order by 1, 2 nulls first, 3;
end $$;

create or replace function public.mi_trabajo() returns table (por_vencer int, vencidas int, hechas int)
language sql stable security invoker set search_path = '' as $$
  select
    count(*) filter (where a.estado in ('pendiente', 'en_curso') and a.vence_el between public.hoy_ar() and public.hoy_ar() + 7)::int,
    count(*) filter (where a.estado = 'vencida' or (a.estado in ('pendiente', 'en_curso') and a.vence_el < public.hoy_ar()))::int,
    count(*) filter (where a.estado = 'hecha' and a.completada_at >= now() - interval '30 days')::int
  from public.consigna_asignaciones a
  where a.usuario_id = auth.uid()
$$;

revoke all on function public.mi_calendario(date, date), public.mi_trabajo() from public, anon;
grant execute on function public.mi_calendario(date, date), public.mi_trabajo(), public.hoy_ar() to authenticated;
