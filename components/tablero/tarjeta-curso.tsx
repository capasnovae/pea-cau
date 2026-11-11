import Link from "next/link";
import { colorNivel, porcentaje } from "@/lib/dominio/leccion";
import type { Database } from "@/lib/supabase/tipos";

export type FilaMiRuta = Database["public"]["Functions"]["mi_ruta"]["Returns"][number];

function Candado() {
  return (
    <svg
      width="16"
      height="16"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2.2"
      aria-label="Bloqueado"
    >
      <rect x="5" y="11" width="14" height="9" rx="2" />
      <path d="M8 11V8a4 4 0 0 1 8 0v3" />
    </svg>
  );
}

export function etiquetaTipo(c: Pick<FilaMiRuta, "tipo" | "nivel_orden">): string {
  return c.tipo === "nivel" ? `Nivel ${c.nivel_orden}` : "Capacitación";
}

/** Tarjeta de curso estilo Canvas: cabecera del color del nivel, porcentaje y título. */
export function TarjetaCurso({ curso, favorito = false }: { curso: FilaMiRuta; favorito?: boolean }) {
  const color = colorNivel(curso.tipo === "nivel" ? curso.nivel_orden : null);
  const pct = porcentaje(curso.items_cumplidos, curso.items_total);
  const cuerpo = (
    <>
      <div className="flex h-24 items-start justify-between p-3.5" style={{ background: color.fondo }}>
        <span className="flex items-center gap-1 rounded-[10px] bg-white/20 px-2.5 py-1.5 text-sm font-extrabold text-white">
          {curso.desbloqueado ? curso.cumplido ? "✓" : `${pct}%` : <Candado />}
        </span>
        <span className="flex items-center gap-1.5 text-xs font-extrabold uppercase text-white">
          {favorito && <span aria-label="Favorito">★</span>}
          {etiquetaTipo(curso)}
        </span>
      </div>
      <div className="p-3.5">
        <p className="font-extrabold leading-snug" style={{ color: color.texto }}>
          {curso.titulo}
        </p>
        {curso.obligatorio && <p className="mt-1 text-[13px] text-muted">Obligatorio</p>}
      </div>
    </>
  );
  const clase = "block overflow-hidden rounded-[20px] bg-card shadow-1";
  return curso.desbloqueado ? (
    <Link href={`/estudiar/${curso.curso_id}`} className={clase}>
      {cuerpo}
    </Link>
  ) : (
    <div className={`${clase} opacity-60`}>{cuerpo}</div>
  );
}
