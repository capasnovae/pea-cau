import { ROLES, type RolApp } from "./roles";

export type FiltrosUsuarios = { q: string; sede: string | null; rol: RolApp | null; estado: "activos" | "inactivos" | "todos" };

const UUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

export function leerFiltrosUsuarios(sp: Record<string, string | string[] | undefined>): FiltrosUsuarios {
  const v = (k: string) => (typeof sp[k] === "string" ? (sp[k] as string) : "");
  const rol = v("rol");
  const estado = v("estado");
  return {
    // Sin comas, paréntesis ni comodines: el texto va dentro de un filtro .or() de PostgREST.
    q: v("q").replace(/[,()%*\\]/g, "").trim().slice(0, 80),
    sede: UUID.test(v("sede")) ? v("sede") : null,
    rol: (ROLES as readonly string[]).includes(rol) ? (rol as RolApp) : null,
    estado: estado === "inactivos" || estado === "todos" ? estado : "activos",
  };
}
