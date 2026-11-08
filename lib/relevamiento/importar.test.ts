import { describe, expect, it } from "vitest";
import { armarSql, leerArchivo, resumenDe } from "./importar";

const md = `---
titulo: "Inscripción a materias"
fuente: "https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-2-inscripcion-a-materias"
extraido: "2026-11-08"
categoria: "reglamento"
capitulo: 5
estado: "a validar"
---

## CAPÍTULO 5 | INSCRIPCIÓN AL CURSADO

El período de inscripción está definido por el **Calendario Académico**.
`;

describe("leerArchivo", () => {
  it("separa la metadata del cuerpo", () => {
    const a = leerArchivo("reglamento/5-2-inscripcion-a-materias.md", md);
    expect(a.titulo).toBe("Inscripción a materias");
    expect(a.categoria).toBe("reglamento");
    expect(a.capitulo).toBe(5);
    expect(a.slug).toBe("rg-5-2-inscripcion-a-materias");
    expect(a.cuerpo.startsWith("## CAPÍTULO 5")).toBe(true);
  });
  it("las páginas de La Nube llevan su prefijo", () => {
    const a = leerArchivo("lanube/equivalencias.md", md.replace("capitulo: 5\n", ""));
    expect(a.slug).toBe("ln-equivalencias");
    expect(a.capitulo).toBeNull();
  });
});

describe("resumenDe", () => {
  it("toma el primer párrafo, sin títulos ni markdown, hasta 200 caracteres", () => {
    expect(
      resumenDe("## Título\n\nEl período de inscripción está definido por el **Calendario Académico**."),
    ).toBe("El período de inscripción está definido por el Calendario Académico.");
    expect(resumenDe("x".repeat(300)).length).toBeLessThanOrEqual(200);
  });
});

describe("armarSql", () => {
  it("inserta borradores globales con fuente y aviso de validación, sin romperse con comillas", () => {
    const a = leerArchivo(
      "lanube/equivalencias.md",
      md.replace("Calendario Académico", () => "Calendario 'Académico' $$"),
    );
    const sql = armarSql([a]);
    expect(sql).toContain("'borrador'");
    expect(sql).toContain("'global'");
    expect(sql).toContain(
      "https://contenidos.21.edu.ar/microsites/reglamento/index.php?put=5-2-inscripcion-a-materias",
    );
    expect(sql).toContain("A validar");
    expect(sql).toContain("on conflict (categoria_id, slug) do nothing");
    expect(sql).toContain("Calendario 'Académico' $$");
  });
  it("en una sección del reglamento, el resumen es de la sección y no de la introducción del capítulo", () => {
    const conSeccion = md.replace(
      "El período de inscripción está definido por el **Calendario Académico**.",
      () => "Intro del capítulo.\n\n### 5.2 INSCRIPCIÓN A MATERIAS\n\nTexto propio de la sección.",
    );
    expect(armarSql([leerArchivo("reglamento/5-2-inscripcion-a-materias.md", conSeccion)])).toContain(
      "$pea0$Texto propio de la sección.$pea0$",
    );
  });
  it("arma un artículo por capítulo del reglamento como padre de sus secciones", () => {
    const sql = armarSql([leerArchivo("reglamento/5-2-inscripcion-a-materias.md", md)]);
    expect(sql).toContain("rg-capitulo-5");
    expect(sql).toMatch(/padre_id/);
  });
});
