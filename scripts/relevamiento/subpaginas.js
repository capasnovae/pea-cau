// Releva subpáginas de La Nube que no están en el menú (enlazadas desde otras páginas).
// uso: node scripts/relevamiento/subpaginas.js relevamiento
const fs = require("fs");
const path = require("path");
const { chromium } = require("playwright");
const { extraer } = require("./extraer");

const SALIDA = process.argv[2];
const HOY = new Date().toISOString().slice(0, 10);
const espera = (ms) => new Promise((r) => setTimeout(r, ms));
// Solo lo que aplica al CAU (grado y pregrado; ED, EDH y PD). Se omiten PH, P puro, posgrado y novedades.
const PAGINAS = {
  "becas-siglo-21": "aranceles-y-pagos",
  "calendario-acad%C3%A9mico-distancia": "tramites",
  "calendario-academico-presencial": "tramites",
  "condicion-cursado-ed": "modalidades",
  "condicion-cursado-presencialidad-distribuida": "modalidades",
  "condiciones-de-cursado": "modalidades",
  "condiciones-de-cursado-presencial": "modalidades",
  "defensa-oral": "tramites",
  documentacion: "tramites",
  "inscripci%C3%B3n-a-examenes": "tramites",
  "materias-map": "oferta-academica",
  modulo0: "oferta-academica",
  "uso-de-espacios": "institucional",
  "post/calendario-de-tramites": "tramites",
  "post/como-empadronarse-en-klarway": "plataformas",
  "post/directores-de-carrera": "atencion-y-derivaciones",
  "post/eximici%C3%B3n-idiomas": "tramites",
  "post/requisitos-t%C3%A9cnicos-edusoft": "plataformas",
  "post/requisitos-tecnicos-klarway": "plataformas",
  "post/revision-de-examen": "tramites",
  "post/test-de-autorregulacion-del-aprendizaje": "oferta-academica",
  "post/tp-modalidad-presencial": "tramites",
};
const limpiar = (md) =>
  md
    .split("\n")
    .filter((l) => !/^(Ver más|Ver m[aá]s|​|Leer más|Ingresá acá >?)$/i.test(l.trim()))
    .map((l) => {
      const m = /^(#+) (.*)$/.exec(l);
      return m && m[2].length > 110 ? m[2] : l;
    })
    .join("\n")
    .replace(/\n{3,}/g, "\n\n")
    .trim();
const frente = (o) =>
  "---\n" +
  Object.entries(o)
    .map(([k, v]) => `${k}: ${JSON.stringify(v)}`)
    .join("\n") +
  "\n---\n\n";

(async () => {
  const b = await chromium.launch({ executablePath: "/opt/pw-browsers/chromium" });
  const p = await (await b.newContext({ viewport: { width: 1440, height: 900 } })).newPage();
  const solo = process.argv.slice(3);
  for (const [clave, cat] of Object.entries(PAGINAS)) {
    if (solo.length && !solo.includes(clave)) continue;
    const url = "https://www.lanube.21.edu.ar/" + clave;
    try {
      let md = limpiar(await extraer(p, url, "#PAGES_CONTAINER"));
      if (md.length < 80) md = limpiar(await extraer(p, url, "main"));
      const titulo = (await p.title()).replace(/\s*\|\s*Siglo 21 - La Nube\s*$/, "").trim();
      const slug = decodeURIComponent(clave.replace(/^post\//, ""))
        .normalize("NFD")
        .replace(/\p{Diacritic}/gu, "")
        .replace(/[^a-z0-9-]/gi, "-")
        .toLowerCase();
      fs.writeFileSync(
        path.join(SALIDA, "lanube", slug + ".md"),
        frente({ titulo, fuente: url, extraido: HOY, categoria: cat, estado: "a validar" }) + md + "\n",
      );
      console.log("ok", slug, md.length);
    } catch (e) {
      console.log("error", clave, e.message.slice(0, 80));
    }
    await espera(800);
  }
  await b.close();
})();
