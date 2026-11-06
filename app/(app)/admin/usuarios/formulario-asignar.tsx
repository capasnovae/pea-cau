"use client";

import { useActionState } from "react";
import { Button } from "@/components/ui/button";
import { Select } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { asignarDatosUsuario, type ResultadoAccion } from "./acciones";

type Opcion = { id: string; nombre: string };
type Equipo = Opcion & { sede_id: string; area: string };

export type DatosUsuarioAsignables = {
  id: string;
  sede_id: string | null;
  area: string | null;
  equipo_id: string | null;
  puesto_id: string | null;
  subrol_ids: string[];
};

export function FormularioAsignar({
  usuario,
  sedes,
  equipos,
  puestos,
  subroles,
}: {
  usuario: DatosUsuarioAsignables;
  sedes: Opcion[];
  equipos: Equipo[];
  puestos: Opcion[];
  subroles: Opcion[];
}) {
  const [estado, accion, pendiente] = useActionState<ResultadoAccion, FormData>(asignarDatosUsuario, null);
  const idc = (c: string) => `${c}-${usuario.id}`;
  return (
    <form action={accion} className="grid gap-3 sm:grid-cols-2">
      <input type="hidden" name="id" value={usuario.id} />
      <div className="flex flex-col gap-1.5">
        <Label htmlFor={idc("sede")}>Sede</Label>
        <Select id={idc("sede")} name="sede_id" defaultValue={usuario.sede_id ?? ""}>
          <option value="">Sin sede</option>
          {sedes.map((s) => (
            <option key={s.id} value={s.id}>
              {s.nombre}
            </option>
          ))}
        </Select>
      </div>
      <div className="flex flex-col gap-1.5">
        <Label htmlFor={idc("area")}>Área</Label>
        <Select id={idc("area")} name="area" defaultValue={usuario.area ?? ""}>
          <option value="">Sin área</option>
          <option value="servicio">Servicio</option>
          <option value="ventas">Ventas</option>
        </Select>
      </div>
      <div className="flex flex-col gap-1.5">
        <Label htmlFor={idc("equipo")}>Equipo</Label>
        <Select id={idc("equipo")} name="equipo_id" defaultValue={usuario.equipo_id ?? ""}>
          <option value="">Sin equipo</option>
          {equipos.map((e) => (
            <option key={e.id} value={e.id}>
              {e.nombre}
            </option>
          ))}
        </Select>
      </div>
      <div className="flex flex-col gap-1.5">
        <Label htmlFor={idc("puesto")}>Puesto</Label>
        <Select id={idc("puesto")} name="puesto_id" defaultValue={usuario.puesto_id ?? ""}>
          <option value="">Sin puesto</option>
          {puestos.map((p) => (
            <option key={p.id} value={p.id}>
              {p.nombre}
            </option>
          ))}
        </Select>
      </div>
      <fieldset className="sm:col-span-2">
        <legend className="mb-1.5 text-sm font-medium">Subroles</legend>
        <div className="flex flex-wrap gap-3">
          {subroles.map((s) => (
            <label key={s.id} className="flex items-center gap-2 text-sm">
              <input
                type="checkbox"
                name="subrol_ids"
                value={s.id}
                defaultChecked={usuario.subrol_ids.includes(s.id)}
                className="size-4"
              />
              {s.nombre}
            </label>
          ))}
        </div>
      </fieldset>
      {estado && (
        <p
          role={estado.ok ? "status" : "alert"}
          className={`text-sm sm:col-span-2 ${estado.ok ? "" : "text-destructive"}`}
        >
          {estado.ok ? estado.mensaje : estado.error}
        </p>
      )}
      <Button
        type="submit"
        variante="secundario"
        disabled={pendiente}
        className="sm:col-span-2 sm:justify-self-start"
      >
        Guardar datos
      </Button>
    </form>
  );
}
