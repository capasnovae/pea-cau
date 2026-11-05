-- PEA · Etapa 4 · Esquema de cursos (spec §4.3 y §5.4)

create type public.tipo_curso as enum ('nivel', 'capacitacion');
create type public.tipo_item as enum ('articulo', 'recurso', 'pagina', 'video', 'enlace', 'examen');
create type public.requisito_item as enum ('ninguno', 'ver', 'marcar_hecho', 'aprobar');

create table public.cursos (
  id uuid primary key default gen_random_uuid(),
  tipo public.tipo_curso not null,
  nivel_orden int unique,
  titulo text not null,
  descripcion_md text not null default '',
  portada_path text,
  vigencia_meses int,
  alcance public.alcance not null default 'global',
  sede_id uuid references public.sedes (id),
  sede_origen_id uuid references public.sedes (id),
  estado public.estado_contenido not null default 'borrador',
  autor_id uuid references public.perfiles (id) on delete set null,
  promovido_por uuid references public.perfiles (id) on delete set null,
  promovido_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint cursos_alcance_sede check ((alcance = 'sede') = (sede_id is not null)),
  constraint cursos_nivel check ((tipo = 'nivel') = (nivel_orden is not null) and (nivel_orden is null or nivel_orden between 1 and 9)),
  constraint cursos_nivel_global check (tipo <> 'nivel' or alcance = 'global'),
  constraint cursos_vigencia check (vigencia_meses is null or vigencia_meses between 1 and 120)
);

create table public.ruta_cursos (
  id uuid primary key default gen_random_uuid(),
  curso_id uuid not null references public.cursos (id) on delete cascade,
  puesto_id uuid references public.puestos (id) on delete cascade,
  subrol_id uuid references public.subroles (id) on delete cascade,
  obligatorio boolean not null default true,
  created_at timestamptz not null default now(),
  constraint ruta_cursos_destino check ((puesto_id is null) <> (subrol_id is null))
);
create unique index ruta_cursos_unica on public.ruta_cursos (curso_id, coalesce(puesto_id, subrol_id));

create table public.modulos (
  id uuid primary key default gen_random_uuid(),
  curso_id uuid not null references public.cursos (id) on delete cascade,
  orden int not null default 0,
  titulo text not null,
  descripcion_md text not null default '',
  avance_secuencial boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.modulo_prerrequisitos (
  modulo_id uuid not null references public.modulos (id) on delete cascade,
  requiere_modulo_id uuid not null references public.modulos (id) on delete cascade,
  primary key (modulo_id, requiere_modulo_id),
  constraint modulo_prerrequisitos_no_propio check (modulo_id <> requiere_modulo_id)
);

create table public.items (
  id uuid primary key default gen_random_uuid(),
  modulo_id uuid not null references public.modulos (id) on delete cascade,
  orden int not null default 0,
  titulo text not null,
  tipo public.tipo_item not null,
  articulo_id uuid references public.articulos (id) on delete restrict,
  recurso_id uuid references public.recursos (id) on delete restrict,
  examen_id uuid,
  contenido_md text,
  url text,
  requisito public.requisito_item not null default 'ver',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint items_por_tipo check (
    (tipo = 'articulo' and articulo_id is not null)
    or (tipo = 'recurso' and recurso_id is not null)
    or (tipo = 'pagina' and coalesce(trim(contenido_md), '') <> '')
    or (tipo = 'video' and (url is not null or recurso_id is not null))
    or (tipo = 'enlace' and url is not null)
    or tipo = 'examen'
  ),
  constraint items_url_http check (url is null or url ~* '^https?://'),
  constraint items_requisito check (requisito <> 'aprobar' or tipo = 'examen')
);

create table public.item_progreso (
  usuario_id uuid not null references public.perfiles (id) on delete cascade,
  item_id uuid not null references public.items (id) on delete cascade,
  visto_at timestamptz,
  hecho_at timestamptz,
  created_at timestamptz not null default now(),
  primary key (usuario_id, item_id)
);

create index modulos_curso_idx on public.modulos (curso_id, orden);
create index items_modulo_idx on public.items (modulo_id, orden);
create index item_progreso_item_idx on public.item_progreso (item_id);

create trigger tocar_updated_at before update on public.cursos for each row execute function public.tocar_updated_at();
create trigger tocar_updated_at before update on public.modulos for each row execute function public.tocar_updated_at();
create trigger tocar_updated_at before update on public.items for each row execute function public.tocar_updated_at();

create or replace function public.validar_prerrequisito() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if (select curso_id from public.modulos where id = new.modulo_id)
     is distinct from (select curso_id from public.modulos where id = new.requiere_modulo_id) then
    raise exception 'integridad: el prerrequisito es de otro curso' using errcode = 'P0001';
  end if;
  return new;
end $$;

create trigger validar_prerrequisito before insert or update on public.modulo_prerrequisitos
  for each row execute function public.validar_prerrequisito();
