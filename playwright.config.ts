import { defineConfig, devices } from "@playwright/test";
import fs from "node:fs";

const PUERTO = Number(process.env.PEA_E2E_PUERTO ?? 3200);
const chromiumLocal = "/opt/pw-browsers/chromium";

export default defineConfig({
  testDir: "./e2e",
  fullyParallel: false,
  workers: 1,
  reporter: "list",
  use: {
    baseURL: `http://127.0.0.1:${PUERTO}`,
    trace: "retain-on-failure",
    ...(fs.existsSync(chromiumLocal) ? { launchOptions: { executablePath: chromiumLocal } } : {}),
  },
  projects: [{ name: "mobile", use: { ...devices["Pixel 7"] } }],
  webServer: {
    command: `npx next dev -p ${PUERTO}`,
    url: `http://127.0.0.1:${PUERTO}/ingresar`,
    reuseExistingServer: true,
    timeout: 120_000,
  },
});
