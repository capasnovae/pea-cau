-- PEA · Etapa 6 · Correcciones de la revisión final

-- I1: un final de nivel exige tener ese nivel desbloqueado (aunque no esté como paso de un curso)
create or replace function public.puede_rendir(p_examen uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select public.mi_perfil_activo()
    and exists (
      select 1 from public.examenes e
      where e.id = p_examen and e.estado = 'publicado' and e.tipo not in ('ubicacion', 'practica')
        and public.puede_leer_contenido(e.alcance, e.sede_id, e.estado)
        and (e.tipo <> 'nivel' or public.curso_desbloqueado(e.curso_id, auth.uid())))
    and (not exists (select 1 from public.items i where i.examen_id = p_examen)
         or exists (select 1 from public.items i where i.examen_id = p_examen and public.item_disponible(i.id, auth.uid())))
$$;

-- I2: una pregunta de sede solo entra en intentos y prácticas de esa sede
drop function public.pozo_fuente(uuid, uuid, uuid);
drop function public.preguntas_de_unidad(uuid);

create or replace function public.pozo_fuente(p_modulo uuid, p_categoria uuid, p_curso uuid, p_sede uuid)
returns table (pregunta_id uuid, unidad uuid)
language sql stable security definer set search_path = '' as $$
  select p.id, coalesce(p.caso_id, p.id)
  from public.preguntas p
  where p.estado = 'publicado' and p.uso = 'examen'
    and (p.alcance = 'global' or p.sede_id = p_sede)
    and ((p_modulo is not null and p.modulo_id = p_modulo)
      or (p_categoria is not null and p.categoria_id = p_categoria)
      or (p_curso is not null and p.modulo_id in (select m.id from public.modulos m where m.curso_id = p_curso)))
$$;

create or replace function public.preguntas_de_unidad(p_unidad uuid, p_sede uuid)
returns table (pregunta_id uuid, orden_en_caso int)
language sql stable security definer set search_path = '' as $$
  select p.id, p.orden_en_caso from public.preguntas p
  where p.estado = 'publicado' and p.uso = 'examen' and (p.alcance = 'global' or p.sede_id = p_sede)
    and (p.id = p_unidad or p.caso_id = p_unidad)
  order by p.orden_en_caso nulls first, p.id
$$;

create or replace function public.sortear_intento(p_intento uuid, p_curso_bloque uuid default null) returns void
language plpgsql security definer set search_path = '' as $$
declare
  v_e public.examenes;
  v_sede uuid := (select sede_id from public.intentos where id = p_intento);
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
    for u in select x.unidad from (select distinct pf.unidad from public.pozo_fuente(f.modulo_id, f.categoria_id, f.curso_id, v_sede) pf
                                   where pf.unidad <> all (v_elegidas)) x order by random() loop
      exit when v_tomadas >= f.cantidad;
      select count(*) into v_n from public.preguntas_de_unidad(u.unidad, v_sede);
      v_elegidas := v_elegidas || u.unidad;
      v_tomadas := v_tomadas + v_n;
      v_total := v_total + v_n;
    end loop;
  end loop;

  -- 2) El resto, de las fuentes sin cupo, hasta la cantidad pedida
  for u in select x.unidad from (select distinct pf.unidad
                                 from pea_fuentes fs, public.pozo_fuente(fs.modulo_id, fs.categoria_id, fs.curso_id, v_sede) pf
                                 where fs.cantidad is null and pf.unidad <> all (v_elegidas)) x order by random() loop
    exit when v_total >= v_e.cantidad_preguntas;
    select count(*) into v_n from public.preguntas_de_unidad(u.unidad, v_sede);
    v_elegidas := v_elegidas || u.unidad;
    v_total := v_total + v_n;
  end loop;

  if v_total = 0 then
    raise exception 'sin preguntas' using errcode = 'P0001';
  end if;

  -- Orden: unidades mezcladas o en orden de alta; las preguntas de un caso, siempre en orden.
  -- Las opciones se mezclan si el examen lo pide; las de "ordenar" se mezclan siempre.
  insert into public.intento_preguntas (intento_id, pregunta_id, orden, orden_opciones)
  select p_intento, q.pregunta_id,
         row_number() over (order by q.orden_unidad, q.unidad, q.orden_en_caso nulls first, q.pregunta_id),
         coalesce((select array_agg(o.id order by case when v_e.mezclar or pr.tipo = 'ordenar' then random() else o.orden end)
                   from public.opciones o where o.pregunta_id = q.pregunta_id), '{}')
  from (
    select pu.pregunta_id, pu.orden_en_caso, un.unidad,
           -- Mezclado: al azar. Sin mezclar: siempre el mismo orden (fecha de alta y después id).
           case when v_e.mezclar then un.r
                else (select extract(epoch from min(p.created_at)) from public.preguntas p
                      where p.id = un.unidad or p.caso_id = un.unidad)::float8 end as orden_unidad
    from (select x.unidad, x.pos, random() as r from unnest(v_elegidas) with ordinality as x(unidad, pos)) un
    cross join lateral public.preguntas_de_unidad(un.unidad, v_sede) pu
  ) q
  join public.preguntas pr on pr.id = q.pregunta_id;
