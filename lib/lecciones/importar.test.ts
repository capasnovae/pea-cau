import { readdirSync, readFileSync } from "node:fs";
import { join } from "node:path";
import { describe, expect, it } from "vitest";
import { esquemaLeccion } from "../dominio/lecciones";
import { z } from "zod";
import { CURSOS, armarSqlLecciones, idDe, leerLeccion } from "./importar";

const md = `---
titulo: "Cambio de modalidad"
curso: "tramites"
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
      curso: "tramites",
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
  it("un curso o un módulo que no existen avisan con la ruta", () => {
    expect(() => leerLeccion("x/a.md", md.replace('curso: "tramites"', 'curso: "otro"'))).toThrow("x/a.md");
    expect(() => leerLeccion("x/b.md", md.replace('modulo: "Trámites"', 'modulo: "Egreso"'))).toThrow(
      "x/b.md",
    );
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
  it("cada curso del catálogo tiene lecciones en todos sus módulos", () => {
    const ls = archivos.map((f) => leerLeccion(join(dir, f), readFileSync(join(dir, f), "utf8")));
    for (const c of CURSOS)
      for (const m of c.modulos)
        expect(
          ls.some((l) => l.curso === c.slug && l.modulo === m),
          `${c.slug} / ${m}`,
        ).toBe(true);
  });
  it.each(archivos)("%s es válida, con fuente existente y Probalo de 1 a 3 preguntas", (f) => {
    const l = leerLeccion(join(dir, f), readFileSync(join(dir, f), "utf8"));
    expect(esquemaLeccion.safeParse(l.leccion).success).toBe(true);
    expect(slugs.has(l.fuente)).toBe(true);
    expect(l.probalo.length).toBeGreaterThanOrEqual(1);
    expect(l.probalo.length).toBeLessThanOrEqual(3);
    expect(
      l.probalo.filter((p) => p.tipo === "verdadero_falso").length,
      "como máximo un V/F",
    ).toBeLessThanOrEqual(1);
    for (const p of l.probalo) {
      expect(p.explicacion, `explicación general: ${p.enunciado}`).not.toBe("");
      for (const o of p.opciones) {
        expect(o.texto.length).toBeLessThanOrEqual(500);
        expect((o.explicacion ?? "").length).toBeLessThanOrEqual(400);
      }
      if (p.tipo === "ordenar") expect(p.opciones.length).toBeGreaterThanOrEqual(3);
      else if (p.tipo === "clasificar") expect(p.columnas!.length).toBeGreaterThanOrEqual(2);
      else expect(p.opciones.filter((o) => o.correcta)).toHaveLength(1);
    }
  });
});

describe("idDe", () => {
  it("genera UUID válidos y estables (el servidor valida los ids con z.uuid)", () => {
    const id = idDe("pea-pregunta:05-cambio-de-modalidad:1");
    expect(z.uuid().safeParse(id).success).toBe(true);
    expect(idDe("pea-pregunta:05-cambio-de-modalidad:1")).toBe(id);
    expect(idDe("pea-pregunta:05-cambio-de-modalidad:2")).not.toBe(id);
  });
});

describe("armarSqlLecciones", () => {
  const sql = armarSqlLecciones([leerLeccion("contenido/lecciones/02-cambio-de-modalidad.md", md)]);
  it("crea el curso en borrador, el módulo, el ítem y el Probalo con ids estables", () => {
    expect(sql).toContain("'capacitacion'");
    expect(sql).toContain(`'${idDe("pea-curso:tramites")}'`);
    expect(sql).toContain(`'${idDe("pea-modulo:tramites:Trámites")}'`);
    expect(sql).not.toContain("Reglamento esencial");
    expect(sql).not.toContain("Plataformas del estudiante");
    expect(sql).toMatch(/'borrador'/);
    expect(sql).toContain("'leccion'");
    expect(sql).toContain("'marcar_hecho'");
    expect(sql).toContain("'practica'");
    expect(sql).toContain(`'${idDe("pea-item:02-cambio-de-modalidad")}'`);
    expect(sql).toContain("rg-3-2-cambios-de-modalidad");
    expect(sql).toContain("on conflict (id) do update");
  });
  it("es determinístico", () => {
    expect(armarSqlLecciones([leerLeccion("contenido/lecciones/02-cambio-de-modalidad.md", md)])).toBe(sql);
  });
});

const mdRico = `---
titulo: "Inscripción a exámenes"
curso: "evaluacion"
modulo: "Trabajos y exámenes"
orden: 3
fuente: "ln-inscripcion-a-examenes"
---

