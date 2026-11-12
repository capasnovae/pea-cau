import { describe, expect, it } from "vitest";
import { leerFiltrosUsuarios } from "./filtros-usuarios";

describe("leerFiltrosUsuarios", () => {
  it("ignora valores inválidos y muestra activos por defecto", () => {
    expect(leerFiltrosUsuarios({ rol: "superadmin", estado: "x" })).toEqual({
      q: "",
      sede: null,
      rol: null,
      estado: "activos",
    });
  });
  it("recorta el texto y acepta un rol válido", () => {
    const f = leerFiltrosUsuarios({ q: "  Ana ", rol: "lider" });
    expect(f.q).toBe("Ana");
    expect(f.rol).toBe("lider");
  });
  it("acepta una sede uuid y descarta basura", () => {
    expect(leerFiltrosUsuarios({ sede: "8a4f6a3e-0b8d-4f7e-9a51-1d2c3b4a5e6f" }).sede).toBe(
      "8a4f6a3e-0b8d-4f7e-9a51-1d2c3b4a5e6f",
    );
    expect(leerFiltrosUsuarios({ sede: "1 or 1=1" }).sede).toBeNull();
  });
  it("saca caracteres que rompen el filtro de texto", () => {
    expect(leerFiltrosUsuarios({ q: "ana,(x)%" }).q).toBe("anax");
  });
});
