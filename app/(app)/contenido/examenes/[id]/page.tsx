import Link from "next/link";
import { notFound } from "next/navigation";
import { BotonPromover } from "@/components/contenido/boton-promover";
import { Card } from "@/components/ui/card";
import { cargarOpcionesExamenes } from "@/lib/contenido/opciones-examenes";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioExamen, type ExamenEditable } from "../formulario";

export default async function PaginaEditarExamen({
  params,
  searchParams,
}: PageProps<"/contenido/examenes/[id]">) {
  const perfil = await requerirRol([...ROLES_EDITORES]);
  const { id } = await params;
  const { creado } = await searchParams;
  const nuevo = id === "nuevo";
  if (!nuevo && !/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const supabase = await crearClienteServidor();
  const opciones = await cargarOpcionesExamenes(perfil);
  let examen: ExamenEditable | undefined;
  let pozo: number | null = null;
  if (!nuevo) {
    const { data } = await supabase
      .from("examenes")
      .select(
        "id, titulo, tipo, modulo_id, categoria_id, curso_id, cantidad_preguntas, nota_minima, max_intentos, espera_horas, tiempo_limite_min, mezclar, alcance, sede_id, estado, examen_fuentes(modulo_id, categoria_id, curso_id, cantidad)",
      )
      .eq("id", id)
      .maybeSingle();
    if (!data) notFound();
    const { examen_fuentes, ...resto } = data;
    examen = { ...resto, fuentes: examen_fuentes };
    pozo = (await supabase.rpc("contar_pozo", { p_examen: id })).data ?? null;
  }
  return (
    <div className="mx-auto flex w-full max-w-3xl flex-col gap-4">
      <Link href="/contenido/examenes" className="text-sm font-semibold text-primary-strong">
        ‹ Exámenes
      </Link>
      <div className="flex flex-wrap items-baseline justify-between gap-2">
        <h1 className="text-h1">{examen?.titulo ?? "Nuevo examen"}</h1>
        {pozo !== null && (
          <span className="text-sm font-semibold text-muted">{pozo} preguntas disponibles</span>
        )}
      </div>
      {creado && (
        <p role="status" className="text-sm font-semibold text-success">
          Examen creado.
        </p>
      )}
      <Card>
        <FormularioExamen examen={examen} {...opciones} />
      </Card>
      {examen && examen.alcance === "sede" && perfil.rol === "admin" && (
        <BotonPromover tabla="examenes" id={examen.id} />
      )}
    </div>
  );
}
