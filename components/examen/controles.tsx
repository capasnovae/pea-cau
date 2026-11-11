"use client";

import { Icono } from "@/components/ui/icono";
import { useState } from "react";
import { Markdown } from "@/components/markdown";
import { cn } from "@/lib/utils/cn";

export type Opcion = { id: string; texto: string };
export type Campo = { id: string; etiqueta: string; tipo: "texto" | "select"; opciones?: string[] };
export type Valor = {
  opcion_ids?: string[] | null;
  orden?: string[] | null;
  texto?: string | null;
  valores?: Record<string, string> | null;
};
export type PreguntaRender = {
  pregunta_id: string;
  tipo: string;
  enunciado_md: string;
  contexto_md: string | null;
  caso_titulo: string | null;
  caso_contexto_md: string | null;
  puntaje_max: number;
  config: { columnas?: string[]; campos?: Campo[] } | null;
  opciones: Opcion[];
};

export function respondida(p: PreguntaRender, v: Valor | undefined): boolean {
  if (!v) return false;
  switch (p.tipo) {
    case "ordenar":
      return Boolean(v.orden?.length);
    case "libre":
      return Boolean(v.texto?.trim());
    case "clasificar":
      return p.opciones.every((o) => v.valores?.[o.id]);
    case "formulario":
      return (p.config?.campos ?? []).every((c) => v.valores?.[c.id]?.trim());
    default:
      return Boolean(v.opcion_ids?.length);
  }
}

/** Enunciado y contexto (escenario o caso de simulación). */
export function Enunciado({ p }: { p: PreguntaRender }) {
  return (
    <div className="flex flex-col gap-3">
      {p.caso_contexto_md && (
        <div className="rounded-2xl bg-primary-soft p-4">
          {p.caso_titulo && (
            <p className="mb-1 text-xs font-extrabold uppercase text-primary-strong">{p.caso_titulo}</p>
          )}
          <Markdown texto={p.caso_contexto_md} />
        </div>
      )}
      {p.contexto_md && (
        <div className="rounded-2xl bg-background p-4">
          <Markdown texto={p.contexto_md} />
        </div>
      )}
      <div className="text-lg font-bold">
        <Markdown texto={p.enunciado_md} />
      </div>
    </div>
  );
}

/**
 * Control de respuesta según el tipo. `onCambio(valor, inmediato)`: inmediato = guardar ya;
 * si no, el que llama puede esperar (textos).
 */
export function ControlPregunta({
  p,
  valor,
  onCambio,
  deshabilitado = false,
}: {
  p: PreguntaRender;
  valor: Valor | undefined;
  onCambio: (v: Valor, inmediato: boolean) => void;
  deshabilitado?: boolean;
}) {
  const nombre = `p-${p.pregunta_id}`;
  if (p.tipo === "verdadero_falso") {
    return (
      <fieldset className="flex flex-col gap-2.5" disabled={deshabilitado}>
        <legend className="sr-only">Respuesta</legend>
        {p.opciones.map((o) => (
          <label key={o.id} className={cn(FILA, valor?.opcion_ids?.includes(o.id) && FILA_ACTIVA)}>
            <input
              type="radio"
              name={nombre}
              checked={Boolean(valor?.opcion_ids?.includes(o.id))}
              onChange={() => onCambio({ opcion_ids: [o.id] }, true)}
              className="size-5 accent-primary"
            />
            {o.texto}
          </label>
        ))}
      </fieldset>
    );
  }
  if (p.tipo === "ordenar")
    return <Ordenar p={p} valor={valor} onCambio={onCambio} deshabilitado={deshabilitado} />;
  if (p.tipo === "libre") {
    return (
      <textarea
        aria-label="Tu respuesta"
        rows={7}
        maxLength={5000}
        disabled={deshabilitado}
        value={valor?.texto ?? ""}
        onChange={(e) => onCambio({ texto: e.target.value }, false)}
        onBlur={(e) => onCambio({ texto: e.target.value }, true)}
        className="w-full rounded-2xl border border-border bg-card p-4 text-base"
      />
    );
  }
  if (p.tipo === "clasificar") {
    const columnas = p.config?.columnas ?? [];
    return (
      <div className="overflow-hidden rounded-2xl border border-border">
        <div className="hidden grid-cols-[1fr_12rem] bg-background px-4 py-2 text-xs font-bold text-muted sm:grid">
          <span>Elemento</span>
          <span>Columna</span>
        </div>
        {p.opciones.map((o) => (
          <label
            key={o.id}
            className="flex flex-col gap-2 border-t border-border px-4 py-3 first:border-t-0 sm:grid sm:grid-cols-[1fr_12rem] sm:items-center"
          >
            <span className="font-semibold">{o.texto}</span>
            <select
              aria-label={`Columna para ${o.texto}`}
              disabled={deshabilitado}
              value={valor?.valores?.[o.id] ?? ""}
              onChange={(e) =>
                onCambio({ valores: { ...(valor?.valores ?? {}), [o.id]: e.target.value } }, true)
              }
              className="h-11 rounded-xl border border-border bg-card px-3"
            >
              <option value="">Elegí…</option>
              {columnas.map((c) => (
                <option key={c} value={c}>
                  {c}
                </option>
              ))}
            </select>
          </label>
        ))}
      </div>
    );
  }
  if (p.tipo === "formulario") {
    return (
      <div className="flex flex-col gap-3 rounded-2xl border-2 border-dashed border-border bg-background p-4">
        {(p.config?.campos ?? []).map((c) => (
          <label key={c.id} className="flex flex-col gap-1.5 text-sm font-semibold">
            {c.etiqueta}
            {c.tipo === "select" ? (
              <select
                disabled={deshabilitado}
                value={valor?.valores?.[c.id] ?? ""}
                onChange={(e) =>
                  onCambio({ valores: { ...(valor?.valores ?? {}), [c.id]: e.target.value } }, true)
                }
                className="h-11 rounded-xl border border-border bg-card px-3 font-normal"
              >
                <option value="">Elegí…</option>
                {(c.opciones ?? []).map((o) => (
                  <option key={o} value={o}>
                    {o}
                  </option>
                ))}
              </select>
            ) : (
              <input
                disabled={deshabilitado}
                value={valor?.valores?.[c.id] ?? ""}
                onChange={(e) =>
                  onCambio({ valores: { ...(valor?.valores ?? {}), [c.id]: e.target.value } }, false)
                }
                onBlur={(e) =>
                  onCambio({ valores: { ...(valor?.valores ?? {}), [c.id]: e.target.value } }, true)
                }
                className="h-11 rounded-xl border border-border bg-card px-3 font-normal"
              />
            )}
          </label>
        ))}
      </div>
    );
  }
  // Opción múltiple, escenario y simulación: no se revela cuántas son correctas.
  return (
    <fieldset className="flex flex-col gap-2.5" disabled={deshabilitado}>
      <legend className="mb-1 text-sm text-muted">Marcá todas las correctas</legend>
      {p.opciones.map((o) => {
        const marcada = Boolean(valor?.opcion_ids?.includes(o.id));
        return (
          <label key={o.id} className={cn(FILA, marcada && FILA_ACTIVA)}>
            <input
              type="checkbox"
              checked={marcada}
              onChange={() => {
                const actual = valor?.opcion_ids ?? [];
                onCambio(
                  { opcion_ids: marcada ? actual.filter((x) => x !== o.id) : [...actual, o.id] },
                  true,
                );
              }}
              className="size-5 accent-primary"
            />
            {o.texto}
          </label>
        );
      })}
    </fieldset>
  );
}

