-- PEA · Etapa 6 · Intentos del lado del servidor (spec §4.4)
-- El asesor nunca recibe respuestas correctas, explicaciones ni rúbricas antes de que el intento esté cerrado.

-- Normalización de textos (formularios simulados): minúsculas, sin acentos, espacios colapsados.
create or replace function public.f_normalizar(texto text) returns text
language sql immutable set search_path = '' as $$
  select lower(regexp_replace(btrim(public.f_unaccent(coalesce(texto, ''))), '\s+', ' ', 'g'))
$$;

-- ¿Puede el usuario actual rendir este examen? (ubicación y práctica tienen su propio camino)
create or replace function public.puede_rendir(p_examen uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select public.mi_perfil_activo()
    and exists (
      select 1 from public.examenes e
      where e.id = p_examen and e.estado = 'publicado' and e.tipo not in ('ubicacion', 'practica')
        and public.puede_leer_contenido(e.alcance, e.sede_id, e.estado))
    and (not exists (select 1 from public.items i where i.examen_id = p_examen)
         or exists (select 1 from public.items i where i.examen_id = p_examen and public.item_disponible(i.id, auth.uid())))
$$;

-- Pozo de una fuente: preguntas publicadas de uso examen. La unidad de sorteo es la pregunta o su caso entero.
create or replace function public.pozo_fuente(p_modulo uuid, p_categoria uuid, p_curso uuid)
returns table (pregunta_id uuid, unidad uuid)
language sql stable security definer set search_path = '' as $$
  select p.id, coalesce(p.caso_id, p.id)
  from public.preguntas p
  where p.estado = 'publicado' and p.uso = 'examen'
    and ((p_modulo is not null and p.modulo_id = p_modulo)
      or (p_categoria is not null and p.categoria_id = p_categoria)
      or (p_curso is not null and p.modulo_id in (select m.id from public.modulos m where m.curso_id = p_curso)))
$$;

-- Preguntas de una unidad (una pregunta suelta o todas las de un caso, en orden).
create or replace function public.preguntas_de_unidad(p_unidad uuid)
returns table (pregunta_id uuid, orden_en_caso int)
language sql stable security definer set search_path = '' as $$
  select p.id, p.orden_en_caso from public.preguntas p
  where p.estado = 'publicado' and p.uso = 'examen' and (p.id = p_unidad or p.caso_id = p_unidad)
  order by p.orden_en_caso nulls first, p.id
$$;

-- Sortea y guarda las preguntas de un intento. p_curso_bloque: para la ubicación, el curso del bloque.
create or replace function public.sortear_intento(p_intento uuid, p_curso_bloque uuid default null) returns void
language plpgsql security definer set search_path = '' as $$
declare
  v_e public.examenes;
  v_elegidas uuid[] := '{}';
  v_total int := 0;
  v_tomadas int;
  v_n int;
  f record;
  u record;
begin
  select e.* into v_e from public.examenes e join public.intentos i on i.examen_id = e.id where i.id = p_intento;

  create temp table if not exists pea_fuentes (modulo_id uuid, categoria_id uuid, curso_id uuid, cantidad int) on commit drop;
  truncate pea_fuentes;
  if v_e.tipo = 'integrador' then
    insert into pea_fuentes select ef.modulo_id, ef.categoria_id, ef.curso_id, ef.cantidad from public.examen_fuentes ef where ef.examen_id = v_e.id;
  elsif v_e.tipo = 'ubicacion' then
    insert into pea_fuentes values (null, null, p_curso_bloque, null);
  else
    insert into pea_fuentes values (v_e.modulo_id, v_e.categoria_id, v_e.curso_id, null);
  end if;

  -- 1) Fuentes con cupo
  for f in select * from pea_fuentes where cantidad is not null loop
    v_tomadas := 0;
    for u in select distinct pf.unidad, random() as r from public.pozo_fuente(f.modulo_id, f.categoria_id, f.curso_id) pf
             where pf.unidad <> all (v_elegidas) order by r loop
      exit when v_tomadas >= f.cantidad;
      select count(*) into v_n from public.preguntas_de_unidad(u.unidad);
      v_elegidas := v_elegidas || u.unidad;
      v_tomadas := v_tomadas + v_n;
      v_total := v_total + v_n;
    end loop;
  end loop;

  -- 2) El resto, de las fuentes sin cupo, hasta la cantidad pedida
  for u in select distinct pf.unidad, random() as r
           from pea_fuentes fs, public.pozo_fuente(fs.modulo_id, fs.categoria_id, fs.curso_id) pf
           where fs.cantidad is null and pf.unidad <> all (v_elegidas) order by r loop
    exit when v_total >= v_e.cantidad_preguntas;
    select count(*) into v_n from public.preguntas_de_unidad(u.unidad);
    v_elegidas := v_elegidas || u.unidad;
    v_total := v_total + v_n;
  end loop;

  if v_total = 0 then
    raise exception 'sin preguntas' using errcode = 'P0001';
  end if;

  -- Orden: unidades mezcladas (o en el orden de alta), preguntas de un caso siempre en orden.
  -- Las opciones se mezclan si el examen lo pide; las de "ordenar" se mezclan siempre.
  insert into public.intento_preguntas (intento_id, pregunta_id, orden, orden_opciones)
  select p_intento, q.pregunta_id,
         row_number() over (order by q.orden_unidad, q.orden_en_caso nulls first, q.pregunta_id),
         coalesce((select array_agg(o.id order by case when v_e.mezclar or pr.tipo = 'ordenar' then random() else o.orden end)
                   from public.opciones o where o.pregunta_id = q.pregunta_id), '{}')
  from (
    select pu.pregunta_id, pu.orden_en_caso,
           case when v_e.mezclar then un.r else un.pos::float8 end as orden_unidad
    from (select x.unidad, x.pos, random() as r from unnest(v_elegidas) with ordinality as x(unidad, pos)) un
    cross join lateral public.preguntas_de_unidad(un.unidad) pu
  ) q
  join public.preguntas pr on pr.id = q.pregunta_id;
