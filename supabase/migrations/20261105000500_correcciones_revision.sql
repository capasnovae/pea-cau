-- PEA · Etapa 1 · Correcciones de la revisión final
-- C2: el alta ya no confía en raw_user_meta_data para privilegios.
-- I2: integridad sede/área de equipos y líderes, y visibilidad del líder acotada a su sede.
-- I3: campos del examen de ubicación protegidos.

-- C2 ------------------------------------------------------------------------
-- raw_app_meta_data solo lo escribe el service role. Si trae pea_alta=true, el alta
-- viene del servidor (invitación del admin o seed) y se respetan rol/sede/área/puesto.
-- Cualquier otra alta (signUp abierto, OTP, OAuth) queda como asesor, sin sede e inactiva.
create or replace function public.crear_perfil_desde_invitacion() returns trigger
language plpgsql security definer set search_path = '' as $$
declare
  u jsonb := coalesce(new.raw_user_meta_data, '{}'::jsonb);
  a jsonb := coalesce(new.raw_app_meta_data, '{}'::jsonb);
  v_confiable boolean := coalesce((a->>'pea_alta')::boolean, false);
  v_rol public.rol_app := 'asesor';
  v_area public.area;
  v_sede uuid;
  v_puesto uuid;
  uuid_re constant text := '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$';
begin
  if v_confiable then
    if a->>'rol' in ('asesor', 'lider', 'coordinador', 'director', 'admin') then
      v_rol := (a->>'rol')::public.rol_app;
    end if;
    if a->>'area' in ('servicio', 'ventas') then
      v_area := (a->>'area')::public.area;
    end if;
    if a->>'sede_id' ~* uuid_re then
      select id into v_sede from public.sedes where id = (a->>'sede_id')::uuid;
    end if;
    if a->>'puesto_id' ~* uuid_re then
      select id into v_puesto from public.puestos where id = (a->>'puesto_id')::uuid;
    end if;
  end if;

  insert into public.perfiles (id, nombre, apellido, email, rol, area, sede_id, puesto_id, activo)
  values (
    new.id,
    coalesce(nullif(trim(u->>'nombre'), ''), split_part(new.email, '@', 1)),
    coalesce(trim(u->>'apellido'), ''),
    new.email,
    v_rol, v_area, v_sede, v_puesto, v_confiable
  )
  on conflict (id) do nothing;

  insert into public.auditoria (actor_id, accion, entidad, entidad_id, datos)
  values (null, 'alta_usuario', 'perfiles', new.id,
          jsonb_build_object('email', new.email, 'rol', v_rol, 'sede_id', v_sede, 'area', v_area,
                             'confiable', v_confiable));
  return new;
end $$;

-- I2 ------------------------------------------------------------------------
create or replace function public.validar_equipo_perfil() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if new.equipo_id is not null and not exists (
    select 1 from public.equipos e
    where e.id = new.equipo_id and e.sede_id = new.sede_id and e.area = new.area
  ) then
    raise exception 'integridad: el equipo es de otra sede o área' using errcode = 'P0001';
  end if;
  return new;
end $$;

create trigger validar_equipo_perfil before insert or update of equipo_id, sede_id, area on public.perfiles
  for each row execute function public.validar_equipo_perfil();

create or replace function public.validar_lider_equipo() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if new.lider_id is not null and not exists (
    select 1 from public.perfiles p
    where p.id = new.lider_id and p.sede_id = new.sede_id and p.area = new.area
  ) then
    raise exception 'integridad: el líder es de otra sede o área' using errcode = 'P0001';
  end if;
  return new;
end $$;

create trigger validar_lider_equipo before insert or update of lider_id, sede_id, area on public.equipos
  for each row execute function public.validar_lider_equipo();

create or replace function public.puede_ver_usuario(objetivo uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select
    objetivo = auth.uid()
    or exists (
      select 1
      from public.perfiles yo
      join public.perfiles otro on otro.id = objetivo
      where yo.id = auth.uid()
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

-- I3 ------------------------------------------------------------------------
create or replace function public.proteger_campos_perfil() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_rol public.rol_app := public.mi_rol();
begin
  -- Sin usuario autenticado en el request (service role, migraciones, seed): sin restricciones.
  -- Ojo: un superusuario con claims de usuario en el mismo request SÍ queda restringido.
  if auth.uid() is null or v_rol = 'admin' then
    return new;
  end if;
  if new.rol is distinct from old.rol then
    raise exception 'no_autorizado: no podés cambiar el rol' using errcode = 'P0001';
  end if;
  -- ubicacion_rendida_at solo lo escribe una función security definer del examen (etapa 5).
  if new.sede_id is distinct from old.sede_id
     or new.email is distinct from old.email
     or new.activo is distinct from old.activo
     or new.area is distinct from old.area
     or new.ubicacion_rendida_at is distinct from old.ubicacion_rendida_at then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  if new.id = auth.uid() and (
       new.equipo_id is distinct from old.equipo_id
       or new.puesto_id is distinct from old.puesto_id
       or new.experiencia_previa is distinct from old.experiencia_previa
       or new.fecha_ingreso is distinct from old.fecha_ingreso
       or new.ubicacion_habilitada_por is distinct from old.ubicacion_habilitada_por) then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  -- Quien habilita la ubicación tiene que ser quien firma el cambio.
  if new.ubicacion_habilitada_por is distinct from old.ubicacion_habilitada_por
     and new.ubicacion_habilitada_por is not null
     and new.ubicacion_habilitada_por <> auth.uid() then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  return new;
end $$;
