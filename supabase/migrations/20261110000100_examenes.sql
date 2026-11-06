-- PEA · Etapa 6 · Banco de preguntas, exámenes, intentos y certificaciones (spec §4.4, §5)

create type public.tipo_pregunta as enum
  ('opcion_multiple', 'verdadero_falso', 'escenario', 'ordenar', 'simulacion', 'libre', 'clasificar', 'formulario');
create type public.tipo_examen as enum ('modulo', 'categoria', 'nivel', 'integrador', 'ubicacion', 'practica');
create type public.uso_pregunta as enum ('examen', 'practica');
create type public.origen_pregunta as enum ('manual', 'ia');
create type public.estado_intento as enum ('en_curso', 'pendiente_correccion', 'cerrado');
create type public.origen_certificacion as enum ('examen', 'ubicacion');
create type public.estado_certificacion as enum ('vigente', 'vencida', 'revocada');
alter type public.tipo_item add value if not exists 'practica';

create table public.casos (
  id uuid primary key default gen_random_uuid(),
  titulo text not null check (char_length(titulo) between 1 and 150),
  contexto_md text not null default '',
  categoria_id uuid references public.categorias (id),
  alcance public.alcance not null default 'global',
  sede_id uuid references public.sedes (id),
  sede_origen_id uuid references public.sedes (id),
  estado public.estado_contenido not null default 'borrador',
  autor_id uuid references public.perfiles (id) on delete set null,
  promovido_por uuid references public.perfiles (id) on delete set null,
  promovido_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint casos_alcance_sede check ((alcance = 'sede') = (sede_id is not null))
);

create table public.preguntas (
  id uuid primary key default gen_random_uuid(),
  tipo public.tipo_pregunta not null,
  enunciado_md text not null check (char_length(enunciado_md) between 1 and 4000),
  contexto_md text,
  caso_id uuid references public.casos (id) on delete cascade,
  orden_en_caso int,
  explicacion_md text not null default '',
  rubrica_md text,
  puntaje_max int not null default 1 check (puntaje_max between 1 and 100),
  dificultad int not null default 1 check (dificultad between 1 and 3),
  modulo_id uuid references public.modulos (id) on delete set null,
  categoria_id uuid references public.categorias (id),
  articulo_fuente_id uuid references public.articulos (id) on delete set null,
  uso public.uso_pregunta not null default 'examen',
  config jsonb,
  solucion jsonb,
  estado public.estado_contenido not null default 'borrador',
  origen public.origen_pregunta not null default 'manual',
  alcance public.alcance not null default 'global',
  sede_id uuid references public.sedes (id),
  sede_origen_id uuid references public.sedes (id),
  autor_id uuid references public.perfiles (id) on delete set null,
  aprobada_por uuid references public.perfiles (id) on delete set null,
  aprobada_at timestamptz,
  promovido_por uuid references public.perfiles (id) on delete set null,
  promovido_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint preguntas_alcance_sede check ((alcance = 'sede') = (sede_id is not null)),
  constraint preguntas_simulacion check (tipo <> 'simulacion' or (caso_id is not null and orden_en_caso is not null)),
  constraint preguntas_libre check (tipo <> 'libre' or coalesce(btrim(rubrica_md), '') <> ''),
  constraint preguntas_clasificar check (tipo <> 'clasificar' or (config ? 'columnas')),
  constraint preguntas_formulario check (tipo <> 'formulario' or (config ? 'campos' and solucion is not null))
);
create index preguntas_modulo_idx on public.preguntas (modulo_id) where estado = 'publicado';
create index preguntas_categoria_idx on public.preguntas (categoria_id) where estado = 'publicado';
create index preguntas_caso_idx on public.preguntas (caso_id, orden_en_caso);

create table public.opciones (
  id uuid primary key default gen_random_uuid(),
  pregunta_id uuid not null references public.preguntas (id) on delete cascade,
  texto text not null check (char_length(texto) between 1 and 500),
  es_correcta boolean not null default false,
  posicion_correcta int,
  grupo text,
  orden int not null default 0
);
create index opciones_pregunta_idx on public.opciones (pregunta_id, orden);

