import { z } from "zod";

export const TIPOS_PREGUNTA = [
  "opcion_multiple",
  "verdadero_falso",
  "escenario",
  "ordenar",
  "simulacion",
  "libre",
  "clasificar",
  "formulario",
] as const;
export type TipoPregunta = (typeof TIPOS_PREGUNTA)[number];
export const ETIQUETA_TIPO_PREGUNTA: Record<TipoPregunta, string> = {
  opcion_multiple: "Opción múltiple",
  verdadero_falso: "Verdadero o falso",
  escenario: "Escenario",
  ordenar: "Ordenar pasos",
  simulacion: "Simulación",
  libre: "Respuesta libre",
  clasificar: "Cuadro para clasificar",
  formulario: "Formulario simulado",
};

export const TIPOS_EXAMEN = [
  "modulo",
  "categoria",
  "nivel",
  "integrador",
  "ubicacion",
  "practica",
  "actualizacion",
] as const;
export type TipoExamen = (typeof TIPOS_EXAMEN)[number];
export const ETIQUETA_TIPO_EXAMEN: Record<TipoExamen, string> = {
  modulo: "Módulo",
  categoria: "Categoría",
  nivel: "Final de nivel",
  integrador: "Integrador",
  ubicacion: "Ubicación",
  practica: "Práctica",
  actualizacion: "Actualización",
};

export function notaFinal(puntajes: { puntaje: number; max: number }[]): number {
  const max = puntajes.reduce((a, p) => a + p.max, 0);
  if (max <= 0) return 0;
  return Math.round((100 * puntajes.reduce((a, p) => a + p.puntaje, 0)) / max);
}

export function aprobo(nota: number, minima: number): boolean {
  return nota >= minima;
}

export function formatoDuracion(segundos: number): string {
  const s = Math.max(0, Math.floor(segundos));
  const h = Math.floor(s / 3600);
  const m = Math.floor((s % 3600) / 60);
  const r = String(s % 60).padStart(2, "0");
  return h > 0 ? `${h}:${String(m).padStart(2, "0")}:${r}` : `${m}:${r}`;
}

export type EstadoExamen = "aprobado" | "en_curso" | "pendiente" | "disponible" | "en_espera";
export const ETIQUETA_ESTADO_EXAMEN: Record<EstadoExamen, string> = {
  aprobado: "Aprobado",
  en_curso: "En curso",
  pendiente: "Pendiente de corrección",
  disponible: "Disponible",
  en_espera: "En espera",
};

export function estadoExamen(e: {
  aprobado: boolean;
  en_curso: boolean;
  pendiente: boolean;
  intentos_restantes: number;
  espera_hasta: string | null;
}): EstadoExamen {
  if (e.aprobado) return "aprobado";
  if (e.en_curso) return "en_curso";
  if (e.pendiente) return "pendiente";
  if (e.intentos_restantes <= 0 && e.espera_hasta && Date.parse(e.espera_hasta) > Date.now())
    return "en_espera";
  return "disponible";
}

/** Igual que la base: minúsculas, sin acentos y con los espacios colapsados. */
export function normalizarTexto(s: string): string {
  return s
    .normalize("NFD")
    .replace(/\p{Diacritic}/gu, "")
    .toLowerCase()
    .replace(/\s+/g, " ")
    .trim();
}

const uuidOVacio = z
  .union([z.literal(""), z.uuid()])
  .optional()
  .nullable()
  .transform((v) => (v ? v : null));
const numero = (min: number, max: number) => z.coerce.number().int().min(min).max(max);
// Un checkbox destildado no viaja en el formulario: la clave puede faltar.
const checkbox = z
  .union([z.boolean(), z.literal("on"), z.literal("")])
  .optional()
  .transform((v) => v === true || v === "on");

const opcion = z.object({
  texto: z.string().trim().min(1, "Completá el texto de cada opción.").max(500),
  es_correcta: checkbox,
  grupo: z.string().trim().max(60).optional().default(""),
  explicacion: z
    .string()
    .trim()
    .max(400, "La explicación de una opción va en 400 caracteres.")
    .optional()
    .default(""),
});
const campo = z.object({
  id: z
    .string()
    .trim()
    .regex(/^[a-z0-9_]{1,30}$/, "Identificador de campo inválido."),
  etiqueta: z.string().trim().min(1).max(60),
  tipo: z.enum(["texto", "select"]),
  opciones: z.array(z.string().trim().min(1).max(80)).default([]),
  aceptadas: z.array(z.string().trim().min(1).max(200)).default([]),
});

