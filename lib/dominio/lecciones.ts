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

/** Lección por tarjetas (versión 2): una secuencia corta que enseña con un caso. La base la vuelve a validar. */
export const LIMITES_TARJETAS = {
  minTarjetas: 5,
  maxTarjetas: 10,
  titulo: 80,
  texto: 500,
  consulta: 300,
  opcion: 120,
  porque: 200,
  clave: 120,
} as const;
const T = LIMITES_TARJETAS;
const texto = (max: number) => z.string().trim().min(1).max(max);

const tarjeta = z.discriminatedUnion("tipo", [
  z.object({ tipo: z.literal("video"), ruta: texto(200) }),
  z.object({
    tipo: z.literal("caso"),
    persona: texto(T.titulo),
    canal: z.enum(["mostrador", "telefono", "whatsapp"]),
    consulta: texto(T.consulta),
  }),
  z.object({
    tipo: z.literal("preguntar"),
    opciones: z
      .array(z.object({ texto: texto(T.opcion), clave: z.boolean(), porque: texto(T.porque) }))
      .min(3)
      .max(5)
      .refine((os) => os.some((o) => o.clave), "Marcá al menos una pregunta clave."),
  }),
  z.object({
    tipo: z.literal("idea"),
    titulo: texto(T.titulo),
    texto: texto(T.texto),
    clave: texto(T.clave),
    ejemplo: texto(T.texto).optional(),
  }),
  z.object({ tipo: z.literal("probalo"), n: z.number().int().min(1).max(3) }),
  z.object({ tipo: z.literal("ojo"), texto: texto(T.texto) }),
  z.object({ tipo: z.literal("cierre"), resolucion: texto(T.texto), recordar: texto(T.clave) }),
]);

export type Tarjeta = z.infer<typeof tarjeta>;
export type LeccionV2 = { version: 2; tarjetas: Tarjeta[] };

export const esquemaLeccionV2 = z
  .object({ version: z.literal(2), tarjetas: z.array(tarjeta) })
  .superRefine((l, ctx) => {
    const tipos = l.tarjetas.map((t) => t.tipo);
    const cuenta = (x: string) => tipos.filter((t) => t === x).length;
    // El video es opcional y no cuenta en el tope: entre 5 y 10 tarjetas de contenido
    const contenido = tipos.length - cuenta("video");
    if (contenido < T.minTarjetas || contenido > T.maxTarjetas)
      ctx.addIssue({
        code: "custom",
        message: `Entre ${T.minTarjetas} y ${T.maxTarjetas} tarjetas, sin contar el video.`,
      });
    if (cuenta("caso") !== 1) ctx.addIssue({ code: "custom", message: "Tiene que haber un caso." });
    if (cuenta("cierre") !== 1 || tipos.at(-1) !== "cierre")
      ctx.addIssue({ code: "custom", message: "La última tarjeta es el cierre." });
    if (cuenta("video") > 1 || (cuenta("video") === 1 && tipos[0] !== "video"))
      ctx.addIssue({ code: "custom", message: "El video va primero." });
  });

export function esLeccionV2(l: unknown): l is LeccionV2 {
  return typeof l === "object" && l !== null && (l as { version?: unknown }).version === 2;
}

/** Todo el texto que se lee de una tarjeta. */
function textosDeTarjeta(t: Tarjeta): string[] {
  switch (t.tipo) {
    case "caso":
      return [t.persona, t.consulta];
    case "preguntar":
      return t.opciones.flatMap((o) => [o.texto, o.porque]);
    case "idea":
      return [t.titulo, t.texto, t.ejemplo ?? ""];
    case "ojo":
      return [t.texto];
    case "cierre":
      return [t.resolucion, t.recordar];
    default:
      return [];
  }
}

const PALABRAS_POR_MINUTO = 200;

export function minutosDeLectura(l: Leccion | LeccionV2): number {
  const texto = esLeccionV2(l)
    ? l.tarjetas.flatMap(textosDeTarjeta).join(" ")
    : [...l.resumen, ...l.ejemplos.flatMap((e) => [e.consulta, e.respuesta]), ...l.ojo].join(" ");
  const palabras = texto.split(/\s+/).filter(Boolean).length;
  return Math.max(1, Math.ceil(palabras / PALABRAS_POR_MINUTO));
}
