import { z } from "zod";
import { formatearFecha } from "./contenido";

export type EstadoCertificado = "vigente" | "vencida" | "revocada";

/** Igual que estado_efectivo en la base: vencida por fecha aunque el estado guardado diga vigente. */
export function estadoEfectivo(
  estado: EstadoCertificado,
  venceAt: string | null,
  ahora: Date,
): EstadoCertificado {
  if (estado === "revocada") return "revocada";
  if (estado === "vencida" || (venceAt && Date.parse(venceAt) < ahora.getTime())) return "vencida";
  return "vigente";
}

export const ETIQUETA_ESTADO_CERT: Record<EstadoCertificado, string> = {
  vigente: "Vigente",
  vencida: "Vencido",
  revocada: "Revocado",
};

export const COLOR_ESTADO_CERT: Record<EstadoCertificado, string> = {
  vigente: "bg-success-soft text-success",
  vencida: "bg-warning-soft text-warning",
  revocada: "bg-[#fef2f2] text-[#b91c1c]",
};

export function textoVencimiento(venceAt: string | null): string {
  return venceAt ? `Vence el ${formatearFecha(venceAt)}` : "Sin vencimiento";
}

export function urlVerificacion(origen: string, codigo: string): string {
  return `${origen.replace(/\/+$/, "")}/verificar/${codigo}`;
}

export function normalizarCodigo(c: string): string {
  return c.replace(/[\s-]/g, "").toUpperCase();
}

export const esquemaInsignia = z.object({
  nombre: z.string().trim().min(1, "Poné un nombre.").max(60),
  descripcion: z.string().trim().max(300).default(""),
});

export const esquemaRevocacion = z.object({
  motivo: z.string().trim().min(1, "Escribí el motivo.").max(300),
});
