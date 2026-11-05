-- PEA · Etapa 1 · Funciones auxiliares de visibilidad (spec §3 "Regla central de visibilidad")
-- Todas: security definer + stable + search_path vacío, para usarlas desde políticas RLS
-- sin recursión sobre public.perfiles.

create or replace function public.mi_perfil_activo() returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((select p.activo from public.perfiles p where p.id = auth.uid()), false)
$$;

create or replace function public.mi_rol() returns public.rol_app
language sql stable security definer set search_path = '' as $$
  select p.rol from public.perfiles p where p.id = auth.uid() and p.activo
$$;

create or replace function public.mi_sede() returns uuid
language sql stable security definer set search_path = '' as $$
  select p.sede_id from public.perfiles p where p.id = auth.uid() and p.activo
$$;

create or replace function public.mi_area() returns public.area
language sql stable security definer set search_path = '' as $$
  select p.area from public.perfiles p where p.id = auth.uid() and p.activo
$$;

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
            and exists (
              select 1 from public.equipos e
              where e.id = otro.equipo_id and e.lider_id = yo.id
            )
          )
        )
    )
$$;

revoke all on function public.mi_perfil_activo(), public.mi_rol(), public.mi_sede(), public.mi_area(),
  public.puede_ver_usuario(uuid) from public, anon;
grant execute on function public.mi_perfil_activo(), public.mi_rol(), public.mi_sede(), public.mi_area(),
  public.puede_ver_usuario(uuid) to authenticated;
