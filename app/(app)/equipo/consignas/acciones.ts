"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { esquemaConsigna } from "@/lib/dominio/consignas";
import { ROLES_GESTION } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoConsigna = { ok: true; mensaje: string } | { ok: false; error: string } | null;

export async function crearConsigna(_prev: ResultadoConsigna, formData: FormData): Promise<ResultadoConsigna> {
  const perfil = await requerirRol([...ROLES_GESTION]);
  const entrada = Object.fromEntries(formData);
  if (perfil.rol === "lider" || perfil.rol === "coordinador") entrada.sede_id = perfil.sede_id ?? "";
  const d = esquemaConsigna.safeParse(entrada);
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase.from("consignas").insert({ ...d.data, creada_por: perfil.id }).select("id").single();
  if (error) {
    return { ok: false, error: error.code === "42501" ? "No tenés permiso para asignar a ese destino." : "No pudimos crear la consigna. Probá de nuevo." };
  }
  revalidatePath("/equipo/consignas");
  redirect(`/equipo/consignas/${data.id}?creada=1`);
}

export async function desactivarConsigna(id: string): Promise<ResultadoConsigna> {
  await requerirRol([...ROLES_GESTION]);
  const i = z.uuid().safeParse(id);
  if (!i.success) return { ok: false, error: "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase.from("consignas").update({ activa: false }).eq("id", i.data).select("id");
  if (error || !data?.length) return { ok: false, error: "No tenés permiso para hacer esto." };
  revalidatePath(`/equipo/consignas/${i.data}`);
  return { ok: true, mensaje: "Listo: no se va a repetir más." };
}
