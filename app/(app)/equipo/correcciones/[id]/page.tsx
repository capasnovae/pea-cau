import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { ROLES_GESTION } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioCorreccion } from "./formulario";

export default async function PaginaCorregir({ params }: PageProps<"/equipo/correcciones/[id]">) {
  await requerirRol([...ROLES_GESTION]);
  const { id } = await params;
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const supabase = await crearClienteServidor();
  const { data, error } = await supabase.rpc("respuestas_a_corregir", { p_intento: id });
  if (error) redirect("/equipo/correcciones");
  const { data: intento } = await supabase
    .from("intentos")
    .select("examenes(titulo), perfiles!intentos_usuario_id_fkey(nombre, apellido)")
    .eq("id", id)
    .maybeSingle();
  return (
    <div className="mx-auto flex w-full max-w-3xl flex-col gap-4">
      <Link href="/equipo/correcciones" className="text-sm font-semibold text-primary-strong">
        ‹ Correcciones
      </Link>
      <div>
        <p className="text-sm font-semibold text-muted">
          {intento?.perfiles ? `${intento.perfiles.nombre} ${intento.perfiles.apellido}` : ""}
        </p>
        <h1 className="text-2xl font-extrabold">{intento?.examenes?.titulo ?? "Corrección"}</h1>
      </div>
      <FormularioCorreccion
        intentoId={id}
        respuestas={(data ?? []).map((r) => ({
          ...r,
          puntaje: r.puntaje === null ? null : Number(r.puntaje),
        }))}
      />
    </div>
  );
}
