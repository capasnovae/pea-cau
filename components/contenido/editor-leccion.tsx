"use client";

import { useState } from "react";
import { LIMITES_LECCION, type Ejemplo, type Leccion } from "@/lib/dominio/lecciones";

const L = LIMITES_LECCION;

function Contador({ n, max }: { n: number; max: number }) {
  return (
    <span className={n > max ? "text-destructive" : "text-muted"}>
      {n}/{max}
    </span>
  );
}

function Lista({
  titulo,
  id,
  valores,
  tope,
  largo,
  onCambio,
}: {
  titulo: string;
  id: string;
  valores: string[];
  tope: number;
  largo: number;
  onCambio: (v: string[]) => void;
}) {
  return (
    <fieldset className="flex flex-col gap-2">
      <legend className="mb-1 text-sm font-bold">{titulo}</legend>
      {valores.map((v, i) => (
        <div key={i} className="flex flex-col gap-1">
          <div className="flex gap-2">
            <textarea
              aria-label={`${titulo} ${i + 1}`}
              id={`${id}-${i}`}
              rows={2}
              value={v}
              maxLength={largo}
              onChange={(e) => onCambio(valores.map((x, j) => (j === i ? e.target.value : x)))}
              className="w-full rounded-xl border border-border bg-card p-2.5 text-sm"
            />
            <button
              type="button"
              aria-label={`Quitar ${titulo.toLowerCase()} ${i + 1}`}
              onClick={() => onCambio(valores.filter((_, j) => j !== i))}
              className="self-start rounded-lg px-2 py-1 text-muted"
            >
              ×
            </button>
          </div>
          <span className="self-end text-xs">
            <Contador n={v.length} max={largo} />
          </span>
        </div>
      ))}
      <button
        type="button"
        disabled={valores.length >= tope}
        onClick={() => onCambio([...valores, ""])}
        className="self-start text-sm font-semibold text-primary-strong disabled:opacity-40"
      >
        + Agregar
      </button>
    </fieldset>
  );
}

/** Editor de la lección: bloques fijos con topes (spec §4.10). Escribe el JSON en un input oculto "leccion". */
export function EditorLeccion({ inicial }: { inicial?: Leccion | null }) {
  const [resumen, setResumen] = useState<string[]>(inicial?.resumen ?? [""]);
  const [ejemplos, setEjemplos] = useState<Ejemplo[]>(inicial?.ejemplos ?? [{ consulta: "", respuesta: "" }]);
  const [ojo, setOjo] = useState<string[]>(inicial?.ojo ?? []);
  const cambiarEjemplo = (i: number, c: Partial<Ejemplo>) =>
    setEjemplos(ejemplos.map((e, j) => (j === i ? { ...e, ...c } : e)));
  return (
    <div className="flex flex-col gap-4 rounded-2xl border border-border p-3">
      <input type="hidden" name="leccion" value={JSON.stringify({ resumen, ejemplos, ojo })} />
      <Lista
        titulo="En 30 segundos"
        id="lec-resumen"
        valores={resumen}
        tope={L.resumen}
        largo={L.idea}
        onCambio={setResumen}
      />
      <fieldset className="flex flex-col gap-3">
        <legend className="mb-1 text-sm font-bold">Así llega al CAU</legend>
        {ejemplos.map((e, i) => (
          <div key={i} className="flex flex-col gap-1.5 rounded-xl bg-background p-2.5">
            <input
              aria-label={`Consulta ${i + 1}`}
              placeholder="Consulta del alumno"
              value={e.consulta}
              maxLength={L.consulta}
              onChange={(ev) => cambiarEjemplo(i, { consulta: ev.target.value })}
              className="h-10 w-full rounded-lg border border-border bg-card px-2.5 text-sm"
            />
            <textarea
              aria-label={`Respuesta ${i + 1}`}
              placeholder="Qué responder"
              rows={2}
              value={e.respuesta}
              maxLength={L.respuesta}
              onChange={(ev) => cambiarEjemplo(i, { respuesta: ev.target.value })}
              className="w-full rounded-lg border border-border bg-card p-2.5 text-sm"
            />
            <div className="flex items-center justify-between text-xs">
              <button
                type="button"
                onClick={() => setEjemplos(ejemplos.filter((_, j) => j !== i))}
                className="font-semibold text-muted"
              >
                Quitar
              </button>
              <span>
                <Contador n={e.consulta.length} max={L.consulta} /> ·{" "}
                <Contador n={e.respuesta.length} max={L.respuesta} />
              </span>
            </div>
          </div>
        ))}
        <button
          type="button"
          disabled={ejemplos.length >= L.ejemplos}
          onClick={() => setEjemplos([...ejemplos, { consulta: "", respuesta: "" }])}
          className="self-start text-sm font-semibold text-primary-strong disabled:opacity-40"
        >
          + Agregar
        </button>
      </fieldset>
      <Lista titulo="Ojo con" id="lec-ojo" valores={ojo} tope={L.ojo} largo={L.idea} onCambio={setOjo} />
    </div>
  );
}
