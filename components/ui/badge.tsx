import { cn } from "@/lib/utils/cn";
import type { HTMLAttributes } from "react";

type Tono = "neutro" | "primario" | "exito" | "aviso" | "peligro" | "oro";

const tonos: Record<Tono, string> = {
  neutro: "border border-border",
  primario: "bg-primary-soft text-primary-strong",
  exito: "bg-success-soft text-success",
  aviso: "bg-warning-soft text-warning",
  peligro: "bg-destructive-soft text-destructive",
  oro: "bg-gold-soft text-ink",
};

export function Badge({
  className,
  tono = "neutro",
  ...props
}: HTMLAttributes<HTMLSpanElement> & { tono?: Tono }) {
  return (
    <span
      className={cn(
        "inline-flex h-6 items-center gap-1 rounded-full px-2.5 text-micro font-semibold",
        tonos[tono],
        className,
      )}
      {...props}
    />
  );
}
