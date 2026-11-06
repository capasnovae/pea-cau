import Link from "next/link";
import { NavExamenes } from "@/components/contenido/nav-examenes";
import { BadgesContenido } from "@/components/repositorio/badges";
import { Card } from "@/components/ui/card";
import { filtroEditable } from "@/lib/dominio/edicion";
import { ETIQUETA_TIPO_EXAMEN } from "@/lib/dominio/examenes";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function PaginaGestionExamenes() {
  const perfil = await requerirRol([...ROLES_EDITORES]);
  const supabase = await crearClienteServidor();
  const { data } = await supabase
    .from("examenes")
    .select("id, titulo, tipo, cantidad_preguntas, alcance, estado")
    .match(filtroEditable(perfil.rol, perfil.sede_id) ?? {})
    .order("updated_at", { ascending: false });
  const pozos = await Promise.all((data ?? []).map((e) => supabase.rpc("contar_pozo", { p_examen: e.id })));

  return (
    <div className="flex flex-col gap-5">
      <NavExamenes actual="examenes" />
      <Link
        href="/contenido/examenes/nuevo"
        className="flex h-10 items-center self-end rounded-xl bg-primary px-4 text-sm font-bold text-white"
      >
        Nuevo examen
      </Link>
      {(data ?? []).length === 0 ? (
        <Card>
          <p className="text-sm text-muted">Sin exámenes.</p>
        </Card>
      ) : (
        <Card className="p-0!">
          <ul aria-label="Exámenes">
            {(data ?? []).map((e, i) => {
              const pozo = pozos[i]?.data ?? 0;
              return (
                <li key={e.id} className="border-t border-border first:border-t-0">
                  <Link
                    href={`/contenido/examenes/${e.id}`}
                    className="flex flex-wrap items-center gap-2 px-5 py-3.5"
                  >
                    <span className="flex-1 font-semibold">{e.titulo}</span>
                    <span className="text-xs text-muted">
                      {ETIQUETA_TIPO_EXAMEN[e.tipo]} · {e.cantidad_preguntas} por intento ·{" "}
                      <span className={pozo < e.cantidad_preguntas ? "font-bold text-warning" : ""}>
                        {pozo} disponibles
                      </span>
                    </span>
                    <BadgesContenido c={{ alcance: e.alcance, estado: e.estado, vigente_hasta: null }} />
                  </Link>
                </li>
              );
            })}
          </ul>
        </Card>
      )}
    </div>
  );
}
