export type EstadoSesion = "anonimo" | "inactivo" | "activo";

const RUTAS_PUBLICAS = ["/ingresar", "/recuperar", "/definir-clave", "/auth/confirm", "/verificar"];

export function esRutaPublica(ruta: string): boolean {
  return RUTAS_PUBLICAS.some((r) => ruta === r || ruta.startsWith(`${r}/`));
}

/** Devuelve a dónde redirigir, o null si la ruta pedida está bien para ese estado. */
export function decidirRedireccion(ruta: string, estado: EstadoSesion): string | null {
  const publica = esRutaPublica(ruta);
  if (estado === "anonimo") return publica ? null : "/ingresar";
  if (estado === "inactivo") return publica ? null : "/ingresar?motivo=inactivo";
  if (ruta === "/ingresar" || ruta === "/recuperar") return "/inicio";
  return null;
}
