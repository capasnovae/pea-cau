"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { mensajeErrorGuardado } from "@/lib/dominio/edicion";
import { esquemaCaso } from "@/lib/dominio/examenes";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoCaso = { ok: true; mensaje: string } | { ok: false; error: string } | null;

export async function guardarCaso(_prev: ResultadoCaso, formData: FormData): Promise<ResultadoCaso> {
  await requerirRol([...ROLES_EDITORES]);
  const id = z.union([z.literal(""), z.uuid()]).safeParse(formData.get("id") ?? "");
  const d = esquemaCaso.safeParse(Object.fromEntries(formData));
  if (!id.success) return { ok: false, error: "Revisá los datos." };
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const r = id.data
    ? await supabase.from("casos").update(d.data).eq("id", id.data).select("id")
    : await supabase.from("casos").insert(d.data).select("id");
  if (r.error || !r.data?.length)
    return { ok: false, error: mensajeErrorGuardado(r.error ?? { code: "42501" }) };
  revalidatePath("/contenido/casos");
  if (!id.data) redirect(`/contenido/casos/${r.data[0]!.id}`);
  return { ok: true, mensaje: "Caso guardado." };
}
