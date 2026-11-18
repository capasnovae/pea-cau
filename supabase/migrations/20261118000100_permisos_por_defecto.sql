-- Los proyectos nuevos de Supabase ya no dan permisos por defecto a anon/authenticated/service_role sobre las
-- tablas que se crean en public (el proyecto de producción de 2026-11-18 vino así y nadie podía leer su perfil).
-- Se vuelven a fijar los permisos por defecto para las tablas, secuencias y funciones FUTURAS, como en el stack
-- local. No toca los objetos que ya existen: sus permisos (incluidos los que se quitaron a propósito) quedan igual.
-- La seguridad de los datos la sigue dando RLS en cada tabla.
alter default privileges for role postgres in schema public grant all on tables to anon, authenticated, service_role;
alter default privileges for role postgres in schema public grant all on sequences to anon, authenticated, service_role;
alter default privileges for role postgres in schema public grant execute on functions to anon, authenticated, service_role;
