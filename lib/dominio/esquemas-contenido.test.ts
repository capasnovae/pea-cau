import { describe, expect, it } from "vitest";
import { esquemaArticulo, esquemaCampana, esquemaRecurso } from "./esquemas-contenido";

const CAT = "8a4f6a3e-0b8d-4f7e-9a51-1d2c3b4a5e6f";
const SEDE = "0b1c2d3e-4f50-4a61-8b72-9c83d4e5f601";
const art = { titulo: "Inscripción", categoria_id: CAT, padre_id: "", resumen: "", cuerpo_md: "Hola", alcance: "global", sede_id: "", estado: "borrador", vigente_desde: "", vigente_hasta: "", fuente_url: "", ultimo_cambio: "" };
const rec = { titulo: "Folleto", descripcion: "", tipo: "pdf", tiene_archivo: true, categoria_id: CAT, campana_id: "", etiquetas: "", url_externa: "", alcance: "global", sede_id: "", estado: "publicado", vigente_hasta: "" };

describe("esquemaArticulo", () => {
  it("completa el slug desde el título", () => {
    expect(esquemaArticulo.parse(art).slug).toBe("inscripcion");
  });
  it("exige sede si el alcance es de sede", () => {
    expect(esquemaArticulo.safeParse({ ...art, alcance: "sede", sede_id: "" }).success).toBe(false);
    expect(esquemaArticulo.safeParse({ ...art, alcance: "sede", sede_id: SEDE }).success).toBe(true);
  });
  it("rechaza vigencias invertidas", () => {
    expect(esquemaArticulo.safeParse({ ...art, vigente_desde: "2027-01-01", vigente_hasta: "2026-01-01" }).success).toBe(false);
  });
  it("rechaza una fuente que no es URL", () => {
    expect(esquemaArticulo.safeParse({ ...art, fuente_url: "javascript:alert(1)" }).success).toBe(false);
  });
});

describe("esquemaRecurso", () => {
  it("exige URL para un enlace", () => {
    expect(esquemaRecurso.safeParse({ ...rec, tipo: "enlace", url_externa: "" }).success).toBe(false);
  });
  it("normaliza etiquetas", () => {
    expect(esquemaRecurso.parse({ ...rec, etiquetas: "Becas, , Descuentos " }).etiquetas).toEqual(["becas", "descuentos"]);
  });
  it("solo acepta URLs http o https", () => {
    expect(esquemaRecurso.safeParse({ ...rec, tipo: "enlace", url_externa: "ftp://x.test/a" }).success).toBe(false);
  });
});

describe("esquemaCampana", () => {
  it("rechaza vigencias invertidas", () => {
    expect(esquemaCampana.safeParse({ nombre: "C", descripcion_md: "", vigente_desde: "2027-02-01", vigente_hasta: "2027-01-01", alcance: "global", sede_id: "", estado: "borrador" }).success).toBe(false);
  });
});
