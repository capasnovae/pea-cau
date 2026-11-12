"use client";

import { useState, useTransition } from "react";
import { cn } from "@/lib/utils/cn";
import { TEMAS, type Tema } from "@/lib/dominio/tema";
import { elegirTema } from "./acciones";

const ETIQUETA: Record<Tema, string> = { sistema: "Sistema", claro: "Claro", oscuro: "Oscuro" };

/** Control segmentado de tema: aplica el cambio al instante y lo guarda para la próxima visita. */
export function ElegirTema({ inicial }: { inicial: Tema }) {
  const [tema, setTema] = useState(inicial);
  const [, iniciar] = useTransition();
  const cambiar = (t: Tema) => {
    setTema(t);
    if (t === "sistema") document.documentElement.removeAttribute("data-theme");
    else document.documentElement.setAttribute("data-theme", t === "oscuro" ? "dark" : "light");
    iniciar(() => elegirTema(t));
  };
  return (
    <div className="flex flex-wrap items-center justify-between gap-3 text-sm">
      <span id="tema-etiqueta" className="font-semibold">
        Tema
      </span>
      <div role="radiogroup" aria-labelledby="tema-etiqueta" className="flex rounded-boton bg-surface-2 p-1">
        {TEMAS.map((t, i) => (
          <button
            key={t}
            type="button"
            role="radio"
            aria-checked={tema === t}
            tabIndex={tema === t ? 0 : -1}
            onClick={() => cambiar(t)}
            onKeyDown={(e) => {
              // Patrón de grupo de radios: las flechas mueven la selección y el foco
              const paso =
                e.key === "ArrowRight" || e.key === "ArrowDown"
                  ? 1
                  : e.key === "ArrowLeft" || e.key === "ArrowUp"
                    ? -1
                    : 0;
              if (!paso) return;
              e.preventDefault();
              const siguiente = TEMAS[(i + paso + TEMAS.length) % TEMAS.length]!;
              cambiar(siguiente);
              (
                e.currentTarget.parentElement?.children[TEMAS.indexOf(siguiente)] as HTMLElement | undefined
              )?.focus();
            }}
            className={cn(
              "min-h-10 rounded-campo px-3 font-semibold transition",
              tema === t ? "bg-card text-primary-strong shadow-1" : "text-muted hover:text-ink",
            )}
          >
            {ETIQUETA[t]}
          </button>
        ))}
      </div>
    </div>
  );
}
