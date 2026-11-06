import { notFound, redirect } from "next/navigation";
import type { PreguntaRender, Valor } from "@/components/examen/controles";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { Rendir } from "./rendir";

export default async function PaginaIntento({ params }: PageProps<"/examenes/intento/[id]">) {
  const perfil = await requerirPerfil();
  const { id } = await params;
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const supabase = await crearClienteServidor();
  await supabase.rpc("entregar_vencidos");
  const { data: intento } = await supabase
    .from("intentos")
    .select("id, estado, vence_at, usuario_id, examenes(titulo)")
    .eq("id", id)
    .maybeSingle();
  if (!intento || intento.usuario_id !== perfil.id) notFound();
  if (intento.estado !== "en_curso") redirect(`/examenes/intento/${id}/resultado`);
  const { data: filas } = await supabase.rpc("preguntas_intento", { p_intento: id });
  const preguntas = (filas ?? []).map(({ respuesta: _, ...p }) => p as unknown as PreguntaRender);
  const respuestas: Record<string, Valor> = Object.fromEntries(
    (filas ?? []).filter((f) => f.respuesta).map((f) => [f.pregunta_id, f.respuesta as Valor]),
  );

  return (
    <Rendir
      intentoId={id}
      titulo={intento.examenes?.titulo ?? "Examen"}
      venceAt={intento.vence_at}
      preguntas={preguntas}
      iniciales={respuestas}
    />
  );
}
