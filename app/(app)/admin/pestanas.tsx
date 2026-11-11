"use client";

import { usePathname } from "next/navigation";
import { Pestanas } from "@/components/ui/pestanas";

const SECCIONES = [
  { href: "/admin/usuarios", etiqueta: "Usuarios" },
  { href: "/admin/sedes", etiqueta: "Sedes" },
  { href: "/admin/equipos", etiqueta: "Equipos" },
  { href: "/admin/derivaciones", etiqueta: "Derivaciones" },
  { href: "/admin/rutas", etiqueta: "Rutas" },
  { href: "/admin/certificaciones", etiqueta: "Certificados" },
];

export function PestanasAdmin() {
  const ruta = usePathname();
  return (
    <Pestanas
      etiqueta="Administración"
      pestanas={SECCIONES.map((s) => ({ ...s, activa: ruta === s.href || ruta.startsWith(`${s.href}/`) }))}
    />
  );
}
