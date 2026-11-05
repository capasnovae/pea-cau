"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import { mensajeErrorGuardado } from "@/lib/dominio/edicion";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoArea = { ok: true; mensaje: string } | { ok: false; error: string } | null;

const texto = (max: number) => z.preprocess((v) => (v ?? "") as string, z.string().trim().max(max));
const esquemaArea = z.object({
  id: z.preprocess((v) => (v === "" || v == null ? undefined : v), z.uuid().optional()),
  nombre: z.string().trim().min(1, "Falta el nombre.").max(120),
  que_resuelve_md: texto(3000),
  que_no_resuelve_md: texto(3000),
  canal_contacto: texto(300),
  plazo_esperado: texto(120),
  orden: z.coerce.number().int().min(0).max(999).default(0),
});

export async function guardarArea(_prev: ResultadoArea, formData: FormData): Promise<ResultadoArea> {
  await requerirRol(["admin"]);
  const d = esquemaArea.safeParse(Object.fromEntries(formData));
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const { id, ...valores } = d.data;
  const supabase = await crearClienteServidor();
  const r = id
    ? await supabase.from("areas_derivacion").update(valores).eq("id", id).select("id")
    : await supabase.from("areas_derivacion").insert(valores).select("id");
  if (r.error) return { ok: false, error: r.error.code === "23505" ? "Ya hay un área con ese nombre." : mensajeErrorGuardado(r.error) };
  if (!r.data?.length) return { ok: false, error: "No tenés permiso para hacer esto." };
  revalidatePath("/admin/derivaciones");
  revalidatePath("/organigrama/derivaciones");
  return { ok: true, mensaje: "Área guardada." };
}
