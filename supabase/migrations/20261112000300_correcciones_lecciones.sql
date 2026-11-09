-- PEA · Etapa 8 · Correcciones de la revisión final: el Probalo se arma con la sede de cada asesor,
-- lo cumplido queda aunque se agreguen preguntas, y una lección con Probalo no se marca hecha a mano.

create or replace function public.pozo_probalo_de(p_item uuid, p_usuario uuid) returns setof uuid
language sql stable security definer set search_path = '' as $$
  select p.id from public.preguntas p
  where p.item_id = p_item and p.uso = 'practica' and p.estado = 'publicado'
    and (p.alcance = 'global' or p.sede_id = (select pe.sede_id from public.perfiles pe where pe.id = p_usuario))
$$;

create or replace function public.pozo_probalo(p_item uuid) returns setof uuid
language sql stable security definer set search_path = '' as $$
  select * from public.pozo_probalo_de(p_item, auth.uid())
$$;

create or replace function public.proteger_progreso() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_req public.requisito_item;
begin
  if auth.uid() is null then return new; end if;
  select requisito into v_req from public.items where id = new.item_id;
  if tg_op = 'UPDATE' then
    if new.usuario_id is distinct from old.usuario_id or new.item_id is distinct from old.item_id then
      raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
    end if;
    new.visto_at := case when new.visto_at is not null then coalesce(old.visto_at, now()) else old.visto_at end;
    new.hecho_at := case when new.hecho_at is not null then coalesce(old.hecho_at, now()) else old.hecho_at end;
    if old.hecho_at is null and new.hecho_at is not null and v_req <> 'marcar_hecho' then
      raise exception 'integridad: este ítem no se marca a mano' using errcode = 'P0001';
    end if;
  else
    if new.visto_at is not null then new.visto_at := now(); end if;
    if new.hecho_at is not null then
      if v_req <> 'marcar_hecho' then
        raise exception 'integridad: este ítem no se marca a mano' using errcode = 'P0001';
      end if;
      new.hecho_at := now();
    end if;
  end if;
  -- Una lección con Probalo visible solo queda hecha acertando todas sus preguntas (lo escribe comprobar_probalo)
  if new.hecho_at is not null and (tg_op = 'INSERT' or old.hecho_at is null)
     and exists (select 1 from public.items i where i.id = new.item_id and i.tipo = 'leccion')
     and exists (select 1 from public.pozo_probalo_de(new.item_id, new.usuario_id))
     and exists (select 1 from public.pozo_probalo_de(new.item_id, new.usuario_id) q(id)
                 where not exists (select 1 from public.practica_progreso pp where pp.usuario_id = new.usuario_id and pp.pregunta_id = q.id)) then
    raise exception 'integridad: completá el Probalo' using errcode = 'P0001';
  end if;
  return new;
end $$;

create or replace function public.item_cumplido(p_item uuid, p_usuario uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select case
    when i.tipo = 'practica' then
      exists (select 1 from public.item_progreso pr where pr.item_id = i.id and pr.usuario_id = p_usuario and pr.hecho_at is not null)
      or (i.examen_id is not null
          and exists (select 1 from public.pozo_practica(i.examen_id))
          and not exists (select 1 from public.pozo_practica(i.examen_id) q(id)
                          where not exists (select 1 from public.practica_progreso pp where pp.usuario_id = p_usuario and pp.pregunta_id = q.id)))
    when i.tipo = 'leccion' and i.requisito = 'marcar_hecho' and exists (select 1 from public.pozo_probalo_de(i.id, p_usuario)) then
      exists (select 1 from public.item_progreso pr where pr.item_id = i.id and pr.usuario_id = p_usuario and pr.hecho_at is not null)
      or not exists (select 1 from public.pozo_probalo_de(i.id, p_usuario) q(id)
                     where not exists (select 1 from public.practica_progreso pp where pp.usuario_id = p_usuario and pp.pregunta_id = q.id))
    when i.requisito = 'ninguno' then true
    when i.requisito = 'ver' then exists (select 1 from public.item_progreso p where p.item_id = i.id and p.usuario_id = p_usuario and p.visto_at is not null)
    when i.requisito = 'marcar_hecho' then exists (select 1 from public.item_progreso p where p.item_id = i.id and p.usuario_id = p_usuario and p.hecho_at is not null)
    else i.examen_id is not null and exists (
      select 1 from public.intentos t where t.examen_id = i.examen_id and t.usuario_id = p_usuario and t.estado = 'cerrado' and t.aprobado)
  end
  from public.items i where i.id = p_item
$$;

revoke all on function public.pozo_probalo_de(uuid, uuid), public.pozo_probalo(uuid), public.item_cumplido(uuid, uuid), public.proteger_progreso()
  from public, anon, authenticated;
