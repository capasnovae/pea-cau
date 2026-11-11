import { z } from "zod";
import type { RolApp } from "./roles";

export type DestinoConsigna = "usuario" | "equipo" | "subrol" | "sede";
export type EstadoAsignacion = "pendiente" | "en_curso" | "hecha" | "vencida";

export function destinosPermitidos(rol: RolApp): DestinoConsigna[] {
  if (rol === "lider") return ["usuario", "equipo"];
  if (rol === "coordinador" || rol === "director" || rol === "admin")
    return ["usuario", "equipo", "subrol", "sede"];
  return [];
}

export const ETIQUETA_DESTINO: Record<DestinoConsigna, string> = {
  usuario: "Una persona",
  equipo: "Un equipo",
  subrol: "Un subrol",
  sede: "Toda la sede",
};

export const ETIQUETA_ESTADO: Record<EstadoAsignacion, string> = {
  pendiente: "Pendiente",
  en_curso: "En curso",
  hecha: "Hecha",
  vencida: "Vencida",
};

export const ETIQUETA_RECURRENCIA = {
  ninguna: "No se repite",
  diaria: "Todos los días",
  semanal: "Todas las semanas",
  mensual: "Todos los meses",
} as const;
export const ETIQUETA_PRIORIDAD = { baja: "Baja", normal: "Normal", alta: "Alta" } as const;

const vacioANull = (v: unknown) => (v === "" || v === undefined ? null : v);
const uuidOpcional = z.preprocess(vacioANull, z.uuid().nullable());

export const esquemaConsigna = z
  .object({
    titulo: z.string().trim().min(1, "Falta el título.").max(160),
    detalle_md: z.preprocess((v) => (v ?? "") as string, z.string().trim().max(5000)),
    tipo: z.enum(["tarea", "lectura"]),
    articulo_id: uuidOpcional,
    destino: z.enum(["usuario", "equipo", "subrol", "sede"]),
    destino_usuario_id: uuidOpcional,
    destino_equipo_id: uuidOpcional,
    destino_subrol_id: uuidOpcional,
    sede_id: z.uuid("Elegí la sede."),
    fecha_limite: z.preprocess(vacioANull, z.iso.date().nullable()),
    prioridad: z.enum(["baja", "normal", "alta"]),
    recurrencia: z.enum(["ninguna", "diaria", "semanal", "mensual"]),
    requiere_evidencia: z.preprocess((v) => v === true || v === "on" || v === "true", z.boolean()),
  })
  .superRefine((d, ctx) => {
    if (d.tipo === "lectura" && !d.articulo_id)
      ctx.addIssue({ code: "custom", path: ["articulo_id"], message: "Elegí el artículo a leer." });
    if (d.recurrencia !== "ninguna" && d.fecha_limite) {
      ctx.addIssue({
        code: "custom",
        path: ["fecha_limite"],
        message: "Una consigna que se repite no lleva fecha límite: vence al final de cada período.",
      });
    }
    const campo = {
      usuario: d.destino_usuario_id,
      equipo: d.destino_equipo_id,
      subrol: d.destino_subrol_id,
      sede: "ok",
    }[d.destino];
    if (!campo) ctx.addIssue({ code: "custom", path: ["destino"], message: "Elegí a quién va la consigna." });
  })
  .transform((d) => ({
    ...d,
    articulo_id: d.tipo === "lectura" ? d.articulo_id : null,
    destino_usuario_id: d.destino === "usuario" ? d.destino_usuario_id : null,
    destino_equipo_id: d.destino === "equipo" ? d.destino_equipo_id : null,
    destino_subrol_id: d.destino === "subrol" ? d.destino_subrol_id : null,
  }));

export type DatosConsigna = z.infer<typeof esquemaConsigna>;
