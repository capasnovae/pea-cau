import { cn } from "@/lib/utils/cn";
import type { ButtonHTMLAttributes } from "react";

type Variante = "primario" | "secundario" | "suave" | "peligro" | "fantasma";
type Tamano = "sm" | "md" | "lg";

const estilos: Record<Variante, string> = {
  primario: "bg-primary text-primary-foreground hover:bg-primary-strong",
  secundario: "border border-border-control bg-card text-primary-strong hover:bg-primary-soft",
  suave: "bg-primary-soft text-primary-strong hover:bg-primary-soft/70",
  peligro: "bg-destructive text-primary-foreground hover:opacity-90",
  fantasma: "hover:bg-background",
};

const tamanos: Record<Tamano, string> = {
  sm: "h-9 px-3 text-ui",
  md: "h-11 px-4 text-ui",
  lg: "h-13 px-5 text-base",
};

export function Button({
  className,
  variante = "primario",
  tamano = "md",
  ...props
}: ButtonHTMLAttributes<HTMLButtonElement> & { variante?: Variante; tamano?: Tamano }) {
  return (
    <button
      className={cn(
        "inline-flex items-center justify-center gap-2 rounded-boton font-bold transition active:scale-[0.97] disabled:pointer-events-none disabled:opacity-50",
        tamanos[tamano],
        estilos[variante],
        className,
      )}
      {...props}
    />
  );
}
