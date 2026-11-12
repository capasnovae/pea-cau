import { readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";
import type { LeccionV2 } from "../dominio/lecciones";
import { guionDeLeccion, segundosDeLectura } from "./guion";
import { leerLeccion } from "./importar";

const ruta = "contenido/lecciones/05-cambio-de-modalidad.md";
const muestra = leerLeccion(ruta, readFileSync(ruta, "utf8"));
const leccion = muestra.leccion as LeccionV2;

describe("segundosDeLectura", () => {
  it("lee a 2,5 palabras por segundo más 1,5 s, entre 3 y 12 segundos", () => {
    expect(segundosDeLectura("una dos tres cuatro cinco seis siete ocho nueve diez")).toBe(5.5);
    expect(segundosDeLectura("hola")).toBe(3);
    expect(segundosDeLectura("palabra ".repeat(100))).toBe(12);
  });
});

describe("guionDeLeccion", () => {
  const guion = guionDeLeccion(leccion, muestra.titulo);
  it("tiene portada, caso, una escena por idea con su frase clave, ojo y cierre", () => {
    expect(guion.map((e) => e.tipo)).toEqual(["portada", "caso", "idea", "idea", "idea", "ojo", "cierre"]);
    const ideas = leccion.tarjetas.filter((t) => t.tipo === "idea");
    guion
      .filter((e) => e.tipo === "idea")
      .forEach((e, i) => {
        expect(e.textos).toEqual([ideas[i]!.titulo, ideas[i]!.clave]);
        expect(e.textos.join(" ")).not.toContain(ideas[i]!.texto);
      });
  });
  it("dura lo que se lee: suma de escenas, y crece con cada idea", () => {
    const total = guion.reduce((s, e) => s + e.segundos, 0);
    expect(total).toBeGreaterThan(20);
    const otra: LeccionV2 = {
      version: 2,
      tarjetas: [
        ...leccion.tarjetas.slice(0, -1),
        { tipo: "idea", titulo: "Otra idea", texto: "x", clave: "Una frase clave más para recordar." },
        leccion.tarjetas.at(-1)!,
      ],
    };
    const total2 = guionDeLeccion(otra, muestra.titulo).reduce((s, e) => s + e.segundos, 0);
    expect(total2).toBeGreaterThan(total);
  });
});
