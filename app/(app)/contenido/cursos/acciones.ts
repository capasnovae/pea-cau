"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { mensajeErrorGuardado } from "@/lib/dominio/edicion";
import { esquemaCurso, esquemaItem, esquemaModulo } from "@/lib/dominio/esquemas-cursos";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoCurso = { ok: true; mensaje: string } | { ok: false; error: string } | null;

const SIN_PERMISO = "No tenés permiso para hacer esto.";
const idOpcional = z.preprocess((v) => (v === "" || v == null ? undefined : v), z.uuid().optional());

function errorCurso(e: { code?: string; message?: string }): string {
  if (e.code === "23505") return "Ya hay un curso con ese número de nivel.";
  if (e.message?.includes("prerrequisito")) return "El prerrequisito tiene que ser del mismo curso.";
  return mensajeErrorGuardado(e);
}

export async function guardarCurso(_prev: ResultadoCurso, formData: FormData): Promise<ResultadoCurso> {
  await requerirRol([...ROLES_EDITORES]);
  const id = idOpcional.safeParse(formData.get("id"));
  const d = esquemaCurso.safeParse(Object.fromEntries(formData));
  if (!id.success || !d.success) return { ok: false, error: d.error?.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  if (id.data) {
    const { data, error } = await supabase.from("cursos").update(d.data).eq("id", id.data).select("id");
    if (error) return { ok: false, error: errorCurso(error) };
    if (!data?.length) return { ok: false, error: SIN_PERMISO };
    revalidatePath(`/contenido/cursos/${id.data}`);
    return { ok: true, mensaje: "Curso guardado." };
  }
  const { data, error } = await supabase.from("cursos").insert(d.data).select("id").single();
  if (error) return { ok: false, error: errorCurso(error) };
  redirect(`/contenido/cursos/${data.id}?creado=1`);
}

export async function guardarModulo(_prev: ResultadoCurso, formData: FormData): Promise<ResultadoCurso> {
  await requerirRol([...ROLES_EDITORES]);
  const id = idOpcional.safeParse(formData.get("id"));
  const d = esquemaModulo.safeParse({ ...Object.fromEntries(formData), prerrequisitos: formData.getAll("prerrequisitos") });
  if (!id.success || !d.success) return { ok: false, error: d.error?.issues[0]?.message ?? "Revisá los datos." };
  const { prerrequisitos, ...valores } = d.data;
  const supabase = await crearClienteServidor();
  const r = id.data
    ? await supabase.from("modulos").update(valores).eq("id", id.data).select("id").single()
    : await supabase.from("modulos").insert(valores).select("id").single();
  if (r.error || !r.data) return { ok: false, error: r.error ? errorCurso(r.error) : SIN_PERMISO };
  const moduloId = r.data.id;
  await supabase.from("modulo_prerrequisitos").delete().eq("modulo_id", moduloId);
  const otros = prerrequisitos.filter((p) => p !== moduloId);
  if (otros.length) {
    const { error } = await supabase.from("modulo_prerrequisitos").insert(otros.map((p) => ({ modulo_id: moduloId, requiere_modulo_id: p })));
    if (error) return { ok: false, error: errorCurso(error) };
  }
  revalidatePath(`/contenido/cursos/${valores.curso_id}`);
  return { ok: true, mensaje: "Módulo guardado." };
}

export async function guardarItem(_prev: ResultadoCurso, formData: FormData): Promise<ResultadoCurso> {
  await requerirRol([...ROLES_EDITORES]);
  const id = idOpcional.safeParse(formData.get("id"));
  const d = esquemaItem.safeParse(Object.fromEntries(formData));
  if (!id.success || !d.success) return { ok: false, error: d.error?.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const r = id.data
    ? await supabase.from("items").update(d.data).eq("id", id.data).select("id")
    : await supabase.from("items").insert(d.data).select("id");
  if (r.error) return { ok: false, error: errorCurso(r.error) };
  if (!r.data?.length) return { ok: false, error: SIN_PERMISO };
  revalidatePath("/contenido/cursos", "layout");
  return { ok: true, mensaje: "Ítem guardado." };
}

export async function borrarFila(tabla: "modulos" | "items", id: string): Promise<ResultadoCurso> {
  await requerirRol([...ROLES_EDITORES]);
  const i = z.uuid().safeParse(id);
  if (!i.success || (tabla !== "modulos" && tabla !== "items")) return { ok: false, error: "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase.from(tabla).delete().eq("id", i.data).select("id");
  if (error || !data?.length) return { ok: false, error: SIN_PERMISO };
  revalidatePath("/contenido/cursos", "layout");
  return { ok: true, mensaje: "Eliminado." };
}

const esquemaRuta = z.object({ curso_id: z.uuid(), clave: z.string().regex(/^(puesto|subrol):[0-9a-f-]{36}$/), valor: z.enum(["", "obligatorio", "opcional"]) });

export async function guardarRuta(entrada: { curso_id: string; clave: string; valor: string }): Promise<ResultadoCurso> {
  await requerirRol(["admin"]);
  const d = esquemaRuta.safeParse(entrada);
  if (!d.success) return { ok: false, error: "Revisá los datos." };
  const [tipo, refId] = d.data.clave.split(":") as ["puesto" | "subrol", string];
  const col = tipo === "puesto" ? "puesto_id" : "subrol_id";
  const supabase = await crearClienteServidor();
  await supabase.from("ruta_cursos").delete().eq("curso_id", d.data.curso_id).eq(col, refId);
  if (d.data.valor) {
    const fila = {
      curso_id: d.data.curso_id,
      puesto_id: tipo === "puesto" ? refId : null,
      subrol_id: tipo === "subrol" ? refId : null,
      obligatorio: d.data.valor === "obligatorio",
    };
    const { error } = await supabase.from("ruta_cursos").insert(fila);
    if (error) return { ok: false, error: SIN_PERMISO };
  }
  revalidatePath("/admin/rutas");
  return { ok: true, mensaje: "Ruta actualizada." };
}
