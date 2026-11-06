import { requerirPerfil } from "@/lib/supabase/permisos";

/** Modo examen: sin barra lateral, sin píldora y sin encabezado. Para irse está el botón "Salir" del examen. */
export default async function LayoutExamen({ children }: LayoutProps<"/">) {
  await requerirPerfil();
  return <main className="flex min-h-dvh w-full flex-1 flex-col px-4 py-5 md:px-10 md:py-8">{children}</main>;
}