end $$;

-- ¿La respuesta es correcta? (preguntas de corrección automática)
create or replace function public.respuesta_correcta(p_pregunta uuid, p_opcion_ids uuid[], p_orden uuid[], p_valores jsonb)
returns boolean
language sql stable security definer set search_path = '' as $$
  select case p.tipo
    when 'ordenar' then coalesce(p_orden = (select array_agg(o.id order by o.posicion_correcta) from public.opciones o where o.pregunta_id = p.id), false)
    when 'clasificar' then p_valores is not null and not exists (
      select 1 from public.opciones o where o.pregunta_id = p.id and (p_valores ->> o.id::text) is distinct from o.grupo)
    when 'formulario' then p_valores is not null and p.solucion is not null and not exists (
      select 1 from jsonb_each(p.solucion) s(campo, aceptadas)
      where not exists (select 1 from jsonb_array_elements_text(s.aceptadas) a(valor)
                        where public.f_normalizar(a.valor) = public.f_normalizar(p_valores ->> s.campo)))
    when 'libre' then null
    else coalesce((select array_agg(distinct x order by x) from unnest(p_opcion_ids) x)
                  = (select array_agg(o.id order by o.id) from public.opciones o where o.pregunta_id = p.id and o.es_correcta), false)
  end
  from public.preguntas p where p.id = p_pregunta
$$;

-- Efectos al cerrar (certificación de nivel y ubicación): se completan en las tareas siguientes.
create or replace function public.aplicar_efectos(p_intento uuid) returns void
language plpgsql security definer set search_path = '' as $$
begin
  perform 1;
end $$;

