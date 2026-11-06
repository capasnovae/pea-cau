-- PEA · Etapa 6 · Certificación de nivel y desbloqueo

-- Estas tablas se escriben solo desde funciones security definer
revoke insert, update, delete on public.intentos, public.intento_preguntas, public.respuestas,
  public.certificaciones, public.practica_progreso from authenticated;

-- Efectos al cerrar: aprobar el examen final de un nivel lo certifica (una certificación vigente por curso).
create or replace function public.aplicar_efectos(p_intento uuid) returns void
language plpgsql security definer set search_path = '' as $$
declare v_i public.intentos; v_e public.examenes; v_meses int;
begin
  select * into v_i from public.intentos where id = p_intento;
  select * into v_e from public.examenes where id = v_i.examen_id;
  if v_i.aprobado and v_e.tipo = 'nivel' and v_e.curso_id is not null
     and not exists (select 1 from public.certificaciones c
                     where c.usuario_id = v_i.usuario_id and c.curso_id = v_e.curso_id and c.estado = 'vigente') then
    select vigencia_meses into v_meses from public.cursos where id = v_e.curso_id;
    insert into public.certificaciones (usuario_id, curso_id, origen, intento_id, emitida_at, vence_at)
    values (v_i.usuario_id, v_e.curso_id, 'examen', p_intento, now(),
            case when v_meses is not null then now() + make_interval(months => v_meses) end);
  end if;
end $$;
revoke all on function public.aplicar_efectos(uuid) from public, anon, authenticated;

-- Un curso está cumplido por sus pasos o por una certificación vigente.
create or replace function public.curso_cumplido(p_curso uuid, p_usuario uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (select 1 from public.certificaciones c
                 where c.curso_id = p_curso and c.usuario_id = p_usuario and c.estado = 'vigente')
    or (exists (
          select 1 from public.items i join public.modulos m on m.id = i.modulo_id
          where m.curso_id = p_curso and i.requisito <> 'ninguno')
        and not exists (
          select 1 from public.items i join public.modulos m on m.id = i.modulo_id
          where m.curso_id = p_curso and i.requisito <> 'ninguno' and not public.item_cumplido(i.id, p_usuario)))
$$;

-- El nivel siguiente se desbloquea con el anterior cumplido (pasos o certificación); un nivel anterior sin pasos no traba.
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
  return v_anterior is null
    or exists (select 1 from public.certificaciones c where c.curso_id = v_anterior and c.usuario_id = p_usuario and c.estado = 'vigente')
    or not exists (
      select 1 from public.items i join public.modulos m on m.id = i.modulo_id
      where m.curso_id = v_anterior and i.requisito <> 'ninguno' and not public.item_cumplido(i.id, p_usuario));
end $$;
revoke all on function public.curso_cumplido(uuid, uuid), public.curso_desbloqueado(uuid, uuid) from public, anon, authenticated;
