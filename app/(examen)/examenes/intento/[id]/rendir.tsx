"use client";

import { useCallback, useEffect, useRef, useState, useTransition } from "react";
import {
  ControlPregunta,
  Enunciado,
  respondida,
  type PreguntaRender,
  type Valor,
} from "@/components/examen/controles";
import { formatoDuracion } from "@/lib/dominio/examenes";
import { cn } from "@/lib/utils/cn";
import { entregar, guardar, registrarSalida } from "@/app/(app)/examenes/acciones";

type EstadoGuardado = "guardado" | "guardando" | "error";

function Dialogo({
  titulo,
  onCerrar,
  children,
}: {
  titulo: string;
  onCerrar: () => void;
  children: React.ReactNode;
}) {
  const caja = useRef<HTMLDivElement>(null);
  useEffect(() => {
    const esc = (e: KeyboardEvent) => e.key === "Escape" && onCerrar();
    window.addEventListener("keydown", esc);
    return () => window.removeEventListener("keydown", esc);
  }, [onCerrar]);
  // El foco entra al diálogo (primer botón) y vuelve adonde estaba al cerrarlo
  useEffect(() => {
    const previo = document.activeElement as HTMLElement | null;
    caja.current?.querySelector<HTMLButtonElement>("button")?.focus();
    return () => previo?.focus?.();
  }, []);
  const atrapar = (e: React.KeyboardEvent) => {
    if (e.key !== "Tab" || !caja.current) return;
    const botones = [...caja.current.querySelectorAll<HTMLButtonElement>("button:not([disabled])")];
    const [primero, ultimo] = [botones[0], botones[botones.length - 1]];
    if (e.shiftKey && document.activeElement === primero) {
      e.preventDefault();
      ultimo?.focus();
    } else if (!e.shiftKey && document.activeElement === ultimo) {
      e.preventDefault();
      primero?.focus();
    }
  };
  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-ink/50 p-4">
      <div
        ref={caja}
        onKeyDown={atrapar}
        role="alertdialog"
        aria-modal="true"
        aria-labelledby="dialogo-titulo"
        className="flex w-full max-w-md flex-col gap-4 rounded-3xl bg-card p-6 shadow-xl"
      >
        <h2 id="dialogo-titulo" className="text-h2">
          {titulo}
        </h2>
        {children}
      </div>
    </div>
  );
}

function Reloj({ venceAt, onFin }: { venceAt: string; onFin: () => void }) {
  const [resta, setResta] = useState(() => (Date.parse(venceAt) - Date.now()) / 1000);
  const fin = useRef(false);
  useEffect(() => {
    const t = setInterval(() => {
      const s = (Date.parse(venceAt) - Date.now()) / 1000;
      setResta(s);
      if (s <= 0 && !fin.current) {
        fin.current = true;
        onFin();
      }
    }, 1000);
    return () => clearInterval(t);
  }, [venceAt, onFin]);
  return (
    <span
      role="timer"
      aria-label="Tiempo restante"
      className={cn(
        "rounded-full px-3 py-1.5 font-mono text-sm font-bold",
        resta < 60 ? "bg-destructive-soft text-destructive" : "bg-primary-soft text-primary-strong",
      )}
    >
      {formatoDuracion(resta)}
    </span>
  );
}

