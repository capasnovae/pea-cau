import { Icono } from "@/components/ui/icono";
import Link from "next/link";
import { notFound } from "next/navigation";
import { COLOR_ESTADO } from "@/components/examen/estado";
import { Card } from "@/components/ui/card";
import { formatearFecha } from "@/lib/dominio/contenido";
import {
  ETIQUETA_ESTADO_EXAMEN,
  ETIQUETA_TIPO_EXAMEN,
  estadoExamen,
  mensajeDeCodigo,
} from "@/lib/dominio/examenes";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { cn } from "@/lib/utils/cn";
import { empezar } from "../acciones";

export default async function PaginaExamen({ params, searchParams }: PageProps<"/examenes/[id]">) {
  const perfil = await requerirPerfil();
  const { id } = await params;
  const { error } = await searchParams;
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const supabase = await crearClienteServidor();
  await supabase.rpc("entregar_vencidos");
  const [{ data: lista }, { data: intentos }] = await Promise.all([
    supabase.rpc("mis_examenes"),
    supabase
      .from("intentos")
      .select("id, estado, nota, aprobado, entregado_at, iniciado_at")
      .eq("examen_id", id)
      .eq("usuario_id", perfil.id)
      .order("iniciado_at", { ascending: false }),
  ]);
  const e = (lista ?? []).find((x) => x.examen_id === id);
  if (!e) notFound();
  const estado = estadoExamen({
    aprobado: e.aprobado,
    en_curso: Boolean(e.intento_en_curso),
    pendiente: Boolean(e.intento_pendiente),
    intentos_restantes: e.intentos_restantes,
    espera_hasta: e.espera_hasta,
  });
  const aviso = mensajeDeCodigo(typeof error === "string" ? error : undefined);
  const datos = [
    { etiqueta: "Preguntas", valor: String(e.cantidad_preguntas), icono: "libro" as const },
    { etiqueta: "Para aprobar", valor: `${e.nota_minima}%`, icono: "medalla" as const },
    {
      etiqueta: "Tiempo",
      valor: e.tiempo_limite_min ? `${e.tiempo_limite_min} min` : "Libre",
      icono: "reloj" as const,
    },
    { etiqueta: "Intentos", valor: String(e.intentos_restantes), icono: "repetir" as const },
  ];

  return (
    <div className="mx-auto flex w-full max-w-3xl flex-col gap-5">
      <Link
        href="/examenes"
        className="inline-flex items-center gap-1 text-sm font-semibold text-primary-strong"
      >
        <Icono nombre="chevron-izq" tamano={16} />
        Exámenes
      </Link>
      <section aria-label="Portada" className="flex flex-col gap-5 rounded-hoja bg-card p-6 shadow-2 md:p-8">
        <div className="flex flex-wrap items-start justify-between gap-3">
          <div className="min-w-0">
            <p className="text-overline uppercase text-muted">
              {ETIQUETA_TIPO_EXAMEN[e.tipo]}
              {e.curso_titulo ? ` · ${e.curso_titulo}` : ""}
            </p>
            <h1 className="text-h1 md:text-[32px]">{e.titulo}</h1>
          </div>
          <span className={cn("rounded-full px-3 py-1.5 text-sm font-bold", COLOR_ESTADO[estado])}>
            {ETIQUETA_ESTADO_EXAMEN[estado]}
          </span>
        </div>
        <dl className="grid grid-cols-2 gap-x-4 gap-y-4 border-y border-border py-4 sm:grid-cols-4">
          {datos.map((d) => (
            <div key={d.etiqueta} className="flex items-center gap-3">
              <span className="flex size-10 shrink-0 items-center justify-center rounded-full bg-primary-soft text-primary-strong">
                <Icono nombre={d.icono} />
              </span>
              <span className="flex flex-col-reverse">
                <dt className="text-caption text-muted">{d.etiqueta}</dt>
                <dd className="cifras text-h3">{d.valor}</dd>
              </span>
            </div>
          ))}
        </dl>
        {aviso && (
          <p role="alert" className="rounded-boton bg-warning-soft p-4 font-semibold text-warning">
            {aviso}
          </p>
        )}
        {estado === "en_curso" && e.intento_en_curso && (
          <Link
            href={`/examenes/intento/${e.intento_en_curso}`}
            className="flex min-h-13 w-full items-center justify-center gap-2 rounded-boton bg-primary font-bold text-primary-foreground shadow-brand transition hover:bg-primary-strong active:scale-[0.98] md:w-80"
          >
            Continuar
            <Icono nombre="flecha-der" />
          </Link>
        )}
        {estado === "disponible" && (
          <form action={empezar.bind(null, e.examen_id)}>
            <button
              type="submit"
              className="flex min-h-13 w-full items-center justify-center gap-2 rounded-boton bg-primary font-bold text-primary-foreground shadow-brand transition hover:bg-primary-strong active:scale-[0.98] md:w-80"
            >
              Empezar
              <Icono nombre="flecha-der" />
            </button>
          </form>
        )}
        {estado === "en_espera" && e.espera_hasta && (
          <p className="inline-flex items-center gap-2 rounded-boton bg-surface-2 p-4 font-semibold text-muted">
            <Icono nombre="reloj" />
            Podés volver a intentarlo el {formatearFecha(e.espera_hasta)}.
          </p>
        )}
      </section>

      {(intentos ?? []).some((i) => i.estado !== "en_curso") && (
        <section aria-label="Tus intentos" className="flex flex-col gap-2">
          <h2 className="text-h2">Tus intentos</h2>
          <Card className="p-0!">
            <ul>
              {(intentos ?? [])
                .filter((i) => i.estado !== "en_curso")
                .map((i) => (
                  <li key={i.id} className="border-t border-border first:border-t-0">
                    <Link
                      href={`/examenes/intento/${i.id}/resultado`}
                      className="flex min-h-14 items-center justify-between gap-3 px-5 py-3.5 transition-colors hover:bg-surface-2"
                    >
                      <span>{i.entregado_at ? formatearFecha(i.entregado_at) : "—"}</span>
                      <span
                        className={cn(
                          "font-bold",
                          i.aprobado
                            ? "text-success"
                            : i.estado === "cerrado"
                              ? "text-destructive"
                              : "text-warning",
                        )}
                      >
                        {i.estado === "cerrado" ? `${i.nota}%` : "Pendiente de corrección"}
                      </span>
                    </Link>
                  </li>
                ))}
            </ul>
          </Card>
        </section>
      )}
    </div>
  );
}
