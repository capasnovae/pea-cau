"use client";

import { useActionState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { definirClave, type EstadoForm } from "../../acciones";

export default function PaginaDefinirClave() {
  const [estado, accion, pendiente] = useActionState<EstadoForm, FormData>(definirClave, {});
  return (
    <Card>
      <CardTitle className="mb-2">Definí tu contraseña</CardTitle>
      <p className="mb-5 text-sm text-muted">Mínimo 10 caracteres.</p>
      <form action={accion} className="flex flex-col gap-4">
        <div className="flex flex-col gap-1.5">
          <Label htmlFor="password">Contraseña nueva</Label>
          <Input
            id="password"
            name="password"
            type="password"
            autoComplete="new-password"
            minLength={10}
            required
          />
        </div>
        <div className="flex flex-col gap-1.5">
          <Label htmlFor="confirmacion">Repetila</Label>
          <Input id="confirmacion" name="confirmacion" type="password" autoComplete="new-password" required />
        </div>
        {estado.error && (
          <p role="alert" className="text-sm text-destructive">
            {estado.error}
          </p>
        )}
        <Button type="submit" disabled={pendiente}>
          Guardar y entrar
        </Button>
      </form>
    </Card>
  );
}
