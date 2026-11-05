import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { SelectorRuta } from "./selector";

export default async function PaginaRutas() {
  await requerirRol(["admin"]);
  const supabase = await crearClienteServidor();
  const [{ data: cursos }, { data: puestos }, { data: subroles }, { data: rutas }] = await Promise.all([
    supabase.from("cursos").select("id, titulo, tipo, nivel_orden").eq("tipo", "capacitacion").order("titulo"),
    supabase.from("puestos").select("id, nombre").order("orden"),
    supabase.from("subroles").select("id, nombre").order("orden"),
    supabase.from("ruta_cursos").select("curso_id, puesto_id, subrol_id, obligatorio"),
  ]);
  const columnas = [
    ...(puestos ?? []).map((p) => ({ clave: `puesto:${p.id}`, nombre: p.nombre })),
    ...(subroles ?? []).map((s) => ({ clave: `subrol:${s.id}`, nombre: s.nombre })),
  ];
  const valor = (cursoId: string, clave: string) => {
    const [tipo, id] = clave.split(":");
    const r = (rutas ?? []).find((x) => x.curso_id === cursoId && (tipo === "puesto" ? x.puesto_id === id : x.subrol_id === id));
    return r ? (r.obligatorio ? "obligatorio" : "opcional") : "";
  };
  return (
    <div className="flex flex-col gap-4">
      <div>
        <h1 className="text-2xl font-extrabold">Rutas por puesto</h1>
        <p className="text-sm text-muted">Qué capacitaciones hace cada puesto o subrol. Los niveles los hacen todos.</p>
      </div>
      {(cursos ?? []).length === 0 ? (
        <p className="text-sm text-muted">Todavía no hay capacitaciones.</p>
      ) : (
        <div className="overflow-x-auto rounded-2xl bg-card shadow-[var(--shadow-suave)]">
          <table className="min-w-[720px] w-full text-sm">
            <thead>
              <tr className="text-left text-xs text-muted">
                <th className="p-3">Capacitación</th>
                {columnas.map((c) => <th key={c.clave} className="p-3 font-semibold">{c.nombre}</th>)}
              </tr>
            </thead>
            <tbody>
              {(cursos ?? []).map((cur) => (
                <tr key={cur.id} className="border-t border-border">
                  <td className="p-3 font-semibold">{cur.titulo}</td>
                  {columnas.map((c) => (
                    <td key={c.clave} className="p-2">
                      <SelectorRuta cursoId={cur.id} clave={c.clave} valor={valor(cur.id, c.clave)} etiqueta={`${cur.titulo} · ${c.nombre}`} />
                    </td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
