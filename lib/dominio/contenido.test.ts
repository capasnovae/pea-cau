import { describe, expect, it } from "vitest";
import { esNuevaVersion, estaVencido, normalizarBusqueda, rutaArchivo, slugificar } from "./contenido";

describe("slugificar", () => {
  it("normaliza acentos, espacios y signos", () => {
    expect(slugificar("  Inscripción a Materias 2027! ")).toBe("inscripcion-a-materias-2027");
  });
  it("corta en 80 caracteres sin dejar guion al final", () => {
    const s = slugificar("a ".repeat(60));
    expect(s.length).toBeLessThanOrEqual(80);
    expect(s.endsWith("-")).toBe(false);
  });
});

describe("estaVencido", () => {
  it("detecta una fecha pasada", () => {
    expect(estaVencido("2020-01-01", new Date("2026-11-06"))).toBe(true);
  });
  it("sin fecha no vence", () => {
    expect(estaVencido(null)).toBe(false);
  });
  it("vence recién al día siguiente", () => {
    expect(estaVencido("2026-11-06", new Date("2026-11-06T23:00:00"))).toBe(false);
  });
});

describe("esNuevaVersion", () => {
  const hoy = new Date("2026-11-06");
  it("marca una edición reciente", () => {
    expect(esNuevaVersion(2, "2026-11-01T10:00:00Z", hoy)).toBe(true);
  });
  it("la primera versión no es nueva", () => {
    expect(esNuevaVersion(1, "2026-11-05T10:00:00Z", hoy)).toBe(false);
  });
  it("después de 14 días deja de ser nueva", () => {
    expect(esNuevaVersion(3, "2026-10-01T10:00:00Z", hoy)).toBe(false);
  });
});

describe("rutaArchivo", () => {
  it("arma carpeta/id-nombre.ext en minúsculas", () => {
    expect(rutaArchivo("global", "Folleto Becas.PDF", "abc")).toBe("global/abc-folleto-becas.pdf");
  });
  it("tolera archivos sin extensión", () => {
    expect(rutaArchivo("global", "LEEME", "abc")).toBe("global/abc-leeme");
  });
});

describe("normalizarBusqueda", () => {
  it("saca tildes y eñes como la columna de búsqueda", () => {
    expect(normalizarBusqueda("  Campaña año Inscripción ")).toBe("Campana ano Inscripcion");
  });
});
