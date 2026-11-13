// Fabrica el video de una lección por tarjetas: npm run videos -- <slug>
// Lee la lección del Markdown, arma el guion (lib/lecciones/guion.ts) y lo renderiza con Revideo a video/salida/<slug>.mp4.
import { existsSync, readFileSync } from "node:fs";
import { join } from "node:path";
import { renderVideo } from "@revideo/renderer";
import { guionDeLeccion } from "../lib/lecciones/guion.ts";
import { leerLeccion } from "../lib/lecciones/importar.ts";
import type { LeccionV2 } from "../lib/dominio/lecciones.ts";

process.env.DISABLE_TELEMETRY = "true";
const slug = process.argv[2];
if (!slug) throw new Error("Uso: npm run videos -- <slug de la lección>");
// Las lecciones con guion propio (video/guiones) tienen video con personajes y voces
if (existsSync(join(import.meta.dirname, "guiones", `${slug}.ts`))) {
  const { renderGuion } = await import("./render-guion.ts");
  await renderGuion(slug);
  process.exit(0);
}
const ruta = join(import.meta.dirname, "..", "contenido", "lecciones", `${slug}.md`);
const leccion = leerLeccion(`contenido/lecciones/${slug}.md`, readFileSync(ruta, "utf8"));
if ((leccion.leccion as { version?: number }).version !== 2)
  throw new Error(`${slug} no es una lección por tarjetas`);
const guion = guionDeLeccion(leccion.leccion as LeccionV2, leccion.titulo);

const archivo = await renderVideo({
  projectFile: "./src/project.ts",
  variables: { titulo: leccion.titulo, guion },
  settings: {
    outFile: `${slug}.mp4`,
    outDir: "./salida",
    logProgress: true,
    puppeteer: {
      executablePath:
        process.env.PEA_CHROMIUM ??
        "/opt/pw-browsers/chromium_headless_shell-1243/chrome-headless-shell-linux64/chrome-headless-shell",
      args: ["--no-sandbox"],
    },
  },
});
console.log(`Listo: ${archivo} · ${guion.reduce((s, e) => s + e.segundos, 0).toFixed(1)} s según el guion`);
