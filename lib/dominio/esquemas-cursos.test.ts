import { describe, expect, it } from "vitest";
import { esquemaCurso, esquemaItem, esquemaModulo } from "./esquemas-cursos";

const U = "0b1c2d3e-4f50-4a61-8b72-9c83d4e5f601";

describe("esquemaCurso", () => {
  it("un nivel exige número y es global", () => {
    expect(
      esquemaCurso.safeParse({
        tipo: "nivel",
        nivel_orden: "",
        titulo: "N",
        descripcion_md: "",
        alcance: "global",
        sede_id: "",
        estado: "borrador",
        vigencia_meses: "",
      }).success,
    ).toBe(false);
    expect(
      esquemaCurso.safeParse({
        tipo: "nivel",
        nivel_orden: "2",
        titulo: "N",
        descripcion_md: "",
        alcance: "sede",
        sede_id: U,
        estado: "borrador",
        vigencia_meses: "",
      }).success,
    ).toBe(false);
    const ok = esquemaCurso.parse({
      tipo: "nivel",
      nivel_orden: "2",
      titulo: "N",
      descripcion_md: "",
      alcance: "global",
      sede_id: "",
      estado: "borrador",
      vigencia_meses: "12",
    });
    expect(ok.nivel_orden).toBe(2);
    expect(ok.vigencia_meses).toBe(12);
  });
  it("una capacitación no lleva número de nivel", () => {
    const r = esquemaCurso.parse({
      tipo: "capacitacion",
      nivel_orden: "3",
      titulo: "C",
      descripcion_md: "",
      alcance: "sede",
      sede_id: U,
      estado: "publicado",
      vigencia_meses: "",
    });
    expect(r.nivel_orden).toBeNull();
  });
});

describe("esquemaModulo", () => {
  it("normaliza prerrequisitos y secuencial", () => {
    const r = esquemaModulo.parse({
      curso_id: U,
      titulo: "M",
      orden: "2",
      avance_secuencial: "on",
      prerrequisitos: [U],
    });
    expect(r.avance_secuencial).toBe(true);
    expect(r.prerrequisitos).toEqual([U]);
  });
});

describe("esquemaItem: lección", () => {
  const leccion = JSON.stringify({ resumen: ["a"], ejemplos: [{ consulta: "c", respuesta: "r" }], ojo: [] });
  const base = {
    modulo_id: U,
    titulo: "L",
    tipo: "leccion",
    requisito: "ver",
    orden: 1,
    leccion,
    articulo_id: U,
  };
  it("necesita la fuente", () => {
    const r = esquemaItem.safeParse({ ...base, articulo_id: "" });
    expect(r.success).toBe(false);
    expect(r.error?.issues[0]?.message).toBe("Elegí la fuente.");
  });
  it("solo ver o marcar como hecho", () => {
    expect(esquemaItem.safeParse({ ...base, requisito: "aprobar" }).success).toBe(false);
    expect(esquemaItem.safeParse({ ...base, requisito: "marcar_hecho" }).success).toBe(true);
  });
  it("una lección que no es JSON válido se rechaza", () => {
    const r = esquemaItem.safeParse({ ...base, leccion: "{roto" });
    expect(r.success).toBe(false);
    expect(r.error?.issues.map((i) => i.message)).toContain("Revisá la lección.");
  });
  it("conserva la fuente y la lección y limpia el resto", () => {
    const r = esquemaItem.parse({ ...base, url: "https://x.test", contenido_md: "x" });
    expect(r.articulo_id).toBe(U);
    expect(r.leccion).toEqual({ resumen: ["a"], ejemplos: [{ consulta: "c", respuesta: "r" }], ojo: [] });
    expect(r.url).toBeNull();
    expect(r.contenido_md).toBeNull();
  });
  it("los otros tipos dejan la lección en null", () => {
    const r = esquemaItem.parse({ ...base, tipo: "pagina", contenido_md: "Hola" });
    expect(r.leccion).toBeNull();
  });
});

describe("esquemaItem", () => {
  const base = {
    modulo_id: U,
    titulo: "I",
    orden: "1",
    requisito: "ver",
    articulo_id: "",
    recurso_id: "",
    contenido_md: "",
    url: "",
  };
  it("una página exige contenido", () => {
    expect(esquemaItem.safeParse({ ...base, tipo: "pagina" }).success).toBe(false);
    expect(esquemaItem.safeParse({ ...base, tipo: "pagina", contenido_md: "Hola" }).success).toBe(true);
  });
  it("un enlace exige URL http(s) y limpia lo que no corresponde", () => {
    expect(esquemaItem.safeParse({ ...base, tipo: "enlace", url: "javascript:x" }).success).toBe(false);
    const r = esquemaItem.parse({
      ...base,
      tipo: "enlace",
      url: "https://ejemplo.test",
      contenido_md: "sobra",
    });
    expect(r.contenido_md).toBeNull();
  });
  it("aprobar solo para exámenes", () => {
    expect(
      esquemaItem.safeParse({ ...base, tipo: "pagina", contenido_md: "x", requisito: "aprobar" }).success,
    ).toBe(false);
  });
});

describe("esquemaItem con exámenes y prácticas", () => {
  const base = { modulo_id: "c5000000-0000-4000-8000-000000000001", titulo: "Paso", orden: "1" };
  const EX = "d1000000-0000-4000-8000-000000000001";
  it("un paso de examen necesita el examen y puede exigir aprobar", () => {
    expect(
      esquemaItem.safeParse({ ...base, tipo: "examen", requisito: "aprobar", examen_id: "" }).success,
    ).toBe(false);
    expect(
      esquemaItem.safeParse({ ...base, tipo: "examen", requisito: "aprobar", examen_id: EX }).data?.examen_id,
    ).toBe(EX);
  });
  it("un paso de práctica necesita la práctica y se cumple marcándolo hecho", () => {
    expect(
      esquemaItem.safeParse({ ...base, tipo: "practica", requisito: "marcar_hecho", examen_id: "" }).success,
    ).toBe(false);
    expect(
      esquemaItem.safeParse({ ...base, tipo: "practica", requisito: "marcar_hecho", examen_id: EX }).success,
    ).toBe(true);
    expect(
      esquemaItem.safeParse({ ...base, tipo: "practica", requisito: "aprobar", examen_id: EX }).success,
    ).toBe(false);
  });
  it("los demás tipos no guardan examen", () => {
    expect(
      esquemaItem.safeParse({ ...base, tipo: "pagina", requisito: "ver", contenido_md: "x", examen_id: EX })
        .data?.examen_id,
    ).toBeNull();
  });
});
