import { describe, expect, it } from "vitest";
import { menuPorRol, rutaInicio } from "./roles";

describe("menuPorRol", () => {
  it("al asesor le muestra inicio y perfil", () => {
    expect(menuPorRol("asesor").map((i) => i.href)).toEqual(["/inicio", "/perfil"]);
  });
  it("al coordinador le muestra inicio y perfil en esta etapa", () => {
    expect(menuPorRol("coordinador").map((i) => i.href)).toEqual(["/inicio", "/perfil"]);
  });
  it("al admin le suma la administración", () => {
    expect(menuPorRol("admin").map((i) => i.href)).toEqual([
      "/inicio",
      "/perfil",
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
