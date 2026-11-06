-- PEA · Etapa 6 · Gestión del banco: guardar una pregunta con sus opciones y contar el pozo de un examen

-- Guarda (alta o edición) una pregunta y sus opciones en una sola transacción. Corre como el usuario: decide la RLS.
-- Una pregunta que ya salió en intentos no cambia de tipo ni de cantidad de opciones (los intentos apuntan a esas opciones);
-- en ese caso las opciones se actualizan por posición, conservando sus ids.
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

  v_usada := exists (select 1 from public.intento_preguntas where pregunta_id = v_id);
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

-- Preguntas publicadas disponibles para un examen (las de uso "practica" para una práctica)
create or replace function public.contar_pozo(p_examen uuid) returns int
language plpgsql stable security definer set search_path = '' as $$
declare v_e public.examenes; v_n int;
begin
  if not public.puede_editar_examen(p_examen) then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  select * into v_e from public.examenes where id = p_examen;
  select count(distinct p.id) into v_n
  from public.preguntas p
  where p.estado = 'publicado'
    and p.uso = case when v_e.tipo = 'practica' then 'practica'::public.uso_pregunta else 'examen'::public.uso_pregunta end
    and (
      (v_e.tipo in ('modulo', 'practica') and v_e.modulo_id is not null and p.modulo_id = v_e.modulo_id)
      or (v_e.tipo in ('categoria', 'practica') and v_e.categoria_id is not null and p.categoria_id = v_e.categoria_id)
      or (v_e.tipo = 'nivel' and p.modulo_id in (select m.id from public.modulos m where m.curso_id = v_e.curso_id))
      or (v_e.tipo = 'ubicacion' and p.modulo_id in (select m.id from public.modulos m where m.curso_id = any (public.bloques_ubicacion())))
      or (v_e.tipo = 'integrador' and exists (
            select 1 from public.examen_fuentes f where f.examen_id = v_e.id
              and (p.modulo_id = f.modulo_id or p.categoria_id = f.categoria_id
                   or p.modulo_id in (select m.id from public.modulos m where m.curso_id = f.curso_id)))));
  return v_n;
end $$;


-- Guarda (alta o edición) un examen y reemplaza sus fuentes en una sola transacción. Corre como el usuario.
create or replace function public.guardar_examen(p_datos jsonb) returns uuid
language plpgsql security invoker set search_path = '' as $$
declare v_id uuid := nullif(p_datos ->> 'id', '')::uuid; v_filas int;
begin
  if v_id is null then
    insert into public.examenes (titulo, tipo, modulo_id, categoria_id, curso_id, cantidad_preguntas, nota_minima, max_intentos,
                                 espera_horas, tiempo_limite_min, mezclar, alcance, sede_id, estado)
    values (p_datos ->> 'titulo', (p_datos ->> 'tipo')::public.tipo_examen, nullif(p_datos ->> 'modulo_id', '')::uuid,
            nullif(p_datos ->> 'categoria_id', '')::uuid, nullif(p_datos ->> 'curso_id', '')::uuid,
            (p_datos ->> 'cantidad_preguntas')::int, coalesce((p_datos ->> 'nota_minima')::int, 80),
            coalesce((p_datos ->> 'max_intentos')::int, 3), coalesce((p_datos ->> 'espera_horas')::int, 24),
            (p_datos ->> 'tiempo_limite_min')::int, coalesce((p_datos ->> 'mezclar')::boolean, true),
            (p_datos ->> 'alcance')::public.alcance, nullif(p_datos ->> 'sede_id', '')::uuid,
            coalesce((p_datos ->> 'estado')::public.estado_contenido, 'borrador'))
    returning id into v_id;
  else
    update public.examenes set
      titulo = p_datos ->> 'titulo', tipo = (p_datos ->> 'tipo')::public.tipo_examen,
      modulo_id = nullif(p_datos ->> 'modulo_id', '')::uuid, categoria_id = nullif(p_datos ->> 'categoria_id', '')::uuid,
      curso_id = nullif(p_datos ->> 'curso_id', '')::uuid, cantidad_preguntas = (p_datos ->> 'cantidad_preguntas')::int,
      nota_minima = coalesce((p_datos ->> 'nota_minima')::int, 80), max_intentos = coalesce((p_datos ->> 'max_intentos')::int, 3),
      espera_horas = coalesce((p_datos ->> 'espera_horas')::int, 24), tiempo_limite_min = (p_datos ->> 'tiempo_limite_min')::int,
      mezclar = coalesce((p_datos ->> 'mezclar')::boolean, true), alcance = (p_datos ->> 'alcance')::public.alcance,
      sede_id = nullif(p_datos ->> 'sede_id', '')::uuid, estado = coalesce((p_datos ->> 'estado')::public.estado_contenido, 'borrador')
    where id = v_id;
    get diagnostics v_filas = row_count;
    if v_filas = 0 then raise exception 'sin permiso' using errcode = '42501'; end if;
    delete from public.examen_fuentes where examen_id = v_id;
  end if;
  insert into public.examen_fuentes (examen_id, modulo_id, categoria_id, curso_id, cantidad)
  select v_id, nullif(f ->> 'modulo_id', '')::uuid, nullif(f ->> 'categoria_id', '')::uuid, nullif(f ->> 'curso_id', '')::uuid,
         (f ->> 'cantidad')::int
  from jsonb_array_elements(coalesce(p_datos -> 'fuentes', '[]'::jsonb)) f;
  return v_id;
end $$;

revoke all on function public.guardar_pregunta(jsonb), public.guardar_examen(jsonb), public.contar_pozo(uuid) from public, anon;
grant execute on function public.guardar_pregunta(jsonb), public.guardar_examen(jsonb), public.contar_pozo(uuid) to authenticated;
