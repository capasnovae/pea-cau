import { describe, expect, it } from "vitest";
import { esquemaExamen } from "./examenes";
import { esquemaActualizacion, estadoVisible } from "./actualizaciones";

const U = "0b1c2d3e-4f50-4a61-8b72-9c83d4e5f601";

describe("esquemaActualizacion", () => {
  it("necesita título, plazo de 1 a 90 días y un artículo o un módulo", () => {
    expect(
      esquemaActualizacion.safeParse({ titulo: "Cambio", plazo_dias: "15", articulo_id: U }).success,
    ).toBe(true);
    expect(esquemaActualizacion.safeParse({ titulo: "Cambio", plazo_dias: "15", modulo_id: U }).success).toBe(
      true,
    );
    expect(
      esquemaActualizacion.safeParse({ titulo: "Cambio", plazo_dias: "15" }).error?.issues[0]?.message,
    ).toBe("Elegí el artículo o el módulo.");
    expect(esquemaActualizacion.safeParse({ titulo: " ", plazo_dias: "15", articulo_id: U }).success).toBe(
      false,
    );
    expect(esquemaActualizacion.safeParse({ titulo: "C", plazo_dias: "0", articulo_id: U }).success).toBe(
      false,
    );
    expect(esquemaActualizacion.safeParse({ titulo: "C", plazo_dias: "91", articulo_id: U }).success).toBe(
      false,
    );
  });
  it("vacíos opcionales quedan en null", () => {
    const r = esquemaActualizacion.parse({
      titulo: "C",
      plazo_dias: "7",
      articulo_id: U,
      modulo_id: "",
      examen_id: "",
    });
    expect(r).toMatchObject({ modulo_id: null, examen_id: null, descripcion_md: "" });
  });
});

describe("estadoVisible", () => {
  const ahora = new Date("2026-11-13T12:00:00Z");
  it("pendiente con fecha pasada se muestra vencida", () => {
    expect(estadoVisible("pendiente", "2026-11-12T00:00:00Z", ahora)).toBe("vencida");
    expect(estadoVisible("pendiente", "2026-11-20T00:00:00Z", ahora)).toBe("pendiente");
    expect(estadoVisible("cumplida", "2026-11-12T00:00:00Z", ahora)).toBe("cumplida");
  });
});

describe("examen de actualización", () => {
  it("necesita módulo o categoría", () => {
    const base = {
      titulo: "Mini",
      tipo: "actualizacion",
      cantidad_preguntas: "3",
      alcance: "global",
      estado: "publicado",
    };
    expect(esquemaExamen.safeParse(base).success).toBe(false);
    expect(esquemaExamen.safeParse({ ...base, categoria_id: U }).success).toBe(true);
  });
});