-- Cierra un intento: nota, aprobación y efectos.
create or replace function public.cerrar_intento(p_intento uuid) returns void
language plpgsql security definer set search_path = '' as $$
declare v_nota int; v_minima int;
begin
  select round(100 * coalesce(sum(coalesce(r.puntaje, 0)), 0) / nullif(sum(p.puntaje_max), 0))::int
    into v_nota
  from public.intento_preguntas ip
  join public.preguntas p on p.id = ip.pregunta_id
  left join public.respuestas r on r.intento_id = ip.intento_id and r.pregunta_id = ip.pregunta_id
  where ip.intento_id = p_intento;
  select e.nota_minima into v_minima from public.examenes e join public.intentos i on i.examen_id = e.id where i.id = p_intento;
  update public.intentos
  set nota = coalesce(v_nota, 0), aprobado = coalesce(v_nota, 0) >= v_minima, estado = 'cerrado', cerrado_at = now(),
      puntaje_manual = (select sum(r.puntaje) from public.respuestas r join public.preguntas p on p.id = r.pregunta_id
                        where r.intento_id = p_intento and p.tipo = 'libre')
  where id = p_intento;
  perform public.aplicar_efectos(p_intento);
end $$;

-- Entrega sin chequear dueño (uso interno: entrega del dueño y vencidos).
create or replace function public.entregar_interno(p_intento uuid) returns void
language plpgsql security definer set search_path = '' as $$
begin
  if (select estado from public.intentos where id = p_intento) <> 'en_curso' then return; end if;
  -- Toda pregunta del intento tiene su fila de respuesta (las no respondidas valen 0).
  insert into public.respuestas (intento_id, pregunta_id)
  select ip.intento_id, ip.pregunta_id from public.intento_preguntas ip where ip.intento_id = p_intento
  on conflict (intento_id, pregunta_id) do nothing;
  -- Corrección automática; una libre vacía vale 0 sin pasar por la cola.
  update public.respuestas r
  set es_correcta = case when p.tipo = 'libre' then false else public.respuesta_correcta(p.id, r.opcion_ids, r.orden_respuesta, r.valores) end,
      puntaje = case when p.tipo = 'libre' then 0
                     when public.respuesta_correcta(p.id, r.opcion_ids, r.orden_respuesta, r.valores) then p.puntaje_max else 0 end,
      corregida_at = now()
  from public.preguntas p
  where r.intento_id = p_intento and p.id = r.pregunta_id
    and (p.tipo <> 'libre' or coalesce(btrim(r.texto_libre), '') = '');
  update public.intentos
  set entregado_at = now(),
      puntaje_auto = (select coalesce(sum(r.puntaje), 0) from public.respuestas r join public.preguntas p on p.id = r.pregunta_id
                      where r.intento_id = p_intento and p.tipo <> 'libre')
  where id = p_intento;
  if exists (select 1 from public.respuestas r where r.intento_id = p_intento and r.corregida_at is null) then
    update public.intentos set estado = 'pendiente_correccion', correccion_vence_at = now() + interval '72 hours' where id = p_intento;
  else
    perform public.cerrar_intento(p_intento);
  end if;
end $$;

-- Entrega los intentos propios cuyo tiempo (más la gracia) ya pasó.
create or replace function public.entregar_vencidos() returns void
language plpgsql security definer set search_path = '' as $$
declare v uuid;
begin
  for v in select i.id from public.intentos i
           where i.usuario_id = auth.uid() and i.estado = 'en_curso' and i.vence_at is not null
             and now() > i.vence_at + interval '2 minutes' loop
    perform public.entregar_interno(v);
  end loop;
end $$;

create or replace function public.iniciar_intento(p_examen uuid) returns uuid
language plpgsql security definer set search_path = '' as $$
declare
  v_id uuid; v_e public.examenes; v_ciclo int; v_usados int; v_ultima timestamptz; v_perfil public.perfiles;
