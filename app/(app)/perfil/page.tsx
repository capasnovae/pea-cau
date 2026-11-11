import Link from "next/link";
import { Avatar } from "@/components/nav/panel-cuenta";
import { Insignia } from "@/components/perfil/insignia";
import { Card } from "@/components/ui/card";
import {
  COLOR_ESTADO_CERT,
  ETIQUETA_ESTADO_CERT,
  estadoEfectivo,
  textoVencimiento,
} from "@/lib/dominio/certificados";
import { formatearFecha } from "@/lib/dominio/contenido";
import { colorNivel, porcentaje } from "@/lib/dominio/leccion";
import { ETIQUETA_ROL } from "@/lib/dominio/roles";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { cn } from "@/lib/utils/cn";
import { AvisosEmail } from "./avisos-email";
import { FormularioTelefono } from "./formulario-telefono";

function Seccion({
  titulo,
  id,
  accion,
  children,
}: {
  titulo: string;
  id?: string;
  accion?: React.ReactNode;
  children: React.ReactNode;
}) {
  return (
    <section id={id} aria-label={titulo} className="flex scroll-mt-6 flex-col gap-2.5">
      <div className="flex items-baseline justify-between">
        <h2 className="text-lg font-extrabold">{titulo}</h2>
        {accion}
      </div>
      {children}
    </section>
  );
}

