"use client";

import { useActionState } from "react";
import { Campo, CampoFecha, CamposAlcance, MensajeResultado } from "@/components/contenido/campos";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { guardarCampana, type ResultadoGuardado } from "../acciones";

type Opcion = { id: string; nombre: string };
export type CampanaEditable = {
  id: string;
  nombre: string;
  descripcion_md: string;
  vigente_desde: string | null;
  vigente_hasta: string | null;
  alcance: "global" | "sede";
  sede_id: string | null;
  estado: string;
};

export function FormularioCampana({ campana, alcances, sedes }: { campana?: CampanaEditable; alcances: ("global" | "sede")[]; sedes: Opcion[] }) {
  const [r, accion, pendiente] = useActionState<ResultadoGuardado, FormData>(guardarCampana, null);
  const p = campana?.id ?? "nueva";
  return (
    <form action={accion} className="flex flex-col gap-3" aria-label={campana ? `Campaña ${campana.nombre}` : "Nueva campaña"}>
      <input type="hidden" name="id" value={campana?.id ?? ""} />
      <Campo id={`nombre-${p}`} etiqueta="Nombre">
        <Input id={`nombre-${p}`} name="nombre" required defaultValue={campana?.nombre} />
      </Campo>
      <Campo id={`descripcion-${p}`} etiqueta="Descripción">
        <Input id={`descripcion-${p}`} name="descripcion_md" defaultValue={campana?.descripcion_md} />
      </Campo>
      <div className="grid gap-3 sm:grid-cols-2">
        <CampoFecha id="vigente_desde" etiqueta="Desde" valor={campana?.vigente_desde} prefijo={`${p}-`} />
        <CampoFecha id="vigente_hasta" etiqueta="Hasta" valor={campana?.vigente_hasta} prefijo={`${p}-`} />
      </div>
      <div className="grid gap-3 sm:grid-cols-3">
        <CamposAlcance alcances={alcances} sedes={sedes} alcance={campana?.alcance} sedeId={campana?.sede_id} estado={campana?.estado} prefijo={`${p}-`} />
      </div>
      <MensajeResultado r={r} />
      <Button type="submit" variante={campana ? "secundario" : "primario"} disabled={pendiente} className="self-start">
        {campana ? "Guardar" : "Crear campaña"}
      </Button>
    </form>
  );
}
