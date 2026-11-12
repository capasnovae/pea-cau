import Link from "next/link";
import { TarjetaCurso, etiquetaTipo, type FilaMiRuta } from "@/components/tablero/tarjeta-curso";
import { Card } from "@/components/ui/card";
import { colorNivel, porcentaje } from "@/lib/dominio/leccion";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { BotonFavorito } from "./boton-favorito";

function colorCurso(c: FilaMiRuta): string {
  if (c.cumplido) return "var(--success)";
  return colorNivel(c.tipo === "nivel" ? c.nivel_orden : null).fondo;
}

function estado(c: FilaMiRuta): string {
  if (c.cumplido) return "Cumplido";
  if (!c.desbloqueado) return "Bloqueado";
  return `En curso · ${porcentaje(c.items_cumplidos, c.items_total)}%`;
}

function TablaCursos({
  cursos,
  favs,
  vigencias,
}: {
  cursos: FilaMiRuta[];
  favs: Set<string>;
  vigencias: Map<string, number | null>;
}) {
  return (
    <table className="w-full border-collapse text-sm">
      <thead>
        <tr className="text-left text-xs text-muted">
          <th className="w-14 px-3 py-2.5 font-semibold md:px-5">
            <span className="sr-only">Favorito</span>
          </th>
          <th className="px-3 py-2.5 font-semibold md:px-5">Curso</th>
          <th className="hidden px-5 py-2.5 font-semibold md:table-cell">Tipo</th>
          <th className="px-3 py-2.5 font-semibold md:px-5">Estado</th>
          <th className="hidden px-5 py-2.5 font-semibold md:table-cell">Vigencia</th>
        </tr>
      </thead>
      <tbody>
        {cursos.map((c) => {
          const vigencia = vigencias.get(c.curso_id);
          return (
            <tr key={c.curso_id} className="border-t border-border">
              <td className="px-1.5 py-1 md:px-3">
                <BotonFavorito cursoId={c.curso_id} inicial={favs.has(c.curso_id)} />
              </td>
              <td className="px-3 py-3 md:px-5">
                <span className="flex items-start gap-2">
                  <span
                    aria-hidden="true"
                    className="mt-1.5 size-2.5 shrink-0 rounded-[3px]"
                    style={{ background: colorCurso(c) }}
                  />
                  <span>
                    {c.desbloqueado ? (
                      <Link href={`/estudiar/${c.curso_id}`} className="font-bold hover:text-primary-strong">
                        {c.titulo}
                      </Link>
                    ) : (
                      <span className="font-bold text-muted">{c.titulo}</span>
                    )}
                    <span className="block text-xs text-muted">
                      <span className="md:hidden">{etiquetaTipo(c)}</span>
                      {c.obligatorio && (
                        <span className="md:before:content-none before:content-['_·_']">Obligatorio</span>
                      )}
                    </span>
                  </span>
                </span>
              </td>
              <td className="hidden px-5 py-3 md:table-cell">
                {c.tipo === "nivel" ? "Nivel" : "Capacitación"}
              </td>
              <td
                className={`px-3 py-3 md:px-5 ${c.cumplido ? "font-bold text-success" : c.desbloqueado ? "" : "text-muted"}`}
              >
                {estado(c)}
              </td>
              <td className="hidden px-5 py-3 md:table-cell">{vigencia ? `${vigencia} meses` : "—"}</td>
            </tr>
          );
        })}
      </tbody>
    </table>
  );
}

export default async function PaginaEstudiar() {
  await requerirPerfil();
  const supabase = await crearClienteServidor();
  const [{ data }, { data: favoritos }] = await Promise.all([
    supabase.rpc("mi_ruta"),
    supabase.from("cursos_favoritos").select("curso_id"),
  ]);
  const cursos = data ?? [];
  const { data: datos } = cursos.length
    ? await supabase
        .from("cursos")
        .select("id, vigencia_meses")
        .in(
          "id",
          cursos.map((c) => c.curso_id),
        )
    : { data: [] };
  const vigencias = new Map((datos ?? []).map((d) => [d.id, d.vigencia_meses]));
  const favs = new Set((favoritos ?? []).map((f) => f.curso_id));
  const activos = cursos.filter((c) => !c.cumplido);
  const terminados = cursos.filter((c) => c.cumplido);

  return (
    <div className="flex flex-col gap-6">
      <h1 className="text-h1 md:text-[32px]">Mis cursos</h1>

      {cursos.length === 0 && (
        <Card>
          <p className="text-sm text-muted">Sin cursos por ahora.</p>
        </Card>
      )}

      {activos.length > 0 && (
        <ul aria-label="En curso" className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
          {activos.map((c) => (
            <li key={c.curso_id}>
              <TarjetaCurso curso={c} favorito={favs.has(c.curso_id)} />
            </li>
          ))}
        </ul>
      )}

      {activos.length > 0 && (
        <section aria-label="Todos los cursos" className="overflow-hidden rounded-[20px] bg-card shadow-1">
          <h2 className="px-5 pb-1 pt-4 text-h2">Todos los cursos</h2>
          <TablaCursos cursos={activos} favs={favs} vigencias={vigencias} />
        </section>
      )}

      {terminados.length > 0 && (
        <section aria-label="Terminados" className="overflow-hidden rounded-[20px] bg-card shadow-1">
          <h2 className="px-5 pb-1 pt-4 text-base font-extrabold text-muted">Terminados</h2>
          <TablaCursos cursos={terminados} favs={favs} vigencias={vigencias} />
        </section>
      )}
    </div>
  );
}
