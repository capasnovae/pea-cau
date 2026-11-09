"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils/cn";

export function PestanasEquipo({ conUbicacion }: { conUbicacion: boolean }) {
  const ruta = usePathname();
  const secciones = [
    { href: "/equipo/panel", etiqueta: "Panel" },
    { href: "/equipo/consignas", etiqueta: "Consignas" },
    { href: "/equipo/correcciones", etiqueta: "Correcciones" },
    ...(conUbicacion ? [{ href: "/equipo/ubicacion", etiqueta: "Ubicación" }] : []),
  ];
  return (
    <nav aria-label="Equipo" className="-mx-4 overflow-x-auto px-4">
      <ul className="flex w-max gap-1 rounded-xl bg-primary-soft p-1">
        {secciones.map((s) => {
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
