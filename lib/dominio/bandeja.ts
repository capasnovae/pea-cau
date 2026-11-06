import { z } from "zod";
import { hoyAr } from "./calendario";

export const FILTROS_BANDEJA = ["entrada", "sin_leer", "anuncios", "enviados", "archivadas"] as const;
export type FiltroBandeja = (typeof FILTROS_BANDEJA)[number];
export const ETIQUETA_FILTRO: Record<FiltroBandeja, string> = {
  entrada: "Bandeja de entrada",
  sin_leer: "Sin leer",
  anuncios: "Anuncios",
  enviados: "Enviados",
  archivadas: "Archivados",
};

export function parseFiltro(v: string | undefined): FiltroBandeja {
  return (FILTROS_BANDEJA as readonly string[]).includes(v ?? "") ? (v as FiltroBandeja) : "entrada";
}

const cuerpo = z.string().trim().min(1, "Escribí un mensaje.").max(5000, "El mensaje es muy largo.");
const asunto = z.string().trim().min(1, "Poné un asunto.").max(150, "El asunto es muy largo.");

export const esquemaMensajeNuevo = z.object({
  destinatarios: z.array(z.uuid()).min(1, "Elegí al menos una persona.").max(50, "Máximo 50 personas."),
  asunto,
  cuerpo,
});
export const esquemaRespuesta = z.object({ cuerpo });
export const esquemaAnuncio = z.object({
  asunto,
  cuerpo,
  sede_id: z
    .union([z.literal(""), z.uuid()])
    .optional()
    .transform((v) => (v ? v : null)),
});

const DIAS = ["dom", "lun", "mar", "mié", "jue", "vie", "sáb"];

/** "HH:MM" si es de hoy, "ayer", el día abreviado si es de la última semana, o "D/M". Todo en hora argentina. */
export function fechaCorta(iso: string, ahora: Date): string {
  const fecha = new Date(iso);
  const dia = hoyAr(fecha);
  const diff = Math.round((Date.parse(hoyAr(ahora)) - Date.parse(dia)) / 86_400_000);
  if (diff <= 0) {
    return new Intl.DateTimeFormat("es-AR", {
      hour: "2-digit",
      minute: "2-digit",
      hour12: false,
      timeZone: "America/Argentina/Buenos_Aires",
    }).format(fecha);
  }
  if (diff === 1) return "ayer";
  if (diff < 7) return DIAS[new Date(`${dia}T12:00:00Z`).getUTCDay()]!;
  const [, m, d] = dia.split("-");
  return `${Number(d)}/${Number(m)}`;
}

export function puedeAnunciar(rol: string): boolean {
  return rol === "coordinador" || rol === "director" || rol === "admin";
}

export function iniciales(nombre: string): string {
  return nombre
    .trim()
    .split(/\s+/)
    .slice(0, 2)
    .map((p) => p[0]?.toUpperCase() ?? "")
    .join("");
}

export function mensajeErrorBandeja(mensaje: string | undefined): string {
  if (mensaje?.includes("destinatario no permitido")) return "Solo podés escribirle a gente de tu sede.";
  if (mensaje?.includes("los anuncios no admiten respuestas")) return "Este anuncio no admite respuestas.";
  if (mensaje?.includes("sin permiso")) return "No podés publicar anuncios para esa sede.";
  return "No pudimos enviar el mensaje.";
}
