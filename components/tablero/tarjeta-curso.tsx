import Link from "next/link";
import { Icono } from "@/components/ui/icono";
import { Anillo } from "@/components/ui/progreso";
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
      <div
        className="flex items-center justify-between gap-3 p-4 text-white"
        style={{ background: color.fondo }}
      >
        <span className="flex items-center gap-1.5 text-overline uppercase">
          {favorito && <Icono nombre="estrella" tamano={16} relleno aria-label="Favorito" />}
          {etiquetaTipo(curso)}
        </span>
        {!curso.desbloqueado ? (
          <span className="flex size-11 items-center justify-center rounded-full bg-white/20">
            <Candado />
          </span>
        ) : (
          <Anillo
            valor={pct}
            etiqueta={`${pct}% de ${curso.titulo}`}
            color="#fff"
            pista="rgb(255 255 255 / 0.3)"
          >
            {curso.cumplido ? (
              <Icono nombre="tilde" tamano={20} />
            ) : (
              <span className="cifras text-micro font-bold">{pct}%</span>
            )}
          </Anillo>
        )}
      </div>
      <div className="p-3.5">
        <p className="text-h3" style={{ color: color.texto }}>
          {curso.titulo}
        </p>
        {curso.obligatorio && <p className="mt-1 text-[13px] text-muted">Obligatorio</p>}
      </div>
    </>
  );
  const clase = "block overflow-hidden rounded-tarjeta bg-card shadow-1";
  return curso.desbloqueado ? (
    <Link
      href={`/estudiar/${curso.curso_id}`}
      className={`${clase} transition hover:-translate-y-0.5 hover:shadow-2 active:scale-[0.99]`}
    >
      {cuerpo}
    </Link>
  ) : (
    <div className={`${clase} opacity-60`}>{cuerpo}</div>
  );
}
