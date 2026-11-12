export type Tema = "sistema" | "claro" | "oscuro";
export const TEMAS: Tema[] = ["sistema", "claro", "oscuro"];
export const COOKIE_TEMA = "pea-tema";

export function temaDesdeCookie(valor: string | undefined): Tema {
  return valor === "claro" || valor === "oscuro" ? valor : "sistema";
}

/**
 * Lee las variables de color de globals.css: el bloque `:root` (claro) o el de `[data-theme="dark"]` (oscuro),
 * que en el tema oscuro pisa a las de `:root`.
 */
export function leerTokens(css: string, tema: "claro" | "oscuro"): Record<string, string> {
  const bloque = (selector: string) => {
    const i = css.indexOf(selector);
    if (i < 0) return {};
    const desde = css.indexOf("{", i) + 1;
    const hasta = css.indexOf("}", desde);
    const out: Record<string, string> = {};
    for (const m of css.slice(desde, hasta).matchAll(/(--[\w-]+)\s*:\s*([^;]+);/g)) out[m[1]!] = m[2]!.trim();
    return out;
  };
  const claro = bloque(":root {");
  return tema === "claro" ? claro : { ...claro, ...bloque(':root[data-theme="dark"] {') };
}

function luminancia(hex: string): number {
  const n = Number.parseInt(hex.slice(1), 16);
  const canal = (c: number) => {
    const v = c / 255;
    return v <= 0.03928 ? v / 12.92 : ((v + 0.055) / 1.055) ** 2.4;
  };
  return 0.2126 * canal((n >> 16) & 255) + 0.7152 * canal((n >> 8) & 255) + 0.0722 * canal(n & 255);
}

/** Relación de contraste WCAG entre dos colores hex de 6 dígitos. */
export function contraste(a: string, b: string): number {
  const [x, y] = [luminancia(a), luminancia(b)].sort((p, q) => q - p) as [number, number];
  return (x + 0.05) / (y + 0.05);
}
