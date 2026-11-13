// Genera los dibujos de los personajes (Open Peeps, de Pablo Stanley, licencia CC0) como SVG en public/peeps.
// Cada personaje tiene varias caras: la boca cerrada y abierta se alternan para que "hable".
// Uso: node peeps.cjs (solo hace falta volver a correrlo si cambia un personaje).
const React = require("react");
const { renderToStaticMarkup } = require("react-dom/server");
const Peep = require("react-peeps").default;
const fs = require("fs");
const path = require("path");

const GENTE = {
  lucia: { hair: "Long", body: "Device" },
  sofia: { hair: "BunCurly", body: "Device", accessory: "None" },
  martin: { hair: "ShortVolumed", body: "ButtonShirt", facialHair: "Chin" },
  narradora: { hair: "Bun", body: "PointingUp", accessory: "GlassRoundThick" },
};
const CARAS = { cerrada: "Smile", abierta: "Explaining", preocupada: "Concerned", contenta: "SmileLol", apurada: "Driven" };

const dir = path.join(__dirname, "public", "peeps");
fs.mkdirSync(dir, { recursive: true });
for (const [quien, partes] of Object.entries(GENTE))
  for (const [cara, face] of Object.entries(CARAS)) {
    const svg = renderToStaticMarkup(
      React.createElement(Peep, { style: { width: 850, height: 1200 }, strokeColor: "#1f1d2b", backgroundColor: "#ffffff", face, ...partes }),
    );
    fs.writeFileSync(path.join(dir, `${quien}-${cara}.svg`), svg.replace("<svg", '<svg xmlns="http://www.w3.org/2000/svg"'));
  }
console.log("Listo:", fs.readdirSync(dir).length, "dibujos");