begin
  perform public.entregar_vencidos();
  select id into v_id from public.intentos where usuario_id = auth.uid() and examen_id = p_examen and estado = 'en_curso';
  if found then return v_id; end if;
  if not public.puede_rendir(p_examen) then raise exception 'no disponible' using errcode = 'P0001'; end if;
  if exists (select 1 from public.intentos where usuario_id = auth.uid() and examen_id = p_examen and estado = 'cerrado' and aprobado) then
    raise exception 'ya aprobado' using errcode = 'P0001';
  end if;
  if exists (select 1 from public.intentos where usuario_id = auth.uid() and examen_id = p_examen and estado = 'pendiente_correccion') then
    raise exception 'pendiente de corrección' using errcode = 'P0001';
  end if;
  select * into v_e from public.examenes where id = p_examen;
  select max(ciclo) into v_ciclo from public.intentos where usuario_id = auth.uid() and examen_id = p_examen;
  if v_ciclo is null then
    v_ciclo := 1;
  else
    select count(*), max(entregado_at) into v_usados, v_ultima
    from public.intentos where usuario_id = auth.uid() and examen_id = p_examen and ciclo = v_ciclo;
    if v_usados >= v_e.max_intentos then
      if now() < v_ultima + make_interval(hours => v_e.espera_horas) then
        raise exception 'en espera' using errcode = 'P0001',
          detail = to_char(v_ultima + make_interval(hours => v_e.espera_horas), 'YYYY-MM-DD"T"HH24:MI:SSOF');
      end if;
      v_ciclo := v_ciclo + 1;
    end if;
  end if;
  select * into v_perfil from public.perfiles where id = auth.uid();
  begin
    insert into public.intentos (usuario_id, examen_id, sede_id, area, equipo_id, ciclo, vence_at)
    values (auth.uid(), p_examen, v_perfil.sede_id, v_perfil.area, v_perfil.equipo_id, v_ciclo,
            case when v_e.tiempo_limite_min is not null then now() + make_interval(mins => v_e.tiempo_limite_min) end)
    returning id into v_id;
  exception when unique_violation then
    -- Doble clic o dos pestañas: el otro request ya lo creó.
    select id into v_id from public.intentos where usuario_id = auth.uid() and examen_id = p_examen and estado = 'en_curso';
    return v_id;
  end;
  perform public.sortear_intento(v_id);
  return v_id;
end $$;

create or replace function public.preguntas_intento(p_intento uuid)
returns table (pregunta_id uuid, orden int, tipo public.tipo_pregunta, enunciado_md text, contexto_md text, caso_titulo text,
               caso_contexto_md text, puntaje_max int, config jsonb, opciones jsonb, respuesta jsonb)
language plpgsql stable security definer set search_path = '' as $$
begin
  if not exists (select 1 from public.intentos where id = p_intento and usuario_id = auth.uid()) or not public.mi_perfil_activo() then
    raise exception 'sin permiso' using errcode = 'P0001';
  end if;
  return query
  select p.id, ip.orden, p.tipo, p.enunciado_md, p.contexto_md, c.titulo, c.contexto_md, p.puntaje_max, p.config,
         coalesce((select jsonb_agg(jsonb_build_object('id', o.id, 'texto', o.texto) order by array_position(ip.orden_opciones, o.id))
                   from public.opciones o where o.pregunta_id = p.id), '[]'::jsonb),
         case when r.id is null then null else jsonb_build_object('opcion_ids', r.opcion_ids, 'orden', r.orden_respuesta,
                                                                   'texto', r.texto_libre, 'valores', r.valores) end
  from public.intento_preguntas ip
  join public.preguntas p on p.id = ip.pregunta_id
  left join public.casos c on c.id = p.caso_id
  left join public.respuestas r on r.intento_id = ip.intento_id and r.pregunta_id = ip.pregunta_id
  where ip.intento_id = p_intento
  order by ip.orden;
end $$;

create or replace function public.guardar_respuesta(p_intento uuid, p_pregunta uuid, p_opcion_ids uuid[], p_orden uuid[], p_texto text,
                                                    p_valores jsonb default null) returns void
