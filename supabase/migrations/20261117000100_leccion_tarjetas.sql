-- Lecciones por tarjetas (versión 2): {"version": 2, "tarjetas": [...]}.
-- Mismos topes que lib/dominio/lecciones.ts (LIMITES_TARJETAS). La versión 1 (bloques) sigue siendo válida.

create or replace function public.texto_ok(x jsonb, max int) returns boolean
language sql immutable set search_path = '' as $$
  select jsonb_typeof(x) = 'string' and char_length(btrim(x #>> '{}')) between 1 and max
$$;

create or replace function public.tarjeta_valida(t jsonb) returns boolean
language sql immutable set search_path = '' as $$
  select coalesce(jsonb_typeof(t) = 'object' and case t ->> 'tipo'
    when 'video' then public.texto_ok(t -> 'ruta', 200)
    when 'caso' then public.texto_ok(t -> 'persona', 80) and t ->> 'canal' in ('mostrador', 'telefono', 'whatsapp')
                     and public.texto_ok(t -> 'consulta', 300)
    when 'preguntar' then jsonb_typeof(t -> 'opciones') = 'array'
                     and jsonb_array_length(t -> 'opciones') between 3 and 5
                     and (select bool_and(public.texto_ok(o -> 'texto', 120) and public.texto_ok(o -> 'porque', 200)
                                          and jsonb_typeof(o -> 'clave') = 'boolean')
                          from jsonb_array_elements(t -> 'opciones') o)
                     and exists (select 1 from jsonb_array_elements(t -> 'opciones') o where (o ->> 'clave')::boolean)
    when 'idea' then public.texto_ok(t -> 'titulo', 80) and public.texto_ok(t -> 'texto', 500)
                     and public.texto_ok(t -> 'clave', 120)
                     and (t -> 'ejemplo' is null or public.texto_ok(t -> 'ejemplo', 500))
    when 'probalo' then jsonb_typeof(t -> 'n') = 'number' and (t ->> 'n')::numeric in (1, 2, 3)
    when 'ojo' then public.texto_ok(t -> 'texto', 500)
    when 'cierre' then public.texto_ok(t -> 'resolucion', 500) and public.texto_ok(t -> 'recordar', 120)
    else false end, false)
$$;

create or replace function public.leccion_valida(l jsonb) returns boolean
language sql immutable set search_path = '' as $$
  select coalesce(case when l ->> 'version' = '2' then
    jsonb_typeof(l -> 'tarjetas') = 'array'
    and jsonb_array_length(l -> 'tarjetas') between 5 and 10
    and (select bool_and(public.tarjeta_valida(t)) from jsonb_array_elements(l -> 'tarjetas') t)
    and (select count(*) from jsonb_array_elements(l -> 'tarjetas') t where t ->> 'tipo' = 'caso') = 1
    and (select count(*) from jsonb_array_elements(l -> 'tarjetas') t where t ->> 'tipo' = 'cierre') = 1
    and l -> 'tarjetas' -> -1 ->> 'tipo' = 'cierre'
    and (select count(*) from jsonb_array_elements(l -> 'tarjetas') with ordinality as x(t, n)
         where t ->> 'tipo' = 'video' and n <> 1) = 0
  else
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
                  from jsonb_array_elements(coalesce(l -> 'ojo', '[]'::jsonb)) x), true)
  end, false)
$$;

revoke all on function public.texto_ok(jsonb, int), public.tarjeta_valida(jsonb) from public, anon;
grant execute on function public.texto_ok(jsonb, int), public.tarjeta_valida(jsonb) to authenticated;
