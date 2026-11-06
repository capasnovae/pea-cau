"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { mensajeErrorGuardado } from "@/lib/dominio/edicion";
import { esquemaExamen } from "@/lib/dominio/examenes";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoExamen = { ok: true; mensaje: string } | { ok: false; error: string } | null;

export async function guardarExamen(_prev: ResultadoExamen, formData: FormData): Promise<ResultadoExamen> {
  await requerirRol([...ROLES_EDITORES]);
  const id = z.union([z.literal(""), z.uuid()]).safeParse(formData.get("id") ?? "");
  let fuentes: unknown = [];
  try {
    fuentes = JSON.parse(String(formData.get("fuentes") ?? "[]"));
  } catch {
    fuentes = [];
  }
  const d = esquemaExamen.safeParse({ ...Object.fromEntries(formData), fuentes });
  if (!id.success) return { ok: false, error: "Revisá los datos." };
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const e = d.data;
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase.rpc("guardar_examen", {
    p_datos: {
      ...e,
      id: id.data || null,
      modulo_id: e.tipo === "modulo" || e.tipo === "practica" ? e.modulo_id : null,
      categoria_id: e.tipo === "categoria" || e.tipo === "practica" ? e.categoria_id : null,
      curso_id: e.tipo === "nivel" ? e.curso_id : null,
      sede_id: e.alcance === "sede" ? e.sede_id : null,
      fuentes: e.tipo === "integrador" ? e.fuentes : [],
    },
  });
  if (error || !data) return { ok: false, error: mensajeErrorGuardado(error ?? {}) };
  revalidatePath("/contenido/examenes");
  if (!id.data) redirect(`/contenido/examenes/${data}?creado=1`);
  return { ok: true, mensaje: "Examen guardado." };
}