const FILA =
  "flex min-h-12 cursor-pointer items-center gap-3 rounded-2xl border-2 border-border bg-card px-4 py-2.5";
const FILA_ACTIVA = "border-primary bg-primary-soft";

function Ordenar({
  p,
  valor,
  onCambio,
  deshabilitado,
}: {
  p: PreguntaRender;
  valor: Valor | undefined;
  onCambio: (v: Valor, inmediato: boolean) => void;
  deshabilitado: boolean;
}) {
  const [orden, setOrden] = useState<string[]>(
    valor?.orden?.length ? valor.orden : p.opciones.map((o) => o.id),
  );
  const texto = new Map(p.opciones.map((o) => [o.id, o.texto]));
  const mover = (i: number, d: -1 | 1) => {
    const nuevo = [...orden];
    [nuevo[i], nuevo[i + d]] = [nuevo[i + d]!, nuevo[i]!];
    setOrden(nuevo);
    onCambio({ orden: nuevo }, true);
  };
  return (
    <div className="flex flex-col gap-2">
      <ol className="flex flex-col gap-2" aria-label="Pasos en orden">
        {orden.map((id, i) => (
          <li
            key={id}
            className="flex items-center gap-2 rounded-2xl border-2 border-border bg-card py-1.5 pl-4 pr-1.5"
          >
            <span className="w-6 font-extrabold text-primary-strong">{i + 1}</span>
            <span className="flex-1">{texto.get(id)}</span>
            <button
              type="button"
              disabled={deshabilitado || i === 0}
              onClick={() => mover(i, -1)}
              aria-label={`Subir ${texto.get(id)}`}
              className="flex size-11 items-center justify-center rounded-campo transition-colors hover:bg-primary-soft disabled:opacity-30"
            >
              <Icono nombre="flecha-arriba" />
            </button>
            <button
              type="button"
              disabled={deshabilitado || i === orden.length - 1}
              onClick={() => mover(i, 1)}
              aria-label={`Bajar ${texto.get(id)}`}
              className="flex size-11 items-center justify-center rounded-campo transition-colors hover:bg-primary-soft disabled:opacity-30"
            >
              <Icono nombre="flecha-abajo" />
            </button>
          </li>
        ))}
      </ol>
      {!valor?.orden?.length && !deshabilitado && (
        <button
          type="button"
          onClick={() => onCambio({ orden }, true)}
          className="self-start rounded-xl px-3 py-2 text-sm font-bold text-primary-strong hover:bg-primary-soft"
        >
          Confirmar este orden
        </button>
      )}
    </div>
  );
}
