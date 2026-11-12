-- Probalo como casos: cada opción explica por qué es correcta o no.
-- La explicación llega solo con la corrección (corregir_practica), nunca con la pregunta:
-- la tabla opciones no se lee directo (RLS) y probalo_preguntas / repaso_de_hoy no incluyen esta columna.

alter table public.opciones add column explicacion text
  check (explicacion is null or char_length(explicacion) between 1 and 400);

create or replace function public.corregir_practica(p_pregunta uuid, p_respuesta jsonb)
returns table (es_correcta boolean, explicacion_md text, solucion jsonb)
language plpgsql security definer set search_path = '' as $$
declare v_p public.preguntas; v_ok boolean;
begin
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
  insert into public.practica_intentos (usuario_id, pregunta_id, correcta) values (auth.uid(), p_pregunta, v_ok);
  if v_ok then
    insert into public.practica_progreso (usuario_id, pregunta_id) values (auth.uid(), p_pregunta)
    on conflict (usuario_id, pregunta_id) do nothing;
  end if;
  -- Entra al repaso espaciado: si la acertó vuelve mañana; si la falló, hoy mismo. Las libres no se repasan.
  if v_p.tipo <> 'libre' then
    insert into public.repaso (usuario_id, pregunta_id, caja, proxima, aciertos, fallos)
    values (auth.uid(), p_pregunta, 1, public.hoy_ar() + case when v_ok then 1 else 0 end,
            case when v_ok then 1 else 0 end, case when v_ok then 0 else 1 end)
    on conflict (usuario_id, pregunta_id) do nothing;
  end if;
  return query select v_ok, v_p.explicacion_md, jsonb_build_object(
    'opcion_ids', (select coalesce(jsonb_agg(o.id), '[]'::jsonb) from public.opciones o where o.pregunta_id = p_pregunta and o.es_correcta),
    'orden', (select coalesce(jsonb_agg(o.id order by o.posicion_correcta), '[]'::jsonb) from public.opciones o
              where o.pregunta_id = p_pregunta and o.posicion_correcta is not null),
    'grupos', (select coalesce(jsonb_object_agg(o.id, o.grupo), '{}'::jsonb) from public.opciones o where o.pregunta_id = p_pregunta and o.grupo is not null),
    'aceptadas', coalesce(v_p.solucion, '{}'::jsonb),
    'rubrica', v_p.rubrica_md,
    -- Por qué cada opción es correcta o no: solo después de responder
    'explicaciones', (select coalesce(jsonb_object_agg(o.id, o.explicacion), '{}'::jsonb) from public.opciones o
                      where o.pregunta_id = p_pregunta and o.explicacion is not null));
end $$;

revoke all on function public.corregir_practica(uuid, jsonb) from public, anon, authenticated;

-- El editor de preguntas guarda la explicación de cada opción
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
                                  dificultad, modulo_id, categoria_id, articulo_fuente_id, uso, config, solucion, estado, alcance, sede_id, item_id)
    values (v_tipo, p_datos ->> 'enunciado_md', p_datos ->> 'contexto_md', nullif(p_datos ->> 'caso_id', '')::uuid,
            (p_datos ->> 'orden_en_caso')::int, coalesce(p_datos ->> 'explicacion_md', ''), p_datos ->> 'rubrica_md',
            coalesce((p_datos ->> 'puntaje_max')::int, 1), coalesce((p_datos ->> 'dificultad')::int, 1),
            nullif(p_datos ->> 'modulo_id', '')::uuid, nullif(p_datos ->> 'categoria_id', '')::uuid,
            nullif(p_datos ->> 'articulo_fuente_id', '')::uuid, coalesce((p_datos ->> 'uso')::public.uso_pregunta, 'examen'),
            nullif(p_datos -> 'config', 'null'::jsonb), nullif(p_datos -> 'solucion', 'null'::jsonb),
            coalesce((p_datos ->> 'estado')::public.estado_contenido, 'borrador'), (p_datos ->> 'alcance')::public.alcance,
            nullif(p_datos ->> 'sede_id', '')::uuid,
            case when p_datos ->> 'uso' = 'practica' then nullif(p_datos ->> 'item_id', '')::uuid end)
    returning id into v_id;
    insert into public.opciones (pregunta_id, texto, es_correcta, posicion_correcta, grupo, orden, explicacion)
    select v_id, o ->> 'texto', coalesce((o ->> 'es_correcta')::boolean, false), (o ->> 'posicion_correcta')::int,
           nullif(o ->> 'grupo', ''), coalesce((o ->> 'orden')::int, 0), nullif(btrim(o ->> 'explicacion'), '')
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
    alcance = (p_datos ->> 'alcance')::public.alcance, sede_id = nullif(p_datos ->> 'sede_id', '')::uuid,
    item_id = case when p_datos ->> 'uso' = 'practica' then nullif(p_datos ->> 'item_id', '')::uuid end
  where id = v_id;
  get diagnostics v_filas = row_count;
  if v_filas = 0 then raise exception 'sin permiso' using errcode = '42501'; end if;

  if v_usada then
    update public.opciones op set
      texto = o.texto, es_correcta = o.es_correcta, posicion_correcta = o.posicion_correcta, grupo = o.grupo,
      explicacion = o.explicacion
    from (
      select x ->> 'texto' as texto, coalesce((x ->> 'es_correcta')::boolean, false) as es_correcta,
             (x ->> 'posicion_correcta')::int as posicion_correcta, nullif(x ->> 'grupo', '') as grupo,
             nullif(btrim(x ->> 'explicacion'), '') as explicacion, n
      from jsonb_array_elements(v_opciones) with ordinality as e(x, n)
    ) o
    join (select id, row_number() over (order by orden, id) as n from public.opciones where pregunta_id = v_id) actual on actual.n = o.n
    where op.id = actual.id;
  else
    delete from public.opciones where pregunta_id = v_id;
    insert into public.opciones (pregunta_id, texto, es_correcta, posicion_correcta, grupo, orden, explicacion)
    select v_id, o ->> 'texto', coalesce((o ->> 'es_correcta')::boolean, false), (o ->> 'posicion_correcta')::int,
           nullif(o ->> 'grupo', ''), coalesce((o ->> 'orden')::int, 0), nullif(btrim(o ->> 'explicacion'), '')
    from jsonb_array_elements(v_opciones) o;
  end if;
  return v_id;
end $$;

revoke all on function public.guardar_pregunta(jsonb) from public, anon;
grant execute on function public.guardar_pregunta(jsonb) to authenticated;
