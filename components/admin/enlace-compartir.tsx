"use client";

import { useId, useState } from "react";
import { Icono } from "@/components/ui/icono";
import { enlaceWhatsApp } from "@/lib/dominio/invitacion";

/** Muestra un link de acceso con dos salidas: copiarlo o mandarlo por WhatsApp. */
export function EnlaceCompartir({ enlace, nombre }: { enlace: string; nombre: string }) {
  const [copiado, setCopiado] = useState(false);
  const id = useId();
  return (
    <div className="flex flex-col gap-2 rounded-boton bg-surface-2 p-3">
      <label className="sr-only" htmlFor={id}>
        Link de acceso
      </label>
      <input
        id={id}
        readOnly
        value={enlace}
        onFocus={(e) => e.currentTarget.select()}
        className="h-11 w-full rounded-campo border border-border-control bg-card px-3 font-mono text-xs"
      />
      <div className="flex flex-wrap gap-2">
        <button
          type="button"
          onClick={async () => {
            try {
              await navigator.clipboard.writeText(enlace);
              setCopiado(true);
            } catch {
              setCopiado(false);
            }
          }}
          className="inline-flex min-h-11 items-center gap-1.5 rounded-boton border border-border-control bg-card px-4 text-sm font-bold text-primary-strong transition hover:bg-primary-soft active:scale-[0.97]"
        >
          <Icono nombre={copiado ? "tilde" : "enlace"} tamano={16} />
          {copiado ? "Copiado" : "Copiar link"}
        </button>
        <a
          href={enlaceWhatsApp(nombre, enlace)}
          target="_blank"
          rel="noopener noreferrer"
          className="inline-flex min-h-11 items-center gap-1.5 rounded-boton bg-primary px-4 text-sm font-bold text-primary-foreground transition hover:bg-primary-strong active:scale-[0.97]"
        >
          <Icono nombre="mensaje" tamano={16} />
          Enviar por WhatsApp
        </a>
      </div>
    </div>
  );
}
