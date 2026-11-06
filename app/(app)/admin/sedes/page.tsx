import { Card } from "@/components/ui/card";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioSede } from "./formulario-sede";

export default async function PaginaSedes() {
  await requerirRol(["admin"]);
  const supabase = await crearClienteServidor();
  const { data: sedes } = await supabase
    .from("sedes")
    .select("id, nombre, ciudad, direccion")
    .order("nombre");
  return (
    <div className="flex flex-col gap-6">
      <h1 className="text-2xl font-semibold">Sedes</h1>
      <Card>
        <h2 className="mb-3 text-lg font-semibold">Nueva sede</h2>
        <FormularioSede />
      </Card>
      <ul className="flex flex-col gap-3" aria-label="Sedes">
        {(sedes ?? []).map((s) => (
          <li key={s.id}>
            <Card className="p-4">
              <FormularioSede sede={s} />
            </Card>
          </li>
        ))}
      </ul>
    </div>
  );
}
