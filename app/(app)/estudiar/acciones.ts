"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoMarcar = { ok: true; cumplido: boolean } | { ok: false; error: string };

export async function marcarItem(itemId: string, accion: "visto" | "hecho"): Promise<ResultadoMarcar> {
  await requerirPerfil();
  const id = z.uuid().safeParse(itemId);
  if (!id.success || (accion !== "visto" && accion !== "hecho"))
    return { ok: false, error: "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase.rpc("marcar_item", { p_item: id.data, p_accion: accion });
  if (error) {
    return {
      ok: false,
      error: error.message.includes("bloqueado")
        ? "Completá lo anterior para seguir."
        : "No pudimos guardar tu avance. Probá de nuevo.",
    };
  }
  revalidatePath("/estudiar", "layout");
  revalidatePath("/inicio");
  return { ok: true, cumplido: Boolean((data as { cumplido?: boolean } | null)?.cumplido) };
}

export type ResultadoFavorito = { ok: true; favorito: boolean } | { ok: false; error: string };

export async function alternarFavorito(cursoId: string): Promise<ResultadoFavorito> {
  const perfil = await requerirPerfil();
  const id = z.uuid().safeParse(cursoId);
  if (!id.success) return { ok: false, error: "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { data: existe } = await supabase
    .from("cursos_favoritos")
    .select("curso_id")
    .eq("curso_id", id.data)
    .maybeSingle();
  const { error } = existe
    ? await supabase.from("cursos_favoritos").delete().eq("curso_id", id.data).eq("usuario_id", perfil.id)
    : await supabase.from("cursos_favoritos").insert({ curso_id: id.data });
  if (error) return { ok: false, error: "No pudimos guardar el favorito." };
  revalidatePath("/estudiar");
  revalidatePath("/inicio");
  return { ok: true, favorito: !existe };
}
