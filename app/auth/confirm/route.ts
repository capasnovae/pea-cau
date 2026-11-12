import type { EmailOtpType } from "@supabase/supabase-js";
import { NextResponse, type NextRequest } from "next/server";
import { crearClienteServidor } from "@/lib/supabase/servidor";

const TIPOS_A_DEFINIR_CLAVE: EmailOtpType[] = ["invite", "recovery"];
const TIPOS_VALIDOS: EmailOtpType[] = ["invite", "recovery", "signup", "magiclink", "email_change", "email"];

/**
 * Redirección relativa: el navegador se queda en la misma dirección por la que entró.
 * Con una absoluta armada desde request.url, detrás de un proxy o en desarrollo se podía saltar
 * a otro host (por ejemplo de 127.0.0.1 a localhost) y la cookie de sesión quedaba en el anterior.
 */
function irA(destino: string) {
  return new NextResponse(null, { status: 303, headers: { Location: destino } });
}

export async function GET(request: NextRequest) {
  const { searchParams } = request.nextUrl;
  const token_hash = searchParams.get("token_hash");
  const type = searchParams.get("type") as EmailOtpType | null;
  if (token_hash && type && TIPOS_VALIDOS.includes(type)) {
    const supabase = await crearClienteServidor();
    const { error } = await supabase.auth.verifyOtp({ type, token_hash });
    if (!error) return irA(TIPOS_A_DEFINIR_CLAVE.includes(type) ? "/definir-clave" : "/inicio");
  }
  return irA("/ingresar?motivo=link-invalido");
}
