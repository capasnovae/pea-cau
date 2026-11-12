"use server";

import { cookies } from "next/headers";
import { COOKIE_TEMA, temaDesdeCookie } from "@/lib/dominio/tema";
import { revalidatePath } from "next/cache";
import { z } from "zod";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type EstadoTelefono = { error?: string; ok?: boolean };

export async function guardarTelefono(_prev: EstadoTelefono, formData: FormData): Promise<EstadoTelefono> {
  const perfil = await requerirPerfil();
  const telefono = z
    .string()
    .trim()
    .max(40)
    .safeParse(formData.get("telefono") ?? "");
  if (!telefono.success) return { error: "El teléfono es demasiado largo." };
  const supabase = await crearClienteServidor();
  const { error } = await supabase
    .from("perfiles")
    .update({ telefono: telefono.data || null })
    .eq("id", perfil.id);
  if (error) return { error: "No pudimos guardar el teléfono." };
  revalidatePath("/perfil");
  return { ok: true };
}

/** Guarda el tema elegido en una cookie: el layout raíz lo aplica en el servidor, sin parpadeo. */
export async function elegirTema(valor: string): Promise<void> {
  const tema = temaDesdeCookie(valor);
  const almacen = await cookies();
  if (tema === "sistema") almacen.delete(COOKIE_TEMA);
  else almacen.set(COOKIE_TEMA, tema, { path: "/", maxAge: 60 * 60 * 24 * 365, sameSite: "lax" });
}
