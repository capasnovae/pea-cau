import Link from "next/link";
import { notFound } from "next/navigation";
import { Markdown } from "@/components/markdown";
import { Badge } from "@/components/ui/badge";
import { Card } from "@/components/ui/card";
import { formatearFecha } from "@/lib/dominio/contenido";
import { ETIQUETA_DESTINO, ETIQUETA_ESTADO, ETIQUETA_RECURRENCIA } from "@/lib/dominio/consignas";
import { ROLES_GESTION } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { BotonDejarDeRepetir, BotonEvidencia } from "./botones";

export default async function PaginaDetalleConsigna({ params, searchParams }: PageProps<"/equipo/consignas/[id]">) {
  await requerirRol([...ROLES_GESTION]);
  const { id } = await params;
  const sp = await searchParams;
  const supabase = await crearClienteServidor();
  const { data: c } = await supabase
    .from("consignas")
    .select("id, titulo, detalle_md, tipo, destino, recurrencia, activa, fecha_limite, requiere_evidencia, creada_por")
    .eq("id", id)
    .maybeSingle();
  if (!c) notFound();
  const [{ data: asignaciones }, { data: dir }] = await Promise.all([
    supabase.from("consigna_asignaciones")
      .select("id, usuario_id, periodo, estado, completada_at, comentario, evidencia_path, leida_at")
      .eq("consigna_id", id)
      .order("periodo", { ascending: false }),
    supabase.rpc("organigrama"),
  ]);
  const nombres = new Map((dir ?? []).map((p) => [p.id, `${p.nombre} ${p.apellido}`]));
  const periodos = [...new Set((asignaciones ?? []).map((a) => a.periodo))];
  const periodo = typeof sp.periodo === "string" && periodos.includes(sp.periodo) ? sp.periodo : periodos[0];
  const delPeriodo = (asignaciones ?? []).filter((a) => a.periodo === periodo);
  const hechas = delPeriodo.filter((a) => a.estado === "hecha").length;

  return (
    <div className="flex flex-col gap-5">
      <div>
        <Link href="/equipo/consignas" className="text-sm text-primary">← Consignas del equipo</Link>
        <h1 className="mt-1 text-2xl font-semibold">{c.titulo}</h1>
        {sp.creada && <p role="status" className="text-sm text-primary">Consigna asignada a {delPeriodo.length} {delPeriodo.length === 1 ? "persona" : "personas"}.</p>}
        <div className="mt-2 flex flex-wrap gap-1.5">
          <Badge>{ETIQUETA_DESTINO[c.destino]}</Badge>
          {c.tipo === "lectura" && <Badge className="border-primary/40 text-primary">Lectura</Badge>}
          {c.recurrencia !== "ninguna" && <Badge className="border-transparent bg-background">{ETIQUETA_RECURRENCIA[c.recurrencia]}</Badge>}
          {c.requiere_evidencia && <Badge>Pide evidencia</Badge>}
          {c.fecha_limite && <Badge>Vence el {formatearFecha(c.fecha_limite)}</Badge>}
        </div>
      </div>
      {c.detalle_md && <Card><Markdown texto={c.detalle_md} /></Card>}
      <Card>
        <div className="mb-3 flex flex-wrap items-center justify-between gap-2">
          <h2 className="font-semibold">Avance: {hechas} de {delPeriodo.length} hechas</h2>
          {periodos.length > 1 && (
            <form className="flex items-center gap-2 text-sm">
              <label htmlFor="periodo">Período</label>
              <select id="periodo" name="periodo" defaultValue={periodo} className="h-9 rounded-lg border border-border bg-card px-2">
                {periodos.map((p) => <option key={p} value={p}>{formatearFecha(p)}</option>)}
              </select>
              <button type="submit" className="text-primary">Ver</button>
            </form>
          )}
        </div>
        {delPeriodo.length === 0 ? (
          <p className="text-sm text-muted">No hay personas asignadas en este período.</p>
        ) : (
          <ul className="flex flex-col divide-y divide-border" aria-label="Avance por persona">
            {delPeriodo.map((a) => (
              <li key={a.id} className="flex flex-col gap-1 py-2 sm:flex-row sm:items-center sm:justify-between">
                <div>
                  <p className="font-medium">{nombres.get(a.usuario_id) ?? "Usuario inactivo"}</p>
                  {a.comentario && <p className="text-sm text-muted">“{a.comentario}”</p>}
                </div>
                <div className="flex flex-wrap items-center gap-2 text-sm">
                  <Badge>{ETIQUETA_ESTADO[a.estado]}</Badge>
                  {a.completada_at && <span className="text-xs text-muted">{formatearFecha(a.completada_at)}</span>}
                  {a.evidencia_path && <BotonEvidencia asignacionId={a.id} />}
                </div>
              </li>
            ))}
          </ul>
        )}
      </Card>
      {c.recurrencia !== "ninguna" && c.activa && <BotonDejarDeRepetir id={c.id} />}
    </div>
  );
}
