import Link from "next/link";
import { Card } from "@/components/ui/card";
import { formatearFecha } from "@/lib/dominio/contenido";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioActualizacion } from "./formulario";

export default async function PaginaActualizacionesAdmin() {
  await requerirRol(["admin"]);
  const supabase = await crearClienteServidor();
  const [{ data: lista }, { data: articulos }, { data: modulos }, { data: examenes }] = await Promise.all([
    supabase
      .from("actualizaciones")
      .select("id, titulo, plazo_dias, publicada_at, actualizacion_asignaciones(estado)")
      .order("publicada_at", { ascending: false })
      .limit(50),
    supabase.from("articulos").select("id, titulo").eq("estado", "publicado").order("titulo").limit(500),
    supabase.from("modulos").select("id, titulo, cursos(titulo)").order("titulo").limit(500),
    supabase
      .from("examenes")
      .select("id, titulo")
      .eq("tipo", "actualizacion")
      .eq("estado", "publicado")
      .order("titulo"),
  ]);
  return (
    <div className="flex flex-col gap-5">
      <div className="flex items-baseline justify-between gap-3">
        <h1 className="text-h1">Actualizaciones</h1>
        <Link href="/contenido" className="text-sm font-semibold text-primary-strong">
          ‹ Contenido
        </Link>
      </div>
      <Card>
        <h2 className="mb-3 font-extrabold">Nueva actualización obligatoria</h2>
        <FormularioActualizacion
          articulos={(articulos ?? []).map((a) => ({ id: a.id, nombre: a.titulo }))}
          modulos={(modulos ?? []).map((m) => ({
            id: m.id,
            nombre: `${m.cursos?.titulo ?? ""} · ${m.titulo}`,
          }))}
          examenes={(examenes ?? []).map((e) => ({ id: e.id, nombre: e.titulo }))}
        />
      </Card>
      <Card className="p-0!">
        {(lista ?? []).length === 0 ? (
          <p className="p-5 text-sm text-muted">Sin actualizaciones.</p>
        ) : (
          <ul aria-label="Actualizaciones publicadas">
            {(lista ?? []).map((a) => {
              const s = a.actualizacion_asignaciones ?? [];
              const cumplidas = s.filter((x) => x.estado === "cumplida").length;
              return (
                <li
                  key={a.id}
                  className="flex items-center gap-3 border-t border-border px-5 py-3 first:border-t-0"
                >
                  <span className="min-w-0 flex-1">
                    <span className="block font-bold">{a.titulo}</span>
                    <span className="block text-xs text-muted">
                      {formatearFecha(a.publicada_at)} · {a.plazo_dias} días
                    </span>
                  </span>
                  <span className="text-sm font-bold">
                    {cumplidas}/{s.length}
                  </span>
                </li>
              );
            })}
          </ul>
        )}
      </Card>
    </div>
  );
}
