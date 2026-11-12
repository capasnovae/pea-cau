// Guion del video de una lección por tarjetas: sale de las tarjetas y cada escena dura lo que lleva leerla.
import type { LeccionV2 } from "../dominio/lecciones";

export type Escena = { tipo: "portada" | "caso" | "idea" | "ojo" | "cierre"; textos: string[]; segundos: number };

const PALABRAS_POR_SEGUNDO = 2.5;
const MARGEN = 1.5;
const MINIMO = 3;
const MAXIMO = 12;

/** Lo que tarda una persona en leer el texto en pantalla, con un margen, entre 3 y 12 segundos. */
export function segundosDeLectura(texto: string): number {
  const palabras = texto.split(/\s+/).filter(Boolean).length;
  return Math.min(MAXIMO, Math.max(MINIMO, palabras / PALABRAS_POR_SEGUNDO + MARGEN));
}

const CANAL = { mostrador: "En el mostrador", telefono: "Por teléfono", whatsapp: "Por WhatsApp" } as const;

/** Escenas del video: portada, el caso, cada idea por su frase clave (no el texto completo), el ojo y el cierre. */
export function guionDeLeccion(l: LeccionV2, titulo: string): Escena[] {
  const escenas: Omit<Escena, "segundos">[] = [{ tipo: "portada", textos: [titulo] }];
  for (const t of l.tarjetas) {
    if (t.tipo === "caso") escenas.push({ tipo: "caso", textos: [`${CANAL[t.canal]} · ${t.persona}`, t.consulta] });
    if (t.tipo === "idea") escenas.push({ tipo: "idea", textos: [t.titulo, t.clave] });
    if (t.tipo === "ojo") escenas.push({ tipo: "ojo", textos: [t.texto] });
    if (t.tipo === "cierre") escenas.push({ tipo: "cierre", textos: [t.recordar] });
  }
  return escenas.map((e) => ({ ...e, segundos: segundosDeLectura(e.textos.join(" ")) }));
}
