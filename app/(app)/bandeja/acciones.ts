"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import {
  esquemaAnuncio,
  esquemaMensajeNuevo,
  esquemaRespuesta,
  mensajeErrorBandeja,
} from "@/lib/dominio/bandeja";
import { requerirPerfil, requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoBandeja = { ok: false; error: string } | { ok: true } | null;

function revalidar() {
  revalidatePath("/bandeja", "layout");
  revalidatePath("/", "layout");
}

export async function enviarNuevo(_prev: ResultadoBandeja, formData: FormData): Promise<ResultadoBandeja> {
  await requerirPerfil();
  const d = esquemaMensajeNuevo.safeParse({
    destinatarios: formData.getAll("para"),
    asunto: formData.get("asunto"),
    cuerpo: formData.get("cuerpo"),
  });
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase.rpc("iniciar_conversacion", {
    p_destinatarios: d.data.destinatarios,
    p_asunto: d.data.asunto,
    p_cuerpo: d.data.cuerpo,
  });
  if (error || !data) return { ok: false, error: mensajeErrorBandeja(error?.message) };
  revalidar();
  redirect(`/bandeja/${data}`);
}

export async function publicarAnuncio(
  _prev: ResultadoBandeja,
  formData: FormData,
): Promise<ResultadoBandeja> {
  await requerirRol(["coordinador", "director", "admin"]);
  const d = esquemaAnuncio.safeParse(Object.fromEntries(formData));
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase.rpc("publicar_anuncio", {
    p_asunto: d.data.asunto,
    p_cuerpo: d.data.cuerpo,
    p_sede: d.data.sede_id as string,
  });
  if (error || !data) return { ok: false, error: mensajeErrorBandeja(error?.message) };
  revalidar();
  redirect(`/bandeja/${data}`);
}

export async function responder(_prev: ResultadoBandeja, formData: FormData): Promise<ResultadoBandeja> {
  await requerirPerfil();
  const id = z.uuid().safeParse(formData.get("conversacion"));
  const d = esquemaRespuesta.safeParse({ cuerpo: formData.get("cuerpo") });
  if (!id.success) return { ok: false, error: "Revisá los datos." };
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { error } = await supabase.rpc("responder", { p_conversacion: id.data, p_cuerpo: d.data.cuerpo });
  if (error) return { ok: false, error: mensajeErrorBandeja(error.message) };
  revalidar();
  return { ok: true };
}

export async function archivar(id: string, archivada: boolean): Promise<void> {
  await requerirPerfil();
  const v = z.uuid().safeParse(id);
  if (!v.success) return;
  const supabase = await crearClienteServidor();
  await supabase.rpc("archivar", { p_conversacion: v.data, p_archivada: archivada });
  revalidar();
  redirect(archivada ? "/bandeja" : `/bandeja/${v.data}`);
}
