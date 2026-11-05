import Link from "next/link";
import { BadgesContenido } from "@/components/repositorio/badges";
import { Card } from "@/components/ui/card";
import { cargarOpcionesEdicion } from "@/lib/contenido/opciones";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioCampana } from "./formulario-campana";

export default async function PaginaCampanas() {
  const perfil = await requerirRol([...ROLES_EDITORES]);
  const supabase = await crearClienteServidor();
  const opciones = await cargarOpcionesEdicion(perfil);
  const { data } = await supabase
    .from("campanas")
    .select("id, nombre, descripcion_md, vigente_desde, vigente_hasta, alcance, sede_id, estado")
    .order("created_at", { ascending: false });
  const editables = (data ?? []).filter(
    (c) => perfil.rol === "admin" || (c.alcance === "sede" && (perfil.rol === "director" || c.sede_id === perfil.sede_id)),
  );
  return (
    <div className="flex flex-col gap-5">
      <div>
        <Link href="/contenido" className="text-sm text-primary">← Contenido</Link>
        <h1 className="mt-1 text-2xl font-semibold">Campañas</h1>
      </div>
      <Card>
        <h2 className="mb-3 font-semibold">Nueva campaña</h2>
        <FormularioCampana alcances={opciones.alcances} sedes={opciones.sedes} />
      </Card>
      {editables.map((c) => (
        <Card key={c.id}>
          <div className="mb-2">
            <BadgesContenido c={{ ...c, alcance: "global" }} />
          </div>
          <FormularioCampana campana={c} alcances={opciones.alcances} sedes={opciones.sedes} />
        </Card>
      ))}
    </div>
  );
}
