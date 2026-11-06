"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils/cn";

const SECCIONES = [
  { href: "/admin/usuarios", etiqueta: "Usuarios" },
  { href: "/admin/sedes", etiqueta: "Sedes" },
  { href: "/admin/equipos", etiqueta: "Equipos" },
  { href: "/admin/derivaciones", etiqueta: "Derivaciones" },
  { href: "/admin/rutas", etiqueta: "Rutas" },
];

export function PestanasAdmin() {
  const ruta = usePathname();
  return (
    <nav aria-label="Administración" className="-mx-4 overflow-x-auto px-4">
      <ul className="flex w-max gap-1 rounded-xl bg-primary-soft p-1">
        {SECCIONES.map((s) => {
          const activo = ruta === s.href || ruta.startsWith(`${s.href}/`);
          return (
            <li key={s.href}>
              <Link
                href={s.href}
                aria-current={activo ? "page" : undefined}
                className={cn(
                  "block rounded-lg px-3.5 py-2 text-sm font-semibold",
                  activo ? "bg-primary text-white" : "text-primary-strong",
                )}
              >
                {s.etiqueta}
              </Link>
            </li>
          );
        })}
      </ul>
    </nav>
  );
}
