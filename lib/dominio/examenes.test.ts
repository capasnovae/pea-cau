import { describe, expect, it } from "vitest";
import {
  aprobo,
  errorExamen,
  esquemaExamen,
  esquemaPregunta,
  esquemaCaso,
  estadoExamen,
  formatoDuracion,
  mensajeDeCodigo,
  normalizarTexto,
  notaFinal,
} from "./examenes";

const UUID = "c4000000-0000-4000-8000-000000000001";
const base = {
  enunciado_md: "¿Qué?",
  explicacion_md: "",
  puntaje_max: "1",
  dificultad: "1",
  categoria_id: UUID,
  alcance: "global",
  sede_id: "",
  estado: "publicado",
  uso: "examen",
};

describe("notas", () => {
  it("calcula la nota sobre el puntaje máximo", () => {
    expect(
      notaFinal([
        { puntaje: 1, max: 1 },
        { puntaje: 0, max: 1 },
        { puntaje: 2, max: 2 },
      ]),
    ).toBe(75);
    expect(notaFinal([])).toBe(0);
  });
  it("aprueba con la nota mínima o más", () => {
    expect(aprobo(80, 80)).toBe(true);
    expect(aprobo(79, 80)).toBe(false);
  });
  it("formatea la duración del reloj", () => {
    expect(formatoDuracion(725)).toBe("12:05");
    expect(formatoDuracion(3723)).toBe("1:02:03");
    expect(formatoDuracion(-5)).toBe("0:00");
  });
});

describe("estadoExamen", () => {
  const e = { aprobado: false, en_curso: false, pendiente: false, intentos_restantes: 2, espera_hasta: null };
  it("el aprobado gana sobre todo", () => {
    expect(estadoExamen({ ...e, aprobado: true, en_curso: true })).toBe("aprobado");
  });
  it("sin intentos y con espera futura queda en espera", () => {
    expect(estadoExamen({ ...e, intentos_restantes: 0, espera_hasta: "2999-01-01T00:00:00Z" })).toBe(
      "en_espera",
    );
    expect(estadoExamen(e)).toBe("disponible");
    expect(estadoExamen({ ...e, pendiente: true })).toBe("pendiente");
  });
});

describe("normalizarTexto", () => {
  it("compara sin mayúsculas, acentos ni espacios de más", () => {
    expect(normalizarTexto("  Mesa de  Ayuda ")).toBe("mesa de ayuda");
    expect(normalizarTexto("Área")).toBe("area");
  });
});

describe("esquemaPregunta", () => {
  const op = (texto: string, es_correcta = false) => ({ texto, es_correcta, grupo: "" });
  it("V/F lleva exactamente dos opciones", () => {
    expect(
      esquemaPregunta.safeParse({
        ...base,
        tipo: "verdadero_falso",
        opciones: [op("V", true), op("F"), op("X")],
      }).success,
    ).toBe(false);
  });
  it("opción múltiple necesita al menos una correcta y acepta varias", () => {
    expect(
      esquemaPregunta.safeParse({ ...base, tipo: "opcion_multiple", opciones: [op("a"), op("b")] }).success,
    ).toBe(false);
    expect(
      esquemaPregunta.safeParse({
        ...base,
        tipo: "opcion_multiple",
        opciones: [op("a", true), op("b", true), op("c")],
      }).success,
    ).toBe(true);
  });
  it("libre necesita rúbrica y simulación necesita caso", () => {
    expect(esquemaPregunta.safeParse({ ...base, tipo: "libre", rubrica_md: "", opciones: [] }).success).toBe(
      false,
    );
    expect(
      esquemaPregunta.safeParse({
        ...base,
        tipo: "simulacion",
        caso_id: "",
        opciones: [op("a", true), op("b")],
      }).success,
    ).toBe(false);
  });
  it("clasificar exige columnas existentes", () => {
    const r = esquemaPregunta.safeParse({
      ...base,
      tipo: "clasificar",
      columnas: ["CAU", "Tesorería"],
      opciones: [
        { texto: "Reinscripción", es_correcta: false, grupo: "CAU" },
        { texto: "Cuota", es_correcta: false, grupo: "Otra" },
      ],
    });
    expect(r.success).toBe(false);
  });
  it("formulario exige un valor aceptado por campo", () => {
    const r = esquemaPregunta.safeParse({
      ...base,
      tipo: "formulario",
      opciones: [],
      campos: [{ id: "area", etiqueta: "Área", tipo: "texto", opciones: [], aceptadas: [] }],
    });
    expect(r.success).toBe(false);
  });
});

describe("esquemaExamen", () => {
  const ex = {
    titulo: "Ex",
    cantidad_preguntas: "5",
    nota_minima: "80",
    max_intentos: "3",
    espera_horas: "24",
    alcance: "global",
    sede_id: "",
    estado: "publicado",
    fuentes: [],
  };
  it("un examen de módulo necesita módulo y un integrador necesita fuentes", () => {
    expect(esquemaExamen.safeParse({ ...ex, tipo: "modulo", modulo_id: "" }).success).toBe(false);
    expect(esquemaExamen.safeParse({ ...ex, tipo: "integrador" }).success).toBe(false);
  });
  it("un checkbox destildado (sin la clave) es false", () => {
    expect(esquemaExamen.safeParse({ ...ex, tipo: "categoria", categoria_id: UUID }).data?.mezclar).toBe(
      false,
    );
  });
  it("una práctica necesita módulo o categoría", () => {
    expect(esquemaExamen.safeParse({ ...ex, tipo: "practica" }).success).toBe(false);
    expect(esquemaExamen.safeParse({ ...ex, tipo: "practica", categoria_id: UUID }).success).toBe(true);
  });
  it("normaliza el tiempo vacío y el checkbox de mezclar", () => {
    const r = esquemaExamen.safeParse({
      ...ex,
      tipo: "categoria",
      categoria_id: UUID,
      tiempo_limite_min: "",
      mezclar: "on",
    });
    expect(r.data?.tiempo_limite_min).toBeNull();
    expect(r.data?.mezclar).toBe(true);
  });
});

describe("errorExamen", () => {
  it("traduce los errores de la base a un código y una frase corta", () => {
    expect(errorExamen("ya aprobado")).toEqual({ codigo: "ya-aprobado", mensaje: "Ya lo aprobaste." });
    expect(errorExamen("sin preguntas").mensaje).toBe("Este examen todavía no tiene preguntas.");
    expect(errorExamen("no disponible").mensaje).toBe("Completá lo anterior para rendirlo.");
    expect(errorExamen("tiempo agotado").mensaje).toBe("Se terminó el tiempo.");
    expect(errorExamen("cualquier cosa").codigo).toBe("error");
  });
  it("el código vuelve a la frase", () => {
    expect(mensajeDeCodigo("pendiente")).toBe("Tenés un intento pendiente de corrección.");
    expect(mensajeDeCodigo("x")).toBeNull();
  });
});

describe("esquemaCaso", () => {
  it("exige título y sede si es de sede", () => {
    const base = {
      titulo: "Caso",
      contexto_md: "x",
      categoria_id: "",
      alcance: "global",
      sede_id: "",
      estado: "publicado",
    };
    expect(esquemaCaso.safeParse({ ...base, titulo: " " }).success).toBe(false);
    expect(esquemaCaso.safeParse({ ...base, alcance: "sede" }).success).toBe(false);
    expect(esquemaCaso.safeParse(base).data?.categoria_id).toBeNull();
  });
});
