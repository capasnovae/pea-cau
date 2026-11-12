import { Icono } from "@/components/ui/icono";
import { Markdown } from "@/components/markdown";
import { Card } from "@/components/ui/card";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { requerirPerfil } from "@/lib/supabase/permisos";

const CONTACTOS = [
  { tema: "Dudas de cursos y exámenes", quien: "Tu coordinador (ejemplo)" },
  { tema: "Problemas para ingresar", quien: "Administración de PEA (ejemplo)" },
  { tema: "Contenido desactualizado", quien: "Coordinación de tu sede (ejemplo)" },
];

export default async function PaginaAyuda() {
  await requerirPerfil();
  const supabase = await crearClienteServidor();
  const [{ data: puestos }, { data: subroles }] = await Promise.all([
    supabase.from("puestos").select("id, nombre, descripcion_md").order("orden"),
    supabase.from("subroles").select("id, nombre, descripcion_md").order("orden"),
  ]);
  return (
    <div className="flex flex-col gap-5">
      <h1 className="text-h1 md:text-[32px]">Ayuda</h1>
      <Card className="p-0!">
        <ul>
          {CONTACTOS.map((c) => (
            <li
              key={c.tema}
              className="flex flex-col gap-0.5 border-t border-border px-5 py-4 first:border-t-0 sm:flex-row sm:justify-between"
            >
              <span className="font-semibold">{c.tema}</span>
              <span className="text-sm text-muted">{c.quien}</span>
            </li>
          ))}
        </ul>
      </Card>
      <section aria-label="Qué hace cada puesto" className="flex flex-col gap-2.5">
        <h2 className="text-h2">Qué hace cada puesto</h2>
        <Card className="p-0!">
          {[...(puestos ?? []), ...(subroles ?? [])].map((p) => (
            <details key={p.id} className="acordeon group border-t border-border first:border-t-0">
              <summary className="flex min-h-14 cursor-pointer list-none items-center gap-2 px-5 font-semibold [&::-webkit-details-marker]:hidden">
                <span className="flex-1">{p.nombre}</span>
                <Icono
                  nombre="chevron-der"
                  className="text-muted transition-transform group-open:rotate-90"
                />
              </summary>
              <div className="px-5 pb-4 text-sm text-muted">
                {p.descripcion_md ? <Markdown texto={p.descripcion_md} /> : "Sin descripción."}
              </div>
            </details>
          ))}
        </Card>
      </section>
    </div>
  );
}
