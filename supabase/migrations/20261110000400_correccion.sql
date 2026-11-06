-- PEA · Etapa 6 · Cola de corrección por sede (spec §4.4)
-- Corrige líder o superior de la sede del intento (director y admin, cualquiera), nunca el propio.
-- Un intento tomado queda libre si lo sueltan o si pasaron 24 h; el plazo es de 72 h desde la entrega.

create or replace function public.puede_corregir(p_intento uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select public.mi_perfil_activo() and exists (
    select 1 from public.intentos i
    where i.id = p_intento and i.usuario_id <> auth.uid()
      and (public.mi_rol() in ('director', 'admin')
           or (public.mi_rol() in ('lider', 'coordinador') and i.sede_id is not null and i.sede_id = public.mi_sede())))
$$;

create or replace function public.tomado_vigente(p_corrector uuid, p_tomado timestamptz) returns boolean
language sql stable set search_path = '' as $$
  select p_corrector is not null and p_tomado is not null and p_tomado > now() - interval '24 hours'
$$;

create or replace function public.cola_correccion()
returns table (intento_id uuid, examen_titulo text, asesor text, entregado_at timestamptz, correccion_vence_at timestamptz,
               vencida boolean, tomado_por text, tomado_por_mi boolean, libres_pendientes int)
language sql stable security definer set search_path = '' as $$
  select i.id, e.titulo, btrim(p.nombre || ' ' || p.apellido), i.entregado_at, i.correccion_vence_at,
         i.correccion_vence_at < now(),
         case when public.tomado_vigente(i.corrector_id, i.tomado_at)
              then (select btrim(c.nombre || ' ' || c.apellido) from public.perfiles c where c.id = i.corrector_id) end,
         public.tomado_vigente(i.corrector_id, i.tomado_at) and i.corrector_id = auth.uid(),
         (select count(*)::int from public.respuestas r where r.intento_id = i.id and r.corregida_at is null)
  from public.intentos i
  join public.examenes e on e.id = i.examen_id
  join public.perfiles p on p.id = i.usuario_id
  where i.estado = 'pendiente_correccion' and public.puede_corregir(i.id)
  order by i.correccion_vence_at
$$;

create or replace function public.exigir_corrector(p_intento uuid, p_tomado boolean) returns void
language plpgsql stable security definer set search_path = '' as $$
declare v_i public.intentos;
begin
  select * into v_i from public.intentos where id = p_intento;
  if not found or not public.puede_corregir(p_intento) then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  if v_i.estado <> 'pendiente_correccion' then raise exception 'no está pendiente' using errcode = 'P0001'; end if;
  if p_tomado and not (v_i.corrector_id = auth.uid() and public.tomado_vigente(v_i.corrector_id, v_i.tomado_at)) then
    raise exception 'tomalo primero' using errcode = 'P0001';
  end if;
end $$;

create or replace function public.tomar_correccion(p_intento uuid) returns void
language plpgsql security definer set search_path = '' as $$
declare v_i public.intentos;
begin
  perform public.exigir_corrector(p_intento, false);
  select * into v_i from public.intentos where id = p_intento for update;
  if public.tomado_vigente(v_i.corrector_id, v_i.tomado_at) and v_i.corrector_id <> auth.uid() then
    raise exception 'ya lo tomó otra persona' using errcode = 'P0001';
  end if;
  update public.intentos set corrector_id = auth.uid(), tomado_at = now() where id = p_intento;
end $$;

create or replace function public.soltar_correccion(p_intento uuid) returns void
language plpgsql security definer set search_path = '' as $$
begin
  perform public.exigir_corrector(p_intento, true);
  update public.intentos set corrector_id = null, tomado_at = null where id = p_intento;
end $$;

create or replace function public.respuestas_a_corregir(p_intento uuid)
returns table (respuesta_id uuid, pregunta_id uuid, enunciado_md text, rubrica_md text, puntaje_max int, texto_libre text,
               puntaje numeric, devolucion_md text)
language plpgsql stable security definer set search_path = '' as $$
begin
  perform public.exigir_corrector(p_intento, true);
  return query
  select r.id, p.id, p.enunciado_md, p.rubrica_md, p.puntaje_max, r.texto_libre,
         case when r.corregida_at is not null then r.puntaje end, r.devolucion_md
  from public.respuestas r
  join public.preguntas p on p.id = r.pregunta_id
  join public.intento_preguntas ip on ip.intento_id = r.intento_id and ip.pregunta_id = r.pregunta_id
  where r.intento_id = p_intento and p.tipo = 'libre' and coalesce(btrim(r.texto_libre), '') <> ''
  order by ip.orden;
end $$;

create or replace function public.corregir_respuesta(p_respuesta uuid, p_puntaje numeric, p_devolucion text) returns void
language plpgsql security definer set search_path = '' as $$
declare v_intento uuid; v_max int;
begin
  select r.intento_id, p.puntaje_max into v_intento, v_max
  from public.respuestas r join public.preguntas p on p.id = r.pregunta_id
  where r.id = p_respuesta and p.tipo = 'libre';
  if v_intento is null then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  perform public.exigir_corrector(v_intento, true);
  if p_puntaje is null or p_puntaje < 0 or p_puntaje > v_max then
    raise exception 'puntaje inválido' using errcode = 'P0001';
  end if;
  update public.respuestas
  set puntaje = p_puntaje, es_correcta = p_puntaje = v_max, devolucion_md = nullif(btrim(coalesce(p_devolucion, '')), ''),
      corregida_por = auth.uid(), corregida_at = now()
  where id = p_respuesta;
end $$;

create or replace function public.cerrar_correccion(p_intento uuid) returns table (nota int, aprobado boolean)
language plpgsql security definer set search_path = '' as $$
begin
  perform public.exigir_corrector(p_intento, true);
  if exists (select 1 from public.respuestas r where r.intento_id = p_intento and r.corregida_at is null) then
    raise exception 'faltan respuestas' using errcode = 'P0001';
  end if;
  perform public.cerrar_intento(p_intento);
  return query select i.nota, i.aprobado from public.intentos i where i.id = p_intento;
end $$;

revoke all on function public.puede_corregir(uuid), public.tomado_vigente(uuid, timestamptz), public.cola_correccion(),
  public.exigir_corrector(uuid, boolean), public.tomar_correccion(uuid), public.soltar_correccion(uuid),
  public.respuestas_a_corregir(uuid), public.corregir_respuesta(uuid, numeric, text), public.cerrar_correccion(uuid)
  from public, anon, authenticated;
grant execute on function public.cola_correccion(), public.tomar_correccion(uuid), public.soltar_correccion(uuid),
  public.respuestas_a_corregir(uuid), public.corregir_respuesta(uuid, numeric, text), public.cerrar_correccion(uuid)
  to authenticated;
