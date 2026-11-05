-- PEA · Etapa 4 · RLS, disponibilidad y progreso de cursos

-- Autoría/promoción como el resto del contenido
create trigger fijar_autoria_contenido before insert on public.cursos
  for each row execute function public.fijar_autoria_contenido();
create trigger proteger_promocion before update on public.cursos
  for each row execute function public.proteger_promocion();

create or replace function public.promover_contenido(p_tabla text, p_id uuid) returns void
language plpgsql security definer set search_path = '' as $$
declare v_filas int;
begin
  if public.mi_rol() is distinct from 'admin' then
    raise exception 'no_autorizado: solo el admin promueve' using errcode = 'P0001';
  end if;
  if p_tabla not in ('articulos', 'recursos', 'campanas', 'cursos') then
    raise exception 'tabla inválida' using errcode = '22023';
  end if;
  perform set_config('pea.promoviendo', 'si', true);
  execute format(
    'update public.%I set alcance = ''global'', sede_id = null, promovido_por = $1, promovido_at = now()
     where id = $2 and alcance = ''sede''', p_tabla)
  using auth.uid(), p_id;
  get diagnostics v_filas = row_count;
  perform set_config('pea.promoviendo', '', true);
  if v_filas = 0 then
    raise exception 'no se encontró contenido de sede para promover' using errcode = 'P0002';
  end if;
  insert into public.auditoria (actor_id, accion, entidad, entidad_id)
  values (auth.uid(), 'promover', p_tabla, p_id);
end $$;

-- Lectura/edición de un curso, y de sus módulos e ítems vía el curso
create or replace function public.puede_leer_curso(p_curso uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((select public.puede_leer_contenido(c.alcance, c.sede_id, c.estado) from public.cursos c where c.id = p_curso), false)
$$;
create or replace function public.puede_editar_curso(p_curso uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((select public.puede_editar_contenido(c.alcance, c.sede_id) from public.cursos c where c.id = p_curso), false)
$$;
create or replace function public.curso_de_modulo(p_modulo uuid) returns uuid
language sql stable security definer set search_path = '' as $$
  select curso_id from public.modulos where id = p_modulo
$$;

alter table public.cursos enable row level security;
alter table public.ruta_cursos enable row level security;
alter table public.modulos enable row level security;
alter table public.modulo_prerrequisitos enable row level security;
alter table public.items enable row level security;
alter table public.item_progreso enable row level security;
revoke all on public.cursos, public.ruta_cursos, public.modulos, public.modulo_prerrequisitos,
  public.items, public.item_progreso from anon;

create policy cursos_leer on public.cursos for select to authenticated using (public.puede_leer_contenido(alcance, sede_id, estado));
create policy cursos_crear on public.cursos for insert to authenticated with check (public.puede_editar_contenido(alcance, sede_id));
create policy cursos_editar on public.cursos for update to authenticated
  using (public.puede_editar_contenido(alcance, sede_id)) with check (public.puede_editar_contenido(alcance, sede_id));
create policy cursos_borrar on public.cursos for delete to authenticated using (public.puede_editar_contenido(alcance, sede_id));

create policy modulos_leer on public.modulos for select to authenticated using (public.puede_leer_curso(curso_id));
create policy modulos_escribir on public.modulos for all to authenticated
  using (public.puede_editar_curso(curso_id)) with check (public.puede_editar_curso(curso_id));

create policy prerrequisitos_leer on public.modulo_prerrequisitos for select to authenticated
  using (public.puede_leer_curso(public.curso_de_modulo(modulo_id)));
create policy prerrequisitos_escribir on public.modulo_prerrequisitos for all to authenticated
  using (public.puede_editar_curso(public.curso_de_modulo(modulo_id)))
  with check (public.puede_editar_curso(public.curso_de_modulo(modulo_id)));

create policy items_leer on public.items for select to authenticated
  using (public.puede_leer_curso(public.curso_de_modulo(modulo_id)));
create policy items_escribir on public.items for all to authenticated
  using (public.puede_editar_curso(public.curso_de_modulo(modulo_id)))
  with check (public.puede_editar_curso(public.curso_de_modulo(modulo_id)));

create policy ruta_leer on public.ruta_cursos for select to authenticated using (public.mi_perfil_activo());
create policy ruta_admin on public.ruta_cursos for all to authenticated
  using (public.mi_rol() = 'admin') with check (public.mi_rol() = 'admin');

-- Cumplimiento (calculado)
create or replace function public.item_cumplido(p_item uuid, p_usuario uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select case i.requisito
    when 'ninguno' then true
    when 'ver' then exists (select 1 from public.item_progreso p where p.item_id = i.id and p.usuario_id = p_usuario and p.visto_at is not null)
    when 'marcar_hecho' then exists (select 1 from public.item_progreso p where p.item_id = i.id and p.usuario_id = p_usuario and p.hecho_at is not null)
    else false  -- 'aprobar': se resuelve con los exámenes (Etapa 5)
  end
  from public.items i where i.id = p_item
$$;

create or replace function public.modulo_cumplido(p_modulo uuid, p_usuario uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select not exists (
    select 1 from public.items i
    where i.modulo_id = p_modulo and i.requisito <> 'ninguno' and not public.item_cumplido(i.id, p_usuario)
  )
$$;

create or replace function public.curso_cumplido(p_curso uuid, p_usuario uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (
      select 1 from public.items i join public.modulos m on m.id = i.modulo_id
      where m.curso_id = p_curso and i.requisito <> 'ninguno')
    and not exists (
      select 1 from public.items i join public.modulos m on m.id = i.modulo_id
      where m.curso_id = p_curso and i.requisito <> 'ninguno' and not public.item_cumplido(i.id, p_usuario))
$$;

-- Un nivel se desbloquea con el nivel publicado anterior cumplido (Etapa 5 suma examen final y ubicación).
create or replace function public.curso_desbloqueado(p_curso uuid, p_usuario uuid) returns boolean
language plpgsql stable security definer set search_path = '' as $$
declare v_c public.cursos; v_anterior uuid;
begin
  select * into v_c from public.cursos where id = p_curso;
  if not found then return false; end if;
  if v_c.tipo <> 'nivel' then return true; end if;
  select id into v_anterior from public.cursos
  where tipo = 'nivel' and estado = 'publicado' and nivel_orden < v_c.nivel_orden
  order by nivel_orden desc limit 1;
  return v_anterior is null or public.curso_cumplido(v_anterior, p_usuario);
end $$;

create or replace function public.item_disponible(p_item uuid, p_usuario uuid) returns boolean
language plpgsql stable security definer set search_path = '' as $$
declare v_i public.items; v_m public.modulos; v_c public.cursos;
begin
  select * into v_i from public.items where id = p_item;
  if not found then return false; end if;
  select * into v_m from public.modulos where id = v_i.modulo_id;
  select * into v_c from public.cursos where id = v_m.curso_id;
  -- el usuario tiene que poder leer el curso (evaluado como ese usuario)
  if not exists (
    select 1 from public.perfiles p
    where p.id = p_usuario and p.activo
      and v_c.estado = 'publicado'
      and (v_c.alcance = 'global' or v_c.sede_id = p.sede_id)
  ) then
    return false;
  end if;
  if not public.curso_desbloqueado(v_c.id, p_usuario) then return false; end if;
  if exists (
    select 1 from public.modulo_prerrequisitos mp
    where mp.modulo_id = v_m.id and not public.modulo_cumplido(mp.requiere_modulo_id, p_usuario)
  ) then
    return false;
  end if;
  if v_m.avance_secuencial and exists (
    select 1 from public.items i
    where i.modulo_id = v_m.id and i.requisito <> 'ninguno'
      and (i.orden, i.id::text) < (v_i.orden, v_i.id::text)
      and not public.item_cumplido(i.id, p_usuario)
  ) then
    return false;
  end if;
  return true;
end $$;

revoke all on function public.puede_leer_curso(uuid), public.puede_editar_curso(uuid), public.curso_de_modulo(uuid),
  public.item_cumplido(uuid, uuid), public.modulo_cumplido(uuid, uuid), public.curso_cumplido(uuid, uuid),
  public.curso_desbloqueado(uuid, uuid), public.item_disponible(uuid, uuid) from public, anon;
grant execute on function public.puede_leer_curso(uuid), public.puede_editar_curso(uuid), public.curso_de_modulo(uuid),
  public.item_cumplido(uuid, uuid), public.modulo_cumplido(uuid, uuid), public.curso_cumplido(uuid, uuid),
  public.curso_desbloqueado(uuid, uuid), public.item_disponible(uuid, uuid) to authenticated;

-- Progreso: propio, solo de ítems disponibles; las fechas las pone el servidor
create policy progreso_leer on public.item_progreso for select to authenticated
  using (usuario_id = auth.uid() or public.puede_ver_usuario(usuario_id));
create policy progreso_crear on public.item_progreso for insert to authenticated
  with check (usuario_id = auth.uid() and public.item_disponible(item_id, auth.uid()));
create policy progreso_editar on public.item_progreso for update to authenticated
  using (usuario_id = auth.uid()) with check (usuario_id = auth.uid() and public.item_disponible(item_id, auth.uid()));
revoke delete on public.item_progreso from authenticated;

create or replace function public.proteger_progreso() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_req public.requisito_item;
begin
  if auth.uid() is null then return new; end if;
  select requisito into v_req from public.items where id = new.item_id;
  if tg_op = 'UPDATE' then
    if new.usuario_id is distinct from old.usuario_id or new.item_id is distinct from old.item_id then
      raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
    end if;
    new.visto_at := case when new.visto_at is not null then coalesce(old.visto_at, now()) else old.visto_at end;
    new.hecho_at := case when new.hecho_at is not null then coalesce(old.hecho_at, now()) else old.hecho_at end;
    if old.hecho_at is null and new.hecho_at is not null and v_req <> 'marcar_hecho' then
      raise exception 'integridad: este ítem no se marca a mano' using errcode = 'P0001';
    end if;
  else
    if new.visto_at is not null then new.visto_at := now(); end if;
    if new.hecho_at is not null then
      if v_req <> 'marcar_hecho' then
        raise exception 'integridad: este ítem no se marca a mano' using errcode = 'P0001';
      end if;
      new.hecho_at := now();
    end if;
  end if;
  return new;
end $$;

create trigger proteger_progreso before insert or update on public.item_progreso
  for each row execute function public.proteger_progreso();

-- RPC para marcar (corre con los permisos del usuario: la RLS y el trigger deciden)
create or replace function public.marcar_item(p_item uuid, p_accion text) returns jsonb
language plpgsql security invoker set search_path = '' as $$
begin
  if p_accion not in ('visto', 'hecho') then
    raise exception 'acción inválida' using errcode = '22023';
  end if;
  if not public.item_disponible(p_item, auth.uid()) then
    raise exception 'bloqueado: completá lo anterior' using errcode = 'P0001';
  end if;
  insert into public.item_progreso (usuario_id, item_id, visto_at, hecho_at)
  values (auth.uid(), p_item, now(), case when p_accion = 'hecho' then now() end)
  on conflict (usuario_id, item_id) do update
    set visto_at = coalesce(public.item_progreso.visto_at, now()),
        hecho_at = case when p_accion = 'hecho' then coalesce(public.item_progreso.hecho_at, now()) else public.item_progreso.hecho_at end;
  return jsonb_build_object('ok', true, 'cumplido', public.item_cumplido(p_item, auth.uid()));
end $$;

revoke all on function public.marcar_item(uuid, text) from public, anon;
grant execute on function public.marcar_item(uuid, text) to authenticated;
