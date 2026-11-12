import { readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";
import { contraste, leerTokens, temaDesdeCookie } from "./tema";

const css = readFileSync(new URL("../../app/globals.css", import.meta.url), "utf8");

// Pares texto / fondo que la interfaz usa de verdad. 4,5:1 para texto; 3:1 para bordes de controles.
const TEXTO: [string, string][] = [
  ["--foreground", "--background"],
  ["--foreground", "--card"],
  ["--muted", "--card"],
  ["--muted", "--background"],
  ["--subtle", "--card"],
  ["--primary-strong", "--card"],
  ["--primary-strong", "--primary-soft"],
  ["--primary-foreground", "--primary"],
  ["--success", "--card"],
  ["--success", "--success-soft"],
  ["--warning", "--card"],
  ["--warning", "--warning-soft"],
  ["--destructive", "--card"],
  ["--destructive", "--destructive-soft"],
  ["--nav-fg", "--nav"],
  ["--nav-fg-activo", "--nav"],
  ["--sobre-color", "--nivel-1"],
  ["--sobre-color", "--nivel-2"],
  ["--sobre-color", "--nivel-3"],
  ["--sobre-color", "--nivel-4"],
  ["--sobre-color", "--nivel-cap"],
  ["--sobre-color", "--success"],
  ["--nivel-1-fg", "--card"],
  ["--nivel-2-fg", "--card"],
  ["--nivel-3-fg", "--card"],
  ["--nivel-4-fg", "--card"],
  ["--nivel-cap-fg", "--card"],
  ["--avatar-fg", "--avatar"],
];

describe("contraste", () => {
  it("calcula la relación WCAG", () => {
    expect(contraste("#000000", "#ffffff")).toBeCloseTo(21, 0);
    expect(contraste("#4f46e5", "#ffffff")).toBeCloseTo(6.29, 1);
  });
});

describe.each(["claro", "oscuro"] as const)("tokens del tema %s", (tema) => {
  const t = leerTokens(css, tema);
  it.each(TEXTO)("%s sobre %s se lee (≥ 4,5:1)", (texto, fondo) => {
    expect(t[texto], texto).toMatch(/^#[0-9a-f]{6}$/i);
    expect(t[fondo], fondo).toMatch(/^#[0-9a-f]{6}$/i);
    expect(contraste(t[texto]!, t[fondo]!)).toBeGreaterThanOrEqual(4.5);
  });
  it("el borde de los campos se distingue (≥ 3:1)", () => {
    expect(contraste(t["--border-control"]!, t["--card"]!)).toBeGreaterThanOrEqual(3);
  });
});

describe("temaDesdeCookie", () => {
  it("acepta solo los valores conocidos", () => {
    expect(temaDesdeCookie("oscuro")).toBe("oscuro");
    expect(temaDesdeCookie("claro")).toBe("claro");
    expect(temaDesdeCookie(undefined)).toBe("sistema");
    expect(temaDesdeCookie("<script>")).toBe("sistema");
  });
});
