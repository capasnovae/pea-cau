import type { CSSProperties } from "react";
import { Icono } from "@/components/ui/icono";
import { colorNivel } from "@/lib/dominio/leccion";
import { cn } from "@/lib/utils/cn";

/**
 * Insignia de nivel: medalla con relieve del color del nivel.
 * Estados: obtenida, `bloqueada` (todavía no se ganó) y `perdida`.
 * `entrada` la hace girar y brillar una vez (cuando se acaba de ganar).
 */
export function Insignia({
  nivel,
  nombre,
  perdida = false,
  bloqueada = false,
  entrada = false,
  tamano = "md",
}: {
  nivel: number;
  nombre: string;
  perdida?: boolean;
  bloqueada?: boolean;
  entrada?: boolean;
  tamano?: "md" | "lg";
}) {
  const c = colorNivel(nivel);
  const apagada = perdida || bloqueada;
  return (
    <figure className="flex flex-col items-center gap-1.5 text-center">
      <span
        aria-hidden="true"
        className={cn(
          "medalla relative flex items-center justify-center rounded-full font-extrabold",
          tamano === "lg" ? "size-24 text-2xl" : "size-16 text-lg",
          apagada ? "bg-surface-2 text-subtle" : "text-white shadow-2",
          bloqueada && "border-2 border-dashed border-border-control",
          perdida && "grayscale",
          entrada && "medalla-entra",
        )}
        style={apagada ? undefined : ({ "--medalla": c.fondo } as CSSProperties)}
      >
        {bloqueada ? <Icono nombre="candado" /> : `N${nivel}`}
      </span>
      <figcaption className={cn("text-xs font-bold", apagada && "text-muted")}>
        {nombre}
        {perdida && <span className="block font-semibold text-muted">Perdida</span>}
      </figcaption>
    </figure>
  );
}
