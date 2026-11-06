import { z } from "zod";

export type Mes = { anio: number; mes: number };

const MESES = [
  "Enero",
  "Febrero",
  "Marzo",
  "Abril",
  "Mayo",
  "Junio",
  "Julio",
  "Agosto",
  "Septiembre",
  "Octubre",
  "Noviembre",
  "Diciembre",
];
export const DIAS_SEMANA = ["Lun", "Mar", "Mié", "Jue", "Vie", "Sáb", "Dom"];

/** Fecha ISO (AAAA-MM-DD) de "hoy" en Argentina. */
export function hoyAr(ahora: Date = new Date()): string {
  return new Intl.DateTimeFormat("en-CA", { timeZone: "America/Argentina/Buenos_Aires" }).format(ahora);
}

export function parseMes(valor: string | undefined, hoy: Date): Mes {
  const m = /^(\d{4})-(\d{2})$/.exec(valor ?? "");
  const mes = m ? Number(m[2]) : 0;
  if (m && mes >= 1 && mes <= 12) return { anio: Number(m[1]), mes };
  const [anio, mesHoy] = hoyAr(hoy).split("-").map(Number);
  return { anio: anio!, mes: mesHoy! };
}

export function claveMes(m: Mes): string {
  return `${m.anio}-${String(m.mes).padStart(2, "0")}`;
}

export function mesVecino(m: Mes, delta: -1 | 1): Mes {
  const total = m.anio * 12 + (m.mes - 1) + delta;
  return { anio: Math.floor(total / 12), mes: (total % 12) + 1 };
}

export function nombreMes(m: Mes): string {
  return `${MESES[m.mes - 1]} ${m.anio}`;
}

function iso(d: Date): string {
  return d.toISOString().slice(0, 10);
}

/** Semanas (lunes a domingo) que cubren el mes, con fechas ISO; incluye días de relleno. */
export function gridMes(m: Mes): string[][] {
  const primero = new Date(Date.UTC(m.anio, m.mes - 1, 1));
  const ultimo = new Date(Date.UTC(m.anio, m.mes, 0));
  const desfase = (primero.getUTCDay() + 6) % 7; // lunes = 0
  const cursor = new Date(primero);
  cursor.setUTCDate(1 - desfase);
  const semanas: string[][] = [];
  while (cursor <= ultimo) {
    const semana: string[] = [];
    for (let i = 0; i < 7; i++) {
      semana.push(iso(cursor));
      cursor.setUTCDate(cursor.getUTCDate() + 1);
    }
    semanas.push(semana);
  }
  return semanas;
}

export function agruparPorDia<T extends { fecha: string }>(filas: T[]): Map<string, T[]> {
  const m = new Map<string, T[]>();
  for (const f of filas) m.set(f.fecha, [...(m.get(f.fecha) ?? []), f]);
  return m;
}

export type Categoria = "consigna" | "capacitacion" | "evento";
export const COLOR_CATEGORIA: Record<Categoria, string> = {
  consigna: "#c2410c",
  capacitacion: "#0f766e",
  evento: "#4f46e5",
};
export const ETIQUETA_CATEGORIA: Record<Categoria, string> = {
  consigna: "Consignas",
  capacitacion: "Capacitaciones",
  evento: "Eventos",
};

export const esquemaEvento = z.object({
  titulo: z.string().trim().min(1, "Poné un título.").max(120),
  descripcion: z.string().trim().max(2000).default(""),
  fecha: z.iso.date("Elegí una fecha."),
  hora: z
    .union([z.literal(""), z.string().regex(/^([01]\d|2[0-3]):[0-5]\d$/, "Hora inválida.")])
    .optional()
    .transform((v) => (v ? v : null)),
  tipo: z.enum(["capacitacion", "evento"]),
  sede_id: z
    .union([z.literal(""), z.uuid()])
    .optional()
    .transform((v) => (v ? v : null)),
});