language plpgsql security definer set search_path = '' as $$
declare v_i public.intentos;
begin
  select * into v_i from public.intentos where id = p_intento;
  if not found or v_i.usuario_id <> auth.uid() or not public.mi_perfil_activo() then
    raise exception 'sin permiso' using errcode = 'P0001';
  end if;
  if v_i.estado <> 'en_curso' then raise exception 'intento cerrado' using errcode = 'P0001'; end if;
  if v_i.vence_at is not null and now() > v_i.vence_at + interval '2 minutes' then
    raise exception 'tiempo agotado' using errcode = 'P0001';
  end if;
  if not exists (select 1 from public.intento_preguntas where intento_id = p_intento and pregunta_id = p_pregunta) then
    raise exception 'pregunta ajena' using errcode = 'P0001';
  end if;
  if exists (select x from unnest(coalesce(p_opcion_ids, '{}') || coalesce(p_orden, '{}')) x
             except select o.id from public.opciones o where o.pregunta_id = p_pregunta)
     or (p_valores is not null and (select tipo from public.preguntas where id = p_pregunta) = 'clasificar'
         and exists (select k::uuid from jsonb_object_keys(p_valores) k
                     except select o.id from public.opciones o where o.pregunta_id = p_pregunta)) then
    raise exception 'opción inválida' using errcode = 'P0001';
  end if;
  insert into public.respuestas (intento_id, pregunta_id, opcion_ids, orden_respuesta, texto_libre, valores)
  values (p_intento, p_pregunta, p_opcion_ids, p_orden, p_texto, p_valores)
  on conflict (intento_id, pregunta_id) do update
    set opcion_ids = excluded.opcion_ids, orden_respuesta = excluded.orden_respuesta, texto_libre = excluded.texto_libre,
        valores = excluded.valores, updated_at = now();
end $$;

create or replace function public.entregar_intento(p_intento uuid)
returns table (estado public.estado_intento, nota int, aprobado boolean)
language plpgsql security definer set search_path = '' as $$
begin
  if not exists (select 1 from public.intentos i where i.id = p_intento and i.usuario_id = auth.uid()) or not public.mi_perfil_activo() then
    raise exception 'sin permiso' using errcode = 'P0001';
  end if;
  perform public.entregar_interno(p_intento);
  return query select i.estado, i.nota, i.aprobado from public.intentos i where i.id = p_intento;
end $$;

create or replace function public.revision_intento(p_intento uuid)
returns table (pregunta_id uuid, orden int, tipo public.tipo_pregunta, enunciado_md text, contexto_md text, caso_titulo text,
               caso_contexto_md text, config jsonb, solucion jsonb, opciones jsonb, respuesta jsonb, es_correcta boolean,
               puntaje numeric, puntaje_max int, explicacion_md text, devolucion_md text, articulo_fuente_id uuid)
language plpgsql stable security definer set search_path = '' as $$
begin
  if not public.puede_ver_intento(p_intento) then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  if (select i.estado from public.intentos i where i.id = p_intento) <> 'cerrado' then
    raise exception 'revisión no disponible' using errcode = 'P0001';
  end if;
  return query
  select p.id, ip.orden, p.tipo, p.enunciado_md, p.contexto_md, c.titulo, c.contexto_md, p.config, p.solucion,
         coalesce((select jsonb_agg(jsonb_build_object('id', o.id, 'texto', o.texto, 'es_correcta', o.es_correcta,
                                                       'posicion_correcta', o.posicion_correcta, 'grupo', o.grupo)
                                    order by array_position(ip.orden_opciones, o.id))
                   from public.opciones o where o.pregunta_id = p.id), '[]'::jsonb),
         jsonb_build_object('opcion_ids', r.opcion_ids, 'orden', r.orden_respuesta, 'texto', r.texto_libre, 'valores', r.valores),
         r.es_correcta, r.puntaje, p.puntaje_max, p.explicacion_md, r.devolucion_md, p.articulo_fuente_id
  from public.intento_preguntas ip
  join public.preguntas p on p.id = ip.pregunta_id
  left join public.casos c on c.id = p.caso_id
  left join public.respuestas r on r.intento_id = ip.intento_id and r.pregunta_id = ip.pregunta_id
  where ip.intento_id = p_intento
  order by ip.orden;
end $$;

create or replace function public.mis_examenes()
returns table (examen_id uuid, titulo text, tipo public.tipo_examen, curso_titulo text, cantidad_preguntas int, nota_minima int,
               tiempo_limite_min int, intentos_restantes int, espera_hasta timestamptz, aprobado boolean, mejor_nota int,
               intento_en_curso uuid, intento_pendiente uuid)
