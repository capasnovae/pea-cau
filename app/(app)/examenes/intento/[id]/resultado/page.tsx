import Link from "next/link";
import { notFound } from "next/navigation";
import { Revision, type FilaRevision } from "@/components/examen/revision";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { cn } from "@/lib/utils/cn";
import { empezarUbicacion } from "../../../acciones";

export default async function PaginaResultado({ params }: PageProps<"/examenes/intento/[id]/resultado">) {
  const perfil = await requerirPerfil();
  const { id } = await params;
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const supabase = await crearClienteServidor();
  const { data: intento } = await supabase
    .from("intentos")
    .select("id, estado, nota, aprobado, usuario_id, examen_id, salidas, examenes(titulo, nota_minima, tipo)")
    .eq("id", id)
    .maybeSingle();
  if (!intento || intento.estado === "en_curso") notFound();
  const propio = intento.usuario_id === perfil.id;
  const examen = intento.examenes;

  let filas: FilaRevision[] = [];
  if (intento.estado === "cerrado") {
    const { data } = await supabase.rpc("revision_intento", { p_intento: id });
    const ids = [
      ...new Set((data ?? []).map((f) => f.articulo_fuente_id).filter((x): x is string => Boolean(x))),
    ];
    const { data: articulos } = ids.length
      ? await supabase.from("articulos").select("id, slug, categorias(slug)").in("id", ids)
      : { data: [] };
    const href = new Map(
      (articulos ?? []).map((a) => [a.id, `/repositorio/${a.categorias?.slug}/${a.slug}`]),
    );
    filas = (data ?? []).map(
      (f) =>
        ({
          ...f,
          estudiar_href: f.articulo_fuente_id ? (href.get(f.articulo_fuente_id) ?? null) : null,
        }) as unknown as FilaRevision,
    );
  }
  const { data: ubicacion } =
    propio && examen?.tipo === "ubicacion" && intento.aprobado
      ? await supabase.rpc("estado_ubicacion").maybeSingle()
      : { data: null };

  return (
    <div className="mx-auto flex w-full max-w-3xl flex-col gap-5">
      <Link
        href={propio ? `/examenes/${intento.examen_id}` : "/examenes"}
        className="text-sm font-semibold text-primary-strong"
      >
        ‹ {examen?.titulo ?? "Exámenes"}
      </Link>
      {intento.estado === "pendiente_correccion" ? (
        <section className="flex flex-col items-center gap-2 rounded-3xl bg-card p-8 text-center shadow-1">
          <h1 className="text-h1">Pendiente de corrección</h1>
        </section>
      ) : (
        <section
          aria-label="Resultado"
          className={cn(
            "flex flex-col items-center gap-1 rounded-3xl p-8 text-center text-white",
            intento.aprobado ? "bg-success" : "bg-destructive",
          )}
        >
          <p className="text-6xl font-extrabold">{intento.nota}%</p>
          <h1 className="text-h1">{intento.aprobado ? "Aprobado" : "No aprobado"}</h1>
          <p className="text-sm text-white/85">Para aprobar: {examen?.nota_minima}%</p>
        </section>
      )}
      {intento.salidas > 0 && (
        <p className="rounded-2xl bg-warning-soft p-3 text-center text-sm font-semibold text-warning">
          Salió del examen {intento.salidas} {intento.salidas === 1 ? "vez" : "veces"}
        </p>
      )}
      {ubicacion && !ubicacion.rendida && (
        <form action={empezarUbicacion}>
          <button type="submit" className="min-h-12 w-full rounded-2xl bg-nav font-extrabold text-white">
            Seguir con el Nivel {ubicacion.bloque_actual}
          </button>
        </form>
      )}
      {filas.length > 0 && <Revision filas={filas} />}
    </div>
  );
}
