-- PEA · Etapa 7 · Modo examen: cuántas veces el asesor salió de la pantalla del examen (otra pestaña o ventana)
alter table public.intentos add column salidas int not null default 0;

create or replace function public.registrar_salida(p_intento uuid) returns int
language plpgsql security definer set search_path = '' as $$
declare v_n int;
begin
  update public.intentos set salidas = salidas + 1
  where id = p_intento and usuario_id = auth.uid() and estado = 'en_curso' and public.mi_perfil_activo()
  returning salidas into v_n;
  if v_n is null then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  return v_n;
end $$;
revoke all on function public.registrar_salida(uuid) from public, anon;
grant execute on function public.registrar_salida(uuid) to authenticated;
