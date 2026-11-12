"use client";

import { useTransition, useState } from "react";
import { Button } from "@/components/ui/button";
import { Select } from "@/components/ui/input";
import { ETIQUETA_ROL, ROLES, type RolApp } from "@/lib/dominio/roles";
import { EnlaceCompartir } from "@/components/admin/enlace-compartir";
import { cambiarEstadoUsuario, cambiarRol, generarEnlaceAcceso } from "./acciones";

export function AccionesFila({ id, rol, activo }: { id: string; rol: RolApp; activo: boolean }) {
  const [pendiente, iniciar] = useTransition();
  const [error, setError] = useState<string | null>(null);
  const [acceso, setAcceso] = useState<{ enlace: string; nombre: string; mensaje: string } | null>(null);
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
      <Button
        variante="secundario"
        className="h-9"
        disabled={pendiente}
        onClick={() => correr(() => cambiarEstadoUsuario(id, !activo))}
      >
        {activo ? "Desactivar" : "Activar"}
      </Button>
      {activo && (
        <Button
          variante="fantasma"
          className="h-9"
          disabled={pendiente}
          onClick={() =>
            iniciar(async () => {
              const r = await generarEnlaceAcceso(id);
              if (r?.ok && r.enlace) {
                setError(null);
                setAcceso({ enlace: r.enlace, nombre: r.nombre ?? "", mensaje: r.mensaje ?? "" });
              } else setError(r && !r.ok ? r.error : null);
            })
          }
        >
          Link para entrar
        </Button>
      )}
      {error && <span className="text-xs text-destructive">{error}</span>}
      {acceso && (
        <div className="flex w-full flex-col gap-2">
          <p role="status" className="text-sm font-semibold">
            {acceso.mensaje}
          </p>
          <EnlaceCompartir enlace={acceso.enlace} nombre={acceso.nombre} />
        </div>
      )}
    </div>
  );
}