export const esquemaPregunta = z
  .object({
    tipo: z.enum(TIPOS_PREGUNTA),
    enunciado_md: z.string().trim().min(1, "Escribí el enunciado.").max(4000),
    contexto_md: z.string().trim().max(4000).optional().default(""),
    explicacion_md: z.string().trim().max(4000).optional().default(""),
    rubrica_md: z.string().trim().max(4000).optional().default(""),
    puntaje_max: numero(1, 100).default(1),
    dificultad: numero(1, 3).default(1),
    caso_id: uuidOVacio,
    orden_en_caso: z.coerce.number().int().min(1).max(50).optional().nullable(),
    modulo_id: uuidOVacio,
    categoria_id: uuidOVacio,
    articulo_fuente_id: uuidOVacio,
    alcance: z.enum(["global", "sede"]),
    sede_id: uuidOVacio,
    estado: z.enum(["borrador", "publicado", "archivado"]),
    uso: z.enum(["examen", "practica"]).default("examen"),
    item_id: uuidOVacio,
    opciones: z.array(opcion).default([]),
    columnas: z.array(z.string().trim().min(1).max(60)).default([]),
    campos: z.array(campo).default([]),
  })
  .superRefine((p, ctx) => {
    const error = (message: string) => ctx.addIssue({ code: "custom", message });
    const correctas = p.opciones.filter((o) => o.es_correcta).length;
    switch (p.tipo) {
      case "opcion_multiple":
      case "escenario":
      case "simulacion":
        if (p.opciones.length < 2 || p.opciones.length > 8) error("Cargá entre 2 y 8 opciones.");
        else if (correctas < 1) error("Marcá al menos una opción correcta.");
        if (p.tipo === "simulacion" && !p.caso_id) error("Una simulación pertenece a un caso.");
        if (p.tipo === "escenario" && !p.contexto_md) error("El escenario necesita el contexto.");
        break;
      case "verdadero_falso":
        if (p.opciones.length !== 2 || correctas !== 1)
          error("Verdadero o falso lleva dos opciones y una correcta.");
        break;
      case "ordenar":
        if (p.opciones.length < 2 || p.opciones.length > 8) error("Cargá entre 2 y 8 pasos.");
        break;
      case "libre":
        if (!p.rubrica_md) error("La respuesta libre necesita una rúbrica.");
        break;
      case "clasificar":
        if (p.columnas.length < 2 || p.columnas.length > 6) error("Cargá entre 2 y 6 columnas.");
        if (p.opciones.length < 2 || p.opciones.length > 12) error("Cargá entre 2 y 12 elementos.");
        if (p.opciones.some((o) => !p.columnas.includes(o.grupo)))
          error("Cada elemento va en una columna existente.");
        break;
      case "formulario":
        if (p.campos.length < 1 || p.campos.length > 10) error("Cargá entre 1 y 10 campos.");
        if (p.campos.some((c) => c.tipo === "select" && c.opciones.length < 2))
          error("Cada lista necesita al menos 2 opciones.");
        if (p.campos.some((c) => c.aceptadas.length < 1))
          error("Cada campo necesita al menos un valor aceptado.");
        break;
    }
    if (p.alcance === "sede" && !p.sede_id) error("Elegí la sede.");
  });
export type PreguntaValida = z.infer<typeof esquemaPregunta>;

/** Convierte la pregunta validada al formato de la base (config visible, solución secreta y opciones). */
export function preguntaParaGuardar(p: PreguntaValida) {
  const config =
    p.tipo === "clasificar"
      ? { columnas: p.columnas }
      : p.tipo === "formulario"
        ? { campos: p.campos.map(({ aceptadas: _, ...c }) => c) }
        : null;
  const solucion =
    p.tipo === "formulario" ? Object.fromEntries(p.campos.map((c) => [c.id, c.aceptadas])) : null;
  const opciones =
    p.tipo === "libre" || p.tipo === "formulario"
      ? []
      : p.opciones.map((o, i) => ({
          texto: o.texto,
          es_correcta: p.tipo === "ordenar" || p.tipo === "clasificar" ? false : o.es_correcta,
          posicion_correcta: p.tipo === "ordenar" ? i + 1 : null,
          grupo: p.tipo === "clasificar" ? o.grupo : null,
          orden: i + 1,
          explicacion: o.explicacion || null,
        }));
  const { opciones: _o, columnas: _c, campos: _f, ...resto } = p;
  return {
    ...resto,
    contexto_md: resto.contexto_md || null,
    rubrica_md: p.tipo === "libre" ? resto.rubrica_md : null,
    caso_id: p.tipo === "simulacion" ? resto.caso_id : null,
    orden_en_caso: p.tipo === "simulacion" ? (resto.orden_en_caso ?? 1) : null,
    sede_id: p.alcance === "sede" ? resto.sede_id : null,
    item_id: p.uso === "practica" ? (resto.item_id ?? null) : null,
    config,
    solucion,
    opciones,
  };
}

const fuente = z.object({
  modulo_id: uuidOVacio,
  categoria_id: uuidOVacio,
  curso_id: uuidOVacio,
  cantidad: z
    .union([z.literal(""), z.coerce.number().int().min(1).max(100)])
    .optional()
    .nullable()
    .transform((v) => (v === "" || v == null ? null : v)),
});

