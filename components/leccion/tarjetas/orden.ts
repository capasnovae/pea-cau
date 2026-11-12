import type { Tarjeta } from "@/lib/dominio/lecciones";

export type TarjetaConPregunta =
  | Exclude<Tarjeta, { tipo: "probalo" } | { tipo: "video" }>
  | { tipo: "probalo"; preguntaId: string }
  | { tipo: "video"; ruta: string; url: string };

/**
 * Arma la secuencia que ve el asesor: cada "probalo N" se reemplaza por la pregunta N del Probalo;
 * las preguntas que ninguna tarjeta ubica (agregadas desde la app, de una sede) van antes del cierre,
 * para que la lección siempre se pueda completar. El video aparece solo si hay enlace para verlo.
 */
export function ordenarTarjetas(
  tarjetas: Tarjeta[],
  preguntaIds: string[],
  videoUrl?: string | null,
): TarjetaConPregunta[] {
  const usadas = new Set<string>();
  const salida: TarjetaConPregunta[] = [];
  for (const t of tarjetas) {
    if (t.tipo === "probalo") {
      const id = preguntaIds[t.n - 1];
      if (id && !usadas.has(id)) {
        usadas.add(id);
        salida.push({ tipo: "probalo", preguntaId: id });
      }
    } else if (t.tipo === "video") {
      if (videoUrl) salida.push({ tipo: "video", ruta: t.ruta, url: videoUrl });
    } else {
      salida.push(t);
    }
  }
  const sueltas = preguntaIds
    .filter((id) => !usadas.has(id))
    .map((id): TarjetaConPregunta => ({ tipo: "probalo", preguntaId: id }));
  const i = salida.findIndex((t) => t.tipo === "cierre");
  salida.splice(i < 0 ? salida.length : i, 0, ...sueltas);
  return salida;
}
