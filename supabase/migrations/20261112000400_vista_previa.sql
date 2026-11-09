-- PEA · Etapa 8 · Vista previa de cursos en borrador para quien los edita

create or replace function public.item_disponible(p_item uuid, p_usuario uuid) returns boolean
language plpgsql stable security definer set search_path = '' as $$
declare v_i public.items; v_m public.modulos; v_c public.cursos;
begin
  select * into v_i from public.items where id = p_item;
  if not found then return false; end if;
  select * into v_m from public.modulos where id = v_i.modulo_id;
  select * into v_c from public.cursos where id = v_m.curso_id;
  -- Vista previa: quien edita un curso que no está publicado lo recorre entero, sin orden ni bloqueos
  if p_usuario = auth.uid() and v_c.estado <> 'publicado' and public.puede_editar_curso(v_c.id) then
    return true;
  end if;
  -- el usuario tiene que poder leer el curso (evaluado como ese usuario)
  if not exists (
    select 1 from public.perfiles p
    where p.id = p_usuario and p.activo
      and v_c.estado = 'publicado'
      and (v_c.alcance = 'global' or v_c.sede_id = p.sede_id)
  ) then
    return false;
  end if;
  if not public.curso_desbloqueado(v_c.id, p_usuario) then return false; end if;
  if exists (
    select 1 from public.modulo_prerrequisitos mp
    where mp.modulo_id = v_m.id and not public.modulo_cumplido(mp.requiere_modulo_id, p_usuario)
  ) then
    return false;
  end if;
  if v_m.avance_secuencial and exists (
    select 1 from public.items i
    where i.modulo_id = v_m.id and i.requisito <> 'ninguno'
      and (i.orden, i.id::text) < (v_i.orden, v_i.id::text)
      and not public.item_cumplido(i.id, p_usuario)
  ) then
    return false;
  end if;
  return true;
end $$;
