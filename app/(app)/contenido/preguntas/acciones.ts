"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { mensajeErrorGuardado } from "@/lib/dominio/edicion";
import { esquemaPregunta, preguntaParaGuardar } from "@/lib/dominio/examenes";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoPregunta = { ok: true; mensaje: string } | { ok: false; error: string } | null;

function json(v: FormDataEntryValue | null): unknown {
  try {
    return JSON.parse(String(v ?? "[]"));
  } catch {
    return [];
  }
}

export async function guardarPregunta(
  _prev: ResultadoPregunta,
  formData: FormData,
): Promise<ResultadoPregunta> {
  await requerirRol([...ROLES_EDITORES]);
  const id = z.union([z.literal(""), z.uuid()]).safeParse(formData.get("id") ?? "");
  const d = esquemaPregunta.safeParse({
    ...Object.fromEntries(formData),
    opciones: json(formData.get("opciones")),
    columnas: json(formData.get("columnas")),
    campos: json(formData.get("campos")),
  });
  if (!id.success) return { ok: false, error: "Revisá los datos." };
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase.rpc("guardar_pregunta", {
    p_datos: { ...preguntaParaGuardar(d.data), id: id.data || null },
  });
  if (error || !data) {
    return {
      ok: false,
      error: error?.message.includes("pregunta en uso")
        ? "Ya salió en exámenes: podés corregir textos, no el tipo ni la cantidad de opciones."
        : mensajeErrorGuardado(error ?? {}),
    };
  }
  revalidatePath("/contenido/preguntas");
  if (!id.data) redirect(`/contenido/preguntas/${data}?creada=1`);
  return { ok: true, mensaje: "Pregunta guardada." };
}
