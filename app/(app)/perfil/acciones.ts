"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type EstadoTelefono = { error?: string; ok?: boolean };

export async function guardarTelefono(_prev: EstadoTelefono, formData: FormData): Promise<EstadoTelefono> {
  const perfil = await requerirPerfil();
  const telefono = z.string().trim().max(40).safeParse(formData.get("telefono") ?? "");
  if (!telefono.success) return { error: "El teléfono es demasiado largo." };
  const supabase = await crearClienteServidor();
  const { error } = await supabase.from("perfiles").update({ telefono: telefono.data || null }).eq("id", perfil.id);
  if (error) return { error: "No pudimos guardar el teléfono." };
  revalidatePath("/perfil");
  return { ok: true };
}