create table public.examenes (
  id uuid primary key default gen_random_uuid(),
  titulo text not null check (char_length(titulo) between 1 and 150),
  tipo public.tipo_examen not null,
  modulo_id uuid references public.modulos (id) on delete set null,
  categoria_id uuid references public.categorias (id),
  curso_id uuid references public.cursos (id) on delete set null,
  cantidad_preguntas int not null default 10 check (cantidad_preguntas between 1 and 100),
  nota_minima int not null default 80 check (nota_minima between 1 and 100),
  max_intentos int not null default 3 check (max_intentos between 1 and 10),
  espera_horas int not null default 24 check (espera_horas between 0 and 720),
  tiempo_limite_min int check (tiempo_limite_min between 1 and 300),
  mezclar boolean not null default true,
  alcance public.alcance not null default 'global',
  sede_id uuid references public.sedes (id),
  sede_origen_id uuid references public.sedes (id),
  estado public.estado_contenido not null default 'borrador',
  autor_id uuid references public.perfiles (id) on delete set null,
  promovido_por uuid references public.perfiles (id) on delete set null,
  promovido_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint examenes_alcance_sede check ((alcance = 'sede') = (sede_id is not null)),
  constraint examenes_referencia check (
    (tipo <> 'modulo' or modulo_id is not null)
    and (tipo <> 'categoria' or categoria_id is not null)
    and (tipo <> 'nivel' or curso_id is not null))
);

create table public.examen_fuentes (
  id uuid primary key default gen_random_uuid(),
  examen_id uuid not null references public.examenes (id) on delete cascade,
  modulo_id uuid references public.modulos (id) on delete cascade,
  categoria_id uuid references public.categorias (id) on delete cascade,
  curso_id uuid references public.cursos (id) on delete cascade,
  cantidad int check (cantidad between 1 and 100),
  constraint examen_fuentes_una check (num_nonnulls(modulo_id, categoria_id, curso_id) = 1)
);

create table public.intentos (
  id uuid primary key default gen_random_uuid(),
  usuario_id uuid not null references public.perfiles (id) on delete cascade,
  examen_id uuid not null references public.examenes (id) on delete cascade,
  sede_id uuid references public.sedes (id),
  area public.area,
  equipo_id uuid references public.equipos (id) on delete set null,
  ciclo int not null default 1,
  iniciado_at timestamptz not null default now(),
  vence_at timestamptz,
  entregado_at timestamptz,
  estado public.estado_intento not null default 'en_curso',
  puntaje_auto numeric,
  puntaje_manual numeric,
  nota int check (nota between 0 and 100),
  aprobado boolean,
  bloque_nivel int,
  corrector_id uuid references public.perfiles (id) on delete set null,
  tomado_at timestamptz,
  correccion_vence_at timestamptz,
  cerrado_at timestamptz
);
create index intentos_usuario_idx on public.intentos (usuario_id, examen_id);
create index intentos_cola_idx on public.intentos (sede_id, correccion_vence_at) where estado = 'pendiente_correccion';
create unique index intentos_uno_en_curso on public.intentos (usuario_id, examen_id) where estado = 'en_curso';

create table public.intento_preguntas (
  intento_id uuid not null references public.intentos (id) on delete cascade,
  pregunta_id uuid not null references public.preguntas (id),
  orden int not null,
  orden_opciones uuid[] not null default '{}',
  primary key (intento_id, pregunta_id)
);

create table public.respuestas (
  id uuid primary key default gen_random_uuid(),
  intento_id uuid not null references public.intentos (id) on delete cascade,
  pregunta_id uuid not null references public.preguntas (id),
  opcion_ids uuid[],
  orden_respuesta uuid[],
  texto_libre text check (char_length(texto_libre) <= 5000),
  valores jsonb,
  es_correcta boolean,
  puntaje numeric,
  devolucion_md text,
  corregida_por uuid references public.perfiles (id) on delete set null,
  corregida_at timestamptz,
  ia_puntaje_sugerido numeric,
  ia_justificacion text,
  updated_at timestamptz not null default now(),
  unique (intento_id, pregunta_id)
);

