import { NextResponse, type NextRequest } from "next/server";
import { crearClienteServidor } from "@/lib/supabase/servidor";

/** Cierra la sesión y vuelve a /ingresar, conservando el motivo (p. ej. usuario inactivo). */
export async function GET(request: NextRequest) {
  const supabase = await crearClienteServidor();
  await supabase.auth.signOut();
  const motivo = request.nextUrl.searchParams.get("motivo");
  const destino = new URL("/ingresar", request.url);
  if (motivo === "inactivo") destino.searchParams.set("motivo", "inactivo");
  return NextResponse.redirect(destino);
}
