import { describe, expect, it } from "vitest";
import { filtroEditable, mensajeErrorGuardado, opcionesDeAlcance } from "./edicion";

const SEDES = [
  { id: "s1", nombre: "Neuquén" },
  { id: "s2", nombre: "Roca" },
];

describe("opcionesDeAlcance", () => {
  it("el admin elige global o cualquier sede", () => {
    const o = opcionesDeAlcance("admin", "s1", SEDES);
    expect(o.alcances).toEqual(["global", "sede"]);
    expect(o.sedes.map((s) => s.id)).toEqual(["s1", "s2"]);
  });
  it("el director solo de sede, cualquier sede", () => {
    const o = opcionesDeAlcance("director", null, SEDES);
    expect(o.alcances).toEqual(["sede"]);
    expect(o.sedes.map((s) => s.id)).toEqual(["s1", "s2"]);
  });
  it("el coordinador solo su sede", () => {
    const o = opcionesDeAlcance("coordinador", "s2", SEDES);
    expect(o.alcances).toEqual(["sede"]);
    expect(o.sedes.map((s) => s.id)).toEqual(["s2"]);
  });
  it("un asesor no puede editar", () => {
    expect(opcionesDeAlcance("asesor", "s1", SEDES).alcances).toEqual([]);
  });
});

describe("mensajeErrorGuardado", () => {
  it("permiso denegado", () => {
    expect(mensajeErrorGuardado({ code: "42501" })).toBe("No tenés permiso para hacer esto.");
  });
  it("slug repetido", () => {
    expect(mensajeErrorGuardado({ code: "23505" })).toBe("Ya hay un artículo con ese slug en la categoría.");
  });
  it("padre de otra categoría", () => {
    expect(
      mensajeErrorGuardado({ code: "P0001", message: "integridad: el artículo padre es de otra categoría" }),
    ).toBe("El artículo padre tiene que ser de la misma categoría.");
  });
  it("cualquier otro error", () => {
    expect(mensajeErrorGuardado({ code: "XX000" })).toBe("No pudimos guardar. Probá de nuevo.");
  });
});

describe("filtroEditable", () => {
  it("el admin no filtra", () => {
    expect(filtroEditable("admin", "s1")).toBeNull();
  });
  it("el director ve todo lo de sede", () => {
    expect(filtroEditable("director", null)).toEqual({ alcance: "sede" });
  });
  it("el coordinador solo lo de su sede", () => {
    expect(filtroEditable("coordinador", "s2")).toEqual({ alcance: "sede", sede_id: "s2" });
  });
});
