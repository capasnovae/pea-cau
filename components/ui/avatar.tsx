import { iniciales } from "@/lib/dominio/bandeja";
import { cn } from "@/lib/utils/cn";

const PARES = ["--nivel-1", "--nivel-2", "--nivel-3", "--nivel-4", "--nivel-cap"];

/** Avatar con iniciales. El color sale del nombre, entre los pares de la paleta de niveles. */
export function AvatarIniciales({ nombre, className }: { nombre: string; className?: string }) {
  const t = PARES[[...nombre].reduce((a, c) => a + c.charCodeAt(0), 0) % PARES.length]!;
  return (
    <span
      aria-hidden="true"
      className={cn(
        "flex size-10 shrink-0 items-center justify-center rounded-full text-sm font-extrabold",
        className,
      )}
      style={{ background: `var(${t}-soft)`, color: `var(${t}-fg)` }}
    >
      {iniciales(nombre) || "?"}
    </span>
  );
}
