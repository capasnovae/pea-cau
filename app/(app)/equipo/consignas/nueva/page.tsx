import Link from "next/link";
import { Card } from "@/components/ui/card";
import { destinosPermitidos } from "@/lib/dominio/consignas";
import { ROLES_GESTION } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioConsigna } from "./formulario-consigna";

export default async function PaginaNuevaConsigna() {
  const perfil = await requerirRol([...ROLES_GESTION]);
  const supabase = await crearClienteServidor();
  const [{ data: dir }, { data: sedes }, { data: equipos }, { data: subroles }, { data: articulos }] =
    await Promise.all([
      supabase.rpc("organigrama"),
      supabase.from("sedes").select("id, nombre").eq("activa", true).order("nombre"),
      supabase.from("equipos").select("id, nombre, sede_id, area, lider_id").order("nombre"),
      supabase.from("subroles").select("id, nombre").order("orden"),
      supabase
        .from("articulos")
        .select("id, titulo, alcance, sede_id")
        .eq("estado", "publicado")
        .order("titulo")
        .limit(300),
    ]);

  // Alcance del rol (la base vuelve a verificarlo al crear)
  const misEquipos = (equipos ?? []).filter((e) => e.lider_id === perfil.id).map((e) => e.id);
  const personas = (dir ?? [])
    .filter((p) => p.id !== perfil.id && p.sede_id)
    .filter((p) => {
      if (perfil.rol === "lider") return p.equipo_id !== null && misEquipos.includes(p.equipo_id);
      if (perfil.rol === "coordinador") return p.sede_id === perfil.sede_id && p.area === perfil.area;
      return true;
    })
    .map((p) => ({ id: p.id, nombre: `${p.nombre} ${p.apellido}`, sede_id: p.sede_id as string }));
  const equiposPermitidos = (equipos ?? [])
    .filter((e) => {
      if (perfil.rol === "lider") return e.lider_id === perfil.id;
      if (perfil.rol === "coordinador") return e.sede_id === perfil.sede_id && e.area === perfil.area;
      return true;
    })
    .map((e) => ({ id: e.id, nombre: e.nombre, sede_id: e.sede_id }));
  const sedeFija = perfil.rol === "lider" || perfil.rol === "coordinador" ? perfil.sede_id : null;

  return (
    <div className="flex flex-col gap-5">
      <div>
        <Link href="/equipo/consignas" className="text-sm text-primary">
          ← Consignas del equipo
        </Link>
        <h1 className="mt-1 text-2xl font-semibold">Nueva consigna</h1>
      </div>
      <Card>
        <FormularioConsigna
          destinos={destinosPermitidos(perfil.rol)}
          sedes={sedes ?? []}
          sedeFija={sedeFija}
          personas={personas}
          equipos={equiposPermitidos}
          subroles={subroles ?? []}
          articulos={(articulos ?? []).map((a) => ({
            id: a.id,
            nombre: a.titulo,
            sede_id: a.alcance === "sede" ? a.sede_id : null,
          }))}
        />
      </Card>
    </div>
  );
}
