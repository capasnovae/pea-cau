import { Card } from "@/components/ui/card";
import {
  COLOR_ESTADO_CERT,
  ETIQUETA_ESTADO_CERT,
  estadoEfectivo,
  normalizarCodigo,
} from "@/lib/dominio/certificados";
import { formatearFecha } from "@/lib/dominio/contenido";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { cn } from "@/lib/utils/cn";
import { Revocar } from "./revocar";

export default async function PaginaCertificaciones({ searchParams }: PageProps<"/admin/certificaciones">) {
  await requerirRol(["admin"]);
  const { q } = await searchParams;
  const busqueda = typeof q === "string" ? q.trim() : "";
  const supabase = await crearClienteServidor();
  let consulta = supabase
    .from("certificaciones")
    .select(
      "id, origen, estado, emitida_at, vence_at, codigo_verificacion, cursos(nivel_orden), perfiles!certificaciones_usuario_id_fkey!inner(nombre, apellido)",
    )
    .order("emitida_at", { ascending: false })
    .limit(100);
  if (busqueda) {
    const codigo = normalizarCodigo(busqueda).replace(/[^A-Z0-9]/g, "");
    const texto = busqueda.replace(/[%,()]/g, " ");
    consulta =
      codigo.length >= 6
        ? consulta.eq("codigo_verificacion", codigo)
        : consulta.or(`nombre.ilike.%${texto}%,apellido.ilike.%${texto}%`, { referencedTable: "perfiles" });
  }
  const { data } = await consulta;
  const ahora = new Date();
  return (
    <div className="flex flex-col gap-4">
      <h1 className="text-2xl font-extrabold">Certificados</h1>
      <form className="flex gap-2" role="search">
        <input
          name="q"
          defaultValue={busqueda}
          aria-label="Buscar por nombre o código"
          placeholder="Nombre o código"
          className="h-11 flex-1 rounded-xl border border-border bg-card px-3"
        />
        <button type="submit" className="h-11 rounded-xl border border-border px-4 font-bold">
          Buscar
        </button>
      </form>
      {(data ?? []).length === 0 ? (
        <Card>
          <p className="text-sm text-muted">Sin certificados.</p>
        </Card>
      ) : (
        <Card className="p-0!">
          <ul aria-label="Certificados">
            {(data ?? []).map((c) => {
              const estado = estadoEfectivo(c.estado, c.vence_at, ahora);
              return (
                <li
                  key={c.id}
                  className="flex flex-wrap items-center gap-3 border-t border-border px-5 py-3.5 first:border-t-0"
                >
                  <span className="min-w-0 flex-1">
                    <span className="block font-bold">
                      {c.perfiles.nombre} {c.perfiles.apellido} · Nivel {c.cursos?.nivel_orden}
                    </span>
                    <span className="block font-mono text-xs text-muted">
                      {c.codigo_verificacion} · {c.origen === "ubicacion" ? "Ubicación" : "Examen"} ·{" "}
                      {formatearFecha(c.emitida_at)}
                    </span>
                  </span>
                  <span
                    className={cn("rounded-full px-2.5 py-1 text-xs font-bold", COLOR_ESTADO_CERT[estado])}
                  >
                    {ETIQUETA_ESTADO_CERT[estado]}
                  </span>
                  {c.estado === "vigente" && <Revocar id={c.id} />}
                </li>
              );
            })}
          </ul>
        </Card>
      )}
    </div>
  );
}
