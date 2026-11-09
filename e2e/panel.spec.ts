import { expect, test, type Browser, type Page } from "@playwright/test";
import { esperarInicio, hayApiRest, ingresar } from "./ayudantes";

test.beforeEach(async () => test.skip(!(await hayApiRest()), "PostgREST no disponible en este entorno"));

async function sesion(browser: Browser, email: string): Promise<Page> {
  const page = await (await browser.newContext()).newPage();
  await ingresar(page, email);
  await esperarInicio(page);
  return page;
}

test("el coordinador ve a la asesora inactiva, filtra atrasados y descarga el CSV", async ({ browser }) => {
  const c = await sesion(browser, "coord.servicio.nqn@pea.local");
  await c.goto("/equipo/panel");
  const sofia = c
    .getByRole("list", { name: "Asesores" })
    .getByRole("listitem")
    .filter({ hasText: "Sofía Quieta" });
  await expect(sofia).toContainText(/Sin actividad hace (19|20|21) días/);
  await expect(c.getByRole("list", { name: "Asesores" })).not.toContainText("Rocío");

  await c.getByRole("link", { name: "Solo atrasados" }).click();
  await expect(c).toHaveURL(/atrasados=1/);
  await expect(sofia).toBeVisible();

  const r = await c.request.get("/equipo/panel/csv/asesores");
  expect(r.status()).toBe(200);
  expect(r.headers()["content-type"]).toContain("text/csv");
  const csv = await r.text();
  expect(csv).toContain("Apellido;Nombre;Sede");
  expect(csv).toContain("Quieta;Sofía");
  expect((await c.request.get("/equipo/panel/csv/otra")).status()).toBe(404);
  expect((await c.request.get("/equipo/panel/csv/constructor")).status()).toBe(404);
  expect((await c.request.get("/equipo/panel/csv/toString")).status()).toBe(404);

  await c.goto("/equipo/consignas");
  await expect(c.locator('a[href="/equipo/panel"][aria-current="page"]').first()).toBeAttached();
});

test("un asesor no entra al panel ni al CSV", async ({ browser }) => {
  const a = await sesion(browser, "asesor.roca@pea.local");
  expect((await a.goto("/equipo/panel"))?.status()).toBe(404);
  expect((await a.request.get("/equipo/panel/csv/asesores")).status()).toBe(404);
});
