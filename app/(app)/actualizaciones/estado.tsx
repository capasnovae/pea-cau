import type { EstadoActualizacion } from "@/lib/dominio/actualizaciones";
import { cn } from "@/lib/utils/cn";

const ETIQUETA: Record<EstadoActualizacion, string> = {
  pendiente: "Pendiente",
  cumplida: "Cumplida",
  vencida: "Vencida",
};
const COLOR: Record<EstadoActualizacion, string> = {
  pendiente: "bg-warning-soft text-warning",
  cumplida: "bg-success-soft text-success",
  vencida: "bg-destructive-soft text-destructive",
};

export function EstadoChip({ estado }: { estado: EstadoActualizacion }) {
  return (
    <span className={cn("rounded-full px-2.5 py-1 text-xs font-bold", COLOR[estado])}>
      {ETIQUETA[estado]}
    </span>
  );
}
