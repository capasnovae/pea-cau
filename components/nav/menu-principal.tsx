"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import type { ItemMenu } from "@/lib/dominio/roles";
import { cn } from "@/lib/utils/cn";

export function MenuPrincipal({
  items,
  variante,
  maxInferior = 4,
}: {
  items: ItemMenu[];
  variante: "inferior" | "lateral";
  maxInferior?: number;
}) {
  const ruta = usePathname();
  const activo = (href: string) => ruta === href || ruta.startsWith(`${href}/`);
  if (variante === "inferior") {
    const visibles = items.length > maxInferior + 1 ? items.slice(0, maxInferior) : items;
    const resto = items.length > maxInferior + 1 ? items.slice(maxInferior) : [];
    const restoActivo = resto.some((i) => activo(i.href));
    return (
      <nav aria-label="Principal" className="fixed inset-x-3 bottom-3 z-10 rounded-[20px] bg-ink shadow-lg md:hidden">
        <ul className="flex">
          {visibles.map((i) => (
            <li key={i.href} className="flex-1">
              <Link
                href={i.href}
                aria-current={activo(i.href) ? "page" : undefined}
                className={cn("block px-1 py-3.5 text-center text-xs", activo(i.href) ? "font-bold text-white" : "text-[#b4b4c8]")}
              >
                {i.etiqueta}
              </Link>
            </li>
          ))}
          {resto.length > 0 && (
            <li className="relative flex-1">
              <details className="group">
                <summary
                  className={cn(
                    "block cursor-pointer list-none px-1 py-3.5 text-center text-xs [&::-webkit-details-marker]:hidden",
                    restoActivo ? "font-bold text-white" : "text-[#b4b4c8]",
                  )}
                >
                  Más
                </summary>
                <ul className="absolute bottom-full right-1 mb-2 w-48 rounded-xl border border-border bg-card p-1 shadow-lg">
                  {resto.map((i) => (
                    <li key={i.href}>
                      <Link
                        href={i.href}
                        aria-current={activo(i.href) ? "page" : undefined}
                        className={cn("block rounded-lg px-3 py-2.5 text-sm", activo(i.href) ? "font-semibold text-primary" : "")}
                      >
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
  return (
    <nav aria-label="Principal" className="hidden w-60 shrink-0 p-4 md:block">
      <ul className="flex flex-col gap-1">
        {items.map((i) => (
          <li key={i.href}>
            <Link
              href={i.href}
              aria-current={activo(i.href) ? "page" : undefined}
              className={cn("block rounded-xl px-3.5 py-2.5 text-sm font-semibold", activo(i.href) ? "bg-primary text-white" : "hover:bg-primary-soft")}
            >
              {i.etiqueta}
            </Link>
          </li>
        ))}
      </ul>
    </nav>
  );
}
