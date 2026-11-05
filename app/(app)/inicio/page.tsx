import Link from "next/link";
import { Card } from "@/components/ui/card";
import { formatearFecha } from "@/lib/dominio/contenido";
import { colorNivel, porcentaje } from "@/lib/dominio/leccion";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function PaginaInicio() {
  const perfil = await requerirPerfil();
  const supabase = await crearClienteServidor();
  const [{ data: ruta }, { data: pendientes, count }] = await Promise.all([
    supabase.rpc("mi_ruta"),
    supabase
      .from("consigna_asignaciones")
      .select("id, vence_el, consignas(titulo, tipo)", { count: "exact" })
      .eq("usuario_id", perfil.id)
      .in("estado", ["pendiente", "en_curso", "vencida"])
      .order("vence_el", { ascending: true, nullsFirst: false })
      .limit(3),
  ]);
  const cursos = ruta ?? [];
  const niveles = cursos.filter((c) => c.tipo === "nivel");
  const actual = cursos.find((c) => c.desbloqueado && !c.cumplido && c.obligatorio) ?? cursos.find((c) => c.desbloqueado && !c.cumplido);
  const color = colorNivel(actual?.nivel_orden);
  const pct = actual ? porcentaje(actual.items_cumplidos, actual.items_total) : 0;
  const segmentos = actual ? Array.from({ length: Math.min(actual.items_total, 10) }, (_, i) => i < Math.round((actual.items_cumplidos / Math.max(actual.items_total, 1)) * Math.min(actual.items_total, 10))) : [];

  return (
    <div className="flex flex-col gap-5">
      <div className="flex items-center gap-3">
        <div aria-hidden="true" className="flex size-11 items-center justify-center rounded-full bg-[#ffd9a8] text-lg font-extrabold text-[#9a4a00]">
          {perfil.nombre.slice(0, 1).toUpperCase()}
        </div>
        <div>
          <p className="text-sm text-muted">¡Hola, {perfil.nombre}!</p>
          <h1 className="text-lg font-extrabold">{actual ? "Seguí sumando" : "Todo al día"}</h1>
        </div>
      </div>

      {actual ? (
        <section aria-label="Tu ruta" className="flex flex-col gap-3.5 rounded-3xl p-5 text-white" style={{ background: color.fondo }}>
          <div className="flex items-center justify-between">
            <span className="rounded-full bg-white/20 px-3 py-1.5 text-xs font-bold uppercase">
              {actual.tipo === "nivel" ? `Nivel ${actual.nivel_orden}` : "Capacitación"}
            </span>
            <span className="text-3xl font-extrabold">{pct}%</span>
          </div>
          <h2 className="text-2xl font-extrabold leading-tight">{actual.titulo}</h2>
          <p className="text-sm text-white/85">
            {actual.items_cumplidos} de {actual.items_total} pasos hechos
          </p>
          {segmentos.length > 0 && (
            <div className="grid gap-1.5" style={{ gridTemplateColumns: `repeat(${segmentos.length}, minmax(0, 1fr))` }} aria-hidden="true">
              {segmentos.map((lleno, i) => (
                <div key={i} className={`h-2 rounded ${lleno ? "bg-[#a5f3c4]" : "bg-white/30"}`} />
              ))}
            </div>
          )}
          <Link
            href={actual.siguiente_item ? `/estudiar/${actual.curso_id}/${actual.siguiente_item}` : `/estudiar/${actual.curso_id}`}
            className="flex min-h-12 items-center justify-center rounded-2xl bg-white px-4 text-base font-extrabold"
            style={{ color: color.texto }}
          >
            Continuar
          </Link>
        </section>
      ) : (
        <Card>
          <p className="font-semibold">No tenés cursos pendientes por ahora.</p>
          <Link href="/estudiar" className="text-sm font-semibold text-primary-strong">Ver mi ruta</Link>
        </Card>
      )}

      <section aria-label="Para hoy" className="flex flex-col gap-2.5">
        <div className="flex items-baseline justify-between">
          <h2 className="text-base font-bold">Para hoy</h2>
          <Link href="/consignas" className="text-sm font-semibold text-primary-strong">Ver todas</Link>
        </div>
        {(pendientes ?? []).length === 0 ? (
          <Card className="p-4"><p className="text-sm text-muted">No tenés consignas pendientes.</p></Card>
        ) : (
          <ul className="flex flex-col gap-2.5" aria-label="Consignas pendientes">
            {(pendientes ?? []).map((a) => (
              <li key={a.id}>
                <Link href="/consignas" className="flex items-center gap-3 rounded-2xl bg-card p-3.5 shadow-[var(--shadow-suave)]">
                  <span aria-hidden="true" className={`flex size-11 shrink-0 items-center justify-center rounded-xl ${a.consignas?.tipo === "lectura" ? "bg-[#e0f2fe] text-[#0369a1]" : "bg-[#fef3c7] text-[#b45309]"}`}>
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      {a.consignas?.tipo === "lectura" ? <path d="M4 5h11a3 3 0 0 1 3 3v11H7a3 3 0 0 1-3-3zM8 9h6M8 13h6" /> : <path d="M9 11l3 3 7-7M5 12v7h14" />}
                    </svg>
                  </span>
                  <span className="min-w-0 flex-1">
                    <span className="block truncate text-[15px] font-bold">{a.consignas?.titulo}</span>
                    {a.vence_el && <span className="text-[13px] text-muted">vence el {formatearFecha(a.vence_el)}</span>}
                  </span>
                </Link>
              </li>
            ))}
          </ul>
        )}
        {(count ?? 0) > 3 && <p className="text-xs text-muted">Y {(count ?? 0) - 3} más.</p>}
      </section>

      {niveles.length > 0 && (
        <section aria-label="Tus niveles" className="flex flex-col gap-2.5">
          <h2 className="text-base font-bold">Tus niveles</h2>
          <ul className="grid grid-cols-4 gap-2.5">
            {niveles.map((n) => {
              const c = colorNivel(n.nivel_orden);
              const estado = n.cumplido ? "Cumplido" : n.desbloqueado ? "En curso" : "Bloqueado";
              return (
                <li key={n.curso_id} className="rounded-2xl p-3 text-center" style={{ background: n.desbloqueado ? c.suave : "#f1f1f6" }}>
                  <p className="text-xl font-extrabold" style={{ color: n.desbloqueado ? c.texto : "#5b5b70" }}>N{n.nivel_orden}</p>
                  <p className="text-[11px] font-semibold" style={{ color: n.desbloqueado ? c.texto : "#5b5b70" }}>{estado}</p>
                </li>
              );
            })}
          </ul>
        </section>
      )}
    </div>
  );
}
