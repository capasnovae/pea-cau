import Link from "next/link";
import { Card } from "@/components/ui/card";
import { formatearFecha } from "@/lib/dominio/contenido";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function PaginaInicio() {
  const perfil = await requerirPerfil();
  const supabase = await crearClienteServidor();
  const { data: pendientes, count } = await supabase
    .from("consigna_asignaciones")
    .select("id, vence_el, consignas(titulo)", { count: "exact" })
    .eq("usuario_id", perfil.id)
    .in("estado", ["pendiente", "en_curso", "vencida"])
    .order("vence_el", { ascending: true, nullsFirst: false })
    .limit(3);

  return (
    <div className="flex flex-col gap-4">
      <h1 className="text-2xl font-semibold">Hola, {perfil.nombre}</h1>
      <Card>
        <div className="mb-2 flex items-baseline justify-between gap-2">
          <h2 className="font-semibold">Tus consignas pendientes</h2>
          <Link href="/consignas" className="text-sm text-primary">Ver todas</Link>
        </div>
        {(pendientes ?? []).length === 0 ? (
          <p className="text-sm text-muted">No tenés consignas pendientes.</p>
        ) : (
          <ul className="flex flex-col gap-1.5" aria-label="Consignas pendientes">
            {(pendientes ?? []).map((a) => (
              <li key={a.id} className="flex justify-between gap-2 text-sm">
                <Link href="/consignas" className="hover:text-primary">{a.consignas?.titulo}</Link>
                {a.vence_el && <span className="shrink-0 text-xs text-muted">vence {formatearFecha(a.vence_el)}</span>}
              </li>
            ))}
          </ul>
        )}
        {(count ?? 0) > 3 && <p className="mt-2 text-xs text-muted">Y {(count ?? 0) - 3} más.</p>}
      </Card>
      <Card>
        <p>Tu ruta de aprendizaje llega en la próxima etapa.</p>
      </Card>
    </div>
  );
}
