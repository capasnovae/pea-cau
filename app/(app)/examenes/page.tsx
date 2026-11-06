import { etiquetaTipo } from "@/components/tablero/tarjeta-curso";
import { Card } from "@/components/ui/card";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function PaginaExamenes() {
  await requerirPerfil();
  const supabase = await crearClienteServidor();
  const { data: ruta } = await supabase.rpc("mi_ruta");
  const cursos = ruta ?? [];
  const estados = await Promise.all(cursos.map((c) => supabase.rpc("estado_curso", { p_curso: c.curso_id })));
  const examenes = cursos.flatMap((c, i) =>
    (estados[i]?.data ?? []).filter((it) => it.tipo === "examen").map((it) => ({ curso: c, item: it })),
  );

  return (
    <div className="flex flex-col gap-5">
      <h1 className="text-2xl font-extrabold md:text-[32px]">Exámenes</h1>
      {examenes.length === 0 ? (
        <Card>
          <p className="text-sm text-muted">Sin exámenes por ahora.</p>
        </Card>
      ) : (
        <Card className="p-0!">
          <ul aria-label="Exámenes">
            {examenes.map(({ curso, item }) => (
              <li
                key={item.item_id}
                className="flex items-center gap-3 border-t border-border px-5 py-4 first:border-t-0"
              >
                <span className="min-w-0 flex-1">
                  <span className="block font-bold">{item.titulo}</span>
                  <span className="block text-[13px] text-muted">
                    {etiquetaTipo(curso)} · {item.modulo_titulo}
                  </span>
                </span>
                <span className="shrink-0 rounded-full bg-primary-soft px-2.5 py-1 text-xs font-bold text-primary-strong">
                  Próximamente
                </span>
              </li>
            ))}
          </ul>
        </Card>
      )}
    </div>
  );
}
