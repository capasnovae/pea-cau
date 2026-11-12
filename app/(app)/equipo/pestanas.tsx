"use client";

import { usePathname } from "next/navigation";
import { Pestanas } from "@/components/ui/pestanas";

export function PestanasEquipo({ conUbicacion }: { conUbicacion: boolean }) {
  const ruta = usePathname();
  const secciones = [
    { href: "/equipo/panel", etiqueta: "Panel" },
    { href: "/equipo/consignas", etiqueta: "Consignas" },
    { href: "/equipo/correcciones", etiqueta: "Correcciones" },
    ...(conUbicacion ? [{ href: "/equipo/ubicacion", etiqueta: "Ubicación" }] : []),
  ];
  return (
    <Pestanas
      etiqueta="Equipo"
      pestanas={secciones.map((s) => ({ ...s, activa: ruta === s.href || ruta.startsWith(`${s.href}/`) }))}
    />
  );
}