## En 30 segundos

- Se inscribe desde el Portal.

## Así llega al CAU

- "¿Dónde me anoto?" → En el Portal, en Exámenes.

## Probalo

### unica: Ana cursa EDH y quiere rendir el jueves. ¿Qué le decís?

- [ ] Que vaya directo a la mesa.
  > En EDH la inscripción previa es obligatoria.
- [x] Que se inscriba antes en el Portal.
  > Sin inscripción no figura en el acta.

> Siempre hay que inscribirse antes de rendir.

### ordenar: Ordená los pasos para inscribirse.

1. Entrar al Portal.
2. Ir a Exámenes.
3. Elegir la mesa y confirmar.

> El orden es el del Portal.

### clasificar: ¿Dónde se resuelve cada consulta?

- Cambio de mesa → CAU
- Pago de una cuota → Tesorería
- Duda de inscripción → CAU

> Lo administrativo de exámenes es del CAU.
`;

describe("Probalo con tipos ricos", () => {
  const l = leerLeccion("contenido/lecciones/22-inscripcion.md", mdRico);
  it("lee la explicación de cada opción, aparte de la general", () => {
    const [p] = l.probalo;
    expect(p!.tipo).toBe("opcion_multiple");
    expect(p!.opciones.map((o) => o.explicacion)).toEqual([
      "En EDH la inscripción previa es obligatoria.",
      "Sin inscripción no figura en el acta.",
    ]);
    expect(p!.explicacion).toBe("Siempre hay que inscribirse antes de rendir.");
  });
  it("lee las preguntas para ordenar con su posición correcta", () => {
    const p = l.probalo[1]!;
    expect(p.tipo).toBe("ordenar");
    expect(p.opciones.map((o) => [o.texto, o.posicion])).toEqual([
      ["Entrar al Portal.", 1],
      ["Ir a Exámenes.", 2],
      ["Elegir la mesa y confirmar.", 3],
    ]);
  });
  it("lee las preguntas para clasificar con sus columnas", () => {
    const p = l.probalo[2]!;
    expect(p.tipo).toBe("clasificar");
    expect(p.columnas).toEqual(["CAU", "Tesorería"]);
    expect(p.opciones.map((o) => o.grupo)).toEqual(["CAU", "Tesorería", "CAU"]);
  });
  it("arma el SQL con explicaciones, posiciones y columnas", () => {
    const sql = armarSqlLecciones([l]);
    expect(sql).toContain("'ordenar'");
    expect(sql).toContain("'clasificar'");
    expect(sql).toContain('{"columnas":["CAU","Tesorería"]}');
    expect(sql).toContain("En EDH la inscripción previa es obligatoria.");
    expect(sql).toContain('{"una":true}');
    expect(sql).toMatch(
      /opciones \(id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo\)/,
    );
  });
  it("actualiza solo lo que sigue en borrador y quita las preguntas que ya no están", () => {
    const sql = armarSqlLecciones([l]);
    expect(sql).toContain("on conflict (id) do update");
    expect(sql).toMatch(/estado = 'borrador'/);
    expect(sql).toContain(`delete from public.preguntas`);
    // Cada pregunta se actualiza (no se ignora) y sus opciones se rehacen
    expect(sql.match(/insert into public\.preguntas[^;]*on conflict \(id\) do update/g)).toHaveLength(3);
    expect(sql.match(/delete from public\.opciones where pregunta_id/g)).toHaveLength(3);
  });
});