end $$;

create or replace function public.pozo_practica(p_examen uuid) returns setof uuid
language sql stable security definer set search_path = '' as $$
  select p.id from public.preguntas p join public.examenes e on e.id = p_examen
  where e.tipo = 'practica' and p.estado = 'publicado' and p.uso = 'practica'
    and (p.alcance = 'global' or p.sede_id = public.mi_sede())
    and (e.modulo_id is null or p.modulo_id = e.modulo_id)
    and (e.categoria_id is null or p.categoria_id = e.categoria_id)
$$;

-- I3: "en uso" se calcula sin RLS (el editor puede no ver los intentos de otras áreas o sedes)
create or replace function public.pregunta_en_uso(p_pregunta uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (select 1 from public.intento_preguntas where pregunta_id = p_pregunta)
$$;

create or replace function public.proteger_opciones_en_uso() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if public.pregunta_en_uso(old.pregunta_id) then
    raise exception 'pregunta en uso' using errcode = 'P0001';
  end if;
  return old;
end $$;
create trigger proteger_opciones_en_uso before delete on public.opciones
  for each row execute function public.proteger_opciones_en_uso();

create or replace function public.guardar_pregunta(p_datos jsonb) returns uuid
language plpgsql security invoker set search_path = '' as $$
declare
  v_id uuid := nullif(p_datos ->> 'id', '')::uuid;
  v_tipo public.tipo_pregunta := (p_datos ->> 'tipo')::public.tipo_pregunta;
  v_opciones jsonb := coalesce(p_datos -> 'opciones', '[]'::jsonb);
  v_usada boolean;
  v_filas int;
begin
  if v_id is null then
    insert into public.preguntas (tipo, enunciado_md, contexto_md, caso_id, orden_en_caso, explicacion_md, rubrica_md, puntaje_max,
                                  dificultad, modulo_id, categoria_id, articulo_fuente_id, uso, config, solucion, estado, alcance, sede_id)
    values (v_tipo, p_datos ->> 'enunciado_md', p_datos ->> 'contexto_md', nullif(p_datos ->> 'caso_id', '')::uuid,
            (p_datos ->> 'orden_en_caso')::int, coalesce(p_datos ->> 'explicacion_md', ''), p_datos ->> 'rubrica_md',
            coalesce((p_datos ->> 'puntaje_max')::int, 1), coalesce((p_datos ->> 'dificultad')::int, 1),
            nullif(p_datos ->> 'modulo_id', '')::uuid, nullif(p_datos ->> 'categoria_id', '')::uuid,
            nullif(p_datos ->> 'articulo_fuente_id', '')::uuid, coalesce((p_datos ->> 'uso')::public.uso_pregunta, 'examen'),
            nullif(p_datos -> 'config', 'null'::jsonb), nullif(p_datos -> 'solucion', 'null'::jsonb),
            coalesce((p_datos ->> 'estado')::public.estado_contenido, 'borrador'), (p_datos ->> 'alcance')::public.alcance,
            nullif(p_datos ->> 'sede_id', '')::uuid)
    returning id into v_id;
    insert into public.opciones (pregunta_id, texto, es_correcta, posicion_correcta, grupo, orden)
    select v_id, o ->> 'texto', coalesce((o ->> 'es_correcta')::boolean, false), (o ->> 'posicion_correcta')::int,
           nullif(o ->> 'grupo', ''), coalesce((o ->> 'orden')::int, 0)
    from jsonb_array_elements(v_opciones) o;
    return v_id;
  end if;

  v_usada := public.pregunta_en_uso(v_id);
  if v_usada and (
       (select tipo from public.preguntas where id = v_id) is distinct from v_tipo
       or (select count(*) from public.opciones where pregunta_id = v_id) <> jsonb_array_length(v_opciones)) then
    raise exception 'pregunta en uso' using errcode = 'P0001';
  end if;

  update public.preguntas set
    tipo = v_tipo, enunciado_md = p_datos ->> 'enunciado_md', contexto_md = p_datos ->> 'contexto_md',
    caso_id = nullif(p_datos ->> 'caso_id', '')::uuid, orden_en_caso = (p_datos ->> 'orden_en_caso')::int,
    explicacion_md = coalesce(p_datos ->> 'explicacion_md', ''), rubrica_md = p_datos ->> 'rubrica_md',
    puntaje_max = coalesce((p_datos ->> 'puntaje_max')::int, 1), dificultad = coalesce((p_datos ->> 'dificultad')::int, 1),
    modulo_id = nullif(p_datos ->> 'modulo_id', '')::uuid, categoria_id = nullif(p_datos ->> 'categoria_id', '')::uuid,
    articulo_fuente_id = nullif(p_datos ->> 'articulo_fuente_id', '')::uuid,
    uso = coalesce((p_datos ->> 'uso')::public.uso_pregunta, 'examen'),
    config = nullif(p_datos -> 'config', 'null'::jsonb), solucion = nullif(p_datos -> 'solucion', 'null'::jsonb),
    estado = coalesce((p_datos ->> 'estado')::public.estado_contenido, 'borrador'),
    alcance = (p_datos ->> 'alcance')::public.alcance, sede_id = nullif(p_datos ->> 'sede_id', '')::uuid
  where id = v_id;
  get diagnostics v_filas = row_count;
  if v_filas = 0 then raise exception 'sin permiso' using errcode = '42501'; end if;

  if v_usada then
    update public.opciones op set
      texto = o.texto, es_correcta = o.es_correcta, posicion_correcta = o.posicion_correcta, grupo = o.grupo
    from (
      select x ->> 'texto' as texto, coalesce((x ->> 'es_correcta')::boolean, false) as es_correcta,
             (x ->> 'posicion_correcta')::int as posicion_correcta, nullif(x ->> 'grupo', '') as grupo, n
      from jsonb_array_elements(v_opciones) with ordinality as e(x, n)
    ) o
    join (select id, row_number() over (order by orden, id) as n from public.opciones where pregunta_id = v_id) actual on actual.n = o.n
    where op.id = actual.id;
  else
    delete from public.opciones where pregunta_id = v_id;
    insert into public.opciones (pregunta_id, texto, es_correcta, posicion_correcta, grupo, orden)
    select v_id, o ->> 'texto', coalesce((o ->> 'es_correcta')::boolean, false), (o ->> 'posicion_correcta')::int,
           nullif(o ->> 'grupo', ''), coalesce((o ->> 'orden')::int, 0)
    from jsonb_array_elements(v_opciones) o;
  end if;
  return v_id;
end $$;

revoke all on function public.puede_rendir(uuid), public.pozo_fuente(uuid, uuid, uuid, uuid), public.preguntas_de_unidad(uuid, uuid),
  public.sortear_intento(uuid, uuid), public.pozo_practica(uuid), public.pregunta_en_uso(uuid), public.proteger_opciones_en_uso()
  from public, anon, authenticated;
grant execute on function public.puede_rendir(uuid), public.pregunta_en_uso(uuid) to authenticated;
revoke all on function public.guardar_pregunta(jsonb) from public, anon;
grant execute on function public.guardar_pregunta(jsonb) to authenticated;

-- El contador de gestión usa el mismo pozo que el sorteo y la práctica (globales y de la sede del examen o del editor)
create or replace function public.contar_pozo(p_examen uuid) returns int
language plpgsql stable security definer set search_path = '' as $$
declare v_e public.examenes; v_n int; v_sede uuid;
begin
  if not public.puede_editar_examen(p_examen) then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  select * into v_e from public.examenes where id = p_examen;
  v_sede := coalesce(v_e.sede_id, public.mi_sede());
  select count(distinct p.id) into v_n
  from public.preguntas p
  where p.estado = 'publicado'
    and (p.alcance = 'global' or p.sede_id = v_sede)
    and p.uso = case when v_e.tipo = 'practica' then 'practica'::public.uso_pregunta else 'examen'::public.uso_pregunta end
    and (
      (v_e.tipo = 'practica' and (v_e.modulo_id is null or p.modulo_id = v_e.modulo_id) and (v_e.categoria_id is null or p.categoria_id = v_e.categoria_id))
      or (v_e.tipo = 'modulo' and p.modulo_id = v_e.modulo_id)
      or (v_e.tipo = 'categoria' and p.categoria_id = v_e.categoria_id)
      or (v_e.tipo = 'nivel' and p.modulo_id in (select m.id from public.modulos m where m.curso_id = v_e.curso_id))
      or (v_e.tipo = 'ubicacion' and p.modulo_id in (select m.id from public.modulos m where m.curso_id = any (public.bloques_ubicacion())))
      or (v_e.tipo = 'integrador' and exists (
            select 1 from public.examen_fuentes f where f.examen_id = v_e.id
              and (p.modulo_id = f.modulo_id or p.categoria_id = f.categoria_id
                   or p.modulo_id in (select m.id from public.modulos m where m.curso_id = f.curso_id)))));
  return v_n;
end $$;

-- M3 (re-graduado): una certificación vencida no traba el siguiente nivel (spec §4.3); solo la revocada no cuenta
create or replace function public.curso_cumplido(p_curso uuid, p_usuario uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (select 1 from public.certificaciones c
                 where c.curso_id = p_curso and c.usuario_id = p_usuario and c.estado <> 'revocada')
    or (exists (
          select 1 from public.items i join public.modulos m on m.id = i.modulo_id
          where m.curso_id = p_curso and i.requisito <> 'ninguno')
        and not exists (
          select 1 from public.items i join public.modulos m on m.id = i.modulo_id
          where m.curso_id = p_curso and i.requisito <> 'ninguno' and not public.item_cumplido(i.id, p_usuario)))
$$;

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
    or exists (select 1 from public.certificaciones c where c.curso_id = v_anterior and c.usuario_id = p_usuario and c.estado <> 'revocada')
    or not exists (
      select 1 from public.items i join public.modulos m on m.id = i.modulo_id
      where m.curso_id = v_anterior and i.requisito <> 'ninguno' and not public.item_cumplido(i.id, p_usuario));
end $$;

-- M5 (re-graduado): completar una práctica queda registrado en el paso (item_progreso.hecho_at)
create or replace function public.comprobar_practica(p_examen uuid, p_pregunta uuid, p_respuesta jsonb)
returns table (es_correcta boolean, explicacion_md text, solucion jsonb)
language plpgsql security definer set search_path = '' as $$
declare v_p public.preguntas; v_ok boolean;
begin
  if not public.puede_practicar(p_examen) then raise exception 'no disponible' using errcode = 'P0001'; end if;
  if p_pregunta not in (select public.pozo_practica(p_examen)) then
    raise exception 'no es de práctica' using errcode = 'P0001';
  end if;
  select * into v_p from public.preguntas where id = p_pregunta;
  if v_p.tipo = 'libre' then
    v_ok := coalesce(btrim(p_respuesta ->> 'texto'), '') <> '';
  else
    v_ok := public.respuesta_correcta(
      p_pregunta,
      (select array_agg(x::uuid) from jsonb_array_elements_text(coalesce(p_respuesta -> 'opcion_ids', '[]'::jsonb)) x),
      (select array_agg(x::uuid order by n) from jsonb_array_elements_text(coalesce(p_respuesta -> 'orden', '[]'::jsonb)) with ordinality as t(x, n)),
      nullif(p_respuesta -> 'valores', 'null'::jsonb));
  end if;
  if v_ok then
    insert into public.practica_progreso (usuario_id, pregunta_id) values (auth.uid(), p_pregunta)
    on conflict (usuario_id, pregunta_id) do nothing;
    if not exists (select 1 from public.pozo_practica(p_examen) q(id)
                   where not exists (select 1 from public.practica_progreso pp where pp.usuario_id = auth.uid() and pp.pregunta_id = q.id)) then
      insert into public.item_progreso (usuario_id, item_id, hecho_at)
      select auth.uid(), i.id, now() from public.items i where i.examen_id = p_examen and i.tipo = 'practica'
      on conflict (usuario_id, item_id) do update set hecho_at = coalesce(public.item_progreso.hecho_at, now());
    end if;
  end if;
  return query select v_ok, v_p.explicacion_md, jsonb_build_object(
    'opcion_ids', (select coalesce(jsonb_agg(o.id), '[]'::jsonb) from public.opciones o where o.pregunta_id = p_pregunta and o.es_correcta),
    'orden', (select coalesce(jsonb_agg(o.id order by o.posicion_correcta), '[]'::jsonb) from public.opciones o
              where o.pregunta_id = p_pregunta and o.posicion_correcta is not null),
    'grupos', (select coalesce(jsonb_object_agg(o.id, o.grupo), '{}'::jsonb) from public.opciones o where o.pregunta_id = p_pregunta and o.grupo is not null),
    'aceptadas', coalesce(v_p.solucion, '{}'::jsonb),
    'rubrica', v_p.rubrica_md);
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
    when i.requisito = 'ninguno' then true
    when i.requisito = 'ver' then exists (select 1 from public.item_progreso p where p.item_id = i.id and p.usuario_id = p_usuario and p.visto_at is not null)
    when i.requisito = 'marcar_hecho' then exists (select 1 from public.item_progreso p where p.item_id = i.id and p.usuario_id = p_usuario and p.hecho_at is not null)
    else i.examen_id is not null and exists (
      select 1 from public.intentos t where t.examen_id = i.examen_id and t.usuario_id = p_usuario and t.estado = 'cerrado' and t.aprobado)
  end
  from public.items i where i.id = p_item
$$;

revoke all on function public.contar_pozo(uuid), public.comprobar_practica(uuid, uuid, jsonb) from public, anon;
grant execute on function public.contar_pozo(uuid), public.comprobar_practica(uuid, uuid, jsonb) to authenticated;
revoke all on function public.curso_cumplido(uuid, uuid), public.curso_desbloqueado(uuid, uuid), public.item_cumplido(uuid, uuid)
  from public, anon, authenticated;
