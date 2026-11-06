"use client";

import { useState, useTransition } from "react";
import { MensajeResultado } from "@/components/contenido/campos";
import { Button } from "@/components/ui/button";
import { urlEvidencia } from "@/app/(app)/consignas/acciones";
import { desactivarConsigna, type ResultadoConsigna } from "../acciones";

export function BotonEvidencia({ asignacionId }: { asignacionId: string }) {
  const [pendiente, iniciar] = useTransition();
  const [error, setError] = useState<string | null>(null);
  return (
    <span className="inline-flex flex-col">
      <button
        type="button"
        className="text-left text-sm text-primary underline"
        disabled={pendiente}
        onClick={() =>
          iniciar(async () => {
            const r = await urlEvidencia(asignacionId);
            if (r.ok) window.open(r.url, "_blank", "noopener,noreferrer");
            else setError(r.error);
          })
        }
      >
        Ver evidencia
      </button>
      {error && <span className="text-xs text-destructive">{error}</span>}
    </span>
  );
}

export function BotonDejarDeRepetir({ id }: { id: string }) {
  const [pendiente, iniciar] = useTransition();
  const [r, setR] = useState<ResultadoConsigna>(null);
  return (
    <div className="flex flex-col items-start gap-1">
      <Button
        type="button"
        variante="secundario"
        disabled={pendiente}
        onClick={() => iniciar(async () => setR(await desactivarConsigna(id)))}
      >
        Dejar de repetir
      </Button>
      <MensajeResultado r={r} />
    </div>
  );
}
