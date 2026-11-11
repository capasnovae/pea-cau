import { cn } from "@/lib/utils/cn";

/**
 * Marca "Sendero": cuatro puntos que crecen y suben, unidos por un trazo punteado.
 * Son los cuatro niveles del perfil evolutivo, el mismo camino que se ve en la bienvenida.
 * `color` pinta cada punto con el color de su nivel (para fondos oscuros).
 */
export function Simbolo({
  tamano = 32,
  color = false,
  className,
}: {
  tamano?: number;
  color?: boolean;
  className?: string;
}) {
  const puntos = [
    { cx: 7, cy: 23.5, r: 2.25, o: 0.55 },
    { cx: 13, cy: 19.5, r: 2.75, o: 0.7 },
    { cx: 19, cy: 14.5, r: 3.25, o: 0.85 },
    { cx: 25, cy: 8.5, r: 4, o: 1 },
  ];
  return (
    <svg
      width={tamano}
      height={tamano}
      viewBox="0 0 32 32"
      aria-hidden="true"
      className={cn("shrink-0", className)}
    >
      <rect width="32" height="32" rx="9" style={{ fill: color ? "var(--nav)" : "var(--primary)" }} />
      <path
        d="M7 23.5C10.5 23.5 10.5 20 13 19.5S16.5 15.5 19 14.5S22.5 10.5 25 8.5"
        fill="none"
        stroke="#fff"
        strokeOpacity=".5"
        strokeWidth="1.5"
        strokeLinecap="round"
        strokeDasharray="0.1 3.2"
      />
      {puntos.map((p, i) => (
        <circle
          key={i}
          cx={p.cx}
          cy={p.cy}
          r={p.r}
          style={color ? { fill: `var(--nivel-${i + 1})` } : { fill: "#fff", fillOpacity: p.o }}
        />
      ))}
    </svg>
  );
}

/** Símbolo + "PEA". `apilado` lo pone en columna (barra lateral angosta). */
export function Logo({
  tamano = 32,
  apilado = false,
  className,
}: {
  tamano?: number;
  apilado?: boolean;
  className?: string;
}) {
  return (
    <span
      className={cn(
        "inline-flex items-center font-extrabold tracking-[-0.02em]",
        apilado ? "flex-col gap-1" : "gap-2",
        className,
      )}
    >
      <Simbolo tamano={tamano} />
      <span style={{ fontSize: apilado ? tamano * 0.44 : tamano * 0.7, lineHeight: 1 }}>PEA</span>
    </span>
  );
}
