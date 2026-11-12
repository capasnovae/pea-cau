import Link from "next/link";
import { EncabezadoRepositorio } from "@/components/repositorio/encabezado";
import { Card } from "@/components/ui/card";
import { Icono } from "@/components/ui/icono";
import { cn } from "@/lib/utils/cn";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

const TONOS = ["--nivel-1", "--nivel-2", "--nivel-3", "--nivel-4", "--nivel-cap"];

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
      <EncabezadoRepositorio actual="articulos" />
      <ul className="grid gap-3 sm:grid-cols-2">
        {(categorias ?? []).map((c, i) => {
          const n = cantidad.get(c.id) ?? 0;
          const t = TONOS[i % TONOS.length]!;
          return (
            <li key={c.id}>
              <Link href={`/repositorio/${c.slug}`} className="block h-full">
                <Card
                  interactiva
                  className={cn("flex h-full items-center gap-3 p-4", n === 0 && "opacity-60")}
                >
                  <span
                    className="flex size-11 shrink-0 items-center justify-center rounded-boton"
                    style={{ background: `var(${t}-soft)`, color: `var(${t}-fg)` }}
                  >
                    <Icono nombre="libro" />
                  </span>
                  <span className="min-w-0 flex-1">
                    <span className="flex items-baseline justify-between gap-2">
                      <h2 className="text-h3">{c.nombre}</h2>
                      <span className="shrink-0 text-xs text-muted">
                        {n} {n === 1 ? "artículo" : "artículos"}
                      </span>
                    </span>
                    <span className="line-clamp-1 text-sm text-muted">{c.descripcion}</span>
                  </span>
                </Card>
              </Link>
            </li>
          );
        })}
      </ul>
    </div>
  );
}
