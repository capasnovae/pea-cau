// Genera supabase/seed-relevamiento.sql a partir de relevamiento/<sitio>/*.md.
// Uso: node --experimental-strip-types scripts/importar-relevamiento.mts
import { readdirSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { armarSql, leerArchivo, type ArchivoRelevado } from "../lib/relevamiento/importar.ts";

const raiz = join(import.meta.dirname, "..", "relevamiento");
const archivos: ArchivoRelevado[] = [];
const salteados: string[] = [];
for (const sitio of ["reglamento", "lanube"]) {
  for (const nombre of readdirSync(join(raiz, sitio))
    .filter((n) => n.endsWith(".md"))
    .sort()) {
    const a = leerArchivo(`${sitio}/${nombre}`, readFileSync(join(raiz, sitio, nombre), "utf8"));
    if (a.cuerpo.length < 80) salteados.push(`${sitio}/${nombre}`);
    else archivos.push(a);
  }
}
writeFileSync(join(import.meta.dirname, "..", "supabase", "seed-relevamiento.sql"), armarSql(archivos));
console.log(
  `${archivos.length} artículos generados; salteados (sin texto): ${salteados.join(", ") || "ninguno"}`,
);
