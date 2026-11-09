// Genera supabase/seed-lecciones.sql a partir de contenido/lecciones/*.md.
// Uso: node --experimental-strip-types scripts/importar-lecciones.mts
import { readdirSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { armarSqlLecciones, leerLeccion } from "../lib/lecciones/importar.ts";

const dir = join(import.meta.dirname, "..", "contenido", "lecciones");
const lecciones = readdirSync(dir)
  .filter((n) => n.endsWith(".md"))
  .sort()
  .map((n) => leerLeccion(`contenido/lecciones/${n}`, readFileSync(join(dir, n), "utf8")));
writeFileSync(
  join(import.meta.dirname, "..", "supabase", "seed-lecciones.sql"),
  armarSqlLecciones(lecciones),
);
console.log(`${lecciones.length} lecciones generadas`);
