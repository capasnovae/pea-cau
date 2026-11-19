// Atajos para escribir los guiones de los videos por módulo sin repetir tanto código.
import type { Estudiante, Icono, Linea, Plano, Tarjeta, Tono } from "./tipos.ts";

/** Línea de la narradora; marca: qué tarjeta o ítem se ilumina cuando empieza. */
export const n = (texto: string, marca?: number): Linea => ({ quien: "narradora", texto, marca });
/** Mensaje de la estudiante: escrito o de voz. */
export const es = (texto: string, modo: "escribe" | "audio" = "escribe"): Linea => ({ quien: "estudiante", modo, texto });
/** Respuesta escrita del asesor. */
export const as = (texto: string): Linea => ({ quien: "martin", modo: "escribe", texto });
/** Tarjeta: texto corto, tono, marca y, si hace falta, detalle y sello. */
export const t = (texto: string, tono: Tono, marca?: number, detalle?: string, sello?: string): Tarjeta => ({ texto, tono, marca, detalle, sello });

export const cap = (texto: string, numero?: string): Plano => ({ tipo: "capitulo", texto, numero });
export const tab = (
  titulo: string,
  icono: Icono,
  tarjetas: Tarjeta[],
  lineas: Linea[],
  extra: { numeradas?: boolean; columnas?: [string, string] } = {},
): Plano => ({ tipo: "tablero", titulo, icono, tarjetas, lineas, ...extra });
export const lista = (titulo: string, icono: Icono, items: string[], lineas: Linea[]): Plano => ({ tipo: "lista", titulo, icono, items, lineas });
export const chat = (estudiante: Estudiante, lineas: Linea[]): Plano => ({ tipo: "chat", estudiante, lineas });
export const cierre = (items: string[], lineas: Linea[]): Plano => ({ tipo: "cierre", items, lineas });

/** Estudiantes de los casos. El id elige un dibujo que existe (en estos videos no se muestra). */
export const persona = (nombre: string, detalle: string, i = 0): Estudiante => ({ id: i % 2 ? "sofia" : "lucia", nombre, detalle });

/** Apertura común: portada, «Qué vas a ver» con los temas del módulo y la frase de la narradora. */
export const apertura = (titulo: string, temas: string[], texto: string): Plano[] => [
  { tipo: "portada" },
  cap("Qué vas a ver"),
  tab(titulo, "check", temas.map((x) => t(x, "neutro", 0)), [n(texto, 0)], { numeradas: true }),
];
