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
  { href: "/estudiar", etiqueta: "Estudiar" },
  { href: "/consignas", etiqueta: "Consignas" },
  { href: "/repositorio", etiqueta: "Repositorio" },
  { href: "/recursos", etiqueta: "Recursos" },
  { href: "/buscar", etiqueta: "Buscar" },
  { href: "/organigrama", etiqueta: "Organigrama" },
  { href: "/perfil", etiqueta: "Mi perfil" },
];

const MENU_EQUIPO: ItemMenu[] = [{ href: "/equipo/consignas", etiqueta: "Equipo" }];

const MENU_CONTENIDO: ItemMenu[] = [{ href: "/contenido", etiqueta: "Contenido" }];

const MENU_ADMIN: ItemMenu[] = [
  { href: "/admin/usuarios", etiqueta: "Usuarios" },
  { href: "/admin/sedes", etiqueta: "Sedes" },
  { href: "/admin/equipos", etiqueta: "Equipos" },
  { href: "/admin/derivaciones", etiqueta: "Derivaciones" },
];

export const ROLES_EDITORES: readonly RolApp[] = ["coordinador", "director", "admin"];

export function menuPorRol(rol: RolApp): ItemMenu[] {
  if (rol === "admin") return [...MENU_BASE, ...MENU_EQUIPO, ...MENU_CONTENIDO, ...MENU_ADMIN];
  if (rol === "coordinador" || rol === "director") return [...MENU_BASE, ...MENU_EQUIPO, ...MENU_CONTENIDO];
  if (rol === "lider") return [...MENU_BASE, ...MENU_EQUIPO];
  return [...MENU_BASE];
}

export function rutaInicio(_rol: RolApp): string {
  return "/inicio";
}
