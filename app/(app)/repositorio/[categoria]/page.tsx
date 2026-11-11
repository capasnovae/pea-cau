import Link from "next/link";
import { notFound } from "next/navigation";
import { BadgesContenido } from "@/components/repositorio/badges";
import { Card } from "@/components/ui/card";
import { estaVencido } from "@/lib/dominio/contenido";
import { armarArbol, type NodoArticulo } from "@/lib/repositorio/arbol";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

type Fila = {
  id: string;
  padre_id: string | null;
  orden: number;
  titulo: string;
  slug: string;
  resumen: string;
  version: number;
  updated_at: string;
  vigente_hasta: string | null;
  alcance: "global" | "sede";
  estado: "borrador" | "publicado" | "archivado";
};

function Lista({
  nodos,
  categoria,
  nivel,
}: {
  nodos: NodoArticulo<Fila>[];
  categoria: string;
  nivel: number;
}) {
  return (
    <ul
      className={nivel === 0 ? "flex flex-col gap-3" : "mt-2 flex flex-col gap-1 border-l border-border pl-3"}
    >
      {nodos.map((n) => (
        <li key={n.id}>
          {nivel === 0 ? (
            <Card className="p-4">
              <Link href={`/repositorio/${categoria}/${n.slug}`} className="font-medium hover:text-primary">
                {n.titulo}
              </Link>{" "}
              <BadgesContenido c={n} />
              {n.resumen && <p className="mt-1 text-sm text-muted">{n.resumen}</p>}
              {n.hijos.length > 0 && <Lista nodos={n.hijos} categoria={categoria} nivel={nivel + 1} />}
            </Card>
          ) : (
            <>
              <Link href={`/repositorio/${categoria}/${n.slug}`} className="text-sm hover:text-primary">
                {n.titulo}
              </Link>{" "}
              <BadgesContenido c={n} />
              {n.hijos.length > 0 && <Lista nodos={n.hijos} categoria={categoria} nivel={nivel + 1} />}
            </>
          )}
        </li>
      ))}
    </ul>
  );
}

export default async function PaginaCategoria({ params }: PageProps<"/repositorio/[categoria]">) {
  const { categoria: slugCategoria } = await params;
  await requerirPerfil();
  const supabase = await crearClienteServidor();
  const { data: categoria } = await supabase
    .from("categorias")
    .select("id, nombre, descripcion")
    .eq("slug", slugCategoria)
    .maybeSingle();
  if (!categoria) notFound();
  const { data } = await supabase
    .from("articulos")
    .select("id, padre_id, orden, titulo, slug, resumen, version, updated_at, vigente_hasta, alcance, estado")
    .eq("categoria_id", categoria.id)
    .eq("estado", "publicado");
  const visibles = (data ?? []).filter((a) => !estaVencido(a.vigente_hasta)) as Fila[];
  const arbol = armarArbol(visibles);

  return (
    <div className="flex flex-col gap-5">
      <div>
        <Link href="/repositorio" className="text-sm text-primary">
          ← Repositorio
        </Link>
        <h1 className="mt-1 text-2xl font-semibold">{categoria.nombre}</h1>
        <p className="text-sm text-muted">{categoria.descripcion}</p>
      </div>
      {arbol.length === 0 ? (
        <Card>
          <p className="text-sm">Todavía no hay artículos en esta categoría.</p>
        </Card>
      ) : (
        <Lista nodos={arbol} categoria={slugCategoria} nivel={0} />
      )}
    </div>
  );
}
