-- PEA · Etapa 8 · Preguntas de Probalo: el editor guarda su lección y no se mezclan con otras prácticas

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
    alcance = (p_datos ->> 'alcance')::public.alcance, sede_id = nullif(p_datos ->> 'sede_id', '')::uuid,
    item_id = case when p_datos ->> 'uso' = 'practica' then nullif(p_datos ->> 'item_id', '')::uuid end
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
revoke all on function public.guardar_pregunta(jsonb) from public, anon;
grant execute on function public.guardar_pregunta(jsonb) to authenticated;

create or replace function public.pozo_practica(p_examen uuid) returns setof uuid
language sql stable security definer set search_path = '' as $$
  select p.id from public.preguntas p join public.examenes e on e.id = p_examen
  where e.tipo = 'practica' and p.estado = 'publicado' and p.uso = 'practica' and p.item_id is null
    and (p.alcance = 'global' or p.sede_id = public.mi_sede())
    and (e.modulo_id is null or p.modulo_id = e.modulo_id)
    and (e.categoria_id is null or p.categoria_id = e.categoria_id)
$$;
revoke all on function public.pozo_practica(uuid) from public, anon, authenticated;

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
      (v_e.tipo = 'practica' and p.item_id is null and (v_e.modulo_id is null or p.modulo_id = v_e.modulo_id) and (v_e.categoria_id is null or p.categoria_id = v_e.categoria_id))
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
revoke all on function public.contar_pozo(uuid) from public, anon;
grant execute on function public.contar_pozo(uuid) to authenticated;
