export type EstadoSesion = "anonimo" | "inactivo" | "activo";

const RUTAS_PUBLICAS = [
  "/bienvenida",
  "/ingresar",
  "/recuperar",
  "/definir-clave",
  "/auth/confirm",
  "/verificar",
  "/salir",
];

export function esRutaPublica(ruta: string): boolean {
  return RUTAS_PUBLICAS.some((r) => ruta === r || ruta.startsWith(`${r}/`));
}

/** A dónde mandar a un usuario con sesión pero perfil inactivo o inexistente: cierra la sesión y avisa. */
export function destinoInactivo(): string {
  return "/salir?motivo=inactivo";
}

/**
 * Devuelve a dónde redirigir, o null si la ruta pedida está bien para ese estado.
 * `ruta` puede incluir la query (`/ingresar?motivo=inactivo`).
 */
export function decidirRedireccion(ruta: string, estado: EstadoSesion): string | null {
  const [camino = "", query = ""] = ruta.split("?");
  const publica = esRutaPublica(camino);
  if (estado === "anonimo") return publica ? null : camino === "/" ? "/bienvenida" : "/ingresar";
  if (estado === "inactivo") return publica ? null : "/ingresar?motivo=inactivo";
  const avisado = new URLSearchParams(query).has("motivo");
  if ((camino === "/ingresar" && !avisado) || camino === "/recuperar" || camino === "/bienvenida")
    return "/inicio";
  return null;
}
