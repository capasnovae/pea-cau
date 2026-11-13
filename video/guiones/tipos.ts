// Forma del guion de un video con personajes. Lo usan render.ts (voces y tiempos) y la escena de Revideo (lo que se ve).

export type Quien = "estudiante" | "martin" | "narradora" | "nadie";

export type Linea = {
  quien: Quien;
  texto: string;
  /** escribe: aparece como mensaje mientras se lee · audio: mensaje de voz · congela: la narradora frena la escena */
  modo?: "escribe" | "audio" | "congela";
  /** El mensaje queda a medio escribir (el error de apuro). */
  corta?: boolean;
  /** Índice de lo que aparece o se tilda en pantalla cuando empieza esta línea. */
  marca?: number;
  /** Silencio después de la línea, en segundos (o la duración de un plano sin voz). */
  pausa?: number;
};

export type Tono = "ok" | "aviso" | "mal" | "neutro";
export type Tarjeta = { texto: string; detalle?: string; tono: Tono; columna?: 0 | 1; marca?: number };

type Base = { lineas?: Linea[] };
export type Plano = Base &
  (
    | { tipo: "portada" }
    | { tipo: "escena"; lugar: "colectivo" | "casa" | "cau"; rotulo: string }
    | { tipo: "chat"; sigue?: boolean; borra?: boolean }
    | { tipo: "nota"; texto: string; detalle?: string }
    | {
        tipo: "tablero";
        titulo: string;
        icono?: "lupa" | "calendario" | "estrella" | "alerta";
        numeradas?: boolean;
        columnas?: [string, string];
        tarjetas: Tarjeta[];
      }
    | { tipo: "lista"; titulo: string; items: string[] }
    | { tipo: "cierre"; items: string[] }
  );

/** musica: "lofi" (por defecto) o "suave" (piano y cuerdas, la de Cambio de modalidad). */
/** El estudiante del caso: id del dibujo (public/peeps/<id>-*.svg), nombre, lo que se ve debajo del nombre en el chat y su voz. */
export type Estudiante = { id: string; nombre: string; detalle: string; voz?: string; velocidad?: string };
export type Guion = { titulo: string; bajada: string; musica?: "lofi" | "suave"; estudiante: Estudiante; planos: Plano[] };

/** Palabra dicha: inicio y duración en segundos desde que empieza la línea. */
export type Palabra = { t: number; d: number; p: string };

/** Línea con su audio ya medido y su lugar en la línea de tiempo del video. */
export type LineaConTiempo = Linea & { inicio: number; dur: number; palabras: Palabra[] };
export type PlanoConTiempo = Plano & { inicio: number; fin: number; lineas: LineaConTiempo[] };
