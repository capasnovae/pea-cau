import { describe, expect, it } from "vitest";
import { armarOrganigrama, type FilaOrganigrama } from "./organigrama";

const f = (o: Partial<FilaOrganigrama>): FilaOrganigrama => ({
  id: o.id ?? Math.random().toString(),
  nombre: o.nombre ?? "N",
  apellido: o.apellido ?? "A",
  rol: o.rol ?? "asesor",
  area: o.area ?? null,
  sede_id: o.sede_id ?? null,
  sede: o.sede ?? null,
  equipo_id: o.equipo_id ?? null,
  equipo: o.equipo ?? null,
  es_lider: o.es_lider ?? false,
  puesto: o.puesto ?? null,
  subroles: o.subroles ?? [],
});

describe("armarOrganigrama", () => {
  const filas = [
    f({ id: "d", rol: "director", apellido: "Director" }),
    f({ id: "c", rol: "coordinador", area: "servicio", sede_id: "r", sede: "Roca", apellido: "Coord" }),
    f({ id: "l", rol: "lider", area: "servicio", sede_id: "n", sede: "Neuquén", equipo_id: "e1", equipo: "Equipo 1", es_lider: true, apellido: "Lider" }),
    f({ id: "a", rol: "asesor", area: "servicio", sede_id: "n", sede: "Neuquén", equipo_id: "e1", equipo: "Equipo 1", apellido: "Zeta" }),
    f({ id: "b", rol: "asesor", area: "ventas", sede_id: "n", sede: "Neuquén", apellido: "Beta" }),
  ];
  const o = armarOrganigrama(filas);
  it("pone al director arriba", () => {
    expect(o.directores.map((p) => p.id)).toEqual(["d"]);
  });
  it("ordena las sedes por nombre", () => {
    expect(o.sedes.map((s) => s.nombre)).toEqual(["Neuquén", "Roca"]);
  });
  it("arma los equipos con su líder y miembros", () => {
    const eq = o.sedes[0]!.equipos[0]!;
    expect(eq.lider?.id).toBe("l");
    expect(eq.miembros.map((p) => p.id)).toEqual(["a"]);
  });
  it("separa coordinadores y gente sin equipo por área", () => {
    expect(o.sedes[1]!.coordinadores.servicio.map((p) => p.id)).toEqual(["c"]);
    expect(o.sedes[0]!.sinEquipo.ventas.map((p) => p.id)).toEqual(["b"]);
  });
});
