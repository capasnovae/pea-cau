// Fabrica el video con personajes de una lección que tiene guion en video/guiones/<slug>.ts.
// 1) pide las voces (voces.py, con caché), 2) mide cada audio y arma la línea de tiempo,
// 3) arma la pista de sonido, 4) renderiza la imagen con Revideo y 5) junta las dos en video/salida/<slug>.mp4.
import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import { mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { renderVideo } from "@revideo/renderer";
import type { Guion, LineaConTiempo, Palabra, PlanoConTiempo, Quien } from "./guiones/tipos.ts";

const VOZ: Record<Exclude<Quien, "nadie">, { voz: string; velocidad: string }> = {
  narradora: { voz: "es-UY-ValentinaNeural", velocidad: "+0%" },
  lucia: { voz: "es-AR-ElenaNeural", velocidad: "+5%" },
  martin: { voz: "es-AR-TomasNeural", velocidad: "+0%" },
};
const ENTRADA = 0.6; // segundos entre que aparece un plano y empieza la primera línea
const PAUSA = 0.45; // silencio entre líneas
const ANTES_DE_CONGELAR = 0.8;
const PORTADA = 3;

export async function renderGuion(slug: string) {
  const dir = import.meta.dirname;
  const guion: Guion = (await import(join(dir, "guiones", `${slug}.ts`))).default;
  const audios = join(dir, "salida", "voces");
  mkdirSync(audios, { recursive: true });

  const id = (q: Exclude<Quien, "nadie">, texto: string) =>
    createHash("sha1").update(`${VOZ[q].voz}|${VOZ[q].velocidad}|${texto}`).digest("hex").slice(0, 16);

  // 1) voces
  const pedido = guion.planos.flatMap((p) =>
    (p.lineas ?? []).filter((l) => l.quien !== "nadie").map((l) => {
      const q = l.quien as Exclude<Quien, "nadie">;
      return { id: id(q, l.texto), voz: VOZ[q].voz, velocidad: VOZ[q].velocidad, texto: l.texto };
    }),
  );
  writeFileSync(join(audios, "pedido.json"), JSON.stringify(pedido));
  execFileSync(process.env.PEA_PYTHON ?? "python3", [join(dir, "voces.py"), join(audios, "pedido.json"), audios], {
    stdio: "inherit",
  });

  const duracion = (archivo: string) =>
    Number(
      execFileSync("ffprobe", ["-v", "error", "-show_entries", "format=duration", "-of", "csv=p=0", archivo], {
        encoding: "utf8",
      }).trim(),
    );

  // 2) línea de tiempo
  let t = 0;
  const clips: { archivo: string; inicio: number }[] = [];
  const planos: PlanoConTiempo[] = guion.planos.map((p) => {
    const inicio = t;
    if (!p.lineas?.length) {
      t += PORTADA;
      return { ...p, inicio, fin: t, lineas: [] };
    }
    t += ENTRADA;
    const lineas: LineaConTiempo[] = p.lineas.map((l) => {
      if (l.modo === "congela") t += ANTES_DE_CONGELAR;
      let dur = 0;
      let palabras: Palabra[] = [];
      if (l.quien !== "nadie") {
        const base = join(audios, id(l.quien, l.texto));
        dur = duracion(`${base}.mp3`);
        palabras = JSON.parse(readFileSync(`${base}.json`, "utf8"));
        clips.push({ archivo: `${base}.mp3`, inicio: t });
      }
      const linea = { ...l, inicio: t, dur, palabras };
      t += dur + (l.pausa ?? PAUSA);
      return linea;
    });
    t += 0.3;
    return { ...p, inicio, fin: t, lineas };
  });
  const total = t + 1;

  // 3) sonido: voces, efectos y música (la música baja sola cuando alguien habla)
  const py = process.env.PEA_PYTHON ?? "python3";
  const efectos = join(dir, "salida", "efectos");
  execFileSync(py, [join(dir, "sfx.py"), efectos]);
  const musica = join(dir, "salida", `${slug}.musica.wav`);
  execFileSync(py, [join(dir, "musica.py"), String(total), musica]);
  const sfx: { archivo: string; inicio: number }[] = [];
  const efecto = (nombre: string, inicio: number) => sfx.push({ archivo: join(efectos, `${nombre}.wav`), inicio: Math.max(0, inicio) });
  for (const p of planos) {
    if (p.inicio > 0) efecto("transicion", p.inicio - 0.15);
    if (p.tipo === "escena" && p.lugar === "cau") efecto("notificacion", p.inicio + 0.6 + 0.5);
    for (const l of p.lineas) {
      if (l.modo === "escribe" || l.modo === "audio") efecto("mensaje", l.inicio);
      if (l.modo === "congela") efecto("congelar", l.inicio - 0.8);
      if (l.marca !== undefined && (p.tipo === "lista" || p.tipo === "tablero")) efecto("tilde", l.inicio);
    }
  }
  const pista = join(dir, "salida", `${slug}.m4a`);
  const todos = [...clips, ...sfx];
  const entradas = [...todos.flatMap((c) => ["-i", c.archivo]), "-i", musica];
  const retrasa = (i: number, c: { inicio: number }, etiqueta: string) =>
    `[${i}:a]aresample=48000,aformat=channel_layouts=mono,adelay=${Math.round(c.inicio * 1000)}:all=1[${etiqueta}${i}]`;
  const nv = clips.length;
  const filtros = [
    ...clips.map((c, i) => retrasa(i, c, "v")),
    ...sfx.map((c, k) => retrasa(nv + k, c, "e")),
    `${clips.map((_, i) => `[v${i}]`).join("")}amix=inputs=${nv}:normalize=0,apad=whole_dur=${total},asplit=2[voces][clave]`,
    `${sfx.map((_, k) => `[e${nv + k}]`).join("")}amix=inputs=${sfx.length}:normalize=0,volume=0.35,apad=whole_dur=${total}[fx]`,
    `[${todos.length}:a]aformat=channel_layouts=mono,volume=0.55[mus]`,
    `[mus][clave]sidechaincompress=threshold=0.02:ratio=8:attack=40:release=600[musbaja]`,
    `[voces][fx][musbaja]amix=inputs=3:normalize=0,alimiter=limit=0.95[out]`,
  ].join(";");
  execFileSync("ffmpeg", ["-loglevel", "error", "-y", ...entradas, "-filter_complex", filtros, "-map", "[out]", "-t", String(total), "-c:a", "aac", "-b:a", "160k", pista]);

  // 4) imagen
  const mudo = await renderVideo({
    projectFile: "./src/personajes.ts",
    variables: { planos, titulo: guion.titulo, bajada: guion.bajada, total },
    settings: {
      outFile: `${slug}.mudo.mp4`,
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

  // 5) imagen + sonido
  const salida = join(dir, "salida", `${slug}.mp4`);
  execFileSync("ffmpeg", ["-loglevel", "error", "-y", "-i", mudo, "-i", pista, "-map", "0:v", "-map", "1:a", "-c:v", "copy", "-c:a", "copy", "-shortest", "-movflags", "+faststart", salida]);
  console.log(`Listo: ${salida} · ${total.toFixed(1)} s`);
}
