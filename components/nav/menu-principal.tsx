"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import type { ItemMenu } from "@/lib/dominio/roles";
import { cn } from "@/lib/utils/cn";

export function MenuPrincipal({ items, variante }: { items: ItemMenu[]; variante: "inferior" | "lateral" }) {
  const ruta = usePathname();
  const activo = (href: string) => ruta === href || ruta.startsWith(`${href}/`);
  if (variante === "inferior") {
    return (
      <nav aria-label="Principal" className="fixed inset-x-0 bottom-0 z-10 border-t border-border bg-card md:hidden">
        <ul className="flex overflow-x-auto">
          {items.map((i) => (
            <li key={i.href} className="min-w-[72px] flex-1">
              <Link
                href={i.href}
                aria-current={activo(i.href) ? "page" : undefined}
                className={cn("block px-2 py-3 text-center text-xs", activo(i.href) ? "font-semibold text-primary" : "text-muted")}
              >
                {i.etiqueta}
              </Link>
            </li>
          ))}
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