language sql stable security definer set search_path = '' as $$
  with ex as (
    select e.* from public.examenes e where public.puede_rendir(e.id)
  ), ciclo as (
    select i.examen_id, max(i.ciclo) as ciclo from public.intentos i where i.usuario_id = auth.uid() group by i.examen_id
  ), uso as (
    select i.examen_id, count(*) as usados, max(i.entregado_at) as ultima
    from public.intentos i join ciclo c on c.examen_id = i.examen_id and c.ciclo = i.ciclo
    where i.usuario_id = auth.uid() group by i.examen_id
  )
  select e.id, e.titulo, e.tipo,
         coalesce((select cu.titulo from public.cursos cu where cu.id = e.curso_id),
                  (select cu.titulo from public.items it join public.modulos m on m.id = it.modulo_id join public.cursos cu on cu.id = m.curso_id
                   where it.examen_id = e.id limit 1),
                  (select cu.titulo from public.modulos m join public.cursos cu on cu.id = m.curso_id where m.id = e.modulo_id)),
         e.cantidad_preguntas, e.nota_minima, e.tiempo_limite_min,
         case when u.usados is null then e.max_intentos
              when u.usados >= e.max_intentos and now() >= u.ultima + make_interval(hours => e.espera_horas) then e.max_intentos
              else greatest(e.max_intentos - u.usados::int, 0) end,
         case when u.usados >= e.max_intentos and now() < u.ultima + make_interval(hours => e.espera_horas)
              then u.ultima + make_interval(hours => e.espera_horas) end,
         exists (select 1 from public.intentos i where i.usuario_id = auth.uid() and i.examen_id = e.id and i.estado = 'cerrado' and i.aprobado),
         (select max(i.nota) from public.intentos i where i.usuario_id = auth.uid() and i.examen_id = e.id and i.estado = 'cerrado'),
         (select i.id from public.intentos i where i.usuario_id = auth.uid() and i.examen_id = e.id and i.estado = 'en_curso'),
         (select i.id from public.intentos i where i.usuario_id = auth.uid() and i.examen_id = e.id and i.estado = 'pendiente_correccion' limit 1)
  from ex e left join uso u on u.examen_id = e.id
  order by e.titulo
$$;

-- El requisito "aprobar" se cumple con un intento aprobado del examen del paso
create or replace function public.item_cumplido(p_item uuid, p_usuario uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select case i.requisito
    when 'ninguno' then true
    when 'ver' then exists (select 1 from public.item_progreso p where p.item_id = i.id and p.usuario_id = p_usuario and p.visto_at is not null)
    when 'marcar_hecho' then exists (select 1 from public.item_progreso p where p.item_id = i.id and p.usuario_id = p_usuario and p.hecho_at is not null)
    else i.examen_id is not null and exists (
      select 1 from public.intentos t where t.examen_id = i.examen_id and t.usuario_id = p_usuario and t.estado = 'cerrado' and t.aprobado)
  end
  from public.items i where i.id = p_item
$$;

-- Permisos: lo interno no se ejecuta desde la API
revoke all on function public.f_normalizar(text), public.puede_rendir(uuid), public.pozo_fuente(uuid, uuid, uuid),
  public.preguntas_de_unidad(uuid), public.sortear_intento(uuid, uuid), public.respuesta_correcta(uuid, uuid[], uuid[], jsonb),
  public.aplicar_efectos(uuid), public.cerrar_intento(uuid), public.entregar_interno(uuid), public.entregar_vencidos(),
  public.iniciar_intento(uuid), public.preguntas_intento(uuid), public.guardar_respuesta(uuid, uuid, uuid[], uuid[], text, jsonb),
  public.entregar_intento(uuid), public.revision_intento(uuid), public.mis_examenes() from public, anon, authenticated;
grant execute on function public.f_normalizar(text), public.puede_rendir(uuid), public.entregar_vencidos(), public.iniciar_intento(uuid),
  public.preguntas_intento(uuid), public.guardar_respuesta(uuid, uuid, uuid[], uuid[], text, jsonb), public.entregar_intento(uuid),
  public.revision_intento(uuid), public.mis_examenes() to authenticated;
revoke all on function public.item_cumplido(uuid, uuid) from public, anon, authenticated;
