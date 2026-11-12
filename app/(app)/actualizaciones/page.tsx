import Link from "next/link";
import { Card } from "@/components/ui/card";
import { estadoVisible } from "@/lib/dominio/actualizaciones";
import { formatearFecha } from "@/lib/dominio/contenido";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { EstadoChip } from "./estado";

export default async function PaginaActualizaciones() {
  const perfil = await requerirPerfil();
  const supabase = await crearClienteServidor();
  const { data } = await supabase
    .from("actualizacion_asignaciones")
    .select("id, estado, vence_at, actualizaciones(titulo)")
    .eq("usuario_id", perfil.id)
    .order("vence_at", { ascending: true });
  const ahora = new Date();
  return (
    <div className="flex flex-col gap-4">
      <h1 className="text-h1">Actualizaciones</h1>
      <Card className="p-0!">
        {(data ?? []).length === 0 ? (
          <p className="p-5 text-sm text-muted">Sin actualizaciones.</p>
        ) : (
          <ul aria-label="Actualizaciones">
            {(data ?? []).map((a) => (
              <li key={a.id} className="border-t border-border first:border-t-0">
                <Link href={`/actualizaciones/${a.id}`} className="flex items-center gap-3 px-5 py-3.5">
                  <span className="min-w-0 flex-1">
                    <span className="block font-bold">{a.actualizaciones?.titulo}</span>
                    <span className="block text-xs text-muted">Vence el {formatearFecha(a.vence_at)}</span>
                  </span>
                  <EstadoChip estado={estadoVisible(a.estado, a.vence_at, ahora)} />
                </Link>
              </li>
            ))}
          </ul>
        )}
      </Card>
    </div>
  );
}
