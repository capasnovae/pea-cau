import Link from "next/link";
import { cn } from "@/lib/utils/cn";

export function Pestanas({
  opciones,
  actual,
}: {
  opciones: { href: string; etiqueta: string; clave: string }[];
  actual: string;
}) {
  return (
    <div role="tablist" className="flex gap-6 border-b border-border">
      {opciones.map((o) => (
        <Link
          key={o.clave}
          href={o.href}
          role="tab"
          aria-selected={o.clave === actual}
          className={cn(
            "-mb-px border-b-[3px] pb-2.5 text-[15px] font-bold",
            o.clave === actual
              ? "border-primary text-primary-strong"
              : "border-transparent text-muted hover:text-ink",
          )}
        >
          {o.etiqueta}
        </Link>
      ))}
    </div>
  );
}
