"use server";

import { revalidatePath } from "next/cache";
import { headers } from "next/headers";
import { esquemaAsignacion, esquemaInvitacion, mensajeErrorInvitacion } from "@/lib/dominio/invitacion";
import { ROLES, type RolApp } from "@/lib/dominio/roles";
import { crearClienteAdmin } from "@/lib/supabase/admin";
import { requerirRol } from "@/lib/supabase/permisos";

export type ResultadoAccion = { ok: true; mensaje?: string } | { ok: false; error: string } | null;

const SIN_PERMISO = "No tenés permiso para hacer esto.";

export async function invitarUsuario(_prev: ResultadoAccion, formData: FormData): Promise<ResultadoAccion> {
  const admin = await requerirRol(["admin"]);
  const datos = esquemaInvitacion.safeParse(Object.fromEntries(formData));
  if (!datos.success) return { ok: false, error: datos.error.issues[0]?.message ?? "Revisá los datos." };
  const { email, nombre, apellido, rol, sede_id, area, puesto_id } = datos.data;
  const origen = (await headers()).get("origin") ?? "";
  const cliente = crearClienteAdmin();
  // La metadata del usuario solo lleva el nombre: rol, sede y área NO se toman de ahí (ver migración 0500).
  const { data, error } = await cliente.auth.admin.inviteUserByEmail(email, {
    data: { nombre, apellido },
    redirectTo: `${origen}/auth/confirm`,
  });
  if (error || !data.user) return { ok: false, error: mensajeErrorInvitacion(error?.message ?? "") };
  // Los privilegios los fija el servidor, con datos ya validados.
  const { error: errorPerfil } = await cliente
    .from("perfiles")
    .update({ nombre, apellido, rol, sede_id, area, puesto_id, activo: true })
    .eq("id", data.user.id);
  if (errorPerfil)
    return {
      ok: false,
      error: "La invitación salió, pero no pudimos guardar sus datos. Revisalos en la lista.",
    };
  await cliente.auth.admin.updateUserById(data.user.id, { app_metadata: { pea_alta: true } });
  await cliente.from("auditoria").insert({
    actor_id: admin.id,
    accion: "invitar_usuario",
    entidad: "perfiles",
    entidad_id: data.user?.id ?? null,
    datos: { email, rol },
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
  // No hay "cerrar sesión por id": bloqueamos al usuario en Auth para que no pueda refrescar ni volver a entrar.
  const { error: errorBloqueo } = await cliente.auth.admin.updateUserById(id, {
    ban_duration: activo ? "none" : "876000h",
  });
  if (errorBloqueo)
    return { ok: false, error: "Se actualizó el estado, pero no pudimos cerrar su acceso. Probá de nuevo." };
  await cliente
    .from("auditoria")
    .insert({
      actor_id: admin.id,
      accion: activo ? "activar" : "desactivar",
      entidad: "perfiles",
      entidad_id: id,
    });
  revalidatePath("/admin/usuarios");
  return { ok: true };
}

export async function cambiarRol(id: string, rol: string): Promise<ResultadoAccion> {
  const admin = await requerirRol(["admin"]);
  if (!ROLES.includes(rol as RolApp)) return { ok: false, error: "Rol inválido." };
  if (id === admin.id && rol !== "admin") return { ok: false, error: "No podés sacarte el rol de admin." };
  const cliente = crearClienteAdmin();
  const { error } = await cliente
    .from("perfiles")
    .update({ rol: rol as RolApp })
    .eq("id", id);
  if (error) return { ok: false, error: SIN_PERMISO };
  await cliente
    .from("auditoria")
    .insert({
      actor_id: admin.id,
      accion: "cambiar_rol",
      entidad: "perfiles",
      entidad_id: id,
      datos: { rol },
    });
  revalidatePath("/admin/usuarios");
  return { ok: true };
}

export async function asignarDatosUsuario(
  _prev: ResultadoAccion,
  formData: FormData,
): Promise<ResultadoAccion> {
  const admin = await requerirRol(["admin"]);
  const d = esquemaAsignacion.safeParse({
    id: formData.get("id"),
    sede_id: formData.get("sede_id"),
    area: formData.get("area"),
    equipo_id: formData.get("equipo_id"),
    puesto_id: formData.get("puesto_id"),
    subrol_ids: formData.getAll("subrol_ids"),
  });
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const { id, subrol_ids, ...valores } = d.data;
  const cliente = crearClienteAdmin();
  const { error } = await cliente.from("perfiles").update(valores).eq("id", id);
  if (error) {
    return {
      ok: false,
      error: error.message.includes("integridad")
        ? "El equipo tiene que ser de la misma sede y área."
        : "No pudimos guardar. Probá de nuevo.",
    };
  }
  await cliente.from("perfil_subroles").delete().eq("perfil_id", id);
  if (subrol_ids.length) {
    await cliente
      .from("perfil_subroles")
      .insert(subrol_ids.map((subrol_id) => ({ perfil_id: id, subrol_id })));
  }
  await cliente
    .from("auditoria")
    .insert({
      actor_id: admin.id,
      accion: "asignar_datos",
      entidad: "perfiles",
      entidad_id: id,
      datos: { ...valores, subrol_ids },
    });
  revalidatePath("/admin/usuarios");
  return { ok: true, mensaje: "Datos guardados." };
}
