import { Icono } from "@/components/ui/icono";
import Link from "next/link";
import { notFound } from "next/navigation";
import { parseFiltro, puedeAnunciar } from "@/lib/dominio/bandeja";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { cn } from "@/lib/utils/cn";
import { archivar } from "../acciones";
import { FormularioRespuesta } from "../formularios";
import { MarcoBandeja } from "../lista";
import { Refrescar } from "./refrescar";

const FORMATO = new Intl.DateTimeFormat("es-AR", {
  day: "numeric",
  month: "numeric",
  hour: "2-digit",
  minute: "2-digit",
  hour12: false,
  timeZone: "America/Argentina/Buenos_Aires",
});

export default async function PaginaConversacion({ params, searchParams }: PageProps<"/bandeja/[id]">) {
  const perfil = await requerirPerfil();
  const { id } = await params;
  const { filtro } = await searchParams;
  const supabase = await crearClienteServidor();
  const { data: conv } = await supabase
    .from("conversaciones")
    .select("id, asunto, es_anuncio, creada_por, conversacion_participantes(usuario_id, archivada)")
    .eq("id", id)
    .maybeSingle();
  if (!conv) notFound();
  const { data: antes } = await supabase.rpc("mensajes_sin_leer");
  await supabase.rpc("marcar_leida", { p_conversacion: id });
  const { data: despues } = await supabase.rpc("mensajes_sin_leer");
  const [{ data: mensajes }, { data: participantes }] = await Promise.all([
    supabase.rpc("mensajes_de", { p_conversacion: id }),
    conv.es_anuncio
      ? Promise.resolve({ data: [] })
      : supabase.rpc("participantes_de", { p_conversacion: id }),
  ]);
  const archivada =
    conv.conversacion_participantes.find((p) => p.usuario_id === perfil.id)?.archivada ?? false;
  const puedeResponder = !conv.es_anuncio || conv.creada_por === perfil.id;
  const otros = (participantes ?? []).filter((p) => p.id !== perfil.id).map((p) => p.nombre);

  return (
    <MarcoBandeja
      filtro={parseFiltro(typeof filtro === "string" ? filtro : undefined)}
      actual={id}
      puedeAnunciar={puedeAnunciar(perfil.rol)}
    >
      <div className="flex items-start gap-3 border-b border-border bg-card px-4 py-3 md:px-6">
        <Link
          href="/bandeja"
          className="inline-flex items-center gap-1 pt-1 text-sm font-semibold text-primary-strong md:hidden"
        >
          <Icono nombre="chevron-izq" tamano={16} />
          Bandeja
        </Link>
        <div className="min-w-0 flex-1">
          <h2 className="truncate text-h2">{conv.asunto}</h2>
          {otros.length > 0 && <p className="truncate text-[13px] text-muted">{otros.join(", ")}</p>}
        </div>
        <form action={archivar.bind(null, id, !archivada)}>
          <button
            type="submit"
            className="flex h-10 items-center rounded-xl border border-border px-3 text-sm font-bold"
          >
            {archivada ? "Desarchivar" : "Archivar"}
          </button>
        </form>
      </div>
      <ol aria-label="Mensajes" className="flex flex-1 flex-col gap-3 overflow-y-auto p-4 md:p-6">
        {(mensajes ?? []).map((m) => (
          <li
            key={m.id}
            className={cn("flex max-w-[85%] flex-col gap-1", m.propio ? "self-end items-end" : "self-start")}
          >
            <span className="text-xs text-muted">
              {m.propio ? "Vos" : m.autor} · {FORMATO.format(new Date(m.created_at))}
            </span>
            <p
              className={cn(
                "whitespace-pre-wrap rounded-2xl px-4 py-2.5 text-[15px]",
                m.propio ? "bg-primary-soft" : "bg-card shadow-1",
              )}
            >
              {m.cuerpo}
            </p>
          </li>
        ))}
      </ol>
      {puedeResponder && <FormularioRespuesta conversacion={id} />}
      {antes !== despues && <Refrescar />}
    </MarcoBandeja>
  );
}
