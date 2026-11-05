"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { z } from "zod";
import { rutaArchivo } from "@/lib/dominio/contenido";
import { mensajeErrorGuardado } from "@/lib/dominio/edicion";
import { esquemaArticulo, esquemaCampana, esquemaRecurso } from "@/lib/dominio/esquemas-contenido";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type ResultadoGuardado = { ok: true; mensaje: string } | { ok: false; error: string } | null;

const MAX_BYTES = 50 * 1024 * 1024;
const MIME_PERMITIDOS = new Set([
  "image/png", "image/jpeg", "image/webp", "image/gif", "application/pdf",
  "application/vnd.openxmlformats-officedocument.presentationml.presentation",
  "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
  "video/mp4",
]);
const SIN_PERMISO = "No tenés permiso para hacer esto.";
const idOpcional = z.preprocess((v) => (v === "" || v == null ? undefined : v), z.uuid().optional());

function datos(formData: FormData): Record<string, FormDataEntryValue> {
  const d = Object.fromEntries(formData);
  delete d.archivo;
  return d;
}

export async function guardarArticulo(_prev: ResultadoGuardado, formData: FormData): Promise<ResultadoGuardado> {
  await requerirRol([...ROLES_EDITORES]);
  const id = idOpcional.safeParse(formData.get("id"));
  const d = esquemaArticulo.safeParse(datos(formData));
  if (!id.success || !d.success) return { ok: false, error: d.error?.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const valores = { ...d.data, ultimo_cambio: d.data.ultimo_cambio || null };
  if (id.data) {
    const { data, error } = await supabase.from("articulos").update(valores).eq("id", id.data).select("id");
    if (error) return { ok: false, error: mensajeErrorGuardado(error) };
    if (!data?.length) return { ok: false, error: SIN_PERMISO };
    revalidatePath("/contenido");
    revalidatePath("/repositorio", "layout");
    return { ok: true, mensaje: "Artículo guardado." };
  }
  const { data, error } = await supabase.from("articulos").insert(valores).select("id").single();
  if (error) return { ok: false, error: mensajeErrorGuardado(error) };
  revalidatePath("/contenido");
  redirect(`/contenido/articulos/${data.id}?creado=1`);
}

export async function guardarRecurso(_prev: ResultadoGuardado, formData: FormData): Promise<ResultadoGuardado> {
  await requerirRol([...ROLES_EDITORES]);
  const id = idOpcional.safeParse(formData.get("id"));
  if (!id.success) return { ok: false, error: "Revisá los datos." };
  const archivo = formData.get("archivo");
  const hayArchivoNuevo = archivo instanceof File && archivo.size > 0;
  const supabase = await crearClienteServidor();

  let anterior: { archivo_path: string | null; alcance: string; sede_id: string | null } | null = null;
  if (id.data) {
    const { data } = await supabase.from("recursos").select("archivo_path, alcance, sede_id").eq("id", id.data).maybeSingle();
    if (!data) return { ok: false, error: SIN_PERMISO };
    anterior = data;
  }
  const d = esquemaRecurso.safeParse({ ...datos(formData), tiene_archivo: hayArchivoNuevo || !!anterior?.archivo_path });
  if (!d.success) return { ok: false, error: d.error.issues[0]?.message ?? "Revisá los datos." };
  const { tiene_archivo: _t, ...valores } = d.data;

  if (anterior?.archivo_path && !hayArchivoNuevo && (anterior.alcance !== valores.alcance || anterior.sede_id !== valores.sede_id)) {
    return { ok: false, error: "Si cambiás el alcance o la sede, volvé a subir el archivo." };
  }

  let archivoPath = anterior?.archivo_path ?? null;
  if (hayArchivoNuevo) {
    if (archivo.size > MAX_BYTES) return { ok: false, error: "El archivo pesa más de 50 MB. Para videos largos usá un link." };
    if (!MIME_PERMITIDOS.has(archivo.type)) return { ok: false, error: "Ese tipo de archivo no está permitido." };
    const carpeta = valores.alcance === "global" ? "global" : (valores.sede_id as string);
    archivoPath = rutaArchivo(carpeta, archivo.name, crypto.randomUUID());
    const { error } = await supabase.storage.from("recursos").upload(archivoPath, archivo, { contentType: archivo.type });
    if (error) return { ok: false, error: SIN_PERMISO };
  }

  const fila = { ...valores, archivo_path: archivoPath };
  const resultado = id.data
    ? await supabase.from("recursos").update(fila).eq("id", id.data).select("id")
    : await supabase.from("recursos").insert(fila).select("id");
  if (resultado.error || !resultado.data?.length) {
    if (hayArchivoNuevo && archivoPath) await supabase.storage.from("recursos").remove([archivoPath]);
    return { ok: false, error: resultado.error ? mensajeErrorGuardado(resultado.error) : SIN_PERMISO };
  }
  if (hayArchivoNuevo && anterior?.archivo_path) await supabase.storage.from("recursos").remove([anterior.archivo_path]);
  revalidatePath("/contenido");
  revalidatePath("/recursos");
  if (!id.data) redirect(`/contenido/recursos/${resultado.data[0]!.id}?creado=1`);
  return { ok: true, mensaje: "Recurso guardado." };
}

export async function guardarCampana(_prev: ResultadoGuardado, formData: FormData): Promise<ResultadoGuardado> {
  await requerirRol([...ROLES_EDITORES]);
  const id = idOpcional.safeParse(formData.get("id"));
  const d = esquemaCampana.safeParse(datos(formData));
  if (!id.success || !d.success) return { ok: false, error: d.error?.issues[0]?.message ?? "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const r = id.data
    ? await supabase.from("campanas").update(d.data).eq("id", id.data).select("id")
    : await supabase.from("campanas").insert(d.data).select("id");
  if (r.error) return { ok: false, error: mensajeErrorGuardado(r.error) };
  if (!r.data?.length) return { ok: false, error: SIN_PERMISO };
  revalidatePath("/contenido");
  return { ok: true, mensaje: "Campaña guardada." };
}

const esquemaTabla = z.enum(["articulos", "recursos", "campanas"]);

export async function promover(tabla: string, id: string): Promise<ResultadoGuardado> {
  await requerirRol(["admin"]);
  const t = esquemaTabla.safeParse(tabla);
  const i = z.uuid().safeParse(id);
  if (!t.success || !i.success) return { ok: false, error: "Revisá los datos." };
  const supabase = await crearClienteServidor();
  const { error } = await supabase.rpc("promover_contenido", { p_tabla: t.data, p_id: i.data });
  if (error) return { ok: false, error: error.message.includes("no_autorizado") ? SIN_PERMISO : "No pudimos promoverlo. Probá de nuevo." };
  revalidatePath("/contenido");
  revalidatePath("/repositorio", "layout");
  revalidatePath("/recursos");
  return { ok: true, mensaje: "Listo: ahora lo ven todos los CAU." };
}