create table public.certificaciones (
  id uuid primary key default gen_random_uuid(),
  usuario_id uuid not null references public.perfiles (id) on delete cascade,
  curso_id uuid not null references public.cursos (id) on delete cascade,
  origen public.origen_certificacion not null,
  intento_id uuid references public.intentos (id) on delete set null,
  emitida_at timestamptz not null default now(),
  vence_at timestamptz,
  estado public.estado_certificacion not null default 'vigente',
  codigo_verificacion text not null unique default upper(substr(md5(gen_random_uuid()::text), 1, 10)),
  pdf_path text
);
create index certificaciones_usuario_idx on public.certificaciones (usuario_id, curso_id);

create table public.practica_progreso (
  usuario_id uuid not null default auth.uid() references public.perfiles (id) on delete cascade,
  pregunta_id uuid not null references public.preguntas (id) on delete cascade,
  acertada_at timestamptz not null default now(),
  primary key (usuario_id, pregunta_id)
);

-- Pasos de curso que apuntan a un examen
alter table public.items add constraint items_examen_fk foreign key (examen_id) references public.examenes (id) on delete set null;
alter table public.items drop constraint items_sin_aprobar_hasta_examenes;

-- Opciones: la posición correcta solo existe en "ordenar"
create or replace function public.validar_opcion() returns trigger
language plpgsql set search_path = '' as $$
begin
  if new.posicion_correcta is not null
     and (select tipo from public.preguntas where id = new.pregunta_id) <> 'ordenar' then
    raise exception 'integridad: posición correcta solo en preguntas para ordenar' using errcode = 'P0001';
  end if;
  return new;
end $$;
create trigger validar_opcion before insert or update on public.opciones
  for each row execute function public.validar_opcion();

-- Autoría, promoción y updated_at como el resto del contenido
create trigger fijar_autoria_contenido before insert on public.casos for each row execute function public.fijar_autoria_contenido();
create trigger fijar_autoria_contenido before insert on public.preguntas for each row execute function public.fijar_autoria_contenido();
create trigger fijar_autoria_contenido before insert on public.examenes for each row execute function public.fijar_autoria_contenido();
create trigger proteger_promocion before update on public.casos for each row execute function public.proteger_promocion();
create trigger proteger_promocion before update on public.preguntas for each row execute function public.proteger_promocion();
create trigger proteger_promocion before update on public.examenes for each row execute function public.proteger_promocion();
create trigger tocar_updated_at before update on public.casos for each row execute function public.tocar_updated_at();
create trigger tocar_updated_at before update on public.preguntas for each row execute function public.tocar_updated_at();
create trigger tocar_updated_at before update on public.examenes for each row execute function public.tocar_updated_at();

