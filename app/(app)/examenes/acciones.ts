"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { errorExamen, esquemaRespuesta, type RespuestaExamen } from "@/lib/dominio/examenes";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export async function empezar(examenId: string): Promise<void> {
  await requerirPerfil();
  const id = z.uuid().safeParse(examenId);
  if (!id.success) redirect("/examenes");
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase.rpc("iniciar_intento", { p_examen: id.data });
  if (error || !data) redirect(`/examenes/${id.data}?error=${errorExamen(error?.message).codigo}`);
  redirect(`/examenes/intento/${data}`);
}

export async function empezarUbicacion(): Promise<void> {
  await requerirPerfil();
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase.rpc("iniciar_ubicacion");
  if (error || !data) redirect(`/examenes?error=${errorExamen(error?.message).codigo}`);
  redirect(`/examenes/intento/${data}`);
}

export type ResultadoGuardar = { ok: true } | { ok: false; error: string };

export async function guardar(intentoId: string, respuesta: RespuestaExamen): Promise<ResultadoGuardar> {
  await requerirPerfil();
  const id = z.uuid().safeParse(intentoId);
  const r = esquemaRespuesta.safeParse(respuesta);
  if (!id.success || !r.success) return { ok: false, error: "Revisá la respuesta." };
  const supabase = await crearClienteServidor();
  const { error } = await supabase.rpc("guardar_respuesta", {
    p_intento: id.data,
    p_pregunta: r.data.pregunta_id,
    p_opcion_ids: r.data.opcion_ids as string[],
    p_orden: r.data.orden as string[],
    p_texto: r.data.texto as string,
    p_valores: r.data.valores,
  });
  if (error) return { ok: false, error: errorExamen(error.message).mensaje };
  return { ok: true };
}

export async function entregar(intentoId: string): Promise<void> {
  await requerirPerfil();
  const id = z.uuid().safeParse(intentoId);
  if (!id.success) redirect("/examenes");
  const supabase = await crearClienteServidor();
  await supabase.rpc("entregar_intento", { p_intento: id.data });
  revalidatePath("/examenes", "layout");
  revalidatePath("/estudiar", "layout");
  redirect(`/examenes/intento/${id.data}/resultado`);
}

/** Suma una salida del examen (otra pestaña o ventana). Devuelve el total, o null si no se pudo. */
export async function registrarSalida(intentoId: string): Promise<number | null> {
  await requerirPerfil();
  const id = z.uuid().safeParse(intentoId);
  if (!id.success) return null;
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase.rpc("registrar_salida", { p_intento: id.data });
  return error ? null : data;
}
