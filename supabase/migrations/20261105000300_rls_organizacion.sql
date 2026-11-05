-- PEA · Etapa 1 · RLS de organización y protección de columnas (spec §5 y §6)

alter table public.sedes enable row level security;
alter table public.puestos enable row level security;
alter table public.subroles enable row level security;
alter table public.areas_derivacion enable row level security;
alter table public.equipos enable row level security;
alter table public.perfiles enable row level security;
alter table public.perfil_subroles enable row level security;
alter table public.auditoria enable row level security;

-- anon no accede a nada de organización
revoke all on public.sedes, public.puestos, public.subroles, public.areas_derivacion, public.equipos,
  public.perfiles, public.perfil_subroles, public.auditoria from anon;

-- Catálogos: lectura para perfiles activos, escritura solo admin
create policy sedes_leer on public.sedes for select to authenticated using (public.mi_perfil_activo());
create policy sedes_admin on public.sedes for all to authenticated
  using (public.mi_rol() = 'admin') with check (public.mi_rol() = 'admin');

create policy puestos_leer on public.puestos for select to authenticated using (public.mi_perfil_activo());
create policy puestos_admin on public.puestos for all to authenticated
  using (public.mi_rol() = 'admin') with check (public.mi_rol() = 'admin');

create policy subroles_leer on public.subroles for select to authenticated using (public.mi_perfil_activo());
create policy subroles_admin on public.subroles for all to authenticated
  using (public.mi_rol() = 'admin') with check (public.mi_rol() = 'admin');

create policy areas_derivacion_leer on public.areas_derivacion for select to authenticated
  using (public.mi_perfil_activo());
create policy areas_derivacion_admin on public.areas_derivacion for all to authenticated
  using (public.mi_rol() = 'admin') with check (public.mi_rol() = 'admin');

-- Perfiles
create policy perfiles_leer on public.perfiles for select to authenticated
  using (public.puede_ver_usuario(id));
create policy perfiles_editar on public.perfiles for update to authenticated
  using (
    id = auth.uid()
    or public.mi_rol() = 'admin'
    or (public.mi_rol() in ('director', 'coordinador') and public.puede_ver_usuario(id))
  )
  with check (
    id = auth.uid()
    or public.mi_rol() = 'admin'
    or (public.mi_rol() in ('director', 'coordinador') and public.puede_ver_usuario(id))
  );
revoke insert, delete on public.perfiles from authenticated;

create or replace function public.proteger_campos_perfil() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_rol public.rol_app := public.mi_rol();
begin
  -- Sin usuario autenticado (service role, migraciones, seed): sin restricciones.
  if auth.uid() is null or v_rol = 'admin' then
    return new;
  end if;
  if new.rol is distinct from old.rol then
    raise exception 'no_autorizado: no podés cambiar el rol' using errcode = 'P0001';
  end if;
  if new.sede_id is distinct from old.sede_id
     or new.email is distinct from old.email
     or new.activo is distinct from old.activo
     or new.area is distinct from old.area then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  if new.id = auth.uid()
     and (new.equipo_id is distinct from old.equipo_id or new.puesto_id is distinct from old.puesto_id) then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  return new;
end $$;

create trigger proteger_campos_perfil before update on public.perfiles
  for each row execute function public.proteger_campos_perfil();

-- Equipos
create policy equipos_leer on public.equipos for select to authenticated
  using (public.mi_rol() in ('admin', 'director') or (public.mi_perfil_activo() and sede_id = public.mi_sede()));
create policy equipos_gestionar on public.equipos for all to authenticated
  using (
    public.mi_rol() in ('admin', 'director')
    or (public.mi_rol() = 'coordinador' and sede_id = public.mi_sede() and area = public.mi_area())
  )
  with check (
    public.mi_rol() in ('admin', 'director')
    or (public.mi_rol() = 'coordinador' and sede_id = public.mi_sede() and area = public.mi_area())
  );

-- Subroles por perfil
create policy perfil_subroles_leer on public.perfil_subroles for select to authenticated
  using (public.puede_ver_usuario(perfil_id));
create policy perfil_subroles_gestionar on public.perfil_subroles for all to authenticated
  using (
    public.mi_rol() in ('admin', 'director')
    or (public.mi_rol() = 'coordinador' and public.puede_ver_usuario(perfil_id) and perfil_id <> auth.uid())
  )
  with check (
    public.mi_rol() in ('admin', 'director')
    or (public.mi_rol() = 'coordinador' and public.puede_ver_usuario(perfil_id) and perfil_id <> auth.uid())
  );

-- Auditoría: solo lectura para admin; se escribe desde funciones security definer o service role
create policy auditoria_leer on public.auditoria for select to authenticated using (public.mi_rol() = 'admin');
revoke insert, update, delete on public.auditoria from authenticated;
