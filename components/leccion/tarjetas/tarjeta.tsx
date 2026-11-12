import Link from "next/link";
import { Practica } from "@/app/(app)/estudiar/[curso]/[item]/practica";
import { Icono } from "@/components/ui/icono";
import type { TarjetaConPregunta } from "./orden";
import { Preguntar } from "./preguntar";

type PreguntaPractica = Parameters<typeof Practica>[0]["preguntas"][number];

const CANAL = { mostrador: "En el mostrador", telefono: "Por teléfono", whatsapp: "Por WhatsApp" } as const;

const parrafos = (t: string) =>
  t.split("\n").map((p, i) => (
    <p key={i} className="leading-relaxed">
      {p}
    </p>
  ));

function Rotulo({ children }: { children: React.ReactNode }) {
  return <p className="text-overline uppercase text-primary-strong">{children}</p>;
}

/** Una tarjeta de la lección, según su tipo. */
export function Tarjeta({
  t,
  itemId,
  pregunta,
  fuente,
}: {
  t: TarjetaConPregunta;
  itemId: string;
  pregunta?: PreguntaPractica;
  fuente: { titulo: string; href: string } | null;
}) {
  switch (t.tipo) {
    case "video":
      return (
        <section aria-label="Video" className="flex flex-col gap-3">
          <Rotulo>En un minuto</Rotulo>
          <video
            controls
            playsInline
            preload="metadata"
            src={t.url}
            className="w-full rounded-tarjeta bg-nav"
          />
        </section>
      );
    case "caso":
      return (
        <section aria-label="Caso" className="flex flex-col gap-3">
          <Rotulo>El caso</Rotulo>
          <p className="flex items-center gap-1.5 text-caption text-muted">
            <Icono nombre="mensaje" tamano={16} />
            {CANAL[t.canal]} · {t.persona}
          </p>
          <blockquote className="rounded-tarjeta rounded-tl-chip bg-primary-soft p-4 text-h3 font-semibold text-ink">
            {t.consulta}
          </blockquote>
        </section>
      );
    case "preguntar":
      return (
        <section aria-label="Antes de responder" className="flex flex-col gap-3">
          <Rotulo>Antes de responder</Rotulo>
          <h2 className="text-h2">¿Qué le preguntás?</h2>
          <Preguntar opciones={t.opciones} />
        </section>
      );
    case "idea":
      return (
        <section aria-label={t.titulo} className="flex flex-col gap-3">
          <Rotulo>La idea</Rotulo>
          <h2 className="text-h2">{t.titulo}</h2>
          {parrafos(t.texto)}
          <p className="flex gap-2 rounded-boton bg-primary-soft p-3 font-semibold text-primary-strong">
            <Icono nombre="rayo" tamano={20} className="mt-0.5 shrink-0" />
            {t.clave}
          </p>
          {t.ejemplo && (
            <p className="rounded-boton border border-border p-3 text-sm">
              <span className="font-bold">Ejemplo: </span>
              {t.ejemplo}
            </p>
          )}
        </section>
      );
    case "probalo":
      return pregunta ? <Practica origen={{ tipo: "leccion", id: itemId }} preguntas={[pregunta]} /> : null;
    case "ojo":
      return (
        <section aria-label="Ojo con" className="flex flex-col gap-3">
          <Rotulo>Ojo con</Rotulo>
          <div className="flex gap-3 rounded-tarjeta border-l-4 border-warning bg-warning-soft p-4">
            <Icono nombre="alerta" tamano={24} className="shrink-0 text-warning" />
            <div className="flex flex-col gap-2">{parrafos(t.texto)}</div>
          </div>
        </section>
      );
    case "cierre":
      return (
        <section aria-label="Caso resuelto" className="flex flex-col gap-3">
          <Rotulo>Caso resuelto</Rotulo>
          {parrafos(t.resolucion)}
          <p className="flex gap-2 rounded-boton bg-success-soft p-3 font-semibold text-success">
            <Icono nombre="tilde" tamano={20} className="mt-0.5 shrink-0" />
            {t.recordar}
          </p>
          {fuente && (
            <Link
              href={fuente.href}
              className="inline-flex min-h-11 items-center gap-1.5 text-sm font-semibold text-primary-strong"
            >
              <Icono nombre="libro" tamano={16} />
              Fuente: {fuente.titulo}
            </Link>
          )}
        </section>
      );
  }
}
