// Renderiza la muestra de estilos de muñeco: node --experimental-strip-types render-muestra.ts
import { renderVideo } from "@revideo/renderer";

process.env.DISABLE_TELEMETRY = "true";
const archivo = await renderVideo({
  projectFile: "./src/muestra.ts",
  settings: {
    outFile: "muestra-frijol.mp4",
    outDir: "./salida",
    logProgress: false,
    puppeteer: {
      executablePath: process.env.PEA_CHROMIUM ?? "/opt/pw-browsers/chromium_headless_shell-1243/chrome-headless-shell-linux64/chrome-headless-shell",
      args: ["--no-sandbox"],
    },
  },
});
console.log("Listo:", archivo);
