import { Card } from "@/components/ui/card";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioArea } from "./formulario-area";

export default async function PaginaAdminDerivaciones() {
  await requerirRol(["admin"]);
  const supabase = await crearClienteServidor();
  const { data } = await supabase
    .from("areas_derivacion")
    .select("id, nombre, que_resuelve_md, que_no_resuelve_md, canal_contacto, plazo_esperado, orden")
    .order("orden");
  return (
    <div className="flex flex-col gap-5">
      <h1 className="text-h1">Áreas de derivación</h1>
      <Card>
        <h2 className="mb-3 font-semibold">Nueva área</h2>
        <FormularioArea />
      </Card>
      {(data ?? []).map((a) => (
        <Card key={a.id}>
          <FormularioArea area={a} />
        </Card>
      ))}
    </div>
  );
}
