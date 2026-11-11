import type { RolApp } from "./roles";

export type Alcance = "global" | "sede";
type Sede = { id: string; nombre: string };

/** Qué alcances y sedes puede elegir cada rol al crear o editar contenido (espejo de puede_editar_contenido). */
export function opcionesDeAlcance(
  rol: RolApp,
  miSede: string | null,
  sedes: Sede[],
): { alcances: Alcance[]; sedes: Sede[] } {
  if (rol === "admin") return { alcances: ["global", "sede"], sedes };
  if (rol === "director") return { alcances: ["sede"], sedes };
  if (rol === "coordinador") return { alcances: ["sede"], sedes: sedes.filter((s) => s.id === miSede) };
  return { alcances: [], sedes: [] };
}

export function mensajeErrorGuardado(error: { code?: string; message?: string }): string {
  if (error.code === "42501") return "No tenés permiso para hacer esto.";
  if (error.code === "23505") return "Ya hay un artículo con ese slug en la categoría.";
  if (error.message?.includes("artículo padre"))
    return "El artículo padre tiene que ser de la misma categoría.";
  return "No pudimos guardar. Probá de nuevo.";
}

/** Filtro de servidor para listar solo lo que el rol puede editar (null = sin filtro). */
export function filtroEditable(
  rol: RolApp,
  miSede: string | null,
): { alcance: "sede"; sede_id?: string } | null {
  if (rol === "admin") return null;
  if (rol === "director") return { alcance: "sede" };
  return { alcance: "sede", sede_id: miSede ?? "00000000-0000-0000-0000-000000000000" };
}
