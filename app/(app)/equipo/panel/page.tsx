import Link from "next/link";
import { Card } from "@/components/ui/card";
import { motivosAtraso } from "@/lib/dominio/panel";
import { ROLES_GESTION } from "@/lib/dominio/roles";
import { cargarPanel } from "@/lib/panel/datos";
import { requerirRol } from "@/lib/supabase/permisos";
import { cn } from "@/lib/utils/cn";

function Seccion({ titulo, csv, children }: { titulo: string; csv: string; children: React.ReactNode }) {
  return (
    <section aria-label={titulo} className="flex flex-col gap-2.5">
      <div className="flex items-baseline justify-between">
        <h2 className="text-lg font-extrabold">{titulo}</h2>
        <a href={`/equipo/panel/csv/${csv}`} className="text-sm font-semibold text-primary-strong">
          CSV
        </a>
      </div>
      {children}
    </section>
  );
}

function Dato({ etiqueta, valor, alerta }: { etiqueta: string; valor: string; alerta?: boolean }) {
  return (
    <Card className="flex flex-col gap-1">
      <span className="text-xs font-semibold text-muted">{etiqueta}</span>
      <span className={cn("text-2xl font-extrabold", alerta && "text-warning")}>{valor}</span>
    </Card>
  );
}

const vacio = (texto: string) => <p className="p-5 text-sm text-muted">{texto}</p>;

