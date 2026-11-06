"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export async function habilitar(usuarioId: string): Promise<void> {
  await requerirRol(["coordinador", "director", "admin"]);
  const id = z.uuid().safeParse(usuarioId);
  if (!id.success) redirect("/equipo/ubicacion");
  const supabase = await crearClienteServidor();
  const { error } = await supabase.rpc("habilitar_ubicacion", { p_usuario: id.data });
  revalidatePath("/equipo/ubicacion");
  if (error)
    redirect(`/equipo/ubicacion?error=${error.message.includes("ya rendida") ? "rendida" : "permiso"}`);
  redirect("/equipo/ubicacion");
}
