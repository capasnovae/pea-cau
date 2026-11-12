import { cn } from "@/lib/utils/cn";
import type { CSSProperties, ReactNode } from "react";

const limitar = (n: number) => Math.max(0, Math.min(100, Math.round(n)));

/** Barra de avance: se llena con `scaleX` (no cambia el tamaño de nada alrededor). */
export function Barra({
  valor,
  etiqueta,
  color = "var(--primary)",
  pista = "var(--surface-2)",
  className,
}: {
  valor: number;
  etiqueta: string;
  color?: string;
  pista?: string;
  className?: string;
}) {
  const v = limitar(valor);
  return (
    <div
      role="progressbar"
      aria-label={etiqueta}
      aria-valuenow={v}
      aria-valuemin={0}
      aria-valuemax={100}
      className={cn("h-2 overflow-hidden rounded-full", className)}
      style={{ background: pista }}
    >
      <div
        className="barra-llenar h-full w-full origin-left rounded-full"
        style={{ background: color, "--v": v / 100 } as CSSProperties}
      />
    </div>
  );
}

/** Anillo de avance: el trazo se dibuja hasta el valor. */
export function Anillo({
  valor,
  etiqueta,
  tamano = 44,
  grosor = 5,
  color = "var(--primary)",
  pista = "var(--border)",
  children,
  className,
}: {
  valor: number;
  etiqueta: string;
  tamano?: number;
  grosor?: number;
  color?: string;
  pista?: string;
  children?: ReactNode;
  className?: string;
}) {
  const v = limitar(valor);
  const r = (tamano - grosor) / 2;
  const largo = 2 * Math.PI * r;
  return (
    <div
      role="progressbar"
      aria-label={etiqueta}
      aria-valuenow={v}
      aria-valuemin={0}
      aria-valuemax={100}
      className={cn("relative inline-flex shrink-0 items-center justify-center", className)}
      style={{ width: tamano, height: tamano }}
    >
      <svg width={tamano} height={tamano} className="-rotate-90" aria-hidden="true">
        <circle cx={tamano / 2} cy={tamano / 2} r={r} fill="none" stroke={pista} strokeWidth={grosor} />
        <circle
          className="anillo-dibujar"
          cx={tamano / 2}
          cy={tamano / 2}
          r={r}
          fill="none"
          stroke={color}
          strokeWidth={grosor}
          strokeLinecap="round"
          strokeDasharray={largo}
          style={{ "--largo": largo, "--resto": largo * (1 - v / 100) } as CSSProperties}
        />
      </svg>
      {children && <span className="absolute inset-0 flex items-center justify-center">{children}</span>}
    </div>
  );
}