export default async function PaginaPerfil() {
  const perfil = await requerirPerfil();
  const supabase = await crearClienteServidor();
  const ahora = new Date();
  const [
    { data: datos },
    { data: resumen },
    { data: insignias },
    { data: certificados },
    { data: intentos },
    { data: consignas },
  ] = await Promise.all([
    supabase
      .from("perfiles")
      .select(
        "avisos_email, sedes(nombre), equipos!perfiles_equipo_id_fkey(nombre), puestos(nombre), perfil_subroles(subroles(nombre))",
      )
      .eq("id", perfil.id)
      .maybeSingle(),
    supabase.rpc("mi_perfil_evolutivo").maybeSingle(),
    supabase
      .from("usuario_insignias")
      .select("id, otorgada_at, perdida_at, insignias(nombre, cursos(nivel_orden))")
      .eq("usuario_id", perfil.id),
    supabase
      .from("certificaciones")
      .select("id, origen, estado, emitida_at, vence_at, codigo_verificacion, cursos(nivel_orden, titulo)")
      .eq("usuario_id", perfil.id)
      .order("emitida_at", { ascending: false }),
    supabase
      .from("intentos")
      .select("id, estado, nota, aprobado, entregado_at, examenes(titulo)")
      .eq("usuario_id", perfil.id)
      .neq("estado", "en_curso")
      .order("entregado_at", { ascending: false })
      .limit(20),
    supabase
      .from("consigna_asignaciones")
      .select("id, vence_el, consignas(titulo)", { count: "exact" })
      .eq("usuario_id", perfil.id)
      .in("estado", ["pendiente", "en_curso", "vencida"])
      .order("vence_el", { ascending: true, nullsFirst: false })
      .limit(5),
  ]);
  const subroles = (datos?.perfil_subroles ?? [])
    .map((s) => s.subroles?.nombre)
    .filter(Boolean)
    .join(", ");
  const filas: [string, string][] = [
    ["Email", perfil.email],
    ["Rol en PEA", ETIQUETA_ROL[perfil.rol]],
    ["Sede", datos?.sedes?.nombre ?? "—"],
    ["Área", perfil.area === "servicio" ? "Servicio" : perfil.area === "ventas" ? "Ventas" : "—"],
    ["Equipo", datos?.equipos?.nombre ?? "—"],
    ["Puesto", datos?.puestos?.nombre ?? "—"],
    ["Subroles", subroles || "—"],
  ];
  const nivel = resumen?.nivel_actual ?? null;
  const color = colorNivel(nivel);
  const pct = porcentaje(resumen?.cursos_cumplidos ?? 0, resumen?.cursos_total ?? 0);
  const listaInsignias = [...(insignias ?? [])].sort(
    (a, b) =>
      Number(Boolean(a.perdida_at)) - Number(Boolean(b.perdida_at)) ||
      (a.insignias?.cursos?.nivel_orden ?? 0) - (b.insignias?.cursos?.nivel_orden ?? 0),
  );

  return (
    <div className="flex flex-col gap-6">
      <div className="flex flex-wrap items-center gap-4">
        <Avatar nombre={perfil.nombre} className="size-16 text-2xl" />
        <div className="min-w-0 flex-1">
          <h1 className="text-h1 md:text-[32px]">
            {perfil.nombre} {perfil.apellido}
          </h1>
          <p className="text-sm text-muted">
            {ETIQUETA_ROL[perfil.rol]}
            {datos?.sedes?.nombre ? ` · ${datos.sedes.nombre}` : ""}
          </p>
        </div>
        {nivel !== null && (
          <span
            className="rounded-full px-4 py-2 font-extrabold text-white"
            style={{ background: color.fondo }}
          >
            Nivel {nivel}
            {resumen?.nivel_titulo ? ` · ${resumen.nivel_titulo}` : ""}
          </span>
        )}
      </div>

      <div className="grid gap-6 lg:grid-cols-[minmax(0,1.3fr)_minmax(0,1fr)]">
        <div className="flex flex-col gap-6">
          <Seccion titulo="Mi ruta">
            <Card className="flex flex-col gap-2">
              <div className="flex items-baseline justify-between">
                <span className="font-bold">Cursos obligatorios</span>
                <span className="text-h1">{pct}%</span>
              </div>
              <div
                className="h-2.5 overflow-hidden rounded-full bg-background"
                aria-label={`${pct}% de la ruta`}
                role="img"
              >
                <div className="h-full rounded-full" style={{ width: `${pct}%`, background: color.fondo }} />
              </div>
              <p className="text-xs text-muted">
                {resumen?.cursos_cumplidos ?? 0} de {resumen?.cursos_total ?? 0}
              </p>
            </Card>
          </Seccion>

          <Seccion titulo="Insignias" id="insignias">
            <Card>
              {listaInsignias.length === 0 ? (
                <p className="text-sm text-muted">Sin insignias todavía.</p>
              ) : (
                <ul aria-label="Insignias" className="grid grid-cols-3 gap-4 sm:grid-cols-4">
                  {listaInsignias.map((i) => (
                    <li key={i.id}>
                      <Insignia
                        nivel={i.insignias?.cursos?.nivel_orden ?? 0}
                        nombre={i.insignias?.nombre ?? ""}
                        perdida={Boolean(i.perdida_at)}
                      />
                    </li>
                  ))}
                </ul>
              )}
            </Card>
          </Seccion>

          <Seccion titulo="Certificados">
            <Card className="p-0!">
              {(certificados ?? []).length === 0 ? (
                <p className="p-5 text-sm text-muted">Sin certificados todavía.</p>
              ) : (
                <ul aria-label="Certificados">
                  {(certificados ?? []).map((c) => {
                    const estado = estadoEfectivo(c.estado, c.vence_at, ahora);
                    return (
                      <li
                        key={c.id}
                        className="flex flex-wrap items-center gap-3 border-t border-border px-5 py-3.5 first:border-t-0"
                      >
                        <span className="min-w-0 flex-1">
                          <span className="block font-bold">
                            Nivel {c.cursos?.nivel_orden} · {c.cursos?.titulo}
                          </span>
                          <span className="block text-[13px] text-muted">
                            {c.origen === "ubicacion"
                              ? "Acreditado por ubicación"
                              : `Emitido el ${formatearFecha(c.emitida_at)}`}{" "}
                            · {textoVencimiento(c.vence_at)}
                          </span>
                        </span>
                        <span
                          className={cn(
                            "rounded-full px-2.5 py-1 text-xs font-bold",
                            COLOR_ESTADO_CERT[estado],
                          )}
                        >
                          {ETIQUETA_ESTADO_CERT[estado]}
                        </span>
                        {c.origen === "examen" && estado !== "revocada" && (
                          <a
                            href={`/certificados/${c.id}/pdf`}
                            className="rounded-xl bg-primary px-3 py-2 text-sm font-bold text-white"
                          >
                            PDF
                          </a>
                        )}
                        <Link
                          href={`/verificar/${c.codigo_verificacion}`}
                          target="_blank"
                          className="text-sm font-bold text-primary-strong"
                        >
                          Verificar
                        </Link>
                      </li>
                    );
                  })}
                </ul>
              )}
            </Card>
          </Seccion>
        </div>

        <div className="flex flex-col gap-6">
          <Seccion
            titulo="Exámenes"
            accion={
              <Link href="/examenes" className="text-sm font-semibold text-primary-strong">
                Ver todos
              </Link>
            }
          >
            <Card className="p-0!">
              {(intentos ?? []).length === 0 ? (
                <p className="p-5 text-sm text-muted">Sin exámenes rendidos.</p>
              ) : (
                <ul aria-label="Historial de exámenes">
                  {(intentos ?? []).map((i) => (
                    <li key={i.id} className="border-t border-border first:border-t-0">
                      <Link
                        href={`/examenes/intento/${i.id}/resultado`}
                        className="flex items-center gap-3 px-5 py-3"
                      >
                        <span className="min-w-0 flex-1">
                          <span className="block truncate font-semibold">{i.examenes?.titulo}</span>
                          <span className="block text-xs text-muted">
                            {i.entregado_at ? formatearFecha(i.entregado_at) : ""}
                          </span>
                        </span>
                        <span
                          className={cn(
                            "shrink-0 rounded-full px-2.5 py-1 text-xs font-bold",
                            i.estado !== "cerrado"
                              ? "bg-warning-soft text-warning"
                              : i.aprobado
                                ? "bg-success-soft text-success"
                                : "bg-destructive-soft text-destructive",
                          )}
                        >
                          {i.estado !== "cerrado" ? "Pendiente" : `${i.nota}%`}
                        </span>
                      </Link>
                    </li>
                  ))}
                </ul>
              )}
            </Card>
          </Seccion>

          <Seccion
            titulo="Consignas pendientes"
            accion={
              <Link href="/consignas" className="text-sm font-semibold text-primary-strong">
                Ver todas
              </Link>
            }
          >
            <Card className="p-0!">
              {(consignas ?? []).length === 0 ? (
                <p className="p-5 text-sm text-muted">Sin consignas pendientes.</p>
              ) : (
                <ul>
                  {(consignas ?? []).map((a) => (
                    <li
                      key={a.id}
                      className="flex justify-between gap-3 border-t border-border px-5 py-3 first:border-t-0"
                    >
                      <span className="truncate font-semibold">{a.consignas?.titulo}</span>
                      {a.vence_el && (
                        <span className="shrink-0 text-xs text-muted">{formatearFecha(a.vence_el)}</span>
                      )}
                    </li>
                  ))}
                </ul>
              )}
            </Card>
          </Seccion>

          <Seccion titulo="Datos">
            <Card>
              <dl className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-2 text-sm">
                {filas.map(([k, v]) => (
                  <div key={k} className="contents">
                    <dt className="text-muted">{k}</dt>
                    <dd>{v}</dd>
                  </div>
                ))}
              </dl>
            </Card>
            <Card>
              <FormularioTelefono telefono={perfil.telefono} />
            </Card>
            <Card>
              <AvisosEmail inicial={datos?.avisos_email ?? false} />
            </Card>
          </Seccion>
        </div>
      </div>
    </div>
  );
}
