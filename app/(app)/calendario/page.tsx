import Link from "next/link";
import { Card } from "@/components/ui/card";
import {
  COLOR_CATEGORIA,
  DIAS_SEMANA,
  ETIQUETA_CATEGORIA,
  agruparPorDia,
  claveMes,
  gridMes,
  hoyAr,
  mesVecino,
  nombreMes,
  parseMes,
  type Categoria,
} from "@/lib/dominio/calendario";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { cn } from "@/lib/utils/cn";
import { FormularioEvento } from "./formulario-evento";

type Fila = {
  fecha: string;
  hora: string | null;
  titulo: string;
  categoria: Categoria;
  ref_id: string;
  estado: string | null;
};

function Chip({ e }: { e: Fila }) {
  const color = COLOR_CATEGORIA[e.categoria];
  const texto = `${e.hora ? `${e.hora.slice(0, 5)} ` : ""}${e.titulo}`;
  const clase = "block truncate rounded-md border-l-[3px] px-1.5 py-0.5 text-[11px] font-bold";
  const estilo = { color, borderColor: color, background: `${color}1a` };
  return e.categoria === "consigna" ? (
    <Link href="/consignas" className={clase} style={estilo} title={texto}>
      {texto}
    </Link>
  ) : (
    <span className={clase} style={estilo} title={texto}>
      {texto}
    </span>
  );
}

const BOTON = "flex h-10 items-center rounded-xl border border-border bg-card px-3.5 text-sm font-bold";

export default async function PaginaCalendario({ searchParams }: PageProps<"/calendario">) {
  const perfil = await requerirPerfil();
  const { mes: mesParam } = await searchParams;
  const mes = parseMes(typeof mesParam === "string" ? mesParam : undefined, new Date());
  const semanas = gridMes(mes);
  const desde = semanas[0]![0]!;
  const hasta = semanas[semanas.length - 1]![6]!;
  const hoy = hoyAr();
  const gestiona = perfil.rol === "coordinador" || perfil.rol === "director" || perfil.rol === "admin";

  const supabase = await crearClienteServidor();
  const [{ data }, { data: sedes }] = await Promise.all([
    supabase.rpc("mi_calendario", { p_desde: desde, p_hasta: hasta }),
    gestiona ? supabase.from("sedes").select("id, nombre").order("nombre") : Promise.resolve({ data: [] }),
  ]);
  const filas = (data ?? []) as Fila[];
  const porDia = agruparPorDia(filas);
  const prefijoMes = claveMes(mes);
  const delMes = filas.filter((f) => f.fecha.startsWith(prefijoMes));
  const sedesEvento =
    perfil.rol === "coordinador" ? (sedes ?? []).filter((s) => s.id === perfil.sede_id) : (sedes ?? []);
  const categorias = Object.keys(COLOR_CATEGORIA) as Categoria[];

  return (
    <div className="flex flex-col gap-5 lg:flex-row">
      <section className="flex min-w-0 flex-1 flex-col gap-4">
        <div className="flex flex-wrap items-center gap-2">
          <h1 className="mr-auto text-h1 md:text-[32px]">Calendario</h1>
          <Link href="/calendario" className={BOTON}>
            Hoy
          </Link>
          <Link
            href={`/calendario?mes=${claveMes(mesVecino(mes, -1))}`}
            aria-label="Mes anterior"
            className={BOTON}
          >
            ‹
          </Link>
          <Link
            href={`/calendario?mes=${claveMes(mesVecino(mes, 1))}`}
            aria-label="Mes siguiente"
            className={BOTON}
          >
            ›
          </Link>
          <h2 className="w-44 text-lg font-extrabold">{nombreMes(mes)}</h2>
        </div>

        <div
          role="grid"
          aria-label={nombreMes(mes)}
          className="hidden overflow-hidden rounded-[20px] bg-card shadow-1 md:block"
        >
          <div role="row" className="grid grid-cols-7 border-b border-border">
            {DIAS_SEMANA.map((d) => (
              <div key={d} role="columnheader" className="px-2 py-2 text-xs font-bold text-muted">
                {d}
              </div>
            ))}
          </div>
          {semanas.map((s) => (
            <div key={s[0]} role="row" className="grid grid-cols-7">
              {s.map((dia) => {
                const otroMes = !dia.startsWith(prefijoMes);
                return (
                  <div
                    key={dia}
                    role="gridcell"
                    aria-label={dia}
                    className={cn(
                      "flex min-h-28 min-w-0 flex-col gap-1 border-b border-r border-border p-1.5",
                      otroMes && "bg-background/60",
                    )}
                  >
                    <span
                      className={cn(
                        "flex size-6 items-center justify-center rounded-full text-[13px] font-bold",
                        dia === hoy && "bg-primary text-white",
                        otroMes && "text-muted/60",
                      )}
                    >
                      {Number(dia.slice(8))}
                    </span>
                    {(porDia.get(dia) ?? []).map((e) => (
                      <Chip key={`${e.categoria}-${e.ref_id}`} e={e} />
                    ))}
                  </div>
                );
              })}
            </div>
          ))}
        </div>

        <ol aria-label="Agenda" className="flex flex-col gap-3 md:hidden">
          {delMes.length === 0 && (
            <li>
              <Card>
                <p className="text-sm text-muted">Sin fechas este mes.</p>
              </Card>
            </li>
          )}
          {[...agruparPorDia(delMes)].map(([dia, eventos]) => (
            <li key={dia} className="flex gap-3">
              <span
                className={cn(
                  "w-11 shrink-0 pt-1 text-center text-xl font-extrabold",
                  dia === hoy && "text-primary-strong",
                )}
              >
                {Number(dia.slice(8))}
              </span>
              <span className="flex min-w-0 flex-1 flex-col gap-1.5">
                {eventos.map((e) => (
                  <Chip key={`${e.categoria}-${e.ref_id}`} e={e} />
                ))}
              </span>
            </li>
          ))}
        </ol>
      </section>

      <aside className="flex flex-col gap-4 lg:w-64 lg:shrink-0">
        <Card className="flex flex-col gap-2.5">
          {categorias.map((c) => (
            <span key={c} className="flex items-center gap-2.5 text-sm">
              <span
                aria-hidden="true"
                className="size-3.5 rounded"
                style={{ background: COLOR_CATEGORIA[c] }}
              />
              {ETIQUETA_CATEGORIA[c]}
            </span>
          ))}
        </Card>
        {gestiona && (
          <Card>
            <h2 className="mb-3 font-extrabold">Nuevo evento</h2>
            <FormularioEvento sedes={sedesEvento} permiteTodas={perfil.rol !== "coordinador"} fecha={hoy} />
          </Card>
        )}
      </aside>
    </div>
  );
}
