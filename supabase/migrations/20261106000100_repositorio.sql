-- PEA · Etapa 2 · Esquema del repositorio (spec §4.1 y §5.3)

create type public.alcance as enum ('global', 'sede');
create type public.estado_contenido as enum ('borrador', 'publicado', 'archivado');
create type public.tipo_recurso as enum ('imagen', 'video', 'pdf', 'presentacion', 'enlace', 'otro');

create table public.categorias (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  nombre text not null,
  descripcion text not null default '',
  icono text,
  orden int not null default 0,
  padre_id uuid references public.categorias (id),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.articulos (
  id uuid primary key default gen_random_uuid(),
  categoria_id uuid not null references public.categorias (id),
  padre_id uuid references public.articulos (id) on delete set null,
  orden int not null default 0,
  slug text not null,
  titulo text not null,
  resumen text not null default '',
  cuerpo_md text not null default '',
  version int not null default 1,
  ultimo_cambio text,
  alcance public.alcance not null default 'global',
  sede_id uuid references public.sedes (id),
  sede_origen_id uuid references public.sedes (id),
  estado public.estado_contenido not null default 'borrador',
  vigente_desde date,
  vigente_hasta date,
  fuente_url text,
  autor_id uuid references public.perfiles (id) on delete set null,
  promovido_por uuid references public.perfiles (id) on delete set null,
  promovido_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (categoria_id, slug),
  constraint articulos_alcance_sede check ((alcance = 'sede') = (sede_id is not null)),
  constraint articulos_vigencia check (vigente_hasta is null or vigente_desde is null or vigente_hasta >= vigente_desde)
);

create table public.articulo_versiones (
  id uuid primary key default gen_random_uuid(),
  articulo_id uuid not null references public.articulos (id) on delete cascade,
  version int not null,
  titulo text not null,
  cuerpo_md text not null,
  resumen_cambio text,
  autor_id uuid references public.perfiles (id) on delete set null,
  created_at timestamptz not null default now(),
  unique (articulo_id, version)
);

create table public.campanas (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  descripcion_md text not null default '',
  vigente_desde date,
  vigente_hasta date,
  alcance public.alcance not null default 'global',
  sede_id uuid references public.sedes (id),
  sede_origen_id uuid references public.sedes (id),
  estado public.estado_contenido not null default 'borrador',
  autor_id uuid references public.perfiles (id) on delete set null,
  promovido_por uuid references public.perfiles (id) on delete set null,
  promovido_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint campanas_alcance_sede check ((alcance = 'sede') = (sede_id is not null)),
  constraint campanas_vigencia check (vigente_hasta is null or vigente_desde is null or vigente_hasta >= vigente_desde)
);

create table public.recursos (
  id uuid primary key default gen_random_uuid(),
  categoria_id uuid not null references public.categorias (id),
  campana_id uuid references public.campanas (id) on delete set null,
  titulo text not null,
  descripcion text not null default '',
  tipo public.tipo_recurso not null,
  archivo_path text,
  url_externa text,
  miniatura_path text,
  etiquetas text[] not null default '{}',
  alcance public.alcance not null default 'global',
  sede_id uuid references public.sedes (id),
  sede_origen_id uuid references public.sedes (id),
  estado public.estado_contenido not null default 'borrador',
  vigente_hasta date,
  autor_id uuid references public.perfiles (id) on delete set null,
  promovido_por uuid references public.perfiles (id) on delete set null,
  promovido_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint recursos_alcance_sede check ((alcance = 'sede') = (sede_id is not null)),
  constraint recursos_origen check (archivo_path is not null or url_externa is not null)
);

create index articulos_categoria_idx on public.articulos (categoria_id, padre_id, orden);
create index articulos_sede_idx on public.articulos (sede_id);
create index recursos_categoria_idx on public.recursos (categoria_id);
create index recursos_campana_idx on public.recursos (campana_id);
create index recursos_sede_idx on public.recursos (sede_id);

create trigger tocar_updated_at before update on public.categorias for each row execute function public.tocar_updated_at();
create trigger tocar_updated_at before update on public.articulos for each row execute function public.tocar_updated_at();
create trigger tocar_updated_at before update on public.campanas for each row execute function public.tocar_updated_at();
create trigger tocar_updated_at before update on public.recursos for each row execute function public.tocar_updated_at();

-- El artículo padre tiene que ser de la misma categoría (y no puede ser él mismo).
create or replace function public.validar_padre_articulo() returns trigger
language plpgsql set search_path = '' as $$
begin
  if new.padre_id is not null then
    if new.padre_id = new.id or not exists (
      select 1 from public.articulos p where p.id = new.padre_id and p.categoria_id = new.categoria_id
    ) then
      raise exception 'integridad: el artículo padre es de otra categoría' using errcode = 'P0001';
    end if;
  end if;
  return new;
end $$;

create trigger validar_padre_articulo before insert or update of padre_id, categoria_id on public.articulos
  for each row execute function public.validar_padre_articulo();

-- Versionado: al cambiar título o cuerpo se guarda la versión anterior y se sube el número.
create or replace function public.versionar_articulo() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if new.titulo is distinct from old.titulo or new.cuerpo_md is distinct from old.cuerpo_md then
    insert into public.articulo_versiones (articulo_id, version, titulo, cuerpo_md, resumen_cambio, autor_id)
    values (old.id, old.version, old.titulo, old.cuerpo_md, new.ultimo_cambio, coalesce(auth.uid(), old.autor_id));
    new.version := old.version + 1;
  end if;
  new.ultimo_cambio := null;
  return new;
end $$;

create trigger versionar_articulo before update on public.articulos
  for each row execute function public.versionar_articulo();

-- Categorías iniciales (datos de referencia, spec §4.1)
insert into public.categorias (slug, nombre, descripcion, orden) values
  ('institucional', 'Institucional', 'CAU y sus asesores, organigrama, división de roles', 1),
  ('reglamento', 'Reglamento', 'Un único documento dividido en secciones', 2),
  ('plataformas', 'Plataformas', 'Portal de estudiantes, campus virtual, Canvas, Excel de servicios, HubSpot, base de conocimiento, portal de equivalencias, matrices, Teams, Power BI, Klarway', 3),
  ('oferta-academica', 'Oferta académica', 'Carreras, planes, títulos, doble titulación, articulaciones, APLV', 4),
  ('modalidades', 'Modalidades', 'Educación Distribuida Home (distancia), Educación Distribuida (híbrida), Presencial Distribuida', 5),
  ('tramites', 'Trámites', 'Inscripción, reinscripción, equivalencias, certificados, bajas, cambio de carrera, exámenes, creación y seguimiento de tickets', 6),
  ('aranceles-y-pagos', 'Aranceles y pagos', 'Cuotas, medios de pago, becas, descuentos, convenios, beneficios', 7),
  ('ventas-y-asesoramiento', 'Ventas y asesoramiento', 'Guiones, objeciones, seguimiento de leads', 8),
  ('campanas-y-piezas', 'Campañas y piezas', 'Campañas vigentes con sus imágenes y videos', 9),
  ('atencion-y-derivaciones', 'Atención y derivaciones', 'Qué resuelve el CAU, qué se deriva y a qué área', 10);
