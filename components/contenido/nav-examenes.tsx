import Link from "next/link";
import { cn } from "@/lib/utils/cn";

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
        <Link href="/contenido" className="text-sm font-semibold text-primary-strong">
          ‹ Contenido
        </Link>
      </div>
      <nav aria-label="Gestión de exámenes" className="flex gap-1 rounded-xl bg-primary-soft p-1">
        {SECCIONES.map((s) => (
          <Link
            key={s.id}
            href={s.href}
            aria-current={actual === s.id ? "page" : undefined}
            className={cn(
              "flex-1 rounded-lg px-3 py-2 text-center text-sm font-semibold",
              actual === s.id ? "bg-primary text-white" : "text-primary-strong",
            )}
          >
            {s.etiqueta}
          </Link>
        ))}
      </nav>
    </div>
  );
}
