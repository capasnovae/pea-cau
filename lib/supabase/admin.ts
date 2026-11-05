import "server-only";
import { createClient } from "@supabase/supabase-js";
import type { Database } from "./tipos";
import { urlSupabase } from "./env";

/** Cliente con service role: SOLO en el servidor y solo después de verificar que quien llama es admin. */
export function crearClienteAdmin() {
  const clave = process.env.SUPABASE_SECRET_KEY;
  if (!clave) throw new Error("Falta SUPABASE_SECRET_KEY");
  return createClient<Database>(urlSupabase(), clave, { auth: { persistSession: false, autoRefreshToken: false } });
}
