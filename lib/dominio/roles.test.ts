import { describe, expect, it } from "vitest";
import { menuPorRol, rutaInicio } from "./roles";

const BASE = ["/inicio", "/repositorio", "/recursos", "/buscar", "/perfil"];

describe("menuPorRol", () => {
  it("al asesor y al líder les muestra lo de consulta", () => {
    expect(menuPorRol("asesor").map((i) => i.href)).toEqual(BASE);
    expect(menuPorRol("lider").map((i) => i.href)).toEqual(BASE);
  });
  it("al coordinador y al director les suma la gestión de contenido", () => {
    expect(menuPorRol("coordinador").map((i) => i.href)).toEqual([...BASE, "/contenido"]);
    expect(menuPorRol("director").map((i) => i.href)).toEqual([...BASE, "/contenido"]);
  });
  it("al admin le suma contenido y administración", () => {
    expect(menuPorRol("admin").map((i) => i.href)).toEqual([
      ...BASE,
      "/contenido",
      "/admin/usuarios",
      "/admin/sedes",
      "/admin/equipos",
    ]);
    expect(menuPorRol("admin").find((i) => i.href === "/admin/usuarios")?.etiqueta).toBe("Usuarios");
  });
});

describe("rutaInicio", () => {
  it("manda a todos a /inicio", () => {
    expect(rutaInicio("director")).toBe("/inicio");
  });
});
