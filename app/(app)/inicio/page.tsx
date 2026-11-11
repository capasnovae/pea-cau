import { textoRacha, textoRepaso } from "@/lib/dominio/repaso";
import Link from "next/link";
import { Avatar } from "@/components/nav/panel-cuenta";
import { Pestanas } from "@/components/tablero/pestanas";
import { TarjetaCurso, etiquetaTipo, type FilaMiRuta } from "@/components/tablero/tarjeta-curso";
import { Card } from "@/components/ui/card";
import { formatearFecha } from "@/lib/dominio/contenido";
import { colorNivel, porcentaje } from "@/lib/dominio/leccion";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

const PESTANAS = [
  { clave: "tablero", etiqueta: "Tablero", href: "/inicio" },
  { clave: "cursos", etiqueta: "Cursos", href: "/inicio?vista=cursos" },
];

function Seccion({
  titulo,
  accion,
  children,
}: {
  titulo: string;
  accion?: React.ReactNode;
  children: React.ReactNode;
}) {
  return (
    <section aria-label={titulo} className="flex flex-col gap-2.5">
      <div className="flex items-baseline justify-between">
        <h2 className="text-lg font-extrabold">{titulo}</h2>
        {accion}
      </div>
      {children}
    </section>
  );
}

export default async function PaginaInicio({ searchParams }: PageProps<"/inicio">) {
  const { vista } = await searchParams;
  const actualVista = vista === "cursos" ? "cursos" : "tablero";
  const perfil = await requerirPerfil();
  const supabase = await crearClienteServidor();
  const [{ data: ruta }, { data: favoritos }] = await Promise.all([
    supabase.rpc("mi_ruta"),
    supabase.from("cursos_favoritos").select("curso_id"),
  ]);
  const cursos = ruta ?? [];
  const favs = new Set((favoritos ?? []).map((f) => f.curso_id));

  return (
    <div className="flex flex-col gap-5">
      <div className="flex items-center gap-3">
        <Avatar nombre={perfil.nombre} className="size-11 text-lg" />
        <p className="text-2xl font-extrabold md:text-[32px]">¡Hola, {perfil.nombre}!</p>
      </div>
      <Pestanas opciones={PESTANAS} actual={actualVista} />
      {actualVista === "cursos" ? (
        <VistaCursos cursos={cursos} favs={favs} />
      ) : (
        <VistaTablero cursos={cursos} usuarioId={perfil.id} />
      )}
    </div>
  );
}

function VistaCursos({ cursos, favs }: { cursos: FilaMiRuta[]; favs: Set<string> }) {
  if (cursos.length === 0)
    return (
      <Card>
        <p className="text-sm text-muted">Sin cursos por ahora.</p>
      </Card>
    );
  const ordenados = [...cursos].sort((a, b) => Number(favs.has(b.curso_id)) - Number(favs.has(a.curso_id)));
  return (
    <ul aria-label="Mis cursos" className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
      {ordenados.map((c) => (
        <li key={c.curso_id}>
          <TarjetaCurso curso={c} favorito={favs.has(c.curso_id)} />
        </li>
      ))}
    </ul>
  );
}

