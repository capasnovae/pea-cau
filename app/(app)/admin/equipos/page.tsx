import { Card } from "@/components/ui/card";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioEquipo } from "./formulario-equipo";

export default async function PaginaEquipos() {
  await requerirRol(["admin"]);
  const supabase = await crearClienteServidor();
  const [{ data: equipos }, { data: sedes }, { data: lideres }] = await Promise.all([
    supabase.from("equipos").select("id, nombre, sede_id, area, lider_id").order("nombre"),
    supabase.from("sedes").select("id, nombre").order("nombre"),
    supabase
      .from("perfiles")
      .select("id, nombre, apellido")
      .eq("rol", "lider")
      .eq("activo", true)
      .order("apellido"),
  ]);
  const opcionesLider = (lideres ?? []).map((l) => ({ id: l.id, nombre: `${l.nombre} ${l.apellido}` }));
  return (
    <div className="flex flex-col gap-6">
      <h1 className="text-2xl font-semibold">Equipos</h1>
      <Card>
        <h2 className="mb-3 text-lg font-semibold">Nuevo equipo</h2>
        <FormularioEquipo sedes={sedes ?? []} lideres={opcionesLider} />
      </Card>
      <ul className="flex flex-col gap-3">
        {(equipos ?? []).map((e) => (
          <li key={e.id}>
            <Card className="p-4">
              <FormularioEquipo equipo={e} sedes={sedes ?? []} lideres={opcionesLider} />
            </Card>
          </li>
        ))}
      </ul>
    </div>
  );
}
