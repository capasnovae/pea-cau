-- PEA · Etapa 7 · Correcciones de la revisión final

-- Las certificaciones vigentes anteriores a la Etapa 7 reciben su insignia (idempotente)
create or replace function public.rellenar_insignias() returns void
language sql security definer set search_path = '' as $$
  insert into public.usuario_insignias (usuario_id, insignia_id, otorgada_at)
  select distinct on (c.usuario_id, i.id) c.usuario_id, i.id, c.emitida_at
  from public.certificaciones c
  join public.insignias i on i.curso_id = c.curso_id
  where public.estado_efectivo(c.estado, c.vence_at) = 'vigente'
  order by c.usuario_id, i.id, c.emitida_at
  on conflict (usuario_id, insignia_id) do nothing
$$;
revoke all on function public.rellenar_insignias() from public, anon, authenticated;
select public.rellenar_insignias();

-- anon recibe permisos por defecto en Supabase: quitarlos explícitamente
revoke execute on function public.revocar_certificacion(uuid, text), public.mi_perfil_evolutivo(),
  public.estado_efectivo(public.estado_certificacion, timestamptz) from anon;
