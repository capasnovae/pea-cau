"use client";

import Link from "next/link";
import { useActionState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { ingresar, type EstadoForm } from "../../acciones";

export function FormularioIngreso({ inactivo }: { inactivo: boolean }) {
  const [estado, accion, pendiente] = useActionState<EstadoForm, FormData>(ingresar, {});
  return (
    <form action={accion} className="flex flex-col gap-4">
      {inactivo && (
        <p role="alert" className="rounded-lg border border-border bg-background p-3 text-sm">
          Tu usuario está desactivado. Hablá con tu coordinador.
        </p>
      )}
      <div className="flex flex-col gap-1.5">
        <Label htmlFor="email">Email</Label>
        <Input id="email" name="email" type="email" autoComplete="email" required />
      </div>
      <div className="flex flex-col gap-1.5">
        <Label htmlFor="password">Contraseña</Label>
        <Input id="password" name="password" type="password" autoComplete="current-password" required />
      </div>
      {estado.error && (
        <p role="alert" className="text-sm text-destructive">
          {estado.error}
        </p>
      )}
      <Button type="submit" disabled={pendiente}>
        {pendiente ? "Ingresando…" : "Ingresar"}
      </Button>
      <Link href="/recuperar" className="text-center text-sm text-primary underline-offset-4 hover:underline">
        ¿Te olvidaste la contraseña?
      </Link>
    </form>
  );
}
