import { Badge } from "@/components/ui/badge";
import { Card } from "@/components/ui/card";
import { leerFiltrosUsuarios } from "@/lib/dominio/filtros-usuarios";
import { ETIQUETA_ROL, ROLES } from "@/lib/dominio/roles";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { AccionesFila } from "./acciones-fila";
import { FormularioAsignar } from "./formulario-asignar";
import { FormularioInvitar } from "./formulario-invitar";

export default async function PaginaUsuarios({ searchParams }: PageProps<"/admin/usuarios">) {
  await requerirRol(["admin"]);
  const filtros = leerFiltrosUsuarios(await searchParams);
  const supabase = await crearClienteServidor();
  const [{ data: usuarios }, { data: sedes }, { data: puestos }, { data: equipos }, { data: subroles }] =
    await Promise.all([
      (() => {
        let q = supabase
          .from("perfiles")
          .select(
            "id, nombre, apellido, email, rol, area, activo, sede_id, equipo_id, puesto_id, sedes(nombre), perfil_subroles(subrol_id)",
          )
          .order("apellido");
        if (filtros.q)
          q = q.or(`nombre.ilike.%${filtros.q}%,apellido.ilike.%${filtros.q}%,email.ilike.%${filtros.q}%`);
        if (filtros.sede) q = q.eq("sede_id", filtros.sede);
        if (filtros.rol) q = q.eq("rol", filtros.rol);
        if (filtros.estado !== "todos") q = q.eq("activo", filtros.estado === "activos");
        return q;
      })(),
      supabase.from("sedes").select("id, nombre").order("nombre"),
      supabase.from("puestos").select("id, nombre").order("orden"),
      supabase.from("equipos").select("id, nombre, sede_id, area").order("nombre"),
      supabase.from("subroles").select("id, nombre").order("orden"),
    ]);

  return (
    <div className="flex flex-col gap-6">
      <h1 className="text-2xl font-semibold">Usuarios</h1>
      <Card>
        <h2 className="mb-4 text-lg font-semibold">Invitar a alguien</h2>
        <FormularioInvitar sedes={sedes ?? []} puestos={puestos ?? []} />
      </Card>
      <form
        role="search"
        aria-label="Filtrar usuarios"
        className="grid gap-2 sm:grid-cols-[1.5fr_1fr_1fr_1fr_auto]"
      >
        <Input
          name="q"
          aria-label="Buscar por nombre o email"
          placeholder="Buscar por nombre o email"
          defaultValue={filtros.q}
        />
        <Select name="sede" aria-label="Sede" defaultValue={filtros.sede ?? ""}>
          <option value="">Todas las sedes</option>
          {(sedes ?? []).map((s) => (
            <option key={s.id} value={s.id}>
              {s.nombre}
            </option>
          ))}
        </Select>
        <Select name="rol" aria-label="Rol" defaultValue={filtros.rol ?? ""}>
          <option value="">Todos los roles</option>
          {ROLES.map((r) => (
            <option key={r} value={r}>
              {ETIQUETA_ROL[r]}
            </option>
          ))}
        </Select>
        <Select name="estado" aria-label="Estado" defaultValue={filtros.estado}>
          <option value="activos">Activos</option>
          <option value="inactivos">Inactivos</option>
          <option value="todos">Todos</option>
        </Select>
        <Button type="submit" variante="secundario">
          Filtrar
        </Button>
      </form>
      {(usuarios ?? []).length === 0 && (
        <p className="text-sm text-muted">No hay usuarios con esos filtros.</p>
      )}
      <ul className="flex flex-col gap-3" aria-label="Usuarios">
        {(usuarios ?? []).map((u) => (
          <li key={u.id}>
            <Card className="flex flex-col gap-3 p-4 md:flex-row md:flex-wrap md:items-center md:justify-between">
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
              <details className="md:basis-full">
                <summary className="cursor-pointer text-sm text-primary">
                  Sede, equipo, puesto y subroles
                </summary>
                <div className="pt-3">
                  <FormularioAsignar
                    usuario={{
                      id: u.id,
                      sede_id: u.sede_id,
                      area: u.area,
                      equipo_id: u.equipo_id,
                      puesto_id: u.puesto_id,
                      subrol_ids: (u.perfil_subroles ?? []).map((s) => s.subrol_id),
                    }}
                    sedes={sedes ?? []}
                    equipos={(equipos ?? []).filter((e) => e.sede_id === u.sede_id && e.area === u.area)}
                    puestos={puestos ?? []}
                    subroles={subroles ?? []}
                  />
                </div>
              </details>
            </Card>
          </li>
        ))}
      </ul>
    </div>
  );
}
