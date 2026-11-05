import { Card } from "@/components/ui/card";
import { ETIQUETA_ROL } from "@/lib/dominio/roles";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioTelefono } from "./formulario-telefono";

export default async function PaginaPerfil() {
  const perfil = await requerirPerfil();
  const supabase = await crearClienteServidor();
  const { data } = await supabase
    .from("perfiles")
    .select("sedes(nombre), equipos!perfiles_equipo_id_fkey(nombre), puestos(nombre), perfil_subroles(subroles(nombre))")
    .eq("id", perfil.id)
    .maybeSingle();
  const subroles = (data?.perfil_subroles ?? []).map((s) => s.subroles?.nombre).filter(Boolean).join(", ");
  const filas: [string, string][] = [
    ["Email", perfil.email],
    ["Rol en PEA", ETIQUETA_ROL[perfil.rol]],
    ["Sede", data?.sedes?.nombre ?? "—"],
    ["Área", perfil.area === "servicio" ? "Servicio" : perfil.area === "ventas" ? "Ventas" : "—"],
    ["Equipo", data?.equipos?.nombre ?? "—"],
    ["Puesto", data?.puestos?.nombre ?? "—"],
    ["Subroles", subroles || "—"],
  ];
  return (
    <div className="flex flex-col gap-4">
      <h1 className="text-2xl font-semibold">
        {perfil.nombre} {perfil.apellido}
      </h1>
      <Card>
        <dl className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-2 text-sm">
          {filas.map(([k, v]) => (
            <div key={k} className="contents">
              <dt className="text-muted">{k}</dt>
              <dd>{v}</dd>
            </div>
          ))}
        </dl>
      </Card>
      <Card>
        <FormularioTelefono telefono={perfil.telefono} />
      </Card>
    </div>
  );
}
