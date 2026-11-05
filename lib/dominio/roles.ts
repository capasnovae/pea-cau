export type RolApp = "asesor" | "lider" | "coordinador" | "director" | "admin";
export type Area = "servicio" | "ventas";

export const ROLES: readonly RolApp[] = ["asesor", "lider", "coordinador", "director", "admin"];
export const ROLES_GESTION: readonly RolApp[] = ["lider", "coordinador", "director", "admin"];

export const ETIQUETA_ROL: Record<RolApp, string> = {
  asesor: "Asesor",
  lider: "Líder",
  coordinador: "Coordinador",
  director: "Director",
  admin: "Admin",
};

export type ItemMenu = { href: string; etiqueta: string };

const MENU_BASE: ItemMenu[] = [
  { href: "/inicio", etiqueta: "Inicio" },
  { href: "/perfil", etiqueta: "Mi perfil" },
];

const MENU_ADMIN: ItemMenu[] = [
  { href: "/admin/usuarios", etiqueta: "Usuarios" },
  { href: "/admin/sedes", etiqueta: "Sedes" },
  { href: "/admin/equipos", etiqueta: "Equipos" },
];

export function menuPorRol(rol: RolApp): ItemMenu[] {
  return rol === "admin" ? [...MENU_BASE, ...MENU_ADMIN] : [...MENU_BASE];
}

export function rutaInicio(_rol: RolApp): string {
  return "/inicio";
}
