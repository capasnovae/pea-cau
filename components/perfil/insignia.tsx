import { colorNivel } from "@/lib/dominio/leccion";
import { cn } from "@/lib/utils/cn";

/** Insignia de nivel: círculo del color del nivel; gris si está perdida. */
export function Insignia({
  nivel,
  nombre,
  perdida = false,
  tamano = "md",
}: {
  nivel: number;
  nombre: string;
  perdida?: boolean;
  tamano?: "md" | "lg";
}) {
  const c = colorNivel(nivel);
  return (
    <figure className="flex flex-col items-center gap-1.5 text-center">
      <span
        aria-hidden="true"
        className={cn(
          "flex items-center justify-center rounded-full border-4 border-white font-extrabold text-white shadow-[var(--shadow-suave)]",
          tamano === "lg" ? "size-24 text-2xl" : "size-16 text-lg",
          perdida && "opacity-40 grayscale",
        )}
        style={{ background: c.fondo }}
      >
        N{nivel}
      </span>
      <figcaption className="text-xs font-bold">
        {nombre}
        {perdida && <span className="block font-semibold text-muted">Perdida</span>}
      </figcaption>
    </figure>
  );
}
