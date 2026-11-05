import type { Area, RolApp } from "./roles";

export type FilaOrganigrama = {
  id: string;
  nombre: string;
  apellido: string;
  rol: RolApp;
  area: Area | null;
  sede_id: string | null;
  sede: string | null;
  equipo_id: string | null;
  equipo: string | null;
  es_lider: boolean;
  puesto: string | null;
  subroles: string[];
};

export type Persona = FilaOrganigrama;
type PorArea = { servicio: Persona[]; ventas: Persona[] };
export type EquipoOrg = { id: string; nombre: string; area: Area | null; lider: Persona | null; miembros: Persona[] };
export type SedeOrg = { id: string; nombre: string; coordinadores: PorArea; equipos: EquipoOrg[]; sinEquipo: PorArea };

const porApellido = (a: Persona, b: Persona) =>
  a.apellido.localeCompare(b.apellido, "es") || a.nombre.localeCompare(b.nombre, "es");

export function armarOrganigrama(filas: FilaOrganigrama[], todasLasSedes: { id: string; nombre: string }[] = []) {
  const directores = filas.filter((f) => f.rol === "director").sort(porApellido);
  const admins = filas.filter((f) => f.rol === "admin" && !f.sede_id).sort(porApellido);
  const sedes = new Map<string, SedeOrg>();
  const equipos = new Map<string, EquipoOrg>();
  for (const s of todasLasSedes) {
    sedes.set(s.id, { id: s.id, nombre: s.nombre, coordinadores: { servicio: [], ventas: [] }, equipos: [], sinEquipo: { servicio: [], ventas: [] } });
  }

  for (const f of filas) {
    if (!f.sede_id || f.rol === "director") continue;
    let sede = sedes.get(f.sede_id);
    if (!sede) {
      sede = { id: f.sede_id, nombre: f.sede ?? "", coordinadores: { servicio: [], ventas: [] }, equipos: [], sinEquipo: { servicio: [], ventas: [] } };
      sedes.set(f.sede_id, sede);
    }
    const area: Area = f.area ?? "servicio";
    if (f.rol === "coordinador") {
      sede.coordinadores[area].push(f);
    } else if (f.equipo_id) {
      let eq = equipos.get(f.equipo_id);
      if (!eq) {
        eq = { id: f.equipo_id, nombre: f.equipo ?? "", area: f.area, lider: null, miembros: [] };
        equipos.set(f.equipo_id, eq);
        sede.equipos.push(eq);
      }
      if (f.es_lider && !eq.lider) eq.lider = f;
      else eq.miembros.push(f);
    } else if (f.rol !== "admin") {
      sede.sinEquipo[area].push(f);
    }
  }

  const lista = [...sedes.values()].sort((a, b) => a.nombre.localeCompare(b.nombre, "es"));
  for (const s of lista) {
    s.coordinadores.servicio.sort(porApellido);
    s.coordinadores.ventas.sort(porApellido);
    s.sinEquipo.servicio.sort(porApellido);
    s.sinEquipo.ventas.sort(porApellido);
    s.equipos.sort((a, b) => a.nombre.localeCompare(b.nombre, "es"));
    s.equipos.forEach((e) => e.miembros.sort(porApellido));
  }
  return { directores, admins, sedes: lista };
}
