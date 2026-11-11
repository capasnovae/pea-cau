import Link from "next/link";
import { notFound } from "next/navigation";
import { Markdown } from "@/components/markdown";
import { BadgesContenido } from "@/components/repositorio/badges";
import { Card } from "@/components/ui/card";
import { estaVencido, formatearFecha } from "@/lib/dominio/contenido";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function PaginaArticulo({ params }: PageProps<"/repositorio/[categoria]/[slug]">) {
  const { categoria: slugCategoria, slug } = await params;
  await requerirPerfil();
  const supabase = await crearClienteServidor();
  const { data: categoria } = await supabase
    .from("categorias")
    .select("id, nombre")
    .eq("slug", slugCategoria)
    .maybeSingle();
  if (!categoria) notFound();
  const { data: articulo } = await supabase
    .from("articulos")
    .select(
      "id, titulo, resumen, cuerpo_md, version, updated_at, vigente_hasta, alcance, estado, fuente_url, padre_id",
    )
    .eq("categoria_id", categoria.id)
    .eq("slug", slug)
    .maybeSingle();
  if (!articulo) notFound();

  const [{ data: hijos }, { data: padre }] = await Promise.all([
    supabase
      .from("articulos")
      .select("titulo, slug")
      .eq("padre_id", articulo.id)
      .eq("estado", "publicado")
      .order("orden"),
    articulo.padre_id
      ? supabase.from("articulos").select("titulo, slug").eq("id", articulo.padre_id).maybeSingle()
      : Promise.resolve({ data: null }),
  ]);

  return (
    <article className="flex flex-col gap-4">
      <div>
        <Link
          href={padre ? `/repositorio/${slugCategoria}/${padre.slug}` : `/repositorio/${slugCategoria}`}
          className="text-sm text-primary"
        >
          ← {padre ? padre.titulo : categoria.nombre}
        </Link>
        <h1 className="mt-1 text-2xl font-semibold">{articulo.titulo}</h1>
        <div className="mt-1">
          <BadgesContenido c={articulo} />
        </div>
        {articulo.resumen && <p className="mt-2 text-muted">{articulo.resumen}</p>}
      </div>
      {estaVencido(articulo.vigente_hasta) && articulo.vigente_hasta && (
        <p role="alert" className="rounded-lg border border-destructive/40 p-3 text-sm text-destructive">
          Este contenido venció el {formatearFecha(articulo.vigente_hasta)}.
        </p>
      )}
      <Card>
        <Markdown texto={articulo.cuerpo_md} />
      </Card>
      {(hijos ?? []).length > 0 && (
        <Card>
          <h2 className="mb-2 font-semibold">En esta sección</h2>
          <ul className="flex flex-col gap-1.5">
            {(hijos ?? []).map((h) => (
              <li key={h.slug}>
                <Link href={`/repositorio/${slugCategoria}/${h.slug}`} className="text-primary">
                  {h.titulo}
                </Link>
              </li>
            ))}
          </ul>
        </Card>
      )}
      <p className="text-xs text-muted">
        Versión {articulo.version} · actualizado el {formatearFecha(articulo.updated_at)}
        {articulo.fuente_url && (
          <>
            {" · "}
            <a
              href={articulo.fuente_url}
              target="_blank"
              rel="noopener noreferrer"
              className="text-primary underline"
            >
              Fuente
            </a>
          </>
        )}
      </p>
    </article>
  );
}
