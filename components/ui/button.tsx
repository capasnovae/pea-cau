import { cn } from "@/lib/utils/cn";
import type { ButtonHTMLAttributes } from "react";

type Variante = "primario" | "secundario" | "peligro" | "fantasma";

const estilos: Record<Variante, string> = {
  primario: "bg-primary text-primary-foreground hover:bg-primary-strong",
  secundario: "border border-border bg-card text-primary-strong hover:bg-primary-soft",
  peligro: "bg-destructive text-white hover:opacity-90",
  fantasma: "hover:bg-background",
};

export function Button({
  className,
  variante = "primario",
  ...props
}: ButtonHTMLAttributes<HTMLButtonElement> & { variante?: Variante }) {
  return (
    <button
      className={cn(
        "inline-flex h-11 items-center justify-center gap-2 rounded-[14px] px-4 text-sm font-bold transition focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-ring disabled:pointer-events-none disabled:opacity-50",
        estilos[variante],
        className,
      )}
      {...props}
    />
  );
}
