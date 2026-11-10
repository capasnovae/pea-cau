import { z } from "zod";

const uuidOpcional = z.preprocess((v) => (v === "" || v === undefined ? null : v), z.uuid().nullable());

/** Actualización obligatoria (spec §4.6): sobre un artículo o un módulo, con plazo y mini examen opcional. */
export const esquemaActualizacion = z
  .object({
    titulo: z.string().trim().min(1, "Poné un título.").max(160),
    descripcion_md: z.string().trim().max(4000).optional().default(""),
    plazo_dias: z.coerce
      .number()
      .int()
      .min(1, "El plazo va de 1 a 90 días.")
      .max(90, "El plazo va de 1 a 90 días."),
    articulo_id: uuidOpcional.optional().default(null),
    modulo_id: uuidOpcional.optional().default(null),
    examen_id: uuidOpcional.optional().default(null),
  })
  .superRefine((d, ctx) => {
    if (!d.articulo_id && !d.modulo_id)
      ctx.addIssue({ code: "custom", message: "Elegí el artículo o el módulo." });
  });

export type EstadoActualizacion = "pendiente" | "cumplida" | "vencida";

/** Una pendiente con la fecha ya pasada se muestra vencida aunque el job todavía no corrió. */
export function estadoVisible(
  estado: EstadoActualizacion,
  venceAt: string,
  ahora: Date,
): EstadoActualizacion {
  return estado === "pendiente" && Date.parse(venceAt) < ahora.getTime() ? "vencida" : estado;
}
