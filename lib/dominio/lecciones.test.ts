import { describe, expect, it } from "vitest";
import {
  LIMITES_LECCION,
  esquemaLeccion,
  minutosDeLectura,
  esLeccionV2,
  esquemaLeccionV2,
} from "./lecciones";

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

const V2 = {
  version: 2 as const,
  tarjetas: [
    { tipo: "video", ruta: "lecciones/05.mp4" },
    { tipo: "caso", persona: "Lucía", canal: "whatsapp", consulta: "Me quiero pasar a ED, ¿qué hago?" },
    {
      tipo: "preguntar",
      opciones: [
        {
          texto: "¿Estás anotada a un final?",
          clave: true,
          porque: "Con un final anotado no puede pedir el pase.",
        },
        { texto: "¿Cuántos pases hiciste?", clave: true, porque: "Más de 2 pases no se permite." },
        { texto: "¿Cuál es tu color favorito?", clave: false, porque: "No cambia nada." },
      ],
    },
    {
      tipo: "idea",
      titulo: "Cuándo se pide",
      texto: "En las fechas del calendario de trámites.",
      clave: "Solo en fecha.",
    },
    { tipo: "probalo", n: 1 },
    { tipo: "ojo", texto: "Libre por Nota no se conserva." },
    {
      tipo: "cierre",
      resolucion: "Primero rinde el final, después pide el pase.",
      recordar: "Sin mesas pendientes.",
    },
  ],
};
const conTarjetas = (f: (t: (typeof V2)["tarjetas"]) => unknown[]) => ({
  ...V2,
  tarjetas: f([...V2.tarjetas]),
});

describe("esquemaLeccionV2", () => {
  it("acepta una lección por tarjetas válida", () => {
    expect(esquemaLeccionV2.safeParse(V2).success).toBe(true);
    expect(esLeccionV2(V2)).toBe(true);
  });
  it("pide entre 5 y 10 tarjetas", () => {
    expect(esquemaLeccionV2.safeParse(conTarjetas((t) => [t[1], t[3], t[6]].concat([t[5]]))).success).toBe(
      false,
    );
    const idea = V2.tarjetas[3];
    expect(esquemaLeccionV2.safeParse(conTarjetas((t) => [t[1], ...Array(9).fill(idea), t[6]])).success).toBe(
      false,
    );
  });
  it("respeta los largos y los valores permitidos", () => {
    expect(
      esquemaLeccionV2.safeParse(
        conTarjetas((t) => t.map((x) => (x.tipo === "idea" ? { ...x, texto: "a".repeat(501) } : x))),
      ).success,
    ).toBe(false);
    expect(
      esquemaLeccionV2.safeParse(
        conTarjetas((t) => t.map((x) => (x.tipo === "caso" ? { ...x, canal: "mail" } : x))),
      ).success,
    ).toBe(false);
  });
  it("preguntar lleva de 3 a 5 opciones y al menos una clave", () => {
    const pre = V2.tarjetas[2] as { opciones: { texto: string; clave: boolean; porque: string }[] };
    expect(
      esquemaLeccionV2.safeParse(
        conTarjetas((t) =>
          t.map((x) => (x.tipo === "preguntar" ? { ...x, opciones: pre.opciones.slice(0, 2) } : x)),
        ),
      ).success,
    ).toBe(false);
    expect(
      esquemaLeccionV2.safeParse(
        conTarjetas((t) =>
          t.map((x) =>
            x.tipo === "preguntar"
              ? { ...x, opciones: pre.opciones.map((o) => ({ ...o, clave: false })) }
              : x,
          ),
        ),
      ).success,
    ).toBe(false);
  });
  it("tiene un caso, termina en el cierre y el video, si está, va primero", () => {
    expect(esquemaLeccionV2.safeParse(conTarjetas((t) => t.filter((x) => x.tipo !== "caso"))).success).toBe(
      false,
    );
    expect(esquemaLeccionV2.safeParse(conTarjetas((t) => [...t.slice(0, 5), t[6], t[5]])).success).toBe(
      false,
    );
    expect(
      esquemaLeccionV2.safeParse(conTarjetas((t) => [...t.slice(1, 3), t[0], ...t.slice(3)])).success,
    ).toBe(false);
    expect(esquemaLeccionV2.safeParse(conTarjetas((t) => t.slice(1))).success).toBe(true);
  });
  it("una lección por bloques no es v2", () => {
    expect(esLeccionV2({ resumen: ["a"], ejemplos: [], ojo: [] })).toBe(false);
  });
  it("estima la lectura de una lección por tarjetas", () => {
    const larga = conTarjetas((t) =>
      t.map((x) => (x.tipo === "idea" ? { ...x, texto: "palabra ".repeat(900) } : x)),
    );
    expect(minutosDeLectura(larga as never)).toBe(5);
  });
});
