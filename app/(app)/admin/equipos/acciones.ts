"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import type { ResultadoAccion } from "../usuarios/acciones";

const uuidOpcional = z.preprocess((v) => (v === "" ? null : v), z.uuid().nullable());

const esquemaEquipo = z.object({
  id: z.preprocess((v) => (v === "" ? undefined : v), z.uuid().optional()),
  nombre: z.string().trim().min(1, "Falta el nombre.").max(80),
  sede_id: z.uuid("Elegí la sede."),
  area: z.enum(["servicio", "ventas"]),
  lider_id: uuidOpcional,
});

export async function guardarEquipo(_prev: ResultadoAccion, formData: FormData): Promise<ResultadoAccion> {
  await requerirRol(["admin"]);
  const d = esquemaEquipo.safeParse(Object.fromEntries(formData));
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  if (d.data.lider_id) {
    const { data: lider } = await supabase.from("perfiles").select("sede_id, area").eq("id", d.data.lider_id).maybeSingle();
    if (!lider || lider.sede_id !== d.data.sede_id || lider.area !== d.data.area) {
      return { ok: false, error: "El líder tiene que ser de la misma sede y área que el equipo." };
    }
  }
  const { id, ...valores } = d.data;
  const { error } = id
    ? await supabase.from("equipos").update(valores).eq("id", id)
    : await supabase.from("equipos").insert(valores);
  if (error) return { ok: false, error: error.code === "23505" ? "Ya hay un equipo con ese nombre en la sede." : "No tenés permiso para hacer esto." };
  revalidatePath("/admin/equipos");
  return { ok: true, mensaje: "Equipo guardado." };
}
