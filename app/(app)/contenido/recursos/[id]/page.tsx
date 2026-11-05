import Link from "next/link";
import { notFound } from "next/navigation";
import { BotonPromover } from "@/components/contenido/boton-promover";
import { Card } from "@/components/ui/card";
import { cargarOpcionesEdicion } from "@/lib/contenido/opciones";
import { formatearFecha } from "@/lib/dominio/contenido";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioRecurso } from "./formulario-recurso";

export default async function PaginaEditarRecurso({ params, searchParams }: PageProps<"/contenido/recursos/[id]">) {
  const perfil = await requerirRol([...ROLES_EDITORES]);
  const { id } = await params;
  const { creado } = await searchParams;
  const nuevo = id === "nuevo";
  const supabase = await crearClienteServidor();
  const opciones = await cargarOpcionesEdicion(perfil);
  const { data: recurso } = nuevo
    ? { data: null }
    : await supabase
        .from("recursos")
        .select("id, titulo, descripcion, tipo, categoria_id, campana_id, etiquetas, url_externa, archivo_path, alcance, sede_id, estado, vigente_hasta, promovido_at")
        .eq("id", id)
        .maybeSingle();
  if (!nuevo && !recurso) notFound();

  return (
    <div className="flex flex-col gap-5">
      <div>
        <Link href="/contenido?tab=recursos" className="text-sm text-primary">← Contenido</Link>
        <h1 className="mt-1 text-2xl font-semibold">{nuevo ? "Nuevo recurso" : "Editar recurso"}</h1>
        {creado && <p role="status" className="text-sm text-primary">Recurso creado.</p>}
      </div>
      <Card>
        <FormularioRecurso
          recurso={recurso ?? undefined}
          categorias={opciones.categorias}
          campanas={opciones.campanas}
          alcances={opciones.alcances}
          sedes={opciones.sedes}
        />
      </Card>
      {recurso && perfil.rol === "admin" && recurso.alcance === "sede" && (
        <Card>
          <BotonPromover tabla="recursos" id={recurso.id} />
        </Card>
      )}
      {recurso?.promovido_at && (
        <p role="status" className="text-sm text-primary">
          Ya lo ven todos los CAU (promovido el {formatearFecha(recurso.promovido_at)}).
        </p>
      )}
    </div>
  );
}
