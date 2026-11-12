import Link from "next/link";
import { NavExamenes } from "@/components/contenido/nav-examenes";
import { BadgesContenido } from "@/components/repositorio/badges";
import { Card } from "@/components/ui/card";
import { filtroEditable } from "@/lib/dominio/edicion";
import { ETIQUETA_TIPO_PREGUNTA, TIPOS_PREGUNTA, type TipoPregunta } from "@/lib/dominio/examenes";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function PaginaPreguntas({ searchParams }: PageProps<"/contenido/preguntas">) {
  const perfil = await requerirRol([...ROLES_EDITORES]);
  const { tipo, uso, estado } = await searchParams;
  const supabase = await crearClienteServidor();
  let consulta = supabase
    .from("preguntas")
    .select("id, tipo, enunciado_md, uso, alcance, sede_id, estado, categorias(nombre), modulos(titulo)")
    .match(filtroEditable(perfil.rol, perfil.sede_id) ?? {})
    .order("updated_at", { ascending: false })
    .limit(300);
  if (typeof tipo === "string" && (TIPOS_PREGUNTA as readonly string[]).includes(tipo))
    consulta = consulta.eq("tipo", tipo as TipoPregunta);
  if (uso === "examen" || uso === "practica") consulta = consulta.eq("uso", uso);
  if (estado === "borrador" || estado === "publicado" || estado === "archivado")
    consulta = consulta.eq("estado", estado);
  const { data } = await consulta;

  return (
    <div className="flex flex-col gap-5">
      <NavExamenes actual="preguntas" />
      <form className="flex flex-wrap gap-2" aria-label="Filtros">
        <select
          name="tipo"
          defaultValue={typeof tipo === "string" ? tipo : ""}
          aria-label="Tipo"
          className="h-10 rounded-xl border border-border bg-card px-3"
        >
          <option value="">Todos los tipos</option>
          {TIPOS_PREGUNTA.map((t) => (
            <option key={t} value={t}>
              {ETIQUETA_TIPO_PREGUNTA[t]}
            </option>
          ))}
        </select>
        <select
          name="uso"
          defaultValue={typeof uso === "string" ? uso : ""}
          aria-label="Uso"
          className="h-10 rounded-xl border border-border bg-card px-3"
        >
          <option value="">Examen y práctica</option>
          <option value="examen">Examen</option>
          <option value="practica">Práctica</option>
        </select>
        <select
          name="estado"
          defaultValue={typeof estado === "string" ? estado : ""}
          aria-label="Estado"
          className="h-10 rounded-xl border border-border bg-card px-3"
        >
          <option value="">Todos los estados</option>
          <option value="borrador">Borrador</option>
          <option value="publicado">Publicada</option>
          <option value="archivado">Archivada</option>
        </select>
        <button type="submit" className="h-10 rounded-xl border border-border px-4 text-sm font-bold">
          Filtrar
        </button>
        <span className="flex-1" />
        <Link
          href="/contenido/preguntas/nueva"
          className="flex h-10 items-center rounded-xl bg-primary px-4 text-sm font-bold text-primary-foreground"
        >
          Nueva pregunta
        </Link>
      </form>
      {(data ?? []).length === 0 ? (
        <Card>
          <p className="text-sm text-muted">Sin preguntas.</p>
        </Card>
      ) : (
        <Card className="p-0!">
          <ul aria-label="Preguntas">
            {(data ?? []).map((p) => (
              <li key={p.id} className="border-t border-border first:border-t-0">
                <Link href={`/contenido/preguntas/${p.id}`} className="flex flex-col gap-1 px-5 py-3.5">
                  <span className="line-clamp-2 font-semibold">{p.enunciado_md}</span>
                  <span className="flex flex-wrap items-center gap-2 text-xs text-muted">
                    {ETIQUETA_TIPO_PREGUNTA[p.tipo]} · {p.uso === "practica" ? "Práctica" : "Examen"}
                    {p.modulos?.titulo
                      ? ` · ${p.modulos.titulo}`
                      : p.categorias?.nombre
                        ? ` · ${p.categorias.nombre}`
                        : ""}
                    <BadgesContenido c={{ alcance: p.alcance, estado: p.estado, vigente_hasta: null }} />
                  </span>
                </Link>
              </li>
            ))}
          </ul>
        </Card>
      )}
    </div>
  );
}
