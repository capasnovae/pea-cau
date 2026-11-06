import { redirect } from "next/navigation";
import { obtenerSesion } from "@/lib/supabase/servidor";

export default async function Raiz() {
  const sesion = await obtenerSesion();
  redirect(sesion ? "/inicio" : "/bienvenida");
}
