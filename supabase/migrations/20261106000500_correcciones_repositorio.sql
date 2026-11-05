-- PEA · Etapa 2 · Correcciones de la revisión final
-- I2/I3: leer un archivo exige una fila de recurso legible que lo use (o poder editar esa carpeta).
--        Así un borrador no se filtra por Storage y un recurso promovido se descarga desde cualquier sede.
-- I5:    el historial de versiones solo lo leen quienes pueden editar el artículo.

create or replace function public.puede_leer_archivo(p_nombre text) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce(
    (select c.alcance is not null and public.puede_editar_contenido(c.alcance, c.sede_id)
     from public.carpeta_alcance(p_nombre) c)
    or exists (
      select 1 from public.recursos r
      where r.archivo_path = p_nombre
        and public.puede_leer_contenido(r.alcance, r.sede_id, r.estado)
    ),
    false)
$$;

create index if not exists recursos_archivo_path_idx on public.recursos (archivo_path);

drop policy articulo_versiones_leer on public.articulo_versiones;
create policy articulo_versiones_leer on public.articulo_versiones for select to authenticated
  using (exists (
    select 1 from public.articulos a
    where a.id = articulo_id and public.puede_editar_contenido(a.alcance, a.sede_id)
  ));

-- Un recurso solo puede apuntar a archivos de una carpeta que quien escribe puede editar
-- (si no, un coordinador podría "publicar" para su sede un archivo de otra sede).
create or replace function public.validar_archivo_recurso() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if auth.uid() is not null
     and new.archivo_path is not null
     and (tg_op = 'INSERT' or new.archivo_path is distinct from old.archivo_path)
     and not public.puede_escribir_archivo(new.archivo_path) then
    raise exception 'no_autorizado: el archivo es de otra carpeta' using errcode = 'P0001';
  end if;
  return new;
end $$;

create trigger validar_archivo_recurso before insert or update of archivo_path on public.recursos
  for each row execute function public.validar_archivo_recurso();
