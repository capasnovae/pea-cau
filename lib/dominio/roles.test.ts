import { describe, expect, it } from "vitest";
import { menuPorRol, rutaInicio } from "./roles";

const BASE = ["/inicio", "/estudiar", "/calendario", "/bandeja", "/examenes", "/repositorio", "/organigrama"];

describe("menuPorRol", () => {
  it("al asesor le muestra la barra tipo Canvas, con Ayuda al final", () => {
    expect(menuPorRol("asesor").map((i) => i.href)).toEqual([...BASE, "/ayuda"]);
  });
  it("al líder le suma su equipo antes de Ayuda", () => {
    expect(menuPorRol("lider").map((i) => i.href)).toEqual([...BASE, "/equipo/panel", "/ayuda"]);
  });
  it("al coordinador y al director les suma la gestión de contenido", () => {
    expect(menuPorRol("coordinador").map((i) => i.href)).toEqual([
      ...BASE,
      "/equipo/panel",
      "/contenido",
      "/ayuda",
    ]);
    expect(menuPorRol("director").map((i) => i.href)).toEqual([
      ...BASE,
      "/equipo/panel",
      "/contenido",
      "/ayuda",
    ]);
  });
  it("al admin le suma una sola entrada de administración", () => {
    expect(menuPorRol("admin").map((i) => i.href)).toEqual([
      ...BASE,
      "/equipo/panel",
      "/contenido",
      "/admin/usuarios",
      "/ayuda",
    ]);
    expect(menuPorRol("admin").find((i) => i.href === "/admin/usuarios")?.etiqueta).toBe("Admin");
  });
  it("cada ítem tiene etiqueta e ícono", () => {
    for (const i of menuPorRol("admin")) {
      expect(i.etiqueta).toBeTruthy();
      expect(i.icono).toBeTruthy();
    }
    expect(
      menuPorRol("asesor")
        .map((i) => i.etiqueta)
        .slice(0, 4),
    ).toEqual(["Tablero", "Cursos", "Calendario", "Bandeja"]);
  });
});

describe("rutaInicio", () => {
  it("manda a todos a /inicio", () => {
    expect(rutaInicio("director")).toBe("/inicio");
  });
});
