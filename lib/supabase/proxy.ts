import { createServerClient } from "@supabase/ssr";
import { NextResponse, type NextRequest } from "next/server";
import { decidirRedireccion } from "@/lib/dominio/acceso";
import type { Database } from "./tipos";
import { clavePublicable, urlSupabase } from "./env";

/**
 * Refresca la sesión en cada request y hace el chequeo optimista de acceso
 * (anónimo → /ingresar). El estado "inactivo" se resuelve en el layout de la app,
 * que lee el perfil; la autorización real vive en la RLS.
 */
export async function actualizarSesion(request: NextRequest) {
  let respuesta = NextResponse.next({ request });
  const supabase = createServerClient<Database>(urlSupabase(), clavePublicable(), {
    cookies: {
      getAll: () => request.cookies.getAll(),
      setAll: (aSetear, headers) => {
        aSetear.forEach(({ name, value }) => request.cookies.set(name, value));
        respuesta = NextResponse.next({ request });
        aSetear.forEach(({ name, value, options }) => respuesta.cookies.set(name, value, options));
        Object.entries(headers ?? {}).forEach(([k, v]) => respuesta.headers.set(k, v));
      },
    },
  });

  const { data } = await supabase.auth.getClaims();
  const estado = data?.claims?.sub ? "activo" : "anonimo";
  const destino = decidirRedireccion(request.nextUrl.pathname, estado);
  if (destino && destino !== request.nextUrl.pathname + request.nextUrl.search) {
    const url = new URL(destino, request.url);
    const redireccion = NextResponse.redirect(url);
    respuesta.cookies.getAll().forEach((c) => redireccion.cookies.set(c));
    return redireccion;
  }
  return respuesta;
}
