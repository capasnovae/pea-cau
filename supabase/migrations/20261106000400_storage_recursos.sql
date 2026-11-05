-- PEA · Etapa 2 · Bucket privado de recursos con políticas por carpeta
-- Ruta: <carpeta>/<uuid>-<nombre>.<ext>, donde <carpeta> es 'global' o el id de la sede.

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('recursos', 'recursos', false, 52428800, array[
  'image/png', 'image/jpeg', 'image/webp', 'image/gif',
  'application/pdf',
  'application/vnd.openxmlformats-officedocument.presentationml.presentation',
  'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
  'video/mp4'
])
on conflict (id) do update set public = excluded.public, file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

-- Interpreta el primer segmento de la ruta como alcance.
create or replace function public.carpeta_alcance(p_nombre text, out alcance public.alcance, out sede_id uuid)
language plpgsql immutable set search_path = '' as $$
declare v_carpeta text := split_part(coalesce(p_nombre, ''), '/', 1);
begin
  if v_carpeta = 'global' then
    alcance := 'global'; sede_id := null;
  elsif v_carpeta ~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$' then
    alcance := 'sede'; sede_id := v_carpeta::uuid;
  else
    alcance := null; sede_id := null;
  end if;
end $$;

create or replace function public.puede_leer_archivo(p_nombre text) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((
    select (c.alcance is not null)
       and (public.puede_editar_contenido(c.alcance, c.sede_id)
            or (public.mi_perfil_activo() and (c.alcance = 'global' or c.sede_id = public.mi_sede())))
    from public.carpeta_alcance(p_nombre) c
  ), false)
$$;

create or replace function public.puede_escribir_archivo(p_nombre text) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((
    select c.alcance is not null and public.puede_editar_contenido(c.alcance, c.sede_id)
    from public.carpeta_alcance(p_nombre) c
  ), false)
$$;

revoke all on function public.puede_leer_archivo(text), public.puede_escribir_archivo(text) from public, anon;
grant execute on function public.puede_leer_archivo(text), public.puede_escribir_archivo(text) to authenticated;

create policy recursos_archivos_leer on storage.objects for select to authenticated
  using (bucket_id = 'recursos' and public.puede_leer_archivo(name));
create policy recursos_archivos_subir on storage.objects for insert to authenticated
  with check (bucket_id = 'recursos' and public.puede_escribir_archivo(name));
create policy recursos_archivos_editar on storage.objects for update to authenticated
  using (bucket_id = 'recursos' and public.puede_escribir_archivo(name))
  with check (bucket_id = 'recursos' and public.puede_escribir_archivo(name));
create policy recursos_archivos_borrar on storage.objects for delete to authenticated
  using (bucket_id = 'recursos' and public.puede_escribir_archivo(name));