create or replace function public.puede_editar_pregunta(p_pregunta uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((select public.puede_editar_contenido(p.alcance, p.sede_id) from public.preguntas p where p.id = p_pregunta), false)
$$;
create or replace function public.puede_editar_examen(p_examen uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((select public.puede_editar_contenido(e.alcance, e.sede_id) from public.examenes e where e.id = p_examen), false)
$$;
create or replace function public.puede_ver_intento(p_intento uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((select i.usuario_id = auth.uid() or public.puede_ver_usuario(i.usuario_id)
                   from public.intentos i where i.id = p_intento), false) and public.mi_perfil_activo()
$$;
revoke all on function public.puede_editar_pregunta(uuid), public.puede_editar_examen(uuid), public.puede_ver_intento(uuid) from public, anon;
grant execute on function public.puede_editar_pregunta(uuid), public.puede_editar_examen(uuid), public.puede_ver_intento(uuid) to authenticated;

-- RLS
alter table public.casos enable row level security;
alter table public.preguntas enable row level security;
alter table public.opciones enable row level security;
alter table public.examenes enable row level security;
alter table public.examen_fuentes enable row level security;
alter table public.intentos enable row level security;
alter table public.intento_preguntas enable row level security;
alter table public.respuestas enable row level security;
alter table public.certificaciones enable row level security;
alter table public.practica_progreso enable row level security;
revoke all on public.casos, public.preguntas, public.opciones, public.examenes, public.examen_fuentes, public.intentos,
  public.intento_preguntas, public.respuestas, public.certificaciones, public.practica_progreso from anon;

-- Banco: solo quien edita (el asesor lo ve vía RPC, sin soluciones)
create policy casos_editar on public.casos for all to authenticated
  using (public.puede_editar_contenido(alcance, sede_id)) with check (public.puede_editar_contenido(alcance, sede_id));
create policy preguntas_editar on public.preguntas for all to authenticated
  using (public.puede_editar_contenido(alcance, sede_id)) with check (public.puede_editar_contenido(alcance, sede_id));
create policy opciones_editar on public.opciones for all to authenticated
  using (public.puede_editar_pregunta(pregunta_id)) with check (public.puede_editar_pregunta(pregunta_id));

-- Exámenes: la configuración la lee quien puede leer el contenido
create policy examenes_leer on public.examenes for select to authenticated using (public.puede_leer_contenido(alcance, sede_id, estado));
create policy examenes_crear on public.examenes for insert to authenticated with check (public.puede_editar_contenido(alcance, sede_id));
create policy examenes_editar on public.examenes for update to authenticated
  using (public.puede_editar_contenido(alcance, sede_id)) with check (public.puede_editar_contenido(alcance, sede_id));
create policy examenes_borrar on public.examenes for delete to authenticated using (public.puede_editar_contenido(alcance, sede_id));
create policy fuentes_leer on public.examen_fuentes for select to authenticated using (public.puede_editar_examen(examen_id));
create policy fuentes_editar on public.examen_fuentes for all to authenticated
  using (public.puede_editar_examen(examen_id)) with check (public.puede_editar_examen(examen_id));

-- Intentos y respuestas: lectura propia o de quien ve al usuario; escritura solo por RPC
create policy intentos_leer on public.intentos for select to authenticated using (public.puede_ver_intento(id));
create policy intento_preguntas_leer on public.intento_preguntas for select to authenticated using (public.puede_ver_intento(intento_id));
create policy respuestas_leer on public.respuestas for select to authenticated using (public.puede_ver_intento(intento_id));
create policy certificaciones_leer on public.certificaciones for select to authenticated
  using ((usuario_id = auth.uid() or public.puede_ver_usuario(usuario_id)) and public.mi_perfil_activo());
create policy practica_leer on public.practica_progreso for select to authenticated using (usuario_id = auth.uid());

-- Promoción: suma preguntas, casos y exámenes
create or replace function public.promover_contenido(p_tabla text, p_id uuid) returns void
language plpgsql security definer set search_path = '' as $$
declare v_filas int;
begin
  if public.mi_rol() is distinct from 'admin' then
    raise exception 'no_autorizado: solo el admin promueve' using errcode = 'P0001';
  end if;
  if p_tabla not in ('articulos', 'recursos', 'campanas', 'cursos', 'preguntas', 'casos', 'examenes') then
    raise exception 'tabla inválida' using errcode = '22023';
  end if;
  if p_tabla = 'cursos' and exists (
    select 1 from public.items i join public.modulos m on m.id = i.modulo_id
    left join public.articulos a on a.id = i.articulo_id
    left join public.recursos r on r.id = i.recurso_id
    where m.curso_id = p_id and (a.alcance = 'sede' or r.alcance = 'sede')
  ) then
    raise exception 'integridad: el curso usa contenido de sede; promové ese contenido primero' using errcode = 'P0001';
  end if;
  perform set_config('pea.promoviendo', 'si', true);
  execute format(
    'update public.%I set alcance = ''global'', sede_id = null, promovido_por = $1, promovido_at = now()
     where id = $2 and alcance = ''sede''', p_tabla)
  using auth.uid(), p_id;
  get diagnostics v_filas = row_count;
  perform set_config('pea.promoviendo', '', true);
  if v_filas = 0 then
    raise exception 'no se encontró contenido de sede para promover' using errcode = 'P0002';
  end if;
  insert into public.auditoria (actor_id, accion, entidad, entidad_id)
  values (auth.uid(), 'promover', p_tabla, p_id);
end $$;
