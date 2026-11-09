import { describe, expect, it } from "vitest";
import { aCsv, motivosAtraso, porCategoria, rankingPreguntas, tasa, type FilaAsesor } from "./panel";

const AHORA = new Date("2026-11-12T12:00:00Z");
const fila = (c: Partial<FilaAsesor> = {}): FilaAsesor => ({
  usuario_id: "u",
  nombre: "Ana",
  apellido: "Paz",
  sede: "Neuquén",
  equipo: null,
  puesto: null,
  nivel_actual: 1,
  cursos_total: 2,
  cursos_cumplidos: 1,
  ultima_actividad: "2026-11-11T12:00:00Z",
  consignas_vencidas: 0,
  cert_vencidas: 0,
  cert_por_vencer: 0,
  ...c,
});

describe("motivosAtraso", () => {
  it("al día no tiene motivos", () => {
    expect(motivosAtraso(fila(), AHORA)).toEqual([]);
  });
  it("sin actividad desde hace más de 14 días, o nunca", () => {
    expect(motivosAtraso(fila({ ultima_actividad: "2026-10-23T12:00:00Z" }), AHORA)).toEqual([
      "Sin actividad hace 20 días",
    ]);
    expect(motivosAtraso(fila({ ultima_actividad: "2026-10-29T12:00:00Z" }), AHORA)).toEqual([]);
    expect(motivosAtraso(fila({ ultima_actividad: null }), AHORA)).toEqual(["Sin actividad"]);
  });
  it("consignas y certificaciones", () => {
    expect(
      motivosAtraso(fila({ consignas_vencidas: 1, cert_vencidas: 1, cert_por_vencer: 2 }), AHORA),
    ).toEqual(["1 consigna vencida", "Certificación vencida", "Vence pronto"]);
    expect(motivosAtraso(fila({ consignas_vencidas: 3 }), AHORA)).toEqual(["3 consignas vencidas"]);
  });
});

describe("tasa", () => {
  it("porcentaje redondeado, null sin respuestas", () => {
    expect(tasa(2, 3)).toBe(67);
    expect(tasa(0, 0)).toBeNull();
  });
});

const pregunta = (
  id: string,
  respuestas: number,
  aciertos: number,
  categoria: string | null = "Reglamento",
) => ({
  pregunta_id: id,
  enunciado_md: id,
  tipo: "opcion_multiple",
  uso: "examen",
  categoria,
  modulo: null,
  respuestas,
  aciertos,
});

describe("rankingPreguntas", () => {
  it("de menor a mayor tasa, solo con 5 respuestas o más", () => {
    const r = rankingPreguntas([
      pregunta("a", 10, 9),
      pregunta("b", 4, 0),
      pregunta("c", 5, 1),
      pregunta("d", 8, 4),
    ]);
    expect(r.map((p) => p.pregunta_id)).toEqual(["c", "d", "a"]);
  });
});

describe("porCategoria", () => {
  it("suma por categoría y ordena de peor a mejor", () => {
    expect(
      porCategoria([
        pregunta("a", 10, 9, "HubSpot"),
        pregunta("b", 10, 3),
        pregunta("c", 10, 5),
        pregunta("d", 2, 0, null),
      ]),
    ).toEqual([
      { categoria: "Sin categoría", respuestas: 2, aciertos: 0, tasa: 0 },
      { categoria: "Reglamento", respuestas: 20, aciertos: 8, tasa: 40 },
      { categoria: "HubSpot", respuestas: 10, aciertos: 9, tasa: 90 },
    ]);
  });
});

describe("aCsv", () => {
  const columnas = [
    { clave: "nombre", titulo: "Nombre" },
    { clave: "n", titulo: "N" },
  ];
  it("BOM, punto y coma y CRLF", () => {
    expect(aCsv(columnas, [{ nombre: "Ana", n: 3 }])).toBe("﻿Nombre;N\r\nAna;3\r\n");
  });
  it("escapa comillas, separadores y saltos de línea; null queda vacío", () => {
    expect(aCsv(columnas, [{ nombre: 'Di "Pa";z\nx', n: null }])).toBe('﻿Nombre;N\r\n"Di ""Pa"";z\nx";\r\n');
  });
  it("neutraliza fórmulas", () => {
    for (const f of ["=SUMA(1)", "+1", "-1", "@A1"])
      expect(aCsv(columnas, [{ nombre: f, n: 1 }])).toBe(`﻿Nombre;N\r\n'${f};1\r\n`);
  });
  it("los números negativos no se tocan", () => {
    expect(aCsv(columnas, [{ nombre: "x", n: -2 }])).toBe("﻿Nombre;N\r\nx;-2\r\n");
  });
});
