import Link from "next/link";
import { NavExamenes } from "@/components/contenido/nav-examenes";
import { BadgesContenido } from "@/components/repositorio/badges";
import { Card } from "@/components/ui/card";
import { cargarOpcionesExamenes } from "@/lib/contenido/opciones-examenes";
import { filtroEditable } from "@/lib/dominio/edicion";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioCaso } from "./formulario";

export default async function PaginaCasos() {
  const perfil = await requerirRol([...ROLES_EDITORES]);
  const supabase = await crearClienteServidor();
  const [{ data }, opciones] = await Promise.all([
    supabase
      .from("casos")
      .select("id, titulo, alcance, estado, preguntas(count)")
      .match(filtroEditable(perfil.rol, perfil.sede_id) ?? {})
      .order("updated_at", { ascending: false }),
    cargarOpcionesExamenes(perfil),
  ]);
  return (
    <div className="flex flex-col gap-5">
      <NavExamenes actual="casos" />
      {(data ?? []).length === 0 ? (
        <Card>
          <p className="text-sm text-muted">Sin casos.</p>
        </Card>
      ) : (
        <Card className="p-0!">
          <ul aria-label="Casos">
            {(data ?? []).map((c) => (
              <li key={c.id} className="border-t border-border first:border-t-0">
                <Link
                  href={`/contenido/casos/${c.id}`}
                  className="flex flex-wrap items-center gap-2 px-5 py-3.5"
                >
                  <span className="flex-1 font-semibold">{c.titulo}</span>
                  <span className="text-xs text-muted">{c.preguntas[0]?.count ?? 0} preguntas</span>
                  <BadgesContenido c={{ alcance: c.alcance, estado: c.estado, vigente_hasta: null }} />
                </Link>
              </li>
            ))}
          </ul>
        </Card>
      )}
      <Card>
        <h2 className="mb-3 font-extrabold">Nuevo caso</h2>
        <FormularioCaso
          alcances={opciones.alcances}
          sedes={opciones.sedes}
          categorias={opciones.categorias}
        />
      </Card>
    </div>
  );
}
