import Link from "next/link";
import { Icono } from "@/components/ui/icono";
import { Pestanas } from "@/components/ui/pestanas";

const SECCIONES = [
  { id: "examenes", etiqueta: "Exámenes", href: "/contenido/examenes" },
  { id: "preguntas", etiqueta: "Preguntas", href: "/contenido/preguntas" },
  { id: "casos", etiqueta: "Casos", href: "/contenido/casos" },
] as const;

/** Encabezado de la gestión de exámenes: título y pestañas. */
export function NavExamenes({ actual }: { actual: (typeof SECCIONES)[number]["id"] }) {
  return (
    <div className="flex flex-col gap-3">
      <div className="flex items-baseline justify-between gap-3">
        <h1 className="text-h1">Exámenes y prácticas</h1>
        <Link
          href="/contenido"
          className="inline-flex min-h-11 items-center gap-1 text-sm font-semibold text-primary-strong"
        >
          <Icono nombre="chevron-izq" tamano={16} />
          Contenido
        </Link>
      </div>
      <Pestanas
        etiqueta="Gestión de exámenes"
        pestanas={SECCIONES.map((s) => ({ href: s.href, etiqueta: s.etiqueta, activa: actual === s.id }))}
      />
    </div>
  );
}
