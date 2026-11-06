import Link from "next/link";
import { BadgesContenido } from "@/components/repositorio/badges";
import { Card } from "@/components/ui/card";
import { cargarOpcionesEdicion } from "@/lib/contenido/opciones";
import { filtroEditable } from "@/lib/dominio/edicion";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioCurso } from "./formularios";

export default async function PaginaCursosEditor() {
  const perfil = await requerirRol([...ROLES_EDITORES]);
  const supabase = await crearClienteServidor();
  const opciones = await cargarOpcionesEdicion(perfil);
  const { data } = await supabase
    .from("cursos")
    .select("id, titulo, tipo, nivel_orden, alcance, sede_id, estado")
    .match(filtroEditable(perfil.rol, perfil.sede_id) ?? {})
    .order("tipo")
    .order("nivel_orden", { nullsFirst: false })
    .order("titulo");
  return (
    <div className="flex flex-col gap-5">
      <div>
        <Link href="/contenido" className="text-sm font-semibold text-primary-strong">← Contenido</Link>
        <h1 className="mt-1 text-2xl font-extrabold">Cursos</h1>
      </div>
      <ul className="flex flex-col gap-2" aria-label="Cursos editables">
        {(data ?? []).map((c) => (
          <li key={c.id}>
            <Card className="flex flex-wrap items-center justify-between gap-2 p-4">
              <Link href={`/contenido/cursos/${c.id}`} className="font-bold hover:text-primary">
                {c.tipo === "nivel" ? `Nivel ${c.nivel_orden} · ` : ""}{c.titulo}
              </Link>
              <BadgesContenido c={{ alcance: c.alcance, estado: c.estado, vigente_hasta: null }} />
            </Card>
          </li>
        ))}
      </ul>
      <Card>
        <h2 className="mb-3 font-extrabold">Nuevo curso</h2>
        <FormularioCurso alcances={opciones.alcances} sedes={opciones.sedes} />
      </Card>
    </div>
  );
}
