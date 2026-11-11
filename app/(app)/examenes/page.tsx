import Link from "next/link";
import { COLOR_ESTADO } from "@/components/examen/estado";
import { Card } from "@/components/ui/card";
import {
  ETIQUETA_ESTADO_EXAMEN,
  ETIQUETA_TIPO_EXAMEN,
  estadoExamen,
  mensajeDeCodigo,
} from "@/lib/dominio/examenes";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { cn } from "@/lib/utils/cn";
import { empezarUbicacion } from "./acciones";

export default async function PaginaExamenes({ searchParams }: PageProps<"/examenes">) {
  await requerirPerfil();
  const { error } = await searchParams;
  const supabase = await crearClienteServidor();
  await supabase.rpc("entregar_vencidos");
  const [{ data: examenes }, { data: ubicacion }] = await Promise.all([
    supabase.rpc("mis_examenes"),
    supabase.rpc("estado_ubicacion").maybeSingle(),
  ]);
  const lista = examenes ?? [];
  const aviso = mensajeDeCodigo(typeof error === "string" ? error : undefined);

  return (
    <div className="flex flex-col gap-5">
      <h1 className="text-h1 md:text-[32px]">Exámenes</h1>
      {aviso && (
        <p role="alert" className="rounded-2xl bg-warning-soft p-4 font-semibold text-warning">
          {aviso}
        </p>
      )}

      {ubicacion?.habilitada && !ubicacion.rendida && (
        <section
          aria-label="Examen de ubicación"
          className="flex flex-wrap items-center gap-4 rounded-3xl bg-nav p-5 text-white"
        >
          <div className="min-w-0 flex-1">
            <p className="text-xs font-bold uppercase text-nav-fg-muted">Examen de ubicación</p>
            <p className="text-xl font-extrabold">
              {ubicacion.intento_en_curso
                ? "Seguí donde quedaste"
                : `Bloque ${ubicacion.bloque_actual} de ${ubicacion.total_bloques}`}
            </p>
          </div>
          {ubicacion.intento_en_curso ? (
            <Link
              href={`/examenes/intento/${ubicacion.intento_en_curso}`}
              className="rounded-2xl bg-white px-5 py-3 font-extrabold text-nav"
            >
              Continuar
            </Link>
          ) : (
            <form action={empezarUbicacion}>
              <button type="submit" className="rounded-2xl bg-white px-5 py-3 font-extrabold text-nav">
                Empezar
              </button>
            </form>
          )}
        </section>
      )}

      {lista.length === 0 ? (
        <Card>
          <p className="text-sm text-muted">Sin exámenes por ahora.</p>
        </Card>
      ) : (
        <Card className="p-0!">
          <ul aria-label="Exámenes">
            {lista.map((e) => {
              const estado = estadoExamen({
                aprobado: e.aprobado,
                en_curso: Boolean(e.intento_en_curso),
                pendiente: Boolean(e.intento_pendiente),
                intentos_restantes: e.intentos_restantes,
                espera_hasta: e.espera_hasta,
              });
              return (
                <li key={e.examen_id} className="border-t border-border first:border-t-0">
                  <Link href={`/examenes/${e.examen_id}`} className="flex items-center gap-3 px-5 py-4">
                    <span className="min-w-0 flex-1">
                      <span className="block font-bold">{e.titulo}</span>
                      <span className="block text-[13px] text-muted">
                        {ETIQUETA_TIPO_EXAMEN[e.tipo]}
                        {e.curso_titulo ? ` · ${e.curso_titulo}` : ""}
                        {e.mejor_nota !== null ? ` · mejor nota ${e.mejor_nota}` : ""}
                      </span>
                    </span>
                    <span
                      className={cn(
                        "shrink-0 rounded-full px-2.5 py-1 text-xs font-bold",
                        COLOR_ESTADO[estado],
                      )}
                    >
                      {ETIQUETA_ESTADO_EXAMEN[estado]}
                    </span>
                  </Link>
                </li>
              );
            })}
          </ul>
        </Card>
      )}
    </div>
  );
}
