import { describe, expect, it } from "vitest";
import { destinosPermitidos, esquemaConsigna } from "./consignas";

const SEDE = "0b1c2d3e-4f50-4a61-8b72-9c83d4e5f601";
const EQ = "8a4f6a3e-0b8d-4f7e-9a51-1d2c3b4a5e6f";
const base = {
  titulo: "Llamar a la base", detalle_md: "", tipo: "tarea", articulo_id: "", destino: "equipo",
  destino_usuario_id: "", destino_equipo_id: EQ, destino_subrol_id: "", sede_id: SEDE,
  fecha_limite: "", prioridad: "normal", recurrencia: "ninguna", requiere_evidencia: "",
};

describe("destinosPermitidos", () => {
  it("el líder solo persona o equipo", () => {
    expect(destinosPermitidos("lider")).toEqual(["usuario", "equipo"]);
  });
  it("el coordinador los cuatro", () => {
    expect(destinosPermitidos("coordinador")).toEqual(["usuario", "equipo", "subrol", "sede"]);
  });
  it("el asesor ninguno", () => {
    expect(destinosPermitidos("asesor")).toEqual([]);
  });
});

describe("esquemaConsigna", () => {
  it("acepta una tarea de equipo", () => {
    const r = esquemaConsigna.safeParse(base);
    expect(r.success).toBe(true);
    expect(r.success && r.data.requiere_evidencia).toBe(false);
  });
  it("rechaza una lectura sin artículo", () => {
    expect(esquemaConsigna.safeParse({ ...base, tipo: "lectura" }).success).toBe(false);
  });
  it("rechaza una recurrente con fecha límite", () => {
    expect(esquemaConsigna.safeParse({ ...base, recurrencia: "semanal", fecha_limite: "2030-01-01" }).success).toBe(false);
  });
  it("rechaza destino equipo sin equipo y limpia los otros destinos", () => {
    expect(esquemaConsigna.safeParse({ ...base, destino_equipo_id: "" }).success).toBe(false);
    const r = esquemaConsigna.parse({ ...base, destino: "sede", destino_equipo_id: EQ });
    expect(r.destino_equipo_id).toBeNull();
  });
});
