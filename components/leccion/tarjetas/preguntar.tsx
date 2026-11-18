"use client";

import { useState } from "react";
import { Icono } from "@/components/ui/icono";
import { cn } from "@/lib/utils/cn";

type Opcion = { texto: string; clave: boolean; porque: string };

/** "Antes de responder, ¿qué le preguntás?": marca las que harías y después ve cuáles importan y por qué. */
export function Preguntar({ opciones }: { opciones: Opcion[] }) {
  const [marcadas, setMarcadas] = useState<Set<number>>(new Set());
  const [visto, setVisto] = useState(false);
  return (
    <div className="flex flex-col gap-3">
      <fieldset className="flex flex-col gap-2" disabled={visto}>
        <legend className="sr-only">Preguntas posibles</legend>
        {opciones.map((o, i) => (
          <label
            key={i}
            className={cn(
              "flex min-h-12 cursor-pointer items-center gap-3 rounded-boton border bg-card px-4 py-2.5 transition-colors",
              marcadas.has(i) ? "border-primary bg-primary-soft" : "border-border",
            )}
          >
            <input
              type="checkbox"
              className="size-5 accent-primary"
              checked={marcadas.has(i)}
              onChange={() =>
                setMarcadas((m) => {
                  const n = new Set(m);
                  if (n.has(i)) n.delete(i);
                  else n.add(i);
                  return n;
                })
              }
            />
            {o.texto}
          </label>
        ))}
      </fieldset>
      {!visto ? (
        <button
          type="button"
          onClick={() => setVisto(true)}
          className="cuaderno-boton cuaderno-boton-principal"
        >
          Ver qué importa
        </button>
      ) : (
        <ul role="status" className="animate-subir flex flex-col gap-2 text-sm">
          {opciones.map((o, i) => (
            <li key={i} className="flex gap-2">
              <Icono
                nombre={o.clave ? "tilde" : "cruz"}
                tamano={16}
                className={cn("mt-0.5 shrink-0", o.clave ? "text-success" : "text-subtle")}
              />
              <span>
                <span className="font-bold">
                  {o.clave ? "Importa" : "No hace falta"}
                  {marcadas.has(i) !== o.clave ? (o.clave ? " (te la salteaste)" : " (la marcaste)") : ""}:
                </span>{" "}
                {o.texto} {o.porque}
              </span>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
