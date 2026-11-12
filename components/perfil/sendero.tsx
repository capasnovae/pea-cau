import type { CSSProperties } from "react";
import { cn } from "@/lib/utils/cn";

const NODOS = [
  { n: 1, x: 24, y: 92 },
  { n: 2, x: 120, y: 66 },
  { n: 3, x: 200, y: 40 },
  { n: 4, x: 296, y: 16 },
];
const CAMINO = "M24 92C72 92 72 66 120 66S168 44 200 40S256 18 296 16";

/**
 * El camino N1→N4 de la marca, con el tramo recorrido dibujado hasta el nivel actual.
 * Al entrar, el tramo se dibuja y el nodo actual late una vez.
 */
export function Sendero({ nivel }: { nivel: number | null }) {
  const actual = Math.max(0, Math.min(4, nivel ?? 0));
  const recorrido = actual <= 1 ? 0 : (actual - 1) / 3;
  return (
    <svg
      viewBox="0 0 320 112"
      role="img"
      aria-label={actual ? `Vas por el nivel ${actual} de 4` : "Todavía sin nivel"}
      className="w-full max-w-sm"
    >
      <path
        d={CAMINO}
        fill="none"
        stroke="var(--border)"
        strokeWidth="4"
        strokeLinecap="round"
        strokeDasharray="1 9"
      />
      {recorrido > 0 && (
        <path
          className="sendero-dibujar"
          d={CAMINO}
          fill="none"
          stroke="var(--primary)"
          strokeWidth="4"
          strokeLinecap="round"
          pathLength={1}
          style={{ "--recorrido": recorrido } as CSSProperties}
        />
      )}
      {NODOS.map((p) => {
        const alcanzado = p.n <= actual;
        return (
          <g
            key={p.n}
            className={cn(p.n === actual && "nodo-actual")}
            style={{ transformOrigin: `${p.x}px ${p.y}px` }}
          >
            <circle
              cx={p.x}
              cy={p.y}
              r={p.n === actual ? 15 : 12}
              style={{ fill: alcanzado ? `var(--nivel-${p.n})` : "var(--surface-2)" }}
              stroke={alcanzado ? "none" : "var(--border-control)"}
              strokeDasharray={alcanzado ? undefined : "3 3"}
            />
            <text
              x={p.x}
              y={p.y + 4.5}
              textAnchor="middle"
              fontSize="12"
              fontWeight="800"
              style={{ fill: alcanzado ? "var(--sobre-color)" : "var(--subtle)" }}
            >
              N{p.n}
            </text>
          </g>
        );
      })}
    </svg>
  );
}
