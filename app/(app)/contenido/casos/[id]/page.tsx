import Link from "next/link";
import { notFound } from "next/navigation";
import { Card } from "@/components/ui/card";
import { cargarOpcionesExamenes } from "@/lib/contenido/opciones-examenes";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioCaso } from "../formulario";

export default async function PaginaCaso({ params }: PageProps<"/contenido/casos/[id]">) {
  const perfil = await requerirRol([...ROLES_EDITORES]);
  const { id } = await params;
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const supabase = await crearClienteServidor();
  const [{ data: caso }, opciones] = await Promise.all([
    supabase
      .from("casos")
      .select(
        "id, titulo, contexto_md, categoria_id, alcance, sede_id, estado, preguntas(id, enunciado_md, orden_en_caso, estado)",
      )
      .eq("id", id)
      .maybeSingle(),
    cargarOpcionesExamenes(perfil),
  ]);
  if (!caso) notFound();
  const preguntas = [...caso.preguntas].sort((a, b) => (a.orden_en_caso ?? 0) - (b.orden_en_caso ?? 0));
  return (
    <div className="mx-auto flex w-full max-w-3xl flex-col gap-4">
      <Link href="/contenido/casos" className="text-sm font-semibold text-primary-strong">
        ‹ Casos
      </Link>
      <h1 className="text-h1">{caso.titulo}</h1>
      <Card>
        <FormularioCaso
          caso={caso}
          alcances={opciones.alcances}
          sedes={opciones.sedes}
          categorias={opciones.categorias}
        />
      </Card>
      <section aria-label="Preguntas del caso" className="flex flex-col gap-2">
        <div className="flex items-center justify-between">
          <h2 className="text-lg font-extrabold">Preguntas en orden</h2>
          <Link
            href={`/contenido/preguntas/nueva?caso=${caso.id}`}
            className="text-sm font-bold text-primary-strong"
          >
            + Pregunta
          </Link>
        </div>
        <Card className="p-0!">
          {preguntas.length === 0 ? (
            <p className="p-5 text-sm text-muted">Sin preguntas.</p>
          ) : (
            <ol>
              {preguntas.map((p) => (
                <li key={p.id} className="border-t border-border first:border-t-0">
                  <Link href={`/contenido/preguntas/${p.id}`} className="flex gap-3 px-5 py-3.5">
                    <span className="font-extrabold text-primary-strong">{p.orden_en_caso}</span>
                    <span className="flex-1">{p.enunciado_md}</span>
                  </Link>
                </li>
              ))}
            </ol>
          )}
        </Card>
      </section>
    </div>
  );
}
