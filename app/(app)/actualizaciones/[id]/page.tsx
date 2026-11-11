import Link from "next/link";
import { notFound } from "next/navigation";
import { Markdown } from "@/components/markdown";
import { Card } from "@/components/ui/card";
import { estadoVisible } from "@/lib/dominio/actualizaciones";
import { formatearFecha } from "@/lib/dominio/contenido";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { EstadoChip } from "../estado";
import { BotonLeida } from "./leida";

export default async function PaginaActualizacion({ params }: PageProps<"/actualizaciones/[id]">) {
  const perfil = await requerirPerfil();
  const { id } = await params;
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const supabase = await crearClienteServidor();
  const { data: a } = await supabase
    .from("actualizacion_asignaciones")
    .select(
      "id, estado, vence_at, leida_at, aprobada_at, actualizaciones(titulo, descripcion_md, examen_id, articulos(titulo, slug, categorias(slug)), modulos(titulo, curso_id))",
    )
    .eq("id", id)
    .eq("usuario_id", perfil.id)
    .maybeSingle();
  if (!a || !a.actualizaciones) notFound();
  const act = a.actualizaciones;
  const estado = estadoVisible(a.estado, a.vence_at, new Date());
  const fuente = act.articulos
    ? {
        titulo: act.articulos.titulo,
        href: `/repositorio/${act.articulos.categorias?.slug}/${act.articulos.slug}`,
      }
    : act.modulos
      ? { titulo: act.modulos.titulo, href: `/estudiar/${act.modulos.curso_id}` }
      : null;
  return (
    <div className="flex flex-col gap-4">
      <Link href="/actualizaciones" className="text-sm font-semibold text-primary-strong">
        ← Actualizaciones
      </Link>
      <div className="flex flex-wrap items-center justify-between gap-3">
        <h1 className="text-h1">{act.titulo}</h1>
        <EstadoChip estado={estado} />
      </div>
      <p className="text-sm text-muted">Vence el {formatearFecha(a.vence_at)}</p>
      <Card className="flex flex-col gap-4">
        {act.descripcion_md && <Markdown texto={act.descripcion_md} />}
        {fuente && (
          <Link href={fuente.href} className="font-semibold text-primary-strong">
            Ver {fuente.titulo} →
          </Link>
        )}
      </Card>
      {a.estado !== "cumplida" && (
        <div className="flex flex-wrap gap-3">
          {!a.leida_at && <BotonLeida id={a.id} />}
          {act.examen_id && !a.aprobada_at && (
            <Link
              href={`/examenes/${act.examen_id}`}
              className="inline-flex min-h-12 items-center rounded-2xl border-2 border-primary px-5 font-bold text-primary-strong"
            >
              Rendir el mini examen
            </Link>
          )}
        </div>
      )}
    </div>
  );
}
