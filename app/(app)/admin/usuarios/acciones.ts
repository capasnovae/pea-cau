"use server";

import { revalidatePath } from "next/cache";
import { headers } from "next/headers";
import { esquemaInvitacion, mensajeErrorInvitacion } from "@/lib/dominio/invitacion";
import { ROLES, type RolApp } from "@/lib/dominio/roles";
import { crearClienteAdmin } from "@/lib/supabase/admin";
import { requerirRol } from "@/lib/supabase/permisos";

export type ResultadoAccion = { ok: true; mensaje?: string } | { ok: false; error: string } | null;

const SIN_PERMISO = "No tenés permiso para hacer esto.";

export async function invitarUsuario(_prev: ResultadoAccion, formData: FormData): Promise<ResultadoAccion> {
  const admin = await requerirRol(["admin"]);
  const datos = esquemaInvitacion.safeParse(Object.fromEntries(formData));
  if (!datos.success) return { ok: false, error: datos.error.issues[0]?.message ?? "Revisá los datos." };
  const { email, ...metadata } = datos.data;
  const origen = (await headers()).get("origin") ?? "";
  const cliente = crearClienteAdmin();
  const { data, error } = await cliente.auth.admin.inviteUserByEmail(email, {
    data: metadata,
    redirectTo: `${origen}/auth/confirm`,
  });
  if (error) return { ok: false, error: mensajeErrorInvitacion(error.message) };
  await cliente.from("auditoria").insert({
    actor_id: admin.id,
    accion: "invitar_usuario",
    entidad: "perfiles",
    entidad_id: data.user?.id ?? null,
    datos: { email, rol: metadata.rol },
  });
  revalidatePath("/admin/usuarios");
  return { ok: true, mensaje: `Invitación enviada a ${email}.` };
}

export async function cambiarEstadoUsuario(id: string, activo: boolean): Promise<ResultadoAccion> {
  const admin = await requerirRol(["admin"]);
  if (id === admin.id) return { ok: false, error: "No podés desactivarte a vos mismo." };
  const cliente = crearClienteAdmin();
  const { error } = await cliente.from("perfiles").update({ activo }).eq("id", id);
  if (error) return { ok: false, error: SIN_PERMISO };
  if (!activo) await cliente.auth.admin.signOut(id).catch(() => undefined);
  await cliente.from("auditoria").insert({ actor_id: admin.id, accion: activo ? "activar" : "desactivar", entidad: "perfiles", entidad_id: id });
  revalidatePath("/admin/usuarios");
  return { ok: true };
}

export async function cambiarRol(id: string, rol: string): Promise<ResultadoAccion> {
  const admin = await requerirRol(["admin"]);
  if (!ROLES.includes(rol as RolApp)) return { ok: false, error: "Rol inválido." };
  if (id === admin.id && rol !== "admin") return { ok: false, error: "No podés sacarte el rol de admin." };
  const cliente = crearClienteAdmin();
  const { error } = await cliente.from("perfiles").update({ rol: rol as RolApp }).eq("id", id);
  if (error) return { ok: false, error: SIN_PERMISO };
  await cliente.from("auditoria").insert({ actor_id: admin.id, accion: "cambiar_rol", entidad: "perfiles", entidad_id: id, datos: { rol } });
  revalidatePath("/admin/usuarios");
  return { ok: true };
}
