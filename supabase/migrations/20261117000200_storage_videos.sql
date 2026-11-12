-- PEA · Videos de las lecciones (fabricados con Revideo desde el repositorio)
-- Bucket privado: la lección los muestra con un enlace firmado. Los lee cualquier perfil activo;
-- no hay política de escritura: se suben solo con la clave de servicio (scripts/subir-video.mts).

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('videos', 'videos', false, 104857600, array['video/mp4'])
on conflict (id) do nothing;

create policy videos_leer on storage.objects for select to authenticated
  using (bucket_id = 'videos' and public.mi_perfil_activo());
