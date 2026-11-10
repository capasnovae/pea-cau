"use server";

import { revalidatePath } from "next/cache";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export async function marcarTodoLeido(): Promise<void> {
  await requerirPerfil();
  const supabase = await crearClienteServidor();
  await supabase.rpc("marcar_alertas_leidas", {});
  revalidatePath("/", "layout");
}

export async function preferirAvisosEmail(activar: boolean): Promise<void> {
  await requerirPerfil();
  const supabase = await crearClienteServidor();
  await supabase.rpc("preferir_avisos_email", { p_activar: activar });
  revalidatePath("/perfil");
}
