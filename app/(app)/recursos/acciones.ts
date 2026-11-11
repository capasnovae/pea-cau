"use server";

import { z } from "zod";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

const MINUTOS_URL = 10;

/** Firma la descarga con el cliente del usuario: si la RLS o Storage no lo dejan ver el archivo, no hay URL. */
export async function obtenerUrlDescarga(
  recursoId: string,
): Promise<{ ok: true; url: string } | { ok: false; error: string }> {
  await requerirPerfil();
  const id = z.uuid().safeParse(recursoId);
  if (!id.success) return { ok: false, error: "No encontramos ese recurso." };
  const supabase = await crearClienteServidor();
  const { data: recurso } = await supabase
    .from("recursos")
    .select("archivo_path")
    .eq("id", id.data)
    .maybeSingle();
  if (!recurso?.archivo_path) return { ok: false, error: "No encontramos ese recurso." };
  const { data, error } = await supabase.storage
    .from("recursos")
    .createSignedUrl(recurso.archivo_path, MINUTOS_URL * 60);
  if (error || !data) return { ok: false, error: "No pudimos preparar la descarga. Probá de nuevo." };
  return { ok: true, url: data.signedUrl };
}
