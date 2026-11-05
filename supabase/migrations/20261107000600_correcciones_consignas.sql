-- PEA · Etapa 3 · Correcciones de la revisión final
-- I1: la base exige la evidencia y que sea de la propia asignación.
-- I2: el destinatario no reescribe iniciada_at / completada_at ni reabre una consigna hecha.
-- I3: una lectura solo apunta a un artículo global o de la sede de la consigna; el artículo no se puede borrar mientras se use.

create or replace function public.proteger_asignacion() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_c record;
begin
  if auth.uid() is null then
    return new;
  end if;
  if new.consigna_id is distinct from old.consigna_id or new.usuario_id is distinct from old.usuario_id
     or new.periodo is distinct from old.periodo or new.vence_el is distinct from old.vence_el
     or new.created_at is distinct from old.created_at then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  if new.estado = 'vencida' and old.estado <> 'vencida' then
    raise exception 'no_autorizado: campo protegido' using errcode = 'P0001';
  end if;
  if old.estado = 'hecha' and new.estado <> 'hecha' then
    raise exception 'no_autorizado: una consigna hecha no se reabre' using errcode = 'P0001';
  end if;
  if new.evidencia_path is not null and new.evidencia_path is distinct from old.evidencia_path
     and public.asignacion_de_ruta(new.evidencia_path) is distinct from new.id then
    raise exception 'no_autorizado: la evidencia no es de esta asignación' using errcode = 'P0001';
  end if;

  -- Las fechas las pone el servidor; lo que mande el cliente se ignora.
  new.iniciada_at := old.iniciada_at;
  new.completada_at := old.completada_at;
  if new.estado = 'en_curso' and old.estado <> 'en_curso' then
    new.iniciada_at := coalesce(old.iniciada_at, now());
  end if;
  if new.estado = 'hecha' and old.estado <> 'hecha' then
    select tipo, requiere_evidencia into v_c from public.consignas where id = new.consigna_id;
    if v_c.tipo = 'lectura' and new.leida_at is null then
      raise exception 'integridad: confirmá la lectura' using errcode = 'P0001';
    end if;
    if v_c.requiere_evidencia and new.evidencia_path is null then
      raise exception 'integridad: subí la evidencia' using errcode = 'P0001';
    end if;
    new.completada_at := now();
  end if;
  return new;
end $$;

-- I3: artículo de lectura visible para la sede de la consigna
create or replace function public.validar_articulo_consigna() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if new.articulo_id is not null and not exists (
    select 1 from public.articulos a
    where a.id = new.articulo_id and a.estado = 'publicado'
      and (a.alcance = 'global' or a.sede_id = new.sede_id)
  ) then
    raise exception 'integridad: el artículo no es visible para esa sede' using errcode = 'P0001';
  end if;
  return new;
end $$;

create trigger validar_articulo_consigna before insert or update of articulo_id, sede_id on public.consignas
  for each row execute function public.validar_articulo_consigna();

alter table public.consignas drop constraint consignas_articulo_id_fkey;
alter table public.consignas add constraint consignas_articulo_id_fkey
  foreign key (articulo_id) references public.articulos (id) on delete restrict;
