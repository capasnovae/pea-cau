import Link from "next/link";
import { Markdown } from "@/components/markdown";
import { normalizarTexto } from "@/lib/dominio/examenes";
import { cn } from "@/lib/utils/cn";
import { Enunciado, type PreguntaRender } from "./controles";

type OpcionRev = {
  id: string;
  texto: string;
  es_correcta: boolean;
  posicion_correcta: number | null;
  grupo: string | null;
};
export type FilaRevision = Omit<PreguntaRender, "opciones"> & {
  opciones: OpcionRev[];
  solucion: Record<string, string[]> | null;
  respuesta: {
    opcion_ids: string[] | null;
    orden: string[] | null;
    texto: string | null;
    valores: Record<string, string> | null;
  };
  es_correcta: boolean | null;
  puntaje: number | null;
  explicacion_md: string;
  devolucion_md: string | null;
  estudiar_href: string | null;
};

const OK = "border-success bg-success-soft";
const MAL = "border-[#b91c1c] bg-[#fef2f2]";

function Marca({ ok }: { ok: boolean }) {
  return (
    <span
      aria-label={ok ? "Correcta" : "Incorrecta"}
      className={cn("font-extrabold", ok ? "text-success" : "text-[#b91c1c]")}
    >
      {ok ? "✓" : "✗"}
    </span>
  );
}

/** Lo que respondió contra lo correcto, según el tipo de pregunta. */
export function DetalleRespuesta({ p }: { p: FilaRevision }) {
  const r = p.respuesta;
  if (p.tipo === "libre") {
    return (
      <div className="flex flex-col gap-2">
        <p className="whitespace-pre-wrap rounded-2xl bg-background p-4">{r.texto || "Sin responder"}</p>
        {p.devolucion_md && (
          <div className="rounded-2xl bg-primary-soft p-4">
            <p className="mb-1 text-xs font-extrabold uppercase text-primary-strong">Devolución</p>
            <Markdown texto={p.devolucion_md} />
          </div>
        )}
      </div>
    );
  }
  if (p.tipo === "ordenar") {
    const correcto = [...p.opciones].sort((a, b) => (a.posicion_correcta ?? 0) - (b.posicion_correcta ?? 0));
    const tuyo = (r.orden ?? []).map((id) => p.opciones.find((o) => o.id === id)?.texto ?? "");
    return (
      <div className="grid gap-3 sm:grid-cols-2">
        <div>
          <p className="mb-1 text-xs font-bold text-muted">Tu orden</p>
          <ol className="list-decimal pl-5">
            {tuyo.length ? tuyo.map((t, i) => <li key={i}>{t}</li>) : <li>Sin responder</li>}
          </ol>
        </div>
        <div>
          <p className="mb-1 text-xs font-bold text-muted">Orden correcto</p>
          <ol className="list-decimal pl-5">
            {correcto.map((o) => (
              <li key={o.id}>{o.texto}</li>
            ))}
          </ol>
        </div>
      </div>
    );
  }
  if (p.tipo === "clasificar") {
    return (
      <ul className="flex flex-col gap-1.5">
        {p.opciones.map((o) => {
          const elegida = r.valores?.[o.id];
          const ok = elegida === o.grupo;
          return (
            <li
              key={o.id}
              className={cn("flex flex-wrap items-center gap-2 rounded-xl border-2 px-3 py-2", ok ? OK : MAL)}
            >
              <Marca ok={ok} />
              <span className="font-semibold">{o.texto}</span>
              <span className="text-sm text-muted">→ {elegida || "sin ubicar"}</span>
              {!ok && <span className="text-sm font-semibold text-success">(va en {o.grupo})</span>}
            </li>
          );
        })}
      </ul>
    );
  }
  if (p.tipo === "formulario") {
    return (
      <ul className="flex flex-col gap-1.5">
        {(p.config?.campos ?? []).map((c) => {
          const aceptadas = p.solucion?.[c.id] ?? [];
          const tuyo = r.valores?.[c.id] ?? "";
          const ok = aceptadas.some((a) => normalizarTexto(a) === normalizarTexto(tuyo));
          return (
            <li
              key={c.id}
              className={cn("flex flex-wrap items-center gap-2 rounded-xl border-2 px-3 py-2", ok ? OK : MAL)}
            >
              <Marca ok={ok} />
              <span className="font-semibold">{c.etiqueta}:</span>
              <span>{tuyo || "vacío"}</span>
              {!ok && (
                <span className="text-sm font-semibold text-success">
                  (correcto: {aceptadas.join(" / ")})
                </span>
              )}
            </li>
          );
        })}
      </ul>
    );
  }
  return (
    <ul className="flex flex-col gap-1.5">
      {p.opciones.map((o) => {
        const marcada = Boolean(r.opcion_ids?.includes(o.id));
        return (
          <li
            key={o.id}
            className={cn(
              "flex items-center gap-2 rounded-xl border-2 px-3 py-2",
              o.es_correcta ? OK : marcada ? MAL : "border-border",
            )}
          >
            {(o.es_correcta || marcada) && <Marca ok={o.es_correcta} />}
            <span className={cn(marcada && "font-bold")}>{o.texto}</span>
            {marcada && <span className="ml-auto text-xs text-muted">Tu respuesta</span>}
          </li>
        );
      })}
    </ul>
  );
}

export function Revision({ filas }: { filas: FilaRevision[] }) {
  return (
    <ol aria-label="Revisión" className="flex flex-col gap-4">
      {filas.map((p, i) => (
        <li
          key={p.pregunta_id}
          className="flex flex-col gap-3 rounded-3xl bg-card p-5 shadow-[var(--shadow-suave)]"
        >
          <div className="flex items-center justify-between gap-2">
            <span className="text-sm font-bold text-muted">Pregunta {i + 1}</span>
            <span className="flex items-center gap-2 text-sm font-bold">
              {p.es_correcta !== null && <Marca ok={p.es_correcta} />}
              {p.puntaje ?? 0}/{p.puntaje_max}
            </span>
          </div>
          <Enunciado p={{ ...p, opciones: [] }} />
          <DetalleRespuesta p={p} />
          {p.explicacion_md && (
            <div className="rounded-2xl bg-background p-4 text-sm">
              <Markdown texto={p.explicacion_md} />
            </div>
          )}
          {p.estudiar_href && (
            <Link href={p.estudiar_href} className="self-start text-sm font-bold text-primary-strong">
              Estudiá esto →
            </Link>
          )}
        </li>
      ))}
    </ol>
  );
}
