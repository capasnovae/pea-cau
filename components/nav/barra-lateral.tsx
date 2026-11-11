"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import type { ItemMenu } from "@/lib/dominio/roles";
import { cn } from "@/lib/utils/cn";
import { IconoNav } from "./iconos";
import { useIndicador } from "./indicador";

export function esActivo(ruta: string, href: string): boolean {
  const base = href.startsWith("/admin/") ? "/admin" : href.startsWith("/equipo/") ? "/equipo" : href;
  return ruta === base || ruta.startsWith(`${base}/`);
}

export function Contador({ n }: { n: number }) {
  if (n <= 0) return null;
  return (
    <span
      key={n}
      className="animate-pop ml-1 rounded-full bg-gold px-1.5 text-[10px] font-extrabold text-ink"
      aria-label={`${n} sin leer`}
    >
      {n > 99 ? "99+" : n}
    </span>
  );
}

/** Barra lateral angosta tipo Canvas (solo PC). La cuenta va arriba, como primer ítem. */
export function BarraLateral({
  items,
  sinLeer,
  cuenta,
}: {
  items: ItemMenu[];
  sinLeer: number;
  cuenta: React.ReactNode;
}) {
  const ruta = usePathname();
  const { ref, caja } = useIndicador<HTMLUListElement>(ruta);
  return (
    <nav
      aria-label="Principal"
      className="sobre-oscuro sticky top-0 z-20 hidden h-dvh w-[92px] shrink-0 flex-col gap-0.5 bg-nav py-3.5 md:flex"
    >
      <Link href="/inicio" className="pb-2.5 text-center text-[22px] font-extrabold text-white">
        PEA
      </Link>
      {cuenta}
      <ul ref={ref} className="relative flex min-h-0 flex-1 flex-col gap-0.5 overflow-y-auto">
        {caja && (
          <li
            aria-hidden="true"
            className="pointer-events-none absolute inset-x-0 top-0 bg-white transition-transform duration-(--dur-3) ease-salida"
            style={{ height: caja.alto, transform: `translateY(${caja.y}px)` }}
          />
        )}
        {items.map((i) => {
          const activo = esActivo(ruta, i.href);
          return (
            <li key={i.href} className="relative">
              <Link
                href={i.href}
                aria-current={activo ? "page" : undefined}
                className={cn(
                  "flex flex-col items-center gap-1 px-1 py-2.5 text-xs transition-colors",
                  activo ? "font-bold text-primary-strong" : "text-nav-fg hover:text-white",
                  activo && !caja && "bg-white",
                )}
              >
                <IconoNav icono={i.icono} />
                <span className="flex items-center">
                  {i.etiqueta}
                  {i.icono === "bandeja" && <Contador n={sinLeer} />}
                </span>
              </Link>
            </li>
          );
        })}
      </ul>
    </nav>
  );
}
