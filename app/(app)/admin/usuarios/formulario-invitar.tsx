"use client";

import { useActionState } from "react";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { ETIQUETA_ROL, ROLES } from "@/lib/dominio/roles";
import { invitarUsuario, type ResultadoAccion } from "./acciones";

type Opcion = { id: string; nombre: string };

export function FormularioInvitar({ sedes, puestos }: { sedes: Opcion[]; puestos: Opcion[] }) {
  const [estado, accion, pendiente] = useActionState<ResultadoAccion, FormData>(invitarUsuario, null);
  return (
    <form action={accion} className="grid gap-4 sm:grid-cols-2">
      <div className="flex flex-col gap-1.5">
        <Label htmlFor="nombre">Nombre</Label>
        <Input id="nombre" name="nombre" required />
      </div>
      <div className="flex flex-col gap-1.5">
        <Label htmlFor="apellido">Apellido</Label>
        <Input id="apellido" name="apellido" required />
      </div>
      <div className="flex flex-col gap-1.5 sm:col-span-2">
        <Label htmlFor="email">Email</Label>
        <Input id="email" name="email" type="email" required />
      </div>
      <div className="flex flex-col gap-1.5">
        <Label htmlFor="rol">Rol en PEA</Label>
        <Select id="rol" name="rol" defaultValue="asesor">
          {ROLES.map((r) => (
            <option key={r} value={r}>
              {ETIQUETA_ROL[r]}
            </option>
          ))}
        </Select>
      </div>
      <div className="flex flex-col gap-1.5">
        <Label htmlFor="area">Área</Label>
        <Select id="area" name="area" defaultValue="servicio">
          <option value="">Sin área</option>
          <option value="servicio">Servicio</option>
          <option value="ventas">Ventas</option>
        </Select>
      </div>
      <div className="flex flex-col gap-1.5">
        <Label htmlFor="sede_id">Sede</Label>
        <Select id="sede_id" name="sede_id" defaultValue="">
          <option value="">Sin sede (director o admin)</option>
          {sedes.map((s) => (
            <option key={s.id} value={s.id}>
              {s.nombre}
            </option>
          ))}
        </Select>
      </div>
      <div className="flex flex-col gap-1.5">
        <Label htmlFor="puesto_id">Puesto</Label>
        <Select id="puesto_id" name="puesto_id" defaultValue="">
          <option value="">Sin puesto</option>
          {puestos.map((p) => (
            <option key={p.id} value={p.id}>
              {p.nombre}
            </option>
          ))}
        </Select>
      </div>
      {estado && (
        <p role={estado.ok ? "status" : "alert"} className={`sm:col-span-2 text-sm ${estado.ok ? "" : "text-destructive"}`}>
          {estado.ok ? estado.mensaje : estado.error}
        </p>
      )}
      <Button type="submit" disabled={pendiente} className="sm:col-span-2 sm:justify-self-start">
        {pendiente ? "Enviando…" : "Mandar invitación"}
      </Button>
    </form>
  );
}
