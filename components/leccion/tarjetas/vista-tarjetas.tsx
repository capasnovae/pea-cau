"use client";

import { useEffect, useRef, useState } from "react";
import type { Practica } from "@/app/(app)/estudiar/[curso]/[item]/practica";
import { cn } from "@/lib/utils/cn";
import type { TarjetaConPregunta } from "./orden";
import { Tarjeta } from "./tarjeta";

type PreguntaPractica = Parameters<typeof Practica>[0]["preguntas"][number];

const clave = (itemId: string) => `pea-tarjeta:${itemId}`;

/**
 * Lección por tarjetas: una por vez, con barra de pasos, Anterior/Siguiente, flechas y deslizar.
 * Todas quedan montadas (ocultas) para que lo marcado y lo respondido no se pierda al volver.
 */
export function VistaTarjetas({
  tarjetas,
  preguntas,
  itemId,
  fuente,
  minutos,
  color,
  alFinal,
}: {
  tarjetas: TarjetaConPregunta[];
  preguntas: Record<string, PreguntaPractica>;
  itemId: string;
  fuente: { titulo: string; href: string } | null;
  minutos: number;
  color: string;
  /** El paso siguiente del curso: se muestra recién en la última tarjeta, para que haya un solo "Siguiente". */
  alFinal?: React.ReactNode;
}) {
  const total = tarjetas.length;
  // Qué pregunta del Probalo es cada tarjeta "probalo" (1 de 3, 2 de 3…)
  const probalos = tarjetas.flatMap((t, i) => (t.tipo === "probalo" ? [i] : []));
  const [actual, setActual] = useState(0);
  const [sentido, setSentido] = useState<"der" | "izq">("der");
  const inicio = useRef<number | null>(null);

  // Retoma donde quedó (preferencia de este navegador; si no se puede leer, arranca de cero)
  useEffect(() => {
    try {
      const n = Number(localStorage.getItem(clave(itemId)));
      // Se lee después de hidratar (en el servidor no hay localStorage): un render extra, una sola vez
      // eslint-disable-next-line react-hooks/set-state-in-effect
      if (n > 0 && n < total) setActual(n);
    } catch {}
  }, [itemId, total]);

  const ir = (n: number) => {
    const destino = Math.max(0, Math.min(total - 1, n));
    if (destino === actual) return;
    setSentido(destino > actual ? "der" : "izq");
    setActual(destino);
    try {
      localStorage.setItem(clave(itemId), String(destino));
    } catch {}
  };

  useEffect(() => {
    const tecla = (e: KeyboardEvent) => {
      const el = e.target as HTMLElement | null;
      if (el && ["INPUT", "TEXTAREA", "SELECT"].includes(el.tagName)) return;
      if (e.key === "ArrowRight") ir(actual + 1);
      if (e.key === "ArrowLeft") ir(actual - 1);
    };
    window.addEventListener("keydown", tecla);
    return () => window.removeEventListener("keydown", tecla);
  });

  return (
    <div
      className="flex flex-col gap-4"
      onPointerDown={(e) => (e.pointerType === "touch" ? (inicio.current = e.clientX) : null)}
      onPointerUp={(e) => {
        if (inicio.current === null) return;
        const dx = e.clientX - inicio.current;
        inicio.current = null;
        if (Math.abs(dx) > 60) ir(actual + (dx < 0 ? 1 : -1));
      }}
    >
      <div className="flex items-center gap-3">
        <div
          role="progressbar"
          aria-label={`Tarjeta ${actual + 1} de ${total}`}
          aria-valuenow={actual + 1}
          aria-valuemin={1}
          aria-valuemax={total}
          className="grid flex-1 gap-1"
          style={{ gridTemplateColumns: `repeat(${total}, minmax(0, 1fr))` }}
        >
          {tarjetas.map((_, i) => (
            <span
              key={i}
              className="h-1.5 rounded-full transition-colors"
              style={{ background: i <= actual ? color : "var(--border)" }}
            />
          ))}
        </div>
        <span className="cifras shrink-0 text-caption text-muted">{minutos} min</span>
      </div>
      {tarjetas.map((t, i) => (
        <div
          key={i}
          hidden={i !== actual}
          className={cn(
            "rounded-tarjeta bg-card p-5 shadow-1",
            i === actual && (sentido === "der" ? "entra-der" : "entra-izq"),
          )}
        >
          <Tarjeta
            t={t}
            itemId={itemId}
            fuente={fuente}
            pregunta={t.tipo === "probalo" ? preguntas[t.preguntaId] : undefined}
            posicion={
              t.tipo === "probalo" ? { n: probalos.indexOf(i) + 1, total: probalos.length } : undefined
            }
          />
        </div>
      ))}
      <div className="flex gap-3">
        <button
          type="button"
          onClick={() => ir(actual - 1)}
          disabled={actual === 0}
          className="min-h-12 flex-1 rounded-boton border border-border-control bg-card font-bold transition active:scale-[0.98] disabled:opacity-40"
        >
          Anterior
        </button>
        {actual < total - 1 && (
          <button
            type="button"
            onClick={() => ir(actual + 1)}
            className="min-h-12 flex-1 rounded-boton bg-primary font-bold text-primary-foreground transition hover:bg-primary-strong active:scale-[0.98]"
          >
            Siguiente
          </button>
        )}
      </div>
      {actual === total - 1 && alFinal}
    </div>
  );
}
