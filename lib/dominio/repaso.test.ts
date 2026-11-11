import { describe, expect, it } from "vitest";
import { textoRacha, textoRepaso } from "./repaso";

describe("repaso", () => {
  it("la racha se dice en días y no se muestra en cero", () => {
    expect(textoRacha(0)).toBe("");
    expect(textoRacha(1)).toBe("Racha de 1 día");
    expect(textoRacha(7)).toBe("Racha de 7 días");
  });
  it("el resumen cuenta preguntas", () => {
    expect(textoRepaso(1)).toBe("1 pregunta");
    expect(textoRepaso(5)).toBe("5 preguntas");
  });
});
