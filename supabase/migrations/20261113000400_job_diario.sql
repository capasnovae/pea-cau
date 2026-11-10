-- PEA · Etapa 9 · Job diario (spec §4.6): consignas, recertificación, actualizaciones vencidas,
-- avisos de consignas vencidas y de correcciones atrasadas, y tomas de corrección abandonadas.

create or replace function public.job_diario(p_ahora timestamptz default now()) returns jsonb
language plpgsql security definer set search_path = '' as $$
declare r record; v_consignas jsonb; v_recert jsonb; v_act int := 0; v_corr int := 0; v_tomas int;
begin
  v_consignas := public.procesar_consignas((p_ahora at time zone 'America/Argentina/Buenos_Aires')::date);
  v_recert := public.procesar_recertificacion(p_ahora);

  -- Actualizaciones obligatorias fuera de plazo
  for r in
    update public.actualizacion_asignaciones s set estado = 'vencida'
    where s.estado = 'pendiente' and s.vence_at < p_ahora
    returning s.id, s.usuario_id, s.actualizacion_id
  loop
    v_act := v_act + 1;
    perform public.sincronizar_insignias_de(r.usuario_id);
    perform public.crear_alerta(r.usuario_id, 'actualizacion_vencida',
      'Venció una actualización: ' || (select titulo from public.actualizaciones where id = r.actualizacion_id),
      'Completala para recuperar la insignia del nivel.', '/actualizaciones/' || r.id, 'actualizacion_vencida:' || r.id);
  end loop;

  -- Consignas vencidas: aviso al asesor
  for r in
    select a.id, a.usuario_id, c.titulo from public.consigna_asignaciones a join public.consignas c on c.id = a.consigna_id
    where a.estado = 'vencida'
  loop
    perform public.crear_alerta(r.usuario_id, 'consigna_vencida', 'Venció una consigna', r.titulo, '/consignas', 'consigna_vencida:' || r.id);
  end loop;

  -- Correcciones con más de 72 h: aviso a los coordinadores del área y sede del asesor
  for r in
    select i.id as intento_id, co.id as coordinador_id, e.titulo
    from public.intentos i
    join public.perfiles p on p.id = i.usuario_id
    join public.examenes e on e.id = i.examen_id
    join public.perfiles co on co.rol = 'coordinador' and co.activo
      and co.sede_id = coalesce(i.sede_id, p.sede_id) and co.area = coalesce(i.area, p.area)
    where i.estado = 'pendiente_correccion' and i.entregado_at < p_ahora - interval '72 hours'
  loop
    if public.crear_alerta(r.coordinador_id, 'correccion_atrasada', 'Corrección atrasada',
         r.titulo || ': pasaron más de 72 h desde la entrega.', '/equipo/correcciones', 'correccion72:' || r.intento_id) then
      v_corr := v_corr + 1;
    end if;
  end loop;

  -- Tomas de corrección abandonadas (más de 24 h): vuelven a la cola
  update public.intentos set corrector_id = null, tomado_at = null
  where estado = 'pendiente_correccion' and tomado_at is not null and tomado_at < p_ahora - interval '24 hours';
  get diagnostics v_tomas = row_count;

  return jsonb_build_object('consignas', v_consignas, 'recertificacion', v_recert, 'actualizaciones_vencidas', v_act,
                            'correcciones_avisadas', v_corr, 'tomas_liberadas', v_tomas);
end $$;

revoke all on function public.job_diario(timestamptz) from public, anon, authenticated;
grant execute on function public.job_diario(timestamptz) to service_role;

-- Un solo job diario a las 03:10 UTC (00:10 en Argentina) reemplaza al de consignas
select cron.unschedule('procesar-consignas') where exists (select 1 from cron.job where jobname = 'procesar-consignas');
select cron.schedule('pea-diario', '10 3 * * *', 'select public.job_diario()');
