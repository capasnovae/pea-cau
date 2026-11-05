import "server-only";
import { notFound, redirect } from "next/navigation";
import type { RolApp } from "@/lib/dominio/roles";
import { obtenerSesion, type Perfil } from "./servidor";

/** Perfil activo del usuario actual; si no hay sesión o está inactivo, redirige. */
export async function requerirPerfil(): Promise<Perfil> {
  const sesion = await obtenerSesion();
  if (!sesion) redirect("/ingresar");
  if (!sesion.perfil || !sesion.perfil.activo) redirect("/ingresar?motivo=inactivo");
  return sesion.perfil;
}

/** Como requerirPerfil, pero además exige uno de los roles; si no, 404. */
export async function requerirRol(roles: RolApp[]): Promise<Perfil> {
  const perfil = await requerirPerfil();
  if (!roles.includes(perfil.rol)) notFound();
  return perfil;
}
