-- PEA · Etapa 5 · Bandeja de entrada (spec §4.9)
-- Conversaciones dentro de la sede (y con dirección/admin) y anuncios de coordinación.
-- Lectura por RLS (solo participantes); toda escritura por RPC.

create table public.conversaciones (
  id uuid primary key default gen_random_uuid(),
  asunto text not null check (char_length(asunto) between 1 and 150),
  es_anuncio boolean not null default false,
  sede_id uuid references public.sedes (id),
  creada_por uuid not null references public.perfiles (id) on delete cascade,
  created_at timestamptz not null default clock_timestamp(),
  ultimo_mensaje_at timestamptz not null default clock_timestamp()
);

create table public.conversacion_participantes (
  conversacion_id uuid not null references public.conversaciones (id) on delete cascade,
  usuario_id uuid not null references public.perfiles (id) on delete cascade,
  leido_at timestamptz,
  archivada boolean not null default false,
  primary key (conversacion_id, usuario_id)
);
create index conversacion_participantes_usuario_idx on public.conversacion_participantes (usuario_id);

create table public.mensajes (
  id uuid primary key default gen_random_uuid(),
  conversacion_id uuid not null references public.conversaciones (id) on delete cascade,
  autor_id uuid not null references public.perfiles (id) on delete cascade,
  cuerpo text not null check (char_length(btrim(cuerpo)) between 1 and 5000),
  created_at timestamptz not null default clock_timestamp()
);
create index mensajes_conversacion_idx on public.mensajes (conversacion_id, created_at);

