import { Badge } from "@/components/ui/badge";
import { Card } from "@/components/ui/card";
import { ETIQUETA_ROL } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { AccionesFila } from "./acciones-fila";
import { FormularioInvitar } from "./formulario-invitar";

export default async function PaginaUsuarios() {
  await requerirRol(["admin"]);
  const supabase = await crearClienteServidor();
  const [{ data: usuarios }, { data: sedes }, { data: puestos }] = await Promise.all([
    supabase.from("perfiles").select("id, nombre, apellido, email, rol, area, activo, sedes(nombre)").order("apellido"),
    supabase.from("sedes").select("id, nombre").order("nombre"),
    supabase.from("puestos").select("id, nombre").order("orden"),
  ]);

  return (
    <div className="flex flex-col gap-6">
      <h1 className="text-2xl font-semibold">Usuarios</h1>
      <Card>
        <h2 className="mb-4 text-lg font-semibold">Invitar a alguien</h2>
        <FormularioInvitar sedes={sedes ?? []} puestos={puestos ?? []} />
      </Card>
      <ul className="flex flex-col gap-3">
        {(usuarios ?? []).map((u) => (
          <li key={u.id}>
            <Card className="flex flex-col gap-3 p-4 md:flex-row md:items-center md:justify-between">
              <div>
                <p className="font-medium">
                  {u.nombre} {u.apellido} {!u.activo && <Badge className="ml-1">Inactivo</Badge>}
                </p>
                <p className="text-sm text-muted">{u.email}</p>
                <p className="text-sm text-muted">
                  {ETIQUETA_ROL[u.rol]}
                  {u.sedes?.nombre ? ` · ${u.sedes.nombre}` : ""}
                  {u.area ? ` · ${u.area === "servicio" ? "Servicio" : "Ventas"}` : ""}
                </p>
              </div>
              <AccionesFila id={u.id} rol={u.rol} activo={u.activo} />
            </Card>
          </li>
        ))}
      </ul>
    </div>
  );
}
