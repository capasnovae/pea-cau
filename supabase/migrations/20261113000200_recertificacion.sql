-- PEA · Etapa 9 · Recertificación por tiempo (spec §4.6): avisos a 30 y 7 días, vencimiento, insignias y reexamen

-- La insignia de un nivel está activa si hay una certificación efectivamente vigente de ese curso
create or replace function public.sincronizar_insignias_de(p_usuario uuid, p_motivo text default null) returns void
language plpgsql security definer set search_path = '' as $$
declare r record;
begin
  for r in
    select i.id as insignia_id, i.curso_id,
           exists (select 1 from public.certificaciones c where c.usuario_id = p_usuario and c.curso_id = i.curso_id
                     and public.estado_efectivo(c.estado, c.vence_at) = 'vigente') as activa,
           (select c.estado::text from public.certificaciones c where c.usuario_id = p_usuario and c.curso_id = i.curso_id
             order by c.emitida_at desc, c.id desc limit 1) as ultimo_estado
    from public.insignias i
    where exists (select 1 from public.certificaciones c where c.usuario_id = p_usuario and c.curso_id = i.curso_id)
       or exists (select 1 from public.usuario_insignias ui where ui.usuario_id = p_usuario and ui.insignia_id = i.id)
  loop
    if r.activa then
      insert into public.usuario_insignias (usuario_id, insignia_id, otorgada_at)
      values (p_usuario, r.insignia_id, now())
      on conflict (usuario_id, insignia_id) do update
        set perdida_at = null, motivo_perdida = null,
            otorgada_at = case when public.usuario_insignias.perdida_at is not null then now() else public.usuario_insignias.otorgada_at end;
    else
      update public.usuario_insignias
      set perdida_at = now(), motivo_perdida = coalesce(p_motivo, case when r.ultimo_estado = 'revocada' then 'revocada' else 'vencida' end)
      where usuario_id = p_usuario and insignia_id = r.insignia_id and perdida_at is null;
    end if;
  end loop;
end $$;

create or replace function public.sincronizar_insignia() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  perform public.sincronizar_insignias_de(new.usuario_id, case when new.estado <> 'vigente' then new.estado::text end);
  return new;
end $$;

-- Final publicado del nivel (para los avisos); si no hay, el perfil
create or replace function public.enlace_recertificar(p_curso uuid) returns text
language sql stable security definer set search_path = '' as $$
  select coalesce((select '/examenes/' || e.id from public.examenes e
                   where e.tipo = 'nivel' and e.curso_id = p_curso and e.estado = 'publicado'
                   order by e.id limit 1), '/perfil')
$$;

create or replace function public.procesar_recertificacion(p_ahora timestamptz default now()) returns jsonb
language plpgsql security definer set search_path = '' as $$
declare r record; v_vencidas int := 0; v_avisos int := 0;
begin
  for r in
    update public.certificaciones c set estado = 'vencida'
    where c.estado = 'vigente' and c.vence_at is not null and c.vence_at < p_ahora
    returning c.id, c.usuario_id, c.curso_id
  loop
    v_vencidas := v_vencidas + 1;
    perform public.crear_alerta(r.usuario_id, 'certificacion_vencida',
      'Venció tu certificación del Nivel ' || (select nivel_orden from public.cursos where id = r.curso_id),
      'Rendí el final del nivel para recertificar.', public.enlace_recertificar(r.curso_id), 'vencio:' || r.id);
  end loop;

  for r in
    select c.id, c.usuario_id, c.curso_id, c.vence_at, cu.nivel_orden,
           case when c.vence_at <= p_ahora + interval '7 days' then 'vence7:' else 'vence30:' end as prefijo
    from public.certificaciones c join public.cursos cu on cu.id = c.curso_id
    where c.estado = 'vigente' and c.vence_at is not null
      and c.vence_at >= p_ahora and c.vence_at <= p_ahora + interval '30 days'
  loop
    if public.crear_alerta(r.usuario_id, 'certificacion_por_vencer',
         'Tu Nivel ' || r.nivel_orden || ' vence pronto',
         'Vence el ' || to_char(r.vence_at at time zone 'America/Argentina/Buenos_Aires', 'DD/MM/YYYY') || '. Rendí el final para recertificar.',
         public.enlace_recertificar(r.curso_id), r.prefijo || r.id) then
      v_avisos := v_avisos + 1;
    end if;
  end loop;
  return jsonb_build_object('vencidas', v_vencidas, 'avisos', v_avisos);
end $$;

-- Reexamen: si la certificación anterior no está efectivamente vigente, se emite una nueva
create or replace function public.aplicar_efectos(p_intento uuid) returns void
language plpgsql security definer set search_path = '' as $$
declare v_i public.intentos; v_e public.examenes; v_meses int; v_curso uuid; v_bloques uuid[];
begin
  select * into v_i from public.intentos where id = p_intento;
  select * into v_e from public.examenes where id = v_i.examen_id;
  if v_e.tipo = 'nivel' and v_i.aprobado and v_e.curso_id is not null
     and not exists (select 1 from public.certificaciones c
                     where c.usuario_id = v_i.usuario_id and c.curso_id = v_e.curso_id and public.estado_efectivo(c.estado, c.vence_at) = 'vigente') then
    select vigencia_meses into v_meses from public.cursos where id = v_e.curso_id;
    update public.certificaciones set estado = 'vencida'
    where usuario_id = v_i.usuario_id and curso_id = v_e.curso_id and estado = 'vigente' and vence_at < now();
    insert into public.certificaciones (usuario_id, curso_id, origen, intento_id, emitida_at, vence_at)
    values (v_i.usuario_id, v_e.curso_id, 'examen', p_intento, now(),
            case when v_meses is not null then now() + make_interval(months => v_meses) end);
  elsif v_e.tipo = 'ubicacion' then
    v_bloques := public.bloques_ubicacion();
    v_curso := v_bloques[v_i.bloque_nivel];
    if v_i.aprobado and v_curso is not null
       and not exists (select 1 from public.certificaciones c
                       where c.usuario_id = v_i.usuario_id and c.curso_id = v_curso and public.estado_efectivo(c.estado, c.vence_at) = 'vigente') then
      select vigencia_meses into v_meses from public.cursos where id = v_curso;
      update public.certificaciones set estado = 'vencida'
      where usuario_id = v_i.usuario_id and curso_id = v_curso and estado = 'vigente' and vence_at < now();
      insert into public.certificaciones (usuario_id, curso_id, origen, intento_id, emitida_at, vence_at)
      values (v_i.usuario_id, v_curso, 'ubicacion', p_intento, now(),
              case when v_meses is not null then now() + make_interval(months => v_meses) end);
    end if;
    if not v_i.aprobado or v_i.bloque_nivel >= cardinality(v_bloques) then
      perform set_config('pea.ubicacion', 'si', true);
      update public.perfiles set ubicacion_rendida_at = now() where id = v_i.usuario_id;
      perform set_config('pea.ubicacion', '', true);
    end if;
  end if;
end $$;

revoke all on function public.sincronizar_insignias_de(uuid, text), public.sincronizar_insignia(), public.enlace_recertificar(uuid),
  public.procesar_recertificacion(timestamptz), public.aplicar_efectos(uuid) from public, anon, authenticated;
