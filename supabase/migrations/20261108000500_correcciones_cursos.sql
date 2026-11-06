-- PEA · Etapa 4 · Correcciones de la revisión final

-- I2: un nivel se desbloquea si el anterior no tiene pasos con requisito pendientes
-- (un nivel anterior vacío o con todos los pasos opcionales ya no traba al siguiente).
create or replace function public.curso_desbloqueado(p_curso uuid, p_usuario uuid) returns boolean
language plpgsql stable security definer set search_path = '' as $$
declare v_c public.cursos; v_anterior uuid;
begin
  select * into v_c from public.cursos where id = p_curso;
  if not found then return false; end if;
  if v_c.tipo <> 'nivel' then return true; end if;
  select id into v_anterior from public.cursos
  where tipo = 'nivel' and estado = 'publicado' and nivel_orden < v_c.nivel_orden
  order by nivel_orden desc limit 1;
  return v_anterior is null or not exists (
    select 1 from public.items i join public.modulos m on m.id = i.modulo_id
    where m.curso_id = v_anterior and i.requisito <> 'ninguno' and not public.item_cumplido(i.id, p_usuario));
end $$;

-- I2: hasta la etapa de exámenes, ningún paso puede exigir "aprobar" (nunca se cumpliría).
-- Se quita en la etapa de exámenes.
alter table public.items add constraint items_sin_aprobar_hasta_examenes check (requisito <> 'aprobar');

-- I3: prerrequisitos sin ciclos
create or replace function public.validar_prerrequisito() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if (select curso_id from public.modulos where id = new.modulo_id)
     is distinct from (select curso_id from public.modulos where id = new.requiere_modulo_id) then
    raise exception 'integridad: el prerrequisito es de otro curso' using errcode = 'P0001';
  end if;
  -- ¿El módulo requerido ya depende (directa o indirectamente) del módulo nuevo?
  if exists (
    with recursive cadena(id) as (
      select p.requiere_modulo_id from public.modulo_prerrequisitos p where p.modulo_id = new.requiere_modulo_id
      union
      select p.requiere_modulo_id from public.modulo_prerrequisitos p join cadena c on p.modulo_id = c.id
    )
    select 1 from cadena where id = new.modulo_id
  ) then
    raise exception 'integridad: los prerrequisitos forman un ciclo' using errcode = 'P0001';
  end if;
  return new;
end $$;

-- Reemplaza los prerrequisitos de un módulo en una sola transacción
create or replace function public.guardar_prerrequisitos(p_modulo uuid, p_requiere uuid[]) returns void
language plpgsql security definer set search_path = '' as $$
begin
  if not public.puede_editar_curso(public.curso_de_modulo(p_modulo)) then
    raise exception 'no_autorizado' using errcode = '42501';
  end if;
  delete from public.modulo_prerrequisitos where modulo_id = p_modulo;
  insert into public.modulo_prerrequisitos (modulo_id, requiere_modulo_id)
  select p_modulo, r from unnest(coalesce(p_requiere, '{}')) as r where r <> p_modulo group by r;
end $$;
revoke all on function public.guardar_prerrequisitos(uuid, uuid[]) from public, anon;
grant execute on function public.guardar_prerrequisitos(uuid, uuid[]) to authenticated;

-- M1: un módulo no se muda de curso
create or replace function public.proteger_curso_de_modulo() returns trigger
language plpgsql set search_path = '' as $$
begin
  if new.curso_id is distinct from old.curso_id then
    raise exception 'integridad: un módulo no cambia de curso' using errcode = 'P0001';
  end if;
  return new;
end $$;
create trigger proteger_curso_de_modulo before update on public.modulos
  for each row execute function public.proteger_curso_de_modulo();

-- I4: el contenido de un paso tiene que ser visible para todo el público del curso
-- (global, o de la misma sede si el curso es de sede).
create or replace function public.contenido_compatible(p_curso uuid, p_alcance public.alcance, p_sede uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select p_alcance = 'global'
    or exists (select 1 from public.cursos c where c.id = p_curso and c.alcance = 'sede' and c.sede_id = p_sede)
$$;
revoke all on function public.contenido_compatible(uuid, public.alcance, uuid) from public, anon, authenticated;

create or replace function public.validar_contenido_item() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_curso uuid := public.curso_de_modulo(new.modulo_id);
begin
  if new.articulo_id is not null and not exists (
       select 1 from public.articulos a where a.id = new.articulo_id and public.contenido_compatible(v_curso, a.alcance, a.sede_id))
     or new.recurso_id is not null and not exists (
       select 1 from public.recursos r where r.id = new.recurso_id and public.contenido_compatible(v_curso, r.alcance, r.sede_id)) then
    raise exception 'integridad: el contenido del paso no es visible para todo el público del curso' using errcode = 'P0001';
  end if;
  return new;
end $$;
create trigger validar_contenido_item before insert or update on public.items
  for each row execute function public.validar_contenido_item();

create or replace function public.promover_contenido(p_tabla text, p_id uuid) returns void
language plpgsql security definer set search_path = '' as $$
declare v_filas int;
begin
  if public.mi_rol() is distinct from 'admin' then
    raise exception 'no_autorizado: solo el admin promueve' using errcode = 'P0001';
  end if;
  if p_tabla not in ('articulos', 'recursos', 'campanas', 'cursos') then
    raise exception 'tabla inválida' using errcode = '22023';
  end if;
  if p_tabla = 'cursos' and exists (
    select 1 from public.items i join public.modulos m on m.id = i.modulo_id
    left join public.articulos a on a.id = i.articulo_id
    left join public.recursos r on r.id = i.recurso_id
    where m.curso_id = p_id and (a.alcance = 'sede' or r.alcance = 'sede')
  ) then
    raise exception 'integridad: el curso usa contenido de sede; promové ese contenido primero' using errcode = 'P0001';
  end if;
  perform set_config('pea.promoviendo', 'si', true);
  execute format(
    'update public.%I set alcance = ''global'', sede_id = null, promovido_por = $1, promovido_at = now()
     where id = $2 and alcance = ''sede''', p_tabla)
  using auth.uid(), p_id;
  get diagnostics v_filas = row_count;
  perform set_config('pea.promoviendo', '', true);
  if v_filas = 0 then
    raise exception 'no se encontró contenido de sede para promover' using errcode = 'P0002';
  end if;
  insert into public.auditoria (actor_id, accion, entidad, entidad_id)
  values (auth.uid(), 'promover', p_tabla, p_id);
end $$;
