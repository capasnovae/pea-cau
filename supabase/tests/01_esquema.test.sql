begin;
select plan(16);

select has_table('public', t, 'existe la tabla ' || t)
from unnest(array['sedes','puestos','subroles','equipos','perfiles','perfil_subroles','areas_derivacion','auditoria']) t;

select has_type('public', 'rol_app', 'existe el enum rol_app');
select enum_has_labels('public', 'rol_app', array['asesor','lider','coordinador','director','admin'], 'labels de rol_app');
select enum_has_labels('public', 'area', array['servicio','ventas'], 'labels de area');
select col_default_is('public', 'perfiles', 'rol', 'asesor', 'rol por defecto asesor');
select fk_ok('public', 'equipos', 'sede_id', 'public', 'sedes', 'id', 'equipos.sede_id → sedes');
select fk_ok('public', 'perfiles', 'id', 'auth', 'users', 'id', 'perfiles.id → auth.users');
select has_trigger('public', 'perfiles', 'tocar_updated_at', 'perfiles actualiza updated_at');
select has_trigger('public', 'equipos', 'tocar_updated_at', 'equipos actualiza updated_at');

select * from finish();
rollback;
