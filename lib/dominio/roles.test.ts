import { describe, expect, it } from "vitest";
import { menuPorRol, rutaInicio } from "./roles";

const BASE = ["/inicio", "/estudiar", "/consignas", "/repositorio", "/recursos", "/buscar", "/organigrama", "/perfil"];

describe("menuPorRol", () => {
  it("al asesor le muestra lo de consulta; al líder, además, su equipo", () => {
    expect(menuPorRol("asesor").map((i) => i.href)).toEqual(BASE);
    expect(menuPorRol("lider").map((i) => i.href)).toEqual([...BASE, "/equipo/consignas"]);
  });
  it("al coordinador y al director les suma la gestión de contenido", () => {
    expect(menuPorRol("coordinador").map((i) => i.href)).toEqual([...BASE, "/equipo/consignas", "/contenido"]);
    expect(menuPorRol("director").map((i) => i.href)).toEqual([...BASE, "/equipo/consignas", "/contenido"]);
  });
  it("al admin le suma contenido y administración", () => {
    expect(menuPorRol("admin").map((i) => i.href)).toEqual([
      ...BASE,
      "/equipo/consignas",
      "/contenido",
      "/admin/usuarios",
      "/admin/sedes",
      "/admin/equipos",
      "/admin/derivaciones",
    ]);
    expect(menuPorRol("admin").find((i) => i.href === "/admin/usuarios")?.etiqueta).toBe("Usuarios");
  });
});

describe("rutaInicio", () => {
  it("manda a todos a /inicio", () => {
    expect(rutaInicio("director")).toBe("/inicio");
  });
});
