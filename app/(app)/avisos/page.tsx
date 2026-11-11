import Link from "next/link";
import { Card } from "@/components/ui/card";
import { Icono } from "@/components/ui/icono";
import { Vacio } from "@/components/ui/vacio";
import { formatearFecha } from "@/lib/dominio/contenido";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { cn } from "@/lib/utils/cn";
import { marcarTodoLeido } from "./acciones";

export default async function PaginaAvisos() {
  await requerirPerfil();
  const supabase = await crearClienteServidor();
  const { data } = await supabase
    .from("alertas")
    .select("id, titulo, mensaje, enlace, leida_at, created_at")
    .order("created_at", { ascending: false })
    .limit(100);
  const avisos = data ?? [];
  const hayNuevos = avisos.some((a) => !a.leida_at);
  return (
    <div className="flex flex-col gap-4">
      <div className="flex items-center justify-between gap-3">
        <h1 className="text-h1">Avisos</h1>
        <div className="flex items-center gap-1">
          {hayNuevos && (
            <form action={marcarTodoLeido}>
              <button
                type="submit"
                className="inline-flex min-h-11 items-center gap-1.5 rounded-campo px-2 text-sm font-semibold text-primary-strong transition-colors hover:bg-primary-soft"
              >
                <Icono nombre="tilde" tamano={16} />
                Marcar todo como leído
              </button>
            </form>
          )}
          <Link
            href="/actualizaciones"
            className="inline-flex min-h-11 items-center rounded-campo px-2 text-sm font-semibold text-primary-strong transition-colors hover:bg-primary-soft"
          >
            Actualizaciones
          </Link>
        </div>
      </div>
      <Card className="p-0!">
        {avisos.length === 0 ? (
          <Vacio icono="campana" texto="Sin avisos." />
        ) : (
          <ul aria-label="Avisos">
            {avisos.map((a) => {
              const cuerpo = (
                <span className="flex items-start gap-3">
                  <span
                    className={cn(
                      "mt-0.5 flex size-9 shrink-0 items-center justify-center rounded-full",
                      a.leida_at ? "bg-surface-2 text-subtle" : "bg-primary-soft text-primary-strong",
                    )}
                  >
                    <Icono nombre="campana" tamano={16} />
                  </span>
                  <span className="min-w-0 flex-1">
                    <span className="flex items-baseline justify-between gap-3">
                      <span className={a.leida_at ? "font-semibold" : "font-bold"}>{a.titulo}</span>
                      <span className="shrink-0 text-xs text-muted">{formatearFecha(a.created_at)}</span>
                    </span>
                    {a.mensaje && <span className="block text-sm text-muted">{a.mensaje}</span>}
                  </span>
                  {!a.leida_at && (
                    <span
                      aria-label="Sin leer"
                      role="img"
                      className="mt-2 size-2 shrink-0 rounded-full bg-primary"
                    />
                  )}
                </span>
              );
              return (
                <li
                  key={a.id}
                  className={cn(
                    "border-t border-border transition-colors first:border-t-0 hover:bg-surface-2",
                  )}
                >
                  {a.enlace ? (
                    <Link href={a.enlace} className="block px-5 py-3.5">
                      {cuerpo}
                    </Link>
                  ) : (
                    <div className="px-5 py-3.5">{cuerpo}</div>
                  )}
                </li>
              );
            })}
          </ul>
        )}
      </Card>
    </div>
  );
}
