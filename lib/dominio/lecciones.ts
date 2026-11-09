import { z } from "zod";

/** Topes de la lección (spec §4.10). La base los vuelve a validar con leccion_valida. */
export const LIMITES_LECCION = {
  resumen: 5,
  ejemplos: 4,
  ojo: 4,
  idea: 200,
  consulta: 200,
  respuesta: 400,
} as const;

export type Ejemplo = { consulta: string; respuesta: string };
export type Leccion = { resumen: string[]; ejemplos: Ejemplo[]; ojo: string[] };

const L = LIMITES_LECCION;
const renglones = (max: number, mensaje: string) =>
  z
    .array(z.string())
    .default([])
    .transform((xs) => xs.map((x) => x.trim()).filter(Boolean))
    .pipe(z.array(z.string().max(max, mensaje)));

export const esquemaLeccion = z.object({
  resumen: renglones(L.idea, `Cada idea, hasta ${L.idea} caracteres.`).pipe(
    z
      .array(z.string())
      .min(1, "Poné al menos una idea clave.")
      .max(L.resumen, `Hasta ${L.resumen} ideas clave.`),
  ),
  ejemplos: z
    .array(z.object({ consulta: z.string(), respuesta: z.string() }))
    .default([])
    .transform((xs) =>
      xs
        .map((e) => ({ consulta: e.consulta.trim(), respuesta: e.respuesta.trim() }))
        .filter((e) => e.consulta || e.respuesta),
    )
    .pipe(
      z
        .array(
          z.object({
            consulta: z
              .string()
              .min(1, "Falta la consulta.")
              .max(L.consulta, `La consulta, hasta ${L.consulta} caracteres.`),
            respuesta: z
              .string()
              .min(1, "Falta qué responder.")
              .max(L.respuesta, `La respuesta, hasta ${L.respuesta} caracteres.`),
          }),
        )
        .min(1, "Poné al menos un ejemplo.")
        .max(L.ejemplos, `Hasta ${L.ejemplos} ejemplos.`),
    ),
  ojo: renglones(L.idea, `Cada "ojo con", hasta ${L.idea} caracteres.`).pipe(
    z.array(z.string()).max(L.ojo, `Hasta ${L.ojo} "ojo con".`),
  ),
});

const PALABRAS_POR_MINUTO = 200;

export function minutosDeLectura(l: Leccion): number {
  const texto = [...l.resumen, ...l.ejemplos.flatMap((e) => [e.consulta, e.respuesta]), ...l.ojo].join(" ");
  const palabras = texto.split(/\s+/).filter(Boolean).length;
  return Math.max(1, Math.ceil(palabras / PALABRAS_POR_MINUTO));
}
