-- PEA · Etapa 3 · Recurrencia y vencimiento de consignas

create extension if not exists pg_cron;

create or replace function public.procesar_consignas(p_hoy date default current_date) returns jsonb
language plpgsql security definer set search_path = '' as $$
declare
  v_c record;
  v_generadas int := 0;
  v_vencidas int;
begin
  for v_c in select id, recurrencia from public.consignas where activa and recurrencia <> 'ninguna' loop
    v_generadas := v_generadas + public.generar_asignaciones(v_c.id, public.periodo_actual(v_c.recurrencia, p_hoy));
  end loop;

  update public.consigna_asignaciones
  set estado = 'vencida'
  where estado in ('pendiente', 'en_curso') and vence_el is not null and vence_el < p_hoy;
  get diagnostics v_vencidas = row_count;

  return jsonb_build_object('generadas', v_generadas, 'vencidas', v_vencidas);
end $$;

revoke all on function public.procesar_consignas(date) from public, anon, authenticated;
grant execute on function public.procesar_consignas(date) to service_role;

-- Todos los días a las 03:05 UTC (00:05 en Argentina)
select cron.schedule('procesar-consignas', '5 3 * * *', 'select public.procesar_consignas()');
