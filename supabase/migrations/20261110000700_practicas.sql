-- PEA · Etapa 6 · Prácticas simuladas: devolución inmediata, sin nota ni intentos.
-- Solo usan preguntas de uso "practica", así que practicar nunca revela respuestas de un examen.

-- Un paso de curso puede ser una práctica
alter table public.items drop constraint items_por_tipo;
alter table public.items add constraint items_por_tipo check (
  (tipo = 'articulo' and articulo_id is not null)
  or (tipo = 'recurso' and recurso_id is not null)
  or (tipo = 'pagina' and coalesce(trim(contenido_md), '') <> '')
  or (tipo = 'video' and (url is not null or recurso_id is not null))
  or (tipo = 'enlace' and url is not null)
  or tipo = 'examen'
  or (tipo = 'practica' and examen_id is not null)
);

-- Una práctica se arma por módulo o por categoría
alter table public.examenes drop constraint examenes_referencia;
alter table public.examenes add constraint examenes_referencia check (
  (tipo <> 'modulo' or modulo_id is not null)
  and (tipo <> 'categoria' or categoria_id is not null)
  and (tipo <> 'nivel' or curso_id is not null)
  and (tipo <> 'practica' or modulo_id is not null or categoria_id is not null)
);

-- Preguntas de una práctica
create or replace function public.pozo_practica(p_examen uuid) returns setof uuid
language sql stable security definer set search_path = '' as $$
  select p.id from public.preguntas p join public.examenes e on e.id = p_examen
  where e.tipo = 'practica' and p.estado = 'publicado' and p.uso = 'practica'
    and (e.modulo_id is null or p.modulo_id = e.modulo_id)
    and (e.categoria_id is null or p.categoria_id = e.categoria_id)
$$;

create or replace function public.puede_practicar(p_examen uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select public.mi_perfil_activo()
    and exists (select 1 from public.examenes e where e.id = p_examen and e.tipo = 'practica' and e.estado = 'publicado'
                and public.puede_leer_contenido(e.alcance, e.sede_id, e.estado))
    and (not exists (select 1 from public.items i where i.examen_id = p_examen)
         or exists (select 1 from public.items i where i.examen_id = p_examen and public.item_disponible(i.id, auth.uid())))
$$;

create or replace function public.practica_preguntas(p_examen uuid)
returns table (pregunta_id uuid, orden int, tipo public.tipo_pregunta, enunciado_md text, contexto_md text, caso_titulo text,
               caso_contexto_md text, puntaje_max int, config jsonb, opciones jsonb, acertada boolean)
language plpgsql stable security definer set search_path = '' as $$
begin
  if not public.puede_practicar(p_examen) then raise exception 'no disponible' using errcode = 'P0001'; end if;
  return query
  select p.id, (row_number() over (order by c.titulo nulls first, p.orden_en_caso nulls first, p.created_at, p.id))::int,
         p.tipo, p.enunciado_md, p.contexto_md, c.titulo, c.contexto_md, p.puntaje_max, p.config,
         coalesce((select jsonb_agg(jsonb_build_object('id', o.id, 'texto', o.texto)
                                    order by case when p.tipo = 'ordenar' then md5(o.id::text || auth.uid()::text) else lpad(o.orden::text, 6, '0') end)
                   from public.opciones o where o.pregunta_id = p.id), '[]'::jsonb),
         exists (select 1 from public.practica_progreso pp where pp.usuario_id = auth.uid() and pp.pregunta_id = p.id)
  from public.preguntas p
  left join public.casos c on c.id = p.caso_id
  where p.id in (select public.pozo_practica(p_examen));
end $$;

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
  end if;
  return query select v_ok, v_p.explicacion_md, jsonb_build_object(
    'opcion_ids', (select coalesce(jsonb_agg(o.id), '[]'::jsonb) from public.opciones o where o.pregunta_id = p_pregunta and o.es_correcta),
    'orden', (select coalesce(jsonb_agg(o.id order by o.posicion_correcta), '[]'::jsonb) from public.opciones o
              where o.pregunta_id = p_pregunta and o.posicion_correcta is not null),
    'grupos', (select coalesce(jsonb_object_agg(o.id, o.grupo), '{}'::jsonb) from public.opciones o where o.pregunta_id = p_pregunta and o.grupo is not null),
    'aceptadas', coalesce(v_p.solucion, '{}'::jsonb),
    'rubrica', v_p.rubrica_md);
end $$;

-- Un paso de práctica se cumple al acertar todas sus preguntas al menos una vez
create or replace function public.item_cumplido(p_item uuid, p_usuario uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select case
    when i.tipo = 'practica' then i.examen_id is not null
      and exists (select 1 from public.pozo_practica(i.examen_id))
      and not exists (select 1 from public.pozo_practica(i.examen_id) q(id)
                      where not exists (select 1 from public.practica_progreso pp where pp.usuario_id = p_usuario and pp.pregunta_id = q.id))
    when i.requisito = 'ninguno' then true
    when i.requisito = 'ver' then exists (select 1 from public.item_progreso p where p.item_id = i.id and p.usuario_id = p_usuario and p.visto_at is not null)
    when i.requisito = 'marcar_hecho' then exists (select 1 from public.item_progreso p where p.item_id = i.id and p.usuario_id = p_usuario and p.hecho_at is not null)
    else i.examen_id is not null and exists (
      select 1 from public.intentos t where t.examen_id = i.examen_id and t.usuario_id = p_usuario and t.estado = 'cerrado' and t.aprobado)
  end
  from public.items i where i.id = p_item
$$;

revoke all on function public.pozo_practica(uuid), public.puede_practicar(uuid), public.practica_preguntas(uuid),
  public.comprobar_practica(uuid, uuid, jsonb), public.item_cumplido(uuid, uuid) from public, anon, authenticated;
grant execute on function public.practica_preguntas(uuid), public.comprobar_practica(uuid, uuid, jsonb) to authenticated;
