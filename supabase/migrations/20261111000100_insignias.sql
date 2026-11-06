-- PEA · Etapa 7 · Insignias por nivel, verificación pública y revocación (spec §4.5, §5)

create table public.insignias (
  id uuid primary key default gen_random_uuid(),
  curso_id uuid not null unique references public.cursos (id) on delete cascade,
  nombre text not null check (char_length(nombre) between 1 and 60),
  descripcion text not null default '' check (char_length(descripcion) <= 300),
  icono_path text
);

create table public.usuario_insignias (
  id uuid primary key default gen_random_uuid(),
  usuario_id uuid not null references public.perfiles (id) on delete cascade,
  insignia_id uuid not null references public.insignias (id) on delete cascade,
  otorgada_at timestamptz not null default now(),
  perdida_at timestamptz,
  motivo_perdida text,
  unique (usuario_id, insignia_id)
);

alter table public.insignias enable row level security;
alter table public.usuario_insignias enable row level security;
revoke all on public.insignias, public.usuario_insignias from anon;
revoke insert, delete on public.insignias from authenticated;
revoke insert, update, delete on public.usuario_insignias from authenticated;
create policy insignias_leer on public.insignias for select to authenticated using (public.mi_perfil_activo());
create policy insignias_admin on public.insignias for update to authenticated
  using (public.mi_rol() = 'admin') with check (public.mi_rol() = 'admin');
create policy usuario_insignias_leer on public.usuario_insignias for select to authenticated
  using ((usuario_id = auth.uid() or public.puede_ver_usuario(usuario_id)) and public.mi_perfil_activo());

-- Cada nivel tiene su insignia (también los que ya existían)
create or replace function public.crear_insignia_nivel() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if new.tipo = 'nivel' then
    insert into public.insignias (curso_id, nombre) values (new.id, 'Nivel ' || new.nivel_orden)
    on conflict (curso_id) do nothing;
  end if;
  return new;
end $$;
create trigger crear_insignia_nivel after insert or update of tipo on public.cursos
  for each row execute function public.crear_insignia_nivel();
insert into public.insignias (curso_id, nombre)
select id, 'Nivel ' || nivel_orden from public.cursos where tipo = 'nivel' on conflict (curso_id) do nothing;

-- Estado efectivo: vencida por fecha aunque el job de la Etapa 9 todavía no la haya marcado
create or replace function public.estado_efectivo(p_estado public.estado_certificacion, p_vence timestamptz) returns text
language sql stable set search_path = '' as $$
  select case when p_estado = 'revocada' then 'revocada'
              when p_estado = 'vencida' or (p_vence is not null and p_vence < now()) then 'vencida'
              else 'vigente' end
$$;

-- La certificación otorga o quita la insignia del nivel
create or replace function public.sincronizar_insignia() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_insignia uuid;
begin
  select id into v_insignia from public.insignias where curso_id = new.curso_id;
  if v_insignia is null then return new; end if;
  if new.estado = 'vigente' then
    insert into public.usuario_insignias (usuario_id, insignia_id, otorgada_at)
    values (new.usuario_id, v_insignia, now())
    on conflict (usuario_id, insignia_id) do update
      set perdida_at = null, motivo_perdida = null,
          otorgada_at = case when public.usuario_insignias.perdida_at is not null then now() else public.usuario_insignias.otorgada_at end;
  elsif not exists (select 1 from public.certificaciones c
                    where c.usuario_id = new.usuario_id and c.curso_id = new.curso_id and c.estado = 'vigente' and c.id <> new.id) then
    update public.usuario_insignias set perdida_at = now(), motivo_perdida = new.estado::text
    where usuario_id = new.usuario_id and insignia_id = v_insignia and perdida_at is null;
  end if;
  return new;
end $$;
create trigger sincronizar_insignia after insert or update of estado on public.certificaciones
  for each row execute function public.sincronizar_insignia();

-- Verificación pública: solo por código exacto, con lo mínimo
create or replace function public.verificar_certificado(p_codigo text)
returns table (nombre text, nivel int, curso text, emitida_at timestamptz, vence_at timestamptz, estado text)
language sql stable security definer set search_path = '' as $$
  select btrim(p.nombre || ' ' || p.apellido), cu.nivel_orden, cu.titulo, c.emitida_at, c.vence_at,
         public.estado_efectivo(c.estado, c.vence_at)
  from public.certificaciones c
  join public.perfiles p on p.id = c.usuario_id
  join public.cursos cu on cu.id = c.curso_id
  where c.codigo_verificacion = upper(regexp_replace(coalesce(p_codigo, ''), '[\s-]', '', 'g'))
$$;

create or replace function public.revocar_certificacion(p_id uuid, p_motivo text) returns void
language plpgsql security definer set search_path = '' as $$
begin
  if public.mi_rol() is distinct from 'admin' or not public.mi_perfil_activo() then
    raise exception 'sin permiso' using errcode = 'P0001';
  end if;
  if char_length(btrim(coalesce(p_motivo, ''))) not between 1 and 300 then
    raise exception 'motivo inválido' using errcode = 'P0001';
  end if;
  update public.certificaciones set estado = 'revocada' where id = p_id;
  if not found then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  insert into public.auditoria (actor_id, accion, entidad, entidad_id, datos)
  values (auth.uid(), 'revocar', 'certificaciones', p_id, jsonb_build_object('motivo', btrim(p_motivo)));
end $$;

-- Resumen del perfil evolutivo
create or replace function public.mi_perfil_evolutivo()
returns table (nivel_actual int, nivel_titulo text, cursos_total int, cursos_cumplidos int)
language sql stable security definer set search_path = '' as $$
  with ruta as (select * from public.mi_ruta()),
  certificado as (
    select cu.nivel_orden, cu.titulo from public.certificaciones c join public.cursos cu on cu.id = c.curso_id
    where c.usuario_id = auth.uid() and cu.tipo = 'nivel' and public.estado_efectivo(c.estado, c.vence_at) <> 'revocada'
    order by cu.nivel_orden desc limit 1
  ),
  en_curso as (
    select r.nivel_orden, r.titulo from ruta r where r.tipo = 'nivel' and r.desbloqueado and not r.cumplido
    order by r.nivel_orden limit 1
  )
  select coalesce((select nivel_orden from en_curso), (select nivel_orden from certificado)),
         coalesce((select titulo from en_curso), (select titulo from certificado)),
         (select count(*)::int from ruta where obligatorio),
         (select count(*)::int from ruta where obligatorio and cumplido)
$$;

revoke all on function public.crear_insignia_nivel(), public.sincronizar_insignia(), public.estado_efectivo(public.estado_certificacion, timestamptz),
  public.verificar_certificado(text), public.revocar_certificacion(uuid, text), public.mi_perfil_evolutivo() from public;
grant execute on function public.verificar_certificado(text) to anon, authenticated;
grant execute on function public.estado_efectivo(public.estado_certificacion, timestamptz), public.revocar_certificacion(uuid, text),
  public.mi_perfil_evolutivo() to authenticated;
revoke all on function public.crear_insignia_nivel(), public.sincronizar_insignia() from anon, authenticated;
