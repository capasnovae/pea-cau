-- PEA · Etapa 3 · Evidencias de consignas: <asignacion_id>/<uuid>-<nombre>.<ext>

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('evidencias', 'evidencias', false, 10485760, array['image/png', 'image/jpeg', 'image/webp', 'application/pdf'])
on conflict (id) do update set public = excluded.public, file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

create or replace function public.asignacion_de_ruta(p_nombre text) returns uuid
language plpgsql immutable set search_path = '' as $$
declare v text := split_part(coalesce(p_nombre, ''), '/', 1);
begin
  if v ~ '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$' and p_nombre !~ '(^|/)\.\.(/|$)' then
    return v::uuid;
  end if;
  return null;
end $$;

create or replace function public.puede_leer_evidencia(p_nombre text) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((
    select a.usuario_id = auth.uid()
        or public.puede_ver_usuario(a.usuario_id)
        or public.es_creador_de_asignacion(a.consigna_id)
    from public.consigna_asignaciones a
    where a.id = public.asignacion_de_ruta(p_nombre)
  ), false) and public.mi_perfil_activo()
$$;

create or replace function public.puede_subir_evidencia(p_nombre text) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((
    select a.usuario_id = auth.uid()
    from public.consigna_asignaciones a
    where a.id = public.asignacion_de_ruta(p_nombre)
  ), false) and public.mi_perfil_activo()
$$;

revoke all on function public.puede_leer_evidencia(text), public.puede_subir_evidencia(text) from public, anon;
grant execute on function public.puede_leer_evidencia(text), public.puede_subir_evidencia(text) to authenticated;

create policy evidencias_leer on storage.objects for select to authenticated
  using (bucket_id = 'evidencias' and public.puede_leer_evidencia(name));
create policy evidencias_subir on storage.objects for insert to authenticated
  with check (bucket_id = 'evidencias' and public.puede_subir_evidencia(name));
create policy evidencias_editar on storage.objects for update to authenticated
  using (bucket_id = 'evidencias' and public.puede_subir_evidencia(name))
  with check (bucket_id = 'evidencias' and public.puede_subir_evidencia(name));
create policy evidencias_borrar on storage.objects for delete to authenticated
  using (bucket_id = 'evidencias' and public.puede_subir_evidencia(name));
