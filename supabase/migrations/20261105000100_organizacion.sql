-- PEA · Etapa 1 · Esquema de organización (spec §5, "Organización")

create type public.rol_app as enum ('asesor', 'lider', 'coordinador', 'director', 'admin');
create type public.area as enum ('servicio', 'ventas');

create or replace function public.tocar_updated_at() returns trigger
language plpgsql set search_path = '' as $$
begin
  new.updated_at := now();
  return new;
end $$;

create table public.sedes (
  id uuid primary key default gen_random_uuid(),
  nombre text not null unique,
  ciudad text not null,
  direccion text,
  activa boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.puestos (
  id uuid primary key default gen_random_uuid(),
  nombre text not null unique,
  area public.area,
  descripcion_md text not null default '',
  orden int not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.subroles (
  id uuid primary key default gen_random_uuid(),
  nombre text not null unique,
  area public.area not null,
  descripcion_md text not null default '',
  orden int not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.perfiles (
  id uuid primary key references auth.users (id) on delete cascade,
  nombre text not null,
  apellido text not null default '',
  email text not null unique,
  telefono text,
  rol public.rol_app not null default 'asesor',
  area public.area,
  sede_id uuid references public.sedes (id),
  equipo_id uuid,
  puesto_id uuid references public.puestos (id),
  fecha_ingreso date,
  experiencia_previa boolean not null default false,
  ubicacion_habilitada_por uuid references public.perfiles (id),
  ubicacion_rendida_at timestamptz,
  avatar_path text,
  activo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.equipos (
  id uuid primary key default gen_random_uuid(),
  sede_id uuid not null references public.sedes (id),
  area public.area not null,
  nombre text not null,
  lider_id uuid references public.perfiles (id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (sede_id, nombre)
);

alter table public.perfiles
  add constraint perfiles_equipo_id_fkey foreign key (equipo_id) references public.equipos (id) on delete set null;

create table public.perfil_subroles (
  perfil_id uuid not null references public.perfiles (id) on delete cascade,
  subrol_id uuid not null references public.subroles (id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (perfil_id, subrol_id)
);

create table public.areas_derivacion (
  id uuid primary key default gen_random_uuid(),
  nombre text not null unique,
  que_resuelve_md text not null default '',
  que_no_resuelve_md text not null default '',
  canal_contacto text not null default '',
  plazo_esperado text not null default '',
  orden int not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.auditoria (
  id uuid primary key default gen_random_uuid(),
  actor_id uuid,
  accion text not null,
  entidad text not null,
  entidad_id uuid,
  datos jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index perfiles_sede_area_idx on public.perfiles (sede_id, area);
create index perfiles_equipo_idx on public.perfiles (equipo_id);
create index equipos_lider_idx on public.equipos (lider_id);
create index auditoria_entidad_idx on public.auditoria (entidad, entidad_id);

create trigger tocar_updated_at before update on public.sedes for each row execute function public.tocar_updated_at();
create trigger tocar_updated_at before update on public.puestos for each row execute function public.tocar_updated_at();
create trigger tocar_updated_at before update on public.subroles for each row execute function public.tocar_updated_at();
create trigger tocar_updated_at before update on public.equipos for each row execute function public.tocar_updated_at();
create trigger tocar_updated_at before update on public.perfiles for each row execute function public.tocar_updated_at();
create trigger tocar_updated_at before update on public.areas_derivacion for each row execute function public.tocar_updated_at();
