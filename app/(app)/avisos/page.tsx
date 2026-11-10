import Link from "next/link";
import { Card } from "@/components/ui/card";
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
        <h1 className="text-2xl font-extrabold">Avisos</h1>
        {hayNuevos && (
          <form action={marcarTodoLeido}>
            <button type="submit" className="text-sm font-semibold text-primary-strong">
              Marcar todo como leído
            </button>
          </form>
        )}
      </div>
      <Card className="p-0!">
        {avisos.length === 0 ? (
          <p className="p-5 text-sm text-muted">Sin avisos.</p>
        ) : (
          <ul aria-label="Avisos">
            {avisos.map((a) => {
              const cuerpo = (
                <>
                  <span className="flex items-baseline justify-between gap-3">
                    <span className="font-bold">{a.titulo}</span>
                    <span className="shrink-0 text-xs text-muted">{formatearFecha(a.created_at)}</span>
                  </span>
                  {a.mensaje && <span className="block text-sm text-muted">{a.mensaje}</span>}
                </>
              );
              return (
                <li
                  key={a.id}
                  className={cn(
                    "border-t border-border first:border-t-0",
                    !a.leida_at && "bg-primary-soft/40",
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
