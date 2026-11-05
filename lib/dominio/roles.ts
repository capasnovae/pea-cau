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
  { href: "/repositorio", etiqueta: "Repositorio" },
  { href: "/recursos", etiqueta: "Recursos" },
  { href: "/buscar", etiqueta: "Buscar" },
  { href: "/perfil", etiqueta: "Mi perfil" },
];

const MENU_CONTENIDO: ItemMenu[] = [{ href: "/contenido", etiqueta: "Contenido" }];

const MENU_ADMIN: ItemMenu[] = [
  { href: "/admin/usuarios", etiqueta: "Usuarios" },
  { href: "/admin/sedes", etiqueta: "Sedes" },
  { href: "/admin/equipos", etiqueta: "Equipos" },
];

export const ROLES_EDITORES: readonly RolApp[] = ["coordinador", "director", "admin"];

export function menuPorRol(rol: RolApp): ItemMenu[] {
  if (rol === "admin") return [...MENU_BASE, ...MENU_CONTENIDO, ...MENU_ADMIN];
  if (rol === "coordinador" || rol === "director") return [...MENU_BASE, ...MENU_CONTENIDO];
  return [...MENU_BASE];
}

export function rutaInicio(_rol: RolApp): string {
  return "/inicio";
}
