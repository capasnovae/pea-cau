import Link from "next/link";
import { Card } from "@/components/ui/card";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function PaginaRepositorio() {
  await requerirPerfil();
  const supabase = await crearClienteServidor();
  const [{ data: categorias }, { data: articulos }] = await Promise.all([
    supabase.from("categorias").select("id, slug, nombre, descripcion").order("orden"),
    supabase.from("articulos").select("categoria_id").eq("estado", "publicado").is("padre_id", null),
  ]);
  const cantidad = new Map<string, number>();
  (articulos ?? []).forEach((a) => cantidad.set(a.categoria_id, (cantidad.get(a.categoria_id) ?? 0) + 1));

  return (
    <div className="flex flex-col gap-5">
      <div>
        <h1 className="text-2xl font-semibold">Repositorio</h1>
        <p className="text-sm text-muted">Todo lo que necesitás para asesorar, ordenado por tema.</p>
      </div>
      <ul className="grid gap-3 sm:grid-cols-2">
        {(categorias ?? []).map((c) => (
          <li key={c.id}>
            <Link href={`/repositorio/${c.slug}`} className="block h-full">
              <Card className="h-full p-4 transition hover:border-primary">
                <div className="flex items-baseline justify-between gap-2">
                  <h2 className="font-semibold">{c.nombre}</h2>
                  <span className="shrink-0 text-xs text-muted">
                    {cantidad.get(c.id) ?? 0} {cantidad.get(c.id) === 1 ? "artículo" : "artículos"}
                  </span>
                </div>
                <p className="mt-1 text-sm text-muted">{c.descripcion}</p>
              </Card>
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}
