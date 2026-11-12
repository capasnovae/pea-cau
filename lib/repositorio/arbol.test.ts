import { describe, expect, it } from "vitest";
import { armarArbol } from "./arbol";

describe("armarArbol", () => {
  it("anida hijos bajo su padre y ordena", () => {
    const arbol = armarArbol([
      { id: "b", padre_id: "a", orden: 2, titulo: "B" },
      { id: "a", padre_id: null, orden: 1, titulo: "A" },
      { id: "c", padre_id: "a", orden: 1, titulo: "C" },
    ]);
    expect(arbol.map((n) => n.id)).toEqual(["a"]);
    expect(arbol[0]?.hijos.map((n) => n.id)).toEqual(["c", "b"]);
  });
  it("deja en la raíz a los que tienen un padre que no se ve", () => {
    expect(armarArbol([{ id: "x", padre_id: "oculto", orden: 0, titulo: "X" }]).map((n) => n.id)).toEqual([
      "x",
    ]);
  });
});
