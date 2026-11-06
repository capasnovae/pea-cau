-- PEA · Etapa 5 · Correcciones de la revisión final (bandeja)

-- Cada participante ve solo su propia fila: no se exponen las lecturas (leido_at) de los demás.
drop policy participantes_leer on public.conversacion_participantes;
create policy participantes_leer on public.conversacion_participantes for select to authenticated
  using (usuario_id = auth.uid() and public.mi_perfil_activo());

-- Un anuncio no expone la lista de destinatarios.
create or replace function public.participantes_de(p_conversacion uuid)
returns table (id uuid, nombre text)
language plpgsql stable security definer set search_path = '' as $$
begin
  perform public.exigir_participante(p_conversacion);
  return query
  select p.id, btrim(p.nombre || ' ' || p.apellido)
  from public.conversacion_participantes cp
  join public.conversaciones c on c.id = cp.conversacion_id
  join public.perfiles p on p.id = cp.usuario_id
  where cp.conversacion_id = p_conversacion and not c.es_anuncio
  order by p.nombre, p.apellido;
end $$;
