import Link from "next/link";
import { notFound } from "next/navigation";
import { Card } from "@/components/ui/card";
import { cargarOpcionesExamenes } from "@/lib/contenido/opciones-examenes";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioPregunta, type PreguntaEditable } from "../formulario";

type Campo = { id: string; etiqueta: string; tipo: "texto" | "select"; opciones?: string[] };

export default async function PaginaPregunta({
  params,
  searchParams,
}: PageProps<"/contenido/preguntas/[id]">) {
  const perfil = await requerirRol([...ROLES_EDITORES]);
  const { id } = await params;
  const { caso, creada } = await searchParams;
  const nueva = id === "nueva";
  if (!nueva && !/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const supabase = await crearClienteServidor();
  const opciones = await cargarOpcionesExamenes(perfil);

  let pregunta: PreguntaEditable | undefined;
  if (!nueva) {
    const { data } = await supabase
      .from("preguntas")
      .select(
        "id, tipo, enunciado_md, contexto_md, explicacion_md, rubrica_md, puntaje_max, dificultad, caso_id, orden_en_caso, modulo_id, categoria_id, articulo_fuente_id, alcance, sede_id, estado, uso, config, solucion, opciones(texto, es_correcta, posicion_correcta, grupo, orden)",
      )
      .eq("id", id)
      .maybeSingle();
    if (!data) notFound();
    const config = (data.config ?? {}) as { columnas?: string[]; campos?: Campo[] };
    const solucion = (data.solucion ?? {}) as Record<string, string[]>;
    pregunta = {
      ...data,
      opciones: [...data.opciones]
        .sort((a, b) => (a.posicion_correcta ?? a.orden) - (b.posicion_correcta ?? b.orden))
        .map((o) => ({ texto: o.texto, es_correcta: o.es_correcta, grupo: o.grupo ?? "" })),
      columnas: config.columnas ?? [],
      campos: (config.campos ?? []).map((c) => ({
        ...c,
        opciones: c.opciones ?? [],
        aceptadas: solucion[c.id] ?? [],
      })),
    };
  }

  return (
    <div className="mx-auto flex w-full max-w-3xl flex-col gap-4">
      <Link href="/contenido/preguntas" className="text-sm font-semibold text-primary-strong">
        ‹ Preguntas
      </Link>
      <h1 className="text-2xl font-extrabold">{nueva ? "Nueva pregunta" : "Editar pregunta"}</h1>
      {creada && (
        <p role="status" className="text-sm font-semibold text-success">
          Pregunta creada.
        </p>
      )}
      <Card>
        <FormularioPregunta
          pregunta={pregunta}
          casoInicial={typeof caso === "string" ? caso : undefined}
          {...opciones}
        />
      </Card>
    </div>
  );
}
