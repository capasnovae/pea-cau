"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import { rutaArchivo } from "@/lib/dominio/contenido";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoAsignacion = { ok: true; mensaje: string } | { ok: false; error: string } | null;

const MAX_BYTES = 10 * 1024 * 1024;
const MIME = new Set(["image/png", "image/jpeg", "image/webp", "application/pdf"]);

/** Prepara la subida directa de una evidencia a Storage (la política exige ser el destinatario). */
export async function prepararEvidencia(entrada: {
  asignacionId: string;
  nombre: string;
  tamano: number;
  tipoMime: string;
}): Promise<{ ok: true; path: string; token: string } | { ok: false; error: string }> {
  await requerirPerfil();
  const id = z.uuid().safeParse(entrada.asignacionId);
  if (!id.success) return { ok: false, error: "No encontramos esa consigna." };
  if (entrada.tamano > MAX_BYTES) return { ok: false, error: "La evidencia pesa más de 10 MB." };
  if (!MIME.has(entrada.tipoMime)) return { ok: false, error: "Subí una imagen (PNG, JPG, WEBP) o un PDF." };
  const supabase = await crearClienteServidor();
  const path = rutaArchivo(id.data, entrada.nombre, crypto.randomUUID());
  const { data, error } = await supabase.storage.from("evidencias").createSignedUploadUrl(path);
  if (error || !data) return { ok: false, error: "No podés subir evidencia a esta consigna." };
  return { ok: true, path: data.path, token: data.token };
}

const esquemaActualizacion = z.object({
  id: z.uuid(),
  estado: z.enum(["en_curso", "hecha"]),
  comentario: z.preprocess((v) => (v ?? "") as string, z.string().trim().max(1000)),
  evidencia_path: z.preprocess((v) => (v === "" || v == null ? null : v), z.string().max(400).nullable()),
});

export async function actualizarAsignacion(
  _prev: ResultadoAsignacion,
  formData: FormData,
): Promise<ResultadoAsignacion> {
  const perfil = await requerirPerfil();
  const d = esquemaActualizacion.safeParse(Object.fromEntries(formData));
  if (!d.success) return { ok: false, error: "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { data: actual } = await supabase
    .from("consigna_asignaciones")
    .select("id, usuario_id, evidencia_path, consignas(requiere_evidencia)")
    .eq("id", d.data.id)
    .maybeSingle();
  if (!actual || actual.usuario_id !== perfil.id) return { ok: false, error: "No encontramos esa consigna." };
  if (d.data.evidencia_path && !d.data.evidencia_path.startsWith(`${d.data.id}/`)) {
    return { ok: false, error: "La evidencia no corresponde a esta consigna." };
  }
  const evidencia = d.data.evidencia_path ?? actual.evidencia_path;
  if (d.data.estado === "hecha" && actual.consignas?.requiere_evidencia && !evidencia) {
    return { ok: false, error: "Esta consigna pide evidencia: subí una imagen o un PDF antes de cerrarla." };
  }
  const { error } = await supabase
    .from("consigna_asignaciones")
    .update({ estado: d.data.estado, comentario: d.data.comentario || null, evidencia_path: evidencia })
    .eq("id", d.data.id);
  if (error) {
    return {
      ok: false,
      error: error.message.includes("confirmá la lectura")
        ? "Primero confirmá que leíste el artículo."
        : error.message.includes("subí la evidencia")
          ? "Esta consigna pide evidencia: subí una imagen o un PDF antes de cerrarla."
          : "No pudimos guardar. Probá de nuevo.",
    };
  }
  revalidatePath("/consignas");
  revalidatePath("/inicio");
  return {
    ok: true,
    mensaje: d.data.estado === "hecha" ? "¡Listo! La marcaste como hecha." : "La marcaste en curso.",
  };
}

export async function confirmarLectura(asignacionId: string): Promise<ResultadoAsignacion> {
  const perfil = await requerirPerfil();
  const id = z.uuid().safeParse(asignacionId);
  if (!id.success) return { ok: false, error: "No encontramos esa consigna." };
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase
    .from("consigna_asignaciones")
    .update({ leida_at: new Date().toISOString() })
    .eq("id", id.data)
    .eq("usuario_id", perfil.id)
    .select("id");
  if (error || !data?.length) return { ok: false, error: "No pudimos registrar la lectura." };
  revalidatePath("/consignas");
  return { ok: true, mensaje: "Lectura confirmada." };
}

export async function urlEvidencia(
  asignacionId: string,
): Promise<{ ok: true; url: string } | { ok: false; error: string }> {
  await requerirPerfil();
  const id = z.uuid().safeParse(asignacionId);
  if (!id.success) return { ok: false, error: "No encontramos esa evidencia." };
  const supabase = await crearClienteServidor();
  const { data: a } = await supabase
    .from("consigna_asignaciones")
    .select("evidencia_path")
    .eq("id", id.data)
    .maybeSingle();
  if (!a?.evidencia_path) return { ok: false, error: "No encontramos esa evidencia." };
  const { data, error } = await supabase.storage.from("evidencias").createSignedUrl(a.evidencia_path, 600);
  if (error || !data) return { ok: false, error: "No pudimos abrir la evidencia." };
  return { ok: true, url: data.signedUrl };
}
