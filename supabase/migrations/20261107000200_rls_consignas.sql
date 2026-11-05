-- PEA · Etapa 3 · Alcance y permisos de las consignas (spec §4.2)

create or replace function public.puede_crear_consigna(
  p_sede uuid, p_area public.area, p_destino public.destino_consigna, p_usuario uuid, p_equipo uuid
) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce(case public.mi_rol()
    when 'admin' then true
    when 'director' then true
    when 'coordinador' then p_sede = public.mi_sede() and p_area is not distinct from public.mi_area()
      and (p_destino <> 'usuario' or public.puede_ver_usuario(p_usuario))
      and (p_destino <> 'equipo' or exists (select 1 from public.equipos e where e.id = p_equipo and e.sede_id = p_sede and e.area = p_area))
    when 'lider' then p_sede = public.mi_sede() and (
      (p_destino = 'equipo' and exists (select 1 from public.equipos e where e.id = p_equipo and e.lider_id = auth.uid()))
      or (p_destino = 'usuario' and p_usuario <> auth.uid() and public.puede_ver_usuario(p_usuario))
    )
    else false
  end, false)
$$;

revoke all on function public.puede_crear_consigna(uuid, public.area, public.destino_consigna, uuid, uuid) from public, anon;
grant execute on function public.puede_crear_consigna(uuid, public.area, public.destino_consigna, uuid, uuid) to authenticated;

-- Autor y área los fija el servidor
create or replace function public.fijar_autoria_consigna() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if auth.uid() is not null then
    new.creada_por := auth.uid();
    if public.mi_rol() = 'coordinador' then
      new.area := public.mi_area();
    end if;
  end if;
  return new;
end $$;

create trigger fijar_autoria_consigna before insert on public.consignas
  for each row execute function public.fijar_autoria_consigna();

alter table public.consignas enable row level security;
alter table public.consigna_asignaciones enable row level security;
revoke all on public.consignas, public.consigna_asignaciones from anon;

create policy consignas_crear on public.consignas for insert to authenticated
  with check (creada_por = auth.uid()
    and public.puede_crear_consigna(sede_id, area, destino, destino_usuario_id, destino_equipo_id));

create policy consignas_leer on public.consignas for select to authenticated
  using (
    creada_por = auth.uid()
    or public.mi_rol() in ('admin', 'director')
    or (public.mi_rol() = 'coordinador' and sede_id = public.mi_sede() and area is not distinct from public.mi_area())
    or exists (select 1 from public.consigna_asignaciones a where a.consigna_id = consignas.id and a.usuario_id = auth.uid())
  );

create policy consignas_editar on public.consignas for update to authenticated
  using (creada_por = auth.uid() or public.mi_rol() = 'admin')
  with check (creada_por = auth.uid() or public.mi_rol() = 'admin');
create policy consignas_borrar on public.consignas for delete to authenticated
  using (creada_por = auth.uid() or public.mi_rol() = 'admin');

-- Una consigna creada no cambia de destino ni de sede: para eso se crea otra.
create or replace function public.proteger_consigna() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if auth.uid() is not null and (
       new.sede_id is distinct from old.sede_id or new.area is distinct from old.area
       or new.creada_por is distinct from old.creada_por or new.destino is distinct from old.destino
       or new.destino_usuario_id is distinct from old.destino_usuario_id
       or new.destino_equipo_id is distinct from old.destino_equipo_id
       or new.destino_subrol_id is distinct from old.destino_subrol_id
       or new.recurrencia is distinct from old.recurrencia) then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  return new;
end $$;

create trigger proteger_consigna before update on public.consignas
  for each row execute function public.proteger_consigna();

create or replace function public.es_creador_de_asignacion(p_consigna uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (select 1 from public.consignas c where c.id = p_consigna and c.creada_por = auth.uid())
$$;
revoke all on function public.es_creador_de_asignacion(uuid) from public, anon;
grant execute on function public.es_creador_de_asignacion(uuid) to authenticated;

create policy asignaciones_leer on public.consigna_asignaciones for select to authenticated
  using (usuario_id = auth.uid() or public.puede_ver_usuario(usuario_id) or public.es_creador_de_asignacion(consigna_id));
create policy asignaciones_editar on public.consigna_asignaciones for update to authenticated
  using (usuario_id = auth.uid() and public.mi_perfil_activo())
  with check (usuario_id = auth.uid());
revoke insert, delete on public.consigna_asignaciones from authenticated;

-- El destinatario solo cambia estado, comentario, evidencia y lectura.
create or replace function public.proteger_asignacion() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_tipo public.tipo_consigna;
begin
  if auth.uid() is null then
    return new;
  end if;
  if new.consigna_id is distinct from old.consigna_id or new.usuario_id is distinct from old.usuario_id
     or new.periodo is distinct from old.periodo or new.vence_el is distinct from old.vence_el
     or new.created_at is distinct from old.created_at then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  if new.estado = 'vencida' and old.estado <> 'vencida' then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  if new.estado = 'en_curso' and old.estado <> 'en_curso' then
    new.iniciada_at := coalesce(new.iniciada_at, now());
  end if;
  if new.estado = 'hecha' and old.estado <> 'hecha' then
    select tipo into v_tipo from public.consignas where id = new.consigna_id;
    if v_tipo = 'lectura' and new.leida_at is null then
      raise exception 'integridad: confirmá la lectura' using errcode = 'P0001';
    end if;
    new.completada_at := now();
  elsif new.estado <> 'hecha' then
    new.completada_at := null;
  end if;
  return new;
end $$;

create trigger proteger_asignacion before update on public.consigna_asignaciones
  for each row execute function public.proteger_asignacion();
