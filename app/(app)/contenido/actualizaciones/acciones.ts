"use server";

import { revalidatePath } from "next/cache";
import { esquemaActualizacion } from "@/lib/dominio/actualizaciones";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoActualizacion = { ok: true; asignadas: number } | { ok: false; error: string } | null;

export async function publicarActualizacion(
  _prev: ResultadoActualizacion,
  formData: FormData,
): Promise<ResultadoActualizacion> {
  await requerirRol(["admin"]);
  const d = esquemaActualizacion.safeParse(Object.fromEntries(formData));
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { data: id, error } = await supabase.rpc("publicar_actualizacion", { p: d.data });
  if (error || !id) return { ok: false, error: "No pudimos publicarla. Revisá los datos." };
  const { count } = await supabase
    .from("actualizacion_asignaciones")
    .select("id", { count: "exact", head: true })
    .eq("actualizacion_id", id);
  revalidatePath("/contenido/actualizaciones");
  return { ok: true, asignadas: count ?? 0 };
}
