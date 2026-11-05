import Link from "next/link";
import { Markdown } from "@/components/markdown";
import { Badge } from "@/components/ui/badge";
import { Card } from "@/components/ui/card";
import { formatearFecha } from "@/lib/dominio/contenido";
import { ETIQUETA_ESTADO, ETIQUETA_PRIORIDAD, ETIQUETA_RECURRENCIA, type EstadoAsignacion } from "@/lib/dominio/consignas";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { cn } from "@/lib/utils/cn";
import { BotonLeido, FormularioCierre } from "./formulario-cierre";

const TABS: { id: string; etiqueta: string; estados: EstadoAsignacion[] }[] = [
  { id: "pendientes", etiqueta: "Pendientes", estados: ["pendiente", "en_curso"] },
  { id: "vencidas", etiqueta: "Vencidas", estados: ["vencida"] },
  { id: "hechas", etiqueta: "Hechas", estados: ["hecha"] },
];

export default async function PaginaConsignas({ searchParams }: PageProps<"/consignas">) {
  const perfil = await requerirPerfil();
  const sp = await searchParams;
  const tab = TABS.find((t) => t.id === sp.tab) ?? TABS[0]!;
  const supabase = await crearClienteServidor();
  const { data } = await supabase
    .from("consigna_asignaciones")
    .select(
      "id, estado, periodo, vence_el, comentario, evidencia_path, leida_at, completada_at, " +
        "consignas(titulo, detalle_md, tipo, prioridad, recurrencia, requiere_evidencia, creada_por, " +
        "articulos(titulo, slug, categorias(slug)))",
    )
    .eq("usuario_id", perfil.id)
    .in("estado", tab.estados)
    .order("vence_el", { ascending: true, nullsFirst: false })
    .limit(100);
  const asignaciones = (data ?? []) as unknown as Fila[];
  // Los nombres de quien asigna salen del directorio (la RLS de perfiles no deja ver a otros).
  const { data: directorio } = await supabase.rpc("organigrama");
  const nombres = new Map((directorio ?? []).map((p) => [p.id, `${p.nombre} ${p.apellido}`]));

  return (
    <div className="flex flex-col gap-5">
      <div>
        <h1 className="text-2xl font-semibold">Consignas</h1>
        <p className="text-sm text-muted">Lo que te pidieron tu líder o tu coordinación.</p>
      </div>
      <nav aria-label="Estado" className="flex gap-1 rounded-lg border border-border bg-card p-1">
        {TABS.map((t) => (
          <Link key={t.id} href={`/consignas?tab=${t.id}`} aria-current={tab.id === t.id ? "page" : undefined}
            className={cn("flex-1 rounded-md px-3 py-2 text-center text-sm", tab.id === t.id ? "bg-background font-semibold text-primary" : "text-muted")}>
            {t.etiqueta}
          </Link>
        ))}
      </nav>
      {asignaciones.length === 0 ? (
        <Card>
          <p className="text-sm">{tab.id === "pendientes" ? "No tenés consignas pendientes. ¡Bien ahí!" : "No hay nada acá."}</p>
        </Card>
      ) : (
        <ul className="flex flex-col gap-3" aria-label="Mis consignas">
          {asignaciones.map((a) => {
            const c = a.consignas;
            if (!c) return null;
            return (
              <li key={a.id}>
                <Card className="flex flex-col gap-3 p-4">
                  <div className="flex flex-wrap items-center gap-1.5">
                    <Badge>{ETIQUETA_ESTADO[a.estado]}</Badge>
                    {c.tipo === "lectura" && <Badge className="border-primary/40 text-primary">Lectura</Badge>}
                    {c.prioridad === "alta" && <Badge className="border-destructive/50 text-destructive">Prioridad {ETIQUETA_PRIORIDAD.alta.toLowerCase()}</Badge>}
                    {c.recurrencia !== "ninguna" && <Badge className="border-transparent bg-background">{ETIQUETA_RECURRENCIA[c.recurrencia]}</Badge>}
                  </div>
                  <h2 className="font-semibold">{c.titulo}</h2>
                  <p className="text-xs text-muted">
                    Te la asignó {nombres.get(c.creada_por) ?? "tu coordinación"}
                    {a.vence_el && ` · vence el ${formatearFecha(a.vence_el)}`}
                    {a.completada_at && ` · hecha el ${formatearFecha(a.completada_at)}`}
                  </p>
                  {c.detalle_md && <Markdown texto={c.detalle_md} />}
                  {c.tipo === "lectura" && !c.articulos && a.estado !== "hecha" && (
                    <div className="flex flex-wrap items-center gap-3">
                      <p className="text-sm text-muted">El artículo de esta lectura ya no está disponible. Avisale a quien te la asignó.</p>
                      <BotonLeido asignacionId={a.id} leida={!!a.leida_at} />
                    </div>
                  )}
                  {c.tipo === "lectura" && c.articulos && (
                    <div className="flex flex-wrap items-center gap-3">
                      <Link href={`/repositorio/${c.articulos.categorias?.slug}/${c.articulos.slug}`} className="text-sm text-primary underline">
                        Leer: {c.articulos.titulo}
                      </Link>
                      {a.estado !== "hecha" && <BotonLeido asignacionId={a.id} leida={!!a.leida_at} />}
                    </div>
                  )}
                  {a.estado !== "hecha" ? (
                    <FormularioCierre asignacionId={a.id} estado={a.estado} comentario={a.comentario}
                      requiereEvidencia={c.requiere_evidencia} tieneEvidencia={!!a.evidencia_path} />
                  ) : (
                    a.comentario && <p className="text-sm">Tu comentario: {a.comentario}</p>
                  )}
                </Card>
              </li>
            );
          })}
        </ul>
      )}
    </div>
  );
}

type Fila = {
  id: string;
  estado: EstadoAsignacion;
  periodo: string;
  vence_el: string | null;
  comentario: string | null;
  evidencia_path: string | null;
  leida_at: string | null;
  completada_at: string | null;
  consignas: {
    titulo: string;
    detalle_md: string;
    tipo: "tarea" | "lectura" | "capacitacion";
    prioridad: "baja" | "normal" | "alta";
    recurrencia: "ninguna" | "diaria" | "semanal" | "mensual";
    requiere_evidencia: boolean;
    creada_por: string;
    articulos: { titulo: string; slug: string; categorias: { slug: string } | null } | null;
  } | null;
};
