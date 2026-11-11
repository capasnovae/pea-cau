import Link from "next/link";
import { BadgesContenido } from "@/components/repositorio/badges";
import { Pestanas } from "@/components/ui/pestanas";
import { Card } from "@/components/ui/card";
import { filtroEditable } from "@/lib/dominio/edicion";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

const TABS = [
  { id: "cursos", etiqueta: "Cursos" },
  { id: "articulos", etiqueta: "Artículos" },
  { id: "recursos", etiqueta: "Recursos" },
  { id: "campanas", etiqueta: "Campañas" },
  { id: "examenes", etiqueta: "Exámenes" },
  { id: "actualizaciones", etiqueta: "Actualizaciones" },
] as const;

const POR_PAGINA = 30;

export default async function PaginaContenido({ searchParams }: PageProps<"/contenido">) {
  const perfil = await requerirRol([...ROLES_EDITORES]);
  const sp = await searchParams;
  const tab =
    TABS.find(
      (t) => t.id === sp.tab && t.id !== "cursos" && t.id !== "examenes" && t.id !== "actualizaciones",
    )?.id ?? "articulos";
  const supabase = await crearClienteServidor();
  const pagina = Math.max(1, Number.parseInt(typeof sp.pagina === "string" ? sp.pagina : "1", 10) || 1);
  const desde = (pagina - 1) * POR_PAGINA;
  let total = 0;

  // Filtramos en el servidor lo que el rol puede editar (lo global solo para el admin),
  // así el límite de filas no deja afuera contenido propio.
  const filtro = filtroEditable(perfil.rol, perfil.sede_id);

  let filas: {
    id: string;
    titulo: string;
    detalle: string;
    href: string;
    badges: Parameters<typeof BadgesContenido>[0]["c"];
  }[] = [];
  if (tab === "articulos") {
    const { data, count } = await supabase
      .from("articulos")
      .select(
        "id, titulo, alcance, sede_id, estado, version, updated_at, vigente_hasta, categorias(nombre), sedes!articulos_sede_id_fkey(nombre)",
        { count: "exact" },
      )
      .match(filtro ?? {})
      .order("updated_at", { ascending: false })
      .order("id")
      .range(desde, desde + POR_PAGINA - 1);
    total = count ?? 0;
    filas = (data ?? []).map((a) => ({
      id: a.id,
      titulo: a.titulo,
      detalle: `${a.categorias?.nombre ?? ""} · ${a.sedes?.nombre ?? "Todos los CAU"}`,
      href: `/contenido/articulos/${a.id}`,
      badges: a,
    }));
  } else if (tab === "recursos") {
    const { data, count } = await supabase
      .from("recursos")
      .select(
        "id, titulo, tipo, alcance, sede_id, estado, vigente_hasta, sedes!recursos_sede_id_fkey(nombre)",
        { count: "exact" },
      )
      .match(filtro ?? {})
      .order("updated_at", { ascending: false })
      .order("id")
      .range(desde, desde + POR_PAGINA - 1);
    total = count ?? 0;
    filas = (data ?? []).map((r) => ({
      id: r.id,
      titulo: r.titulo,
      detalle: `${r.tipo} · ${r.sedes?.nombre ?? "Todos los CAU"}`,
      href: `/contenido/recursos/${r.id}`,
      badges: r,
    }));
  }

  return (
    <div className="flex flex-col gap-5">
      <div className="flex flex-wrap items-end justify-between gap-3">
        <h1 className="text-h1">Contenido</h1>
        {tab !== "campanas" && tab !== "cursos" && (
          <Link
            href={`/contenido/${tab}/nuevo`}
            className="inline-flex h-11 items-center rounded-boton bg-primary px-4 text-ui font-bold text-primary-foreground transition hover:bg-primary-strong active:scale-[0.97]"
          >
            {tab === "articulos" ? "Nuevo artículo" : "Nuevo recurso"}
          </Link>
        )}
      </div>
      <Pestanas
        etiqueta="Tipo de contenido"
        pestanas={TABS.filter((t) => t.id !== "actualizaciones" || perfil.rol === "admin").map((t) => ({
          etiqueta: t.etiqueta,
          activa: tab === t.id,
          href: ["campanas", "cursos", "examenes", "actualizaciones"].includes(t.id)
            ? `/contenido/${t.id}`
            : `/contenido?tab=${t.id}`,
        }))}
      />
      {filas.length === 0 ? (
        <Card>
          <p className="text-sm text-muted">Sin contenido.</p>
        </Card>
      ) : (
        <ul className="flex flex-col gap-2" aria-label="Contenido editable">
          {filas.map((f) => (
            <li key={f.id}>
              <Card className="p-4">
                <Link href={f.href} className="font-medium hover:text-primary">
                  {f.titulo}
                </Link>{" "}
                <BadgesContenido c={{ ...f.badges, alcance: "global" }} />
                <p className="text-sm text-muted">{f.detalle}</p>
              </Card>
            </li>
          ))}
        </ul>
      )}
      {total > POR_PAGINA && (
        <nav aria-label="Páginas" className="flex items-center justify-between text-sm font-semibold">
          {pagina > 1 ? (
            <Link href={`/contenido?tab=${tab}&pagina=${pagina - 1}`} className="text-primary-strong">
              Anterior
            </Link>
          ) : (
            <span />
          )}
          <span className="text-muted">
            {pagina} de {Math.ceil(total / POR_PAGINA)}
          </span>
          {desde + POR_PAGINA < total ? (
            <Link href={`/contenido?tab=${tab}&pagina=${pagina + 1}`} className="text-primary-strong">
              Siguiente
            </Link>
          ) : (
            <span />
          )}
        </nav>
      )}
    </div>
  );
}
