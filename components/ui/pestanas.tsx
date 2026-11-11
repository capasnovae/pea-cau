"use client";

import Link from "next/link";
import { useIndicador } from "@/components/nav/indicador";
import { cn } from "@/lib/utils/cn";

export type Pestana = { href: string; etiqueta: string; activa: boolean };

/**
 * Pestañas únicas de la app: subrayado que se desliza hasta la activa y scroll propio en celular.
 * `modo="tabs"` para cambiar la vista de una misma página; `modo="nav"` para secciones con ruta propia.
 */
export function Pestanas({
  etiqueta,
  pestanas,
  modo = "nav",
  className,
}: {
  etiqueta: string;
  pestanas: Pestana[];
  modo?: "nav" | "tabs";
  className?: string;
}) {
  const clave = pestanas.map((p) => (p.activa ? p.href : "")).join("|");
  const { ref, caja } = useIndicador<HTMLDivElement>(clave);
  const Marco = modo === "nav" ? "nav" : "div";
  return (
    <Marco
      aria-label={etiqueta}
      className={cn("-mx-4 overflow-x-auto px-4 [scrollbar-width:none]", className)}
    >
      <div
        ref={ref}
        role={modo === "tabs" ? "tablist" : undefined}
        aria-label={modo === "tabs" ? etiqueta : undefined}
        className="relative flex w-max min-w-full gap-6 border-b border-border"
      >
        {pestanas.map((p) => (
          <Link
            key={p.href}
            href={p.href}
            {...(modo === "tabs"
              ? { role: "tab", "aria-selected": p.activa }
              : { "aria-current": p.activa ? ("page" as const) : undefined })}
            className={cn(
              "-mb-px flex min-h-11 items-center whitespace-nowrap border-b-[3px] text-[15px] font-bold transition-colors",
              p.activa ? "text-primary-strong" : "border-transparent text-muted hover:text-ink",
              p.activa && (caja ? "border-transparent" : "border-primary"),
            )}
          >
            {p.etiqueta}
          </Link>
        ))}
        {caja && (
          <span
            aria-hidden="true"
            className="pointer-events-none absolute -bottom-px left-0 h-[3px] origin-left rounded-full bg-primary transition-transform duration-(--dur-3) ease-salida"
            style={{ width: 1, transform: `translateX(${caja.x}px) scaleX(${caja.ancho})` }}
          />
        )}
      </div>
    </Marco>
  );
}