async function VistaTablero({ cursos, usuarioId }: { cursos: FilaMiRuta[]; usuarioId: string }) {
  const supabase = await crearClienteServidor();
  const [
    { data: trabajo },
    { data: pendientes },
    { data: novedades },
    { data: contactos },
    { data: repaso },
  ] = await Promise.all([
    supabase.rpc("mi_trabajo").maybeSingle(),
    supabase
      .from("consigna_asignaciones")
      .select("id, vence_el, consignas(titulo)")
      .eq("usuario_id", usuarioId)
      .in("estado", ["pendiente", "en_curso", "vencida"])
      .order("vence_el", { ascending: true, nullsFirst: false })
      .limit(3),
    supabase.rpc("mi_bandeja", { p_filtro: "anuncios" }).limit(3),
    supabase.rpc("contactos_bandeja"),
    supabase.rpc("mi_repaso").maybeSingle(),
  ]);
  const equipo = (contactos ?? []).filter((c) => c.mismo_equipo).slice(0, 6);
  const enCurso = cursos.filter((c) => c.desbloqueado && !c.cumplido);
  const actual = enCurso.find((c) => c.obligatorio) ?? enCurso[0];
  const otros = enCurso.filter((c) => c.curso_id !== actual?.curso_id);
  const contadores = [
    { etiqueta: "Por vencer", valor: trabajo?.por_vencer ?? 0, color: "text-warning" },
    { etiqueta: "Vencidas", valor: trabajo?.vencidas ?? 0, color: "text-[#b91c1c]" },
    { etiqueta: "Hechas", valor: trabajo?.hechas ?? 0, color: "text-success" },
  ];

  return (
    <div className="grid gap-6 lg:grid-cols-[minmax(0,1.6fr)_minmax(0,1fr)]">
      <div className="flex flex-col gap-6">
        {(repaso?.pendientes ?? 0) > 0 && (
          <Link
            href="/repaso"
            aria-label="Repaso de hoy"
            className="flex items-center justify-between gap-3 rounded-3xl bg-primary p-5 text-white shadow-[var(--shadow-suave)]"
          >
            <span>
              <span className="block text-lg font-extrabold">Repaso de hoy</span>
              <span className="block text-sm text-white/85">
                {textoRepaso(Math.min(5, repaso?.pendientes ?? 0))}
                {repaso?.racha ? ` · ${textoRacha(repaso.racha)}` : ""}
              </span>
            </span>
            <span aria-hidden className="text-2xl font-extrabold">
              →
            </span>
          </Link>
        )}
        <Seccion
          titulo="Mi trabajo"
          accion={
            <Link href="/consignas" className="text-sm font-semibold text-primary-strong">
              Ver todas
            </Link>
          }
        >
          <Card className="flex flex-col gap-4">
            <dl className="grid grid-cols-3 gap-3">
              {contadores.map((c) => (
                <div key={c.etiqueta} className="rounded-2xl bg-background p-3 text-center">
                  <dd className={`text-3xl font-extrabold ${c.color}`}>{c.valor}</dd>
                  <dt className="text-xs font-semibold text-muted">{c.etiqueta}</dt>
                </div>
              ))}
            </dl>
            {(pendientes ?? []).length === 0 ? (
              <p className="text-sm text-muted">Sin consignas pendientes.</p>
            ) : (
              <ul aria-label="Consignas pendientes" className="flex flex-col">
                {(pendientes ?? []).map((a) => (
                  <li key={a.id} className="border-t border-border first:border-t-0">
                    <Link href="/consignas" className="flex items-center justify-between gap-3 py-2.5">
                      <span className="truncate font-semibold">{a.consignas?.titulo}</span>
                      {a.vence_el && (
                        <span className="shrink-0 text-[13px] text-muted">{formatearFecha(a.vence_el)}</span>
                      )}
                    </Link>
                  </li>
                ))}
              </ul>
            )}
          </Card>
        </Seccion>

        <Seccion
          titulo="Mi progreso"
          accion={
            <Link href="/estudiar" className="text-sm font-semibold text-primary-strong">
              Mis cursos
            </Link>
          }
        >
          {actual ? (
            <ProgresoActual curso={actual} />
          ) : (
            <Card>
              <p className="text-sm text-muted">Todo al día.</p>
            </Card>
          )}
          {otros.length > 0 && (
            <ul className="grid grid-cols-1 gap-4 sm:grid-cols-2">
              {otros.map((c) => (
                <li key={c.curso_id}>
                  <TarjetaCurso curso={c} />
                </li>
              ))}
            </ul>
          )}
        </Seccion>
      </div>

      <div className="flex flex-col gap-6">
        <Seccion
          titulo="Novedades"
          accion={
            <Link href="/bandeja?filtro=anuncios" className="text-sm font-semibold text-primary-strong">
              Ver todas
            </Link>
          }
        >
          <Card className="p-0!">
            {(novedades ?? []).length === 0 ? (
              <p className="p-5 text-sm text-muted">Sin novedades.</p>
            ) : (
              <ul>
                {(novedades ?? []).map((n) => (
                  <li key={n.conversacion_id} className="border-t border-border first:border-t-0">
                    <Link href={`/bandeja/${n.conversacion_id}`} className="block px-5 py-3.5">
                      <span className={`block truncate ${n.sin_leer ? "font-extrabold" : "font-semibold"}`}>
                        {n.asunto}
                      </span>
                      <span className="block text-[13px] text-muted">{n.participantes}</span>
                    </Link>
                  </li>
                ))}
              </ul>
            )}
          </Card>
        </Seccion>

        <Seccion titulo="Mi equipo">
          <Card className="p-0!">
            {equipo.length === 0 ? (
              <p className="p-5 text-sm text-muted">Sin equipo asignado.</p>
            ) : (
              <ul>
                {equipo.map((c) => (
                  <li
                    key={c.id}
                    className="flex items-center gap-3 border-t border-border px-5 py-3 first:border-t-0"
                  >
                    <Avatar nombre={c.nombre} className="size-9" />
                    <span className="min-w-0 flex-1 truncate font-semibold">
                      {c.nombre} {c.apellido}
                    </span>
                    <Link
                      href={`/bandeja/nueva?para=${c.id}`}
                      aria-label={`Escribirle a ${c.nombre}`}
                      className="flex size-11 items-center justify-center rounded-xl text-primary-strong hover:bg-primary-soft"
                    >
                      <svg
                        width="20"
                        height="20"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        strokeWidth="2"
                        aria-hidden="true"
                      >
                        <rect x="3" y="5" width="18" height="14" rx="2" />
                        <path d="M3 7l9 6 9-6" />
                      </svg>
                    </Link>
                  </li>
                ))}
              </ul>
            )}
          </Card>
        </Seccion>
      </div>
    </div>
  );
}

function ProgresoActual({ curso }: { curso: FilaMiRuta }) {
  const color = colorNivel(curso.nivel_orden);
  const pct = porcentaje(curso.items_cumplidos, curso.items_total);
  return (
    <section
      aria-label="Tu ruta"
      className="flex flex-col gap-3 rounded-3xl p-5 text-white"
      style={{ background: color.fondo }}
    >
      <div className="flex items-center justify-between">
        <span className="rounded-full bg-white/20 px-3 py-1.5 text-xs font-bold uppercase">
          {etiquetaTipo(curso)}
        </span>
        <span className="text-3xl font-extrabold">{pct}%</span>
      </div>
      <h3 className="text-2xl font-extrabold leading-tight">{curso.titulo}</h3>
      <div className="h-2 overflow-hidden rounded bg-white/30" aria-hidden="true">
        <div className="h-full rounded bg-[#a5f3c4]" style={{ width: `${pct}%` }} />
      </div>
      <Link
        href={
          curso.siguiente_item
            ? `/estudiar/${curso.curso_id}/${curso.siguiente_item}`
            : `/estudiar/${curso.curso_id}`
        }
        className="flex min-h-12 items-center justify-center rounded-2xl bg-white px-4 text-base font-extrabold"
        style={{ color: color.texto }}
      >
        Continuar
      </Link>
    </section>
  );
}
