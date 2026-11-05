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
      <nav aria-label="Principal" className="fixed inset-x-0 bottom-0 z-10 border-t border-border bg-card md:hidden">
        <ul className="flex">
          {visibles.map((i) => (
            <li key={i.href} className="flex-1">
              <Link
                href={i.href}
                aria-current={activo(i.href) ? "page" : undefined}
                className={cn("block px-1 py-3 text-center text-xs", activo(i.href) ? "font-semibold text-primary" : "text-muted")}
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
                    "block cursor-pointer list-none px-1 py-3 text-center text-xs [&::-webkit-details-marker]:hidden",
                    restoActivo ? "font-semibold text-primary" : "text-muted",
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
    <nav aria-label="Principal" className="hidden w-56 shrink-0 border-r border-border bg-card p-3 md:block">
      <ul className="flex flex-col gap-1">
        {items.map((i) => (
          <li key={i.href}>
            <Link
              href={i.href}
              aria-current={activo(i.href) ? "page" : undefined}
              className={cn("block rounded-lg px-3 py-2 text-sm", activo(i.href) ? "bg-background font-semibold text-primary" : "hover:bg-background")}
            >
              {i.etiqueta}
            </Link>
          </li>
        ))}
      </ul>
    </nav>
  );
}