create or replace function public.es_participante(p_conversacion uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (
    select 1 from public.conversacion_participantes cp
    where cp.conversacion_id = p_conversacion and cp.usuario_id = auth.uid()
  ) and public.mi_perfil_activo()
$$;

alter table public.conversaciones enable row level security;
alter table public.conversacion_participantes enable row level security;
alter table public.mensajes enable row level security;
create policy conversaciones_leer on public.conversaciones for select to authenticated using (public.es_participante(id));
create policy participantes_leer on public.conversacion_participantes for select to authenticated using (public.es_participante(conversacion_id));
create policy mensajes_leer on public.mensajes for select to authenticated using (public.es_participante(conversacion_id));

-- ¿Puedo escribirle a esta persona? Misma sede, o alguno de los dos es director/admin.
create or replace function public.puede_escribir_a(p_destino uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (
    select 1 from public.perfiles yo join public.perfiles otro on otro.id = p_destino
    where yo.id = auth.uid() and yo.activo and otro.activo and otro.id <> yo.id
      and (yo.rol in ('director', 'admin') or otro.rol in ('director', 'admin')
           or (yo.sede_id is not null and yo.sede_id = otro.sede_id))
  )
$$;

create or replace function public.contactos_bandeja()
returns table (id uuid, nombre text, apellido text, rol public.rol_app, sede text, mismo_equipo boolean)
language sql stable security definer set search_path = '' as $$
  select p.id, p.nombre, p.apellido, p.rol, s.nombre,
         p.equipo_id is not null and p.equipo_id = (select yo.equipo_id from public.perfiles yo where yo.id = auth.uid())
  from public.perfiles p left join public.sedes s on s.id = p.sede_id
  where public.puede_escribir_a(p.id)
  order by p.apellido, p.nombre
$$;

create or replace function public.exigir_participante(p_conversacion uuid) returns void
language plpgsql stable security definer set search_path = '' as $$
begin
  if not public.es_participante(p_conversacion) then
    raise exception 'no participás de esta conversación' using errcode = 'P0001';
  end if;
end $$;

create or replace function public.iniciar_conversacion(p_destinatarios uuid[], p_asunto text, p_cuerpo text) returns uuid
language plpgsql security definer set search_path = '' as $$
declare v_dest uuid[]; v_id uuid; v_d uuid;
begin
  if not public.mi_perfil_activo() then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  select coalesce(array_agg(distinct d), '{}') into v_dest
  from unnest(coalesce(p_destinatarios, '{}')) d where d <> auth.uid();
  if cardinality(v_dest) = 0 then raise exception 'sin destinatarios' using errcode = 'P0001'; end if;
  if cardinality(v_dest) > 50 then raise exception 'demasiados destinatarios' using errcode = 'P0001'; end if;
  foreach v_d in array v_dest loop
    if not public.puede_escribir_a(v_d) then raise exception 'destinatario no permitido' using errcode = 'P0001'; end if;
  end loop;
  insert into public.conversaciones (asunto, creada_por) values (btrim(p_asunto), auth.uid()) returning id into v_id;
  insert into public.conversacion_participantes (conversacion_id, usuario_id, leido_at) values (v_id, auth.uid(), clock_timestamp());
  insert into public.conversacion_participantes (conversacion_id, usuario_id) select v_id, d from unnest(v_dest) d;
  insert into public.mensajes (conversacion_id, autor_id, cuerpo) values (v_id, auth.uid(), btrim(p_cuerpo));
  return v_id;
end $$;

create or replace function public.responder(p_conversacion uuid, p_cuerpo text) returns uuid
language plpgsql security definer set search_path = '' as $$
declare v_c public.conversaciones; v_id uuid;
begin
  perform public.exigir_participante(p_conversacion);
  select * into v_c from public.conversaciones where id = p_conversacion;
  if v_c.es_anuncio and v_c.creada_por <> auth.uid() then
    raise exception 'los anuncios no admiten respuestas' using errcode = 'P0001';
  end if;
  insert into public.mensajes (conversacion_id, autor_id, cuerpo) values (p_conversacion, auth.uid(), btrim(p_cuerpo)) returning id into v_id;
  update public.conversaciones set ultimo_mensaje_at = clock_timestamp() where id = p_conversacion;
  update public.conversacion_participantes set archivada = false where conversacion_id = p_conversacion;
  update public.conversacion_participantes set leido_at = clock_timestamp() where conversacion_id = p_conversacion and usuario_id = auth.uid();
  return v_id;
end $$;

create or replace function public.publicar_anuncio(p_asunto text, p_cuerpo text, p_sede uuid) returns uuid
language plpgsql security definer set search_path = '' as $$
declare v_rol public.rol_app := public.mi_rol(); v_sede uuid := p_sede; v_id uuid;
begin
  if not public.mi_perfil_activo() then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  if v_rol = 'coordinador' then
    v_sede := coalesce(p_sede, public.mi_sede());
    if v_sede is null or v_sede is distinct from public.mi_sede() then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  elsif v_rol not in ('director', 'admin') then
    raise exception 'sin permiso' using errcode = 'P0001';
  end if;
  insert into public.conversaciones (asunto, es_anuncio, sede_id, creada_por)
  values (btrim(p_asunto), true, v_sede, auth.uid()) returning id into v_id;
  insert into public.conversacion_participantes (conversacion_id, usuario_id, leido_at)
  select v_id, p.id, case when p.id = auth.uid() then clock_timestamp() end
  from public.perfiles p
  where p.activo and (p.id = auth.uid() or v_sede is null or p.sede_id = v_sede);
  insert into public.mensajes (conversacion_id, autor_id, cuerpo) values (v_id, auth.uid(), btrim(p_cuerpo));
  return v_id;
end $$;

create or replace function public.marcar_leida(p_conversacion uuid) returns void
language plpgsql security definer set search_path = '' as $$
begin
  perform public.exigir_participante(p_conversacion);
  update public.conversacion_participantes set leido_at = clock_timestamp()
  where conversacion_id = p_conversacion and usuario_id = auth.uid();
end $$;

create or replace function public.archivar(p_conversacion uuid, p_archivada boolean) returns void
language plpgsql security definer set search_path = '' as $$
begin
  perform public.exigir_participante(p_conversacion);
  update public.conversacion_participantes set archivada = p_archivada
  where conversacion_id = p_conversacion and usuario_id = auth.uid();
end $$;

create or replace function public.mi_bandeja(p_filtro text default 'entrada')
returns table (conversacion_id uuid, asunto text, es_anuncio boolean, participantes text, ultimo_cuerpo text,
               ultimo_autor text, ultimo_mensaje_at timestamptz, sin_leer boolean, archivada boolean)
language plpgsql stable security definer set search_path = '' as $$
begin
  if p_filtro is null or p_filtro not in ('entrada', 'sin_leer', 'anuncios', 'enviados', 'archivadas') then
    raise exception 'filtro inválido' using errcode = 'P0001';
  end if;
  return query
  with mias as (
    select c.*, cp.leido_at, cp.archivada as arch
    from public.conversacion_participantes cp join public.conversaciones c on c.id = cp.conversacion_id
    where cp.usuario_id = auth.uid() and public.mi_perfil_activo()
  ), base as (
    select m.id, m.asunto, m.es_anuncio, m.ultimo_mensaje_at, m.arch,
      case when m.es_anuncio then (select btrim(a.nombre || ' ' || a.apellido) from public.perfiles a where a.id = m.creada_por)
           else (select string_agg(btrim(p.nombre || ' ' || p.apellido), ', ' order by p.nombre, p.apellido)
                 from public.conversacion_participantes o join public.perfiles p on p.id = o.usuario_id
                 where o.conversacion_id = m.id and o.usuario_id <> auth.uid()) end as participantes,
      u.cuerpo as ult_cuerpo, u.autor as ult_autor,
      exists (select 1 from public.mensajes x where x.conversacion_id = m.id and x.autor_id <> auth.uid()
              and x.created_at > coalesce(m.leido_at, '-infinity'::timestamptz)) as sin_leer,
      exists (select 1 from public.mensajes x where x.conversacion_id = m.id and x.autor_id = auth.uid()) as envie
    from mias m
    left join lateral (
      select left(x.cuerpo, 140) as cuerpo, btrim(p.nombre || ' ' || p.apellido) as autor
      from public.mensajes x join public.perfiles p on p.id = x.autor_id
      where x.conversacion_id = m.id order by x.created_at desc limit 1
    ) u on true
  )
  select b.id, b.asunto, b.es_anuncio, b.participantes, b.ult_cuerpo, b.ult_autor, b.ultimo_mensaje_at, b.sin_leer, b.arch
  from base b
  where case p_filtro
    when 'entrada' then not b.arch
    when 'sin_leer' then not b.arch and b.sin_leer
    when 'anuncios' then b.es_anuncio
    when 'enviados' then b.envie
    else b.arch end
  order by b.ultimo_mensaje_at desc;
end $$;

create or replace function public.mensajes_sin_leer() returns int
language sql stable security definer set search_path = '' as $$
  select count(*)::int
  from public.conversacion_participantes cp
  where cp.usuario_id = auth.uid() and not cp.archivada and public.mi_perfil_activo()
    and exists (select 1 from public.mensajes x where x.conversacion_id = cp.conversacion_id
                and x.autor_id <> auth.uid() and x.created_at > coalesce(cp.leido_at, '-infinity'::timestamptz))
$$;

create or replace function public.mensajes_de(p_conversacion uuid)
returns table (id uuid, autor_id uuid, autor text, cuerpo text, created_at timestamptz, propio boolean)
language plpgsql stable security definer set search_path = '' as $$
begin
  perform public.exigir_participante(p_conversacion);
  return query
  select m.id, m.autor_id, btrim(p.nombre || ' ' || p.apellido), m.cuerpo, m.created_at, m.autor_id = auth.uid()
  from public.mensajes m join public.perfiles p on p.id = m.autor_id
  where m.conversacion_id = p_conversacion order by m.created_at, m.id;
end $$;

create or replace function public.participantes_de(p_conversacion uuid)
returns table (id uuid, nombre text)
language plpgsql stable security definer set search_path = '' as $$
begin
  perform public.exigir_participante(p_conversacion);
  return query
  select p.id, btrim(p.nombre || ' ' || p.apellido)
  from public.conversacion_participantes cp join public.perfiles p on p.id = cp.usuario_id
  where cp.conversacion_id = p_conversacion order by p.nombre, p.apellido;
end $$;

revoke all on function public.es_participante(uuid), public.puede_escribir_a(uuid), public.contactos_bandeja(),
  public.exigir_participante(uuid), public.iniciar_conversacion(uuid[], text, text), public.responder(uuid, text),
  public.publicar_anuncio(text, text, uuid), public.marcar_leida(uuid), public.archivar(uuid, boolean),
  public.mi_bandeja(text), public.mensajes_sin_leer(), public.mensajes_de(uuid), public.participantes_de(uuid)
  from public, anon;
grant execute on function public.es_participante(uuid), public.puede_escribir_a(uuid), public.contactos_bandeja(),
  public.iniciar_conversacion(uuid[], text, text), public.responder(uuid, text),
  public.publicar_anuncio(text, text, uuid), public.marcar_leida(uuid), public.archivar(uuid, boolean),
  public.mi_bandeja(text), public.mensajes_sin_leer(), public.mensajes_de(uuid), public.participantes_de(uuid)
  to authenticated;
