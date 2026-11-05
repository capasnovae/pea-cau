"use client";

import { useTransition, useState } from "react";
import { Button } from "@/components/ui/button";
import { Select } from "@/components/ui/input";
import { ETIQUETA_ROL, ROLES, type RolApp } from "@/lib/dominio/roles";
import { cambiarEstadoUsuario, cambiarRol } from "./acciones";

export function AccionesFila({ id, rol, activo }: { id: string; rol: RolApp; activo: boolean }) {
  const [pendiente, iniciar] = useTransition();
  const [error, setError] = useState<string | null>(null);
  const correr = (f: () => Promise<{ ok: boolean; error?: string } | null>) =>
    iniciar(async () => {
      const r = await f();
      setError(r && !r.ok ? (r.error ?? null) : null);
    });
  return (
    <div className="flex flex-wrap items-center gap-2">
      <Select
        aria-label="Rol"
        className="h-9 w-auto"
        defaultValue={rol}
        disabled={pendiente}
        onChange={(e) => correr(() => cambiarRol(id, e.target.value))}
      >
        {ROLES.map((r) => (
          <option key={r} value={r}>
            {ETIQUETA_ROL[r]}
          </option>
        ))}
      </Select>
      <Button variante="secundario" className="h-9" disabled={pendiente} onClick={() => correr(() => cambiarEstadoUsuario(id, !activo))}>
        {activo ? "Desactivar" : "Activar"}
      </Button>
      {error && <span className="text-xs text-destructive">{error}</span>}
    </div>
  );
}
