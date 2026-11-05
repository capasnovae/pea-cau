"use client";

import { useActionState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { guardarSede } from "./acciones";
import type { ResultadoAccion } from "../usuarios/acciones";

type Sede = { id: string; nombre: string; ciudad: string; direccion: string | null };

export function FormularioSede({ sede }: { sede?: Sede }) {
  const [estado, accion, pendiente] = useActionState<ResultadoAccion, FormData>(guardarSede, null);
  return (
    <form action={accion} className="grid gap-2 sm:grid-cols-[1fr_1fr_1.5fr_auto]">
      <input type="hidden" name="id" value={sede?.id ?? ""} />
      <Input name="nombre" aria-label="Nombre" placeholder="Nombre" defaultValue={sede?.nombre} required />
      <Input name="ciudad" aria-label="Ciudad" placeholder="Ciudad" defaultValue={sede?.ciudad} required />
      <Input name="direccion" aria-label="Dirección" placeholder="Dirección" defaultValue={sede?.direccion ?? ""} />
      <Button type="submit" variante={sede ? "secundario" : "primario"} disabled={pendiente}>
        {sede ? "Guardar" : "Agregar sede"}
      </Button>
      {estado && !estado.ok && <p role="alert" className="text-sm text-destructive sm:col-span-4">{estado.error}</p>}
    </form>
  );
}
