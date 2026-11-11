"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import type { ItemMenu } from "@/lib/dominio/roles";
import { cn } from "@/lib/utils/cn";
import { Contador, esActivo } from "./barra-lateral";
import { IconoNav } from "./iconos";

/** Píldora inferior en celular: los primeros 4 ítems y "Más" con el resto. */
export function MenuPrincipal({
  items,
  sinLeer,
  maxInferior = 4,
}: {
  items: ItemMenu[];
  sinLeer: number;
  maxInferior?: number;
}) {
  const ruta = usePathname();
  const visibles = items.length > maxInferior + 1 ? items.slice(0, maxInferior) : items;
  const resto = items.length > maxInferior + 1 ? items.slice(maxInferior) : [];
  const restoActivo = resto.some((i) => esActivo(ruta, i.href));
  return (
    <nav
      aria-label="Principal"
      className="fixed inset-x-3 bottom-3 z-10 rounded-[20px] bg-ink shadow-lg md:hidden"
    >
      <ul className="flex">
        {visibles.map((i) => {
          const activo = esActivo(ruta, i.href);
          return (
            <li key={i.href} className="flex-1">
              <Link
                href={i.href}
                aria-current={activo ? "page" : undefined}
                className={cn(
                  "flex flex-col items-center gap-0.5 px-1 py-2.5 text-[11px]",
                  activo ? "font-bold text-white" : "text-nav-fg-muted",
                )}
              >
                <IconoNav icono={i.icono} tamano={20} />
                <span className="flex items-center">
                  {i.etiqueta}
                  {i.icono === "bandeja" && <Contador n={sinLeer} />}
                </span>
              </Link>
            </li>
          );
        })}
        {resto.length > 0 && (
          <li className="relative flex-1">
            <details className="group">
              <summary
                className={cn(
                  "flex cursor-pointer list-none flex-col items-center gap-0.5 px-1 py-2.5 text-[11px] [&::-webkit-details-marker]:hidden",
                  restoActivo ? "font-bold text-white" : "text-nav-fg-muted",
                )}
              >
                <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                  <circle cx="5" cy="12" r="2" />
                  <circle cx="12" cy="12" r="2" />
                  <circle cx="19" cy="12" r="2" />
                </svg>
                Más
              </summary>
              <ul className="absolute bottom-full right-1 mb-2 w-52 rounded-xl border border-border bg-card p-1 shadow-lg">
                {resto.map((i) => (
                  <li key={i.href}>
                    <Link
                      href={i.href}
                      aria-current={esActivo(ruta, i.href) ? "page" : undefined}
                      className={cn(
                        "flex items-center gap-2.5 rounded-lg px-3 py-2.5 text-sm",
                        esActivo(ruta, i.href) ? "font-semibold text-primary" : "",
                      )}
                    >
                      <IconoNav icono={i.icono} tamano={18} />
                      {i.etiqueta}
                    </Link>
                  </li>
                ))}
              </ul>
            </details>
          </li>
        )}
      </ul>
    </nav>
  );
}
