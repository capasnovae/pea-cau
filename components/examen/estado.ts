import type { EstadoExamen } from "@/lib/dominio/examenes";

export const COLOR_ESTADO: Record<EstadoExamen, string> = {
  aprobado: "bg-success-soft text-success",
  en_curso: "bg-primary-soft text-primary-strong",
  pendiente: "bg-warning-soft text-warning",
  disponible: "bg-primary-soft text-primary-strong",
  en_espera: "bg-background text-muted",
};
