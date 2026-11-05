import { createBrowserClient } from "@supabase/ssr";
import type { Database } from "./tipos";
import { clavePublicable, urlSupabase } from "./env";

export function crearClienteNavegador() {
  return createBrowserClient<Database>(urlSupabase(), clavePublicable());
}