export default async function PaginaPanel({ searchParams }: PageProps<"/equipo/panel">) {
  await requerirRol([...ROLES_GESTION]);
  const { atrasados } = await searchParams;
  const soloAtrasados = atrasados === "1";
  const d = await cargarPanel();
  const ahora = new Date();
  const conMotivos = d.asesores.map((a) => ({ ...a, motivos: motivosAtraso(a, ahora) }));
  const atrasadosN = conMotivos.filter((a) => a.motivos.length > 0).length;
  const lista = soloAtrasados ? conMotivos.filter((a) => a.motivos.length > 0) : conMotivos;
  const porCorregir = d.cola.reduce((s, c) => s + c.pendientes, 0);

  return (
    <div className="flex flex-col gap-6">
      <h1 className="text-2xl font-extrabold">Panel</h1>
      <div className="grid grid-cols-2 gap-3 md:grid-cols-4">
        <Dato etiqueta="Asesores" valor={String(d.asesores.length)} />
        <Dato etiqueta="Atrasados" valor={String(atrasadosN)} alerta={atrasadosN > 0} />
        <Dato etiqueta="Acierto general" valor={d.tasaGeneral === null ? "—" : `${d.tasaGeneral}%`} />
        <Dato etiqueta="Por corregir" valor={String(porCorregir)} alerta={porCorregir > 0} />
      </div>

      <Seccion titulo="Asesores" csv="asesores">
        <div className="flex gap-2">
          <Link
            href="/equipo/panel"
            aria-current={!soloAtrasados ? "true" : undefined}
            className={cn(
              "rounded-full px-3 py-1.5 text-sm font-semibold",
              !soloAtrasados ? "bg-primary text-white" : "bg-primary-soft text-primary-strong",
            )}
          >
            Todos
          </Link>
          <Link
            href="/equipo/panel?atrasados=1"
            aria-current={soloAtrasados ? "true" : undefined}
            className={cn(
              "rounded-full px-3 py-1.5 text-sm font-semibold",
              soloAtrasados ? "bg-primary text-white" : "bg-primary-soft text-primary-strong",
            )}
          >
            Solo atrasados
          </Link>
        </div>
        <Card className="p-0!">
          {lista.length === 0 ? (
            vacio(soloAtrasados ? "Nadie atrasado." : "Sin asesores.")
          ) : (
            <ul aria-label="Asesores">
              {lista.map((a) => {
                const pct = a.cursos_total ? Math.round((a.cursos_cumplidos / a.cursos_total) * 100) : 0;
                return (
                  <li
                    key={a.usuario_id}
                    className="flex flex-wrap items-center gap-x-3 gap-y-1.5 border-t border-border px-5 py-3 first:border-t-0"
                  >
                    <span className="min-w-0 flex-1">
                      <span className="block font-bold">
                        {a.nombre} {a.apellido}
                      </span>
                      <span className="block text-xs text-muted">
                        {[a.sede, a.equipo, a.nivel_actual ? `Nivel ${a.nivel_actual}` : null]
                          .filter(Boolean)
                          .join(" · ")}
                      </span>
                    </span>
                    <span className="text-sm font-bold" aria-label={`${pct}% de la ruta`}>
                      {pct}%
                    </span>
                    {a.motivos.length > 0 && (
                      <span className="flex w-full flex-wrap gap-1.5">
                        {a.motivos.map((m) => (
                          <span
                            key={m}
                            className="rounded-full bg-warning-soft px-2.5 py-0.5 text-xs font-bold text-warning"
                          >
                            {m}
                          </span>
                        ))}
                      </span>
                    )}
                  </li>
                );
              })}
            </ul>
          )}
        </Card>
      </Seccion>

      <div className="grid gap-6 lg:grid-cols-2">
        <Seccion titulo="Preguntas a revisar" csv="preguntas">
          <Card className="p-0!">
            {d.preguntas.length === 0 ? (
              vacio("Todavía no hay respuestas suficientes.")
            ) : (
              <ul aria-label="Preguntas a revisar">
                {d.preguntas.slice(0, 10).map((p) => (
                  <li
                    key={p.pregunta_id}
                    className="flex items-center gap-3 border-t border-border px-5 py-3 first:border-t-0"
                  >
                    <Link href={`/contenido/preguntas/${p.pregunta_id}`} className="min-w-0 flex-1">
                      <span className="line-clamp-2 text-sm font-semibold">{p.enunciado_md}</span>
                      <span className="block text-xs text-muted">
                        {p.categoria ?? "Sin categoría"} · {p.uso === "practica" ? "Práctica" : "Examen"} ·{" "}
                        {p.respuestas} resp.
                      </span>
                    </Link>
                    <span className="shrink-0 text-lg font-extrabold">{p.tasa}%</span>
                  </li>
                ))}
              </ul>
            )}
          </Card>
        </Seccion>

        <div className="flex flex-col gap-6">
          <Seccion titulo="Por categoría" csv="categorias">
            <Card className="p-0!">
              {d.categorias.length === 0 ? (
                vacio("Sin respuestas todavía.")
              ) : (
                <ul aria-label="Por categoría">
                  {d.categorias.map((c) => (
                    <li
                      key={c.categoria}
                      className="flex items-center gap-3 border-t border-border px-5 py-3 first:border-t-0"
                    >
                      <span className="min-w-0 flex-1 font-semibold">{c.categoria}</span>
                      <span className="text-xs text-muted">{c.respuestas} resp.</span>
                      <span className="w-12 text-right font-extrabold">{c.tasa}%</span>
                    </li>
                  ))}
                </ul>
              )}
            </Card>
          </Seccion>

          <Seccion titulo="Cola de corrección" csv="correccion">
            <Card className="p-0!">
              {d.cola.length === 0 ? (
                vacio("Nada por corregir.")
              ) : (
                <ul aria-label="Cola de corrección">
                  {d.cola.map((c) => (
                    <li
                      key={c.sede ?? "sin-sede"}
                      className="flex items-center gap-3 border-t border-border px-5 py-3 first:border-t-0"
                    >
                      <span className="min-w-0 flex-1 font-semibold">{c.sede ?? "Sin sede"}</span>
                      <span className="text-sm">{c.pendientes} pend.</span>
                      {c.vencidos > 0 && (
                        <span className="rounded-full bg-warning-soft px-2.5 py-0.5 text-xs font-bold text-warning">
                          {c.vencidos} vencidos
                        </span>
                      )}
                    </li>
                  ))}
                </ul>
              )}
            </Card>
          </Seccion>
        </div>
      </div>
    </div>
  );
}
