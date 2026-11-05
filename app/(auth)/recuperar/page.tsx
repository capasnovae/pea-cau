"use client";

import Link from "next/link";
import { useActionState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { pedirRecuperacion, type EstadoForm } from "../acciones";

export default function PaginaRecuperar() {
  const [estado, accion, pendiente] = useActionState<EstadoForm, FormData>(pedirRecuperacion, {});
  return (
    <Card>
      <CardTitle className="mb-2">Recuperá tu contraseña</CardTitle>
      <p className="mb-5 text-sm text-muted">Escribí tu email y te mandamos un link.</p>
      {estado.mensaje ? (
        <p role="status" className="text-sm">
          {estado.mensaje}
        </p>
      ) : (
        <form action={accion} className="flex flex-col gap-4">
          <div className="flex flex-col gap-1.5">
            <Label htmlFor="email">Email</Label>
            <Input id="email" name="email" type="email" autoComplete="email" required />
          </div>
          <Button type="submit" disabled={pendiente}>
            Enviar link
          </Button>
        </form>
      )}
      <Link href="/ingresar" className="mt-4 block text-center text-sm text-primary">
        Volver a ingresar
      </Link>
    </Card>
  );
}
