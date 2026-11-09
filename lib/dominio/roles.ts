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

export type IconoMenu =
  | "tablero"
  | "cursos"
  | "calendario"
  | "bandeja"
  | "examenes"
  | "repositorio"
  | "organigrama"
  | "equipo"
  | "contenido"
  | "admin"
  | "ayuda";

export type ItemMenu = { href: string; etiqueta: string; icono: IconoMenu };

const MENU_BASE: ItemMenu[] = [
  { href: "/inicio", etiqueta: "Tablero", icono: "tablero" },
  { href: "/estudiar", etiqueta: "Cursos", icono: "cursos" },
  { href: "/calendario", etiqueta: "Calendario", icono: "calendario" },
  { href: "/bandeja", etiqueta: "Bandeja", icono: "bandeja" },
  { href: "/examenes", etiqueta: "Exámenes", icono: "examenes" },
  { href: "/repositorio", etiqueta: "Repositorio", icono: "repositorio" },
  { href: "/organigrama", etiqueta: "Organigrama", icono: "organigrama" },
];

const MENU_EQUIPO: ItemMenu = { href: "/equipo/panel", etiqueta: "Equipo", icono: "equipo" };
const MENU_CONTENIDO: ItemMenu = { href: "/contenido", etiqueta: "Contenido", icono: "contenido" };
const MENU_ADMIN: ItemMenu = { href: "/admin/usuarios", etiqueta: "Admin", icono: "admin" };
const MENU_AYUDA: ItemMenu = { href: "/ayuda", etiqueta: "Ayuda", icono: "ayuda" };

export const ROLES_EDITORES: readonly RolApp[] = ["coordinador", "director", "admin"];

export function menuPorRol(rol: RolApp): ItemMenu[] {
  const extra: ItemMenu[] = [];
  if (rol !== "asesor") extra.push(MENU_EQUIPO);
  if (rol === "coordinador" || rol === "director" || rol === "admin") extra.push(MENU_CONTENIDO);
  if (rol === "admin") extra.push(MENU_ADMIN);
  return [...MENU_BASE, ...extra, MENU_AYUDA];
}

export function rutaInicio(_rol: RolApp): string {
  return "/inicio";
}
