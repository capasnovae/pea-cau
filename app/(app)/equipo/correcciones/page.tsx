import Link from "next/link";
import { Card } from "@/components/ui/card";
import { formatearFecha } from "@/lib/dominio/contenido";
import { ROLES_GESTION } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { cn } from "@/lib/utils/cn";
import { soltar, tomar } from "./acciones";

export default async function PaginaCorrecciones({ searchParams }: PageProps<"/equipo/correcciones">) {
  await requerirRol([...ROLES_GESTION]);
  const { error, cerrada } = await searchParams;
  const supabase = await crearClienteServidor();
  const { data } = await supabase.rpc("cola_correccion");
  const cola = data ?? [];
  return (
    <div className="flex flex-col gap-4">
      <h1 className="text-h1">Correcciones</h1>
      {typeof error === "string" && (
        <p role="alert" className="rounded-2xl bg-warning-soft p-3 font-semibold text-warning">
          {error}
        </p>
      )}
      {cerrada && (
        <p role="status" className="font-semibold text-success">
          Corrección cerrada.
        </p>
      )}
      {cola.length === 0 ? (
        <Card>
          <p className="text-sm text-muted">Sin correcciones pendientes.</p>
        </Card>
      ) : (
        <Card className="p-0!">
          <ul aria-label="Cola de corrección">
            {cola.map((c) => (
              <li
                key={c.intento_id}
                className="flex flex-wrap items-center gap-3 border-t border-border px-5 py-3.5 first:border-t-0"
              >
                <span className="min-w-0 flex-1">
                  <span className="block font-bold">{c.examen_titulo}</span>
                  <span className="block text-[13px] text-muted">
                    {c.asesor} · entregado {formatearFecha(c.entregado_at)}
                    {c.tomado_por && !c.tomado_por_mi ? ` · lo corrige ${c.tomado_por}` : ""}
                  </span>
                </span>
                <span className={cn("text-sm font-bold", c.vencida ? "text-destructive" : "text-muted")}>
                  {c.vencida ? "Vencida" : `Plazo ${formatearFecha(c.correccion_vence_at)}`}
                </span>
                {c.tomado_por_mi ? (
                  <span className="flex gap-2">
                    <Link
                      href={`/equipo/correcciones/${c.intento_id}`}
                      className="rounded-xl bg-primary px-4 py-2 text-sm font-bold text-white"
                    >
                      Seguir
                    </Link>
                    <form action={soltar.bind(null, c.intento_id)}>
                      <button
                        type="submit"
                        className="rounded-xl border border-border px-4 py-2 text-sm font-bold"
                      >
                        Soltar
                      </button>
                    </form>
                  </span>
                ) : (
                  !c.tomado_por && (
                    <form action={tomar.bind(null, c.intento_id)}>
                      <button
                        type="submit"
                        className="rounded-xl bg-primary px-4 py-2 text-sm font-bold text-white"
                      >
                        Tomar
                      </button>
                    </form>
                  )
                )}
              </li>
            ))}
          </ul>
        </Card>
      )}
    </div>
  );
}
