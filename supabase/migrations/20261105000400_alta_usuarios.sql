-- PEA · Etapa 1 · Alta de usuarios por invitación
-- El admin invita con auth.admin.inviteUserByEmail(email, { data: {...} }).
-- Este trigger crea el perfil a partir de esa metadata. Valores inválidos se descartan.

create or replace function public.crear_perfil_desde_invitacion() returns trigger
language plpgsql security definer set search_path = '' as $$
declare
  m jsonb := coalesce(new.raw_user_meta_data, '{}'::jsonb);
  v_rol public.rol_app := 'asesor';
  v_area public.area;
  v_sede uuid;
  v_puesto uuid;
begin
  if m->>'rol' in ('asesor', 'lider', 'coordinador', 'director', 'admin') then
    v_rol := (m->>'rol')::public.rol_app;
  end if;
  if m->>'area' in ('servicio', 'ventas') then
    v_area := (m->>'area')::public.area;
  end if;
  if m->>'sede_id' ~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$' then
    select id into v_sede from public.sedes where id = (m->>'sede_id')::uuid;
  end if;
  if m->>'puesto_id' ~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$' then
    select id into v_puesto from public.puestos where id = (m->>'puesto_id')::uuid;
  end if;

  insert into public.perfiles (id, nombre, apellido, email, rol, area, sede_id, puesto_id)
  values (
    new.id,
    coalesce(nullif(trim(m->>'nombre'), ''), split_part(new.email, '@', 1)),
    coalesce(trim(m->>'apellido'), ''),
    new.email,
    v_rol, v_area, v_sede, v_puesto
  )
  on conflict (id) do nothing;

  insert into public.auditoria (actor_id, accion, entidad, entidad_id, datos)
  values (null, 'alta_usuario', 'perfiles', new.id,
          jsonb_build_object('email', new.email, 'rol', v_rol, 'sede_id', v_sede, 'area', v_area));
  return new;
end $$;

create trigger crear_perfil_desde_invitacion
  after insert on auth.users
  for each row execute function public.crear_perfil_desde_invitacion();
