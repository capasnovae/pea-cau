import Link from "next/link";
import { Card } from "@/components/ui/card";
import { colorNivel, porcentaje } from "@/lib/dominio/leccion";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

function Candado() {
  return (
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
      <rect x="5" y="11" width="14" height="9" rx="2" /><path d="M8 11V8a4 4 0 0 1 8 0v3" />
    </svg>
  );
}

export default async function PaginaEstudiar() {
  await requerirPerfil();
  const supabase = await crearClienteServidor();
  const { data } = await supabase.rpc("mi_ruta");
  const cursos = data ?? [];
  const niveles = cursos.filter((c) => c.tipo === "nivel");
  const capacitaciones = cursos.filter((c) => c.tipo === "capacitacion");

  return (
    <div className="flex flex-col gap-6">
      <div>
        <h1 className="text-2xl font-extrabold">Mi ruta</h1>
        <p className="text-sm text-muted">Avanzá nivel por nivel. Cada nivel se desbloquea al terminar el anterior.</p>
      </div>

      {niveles.length === 0 && capacitaciones.length === 0 && (
        <Card><p className="text-sm">Todavía no hay cursos publicados.</p></Card>
      )}

      <ul className="grid gap-4 sm:grid-cols-2" aria-label="Niveles">
        {niveles.map((n) => {
          const c = colorNivel(n.nivel_orden);
          const pct = porcentaje(n.items_cumplidos, n.items_total);
          const anterior = (n.nivel_orden ?? 1) - 1;
          return (
            <li key={n.curso_id}>
              {n.desbloqueado ? (
                <Link href={`/estudiar/${n.curso_id}`} className="flex h-full flex-col gap-3 rounded-3xl p-5 text-white" style={{ background: c.fondo }}>
                  <div className="flex items-center justify-between">
                    <span className="rounded-full bg-white/20 px-3 py-1 text-xs font-bold">NIVEL {n.nivel_orden}</span>
                    <span className="text-2xl font-extrabold">{n.cumplido ? "✓" : `${pct}%`}</span>
                  </div>
                  <h2 className="text-xl font-extrabold leading-tight">{n.titulo}</h2>
                  <div className="h-2 rounded bg-white/25"><div className="h-2 rounded bg-[#a5f3c4]" style={{ width: `${pct}%` }} /></div>
                  <p className="text-sm text-white/85">{n.cumplido ? "¡Nivel cumplido!" : `${n.items_cumplidos} de ${n.items_total} pasos`}</p>
                </Link>
              ) : (
                <div className="flex h-full flex-col gap-3 rounded-3xl bg-[#f1f1f6] p-5 text-muted">
                  <div className="flex items-center justify-between">
                    <span className="rounded-full bg-white px-3 py-1 text-xs font-bold">NIVEL {n.nivel_orden}</span>
                    <Candado />
                  </div>
                  <h2 className="text-xl font-extrabold leading-tight text-[#3f3f55]">{n.titulo}</h2>
                  <p className="text-sm">Completá el Nivel {anterior} para desbloquearlo.</p>
                </div>
              )}
            </li>
          );
        })}
      </ul>

      {capacitaciones.length > 0 && (
        <section className="flex flex-col gap-3" aria-label="Capacitaciones de tu puesto">
          <h2 className="text-lg font-extrabold">Capacitaciones de tu puesto</h2>
          <ul className="flex flex-col gap-3">
            {capacitaciones.map((cap) => {
              const pct = porcentaje(cap.items_cumplidos, cap.items_total);
              return (
                <li key={cap.curso_id}>
                  <Link href={`/estudiar/${cap.curso_id}`} className="flex items-center gap-4 rounded-2xl bg-card p-4 shadow-[var(--shadow-suave)]">
                    <span aria-hidden="true" className="flex size-12 shrink-0 items-center justify-center rounded-2xl bg-primary-soft text-sm font-extrabold text-primary-strong">
                      {cap.cumplido ? "✓" : `${pct}%`}
                    </span>
                    <span className="min-w-0 flex-1">
                      <span className="block font-bold">{cap.titulo}</span>
                      <span className="text-[13px] text-muted">{cap.obligatorio ? "Obligatoria" : "Opcional"} · {cap.items_cumplidos} de {cap.items_total} pasos</span>
                    </span>
                  </Link>
                </li>
              );
            })}
          </ul>
        </section>
      )}
    </div>
  );
}
