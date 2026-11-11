-- PEA · Repaso diario espaciado: las preguntas de práctica vuelven a 1, 3, 7, 16 y 35 días (cajas 1 a 5)

create table public.repaso (
  usuario_id uuid not null references public.perfiles (id) on delete cascade,
  pregunta_id uuid not null references public.preguntas (id) on delete cascade,
  caja int not null default 1 check (caja between 1 and 5),
  proxima date not null default current_date,
  aciertos int not null default 0,
  fallos int not null default 0,
  updated_at timestamptz not null default now(),
  primary key (usuario_id, pregunta_id)
);
create index repaso_pendientes_idx on public.repaso (usuario_id, proxima);
create index repaso_pregunta_fk_idx on public.repaso (pregunta_id);

create table public.repaso_dias (
  usuario_id uuid not null references public.perfiles (id) on delete cascade,
  dia date not null,
  respuestas int not null default 0,
  primary key (usuario_id, dia)
);

alter table public.repaso enable row level security;
alter table public.repaso_dias enable row level security;
revoke all on public.repaso, public.repaso_dias from anon;
revoke insert, update, delete on public.repaso, public.repaso_dias from authenticated;
create policy repaso_leer on public.repaso for select to authenticated
  using ((usuario_id = auth.uid() or public.puede_ver_usuario(usuario_id)) and public.mi_perfil_activo());
create policy repaso_dias_leer on public.repaso_dias for select to authenticated
  using ((usuario_id = auth.uid() or public.puede_ver_usuario(usuario_id)) and public.mi_perfil_activo());

create or replace function public.intervalo_repaso(p_caja int) returns int
language sql immutable set search_path = '' as $$
  select (array[1, 3, 7, 16, 35])[greatest(1, least(5, p_caja))]
$$;

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
    'rubrica', v_p.rubrica_md);
end $$;

-- Preguntas del repaso que tocan hoy y que el usuario todavía puede ver (publicadas, globales o de su sede)
create or replace function public.pozo_repaso() returns setof uuid
language sql stable security definer set search_path = '' as $$
  select r.pregunta_id from public.repaso r join public.preguntas p on p.id = r.pregunta_id
  where r.usuario_id = auth.uid() and r.proxima <= public.hoy_ar()
    and p.estado = 'publicado' and p.uso = 'practica' and p.tipo <> 'libre'
    and (p.alcance = 'global' or p.sede_id = public.mi_sede())
$$;

create or replace function public.repaso_de_hoy()
returns table (pregunta_id uuid, orden int, tipo public.tipo_pregunta, enunciado_md text, contexto_md text, caso_titulo text,
               caso_contexto_md text, puntaje_max int, config jsonb, opciones jsonb, acertada boolean)
language plpgsql stable security definer set search_path = '' as $$
begin
  if not public.mi_perfil_activo() then raise exception 'sin permiso' using errcode = 'P0001'; end if;
  return query
  select p.id, (row_number() over (order by r.proxima, r.caja, md5(p.id::text || public.hoy_ar()::text)))::int,
         p.tipo, p.enunciado_md, p.contexto_md, c.titulo, c.contexto_md, p.puntaje_max, p.config,
         coalesce((select jsonb_agg(jsonb_build_object('id', o.id, 'texto', o.texto)
                                    order by case when p.tipo = 'ordenar' then md5(o.id::text || auth.uid()::text) else lpad(o.orden::text, 6, '0') end)
                   from public.opciones o where o.pregunta_id = p.id), '[]'::jsonb),
         false
  from public.repaso r
  join public.preguntas p on p.id = r.pregunta_id
  left join public.casos c on c.id = p.caso_id
  where r.usuario_id = auth.uid() and p.id in (select public.pozo_repaso())
  order by r.proxima, r.caja, md5(p.id::text || public.hoy_ar()::text)
  limit 5;
end $$;

create or replace function public.responder_repaso(p_pregunta uuid, p_respuesta jsonb)
returns table (es_correcta boolean, explicacion_md text, solucion jsonb)
language plpgsql security definer set search_path = '' as $$
declare r record;
begin
  if p_pregunta not in (select public.pozo_repaso()) then
    raise exception 'no toca hoy' using errcode = 'P0001';
  end if;
  select * into r from public.corregir_practica(p_pregunta, p_respuesta);
  update public.repaso set
    caja = case when r.es_correcta then least(5, caja + 1) else 1 end,
    proxima = public.hoy_ar() + case when r.es_correcta then public.intervalo_repaso(least(5, caja + 1)) else 1 end,
    aciertos = aciertos + case when r.es_correcta then 1 else 0 end,
    fallos = fallos + case when r.es_correcta then 0 else 1 end,
    updated_at = clock_timestamp()
  where usuario_id = auth.uid() and pregunta_id = p_pregunta;
  insert into public.repaso_dias (usuario_id, dia, respuestas) values (auth.uid(), public.hoy_ar(), 1)
  on conflict (usuario_id, dia) do update set respuestas = public.repaso_dias.respuestas + 1;
  return query select r.es_correcta, r.explicacion_md, r.solucion;
end $$;

-- Pendientes de hoy, hechas hoy y racha de días seguidos (termina hoy o ayer)
create or replace function public.mi_repaso()
returns table (pendientes int, hechas_hoy int, racha int)
language sql stable security definer set search_path = '' as $$
  with dias as (
    select d.dia, d.dia - (row_number() over (order by d.dia))::int as grupo
    from public.repaso_dias d where d.usuario_id = auth.uid()
  ),
  ultima as (
    select count(*)::int as n, max(dia) as fin from dias group by grupo order by max(dia) desc limit 1
  )
  select (select count(*)::int from public.pozo_repaso()),
         coalesce((select d.respuestas from public.repaso_dias d where d.usuario_id = auth.uid() and d.dia = public.hoy_ar()), 0),
         coalesce((select n from ultima where fin >= public.hoy_ar() - 1), 0)
$$;

revoke all on function public.intervalo_repaso(int), public.corregir_practica(uuid, jsonb), public.pozo_repaso() from public, anon, authenticated;
revoke all on function public.repaso_de_hoy(), public.responder_repaso(uuid, jsonb), public.mi_repaso() from public, anon;
grant execute on function public.repaso_de_hoy(), public.responder_repaso(uuid, jsonb), public.mi_repaso() to authenticated;
