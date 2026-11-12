"use client";

import { useActionState } from "react";
import { MensajeResultado } from "@/components/contenido/campos";
import { Markdown } from "@/components/markdown";
import { corregir, type ResultadoCorreccion } from "../acciones";

type Respuesta = {
  respuesta_id: string;
  enunciado_md: string;
  rubrica_md: string | null;
  puntaje_max: number;
  texto_libre: string | null;
  puntaje: number | null;
  devolucion_md: string | null;
};

export function FormularioCorreccion({
  intentoId,
  respuestas,
}: {
  intentoId: string;
  respuestas: Respuesta[];
}) {
  const [r, accion, pendiente] = useActionState<ResultadoCorreccion, FormData>(corregir, null);
  return (
    <form action={accion} className="flex flex-col gap-4">
      <input type="hidden" name="intento" value={intentoId} />
      {respuestas.map((x, i) => (
        <section
          key={x.respuesta_id}
          aria-label={`Respuesta ${i + 1}`}
          className="flex flex-col gap-3 rounded-3xl bg-card p-5 shadow-1"
        >
          <input type="hidden" name="respuesta" value={x.respuesta_id} />
          <div className="font-bold">
            <Markdown texto={x.enunciado_md} />
          </div>
          {x.rubrica_md && (
            <div className="rounded-2xl bg-primary-soft p-3 text-sm">
              <p className="mb-1 text-xs font-extrabold uppercase text-primary-strong">Rúbrica</p>
              <Markdown texto={x.rubrica_md} />
            </div>
          )}
          <p className="whitespace-pre-wrap rounded-2xl bg-background p-4">{x.texto_libre}</p>
          <div className="grid gap-3 sm:grid-cols-[9rem_1fr]">
            <label className="flex flex-col gap-1.5 text-sm font-semibold">
              Puntaje (0 a {x.puntaje_max})
              <input
                name={`puntaje_${x.respuesta_id}`}
                type="number"
                min={0}
                max={x.puntaje_max}
                step="0.5"
                defaultValue={x.puntaje ?? ""}
                className="h-11 rounded-xl border border-border bg-card px-3"
              />
            </label>
            <label className="flex flex-col gap-1.5 text-sm font-semibold">
              Devolución
              <textarea
                name={`devolucion_${x.respuesta_id}`}
                rows={2}
                defaultValue={x.devolucion_md ?? ""}
                className="rounded-xl border border-border bg-card p-3 font-normal"
              />
            </label>
          </div>
        </section>
      ))}
      <MensajeResultado r={r} />
      <div className="flex flex-wrap gap-3">
        <button
          type="submit"
          name="accion"
          value="guardar"
          disabled={pendiente}
          className="min-h-12 rounded-2xl border border-border bg-card px-5 font-bold"
        >
          Guardar
        </button>
        <button
          type="submit"
          name="accion"
          value="cerrar"
          disabled={pendiente}
          className="min-h-12 rounded-2xl bg-primary px-5 font-bold text-primary-foreground"
        >
          Cerrar corrección
        </button>
      </div>
    </form>
  );
}
