"use client";

import { useActionState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { guardarTelefono, type EstadoTelefono } from "./acciones";

export function FormularioTelefono({ telefono }: { telefono: string | null }) {
  const [estado, accion, pendiente] = useActionState<EstadoTelefono, FormData>(guardarTelefono, {});
  return (
    <form action={accion} className="flex flex-col gap-2 sm:flex-row sm:items-end">
      <div className="flex flex-1 flex-col gap-1.5">
        <Label htmlFor="telefono">Teléfono</Label>
        <Input id="telefono" name="telefono" type="tel" defaultValue={telefono ?? ""} />
      </div>
      <Button type="submit" variante="secundario" disabled={pendiente}>
        Guardar
      </Button>
      {estado.error && (
        <p role="alert" className="text-sm text-destructive">
          {estado.error}
        </p>
      )}
      {estado.ok && (
        <p role="status" className="text-sm">
          Guardado.
        </p>
      )}
    </form>
  );
}
