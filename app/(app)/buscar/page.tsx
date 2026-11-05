import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function PaginaBuscar({ searchParams }: PageProps<"/buscar">) {
  await requerirPerfil();
  const sp = await searchParams;
  const q = (typeof sp.q === "string" ? sp.q : "").trim().slice(0, 200);
  const supabase = await crearClienteServidor();
  const { data } = q ? await supabase.rpc("buscar_contenido", { q, p_limite: 30 }) : { data: [] };
  const articulos = (data ?? []).filter((r) => r.tipo === "articulo");
  const recursos = (data ?? []).filter((r) => r.tipo === "recurso");

  return (
    <div className="flex flex-col gap-5">
      <h1 className="text-2xl font-semibold">Buscar</h1>
      <form role="search" className="flex gap-2">
        <Input name="q" aria-label="¿Qué estás buscando?" placeholder="¿Qué estás buscando?" defaultValue={q} autoFocus={!q} />
        <Button type="submit">Buscar</Button>
      </form>
      {q && articulos.length + recursos.length === 0 && (
        <Card>
          <p className="text-sm">No encontramos nada para «{q}». Probá con otras palabras.</p>
        </Card>
      )}
      {articulos.length > 0 && (
        <section aria-label="Artículos">
          <h2 className="mb-2 font-semibold">Artículos</h2>
          <ul className="flex flex-col gap-2">
            {articulos.map((a) => (
              <li key={a.id}>
                <Card className="p-4">
                  <Link href={`/repositorio/${a.categoria_slug}/${a.slug}`} className="font-medium text-primary">
                    {a.titulo}
                  </Link>
                  {a.resumen && <p className="text-sm text-muted">{a.resumen}</p>}
                </Card>
              </li>
            ))}
          </ul>
        </section>
      )}
      {recursos.length > 0 && (
        <section aria-label="Recursos">
          <h2 className="mb-2 font-semibold">Recursos</h2>
          <ul className="flex flex-col gap-2">
            {recursos.map((r) => (
              <li key={r.id}>
                <Card className="p-4">
                  <Link href={`/recursos?q=${encodeURIComponent(r.titulo)}`} className="font-medium text-primary">
                    {r.titulo}
                  </Link>
                  {r.resumen && <p className="text-sm text-muted">{r.resumen}</p>}
                </Card>
              </li>
            ))}
          </ul>
        </section>
      )}
    </div>
  );
}
