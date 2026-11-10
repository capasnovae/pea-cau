-- PEA · Etapa 9 · Alertas en la app (spec §4.6, §5): deduplicadas por clave y escritas solo por funciones internas

alter table public.perfiles add column avisos_email boolean not null default false;

create table public.alertas (
  id uuid primary key default gen_random_uuid(),
  usuario_id uuid not null references public.perfiles (id) on delete cascade,
  tipo text not null check (char_length(tipo) between 1 and 40),
  titulo text not null check (char_length(titulo) between 1 and 160),
  mensaje text not null check (char_length(mensaje) <= 500),
  enlace text check (enlace is null or enlace like '/%'),
  clave text not null check (char_length(clave) between 1 and 200),
  leida_at timestamptz,
  email_pendiente boolean not null default false,
  created_at timestamptz not null default clock_timestamp(),
  unique (usuario_id, clave)
);
create index alertas_usuario_idx on public.alertas (usuario_id, created_at desc);
alter table public.alertas enable row level security;
revoke all on public.alertas from anon;
revoke insert, update, delete, truncate on public.alertas from authenticated;
create policy alertas_leer on public.alertas for select to authenticated using (usuario_id = auth.uid());

-- Interna: devuelve false si ya existía una alerta con esa clave para ese usuario
create or replace function public.crear_alerta(p_usuario uuid, p_tipo text, p_titulo text, p_mensaje text, p_enlace text, p_clave text)
returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_n int;
begin
  insert into public.alertas (usuario_id, tipo, titulo, mensaje, enlace, clave, email_pendiente)
  select p_usuario, p_tipo, p_titulo, coalesce(p_mensaje, ''), p_enlace, p_clave, p.avisos_email
  from public.perfiles p where p.id = p_usuario and p.activo
  on conflict (usuario_id, clave) do nothing;
  get diagnostics v_n = row_count;
  return v_n > 0;
end $$;

create or replace function public.alertas_sin_leer() returns int
language sql stable security definer set search_path = '' as $$
  select count(*)::int from public.alertas where usuario_id = auth.uid() and leida_at is null
$$;

-- Marca como leídas las alertas propias indicadas (o todas si p_ids es null)
create or replace function public.marcar_alertas_leidas(p_ids uuid[] default null) returns int
language plpgsql security definer set search_path = '' as $$
declare v_n int;
begin
  update public.alertas set leida_at = clock_timestamp()
  where usuario_id = auth.uid() and leida_at is null and (p_ids is null or id = any (p_ids));
  get diagnostics v_n = row_count;
  return v_n;
end $$;

create or replace function public.preferir_avisos_email(p_activar boolean) returns void
language sql security definer set search_path = '' as $$
  update public.perfiles set avisos_email = coalesce(p_activar, false) where id = auth.uid()
$$;

revoke all on function public.crear_alerta(uuid, text, text, text, text, text) from public, anon, authenticated;
revoke all on function public.alertas_sin_leer(), public.marcar_alertas_leidas(uuid[]), public.preferir_avisos_email(boolean) from public, anon;
grant execute on function public.alertas_sin_leer(), public.marcar_alertas_leidas(uuid[]), public.preferir_avisos_email(boolean) to authenticated;
