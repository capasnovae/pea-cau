"use client";

import { useState, useTransition } from "react";
import { Button } from "@/components/ui/button";
import { obtenerUrlDescarga } from "./acciones";

export function BotonDescargar({ recursoId }: { recursoId: string }) {
  const [pendiente, iniciar] = useTransition();
  const [error, setError] = useState<string | null>(null);
  return (
    <div className="flex flex-col items-start gap-1">
      <Button
        variante="secundario"
        className="h-9"
        disabled={pendiente}
        onClick={() =>
          iniciar(async () => {
            const r = await obtenerUrlDescarga(recursoId);
            if (r.ok) {
              setError(null);
              window.open(r.url, "_blank", "noopener,noreferrer");
            } else setError(r.error);
          })
        }
      >
        {pendiente ? "Preparando…" : "Descargar"}
      </Button>
      {error && <span className="text-xs text-destructive">{error}</span>}
    </div>
  );
}
