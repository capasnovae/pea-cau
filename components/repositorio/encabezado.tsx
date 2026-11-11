import { Pestanas } from "@/components/tablero/pestanas";

const PESTANAS = [
  { clave: "articulos", etiqueta: "Artículos", href: "/repositorio" },
  { clave: "recursos", etiqueta: "Recursos", href: "/recursos" },
];

/** Encabezado común de Repositorio y Recursos: título, buscador general y pestañas. */
export function EncabezadoRepositorio({ actual }: { actual: "articulos" | "recursos" }) {
  return (
    <div className="flex flex-col gap-4">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <h1 className="text-h1 md:text-[32px]">Repositorio</h1>
        <form action="/buscar" role="search" className="w-full sm:w-72">
          <input
            type="search"
            name="q"
            aria-label="Buscar en el repositorio"
            placeholder="Buscar…"
            className="h-11 w-full rounded-xl border border-border bg-card px-3.5 text-base"
          />
        </form>
      </div>
      <Pestanas opciones={PESTANAS} actual={actual} />
    </div>
  );
}
