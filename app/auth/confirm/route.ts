import type { EmailOtpType } from "@supabase/supabase-js";
import { NextResponse, type NextRequest } from "next/server";
import { crearClienteServidor } from "@/lib/supabase/servidor";

const TIPOS_A_DEFINIR_CLAVE: EmailOtpType[] = ["invite", "recovery"];

export async function GET(request: NextRequest) {
  const { searchParams } = request.nextUrl;
  const token_hash = searchParams.get("token_hash");
  const type = searchParams.get("type") as EmailOtpType | null;
  if (token_hash && type) {
    const supabase = await crearClienteServidor();
    const { error } = await supabase.auth.verifyOtp({ type, token_hash });
    if (!error) {
      const destino = TIPOS_A_DEFINIR_CLAVE.includes(type) ? "/definir-clave" : "/inicio";
      return NextResponse.redirect(new URL(destino, request.url));
    }
  }
  return NextResponse.redirect(new URL("/ingresar?motivo=link-invalido", request.url));
}
