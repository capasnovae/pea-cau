import Link from "next/link";
import { BadgesContenido } from "@/components/repositorio/badges";
import { Card } from "@/components/ui/card";
import { filtroEditable } from "@/lib/dominio/edicion";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { cn } from "@/lib/utils/cn";

const TABS = [
  { id: "cursos", etiqueta: "Cursos" },
  { id: "articulos", etiqueta: "Artículos" },
  { id: "recursos", etiqueta: "Recursos" },
  { id: "campanas", etiqueta: "Campañas" },
  { id: "examenes", etiqueta: "Exámenes" },
  { id: "actualizaciones", etiqueta: "Actualizaciones" },
] as const;

export default async function PaginaContenido({ searchParams }: PageProps<"/contenido">) {
  const perfil = await requerirRol([...ROLES_EDITORES]);
  const sp = await searchParams;
  const tab =
    TABS.find(
      (t) => t.id === sp.tab && t.id !== "cursos" && t.id !== "examenes" && t.id !== "actualizaciones",
    )?.id ?? "articulos";
  const supabase = await crearClienteServidor();

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
    const { data } = await supabase
      .from("articulos")
      .select(
        "id, titulo, alcance, sede_id, estado, version, updated_at, vigente_hasta, categorias(nombre), sedes!articulos_sede_id_fkey(nombre)",
      )
      .match(filtro ?? {})
      .order("updated_at", { ascending: false })
      .limit(200);
    filas = (data ?? []).map((a) => ({
      id: a.id,
      titulo: a.titulo,
      detalle: `${a.categorias?.nombre ?? ""} · ${a.sedes?.nombre ?? "Todos los CAU"}`,
      href: `/contenido/articulos/${a.id}`,
      badges: a,
    }));
  } else if (tab === "recursos") {
    const { data } = await supabase
      .from("recursos")
      .select(
        "id, titulo, tipo, alcance, sede_id, estado, vigente_hasta, sedes!recursos_sede_id_fkey(nombre)",
      )
      .match(filtro ?? {})
      .order("updated_at", { ascending: false })
      .limit(200);
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
        <div>
          <h1 className="text-2xl font-semibold">Contenido</h1>
          <p className="text-sm text-muted">Artículos, recursos y campañas que podés editar.</p>
        </div>
        {tab !== "campanas" && tab !== "cursos" && (
          <Link
            href={`/contenido/${tab}/nuevo`}
            className="inline-flex h-11 items-center rounded-lg bg-primary px-4 text-sm font-medium text-primary-foreground"
          >
            {tab === "articulos" ? "Nuevo artículo" : "Nuevo recurso"}
          </Link>
        )}
      </div>
      <nav aria-label="Tipo de contenido" className="flex gap-1 rounded-lg border border-border bg-card p-1">
        {TABS.filter((t) => t.id !== "actualizaciones" || perfil.rol === "admin").map((t) => (
          <Link
            key={t.id}
            href={
              t.id === "campanas"
                ? "/contenido/campanas"
                : t.id === "cursos"
                  ? "/contenido/cursos"
                  : t.id === "examenes"
                    ? "/contenido/examenes"
                    : t.id === "actualizaciones"
                      ? "/contenido/actualizaciones"
                      : `/contenido?tab=${t.id}`
            }
            aria-current={tab === t.id ? "page" : undefined}
            className={cn(
              "flex-1 rounded-md px-3 py-2 text-center text-sm",
              tab === t.id ? "bg-background font-semibold text-primary" : "text-muted",
            )}
          >
            {t.etiqueta}
          </Link>
        ))}
      </nav>
      {filas.length === 0 ? (
        <Card>
          <p className="text-sm">Todavía no hay nada acá. Creá el primero.</p>
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
    </div>
  );
}
