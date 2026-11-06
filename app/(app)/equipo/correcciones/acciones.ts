"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { esquemaCorreccion } from "@/lib/dominio/examenes";
import { ROLES_GESTION } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoCorreccion = { ok: true; mensaje: string } | { ok: false; error: string } | null;

function traducir(m: string | undefined): string {
  if (m?.includes("ya lo tomó otra persona")) return "Ya lo está corrigiendo otra persona.";
  if (m?.includes("puntaje inválido")) return "El puntaje tiene que estar entre 0 y el máximo.";
  if (m?.includes("faltan respuestas")) return "Falta corregir alguna respuesta.";
  if (m?.includes("tomalo primero")) return "Tomá el intento para corregirlo.";
  return "No pudimos guardar. Probá de nuevo.";
}

export async function tomar(intentoId: string): Promise<void> {
  await requerirRol([...ROLES_GESTION]);
  const id = z.uuid().safeParse(intentoId);
  if (!id.success) redirect("/equipo/correcciones");
  const supabase = await crearClienteServidor();
  const { error } = await supabase.rpc("tomar_correccion", { p_intento: id.data });
  revalidatePath("/equipo/correcciones");
  if (error) redirect(`/equipo/correcciones?error=${encodeURIComponent(traducir(error.message))}`);
  redirect(`/equipo/correcciones/${id.data}`);
}

export async function soltar(intentoId: string): Promise<void> {
  await requerirRol([...ROLES_GESTION]);
  const id = z.uuid().safeParse(intentoId);
  if (!id.success) redirect("/equipo/correcciones");
  const supabase = await crearClienteServidor();
  await supabase.rpc("soltar_correccion", { p_intento: id.data });
  revalidatePath("/equipo/correcciones");
  redirect("/equipo/correcciones");
}

/** Guarda el puntaje y la devolución de cada respuesta; con "cerrar", además cierra el intento. */
export async function corregir(_prev: ResultadoCorreccion, formData: FormData): Promise<ResultadoCorreccion> {
  await requerirRol([...ROLES_GESTION]);
  const intento = z.uuid().safeParse(formData.get("intento"));
  if (!intento.success) return { ok: false, error: "Revisá los datos." };
  const ids = formData.getAll("respuesta").map(String);
  const supabase = await crearClienteServidor();
  for (const rid of ids) {
    const puntaje = String(formData.get(`puntaje_${rid}`) ?? "");
    if (puntaje === "") continue;
    const d = esquemaCorreccion.safeParse({
      respuesta_id: rid,
      puntaje,
      devolucion: formData.get(`devolucion_${rid}`) ?? "",
    });
    if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los puntajes." };
    const { error } = await supabase.rpc("corregir_respuesta", {
      p_respuesta: d.data.respuesta_id,
      p_puntaje: d.data.puntaje,
      p_devolucion: d.data.devolucion,
    });
    if (error) return { ok: false, error: traducir(error.message) };
  }
  if (formData.get("accion") === "cerrar") {
    const { error } = await supabase.rpc("cerrar_correccion", { p_intento: intento.data });
    if (error) return { ok: false, error: traducir(error.message) };
    revalidatePath("/equipo/correcciones");
    redirect("/equipo/correcciones?cerrada=1");
  }
  return { ok: true, mensaje: "Guardado." };
}
