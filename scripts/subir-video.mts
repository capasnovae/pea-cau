// Sube video/salida/<slug>.mp4 al bucket privado `videos` como lecciones/<slug>.mp4.
// Uso: node --experimental-strip-types scripts/subir-video.mts <slug>
// Por defecto sube a la base local (toma URL y clave de `supabase status`). Para el sitio hace falta
// SUPABASE_URL y SUPABASE_SECRET_KEY en el entorno y el flag --remoto: solo cuando la dueña aprueba la carga.
import { execFileSync } from "node:child_process";
import { readFileSync } from "node:fs";
import { join } from "node:path";
import { createClient } from "@supabase/supabase-js";

const args = process.argv.slice(2);
const remoto = args.includes("--remoto");
const slug = args.find((a) => !a.startsWith("--"));
if (!slug) throw new Error("Uso: subir-video.mts <slug> [--remoto]");

function credenciales(): { url: string; clave: string } {
  if (remoto) {
    const url = process.env.SUPABASE_URL;
    const clave = process.env.SUPABASE_SECRET_KEY;
    if (!url || !clave) throw new Error("Con --remoto hacen falta SUPABASE_URL y SUPABASE_SECRET_KEY");
    return { url, clave };
  }
  const env = Object.fromEntries(
    execFileSync("npx", ["supabase", "status", "-o", "env"], { encoding: "utf8" })
      .split("\n")
      .map((l) => l.match(/^([A-Z_]+)="?(.*?)"?$/))
      .filter((m): m is RegExpMatchArray => m !== null)
      .map((m) => [m[1], m[2]]),
  );
  return { url: env.API_URL, clave: env.SECRET_KEY ?? env.SERVICE_ROLE_KEY };
}

const { url, clave } = credenciales();
const archivo = readFileSync(join(import.meta.dirname, "..", "video", "salida", `${slug}.mp4`));
const ruta = `lecciones/${slug}.mp4`;
const { error } = await createClient(url, clave, { auth: { persistSession: false } })
  .storage.from("videos")
  .upload(ruta, archivo, { contentType: "video/mp4", upsert: true });
if (error) throw error;
console.log(
  `Subido ${ruta} (${(archivo.length / 1048576).toFixed(1)} MB) a ${remoto ? url : "la base local"}`,
);
