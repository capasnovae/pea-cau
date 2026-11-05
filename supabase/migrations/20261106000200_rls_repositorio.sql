-- PEA · Etapa 2 · Alcance, RLS y promoción del repositorio (spec §4.1 y §6)

create or replace function public.puede_editar_contenido(p_alcance public.alcance, p_sede uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce(
    public.mi_rol() = 'admin'
    or (p_alcance = 'sede' and public.mi_rol() = 'director')
    or (p_alcance = 'sede' and public.mi_rol() = 'coordinador' and p_sede is not null and p_sede = public.mi_sede()),
    false)
$$;

create or replace function public.puede_leer_contenido(p_alcance public.alcance, p_sede uuid, p_estado public.estado_contenido)
returns boolean
language sql stable security definer set search_path = '' as $$
  select public.puede_editar_contenido(p_alcance, p_sede)
    or (public.mi_perfil_activo() and p_estado = 'publicado'
        and (p_alcance = 'global' or (p_sede is not null and p_sede = public.mi_sede())))
$$;

revoke all on function public.puede_editar_contenido(public.alcance, uuid),
  public.puede_leer_contenido(public.alcance, uuid, public.estado_contenido) from public, anon;
grant execute on function public.puede_editar_contenido(public.alcance, uuid),
  public.puede_leer_contenido(public.alcance, uuid, public.estado_contenido) to authenticated;

-- Autoría y sede de origen al crear
create or replace function public.fijar_autoria_contenido() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if auth.uid() is not null then
    new.autor_id := auth.uid();
  end if;
  new.sede_origen_id := coalesce(new.sede_origen_id, new.sede_id);
  new.promovido_por := null;
  new.promovido_at := null;
  return new;
end $$;

create trigger fijar_autoria_contenido before insert on public.articulos
  for each row execute function public.fijar_autoria_contenido();
create trigger fijar_autoria_contenido before insert on public.recursos
  for each row execute function public.fijar_autoria_contenido();
create trigger fijar_autoria_contenido before insert on public.campanas
  for each row execute function public.fijar_autoria_contenido();

-- RLS
alter table public.categorias enable row level security;
alter table public.articulos enable row level security;
alter table public.articulo_versiones enable row level security;
alter table public.campanas enable row level security;
alter table public.recursos enable row level security;

revoke all on public.categorias, public.articulos, public.articulo_versiones, public.campanas, public.recursos from anon;

create policy categorias_leer on public.categorias for select to authenticated using (public.mi_perfil_activo());
create policy categorias_admin on public.categorias for all to authenticated
  using (public.mi_rol() = 'admin') with check (public.mi_rol() = 'admin');

create policy articulos_leer on public.articulos for select to authenticated
  using (public.puede_leer_contenido(alcance, sede_id, estado));
create policy articulos_crear on public.articulos for insert to authenticated
  with check (public.puede_editar_contenido(alcance, sede_id));
create policy articulos_editar on public.articulos for update to authenticated
  using (public.puede_editar_contenido(alcance, sede_id)) with check (public.puede_editar_contenido(alcance, sede_id));
create policy articulos_borrar on public.articulos for delete to authenticated
  using (public.puede_editar_contenido(alcance, sede_id));

create policy recursos_leer on public.recursos for select to authenticated
  using (public.puede_leer_contenido(alcance, sede_id, estado));
create policy recursos_crear on public.recursos for insert to authenticated
  with check (public.puede_editar_contenido(alcance, sede_id));
create policy recursos_editar on public.recursos for update to authenticated
  using (public.puede_editar_contenido(alcance, sede_id)) with check (public.puede_editar_contenido(alcance, sede_id));
create policy recursos_borrar on public.recursos for delete to authenticated
  using (public.puede_editar_contenido(alcance, sede_id));

create policy campanas_leer on public.campanas for select to authenticated
  using (public.puede_leer_contenido(alcance, sede_id, estado));
create policy campanas_crear on public.campanas for insert to authenticated
  with check (public.puede_editar_contenido(alcance, sede_id));
create policy campanas_editar on public.campanas for update to authenticated
  using (public.puede_editar_contenido(alcance, sede_id)) with check (public.puede_editar_contenido(alcance, sede_id));
create policy campanas_borrar on public.campanas for delete to authenticated
  using (public.puede_editar_contenido(alcance, sede_id));

create policy articulo_versiones_leer on public.articulo_versiones for select to authenticated
  using (exists (select 1 from public.articulos a where a.id = articulo_id));
revoke insert, update, delete on public.articulo_versiones from authenticated;

-- Los campos de promoción y la sede de origen no se tocan a mano (solo vía promover_contenido).
create or replace function public.proteger_promocion() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if auth.uid() is not null and current_setting('pea.promoviendo', true) is distinct from 'si' and (
       new.promovido_por is distinct from old.promovido_por
       or new.promovido_at is distinct from old.promovido_at
       or new.sede_origen_id is distinct from old.sede_origen_id
       or new.autor_id is distinct from old.autor_id) then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  return new;
end $$;

create trigger proteger_promocion before update on public.articulos for each row execute function public.proteger_promocion();
create trigger proteger_promocion before update on public.recursos for each row execute function public.proteger_promocion();
create trigger proteger_promocion before update on public.campanas for each row execute function public.proteger_promocion();

-- Promoción de sede a global (solo admin)
create or replace function public.promover_contenido(p_tabla text, p_id uuid) returns void
language plpgsql security definer set search_path = '' as $$
declare v_filas int;
begin
  if public.mi_rol() is distinct from 'admin' then
    raise exception 'no_autorizado: solo el admin promueve' using errcode = 'P0001';
  end if;
  if p_tabla not in ('articulos', 'recursos', 'campanas') then
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

revoke all on function public.promover_contenido(text, uuid) from public, anon;
grant execute on function public.promover_contenido(text, uuid) to authenticated;
