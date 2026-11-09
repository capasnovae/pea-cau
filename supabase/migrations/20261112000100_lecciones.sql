-- PEA · Etapa 8 · Lecciones (spec §4.10): bloques con límites, fuente obligatoria y Probalo

-- Bloques: resumen 1–5 (≤200), ejemplos 1–4 (consulta ≤200, respuesta ≤400), ojo 0–4 (≤200)
create or replace function public.leccion_valida(l jsonb) returns boolean
language sql immutable set search_path = '' as $$
  select coalesce(
    jsonb_typeof(l) = 'object'
    and (select bool_and(k in ('resumen', 'ejemplos', 'ojo')) from jsonb_object_keys(l) k)
    and jsonb_typeof(l -> 'resumen') = 'array' and jsonb_array_length(l -> 'resumen') between 1 and 5
    and (select bool_and(jsonb_typeof(x) = 'string' and char_length(btrim(x #>> '{}')) between 1 and 200)
         from jsonb_array_elements(l -> 'resumen') x)
    and jsonb_typeof(l -> 'ejemplos') = 'array' and jsonb_array_length(l -> 'ejemplos') between 1 and 4
    and (select bool_and(jsonb_typeof(x) = 'object'
                         and (select bool_and(k in ('consulta', 'respuesta')) from jsonb_object_keys(x) k)
                         and char_length(btrim(coalesce(x ->> 'consulta', ''))) between 1 and 200
                         and char_length(btrim(coalesce(x ->> 'respuesta', ''))) between 1 and 400)
         from jsonb_array_elements(l -> 'ejemplos') x)
    and jsonb_typeof(coalesce(l -> 'ojo', '[]'::jsonb)) = 'array' and jsonb_array_length(coalesce(l -> 'ojo', '[]'::jsonb)) <= 4
    and coalesce((select bool_and(jsonb_typeof(x) = 'string' and char_length(btrim(x #>> '{}')) between 1 and 200)
                  from jsonb_array_elements(coalesce(l -> 'ojo', '[]'::jsonb)) x), true),
    false)
$$;

alter table public.items add column leccion jsonb;
alter table public.items drop constraint items_por_tipo;
alter table public.items add constraint items_por_tipo check (
  (tipo = 'articulo' and articulo_id is not null)
  or (tipo = 'recurso' and recurso_id is not null)
  or (tipo = 'pagina' and coalesce(trim(contenido_md), '') <> '')
  or (tipo = 'video' and (url is not null or recurso_id is not null))
  or (tipo = 'enlace' and url is not null)
  or tipo = 'examen'
  or (tipo = 'practica' and examen_id is not null)
  or (tipo = 'leccion' and articulo_id is not null and public.leccion_valida(leccion) and requisito in ('ver', 'marcar_hecho'))
);

-- Preguntas de Probalo: preguntas de práctica que pertenecen a una lección
alter table public.preguntas add column item_id uuid references public.items (id) on delete set null;
create index preguntas_item_idx on public.preguntas (item_id) where item_id is not null;

-- Cada "Comprobar" queda registrado (para la tasa de acierto del panel)
create table public.practica_intentos (
  id uuid primary key default gen_random_uuid(),
  usuario_id uuid not null references public.perfiles (id) on delete cascade,
  pregunta_id uuid not null references public.preguntas (id) on delete cascade,
  correcta boolean not null,
  created_at timestamptz not null default clock_timestamp()
);
create index practica_intentos_usuario_idx on public.practica_intentos (usuario_id, created_at desc);
create index practica_intentos_pregunta_idx on public.practica_intentos (pregunta_id);
alter table public.practica_intentos enable row level security;
revoke all on public.practica_intentos from anon;
revoke insert, update, delete, truncate on public.practica_intentos from authenticated;
create policy practica_intentos_leer on public.practica_intentos for select to authenticated using (usuario_id = auth.uid());

-- Corrección compartida por la práctica de módulo y el Probalo: registra el intento y el acierto
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
  return query select v_ok, v_p.explicacion_md, jsonb_build_object(
    'opcion_ids', (select coalesce(jsonb_agg(o.id), '[]'::jsonb) from public.opciones o where o.pregunta_id = p_pregunta and o.es_correcta),
    'orden', (select coalesce(jsonb_agg(o.id order by o.posicion_correcta), '[]'::jsonb) from public.opciones o
              where o.pregunta_id = p_pregunta and o.posicion_correcta is not null),
    'grupos', (select coalesce(jsonb_object_agg(o.id, o.grupo), '{}'::jsonb) from public.opciones o where o.pregunta_id = p_pregunta and o.grupo is not null),
    'aceptadas', coalesce(v_p.solucion, '{}'::jsonb),
    'rubrica', v_p.rubrica_md);
end $$;

create or replace function public.comprobar_practica(p_examen uuid, p_pregunta uuid, p_respuesta jsonb)
returns table (es_correcta boolean, explicacion_md text, solucion jsonb)
language plpgsql security definer set search_path = '' as $$
declare r record;
begin
  if not public.puede_practicar(p_examen) then raise exception 'no disponible' using errcode = 'P0001'; end if;
  if p_pregunta not in (select public.pozo_practica(p_examen)) then
    raise exception 'no es de práctica' using errcode = 'P0001';
  end if;
  select * into r from public.corregir_practica(p_pregunta, p_respuesta);
  if r.es_correcta and not exists (select 1 from public.pozo_practica(p_examen) q(id)
                   where not exists (select 1 from public.practica_progreso pp where pp.usuario_id = auth.uid() and pp.pregunta_id = q.id)) then
    insert into public.item_progreso (usuario_id, item_id, hecho_at)
    select auth.uid(), i.id, now() from public.items i where i.examen_id = p_examen and i.tipo = 'practica'
    on conflict (usuario_id, item_id) do update set hecho_at = coalesce(public.item_progreso.hecho_at, now());
  end if;
  return query select r.es_correcta, r.explicacion_md, r.solucion;
end $$;

-- Pozo del Probalo: preguntas de práctica publicadas de la lección, globales o de mi sede
create or replace function public.pozo_probalo(p_item uuid) returns setof uuid
language sql stable security definer set search_path = '' as $$
  select p.id from public.preguntas p
  where p.item_id = p_item and p.uso = 'practica' and p.estado = 'publicado'
    and (p.alcance = 'global' or p.sede_id = public.mi_sede())
$$;

create or replace function public.probalo_preguntas(p_item uuid)
returns table (pregunta_id uuid, orden int, tipo public.tipo_pregunta, enunciado_md text, contexto_md text, caso_titulo text,
               caso_contexto_md text, puntaje_max int, config jsonb, opciones jsonb, acertada boolean)
language plpgsql stable security definer set search_path = '' as $$
begin
  if not public.item_disponible(p_item, auth.uid()) then raise exception 'no disponible' using errcode = 'P0001'; end if;
  return query
  select p.id, (row_number() over (order by p.created_at, p.id))::int,
         p.tipo, p.enunciado_md, p.contexto_md, c.titulo, c.contexto_md, p.puntaje_max, p.config,
         coalesce((select jsonb_agg(jsonb_build_object('id', o.id, 'texto', o.texto)
                                    order by case when p.tipo = 'ordenar' then md5(o.id::text || auth.uid()::text) else lpad(o.orden::text, 6, '0') end)
                   from public.opciones o where o.pregunta_id = p.id), '[]'::jsonb),
         exists (select 1 from public.practica_progreso pp where pp.usuario_id = auth.uid() and pp.pregunta_id = p.id)
  from public.preguntas p
  left join public.casos c on c.id = p.caso_id
  where p.id in (select public.pozo_probalo(p_item));
end $$;

create or replace function public.comprobar_probalo(p_item uuid, p_pregunta uuid, p_respuesta jsonb)
returns table (es_correcta boolean, explicacion_md text, solucion jsonb)
language plpgsql security definer set search_path = '' as $$
declare r record;
begin
  if not public.item_disponible(p_item, auth.uid()) then raise exception 'no disponible' using errcode = 'P0001'; end if;
  if p_pregunta not in (select public.pozo_probalo(p_item)) then
    raise exception 'no es de esta lección' using errcode = 'P0001';
  end if;
  select * into r from public.corregir_practica(p_pregunta, p_respuesta);
  -- Completar el Probalo deja el paso hecho (y queda aunque después se archiven las preguntas)
  if r.es_correcta and not exists (select 1 from public.pozo_probalo(p_item) q(id)
                   where not exists (select 1 from public.practica_progreso pp where pp.usuario_id = auth.uid() and pp.pregunta_id = q.id)) then
    insert into public.item_progreso (usuario_id, item_id, visto_at, hecho_at)
    select auth.uid(), i.id, now(), now() from public.items i where i.id = p_item and i.requisito = 'marcar_hecho'
    on conflict (usuario_id, item_id) do update set hecho_at = coalesce(public.item_progreso.hecho_at, now());
  end if;
  return query select r.es_correcta, r.explicacion_md, r.solucion;
end $$;

-- Lección con Probalo publicado: se cumple acertando todas (marcar a mano no alcanza)
create or replace function public.item_cumplido(p_item uuid, p_usuario uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select case
    when i.tipo = 'practica' then
      exists (select 1 from public.item_progreso pr where pr.item_id = i.id and pr.usuario_id = p_usuario and pr.hecho_at is not null)
      or (i.examen_id is not null
          and exists (select 1 from public.pozo_practica(i.examen_id))
          and not exists (select 1 from public.pozo_practica(i.examen_id) q(id)
                          where not exists (select 1 from public.practica_progreso pp where pp.usuario_id = p_usuario and pp.pregunta_id = q.id)))
    when i.tipo = 'leccion' and i.requisito = 'marcar_hecho'
         and exists (select 1 from public.preguntas q where q.item_id = i.id and q.uso = 'practica' and q.estado = 'publicado') then
      not exists (select 1 from public.preguntas q where q.item_id = i.id and q.uso = 'practica' and q.estado = 'publicado'
                    and not exists (select 1 from public.practica_progreso pp where pp.usuario_id = p_usuario and pp.pregunta_id = q.id))
    when i.requisito = 'ninguno' then true
    when i.requisito = 'ver' then exists (select 1 from public.item_progreso p where p.item_id = i.id and p.usuario_id = p_usuario and p.visto_at is not null)
    when i.requisito = 'marcar_hecho' then exists (select 1 from public.item_progreso p where p.item_id = i.id and p.usuario_id = p_usuario and p.hecho_at is not null)
    else i.examen_id is not null and exists (
      select 1 from public.intentos t where t.examen_id = i.examen_id and t.usuario_id = p_usuario and t.estado = 'cerrado' and t.aprobado)
  end
  from public.items i where i.id = p_item
$$;

revoke all on function public.corregir_practica(uuid, jsonb), public.pozo_probalo(uuid), public.item_cumplido(uuid, uuid)
  from public, anon, authenticated;
revoke all on function public.probalo_preguntas(uuid), public.comprobar_probalo(uuid, uuid, jsonb), public.comprobar_practica(uuid, uuid, jsonb)
  from public, anon;
grant execute on function public.probalo_preguntas(uuid), public.comprobar_probalo(uuid, uuid, jsonb), public.comprobar_practica(uuid, uuid, jsonb)
  to authenticated;
grant execute on function public.leccion_valida(jsonb) to authenticated;
