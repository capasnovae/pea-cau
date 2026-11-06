"use client";

import { useState, useTransition } from "react";
import { guardarRuta } from "@/app/(app)/contenido/cursos/acciones";

export function SelectorRuta({
  cursoId,
  clave,
  valor,
  etiqueta,
}: {
  cursoId: string;
  clave: string;
  valor: string;
  etiqueta: string;
}) {
  const [actual, setActual] = useState(valor);
  const [pendiente, iniciar] = useTransition();
  const [error, setError] = useState(false);
  return (
    <select
      aria-label={etiqueta}
      value={actual}
      disabled={pendiente}
      className={`h-9 rounded-lg border bg-card px-1 text-xs ${error ? "border-destructive" : "border-border"}`}
      onChange={(e) => {
        const v = e.target.value;
        setActual(v);
        iniciar(async () => {
          const r = await guardarRuta({ curso_id: cursoId, clave, valor: v });
          setError(!r?.ok);
        });
      }}
    >
      <option value="">—</option>
      <option value="obligatorio">Obligatorio</option>
      <option value="opcional">Opcional</option>
    </select>
  );
}
