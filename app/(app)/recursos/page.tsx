import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { EncabezadoRepositorio } from "@/components/repositorio/encabezado";
import { Card } from "@/components/ui/card";
import { Input, Select } from "@/components/ui/input";
import { estaVencido, formatearFecha, normalizarBusqueda } from "@/lib/dominio/contenido";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import type { Database } from "@/lib/supabase/tipos";
import { BotonDescargar } from "./boton-descargar";

type TipoRecurso = Database["public"]["Enums"]["tipo_recurso"];

const TIPOS: Record<string, string> = {
  imagen: "Imagen",
  video: "Video",
  pdf: "PDF",
  presentacion: "Presentación",
  enlace: "Enlace",
  otro: "Otro",
};

export default async function PaginaRecursos({ searchParams }: PageProps<"/recursos">) {
  await requerirPerfil();
  const sp = await searchParams;
  const valor = (k: string) => (typeof sp[k] === "string" ? (sp[k] as string) : "");
  const [categoria, tipo, campana, q, idRecurso] = [valor("categoria"), valor("tipo"), valor("campana"), valor("q").trim(), valor("id")];

  const supabase = await crearClienteServidor();
  let consulta = supabase
    .from("recursos")
    .select("id, titulo, descripcion, tipo, archivo_path, url_externa, etiquetas, vigente_hasta, alcance, categorias(nombre, slug), campanas(nombre)")
    .eq("estado", "publicado")
    .order("created_at", { ascending: false })
    .limit(100);
  if (categoria) consulta = consulta.eq("categoria_id", categoria);
  if (tipo && tipo in TIPOS) consulta = consulta.eq("tipo", tipo as TipoRecurso);
  if (campana) consulta = consulta.eq("campana_id", campana);
  if (q) consulta = consulta.textSearch("busqueda", normalizarBusqueda(q), { type: "websearch", config: "spanish" });
  if (/^[0-9a-f-]{36}$/i.test(idRecurso)) consulta = consulta.eq("id", idRecurso);

  const [{ data: recursos }, { data: categorias }, { data: campanas }] = await Promise.all([
    consulta,
    supabase.from("categorias").select("id, nombre").order("orden"),
    supabase.from("campanas").select("id, nombre").eq("estado", "publicado").order("nombre"),
  ]);
  const vigentes = (recursos ?? []).filter((r) => !estaVencido(r.vigente_hasta));

  return (
    <div className="flex flex-col gap-5">
      <EncabezadoRepositorio actual="recursos" />
      <Card className="p-4">
        <form className="grid gap-2 sm:grid-cols-[1.5fr_1fr_1fr_1fr_auto]" role="search">
          <Input name="q" aria-label="Buscar en recursos" placeholder="Buscar en recursos" defaultValue={q} />
          <Select name="categoria" aria-label="Categoría" defaultValue={categoria}>
            <option value="">Todas las categorías</option>
            {(categorias ?? []).map((c) => (
              <option key={c.id} value={c.id}>{c.nombre}</option>
            ))}
          </Select>
          <Select name="tipo" aria-label="Tipo" defaultValue={tipo}>
            <option value="">Todos los tipos</option>
            {Object.entries(TIPOS).map(([v, e]) => (
              <option key={v} value={v}>{e}</option>
            ))}
          </Select>
          <Select name="campana" aria-label="Campaña" defaultValue={campana}>
            <option value="">Todas las campañas</option>
            {(campanas ?? []).map((c) => (
              <option key={c.id} value={c.id}>{c.nombre}</option>
            ))}
          </Select>
          <Button type="submit">Filtrar</Button>
        </form>
      </Card>
      {vigentes.length === 0 ? (
        <Card>
          <p className="text-sm">No hay recursos con esos filtros.</p>
        </Card>
      ) : (
        <ul className="grid gap-3 sm:grid-cols-2" aria-label="Recursos">
          {vigentes.map((r) => (
            <li key={r.id}>
              <Card className="flex h-full flex-col gap-2 p-4">
                <div className="flex flex-wrap items-center gap-1.5">
                  <Badge>{TIPOS[r.tipo]}</Badge>
                  {r.alcance === "sede" && <Badge className="border-primary/40 text-primary">De tu sede</Badge>}
                  {r.campanas?.nombre && <Badge className="border-transparent bg-background">{r.campanas.nombre}</Badge>}
                </div>
                <h2 className="font-medium">{r.titulo}</h2>
                {r.descripcion && <p className="text-sm text-muted">{r.descripcion}</p>}
                {r.etiquetas.length > 0 && <p className="text-xs text-muted">#{r.etiquetas.join(" #")}</p>}
                <div className="mt-auto flex items-end justify-between gap-2 pt-2">
                  {r.archivo_path ? (
                    <BotonDescargar recursoId={r.id} />
                  ) : r.url_externa ? (
                    <a href={r.url_externa} target="_blank" rel="noopener noreferrer"
                      className="inline-flex h-9 items-center rounded-lg border border-border bg-card px-4 text-sm font-medium hover:bg-background">
                      Abrir
                    </a>
                  ) : null}
                  {r.vigente_hasta && <span className="text-xs text-muted">Vigente hasta el {formatearFecha(r.vigente_hasta)}</span>}
                </div>
              </Card>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
