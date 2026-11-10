"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export async function marcarLeida(asignacionId: string): Promise<{ ok: boolean }> {
  await requerirPerfil();
  const id = z.uuid().safeParse(asignacionId);
  if (!id.success) return { ok: false };
  const supabase = await crearClienteServidor();
  const { error } = await supabase.rpc("marcar_actualizacion_leida", { p_asignacion: id.data });
  revalidatePath("/actualizaciones", "layout");
  return { ok: !error };
}
