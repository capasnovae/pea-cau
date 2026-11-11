"use client";

import { useState, useTransition } from "react";
import { Button } from "@/components/ui/button";
import { Confirmar } from "@/components/ui/confirmar";
import { promover, type ResultadoGuardado } from "@/app/(app)/contenido/acciones";
import { MensajeResultado } from "./campos";

export function BotonPromover({
  tabla,
  id,
}: {
  tabla: "articulos" | "recursos" | "campanas" | "cursos" | "preguntas" | "casos" | "examenes";
  id: string;
}) {
  const [pendiente, iniciar] = useTransition();
  const [r, setR] = useState<ResultadoGuardado>(null);
  return (
    <div className="flex flex-col items-start gap-1">
      <Confirmar
        titulo="¿Promover a todos los CAU?"
        detalle="Lo van a ver los asesores de todas las sedes."
        confirmar="Promover"
        onConfirmar={() => iniciar(async () => setR(await promover(tabla, id)))}
      >
        {(abrir) => (
          <Button type="button" variante="secundario" disabled={pendiente} onClick={abrir}>
            Promover a todos los CAU
          </Button>
        )}
      </Confirmar>
      <MensajeResultado r={r} />
    </div>
  );
}
