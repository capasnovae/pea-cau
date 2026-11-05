-- PEA · Etapa 3 · Consignas y generación de asignaciones (spec §4.2 y §5.7)

create type public.tipo_consigna as enum ('tarea', 'lectura', 'capacitacion');
create type public.destino_consigna as enum ('usuario', 'equipo', 'subrol', 'sede');
create type public.estado_asignacion as enum ('pendiente', 'en_curso', 'hecha', 'vencida');
create type public.recurrencia as enum ('ninguna', 'diaria', 'semanal', 'mensual');
create type public.prioridad as enum ('baja', 'normal', 'alta');

-- Visibilidad evaluada para un actor cualquiera (la usa la generación de asignaciones con el creador).
create or replace function public.puede_ver_usuario_como(p_actor uuid, p_objetivo uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select
    p_objetivo = p_actor
    or exists (
      select 1
      from public.perfiles yo
      join public.perfiles otro on otro.id = p_objetivo
      where yo.id = p_actor
        and yo.activo
        and (
          yo.rol in ('admin', 'director')
          or (
            yo.rol = 'coordinador'
            and yo.sede_id is not null and yo.area is not null
            and otro.sede_id = yo.sede_id and otro.area = yo.area
          )
          or (
            yo.rol = 'lider'
            and yo.sede_id is not null
            and otro.sede_id = yo.sede_id
            and exists (
              select 1 from public.equipos e
              where e.id = otro.equipo_id and e.lider_id = yo.id and e.sede_id = yo.sede_id
            )
          )
        )
    )
$$;

create or replace function public.puede_ver_usuario(objetivo uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select public.puede_ver_usuario_como(auth.uid(), objetivo)
$$;

revoke all on function public.puede_ver_usuario_como(uuid, uuid) from public, anon, authenticated;

create table public.consignas (
  id uuid primary key default gen_random_uuid(),
  sede_id uuid not null references public.sedes (id),
  area public.area,
  creada_por uuid not null references public.perfiles (id),
  tipo public.tipo_consigna not null default 'tarea',
  titulo text not null,
  detalle_md text not null default '',
  articulo_id uuid references public.articulos (id) on delete set null,
  curso_id uuid,
  examen_id uuid,
  destino public.destino_consigna not null,
  destino_usuario_id uuid references public.perfiles (id),
  destino_equipo_id uuid references public.equipos (id),
  destino_subrol_id uuid references public.subroles (id),
  fecha_limite date,
  prioridad public.prioridad not null default 'normal',
  recurrencia public.recurrencia not null default 'ninguna',
  requiere_evidencia boolean not null default false,
  activa boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint consignas_lectura check (tipo <> 'lectura' or articulo_id is not null),
  constraint consignas_destino check (
    (destino = 'usuario' and destino_usuario_id is not null and destino_equipo_id is null and destino_subrol_id is null)
    or (destino = 'equipo' and destino_equipo_id is not null and destino_usuario_id is null and destino_subrol_id is null)
    or (destino = 'subrol' and destino_subrol_id is not null and destino_usuario_id is null and destino_equipo_id is null)
    or (destino = 'sede' and destino_usuario_id is null and destino_equipo_id is null and destino_subrol_id is null)
  ),
  constraint consignas_recurrente_sin_fecha check (recurrencia = 'ninguna' or fecha_limite is null)
);

create table public.consigna_asignaciones (
  id uuid primary key default gen_random_uuid(),
  consigna_id uuid not null references public.consignas (id) on delete cascade,
  usuario_id uuid not null references public.perfiles (id) on delete cascade,
  periodo date not null,
  vence_el date,
  estado public.estado_asignacion not null default 'pendiente',
  iniciada_at timestamptz,
  completada_at timestamptz,
  leida_at timestamptz,
  comentario text,
  evidencia_path text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (consigna_id, usuario_id, periodo)
);

create index consignas_sede_idx on public.consignas (sede_id);
create index consignas_creador_idx on public.consignas (creada_por);
create index asignaciones_usuario_idx on public.consigna_asignaciones (usuario_id, estado);
create index asignaciones_vence_idx on public.consigna_asignaciones (vence_el) where estado in ('pendiente', 'en_curso');

create trigger tocar_updated_at before update on public.consignas for each row execute function public.tocar_updated_at();
create trigger tocar_updated_at before update on public.consigna_asignaciones for each row execute function public.tocar_updated_at();

create or replace function public.periodo_actual(p_recurrencia public.recurrencia, p_hoy date) returns date
language sql immutable set search_path = '' as $$
  select case p_recurrencia
    when 'semanal' then (p_hoy - (extract(isodow from p_hoy)::int - 1))
    when 'mensual' then date_trunc('month', p_hoy)::date
    else p_hoy
  end
$$;

create or replace function public.fin_periodo(p_recurrencia public.recurrencia, p_periodo date) returns date
language sql immutable set search_path = '' as $$
  select case p_recurrencia
    when 'semanal' then p_periodo + 6
    when 'mensual' then (date_trunc('month', p_periodo) + interval '1 month - 1 day')::date
    else p_periodo
  end
$$;

-- Destinatarios: activos del destino, dentro de la sede (y del área si la consigna la tiene),
-- que el creador puede ver, sin incluir al propio creador.
create or replace function public.destinatarios_consigna(p_consigna uuid) returns setof uuid
language sql stable security definer set search_path = '' as $$
  select p.id
  from public.consignas c
  join public.perfiles p on p.activo and p.sede_id = c.sede_id and (c.area is null or p.area = c.area)
  where c.id = p_consigna
    and p.id <> c.creada_por
    and public.puede_ver_usuario_como(c.creada_por, p.id)
    and (
      (c.destino = 'usuario' and p.id = c.destino_usuario_id)
      or (c.destino = 'equipo' and p.equipo_id = c.destino_equipo_id)
      or (c.destino = 'subrol' and exists (
            select 1 from public.perfil_subroles ps where ps.perfil_id = p.id and ps.subrol_id = c.destino_subrol_id))
      or c.destino = 'sede'
    )
$$;

create or replace function public.generar_asignaciones(p_consigna uuid, p_periodo date) returns int
language plpgsql security definer set search_path = '' as $$
declare
  v_c public.consignas;
  v_vence date;
  v_n int;
begin
  select * into v_c from public.consignas where id = p_consigna;
  if not found or not v_c.activa then
    return 0;
  end if;
  v_vence := case when v_c.recurrencia = 'ninguna' then v_c.fecha_limite else public.fin_periodo(v_c.recurrencia, p_periodo) end;
  insert into public.consigna_asignaciones (consigna_id, usuario_id, periodo, vence_el)
  select p_consigna, d, p_periodo, v_vence from public.destinatarios_consigna(p_consigna) d
  on conflict (consigna_id, usuario_id, periodo) do nothing;
  get diagnostics v_n = row_count;
  return v_n;
end $$;

revoke all on function public.destinatarios_consigna(uuid), public.generar_asignaciones(uuid, date) from public, anon, authenticated;

create or replace function public.al_crear_consigna() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  perform public.generar_asignaciones(new.id, public.periodo_actual(new.recurrencia, current_date));
  return null;
end $$;

create trigger al_crear_consigna after insert on public.consignas
  for each row execute function public.al_crear_consigna();
