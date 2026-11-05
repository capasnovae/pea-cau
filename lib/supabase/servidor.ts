import "server-only";
import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";
import { cache } from "react";
import type { Database, Tables } from "./tipos";
import { clavePublicable, urlSupabase } from "./env";

export type Perfil = Tables<"perfiles">;

export async function crearClienteServidor() {
  const almacen = await cookies();
  return createServerClient<Database>(urlSupabase(), clavePublicable(), {
    cookies: {
      getAll: () => almacen.getAll(),
      setAll: (aSetear) => {
        try {
          aSetear.forEach(({ name, value, options }) => almacen.set(name, value, options));
        } catch {
          // Llamado desde un Server Component: el proxy se encarga de refrescar la cookie.
        }
      },
    },
  });
}

/** Sesión del request actual con su perfil, o null si no hay usuario autenticado. */
export const obtenerSesion = cache(async (): Promise<{ usuarioId: string; perfil: Perfil | null } | null> => {
  const supabase = await crearClienteServidor();
  const { data } = await supabase.auth.getClaims();
  const usuarioId = data?.claims?.sub;
  if (!usuarioId) return null;
  const { data: perfil } = await supabase.from("perfiles").select("*").eq("id", usuarioId).maybeSingle();
  return { usuarioId, perfil };
});
