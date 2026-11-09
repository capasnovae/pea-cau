"use client";

import { useRouter } from "next/navigation";
import { useState, useTransition } from "react";
import {
  ControlPregunta,
  Enunciado,
  respondida,
  type PreguntaRender,
  type Valor,
} from "@/components/examen/controles";
import { Markdown } from "@/components/markdown";
import { cn } from "@/lib/utils/cn";
import { comprobarPractica } from "../../acciones";

type Resultado = { es_correcta: boolean; explicacion_md: string; solucion: Record<string, unknown> };
type PreguntaPractica = PreguntaRender & { acertada: boolean };

/** La solución de una pregunta, en palabras. */
function Solucion({ p, s }: { p: PreguntaRender; s: Record<string, unknown> }) {
  const texto = new Map(p.opciones.map((o) => [o.id, o.texto]));
  if (p.tipo === "ordenar") {
    return (
      <ol className="list-decimal pl-5">
        {((s.orden as string[]) ?? []).map((id) => (
          <li key={id}>{texto.get(id)}</li>
        ))}
      </ol>
    );
  }
  if (p.tipo === "clasificar") {
    return (
      <ul className="flex flex-col gap-0.5">
        {Object.entries((s.grupos as Record<string, string>) ?? {}).map(([id, g]) => (
          <li key={id}>
            {texto.get(id)} → <b>{g}</b>
          </li>
        ))}
      </ul>
    );
  }
  if (p.tipo === "formulario") {
    const campos = new Map((p.config?.campos ?? []).map((c) => [c.id, c.etiqueta]));
    return (
      <ul className="flex flex-col gap-0.5">
        {Object.entries((s.aceptadas as Record<string, string[]>) ?? {}).map(([id, v]) => (
          <li key={id}>
            {campos.get(id) ?? id}: <b>{v.join(" / ")}</b>
          </li>
        ))}
      </ul>
    );
  }
  if (p.tipo === "libre") return s.rubrica ? <Markdown texto={String(s.rubrica)} /> : null;
  return <p>{((s.opcion_ids as string[]) ?? []).map((id) => texto.get(id)).join(" · ")}</p>;
}

export function Practica({
  origen,
  preguntas,
}: {
  origen: { tipo: "examen" | "leccion"; id: string };
  preguntas: PreguntaPractica[];
}) {
  const nombre = origen.tipo === "leccion" ? "Probalo" : "Práctica";
  const router = useRouter();
  const [actual, setActual] = useState(0);
  const [valores, setValores] = useState<Record<string, Valor>>({});
  const [resultado, setResultado] = useState<Resultado | null>(null);
  const [acertadas, setAcertadas] = useState(
    () => new Set(preguntas.filter((p) => p.acertada).map((p) => p.pregunta_id)),
  );
  const [error, setError] = useState<string | null>(null);
  const [pendiente, iniciar] = useTransition();
  if (preguntas.length === 0)
    return <p className="text-sm text-muted">Esta práctica todavía no tiene preguntas.</p>;
  const p = preguntas[actual]!;

  const comprobar = () =>
    iniciar(async () => {
      const r = await comprobarPractica(origen, p.pregunta_id, valores[p.pregunta_id] ?? {});
      if (!r.ok) {
        setError(r.error);
        return;
      }
      setError(null);
      setResultado(r);
      if (r.es_correcta) {
        const nuevas = new Set(acertadas).add(p.pregunta_id);
        setAcertadas(nuevas);
        if (nuevas.size === preguntas.length) router.refresh();
      }
    });
  const ir = (i: number) => {
    setActual(i);
    setResultado(null);
    setError(null);
  };

  return (
    <section aria-label={nombre} className="flex flex-col gap-4">
      <div className="flex items-center justify-between gap-3">
        <span className="text-sm font-bold text-muted">
          {origen.tipo === "leccion" && (
            <span className="mr-2 text-base font-extrabold text-ink">Probalo</span>
          )}
          {actual + 1} de {preguntas.length}
        </span>
        <span
          className={cn(
            "text-sm font-bold",
            acertadas.size === preguntas.length ? "text-success" : "text-primary-strong",
          )}
        >
          {acertadas.size}/{preguntas.length} acertadas
        </span>
      </div>
      <Enunciado p={p} />
      <ControlPregunta
        key={p.pregunta_id}
        p={p}
        valor={valores[p.pregunta_id]}
        deshabilitado={Boolean(resultado)}
        onCambio={(v) => setValores((prev) => ({ ...prev, [p.pregunta_id]: v }))}
      />
      {error && (
        <p role="alert" className="text-sm font-semibold text-[#b91c1c]">
          {error}
        </p>
      )}
      {resultado && (
        <div
          role="status"
          className={cn(
            "flex flex-col gap-2 rounded-2xl border-2 p-4",
            resultado.es_correcta ? "border-success bg-success-soft" : "border-[#b91c1c] bg-[#fef2f2]",
          )}
        >
          <p
            className={cn(
              "text-lg font-extrabold",
              resultado.es_correcta ? "text-success" : "text-[#b91c1c]",
            )}
          >
            {resultado.es_correcta ? "✓ ¡Bien!" : "✗ Todavía no"}
          </p>
          {!resultado.es_correcta && (
            <div className="text-sm">
              <p className="font-bold">Solución</p>
              <Solucion p={p} s={resultado.solucion} />
            </div>
          )}
          {resultado.explicacion_md && (
            <div className="text-sm">
              <Markdown texto={resultado.explicacion_md} />
            </div>
          )}
        </div>
      )}
      <div className="flex gap-3">
        {resultado ? (
          <>
            <button
              type="button"
              onClick={() => setResultado(null)}
              className="min-h-12 flex-1 rounded-2xl border border-border bg-card font-bold"
            >
              Otra vez
            </button>
            <button
              type="button"
              onClick={() => ir((actual + 1) % preguntas.length)}
              className="min-h-12 flex-1 rounded-2xl bg-primary font-bold text-white"
            >
              Otra pregunta
            </button>
          </>
        ) : (
          <button
            type="button"
            disabled={pendiente || !respondida(p, valores[p.pregunta_id])}
            onClick={comprobar}
            className="min-h-12 flex-1 rounded-2xl bg-primary font-bold text-white disabled:opacity-50"
          >
            {pendiente ? "Comprobando…" : "Comprobar"}
          </button>
        )}
      </div>
    </section>
  );
}
