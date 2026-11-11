import { Pestanas as PestanasUi } from "@/components/ui/pestanas";

/** Pestañas que cambian la vista de una misma página (Tablero / Cursos, Artículos / Recursos). */
export function Pestanas({
  opciones,
  actual,
}: {
  opciones: { href: string; etiqueta: string; clave: string }[];
  actual: string;
}) {
  return (
    <PestanasUi
      modo="tabs"
      etiqueta="Vistas"
      pestanas={opciones.map((o) => ({ href: o.href, etiqueta: o.etiqueta, activa: o.clave === actual }))}
    />
  );
}
