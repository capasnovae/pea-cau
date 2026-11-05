"use client";

import { useActionState } from "react";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { guardarEquipo } from "./acciones";
import type { ResultadoAccion } from "../usuarios/acciones";

type Opcion = { id: string; nombre: string };
type Equipo = { id: string; nombre: string; sede_id: string; area: "servicio" | "ventas"; lider_id: string | null };

export function FormularioEquipo({ equipo, sedes, lideres }: { equipo?: Equipo; sedes: Opcion[]; lideres: Opcion[] }) {
  const [estado, accion, pendiente] = useActionState<ResultadoAccion, FormData>(guardarEquipo, null);
  return (
    <form action={accion} className="grid gap-2 sm:grid-cols-[1.2fr_1fr_0.8fr_1.2fr_auto]">
      <input type="hidden" name="id" value={equipo?.id ?? ""} />
      <Input name="nombre" aria-label="Nombre del equipo" placeholder="Nombre del equipo" defaultValue={equipo?.nombre} required />
      <Select name="sede_id" aria-label="Sede" defaultValue={equipo?.sede_id ?? ""} required>
        <option value="" disabled>
          Sede
        </option>
        {sedes.map((s) => (
          <option key={s.id} value={s.id}>
            {s.nombre}
          </option>
        ))}
      </Select>
      <Select name="area" aria-label="Área" defaultValue={equipo?.area ?? "servicio"}>
        <option value="servicio">Servicio</option>
        <option value="ventas">Ventas</option>
      </Select>
      <Select name="lider_id" aria-label="Líder" defaultValue={equipo?.lider_id ?? ""}>
        <option value="">Sin líder</option>
        {lideres.map((l) => (
          <option key={l.id} value={l.id}>
            {l.nombre}
          </option>
        ))}
      </Select>
      <Button type="submit" variante={equipo ? "secundario" : "primario"} disabled={pendiente}>
        {equipo ? "Guardar" : "Crear equipo"}
      </Button>
      {estado && !estado.ok && <p role="alert" className="text-sm text-destructive sm:col-span-5">{estado.error}</p>}
    </form>
  );
}
