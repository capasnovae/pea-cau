import type { SVGProps } from "react";

/** Íconos propios: grilla 24, trazo 2, extremos redondeados, color heredado. Reemplazan a los glifos de texto. */
const TRAZOS = {
  tilde: <path d="M5 12.5l4.5 4.5L19 7.5" />,
  cruz: <path d="M6 6l12 12M18 6L6 18" />,
  "flecha-der": <path d="M5 12h14M13 6l6 6-6 6" />,
  "flecha-izq": <path d="M19 12H5M11 6l-6 6 6 6" />,
  "chevron-izq": <path d="M15 5l-7 7 7 7" />,
  "chevron-der": <path d="M9 5l7 7-7 7" />,
  candado: (
    <>
      <rect x="5" y="11" width="14" height="9" rx="2" />
      <path d="M8 11V8a4 4 0 0 1 8 0v3" />
    </>
  ),
  estrella: <path d="M12 3.5l2.6 5.4 5.9.8-4.3 4.1 1 5.8L12 16.9 6.8 19.6l1-5.8-4.3-4.1 5.9-.8z" />,
  llama: (
    <path d="M12 3c1 3.5 5 5.5 5 10a5 5 0 0 1-10 0c0-1.8.8-3 1.8-4 .3 1.6 1 2.4 2 2.8C10.3 9 11 6 12 3z" />
  ),
  reloj: (
    <>
      <circle cx="12" cy="12" r="8.5" />
      <path d="M12 7.5V12l3 2" />
    </>
  ),
  rayo: <path d="M13 3L5 13.5h6L10 21l8-10.5h-6z" />,
  alerta: (
    <>
      <path d="M12 4l9 15.5H3z" />
      <path d="M12 10v4M12 17v.01" />
    </>
  ),
  libro: (
    <>
      <path d="M5 4h11a3 3 0 0 1 3 3v13H8a3 3 0 0 1-3-3z" />
      <path d="M9 9h6" />
    </>
  ),
  sello: (
    <>
      <path d="M12 3l2.2 1.7 2.8-.1.8 2.7 2.3 1.6-1 2.6 1 2.6-2.3 1.6-.8 2.7-2.8-.1L12 21l-2.2-1.7-2.8.1-.8-2.7-2.3-1.6 1-2.6-1-2.6 2.3-1.6.8-2.7 2.8.1z" />
      <path d="M8.5 12.2l2.3 2.3 4.7-4.8" />
    </>
  ),
  descargar: <path d="M12 4v11M7 10.5l5 5 5-5M5 20h14" />,
  mas: <path d="M12 5v14M5 12h14" />,
  lapiz: <path d="M4 20h4L19 9l-4-4L4 16zM13.5 6.5l4 4" />,
  papelera: <path d="M5 7h14M10 7V4h4v3M7 7l1 13h8l1-13M10 11v5M14 11v5" />,
  buscar: (
    <>
      <circle cx="11" cy="11" r="6.5" />
      <path d="M16 16l4.5 4.5" />
    </>
  ),
  mensaje: <path d="M4 5h16v11H9l-5 4z" />,
  repetir: (
    <>
      <path d="M4 12a8 8 0 0 1 14-5.3L20 9" />
      <path d="M20 4v5h-5M20 12a8 8 0 0 1-14 5.3L4 15" />
      <path d="M4 20v-5h5" />
    </>
  ),
} as const;

export type NombreIcono = keyof typeof TRAZOS;

export function Icono({
  nombre,
  tamano = 20,
  relleno = false,
  ...props
}: { nombre: NombreIcono; tamano?: 16 | 20 | 24 | 32; relleno?: boolean } & SVGProps<SVGSVGElement>) {
  return (
    <svg
      width={tamano}
      height={tamano}
      viewBox="0 0 24 24"
      fill={relleno ? "currentColor" : "none"}
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden={props["aria-label"] ? undefined : true}
      role={props["aria-label"] ? "img" : undefined}
      {...props}
    >
      {TRAZOS[nombre]}
    </svg>
  );
}
