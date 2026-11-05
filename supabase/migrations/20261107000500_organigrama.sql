-- PEA · Etapa 3 · Directorio para el organigrama
-- Solo datos de directorio de usuarios activos (sin email ni teléfono), para cualquier usuario activo.

create or replace function public.organigrama()
returns table (
  id uuid, nombre text, apellido text, rol public.rol_app, area public.area,
  sede_id uuid, sede text, equipo_id uuid, equipo text, es_lider boolean, puesto text, subroles text[]
)
language sql stable security definer set search_path = '' as $$
  select p.id, p.nombre, p.apellido, p.rol, p.area,
         p.sede_id, s.nombre, p.equipo_id, e.nombre,
         exists (select 1 from public.equipos le where le.lider_id = p.id),
         pu.nombre,
         coalesce((select array_agg(sr.nombre order by sr.orden)
                   from public.perfil_subroles ps join public.subroles sr on sr.id = ps.subrol_id
                   where ps.perfil_id = p.id), '{}')
  from public.perfiles p
  left join public.sedes s on s.id = p.sede_id
  left join public.equipos e on e.id = p.equipo_id
  left join public.puestos pu on pu.id = p.puesto_id
  where p.activo and public.mi_perfil_activo()
  order by s.nombre nulls first, p.apellido, p.nombre
$$;

revoke all on function public.organigrama() from public, anon;
grant execute on function public.organigrama() to authenticated;