export function Rendir({
  intentoId,
  titulo,
  venceAt,
  preguntas,
  iniciales,
}: {
  intentoId: string;
  titulo: string;
  venceAt: string | null;
  preguntas: PreguntaRender[];
  iniciales: Record<string, Valor>;
}) {
  const [actual, setActual] = useState(0);
  const [revisar, setRevisar] = useState(false);
  const [valores, setValores] = useState<Record<string, Valor>>(iniciales);
  const [guardado, setGuardado] = useState<EstadoGuardado>("guardado");
  const [error, setError] = useState<string | null>(null);
  const [entregando, iniciarEntrega] = useTransition();
  const espera = useRef<ReturnType<typeof setTimeout> | null>(null);
  const pendiente = useRef<{ preguntaId: string; v: Valor } | null>(null);

  const enviar = useCallback(
    async (preguntaId: string, v: Valor) => {
      setGuardado("guardando");
      const r = await guardar(intentoId, {
        pregunta_id: preguntaId,
        opcion_ids: v.opcion_ids ?? null,
        orden: v.orden ?? null,
        texto: v.texto ?? null,
        valores: v.valores ?? null,
      });
      setGuardado(r.ok ? "guardado" : "error");
      setError(r.ok ? null : r.error);
    },
    [intentoId],
  );

  const cambiar = (preguntaId: string, v: Valor, inmediato: boolean) => {
    setValores((prev) => ({ ...prev, [preguntaId]: v }));
    if (espera.current) clearTimeout(espera.current);
    if (inmediato) {
      pendiente.current = null;
      void enviar(preguntaId, v);
    } else {
      pendiente.current = { preguntaId, v };
      espera.current = setTimeout(() => {
        pendiente.current = null;
        void enviar(preguntaId, v);
      }, 900);
    }
  };

  const confirmarEntrega = useCallback(() => {
    iniciarEntrega(async () => {
      // Lo último que se escribió y todavía no se guardó, se guarda antes de entregar.
      if (espera.current) clearTimeout(espera.current);
      if (pendiente.current) {
        const { preguntaId, v } = pendiente.current;
        pendiente.current = null;
        await enviar(preguntaId, v);
      }
      await entregar(intentoId);
    });
  }, [intentoId, enviar]);

  // Modo examen: advertencia nativa al cerrar o recargar, y registro de salidas a otra pestaña o ventana.
  const [salir, setSalir] = useState(false);
  const [aviso, setAviso] = useState<number | null>(null);
  const salidaPendiente = useRef<Promise<number | null> | null>(null);
  useEffect(() => {
    if (entregando) return;
    const antesDeIrse = (e: BeforeUnloadEvent) => {
      e.preventDefault();
      e.returnValue = "";
    };
    const cambioDeVista = () => {
      if (document.visibilityState === "hidden") {
        salidaPendiente.current = registrarSalida(intentoId);
      } else if (salidaPendiente.current) {
        const p = salidaPendiente.current;
        salidaPendiente.current = null;
        p.then((n) => setAviso(n ?? 0)).catch(() => setAviso(0));
      }
    };
    window.addEventListener("beforeunload", antesDeIrse);
    document.addEventListener("visibilitychange", cambioDeVista);
    return () => {
      window.removeEventListener("beforeunload", antesDeIrse);
      document.removeEventListener("visibilitychange", cambioDeVista);
    };
  }, [entregando, intentoId]);

  // Botón o gesto de Atrás: una entrada extra en el historial lo frena y abre el diálogo de salir
  useEffect(() => {
    if (entregando) return;
    window.history.pushState(window.history.state, "", window.location.href);
    const atras = () => {
      window.history.pushState(window.history.state, "", window.location.href);
      setSalir(true);
    };
    window.addEventListener("popstate", atras);
    return () => window.removeEventListener("popstate", atras);
  }, [entregando]);

  const p = preguntas[actual]!;
  const sinResponder = preguntas.filter((q) => !respondida(q, valores[q.pregunta_id])).length;

  return (
    <div className="mx-auto flex w-full max-w-3xl flex-col gap-4 pb-24 md:pb-0">
      <div className="flex items-center justify-between gap-3">
        <h1 className="truncate text-h2">{titulo}</h1>
        <div className="flex shrink-0 items-center gap-2">
          <span
            aria-live="polite"
            className={cn("text-xs font-semibold", guardado === "error" ? "text-destructive" : "text-muted")}
          >
            {guardado === "guardando" ? "Guardando…" : guardado === "error" ? "Sin guardar" : "Guardado"}
          </span>
          {venceAt && <Reloj venceAt={venceAt} onFin={confirmarEntrega} />}
          <button
            type="button"
            onClick={() => setSalir(true)}
            className="rounded-xl border border-border bg-card px-3 py-1.5 text-sm font-bold"
          >
            Salir
          </button>
        </div>
      </div>

      {salir && (
        <Dialogo titulo="¿Salir del examen?" onCerrar={() => setSalir(false)}>
          <p>Estás por salir del examen. Si continuás, se va a entregar con lo que respondiste.</p>
          <div className="flex flex-col gap-2 sm:flex-row">
            <button
              type="button"
              onClick={() => setSalir(false)}
              className="min-h-12 flex-1 rounded-2xl bg-primary font-bold text-white"
            >
              Volver al examen
            </button>
            <button
              type="button"
              disabled={entregando}
              onClick={confirmarEntrega}
              className="min-h-12 flex-1 rounded-2xl border-2 border-destructive font-bold text-destructive disabled:opacity-60"
            >
              {entregando ? "Entregando…" : "Entregar y salir"}
            </button>
          </div>
        </Dialogo>
      )}
      {aviso !== null && (
        <Dialogo titulo="Saliste del examen" onCerrar={() => setAviso(null)}>
          <p>
            {aviso > 0
              ? `Quedó registrado (${aviso} ${aviso === 1 ? "vez" : "veces"}).`
              : "Volvé al examen para seguir."}
          </p>
          <button
            type="button"
            onClick={() => setAviso(null)}
            className="min-h-12 rounded-2xl bg-primary font-bold text-white"
          >
            Volver al examen
          </button>
        </Dialogo>
      )}

      <nav aria-label="Preguntas" className="flex flex-wrap gap-1.5">
        {preguntas.map((q, i) => (
          <button
            key={q.pregunta_id}
            type="button"
            onClick={() => {
              setRevisar(false);
              setActual(i);
            }}
            aria-current={!revisar && i === actual ? "step" : undefined}
            aria-label={`Pregunta ${i + 1}${respondida(q, valores[q.pregunta_id]) ? ", respondida" : ""}`}
            className={cn(
              "size-9 rounded-full text-sm font-bold",
              !revisar && i === actual
                ? "bg-primary text-white"
                : respondida(q, valores[q.pregunta_id])
                  ? "bg-primary-soft text-primary-strong"
                  : "bg-card text-muted shadow-1",
            )}
          >
            {i + 1}
          </button>
        ))}
      </nav>

      {error && (
        <p
          role="alert"
          className="rounded-2xl bg-destructive-soft p-3 text-sm font-semibold text-destructive"
        >
          {error}
        </p>
      )}

      {revisar ? (
        <section aria-label="Revisar" className="flex flex-col gap-4 rounded-3xl bg-card p-5 shadow-1">
          <h2 className="text-h2">Revisar antes de entregar</h2>
          <ul className="grid gap-2 sm:grid-cols-2">
            {preguntas.map((q, i) => {
              const ok = respondida(q, valores[q.pregunta_id]);
              return (
                <li key={q.pregunta_id}>
                  <button
                    type="button"
                    onClick={() => {
                      setRevisar(false);
                      setActual(i);
                    }}
                    className="flex w-full items-center justify-between gap-2 rounded-2xl border border-border px-4 py-3 text-left"
                  >
                    <span className="font-bold">Pregunta {i + 1}</span>
                    <span className={cn("text-sm font-semibold", ok ? "text-success" : "text-warning")}>
                      {ok ? "Respondida" : "Sin responder"}
                    </span>
                  </button>
                </li>
              );
            })}
          </ul>
          <button
            type="button"
            disabled={entregando}
            onClick={confirmarEntrega}
            className="min-h-12 rounded-2xl bg-primary font-extrabold text-white hover:bg-primary-strong disabled:opacity-60"
          >
            {entregando
              ? "Entregando…"
              : sinResponder > 0
                ? `Confirmar entrega (${sinResponder} sin responder)`
                : "Confirmar entrega"}
          </button>
        </section>
      ) : (
        <section
          aria-label={`Pregunta ${actual + 1} de ${preguntas.length}`}
          className="flex flex-col gap-4 rounded-3xl bg-card p-5 shadow-1"
        >
          <p className="text-sm font-bold text-muted">
            Pregunta {actual + 1} de {preguntas.length}
          </p>
          <Enunciado p={p} />
          <ControlPregunta
            key={p.pregunta_id}
            p={p}
            valor={valores[p.pregunta_id]}
            onCambio={(v, inmediato) => cambiar(p.pregunta_id, v, inmediato)}
          />
        </section>
      )}

      {!revisar && actual < preguntas.length - 1 && (
        <button
          type="button"
          onClick={() => setRevisar(true)}
          className="self-center text-sm font-bold text-primary-strong"
        >
          Revisar y entregar
        </button>
      )}
      {!revisar && (
        <div className="flex gap-3">
          <button
            type="button"
            disabled={actual === 0}
            onClick={() => setActual((i) => i - 1)}
            className="min-h-12 flex-1 rounded-2xl border border-border bg-card font-bold disabled:opacity-40"
          >
            Anterior
          </button>
          {actual < preguntas.length - 1 ? (
            <button
              type="button"
              onClick={() => setActual((i) => i + 1)}
              className="min-h-12 flex-1 rounded-2xl bg-primary font-bold text-white"
            >
              Siguiente
            </button>
          ) : (
            <button
              type="button"
              onClick={() => setRevisar(true)}
              className="min-h-12 flex-1 rounded-2xl bg-primary font-bold text-white"
            >
              Entregar
            </button>
          )}
        </div>
      )}
    </div>
  );
}
