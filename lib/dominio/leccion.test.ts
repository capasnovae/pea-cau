import { describe, expect, it } from "vitest";
import {
  etiquetaRequisito,
  idsRecursoEnMarkdown,
  porcentaje,
  reemplazarRecursos,
  tipoCaja,
  urlEmbedVideo,
} from "./leccion";

const U1 = "0b1c2d3e-4f50-4a61-8b72-9c83d4e5f601";
const U2 = "8a4f6a3e-0b8d-4f7e-9a51-1d2c3b4a5e6f";

describe("urlEmbedVideo", () => {
  it("YouTube largo y corto", () => {
    expect(urlEmbedVideo("https://www.youtube.com/watch?v=abc123XYZ_-")).toBe(
      "https://www.youtube-nocookie.com/embed/abc123XYZ_-",
    );
    expect(urlEmbedVideo("https://youtu.be/abc123XYZ_-?t=10")).toBe(
      "https://www.youtube-nocookie.com/embed/abc123XYZ_-",
    );
  });
  it("Vimeo", () => {
    expect(urlEmbedVideo("https://vimeo.com/123456789")).toBe("https://player.vimeo.com/video/123456789");
  });
  it("cualquier otra cosa no se embebe", () => {
    expect(urlEmbedVideo("javascript:alert(1)")).toBeNull();
    expect(urlEmbedVideo("https://evil.test/watch?v=abc")).toBeNull();
    expect(urlEmbedVideo("https://youtube.com.evil.test/watch?v=abc")).toBeNull();
  });
});

describe("recursos en Markdown", () => {
  const md = `Hola ![paso 1](recurso:${U1}) y ![paso 2](recurso:${U2}) y otra vez ![x](recurso:${U1})`;
  it("encuentra ids únicas", () => {
    expect(idsRecursoEnMarkdown(md)).toEqual([U1, U2]);
  });
  it("reemplaza las resueltas y marca las que no", () => {
    const out = reemplazarRecursos(md, { [U1]: "https://firmada/1" });
    expect(out).toContain("](https://firmada/1)");
    expect(out).toContain("](#imagen-no-disponible)");
    expect(out).not.toContain("recurso:");
  });
});

describe("tipoCaja", () => {
  it("reconoce error común y tip", () => {
    expect(tipoCaja("**Error común:** no cerrar el ticket")).toBe("error");
    expect(tipoCaja("**Tip:** usá el buscador")).toBe("tip");
    expect(tipoCaja("una cita")).toBeNull();
  });
});

describe("porcentaje", () => {
  it("redondea y evita dividir por cero", () => {
    expect(porcentaje(1, 3)).toBe(33);
    expect(porcentaje(0, 0)).toBe(0);
    expect(porcentaje(3, 3)).toBe(100);
  });
});

describe("etiquetaRequisito", () => {
  it("una lección con Probalo se cumple completándolo", () => {
    expect(etiquetaRequisito("marcar_hecho", true)).toBe("Completar el Probalo");
  });
  it("sin Probalo, la etiqueta de siempre", () => {
    expect(etiquetaRequisito("marcar_hecho", false)).toBe("Marcar como hecho");
    expect(etiquetaRequisito("ver", true)).toBe("Ver");
  });
});
