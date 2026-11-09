import { readdirSync, readFileSync } from "node:fs";
import { join } from "node:path";
import { describe, expect, it } from "vitest";
import { esquemaLeccion } from "../dominio/lecciones";
import { armarSqlLecciones, leerLeccion } from "./importar";

const md = `---
titulo: "Cambio de modalidad"
modulo: "Trámites"
orden: 2
fuente: "rg-3-2-cambios-de-modalidad"
---

## En 30 segundos

- Se pide en las fechas del calendario de trámites.
- Lo aprobado y lo regular se conservan.

## Así llega al CAU

- "Tengo 3 materias cursando, ¿las pierdo?" → Quedan Libre por Pase: las recursa.

## Ojo con

- "Libre por nota" no se conserva.

## Probalo

### unica: Un alumno con mesa el jueves pide el pase hoy. ¿Qué le respondés?

- [ ] Que lo hace sin problema.
- [x] Que primero rinda o se dé de baja de la mesa.

> No se puede estar inscripto a un final al pedir el pase.

### vf: Las materias regulares se conservan.

- [x] Verdadero
- [ ] Falso
`;

describe("leerLeccion", () => {
  it("lee la metadata, los bloques y el Probalo", () => {
    const l = leerLeccion("contenido/lecciones/02-cambio-de-modalidad.md", md);
    expect(l).toMatchObject({
      slug: "02-cambio-de-modalidad",
      titulo: "Cambio de modalidad",
      modulo: "Trámites",
      orden: 2,
      fuente: "rg-3-2-cambios-de-modalidad",
    });
    expect(l.leccion).toEqual({
      resumen: [
        "Se pide en las fechas del calendario de trámites.",
        "Lo aprobado y lo regular se conservan.",
      ],
      ejemplos: [
        {
          consulta: "Tengo 3 materias cursando, ¿las pierdo?",
          respuesta: "Quedan Libre por Pase: las recursa.",
        },
      ],
      ojo: ['"Libre por nota" no se conserva.'],
    });
    expect(l.probalo).toEqual([
      {
        tipo: "opcion_multiple",
        enunciado: "Un alumno con mesa el jueves pide el pase hoy. ¿Qué le respondés?",
        opciones: [
          { texto: "Que lo hace sin problema.", correcta: false },
          { texto: "Que primero rinda o se dé de baja de la mesa.", correcta: true },
        ],
        explicacion: "No se puede estar inscripto a un final al pedir el pase.",
      },
      {
        tipo: "verdadero_falso",
        enunciado: "Las materias regulares se conservan.",
        opciones: [
          { texto: "Verdadero", correcta: true },
          { texto: "Falso", correcta: false },
        ],
        explicacion: "",
      },
    ]);
  });
  it("sin el bloque En 30 segundos avisa con la ruta", () => {
    expect(() => leerLeccion("x/roto.md", md.replace("## En 30 segundos", "## Otro"))).toThrow("x/roto.md");
  });
});

describe("lecciones de contenido/lecciones", () => {
  const dir = "contenido/lecciones";
  const archivos = readdirSync(dir).filter((f) => f.endsWith(".md"));
  const slugs = new Set(
    ["reglamento", "lanube"].flatMap((s) =>
      readdirSync(join("relevamiento", s)).map(
        (f) => `${s === "reglamento" ? "rg" : "ln"}-${f.replace(/\.md$/, "")}`,
      ),
    ),
  );
  it("son 34", () => expect(archivos).toHaveLength(34));
  it.each(archivos)("%s es válida, con fuente existente y Probalo de 1 a 3 preguntas", (f) => {
    const l = leerLeccion(join(dir, f), readFileSync(join(dir, f), "utf8"));
    expect(esquemaLeccion.safeParse(l.leccion).success).toBe(true);
    expect(slugs.has(l.fuente)).toBe(true);
    expect(l.probalo.length).toBeGreaterThanOrEqual(1);
    expect(l.probalo.length).toBeLessThanOrEqual(3);
    for (const p of l.probalo) expect(p.opciones.filter((o) => o.correcta)).toHaveLength(1);
  });
});

describe("armarSqlLecciones", () => {
  const sql = armarSqlLecciones([leerLeccion("contenido/lecciones/02-cambio-de-modalidad.md", md)]);
  it("crea el curso en borrador, el módulo, el ítem y el Probalo con ids estables", () => {
    expect(sql).toContain("'capacitacion'");
    expect(sql).toContain("Reglamento esencial");
    expect(sql).toMatch(/'borrador'/);
    expect(sql).toContain("'leccion'");
    expect(sql).toContain("'marcar_hecho'");
    expect(sql).toContain("'practica'");
    expect(sql).toContain("md5('pea-item:02-cambio-de-modalidad')::uuid");
    expect(sql).toContain("rg-3-2-cambios-de-modalidad");
    expect(sql).toContain("on conflict do nothing");
  });
  it("es determinístico", () => {
    expect(armarSqlLecciones([leerLeccion("contenido/lecciones/02-cambio-de-modalidad.md", md)])).toBe(sql);
  });
});
