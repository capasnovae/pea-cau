import { describe, expect, it } from "vitest";
import {
  busquedaCertificados,
  esquemaInsignia,
  esquemaRevocacion,
  estadoEfectivo,
  normalizarCodigo,
  textoVencimiento,
  urlVerificacion,
} from "./certificados";

const AHORA = new Date("2026-11-11T12:00:00Z");

describe("estadoEfectivo", () => {
  it("una vigente con fecha vencida se ve vencida", () => {
    expect(estadoEfectivo("vigente", "2026-01-01T00:00:00Z", AHORA)).toBe("vencida");
    expect(estadoEfectivo("vigente", "2027-01-01T00:00:00Z", AHORA)).toBe("vigente");
    expect(estadoEfectivo("vigente", null, AHORA)).toBe("vigente");
  });
  it("la revocada gana aunque no haya vencido", () => {
    expect(estadoEfectivo("revocada", "2027-01-01T00:00:00Z", AHORA)).toBe("revocada");
  });
});

describe("textos", () => {
  it("sin fecha de vencimiento", () => {
    expect(textoVencimiento(null)).toBe("Sin vencimiento");
    expect(textoVencimiento("2027-11-12T12:00:00Z")).toMatch(/^Vence el /);
  });
  it("arma la URL de verificación sin barras dobles", () => {
    expect(urlVerificacion("https://pea.app/", "AB12")).toBe("https://pea.app/verificar/AB12");
    expect(urlVerificacion("https://pea.app", "AB12")).toBe("https://pea.app/verificar/AB12");
  });
  it("normaliza el código", () => {
    expect(normalizarCodigo(" ab-12 cd ")).toBe("AB12CD");
  });
});

describe("busquedaCertificados", () => {
  it("solo un código de 10 hex (con o sin guiones) se busca como código", () => {
    expect(busquedaCertificados(" ab12-cd34 ef ")).toEqual({ tipo: "codigo", codigo: "AB12CD34EF" });
    expect(busquedaCertificados("Asesor")).toEqual({ tipo: "nombre", terminos: ["Asesor"] });
    expect(busquedaCertificados("Fernández")).toEqual({ tipo: "nombre", terminos: ["Fernández"] });
  });
  it("separa el nombre completo en términos y saca los caracteres del filtro", () => {
    expect(busquedaCertificados("Andrés  Asesor")).toEqual({ tipo: "nombre", terminos: ["Andrés", "Asesor"] });
    expect(busquedaCertificados("a%b,(c)")).toEqual({ tipo: "nombre", terminos: ["a", "b", "c"] });
    expect(busquedaCertificados("   ")).toBeNull();
  });
});

describe("esquemas de gestión", () => {
  it("la insignia necesita nombre", () => {
    expect(esquemaInsignia.safeParse({ nombre: " ", descripcion: "" }).success).toBe(false);
    expect(esquemaInsignia.safeParse({ nombre: "Base", descripcion: "x".repeat(301) }).success).toBe(false);
    expect(esquemaInsignia.safeParse({ nombre: " Base ", descripcion: "" }).data?.nombre).toBe("Base");
  });
  it("revocar necesita motivo", () => {
    expect(esquemaRevocacion.safeParse({ motivo: "  " }).success).toBe(false);
    expect(esquemaRevocacion.safeParse({ motivo: "Error de carga" }).success).toBe(true);
  });
});
