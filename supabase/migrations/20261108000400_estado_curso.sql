-- PEA · Etapa 4 · Estado propio de un curso y cierre de las funciones con p_usuario
-- Las funciones que reciben p_usuario no se exponen: un asesor podría consultar el progreso de otro.
-- Las políticas usan versiones que solo responden por auth.uid().

create or replace function public.item_disponible_para_mi(p_item uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select public.item_disponible(p_item, auth.uid())
$$;

drop policy progreso_crear on public.item_progreso;
drop policy progreso_editar on public.item_progreso;
create policy progreso_crear on public.item_progreso for insert to authenticated
  with check (usuario_id = auth.uid() and public.item_disponible_para_mi(item_id));
create policy progreso_editar on public.item_progreso for update to authenticated
  using (usuario_id = auth.uid()) with check (usuario_id = auth.uid() and public.item_disponible_para_mi(item_id));

-- marcar_item pasa a security definer, siempre sobre auth.uid()
create or replace function public.marcar_item(p_item uuid, p_accion text) returns jsonb
language plpgsql security definer set search_path = '' as $$
declare v_req public.requisito_item;
begin
  if auth.uid() is null then
    raise exception 'no_autorizado' using errcode = '42501';
  end if;
  if p_accion not in ('visto', 'hecho') then
    raise exception 'acción inválida' using errcode = '22023';
  end if;
  if not public.item_disponible(p_item, auth.uid()) then
    raise exception 'bloqueado: completá lo anterior' using errcode = 'P0001';
  end if;
  select requisito into v_req from public.items where id = p_item;
  if p_accion = 'hecho' and v_req <> 'marcar_hecho' then
    raise exception 'integridad: este ítem no se marca a mano' using errcode = 'P0001';
  end if;
  insert into public.item_progreso (usuario_id, item_id, visto_at, hecho_at)
  values (auth.uid(), p_item, now(), case when p_accion = 'hecho' then now() end)
  on conflict (usuario_id, item_id) do update
    set visto_at = coalesce(public.item_progreso.visto_at, now()),
        hecho_at = case when p_accion = 'hecho' then coalesce(public.item_progreso.hecho_at, now()) else public.item_progreso.hecho_at end;
  return jsonb_build_object('ok', true, 'cumplido', public.item_cumplido(p_item, auth.uid()));
end $$;

create or replace function public.estado_curso(p_curso uuid)
returns table (
  modulo_id uuid, modulo_titulo text, modulo_orden int, modulo_cumplido boolean,
  item_id uuid, titulo text, tipo public.tipo_item, requisito public.requisito_item, item_orden int,
  cumplido boolean, disponible boolean
)
language sql stable security definer set search_path = '' as $$
  select m.id, m.titulo, m.orden, public.modulo_cumplido(m.id, auth.uid()),
         i.id, i.titulo, i.tipo, i.requisito, i.orden,
         public.item_cumplido(i.id, auth.uid()), public.item_disponible(i.id, auth.uid())
  from public.modulos m
  join public.items i on i.modulo_id = m.id
  where m.curso_id = p_curso and public.puede_leer_curso(p_curso)
  order by m.orden, m.id, i.orden, i.id
$$;

revoke all on function public.item_cumplido(uuid, uuid), public.modulo_cumplido(uuid, uuid),
  public.curso_cumplido(uuid, uuid), public.curso_desbloqueado(uuid, uuid), public.item_disponible(uuid, uuid)
  from authenticated;
revoke all on function public.item_disponible_para_mi(uuid), public.estado_curso(uuid) from public, anon;
grant execute on function public.item_disponible_para_mi(uuid), public.estado_curso(uuid) to authenticated;
