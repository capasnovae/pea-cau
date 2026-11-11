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

export type ResultadoPractica =
  | { ok: true; es_correcta: boolean; explicacion_md: string; solucion: Record<string, unknown> }
  | { ok: false; error: string };

const esquemaRespuesta = z.object({
  opcion_ids: z.array(z.uuid()).max(20).nullish(),
  orden: z.array(z.uuid()).max(20).nullish(),
  texto: z.string().max(5000).nullish(),
  valores: z.record(z.string(), z.string().max(500)).nullish(),
});

/** Comprueba una pregunta de práctica: la de un paso "práctica" (examen) o el Probalo de una lección. */
export async function comprobarPractica(
  origen: { tipo: "examen" | "leccion"; id: string } | { tipo: "repaso" },
  preguntaId: string,
  respuesta: unknown,
): Promise<ResultadoPractica> {
  await requerirPerfil();
  const ids = z
    .object({ o: z.uuid(), p: z.uuid() })
    .safeParse({ o: origen.tipo === "repaso" ? preguntaId : origen.id, p: preguntaId });
  const r = esquemaRespuesta.safeParse(respuesta);
  if (!ids.success || !r.success || !["examen", "leccion", "repaso"].includes(origen.tipo))
    return { ok: false, error: "Revisá la respuesta." };
  const supabase = await crearClienteServidor();
  const { data, error } =
    origen.tipo === "repaso"
      ? await supabase.rpc("responder_repaso", { p_pregunta: ids.data.p, p_respuesta: r.data }).maybeSingle()
      : origen.tipo === "examen"
        ? await supabase
            .rpc("comprobar_practica", { p_examen: ids.data.o, p_pregunta: ids.data.p, p_respuesta: r.data })
            .maybeSingle()
        : await supabase
            .rpc("comprobar_probalo", { p_item: ids.data.o, p_pregunta: ids.data.p, p_respuesta: r.data })
            .maybeSingle();
  if (error || !data) return { ok: false, error: "No pudimos comprobar. Probá de nuevo." };
  // En el repaso no se revalida: la página se recargaría y borraría la devolución antes de leerla
  if (origen.tipo !== "repaso") revalidatePath("/estudiar", "layout");
  return {
    ok: true,
    es_correcta: data.es_correcta,
    explicacion_md: data.explicacion_md,
    solucion: data.solucion as Record<string, unknown>,
  };
}
