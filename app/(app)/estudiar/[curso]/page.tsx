import Link from "next/link";
import { notFound } from "next/navigation";
import { Markdown } from "@/components/markdown";
import { colorNivel, etiquetaRequisito, porcentaje, type RequisitoItem } from "@/lib/dominio/leccion";
import { IconoItem } from "@/lib/repositorio/iconos";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function PaginaCurso({ params }: PageProps<"/estudiar/[curso]">) {
  await requerirPerfil();
  const { curso: cursoId } = await params;
  if (!/^[0-9a-f-]{36}$/i.test(cursoId)) notFound();
  const supabase = await crearClienteServidor();
  const [{ data: curso }, { data: estado }, { data: ruta }] = await Promise.all([
    supabase
      .from("cursos")
      .select("id, titulo, descripcion_md, tipo, nivel_orden, estado")
      .eq("id", cursoId)
      .maybeSingle(),
    supabase.rpc("estado_curso", { p_curso: cursoId }),
    supabase.rpc("mi_ruta"),
  ]);
  if (!curso) notFound();
  const enRuta = (ruta ?? []).find((r) => r.curso_id === cursoId);
  const desbloqueado = enRuta?.desbloqueado ?? curso.tipo === "capacitacion";
  const filas = estado ?? [];
  const conRequisito = filas.filter((f) => f.requisito !== "ninguno");
  const pct = porcentaje(conRequisito.filter((f) => f.cumplido).length, conRequisito.length);
  const c = colorNivel(curso.nivel_orden);

  const modulos = new Map<string, { titulo: string; cumplido: boolean; items: typeof filas }>();
  for (const f of filas) {
    if (!modulos.has(f.modulo_id))
      modulos.set(f.modulo_id, { titulo: f.modulo_titulo, cumplido: f.modulo_cumplido, items: [] });
    modulos.get(f.modulo_id)!.items.push(f);
  }

  return (
    <div className="flex flex-col gap-5">
      {curso.estado !== "publicado" && (
        <p role="status" className="rounded-2xl bg-warning-soft px-4 py-2.5 text-sm font-bold text-warning">
          Vista previa · borrador
        </p>
      )}
      <div className="flex flex-col gap-3 rounded-3xl p-5 text-white" style={{ background: c.fondo }}>
        <Link href="/estudiar" className="text-sm font-semibold text-white/85">
          ← Mi ruta
        </Link>
        <span className="self-start rounded-full bg-white/20 px-3 py-1 text-xs font-bold">
          {curso.tipo === "nivel" ? `NIVEL ${curso.nivel_orden}` : "CAPACITACIÓN"}
        </span>
        <h1 className="text-2xl font-extrabold leading-tight">{curso.titulo}</h1>
        <div className="h-2 rounded bg-white/25">
          <div className="h-2 rounded bg-[#a5f3c4]" style={{ width: `${pct}%` }} />
        </div>
        <p className="text-sm text-white/85">{pct}% completado</p>
      </div>

      {!desbloqueado && (
        <p role="status" className="rounded-2xl bg-warning-soft p-4 text-sm font-semibold text-warning">
          Este nivel todavía está bloqueado: terminá el nivel anterior para empezarlo. Podés mirar el temario.
        </p>
      )}
      {curso.descripcion_md && (
        <div className="rounded-2xl bg-card p-4 shadow-[var(--shadow-suave)]">
          <Markdown texto={curso.descripcion_md} />
        </div>
      )}

      <ol className="flex flex-col gap-4" aria-label="Módulos">
        {[...modulos.entries()].map(([id, m], idx) => (
          <li key={id} className="rounded-3xl bg-card p-4 shadow-[var(--shadow-suave)]">
            <div className="mb-2 flex items-center justify-between gap-2">
              <h2 className="font-extrabold">
                <span className="mr-2 text-muted">{idx + 1}.</span>
                {m.titulo}
              </h2>
              {m.cumplido && (
                <span className="rounded-full bg-success-soft px-2.5 py-0.5 text-xs font-bold text-success">
                  Completo
                </span>
              )}
            </div>
            <ul className="flex flex-col">
              {m.items.map((it) => {
                const contenido = (
                  <>
                    <span
                      aria-hidden="true"
                      className={`flex size-10 shrink-0 items-center justify-center rounded-xl ${it.cumplido ? "bg-success-soft text-success" : it.disponible ? "bg-primary-soft text-primary-strong" : "bg-[#f1f1f6] text-muted"}`}
                    >
                      {it.cumplido ? "✓" : <IconoItem tipo={it.tipo} />}
                    </span>
                    <span className="min-w-0 flex-1">
                      <span
                        className={`block font-semibold ${it.disponible || it.cumplido ? "" : "text-muted"}`}
                      >
                        {it.titulo}
                      </span>
                      <span className="text-xs text-muted">
                        {etiquetaRequisito(it.requisito as RequisitoItem, it.con_probalo)}
                        {!it.disponible && !it.cumplido && " · completá lo anterior"}
                      </span>
                    </span>
                  </>
                );
                return (
                  <li key={it.item_id} className="border-t border-border first:border-t-0">
                    {it.disponible ? (
                      <Link
                        href={`/estudiar/${cursoId}/${it.item_id}`}
                        className="flex items-center gap-3 py-3"
                      >
                        {contenido}
                      </Link>
                    ) : (
                      <div className="flex items-center gap-3 py-3" aria-disabled="true">
                        {contenido}
                      </div>
                    )}
                  </li>
                );
              })}
            </ul>
          </li>
        ))}
      </ol>
    </div>
  );
}
