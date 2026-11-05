"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import type { ResultadoAccion } from "../usuarios/acciones";

const esquemaSede = z.object({
  id: z.preprocess((v) => (v === "" ? undefined : v), z.uuid().optional()),
  nombre: z.string().trim().min(1, "Falta el nombre.").max(80),
  ciudad: z.string().trim().min(1, "Falta la ciudad.").max(80),
  direccion: z.string().trim().max(160).optional(),
});

export async function guardarSede(_prev: ResultadoAccion, formData: FormData): Promise<ResultadoAccion> {
  await requerirRol(["admin"]);
  const d = esquemaSede.safeParse(Object.fromEntries(formData));
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { id, ...valores } = d.data;
  const { error } = id
    ? await supabase.from("sedes").update(valores).eq("id", id)
    : await supabase.from("sedes").insert(valores);
  if (error) return { ok: false, error: error.code === "23505" ? "Ya hay una sede con ese nombre." : "No tenés permiso para hacer esto." };
  revalidatePath("/admin/sedes");
  return { ok: true, mensaje: "Sede guardada." };
}
