-- PEA · Etapa 9 · El valor nuevo del enum va solo: no se puede usar en la misma transacción que lo crea
alter type public.tipo_examen add value if not exists 'actualizacion';
