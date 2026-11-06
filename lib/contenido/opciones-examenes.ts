import "server-only";
import { opcionesDeAlcance } from "@/lib/dominio/edicion";
import type { Perfil } from "@/lib/supabase/servidor";
import { crearClienteServidor } from "@/lib/supabase/servidor";

/** Opciones para los formularios de preguntas, casos y exámenes. */
export async function cargarOpcionesExamenes(perfil: Perfil) {
  const supabase = await crearClienteServidor();
  const [
    { data: sedes },
    { data: categorias },
    { data: modulos },
    { data: articulos },
    { data: casos },
    { data: cursos },
  ] = await Promise.all([
    supabase.from("sedes").select("id, nombre").order("nombre"),
    supabase.from("categorias").select("id, nombre").order("orden"),
    supabase.from("modulos").select("id, titulo, orden, cursos(titulo, nivel_orden)").order("orden"),
    supabase.from("articulos").select("id, titulo").eq("estado", "publicado").order("titulo").limit(500),
    supabase.from("casos").select("id, titulo").order("titulo"),
    supabase
      .from("cursos")
      .select("id, titulo, tipo, nivel_orden")
      .neq("estado", "archivado")
      .order("nivel_orden"),
  ]);
  return {
    ...opcionesDeAlcance(perfil.rol, perfil.sede_id, sedes ?? []),
    categorias: (categorias ?? []).map((c) => ({ id: c.id, nombre: c.nombre })),
    modulos: (modulos ?? [])
      .map((m) => ({ id: m.id, nombre: `${m.cursos?.titulo ?? ""} · ${m.titulo}` }))
      .sort((a, b) => a.nombre.localeCompare(b.nombre)),
    articulos: (articulos ?? []).map((a) => ({ id: a.id, nombre: a.titulo })),
    casos: (casos ?? []).map((c) => ({ id: c.id, nombre: c.titulo })),
    niveles: (cursos ?? [])
      .filter((c) => c.tipo === "nivel")
      .map((c) => ({ id: c.id, nombre: `Nivel ${c.nivel_orden} · ${c.titulo}` })),
  };
}
