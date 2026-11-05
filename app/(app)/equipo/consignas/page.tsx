import Link from "next/link";
import { Badge } from "@/components/ui/badge";
import { Card } from "@/components/ui/card";
import { formatearFecha } from "@/lib/dominio/contenido";
import { ETIQUETA_DESTINO, ETIQUETA_RECURRENCIA } from "@/lib/dominio/consignas";
import { ROLES_GESTION } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function PaginaEquipoConsignas() {
  const perfil = await requerirRol([...ROLES_GESTION]);
  const supabase = await crearClienteServidor();
  const { data } = await supabase
    .from("consignas")
    .select("id, titulo, tipo, destino, recurrencia, activa, fecha_limite, created_at, consigna_asignaciones(estado, periodo)")
    .eq("creada_por", perfil.id)
    .order("created_at", { ascending: false })
    .limit(100);

  return (
    <div className="flex flex-col gap-5">
      <div className="flex flex-wrap items-end justify-between gap-3">
        <div>
          <h1 className="text-2xl font-semibold">Consignas del equipo</h1>
          <p className="text-sm text-muted">Las que asignaste y cómo vienen.</p>
        </div>
        <Link href="/equipo/consignas/nueva" className="inline-flex h-11 items-center rounded-lg bg-primary px-4 text-sm font-medium text-primary-foreground">
          Nueva consigna
        </Link>
      </div>
      {(data ?? []).length === 0 ? (
        <Card>
          <p className="text-sm">Todavía no asignaste consignas.</p>
        </Card>
      ) : (
        <ul className="flex flex-col gap-2" aria-label="Consignas asignadas">
          {(data ?? []).map((c) => {
            const ultimo = c.consigna_asignaciones.reduce((m, a) => (a.periodo > m ? a.periodo : m), "");
            const actuales = c.consigna_asignaciones.filter((a) => a.periodo === ultimo);
            const hechas = actuales.filter((a) => a.estado === "hecha").length;
            return (
              <li key={c.id}>
                <Card className="flex flex-col gap-1 p-4">
                  <div className="flex flex-wrap items-center justify-between gap-2">
                    <Link href={`/equipo/consignas/${c.id}`} className="font-medium hover:text-primary">{c.titulo}</Link>
                    <span className="text-sm font-medium">{hechas} de {actuales.length} hechas</span>
                  </div>
                  <div className="flex flex-wrap items-center gap-1.5 text-xs text-muted">
                    <Badge>{ETIQUETA_DESTINO[c.destino]}</Badge>
                    {c.tipo === "lectura" && <Badge className="border-primary/40 text-primary">Lectura</Badge>}
                    {c.recurrencia !== "ninguna" && <Badge className="border-transparent bg-background">{ETIQUETA_RECURRENCIA[c.recurrencia]}</Badge>}
                    {!c.activa && <Badge>Sin repetir</Badge>}
                    {c.fecha_limite && <span>Vence el {formatearFecha(c.fecha_limite)}</span>}
                  </div>
                </Card>
              </li>
            );
          })}
        </ul>
      )}
    </div>
  );
}
