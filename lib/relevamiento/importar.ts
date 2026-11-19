// Convierte los Markdown del relevamiento (relevamiento/<sitio>/*.md) en SQL de artículos en borrador.
// Sin imports con alias: lo usa también el script de línea de comandos.

export type ArchivoRelevado = {
  sitio: "reglamento" | "lanube" | "kbcau";
  slug: string;
  titulo: string;
  fuente: string;
  extraido: string;
  categoria: string;
  capitulo: number | null;
  orden: number;
  cuerpo: string;
};

export function leerArchivo(ruta: string, texto: string): ArchivoRelevado {
  const m = /^---\n([\s\S]*?)\n---\n\n?([\s\S]*)$/.exec(texto);
  if (!m) throw new Error(`Sin metadata: ${ruta}`);
  const meta: Record<string, unknown> = {};
  for (const linea of m[1]!.split("\n")) {
    const i = linea.indexOf(":");
    if (i > 0) meta[linea.slice(0, i).trim()] = JSON.parse(linea.slice(i + 1).trim());
  }
  const partes = ruta.split("/");
  const carpeta = partes[partes.length - 2];
  const sitio = carpeta === "reglamento" ? "reglamento" : carpeta === "kbcau" ? "kbcau" : "lanube";
  const base = partes[partes.length - 1]!.replace(/\.md$/, "");
  const capitulo = typeof meta.capitulo === "number" ? meta.capitulo : null;
  // Reglamento: el número de sección; Base de conocimiento: el número de la página en el índice
  const seccion =
    sitio === "reglamento" ? Number(base.split("-")[1]) || 0 : sitio === "kbcau" ? Number(base.split("-")[0]) || 0 : 0;
  return {
    sitio,
    slug: `${{ reglamento: "rg", lanube: "ln", kbcau: "kb" }[sitio]}-${base}`,
    titulo: String(meta.titulo ?? base),
    fuente: String(meta.fuente ?? ""),
    extraido: String(meta.extraido ?? ""),
    categoria: String(meta.categoria ?? "institucional"),
    capitulo,
    orden: seccion,
    cuerpo: m[2]!.trim(),
  };
}

/** Primer párrafo de texto, sin títulos ni marcas de Markdown, hasta 200 caracteres. */
export function resumenDe(cuerpo: string): string {
  const parrafo =
    cuerpo
      .split(/\n{2,}/)
      .map((p) => p.trim())
      .find((p) => p && !p.startsWith("#") && !p.startsWith("|") && !p.startsWith(">")) ?? "";
  const texto = parrafo
    .replace(/\[([^\]]*)\]\([^)]*\)/g, "$1")
    .replace(/[*_`]/g, "")
    .replace(/^- /gm, "")
    .replace(/\s+/g, " ")
    .trim();
  return texto.length > 200 ? `${texto.slice(0, 197).trimEnd()}…` : texto;
}

/** En el reglamento, cada página repite la introducción del capítulo: el texto propio empieza en el primer "### N.M". */
export function cuerpoDeSeccion(cuerpo: string): string {
  const i = cuerpo.search(/^###\s/m);
  return i >= 0 ? cuerpo.slice(i) : cuerpo;
}

/** Literal SQL con dollar quoting: elige una etiqueta que no aparezca en el texto. */
function literal(texto: string): string {
  let n = 0;
  while (texto.includes(`$pea${n}$`)) n++;
  return `$pea${n}$${texto}$pea${n}$`;
}

function aviso(a: { fuente: string; extraido: string }): string {
  return `> **A validar:** contenido relevado de ${a.fuente} el ${a.extraido}. Revisalo antes de publicar.\n\n`;
}

function insert(a: {
  categoria: string;
  slug: string;
  titulo: string;
  resumen: string;
  cuerpo: string;
  fuente: string;
  orden: number;
  padre: string | null;
}): string {
  const padre = a.padre
    ? `(select id from public.articulos where slug = ${literal(a.padre)} and categoria_id = (select id from public.categorias where slug = ${literal(a.categoria)}))`
    : "null";
  return `insert into public.articulos (categoria_id, padre_id, orden, slug, titulo, resumen, cuerpo_md, alcance, estado, fuente_url)
values ((select id from public.categorias where slug = ${literal(a.categoria)}), ${padre}, ${a.orden}, ${literal(a.slug)},
        ${literal(a.titulo)}, ${literal(a.resumen)}, ${literal(a.cuerpo)}, 'global', 'borrador', ${a.fuente ? literal(a.fuente) : "null"})
on conflict (categoria_id, slug) do nothing;`;
}

/** SQL que crea los artículos en borrador (global). El reglamento queda agrupado: un artículo por capítulo y sus secciones como hijas. */
export function armarSql(archivos: ArchivoRelevado[]): string {
  const sentencias: string[] = [
    "-- Generado por scripts/importar-relevamiento.mts a partir de relevamiento/. No editar a mano.",
    '-- Contenido público relevado; todo queda en borrador y marcado "A validar".',
  ];
  const capitulos = new Map<number, ArchivoRelevado[]>();
  for (const a of archivos)
    if (a.sitio === "reglamento" && a.capitulo !== null)
      capitulos.set(a.capitulo, [...(capitulos.get(a.capitulo) ?? []), a]);
  for (const [n, secciones] of [...capitulos].sort((x, y) => x[0] - y[0])) {
    const primera = [...secciones].sort((x, y) => x.orden - y.orden)[0]!;
    const encabezado = /CAP[IÍ]TULO\s+\d+\s*\|\s*(.+)/i.exec(primera.cuerpo)?.[1]?.trim();
    const nombre = encabezado ? encabezado.charAt(0) + encabezado.slice(1).toLowerCase() : `Capítulo ${n}`;
    const intro = resumenDe(primera.cuerpo.replace(/^##[^\n]*\n+/, ""));
    sentencias.push(
      insert({
        categoria: "reglamento",
        slug: `rg-capitulo-${n}`,
        titulo: `Capítulo ${n}: ${nombre}`,
        resumen: intro,
        cuerpo: aviso(primera) + (intro || `Secciones del capítulo ${n} del reglamento.`),
        fuente: primera.fuente.replace(/index\.php\?put=.*$/, ""),
        orden: n,
        padre: null,
      }),
    );
  }
  for (const a of archivos) {
    sentencias.push(
      insert({
        categoria: a.categoria,
        slug: a.slug,
        titulo: a.titulo,
        resumen: resumenDe(a.sitio === "reglamento" ? cuerpoDeSeccion(a.cuerpo) : a.cuerpo),
        cuerpo: aviso(a) + a.cuerpo,
        fuente: a.fuente,
        orden: a.orden,
        padre: a.sitio === "reglamento" && a.capitulo !== null ? `rg-capitulo-${a.capitulo}` : null,
      }),
    );
  }
  return sentencias.join("\n\n") + "\n";
}
