import type { CSSProperties } from "react";

/** Tilde que se dibuja dentro de un círculo que crece; con `estallido`, diez partículas salen del centro. */
export function TildeAnimado({
  tamano = 56,
  color = "var(--success)",
  estallido = false,
}: {
  tamano?: number;
  color?: string;
  estallido?: boolean;
}) {
  return (
    <span
      className="relative inline-flex shrink-0 items-center justify-center"
      style={{ width: tamano, height: tamano }}
      aria-hidden="true"
    >
      {estallido &&
        Array.from({ length: 10 }, (_, i) => (
          <span
            key={i}
            className="particula absolute size-1.5 rounded-full"
            style={
              {
                background: color,
                "--angulo": `${i * 36}deg`,
                "--lejos": `${tamano * 0.9}px`,
              } as CSSProperties
            }
          />
        ))}
      <span
        className="animate-pop flex size-full items-center justify-center rounded-full"
        style={{ background: color }}
      >
        <svg width={tamano * 0.55} height={tamano * 0.55} viewBox="0 0 24 24" fill="none">
          <path
            className="tilde-dibujar"
            d="M5 12.5l4.5 4.5L19 7.5"
            stroke="var(--sobre-color)"
            strokeWidth="3"
            strokeLinecap="round"
            strokeLinejoin="round"
            pathLength={1}
          />
        </svg>
      </span>
    </span>
  );
}
