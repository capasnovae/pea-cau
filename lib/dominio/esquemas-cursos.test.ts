import { describe, expect, it } from "vitest";
import { esquemaCurso, esquemaItem, esquemaModulo } from "./esquemas-cursos";

const U = "0b1c2d3e-4f50-4a61-8b72-9c83d4e5f601";

describe("esquemaCurso", () => {
  it("un nivel exige número y es global", () => {
    expect(esquemaCurso.safeParse({ tipo: "nivel", nivel_orden: "", titulo: "N", descripcion_md: "", alcance: "global", sede_id: "", estado: "borrador", vigencia_meses: "" }).success).toBe(false);
    expect(esquemaCurso.safeParse({ tipo: "nivel", nivel_orden: "2", titulo: "N", descripcion_md: "", alcance: "sede", sede_id: U, estado: "borrador", vigencia_meses: "" }).success).toBe(false);
    const ok = esquemaCurso.parse({ tipo: "nivel", nivel_orden: "2", titulo: "N", descripcion_md: "", alcance: "global", sede_id: "", estado: "borrador", vigencia_meses: "12" });
    expect(ok.nivel_orden).toBe(2);
    expect(ok.vigencia_meses).toBe(12);
  });
  it("una capacitación no lleva número de nivel", () => {
    const r = esquemaCurso.parse({ tipo: "capacitacion", nivel_orden: "3", titulo: "C", descripcion_md: "", alcance: "sede", sede_id: U, estado: "publicado", vigencia_meses: "" });
    expect(r.nivel_orden).toBeNull();
  });
});

describe("esquemaModulo", () => {
  it("normaliza prerrequisitos y secuencial", () => {
    const r = esquemaModulo.parse({ curso_id: U, titulo: "M", orden: "2", avance_secuencial: "on", prerrequisitos: [U] });
    expect(r.avance_secuencial).toBe(true);
    expect(r.prerrequisitos).toEqual([U]);
  });
});

describe("esquemaItem", () => {
  const base = { modulo_id: U, titulo: "I", orden: "1", requisito: "ver", articulo_id: "", recurso_id: "", contenido_md: "", url: "" };
  it("una página exige contenido", () => {
    expect(esquemaItem.safeParse({ ...base, tipo: "pagina" }).success).toBe(false);
    expect(esquemaItem.safeParse({ ...base, tipo: "pagina", contenido_md: "Hola" }).success).toBe(true);
  });
  it("un enlace exige URL http(s) y limpia lo que no corresponde", () => {
    expect(esquemaItem.safeParse({ ...base, tipo: "enlace", url: "javascript:x" }).success).toBe(false);
    const r = esquemaItem.parse({ ...base, tipo: "enlace", url: "https://ejemplo.test", contenido_md: "sobra" });
    expect(r.contenido_md).toBeNull();
  });
  it("aprobar solo para exámenes", () => {
    expect(esquemaItem.safeParse({ ...base, tipo: "pagina", contenido_md: "x", requisito: "aprobar" }).success).toBe(false);
  });
});
