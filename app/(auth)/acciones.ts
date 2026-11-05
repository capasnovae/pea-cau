"use server";

import { redirect } from "next/navigation";
import { headers } from "next/headers";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export type EstadoForm = { error?: string; mensaje?: string };

const MIN_CLAVE = 10;

export async function ingresar(_prev: EstadoForm, formData: FormData): Promise<EstadoForm> {
  const email = String(formData.get("email") ?? "").trim();
  const password = String(formData.get("password") ?? "");
  const supabase = await crearClienteServidor();
  const { error } = await supabase.auth.signInWithPassword({ email, password });
  if (error) return { error: "El email o la contraseña no son correctos." };
  redirect("/inicio");
}

export async function pedirRecuperacion(_prev: EstadoForm, formData: FormData): Promise<EstadoForm> {
  const email = String(formData.get("email") ?? "").trim();
  const origen = (await headers()).get("origin") ?? "";
  const supabase = await crearClienteServidor();
  // No revelamos si el email existe.
  await supabase.auth.resetPasswordForEmail(email, { redirectTo: `${origen}/auth/confirm` });
  return { mensaje: "Te mandamos un link para que definas una contraseña nueva." };
}

export async function definirClave(_prev: EstadoForm, formData: FormData): Promise<EstadoForm> {
  const clave = String(formData.get("password") ?? "");
  const confirmacion = String(formData.get("confirmacion") ?? "");
  if (clave.length < MIN_CLAVE) return { error: `La contraseña tiene que tener al menos ${MIN_CLAVE} caracteres.` };
  if (clave !== confirmacion) return { error: "Las contraseñas no coinciden." };
  const supabase = await crearClienteServidor();
  const { error } = await supabase.auth.updateUser({ password: clave });
  if (error) return { error: "No pudimos guardar la contraseña. Pedí un link nuevo." };
  redirect("/inicio");
}

export async function salir() {
  const supabase = await crearClienteServidor();
  await supabase.auth.signOut();
  redirect("/ingresar");
}
