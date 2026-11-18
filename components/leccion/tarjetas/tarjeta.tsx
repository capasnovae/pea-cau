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

/** Etiqueta tipo código, como en los videos: "// el caso". */
function Rotulo({ children }: { children: string }) {
  return <p className="cuaderno-rotulo">{`// ${children.toLowerCase()}`}</p>;
}

/** Título grande en mayúsculas con la última palabra en color y un subrayado. */
function Titulo({ children }: { children: string }) {
  const palabras = children.trim().split(/\s+/);
  const ultima = palabras.pop();
  return (
    <div className="flex flex-col gap-2">
      <h2 className="cuaderno-titulo">
        {palabras.join(" ")}
        {palabras.length > 0 && " "}
        <span className="ultima">{ultima}</span>
      </h2>
      <span aria-hidden className="cuaderno-subrayado" />
    </div>
  );
}

const Sello = ({ children, color }: { children: string; color: string }) => (
  <span className="cuaderno-sello self-start" style={{ color }}>
    {children}
  </span>
);

/** Una tarjeta de la lección, según su tipo. */
export function Tarjeta({
  t,
  itemId,
  pregunta,
  posicion,
  fuente,
}: {
  t: TarjetaConPregunta;
  itemId: string;
  pregunta?: PreguntaPractica;
  posicion?: { n: number; total: number };
  fuente: { titulo: string; href: string } | null;
}) {
  switch (t.tipo) {
    case "video":
      return (
        <section aria-label="Video" className="flex flex-col gap-3">
          <Rotulo>El video</Rotulo>
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
          <p className="flex items-center gap-1.5 text-sm font-semibold" style={{ color: "var(--tinta-suave)" }}>
            <Icono nombre="mensaje" tamano={16} />
            {CANAL[t.canal]} · {t.persona}
          </p>
          <blockquote className="cuaderno-hoja rounded-tl-[4px] p-4 text-h3 font-semibold">{t.consulta}</blockquote>
        </section>
      );
    case "preguntar":
      return (
        <section aria-label="Antes de responder" className="flex flex-col gap-3">
          <Rotulo>Antes de responder</Rotulo>
          <Titulo>¿Qué revisás o preguntás?</Titulo>
          <Preguntar opciones={t.opciones} />
        </section>
      );
    case "idea":
      return (
        <section aria-label={t.titulo} className="flex flex-col gap-3">
          <Rotulo>La idea</Rotulo>
          <Titulo>{t.titulo}</Titulo>
          {parrafos(t.texto)}
          <p className="cuaderno-hoja flex gap-2 p-3 font-bold" style={{ borderLeft: "8px solid var(--acento-fuerte)" }}>
            <Icono nombre="rayo" tamano={20} className="mt-0.5 shrink-0" style={{ color: "var(--acento)" }} />
            {t.clave}
          </p>
          {t.ejemplo && (
            <p className="text-sm leading-relaxed">
              <span className="cuaderno-serif" style={{ color: "var(--acento)" }}>
                Ejemplo:{" "}
              </span>
              {t.ejemplo}
            </p>
          )}
        </section>
      );
    case "probalo":
      return pregunta ? (
        <Practica origen={{ tipo: "leccion", id: itemId }} preguntas={[pregunta]} posicion={posicion} />
      ) : null;
    case "ojo":
      return (
        <section aria-label="Ojo con" className="flex flex-col gap-3">
          <Rotulo>Ojo con</Rotulo>
          <Sello color="var(--amarillo)">Ojo</Sello>
          <div className="cuaderno-hoja flex gap-3 p-4">
            <Icono nombre="alerta" tamano={24} className="shrink-0" style={{ color: "var(--amarillo)" }} />
            <div className="flex flex-col gap-2">{parrafos(t.texto)}</div>
          </div>
        </section>
      );
    case "cierre":
      return (
        <section aria-label="Caso resuelto" className="flex flex-col gap-3">
          <Rotulo>Caso resuelto</Rotulo>
          <Sello color="var(--verde)">Resuelto</Sello>
          {parrafos(t.resolucion)}
          <div className="flex flex-col gap-1 pt-1">
            <p className="cuaderno-rotulo">{"// para recordar"}</p>
            <p className="cuaderno-titulo" style={{ fontSize: "1.6rem" }}>
              {t.recordar}
            </p>
          </div>
          {fuente && (
            <Link
              href={fuente.href}
              className="inline-flex min-h-11 items-center gap-1.5 text-sm font-semibold underline underline-offset-4"
              style={{ color: "var(--acento)" }}
            >
              <Icono nombre="libro" tamano={16} />
              Fuente: {fuente.titulo}
            </Link>
          )}
        </section>
      );
  }
}
