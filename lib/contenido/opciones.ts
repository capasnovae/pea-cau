import "server-only";
import { opcionesDeAlcance } from "@/lib/dominio/edicion";
import type { Perfil } from "@/lib/supabase/servidor";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export async function cargarOpcionesEdicion(perfil: Perfil) {
  const supabase = await crearClienteServidor();
  const [{ data: sedes }, { data: categorias }, { data: campanas }] = await Promise.all([
    supabase.from("sedes").select("id, nombre").order("nombre"),
    supabase.from("categorias").select("id, nombre").order("orden"),
    supabase.from("campanas").select("id, nombre, alcance, sede_id").order("nombre"),
  ]);
  return {
    ...opcionesDeAlcance(perfil.rol, perfil.sede_id, sedes ?? []),
    categorias: categorias ?? [],
    campanas: campanas ?? [],
  };
}
