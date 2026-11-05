"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoMarcar = { ok: true; cumplido: boolean } | { ok: false; error: string };

export async function marcarItem(itemId: string, accion: "visto" | "hecho"): Promise<ResultadoMarcar> {
  await requerirPerfil();
  const id = z.uuid().safeParse(itemId);
  if (!id.success || (accion !== "visto" && accion !== "hecho")) return { ok: false, error: "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase.rpc("marcar_item", { p_item: id.data, p_accion: accion });
  if (error) {
    return { ok: false, error: error.message.includes("bloqueado") ? "Completá lo anterior para seguir." : "No pudimos guardar tu avance. Probá de nuevo." };
  }
  revalidatePath("/estudiar", "layout");
  revalidatePath("/inicio");
  return { ok: true, cumplido: Boolean((data as { cumplido?: boolean } | null)?.cumplido) };
}
