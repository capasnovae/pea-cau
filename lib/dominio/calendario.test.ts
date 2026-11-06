import { describe, expect, it } from "vitest";
import {
  agruparPorDia,
  claveMes,
  esquemaEvento,
  gridMes,
  mesVecino,
  nombreMes,
  parseMes,
} from "./calendario";

const HOY = new Date("2026-11-06T15:00:00-03:00");

describe("parseMes", () => {
  it("lee AAAA-MM", () => {
    expect(parseMes("2026-11", HOY)).toEqual({ anio: 2026, mes: 11 });
  });
  it("cae al mes de hoy si el valor no sirve", () => {
    expect(parseMes("2026-13", HOY)).toEqual({ anio: 2026, mes: 11 });
    expect(parseMes("abc", HOY)).toEqual({ anio: 2026, mes: 11 });
    expect(parseMes(undefined, HOY)).toEqual({ anio: 2026, mes: 11 });
    expect(parseMes("", HOY)).toEqual({ anio: 2026, mes: 11 });
  });
});

describe("meses", () => {
  it("pasa de año hacia adelante y hacia atrás", () => {
    expect(mesVecino({ anio: 2026, mes: 12 }, 1)).toEqual({ anio: 2027, mes: 1 });
    expect(mesVecino({ anio: 2026, mes: 1 }, -1)).toEqual({ anio: 2025, mes: 12 });
  });
  it("arma la clave y el nombre", () => {
    expect(claveMes({ anio: 2026, mes: 3 })).toBe("2026-03");
    expect(nombreMes({ anio: 2026, mes: 11 })).toBe("Noviembre 2026");
  });
});

describe("gridMes", () => {
  it("arranca el lunes y completa con días de los meses vecinos", () => {
    const g = gridMes({ anio: 2026, mes: 11 });
    expect(g[0]![0]).toBe("2026-10-26");
    expect(g).toHaveLength(6);
    expect(g.every((s) => s.length === 7)).toBe(true);
    expect(g[5]![6]).toBe("2026-12-06");
  });
  it("febrero de 2027 entra justo en 4 semanas", () => {
    const g = gridMes({ anio: 2027, mes: 2 });
    expect(g).toHaveLength(4);
    expect(g[0]![0]).toBe("2027-02-01");
    expect(g[3]![6]).toBe("2027-02-28");
  });
});

describe("agruparPorDia", () => {
  it("agrupa por fecha conservando el orden", () => {
    const m = agruparPorDia([
      { fecha: "2026-11-05", t: "a" },
      { fecha: "2026-11-06", t: "b" },
      { fecha: "2026-11-05", t: "c" },
    ]);
    expect(m.get("2026-11-05")?.map((x) => x.t)).toEqual(["a", "c"]);
    expect(m.get("2026-11-06")).toHaveLength(1);
  });
});

describe("esquemaEvento", () => {
  const base = {
    titulo: "Capacitación CEO",
    descripcion: "",
    fecha: "2026-11-12",
    hora: "10:00",
    tipo: "capacitacion",
    sede_id: "",
  };
  it("acepta un evento válido y normaliza la sede vacía a null", () => {
    const r = esquemaEvento.safeParse(base);
    expect(r.success).toBe(true);
    expect(r.data?.sede_id).toBeNull();
  });
  it("rechaza título vacío y hora inválida", () => {
    expect(esquemaEvento.safeParse({ ...base, titulo: "  " }).success).toBe(false);
    expect(esquemaEvento.safeParse({ ...base, hora: "25:00" }).success).toBe(false);
  });
  it("la hora es opcional", () => {
    expect(esquemaEvento.safeParse({ ...base, hora: "" }).data?.hora).toBeNull();
  });
});
