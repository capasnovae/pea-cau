const UUID = "[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}";

/** Solo YouTube y Vimeo se embeben; cualquier otra URL queda como link externo. */
export function urlEmbedVideo(url: string): string | null {
  let u: URL;
  try {
    u = new URL(url);
  } catch {
    return null;
  }
  if (u.protocol !== "https:" && u.protocol !== "http:") return null;
  const host = u.hostname.replace(/^www\./, "").replace(/^m\./, "");
  const idYt = /^[A-Za-z0-9_-]{6,20}$/;
  if (host === "youtube.com" && u.pathname === "/watch") {
    const id = u.searchParams.get("v") ?? "";
    return idYt.test(id) ? `https://www.youtube-nocookie.com/embed/${id}` : null;
  }
  if (host === "youtu.be") {
    const id = u.pathname.slice(1);
    return idYt.test(id) ? `https://www.youtube-nocookie.com/embed/${id}` : null;
  }
  if (host === "vimeo.com") {
    const id = u.pathname.slice(1);
    return /^\d{4,12}$/.test(id) ? `https://player.vimeo.com/video/${id}` : null;
  }
  return null;
}

export function idsRecursoEnMarkdown(md: string): string[] {
  const re = new RegExp(`\\]\\(recurso:(${UUID})\\)`, "gi");
  return [...new Set([...md.matchAll(re)].map((m) => m[1]!.toLowerCase()))];
}

export function reemplazarRecursos(md: string, urls: Record<string, string>): string {
  const re = new RegExp(`\\]\\(recurso:(${UUID})\\)`, "gi");
  return md.replace(re, (_t, id: string) => {
    const url = urls[id.toLowerCase()];
    return url ? `](${url})` : "](#imagen-no-disponible)";
  });
}

export function tipoCaja(texto: string): "error" | "tip" | null {
  const t = texto.trim().toLowerCase();
  if (t.startsWith("**error común:**") || t.startsWith("error común:")) return "error";
  if (t.startsWith("**tip:**") || t.startsWith("tip:")) return "tip";
  return null;
}

export function porcentaje(cumplidos: number, total: number): number {
  if (total <= 0) return 0;
  return Math.round((Math.min(cumplidos, total) / total) * 100);
}

export type RequisitoItem = "ninguno" | "ver" | "marcar_hecho" | "aprobar";
export const ETIQUETA_REQUISITO: Record<RequisitoItem, string> = {
  ninguno: "Opcional",
  ver: "Ver",
  marcar_hecho: "Marcar como hecho",
  aprobar: "Aprobar examen",
};

/** En una lección con Probalo publicado, "hecho" significa acertar el Probalo. */
export function etiquetaRequisito(requisito: RequisitoItem, conProbalo: boolean): string {
  return conProbalo && requisito === "marcar_hecho" ? "Completar el Probalo" : ETIQUETA_REQUISITO[requisito];
}

/** Los colores de nivel viven como tokens en app/globals.css; acá solo se nombran. */
export function colorNivel(n: number | null | undefined) {
  const t = n && n >= 1 && n <= 4 ? `--nivel-${n}` : "--nivel-cap";
  return { fondo: `var(${t})`, suave: `var(${t}-soft)`, texto: `var(${t}-fg)` };
}
