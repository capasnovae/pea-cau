-- Correcciones del repaso (revisión final)
-- 1. Un usuario desactivado no responde ni ve pendientes, aunque conserve la sesión.
-- 2. Una pregunta de un paso que dejó de estar disponible (curso en borrador, sin acceso) sale del repaso.
-- 3. Dos envíos simultáneos de la misma tarjeta no la suben dos cajas: la fila se bloquea antes de corregir.

create or replace function public.pozo_repaso() returns setof uuid
language sql stable security definer set search_path = '' as $$
  select r.pregunta_id from public.repaso r join public.preguntas p on p.id = r.pregunta_id
  where r.usuario_id = auth.uid() and r.proxima <= public.hoy_ar()
    and public.mi_perfil_activo()
    and p.estado = 'publicado' and p.uso = 'practica' and p.tipo <> 'libre'
    and (p.alcance = 'global' or p.sede_id = public.mi_sede())
    and (p.item_id is null or public.item_disponible(p.item_id, auth.uid()))
$$;

create or replace function public.responder_repaso(p_pregunta uuid, p_respuesta jsonb)
returns table (es_correcta boolean, explicacion_md text, solucion jsonb)
language plpgsql security definer set search_path = '' as $$
declare r record;
begin
  if not public.mi_perfil_activo() then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  perform 1 from public.repaso
  where usuario_id = auth.uid() and pregunta_id = p_pregunta and proxima <= public.hoy_ar()
  for update;
  if not found or p_pregunta not in (select public.pozo_repaso()) then
    raise exception 'no toca hoy' using errcode = 'P0001';
  end if;
  select * into r from public.corregir_practica(p_pregunta, p_respuesta);
  update public.repaso set
    caja = case when r.es_correcta then least(5, caja + 1) else 1 end,
    proxima = public.hoy_ar() + case when r.es_correcta then public.intervalo_repaso(least(5, caja + 1)) else 1 end,
    aciertos = aciertos + case when r.es_correcta then 1 else 0 end,
    fallos = fallos + case when r.es_correcta then 0 else 1 end,
    updated_at = clock_timestamp()
  where usuario_id = auth.uid() and pregunta_id = p_pregunta;
  insert into public.repaso_dias (usuario_id, dia, respuestas) values (auth.uid(), public.hoy_ar(), 1)
  on conflict (usuario_id, dia) do update set respuestas = public.repaso_dias.respuestas + 1;
  return query select r.es_correcta, r.explicacion_md, r.solucion;
end $$;

revoke all on function public.pozo_repaso() from public, anon, authenticated;
revoke all on function public.responder_repaso(uuid, jsonb) from public, anon;
grant execute on function public.responder_repaso(uuid, jsonb) to authenticated;
