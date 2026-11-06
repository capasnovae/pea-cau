"use server";

import { revalidatePath } from "next/cache";
import { esquemaEvento } from "@/lib/dominio/calendario";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoEvento = { ok: true; mensaje: string } | { ok: false; error: string } | null;

const SIN_PERMISO = "No podés crear eventos para esa sede.";

export async function crearEvento(_prev: ResultadoEvento, formData: FormData): Promise<ResultadoEvento> {
  await requerirRol(["coordinador", "director", "admin"]);
  const d = esquemaEvento.safeParse(Object.fromEntries(formData));
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { error } = await supabase.from("eventos").insert(d.data);
  if (error)
    return { ok: false, error: error.code === "42501" ? SIN_PERMISO : "No pudimos guardar el evento." };
  revalidatePath("/calendario");
  return { ok: true, mensaje: "Evento creado." };
}
