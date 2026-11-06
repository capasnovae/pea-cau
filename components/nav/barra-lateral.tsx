"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import type { ItemMenu } from "@/lib/dominio/roles";
import { cn } from "@/lib/utils/cn";
import { IconoNav } from "./iconos";

export function esActivo(ruta: string, href: string): boolean {
  const base = href.startsWith("/admin/") ? "/admin" : href;
  return ruta === base || ruta.startsWith(`${base}/`);
}

export function Contador({ n }: { n: number }) {
  if (n <= 0) return null;
  return (
    <span
      className="ml-1 rounded-full bg-[#f59e0b] px-1.5 text-[10px] font-extrabold text-ink"
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
  return (
    <nav
      aria-label="Principal"
      className="sticky top-0 hidden h-dvh w-[92px] shrink-0 flex-col gap-0.5 overflow-y-auto bg-[#1e1b4b] py-3.5 md:flex"
    >
      <Link href="/inicio" className="pb-2.5 text-center text-[22px] font-extrabold text-white">
        PEA
      </Link>
      {cuenta}
      <ul className="flex flex-col gap-0.5">
        {items.map((i) => {
          const activo = esActivo(ruta, i.href);
          return (
            <li key={i.href}>
              <Link
                href={i.href}
                aria-current={activo ? "page" : undefined}
                className={cn(
                  "flex flex-col items-center gap-1 px-1 py-2.5 text-xs",
                  activo ? "bg-white font-bold text-primary-strong" : "text-[#c7d2fe] hover:text-white",
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
