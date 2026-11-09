/** Panel de coordinación (spec §4.7): atrasos, tasa de acierto y exportación a CSV. */
import { ROLES_EDITORES, type RolApp } from "./roles";

export type FilaAsesor = {
  usuario_id: string;
  nombre: string;
  apellido: string;
  sede: string | null;
  equipo: string | null;
  puesto: string | null;
  nivel_actual: number | null;
  cursos_total: number;
  cursos_cumplidos: number;
  ultima_actividad: string | null;
  consignas_vencidas: number;
  cert_vencidas: number;
  cert_por_vencer: number;
};

export type FilaPregunta = {
  pregunta_id: string;
  enunciado_md: string;
  tipo: string;
  uso: string;
  categoria: string | null;
  modulo: string | null;
  respuestas: number;
  aciertos: number;
};

export const DIAS_SIN_ACTIVIDAD = 14;
export const MINIMO_RESPUESTAS = 5;
const DIA = 86_400_000;

export function motivosAtraso(f: FilaAsesor, ahora: Date, dias = DIAS_SIN_ACTIVIDAD): string[] {
  const m: string[] = [];
  if (!f.ultima_actividad) m.push("Sin actividad");
  else {
    const n = Math.floor((ahora.getTime() - Date.parse(f.ultima_actividad)) / DIA);
    if (n > dias) m.push(`Sin actividad hace ${n} días`);
  }
  if (f.consignas_vencidas > 0)
    m.push(
      `${f.consignas_vencidas} ${f.consignas_vencidas === 1 ? "consigna vencida" : "consignas vencidas"}`,
    );
  if (f.cert_vencidas > 0) m.push("Certificación vencida");
  if (f.cert_por_vencer > 0) m.push("Vence pronto");
  return m;
}

export function tasa(aciertos: number, respuestas: number): number | null {
  return respuestas > 0 ? Math.round((aciertos / respuestas) * 100) : null;
}

/** Preguntas a revisar: de menor a mayor tasa, solo con suficientes respuestas para que el número diga algo. */
export function rankingPreguntas<T extends FilaPregunta>(filas: T[], minimo = MINIMO_RESPUESTAS): T[] {
  return filas
    .filter((f) => f.respuestas >= minimo)
    .sort((a, b) => a.aciertos / a.respuestas - b.aciertos / b.respuestas || b.respuestas - a.respuestas);
}

/** Tasa por categoría; con menos respuestas que el mínimo, sin tasa (va al final). */
export function porCategoria(filas: FilaPregunta[], minimo = MINIMO_RESPUESTAS) {
  const m = new Map<string, { respuestas: number; aciertos: number }>();
  for (const f of filas) {
    const k = f.categoria ?? "Sin categoría";
    const a = m.get(k) ?? { respuestas: 0, aciertos: 0 };
    m.set(k, { respuestas: a.respuestas + f.respuestas, aciertos: a.aciertos + f.aciertos });
  }
  return [...m]
    .map(([categoria, v]) => ({
      categoria,
      ...v,
      tasa: v.respuestas >= minimo ? tasa(v.aciertos, v.respuestas) : null,
    }))
    .sort((a, b) => (a.tasa ?? 101) - (b.tasa ?? 101));
}

/** Solo quien edita contenido puede abrir la pregunta desde el panel. */
export function enlacePregunta(rol: RolApp, id: string): string | null {
  return ROLES_EDITORES.includes(rol) ? `/contenido/preguntas/${id}` : null;
}

/** CSV para Excel en es-AR: BOM, ";" como separador, CRLF y celdas que no se ejecutan como fórmula. */
export function aCsv(
  columnas: { clave: string; titulo: string }[],
  filas: Record<string, unknown>[],
): string {
  const celda = (v: unknown) => {
    if (v === null || v === undefined) return "";
    let t = String(v);
    if (typeof v === "string" && /^[=+\-@\t\r]/.test(t)) t = `'${t}`;
    return /[";\n\r]/.test(t) ? `"${t.replace(/"/g, '""')}"` : t;
  };
  const lineas = [
    columnas.map((c) => celda(c.titulo)),
    ...filas.map((f) => columnas.map((c) => celda(f[c.clave]))),
  ];
  return "﻿" + lineas.map((l) => l.join(";")).join("\r\n") + "\r\n";
}