export const esquemaExamen = z
  .object({
    titulo: z.string().trim().min(1, "Poné un título.").max(150),
    tipo: z.enum(TIPOS_EXAMEN),
    modulo_id: uuidOVacio,
    categoria_id: uuidOVacio,
    curso_id: uuidOVacio,
    cantidad_preguntas: numero(1, 100),
    nota_minima: numero(1, 100).default(80),
    max_intentos: numero(1, 10).default(3),
    espera_horas: numero(0, 720).default(24),
    tiempo_limite_min: z
      .union([z.literal(""), z.coerce.number().int().min(1).max(300)])
      .optional()
      .nullable()
      .transform((v) => (v === "" || v == null ? null : v)),
    mezclar: checkbox,
    alcance: z.enum(["global", "sede"]),
    sede_id: uuidOVacio,
    estado: z.enum(["borrador", "publicado", "archivado"]),
    fuentes: z.array(fuente).default([]),
  })
  .superRefine((e, ctx) => {
    const error = (message: string) => ctx.addIssue({ code: "custom", message });
    if (e.tipo === "modulo" && !e.modulo_id) error("Elegí el módulo.");
    if (e.tipo === "categoria" && !e.categoria_id) error("Elegí la categoría.");
    if (e.tipo === "nivel" && !e.curso_id) error("Elegí el nivel.");
    if (e.tipo === "integrador" && e.fuentes.length === 0) error("Sumá al menos una fuente.");
    if (e.tipo === "practica" && !e.modulo_id && !e.categoria_id)
      error("Elegí el módulo o la categoría de la práctica.");
    if (e.tipo === "actualizacion" && !e.modulo_id && !e.categoria_id)
      error("Elegí el módulo o la categoría del mini examen.");
    if (e.fuentes.some((f) => [f.modulo_id, f.categoria_id, f.curso_id].filter(Boolean).length !== 1))
      error("Cada fuente es un módulo, una categoría o un nivel.");
    if (e.alcance === "sede" && !e.sede_id) error("Elegí la sede.");
  });

export const esquemaRespuesta = z.object({
  pregunta_id: z.uuid(),
  opcion_ids: z.array(z.uuid()).max(20).nullable().default(null),
  orden: z.array(z.uuid()).max(20).nullable().default(null),
  texto: z.string().max(5000).nullable().default(null),
  valores: z.record(z.string(), z.string().max(500)).nullable().default(null),
});
export type RespuestaExamen = z.infer<typeof esquemaRespuesta>;

export const esquemaCorreccion = z.object({
  respuesta_id: z.uuid(),
  puntaje: z.coerce.number().min(0, "El puntaje no puede ser negativo."),
  devolucion: z.string().trim().max(2000).default(""),
});

const ERRORES: { clave: string; codigo: string; mensaje: string }[] = [
  { clave: "ya aprobado", codigo: "ya-aprobado", mensaje: "Ya lo aprobaste." },
  {
    clave: "en espera",
    codigo: "en-espera",
    mensaje: "Agotaste los intentos de este ciclo. Probá más tarde.",
  },
  { clave: "sin preguntas", codigo: "sin-preguntas", mensaje: "Este examen todavía no tiene preguntas." },
  { clave: "no disponible", codigo: "no-disponible", mensaje: "Completá lo anterior para rendirlo." },
  {
    clave: "pendiente de corrección",
    codigo: "pendiente",
    mensaje: "Tenés un intento pendiente de corrección.",
  },
  { clave: "no habilitada", codigo: "no-habilitada", mensaje: "No tenés el examen de ubicación habilitado." },
  { clave: "tiempo agotado", codigo: "tiempo", mensaje: "Se terminó el tiempo." },
  { clave: "intento cerrado", codigo: "cerrado", mensaje: "Este intento ya se entregó." },
];

/** Traduce un error de la base a un código (para la URL) y una frase corta. */
export function errorExamen(mensajeBase: string | undefined): { codigo: string; mensaje: string } {
  const e = ERRORES.find((x) => mensajeBase?.includes(x.clave));
  return e
    ? { codigo: e.codigo, mensaje: e.mensaje }
    : { codigo: "error", mensaje: "No pudimos completar la acción." };
}

export function mensajeDeCodigo(codigo: string | undefined): string | null {
  return (
    ERRORES.find((x) => x.codigo === codigo)?.mensaje ??
    (codigo === "error" ? "No pudimos completar la acción." : null)
  );
}

export const esquemaCaso = z
  .object({
    titulo: z.string().trim().min(1, "Poné un título.").max(150),
    contexto_md: z.string().trim().max(4000).default(""),
    categoria_id: uuidOVacio,
    alcance: z.enum(["global", "sede"]),
    sede_id: uuidOVacio,
    estado: z.enum(["borrador", "publicado", "archivado"]),
  })
  .refine((c) => c.alcance === "global" || c.sede_id, { message: "Elegí la sede." })
  .transform((c) => ({ ...c, sede_id: c.alcance === "sede" ? c.sede_id : null }));
