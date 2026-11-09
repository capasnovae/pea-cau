import Link from "next/link";
import type { Leccion } from "@/lib/dominio/lecciones";

function Bloque({ titulo, children }: { titulo: string; children: React.ReactNode }) {
  return (
    <section aria-label={titulo} className="flex flex-col gap-2.5">
      <h2 className="text-sm font-extrabold uppercase tracking-wide text-primary-strong">{titulo}</h2>
      {children}
    </section>
  );
}

/** Lección con bloques fijos (spec §4.10): ideas clave, ejemplos del CAU, errores comunes y fuente. */
export function VistaLeccion({
  leccion,
  fuente,
  minutos,
}: {
  leccion: Leccion;
  fuente: { titulo: string; href: string } | null;
  minutos: number;
}) {
  return (
    <div className="flex flex-col gap-6">
      <p className="text-xs font-semibold text-muted">{minutos} min de lectura</p>
      <Bloque titulo="En 30 segundos">
        <ul className="flex flex-col gap-2">
          {leccion.resumen.map((idea, i) => (
            <li key={i} className="flex gap-2.5">
              <span aria-hidden className="mt-2 size-2 shrink-0 rounded-full bg-primary" />
              <span>{idea}</span>
            </li>
          ))}
        </ul>
      </Bloque>
      <Bloque titulo="Así llega al CAU">
        <ul className="flex flex-col gap-3">
          {leccion.ejemplos.map((e, i) => (
            <li key={i} className="flex flex-col gap-1.5 rounded-2xl bg-background p-4">
              <p className="italic">“{e.consulta}”</p>
              <p className="flex gap-2 font-semibold">
                <span aria-hidden className="text-primary">
                  →
                </span>
                <span>{e.respuesta}</span>
              </p>
            </li>
          ))}
        </ul>
      </Bloque>
      {leccion.ojo.length > 0 && (
        <Bloque titulo="Ojo con">
          <ul className="flex flex-col gap-2 rounded-2xl border-l-4 border-warning bg-warning-soft p-4">
            {leccion.ojo.map((o, i) => (
              <li key={i}>{o}</li>
            ))}
          </ul>
        </Bloque>
      )}
      {fuente && (
        <Bloque titulo="Fuente">
          <Link href={fuente.href} className="font-semibold text-primary-strong">
            {fuente.titulo} →
          </Link>
        </Bloque>
      )}
    </div>
  );
}
