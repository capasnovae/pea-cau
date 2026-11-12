-- Lecciones por tarjetas (versión 2): la base acepta el formato nuevo y sigue aceptando el de bloques
begin;
select plan(7);

create temp table v2 as select '{"version":2,"tarjetas":[
  {"tipo":"video","ruta":"lecciones/05.mp4"},
  {"tipo":"caso","persona":"Lucía","canal":"whatsapp","consulta":"Me quiero pasar a ED"},
  {"tipo":"preguntar","opciones":[{"texto":"¿Final anotado?","clave":true,"porque":"Bloquea el pase"},
                                  {"texto":"¿Cuántos pases?","clave":true,"porque":"Máximo 2"},
                                  {"texto":"¿Color favorito?","clave":false,"porque":"No importa"}]},
  {"tipo":"idea","titulo":"Cuándo","texto":"En fecha del calendario.","clave":"Solo en fecha."},
  {"tipo":"probalo","n":1},
  {"tipo":"ojo","texto":"Libre por Nota no se conserva."},
  {"tipo":"cierre","resolucion":"Primero rinde y después pide.","recordar":"Sin mesas pendientes."}]}'::jsonb as l;

select ok(public.leccion_valida((select l from v2)), 'acepta una lección por tarjetas válida');
select ok(not public.leccion_valida(jsonb_set((select l from v2), '{tarjetas}', ((select l from v2)->'tarjetas') - 0 - 0 - 0)),
  'pide al menos 5 tarjetas');
select ok(not public.leccion_valida(jsonb_set((select l from v2), '{tarjetas,3,texto}', to_jsonb(repeat('a', 501)))),
  'una idea no pasa de 500 caracteres');
select ok(not public.leccion_valida(jsonb_set((select l from v2), '{tarjetas,5,tipo}', '"chiste"')),
  'no acepta tipos de tarjeta desconocidos');
select ok(not public.leccion_valida(jsonb_set((select l from v2), '{tarjetas,6,tipo}', '"ojo"')),
  'la última tarjeta es el cierre');
select ok(public.leccion_valida('{"resumen":["a"],"ejemplos":[{"consulta":"c","respuesta":"r"}],"ojo":[]}'),
  'la lección por bloques sigue siendo válida');
select throws_ok($$insert into public.items (modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
  values ((select id from public.modulos limit 1), 99, 'x', 'leccion', (select id from public.articulos limit 1), '{"version":2,"tarjetas":[]}', 'marcar_hecho')$$,
  '23514', null, 'un paso con una lección por tarjetas inválida no se guarda');

select * from finish();
rollback;
