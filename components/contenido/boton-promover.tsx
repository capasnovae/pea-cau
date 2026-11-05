"use client";

import { useState, useTransition } from "react";
import { Button } from "@/components/ui/button";
import { promover, type ResultadoGuardado } from "@/app/(app)/contenido/acciones";
import { MensajeResultado } from "./campos";

export function BotonPromover({ tabla, id }: { tabla: "articulos" | "recursos" | "campanas" | "cursos"; id: string }) {
  const [pendiente, iniciar] = useTransition();
  const [r, setR] = useState<ResultadoGuardado>(null);
  return (
    <div className="flex flex-col items-start gap-1">
      <Button
        type="button"
        variante="secundario"
        disabled={pendiente}
        onClick={() => {
          if (!window.confirm("¿Promover a todos los CAU? Lo van a ver los asesores de todas las sedes.")) return;
          iniciar(async () => setR(await promover(tabla, id)));
        }}
      >
        Promover a todos los CAU
      </Button>
      <MensajeResultado r={r} />
    </div>
  );
}
