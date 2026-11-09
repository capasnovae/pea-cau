import { describe, expect, it } from "vitest";
import { LIMITES_LECCION, esquemaLeccion, minutosDeLectura } from "./lecciones";

const valida = {
  resumen: ["Se pide en las fechas del calendario."],
  ejemplos: [{ consulta: "¿Puedo pasarme?", respuesta: "Sí, si cumplís los requisitos." }],
  ojo: [],
};

describe("esquemaLeccion", () => {
  it("acepta una lección mínima", () => {
    expect(esquemaLeccion.safeParse(valida).success).toBe(true);
  });
  it("respeta los topes de cantidad", () => {
    expect(LIMITES_LECCION).toEqual({
      resumen: 5,
      ejemplos: 4,
      ojo: 4,
      idea: 200,
      consulta: 200,
      respuesta: 400,
    });
    expect(esquemaLeccion.safeParse({ ...valida, resumen: Array(5).fill("a") }).success).toBe(true);
    expect(esquemaLeccion.safeParse({ ...valida, resumen: Array(6).fill("a") }).success).toBe(false);
    expect(esquemaLeccion.safeParse({ ...valida, ejemplos: Array(4).fill(valida.ejemplos[0]) }).success).toBe(
      true,
    );
    expect(esquemaLeccion.safeParse({ ...valida, ejemplos: Array(5).fill(valida.ejemplos[0]) }).success).toBe(
      false,
    );
    expect(esquemaLeccion.safeParse({ ...valida, ojo: Array(5).fill("a") }).success).toBe(false);
  });
  it("respeta los topes de largo", () => {
    expect(esquemaLeccion.safeParse({ ...valida, resumen: ["x".repeat(200)] }).success).toBe(true);
    expect(esquemaLeccion.safeParse({ ...valida, resumen: ["x".repeat(201)] }).success).toBe(false);
    const ej = (respuesta: string) => ({ ...valida, ejemplos: [{ consulta: "c", respuesta }] });
    expect(esquemaLeccion.safeParse(ej("x".repeat(400))).success).toBe(true);
    expect(esquemaLeccion.safeParse(ej("x".repeat(401))).success).toBe(false);
  });
  it("recorta espacios y descarta renglones vacíos", () => {
    const r = esquemaLeccion.parse({
      resumen: ["  a  ", " ", ""],
      ejemplos: [
        { consulta: " c ", respuesta: " r " },
        { consulta: "", respuesta: "" },
      ],
      ojo: ["", " o "],
    });
    expect(r).toEqual({ resumen: ["a"], ejemplos: [{ consulta: "c", respuesta: "r" }], ojo: ["o"] });
  });
  it("sin ideas clave o sin ejemplos no", () => {
    expect(esquemaLeccion.safeParse({ ...valida, resumen: [" "] }).success).toBe(false);
    expect(esquemaLeccion.safeParse({ ...valida, ejemplos: [] }).success).toBe(false);
  });
});

describe("minutosDeLectura", () => {
  const conPalabras = (n: number) => ({
    ...valida,
    resumen: [Array(n).fill("pal").join(" ")],
    ejemplos: [{ consulta: "", respuesta: "" }],
  });
  it("calcula a 200 palabras por minuto, hacia arriba y como mínimo 1", () => {
    expect(minutosDeLectura(conPalabras(210))).toBe(2);
    expect(minutosDeLectura(conPalabras(10))).toBe(1);
  });
});
