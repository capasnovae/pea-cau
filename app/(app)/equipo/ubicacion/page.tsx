import { Card } from "@/components/ui/card";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { habilitar } from "./acciones";

export default async function PaginaUbicacion({ searchParams }: PageProps<"/equipo/ubicacion">) {
  const perfil = await requerirRol(["coordinador", "director", "admin"]);
  const { error } = await searchParams;
  const supabase = await crearClienteServidor();
  const [{ data: asesores }, { data: certs }] = await Promise.all([
    supabase
      .from("perfiles")
      .select("id, nombre, apellido, ubicacion_habilitada_por, ubicacion_rendida_at, sedes(nombre)")
      .eq("rol", "asesor")
      .eq("activo", true)
      .neq("id", perfil.id)
      .order("apellido"),
    supabase
      .from("certificaciones")
      .select("usuario_id, cursos(nivel_orden)")
      .eq("origen", "ubicacion")
      .eq("estado", "vigente"),
  ]);
  const niveles = new Map<string, number[]>();
  for (const c of certs ?? [])
    niveles.set(c.usuario_id, [...(niveles.get(c.usuario_id) ?? []), c.cursos?.nivel_orden ?? 0]);

  return (
    <div className="flex flex-col gap-4">
      <h1 className="text-h1">Examen de ubicación</h1>
      {error && (
        <p role="alert" className="rounded-2xl bg-warning-soft p-3 font-semibold text-warning">
          {error === "rendida" ? "Ya rindió la ubicación." : "No podés habilitarlo."}
        </p>
      )}
      {(asesores ?? []).length === 0 ? (
        <Card>
          <p className="text-sm text-muted">Sin asesores.</p>
        </Card>
      ) : (
        <Card className="p-0!">
          <ul aria-label="Asesores">
            {(asesores ?? []).map((a) => {
              const n = (niveles.get(a.id) ?? []).sort((x, y) => x - y);
              const estado = a.ubicacion_rendida_at
                ? n.length
                  ? `Rendida · Nivel ${n.join(", ")}`
                  : "Rendida · sin niveles"
                : a.ubicacion_habilitada_por
                  ? "Habilitada"
                  : "Sin habilitar";
              return (
                <li
                  key={a.id}
                  className="flex flex-wrap items-center gap-3 border-t border-border px-5 py-3.5 first:border-t-0"
                >
                  <span className="min-w-0 flex-1">
                    <span className="block font-bold">
                      {a.nombre} {a.apellido}
                    </span>
                    <span className="block text-[13px] text-muted">{a.sedes?.nombre}</span>
                  </span>
                  <span className="text-sm font-semibold text-muted">{estado}</span>
                  {!a.ubicacion_habilitada_por && !a.ubicacion_rendida_at && (
                    <form action={habilitar.bind(null, a.id)}>
                      <button
                        type="submit"
                        className="rounded-xl bg-primary px-4 py-2 text-sm font-bold text-primary-foreground"
                      >
                        Habilitar
                      </button>
                    </form>
                  )}
                </li>
              );
            })}
          </ul>
        </Card>
      )}
    </div>
  );
}
