"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import { esquemaRevocacion } from "@/lib/dominio/certificados";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoRevocar = { ok: true; mensaje: string } | { ok: false; error: string } | null;

export async function revocar(
  id: string,
  _prev: ResultadoRevocar,
  formData: FormData,
): Promise<ResultadoRevocar> {
  await requerirRol(["admin"]);
  const v = z.uuid().safeParse(id);
  const d = esquemaRevocacion.safeParse(Object.fromEntries(formData));
  if (!v.success) return { ok: false, error: "Revisá los datos." };
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { error } = await supabase.rpc("revocar_certificacion", { p_id: v.data, p_motivo: d.data.motivo });
  if (error) return { ok: false, error: "No pudimos revocarlo." };
  revalidatePath("/admin/certificaciones");
  return { ok: true, mensaje: "Certificado revocado." };
}
