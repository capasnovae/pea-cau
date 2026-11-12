import { expect, test, type Browser, type Page } from "@playwright/test";
import { esperarInicio, hayApiRest, ingresar } from "./ayudantes";

async function sesion(browser: Browser, email: string, opciones: Parameters<Browser["newContext"]>[0] = {}) {
  const page: Page = await (await browser.newContext(opciones)).newPage();
  await ingresar(page, email);
  await esperarInicio(page);
  return page;
}

test.beforeEach(async () => test.skip(!(await hayApiRest()), "PostgREST no disponible en este entorno"));

test("a 360 px ninguna pantalla del asesor desborda de costado", async ({ browser }) => {
  const a = await sesion(browser, "asesor.nqn@pea.local", { viewport: { width: 360, height: 760 } });
  for (const ruta of [
    "/inicio",
    "/estudiar",
    "/repaso",
    "/examenes",
    "/perfil",
    "/bandeja",
    "/calendario",
    "/avisos",
    "/repositorio",
    "/organigrama",
    "/ayuda",
  ]) {
    await a.goto(ruta);
    await a.waitForLoadState("networkidle");
    const sobra = await a.evaluate(() => document.documentElement.scrollWidth - window.innerWidth);
    expect(sobra, `${ruta} desborda ${sobra} px`).toBeLessThanOrEqual(0);
  }
});

test("la navegación del celular se toca con el dedo (≥ 44 px)", async ({ browser }) => {
  const a = await sesion(browser, "asesor.nqn@pea.local", { viewport: { width: 412, height: 915 } });
  const nav = a.getByRole("navigation", { name: "Principal" });
  for (const control of await nav.locator("a, button").all()) {
    const caja = await control.boundingBox();
    expect(caja?.height ?? 0).toBeGreaterThanOrEqual(44);
  }
  for (const nombre of ["Avisos", "Cuenta"]) {
    const caja = await a
      .getByRole(nombre === "Avisos" ? "link" : "button", { name: nombre })
      .first()
      .boundingBox();
    expect(caja?.height ?? 0, nombre).toBeGreaterThanOrEqual(44);
  }
});

test("con movimiento reducido las pantallas entran sin animar", async ({ browser }) => {
  const a = await sesion(browser, "asesor.nqn@pea.local", { reducedMotion: "reduce" });
  const duracion = await a
    .locator(".animate-aparecer")
    .first()
    .evaluate((el) => Number.parseFloat(getComputedStyle(el).animationDuration));
  expect(duracion).toBeLessThan(0.01);
});

test("el tema oscuro se elige en el perfil y se mantiene al volver", async ({ browser }) => {
  const a = await sesion(browser, "asesor2.nqn@pea.local");
  await a.goto("/perfil");
  const tema = a.getByRole("radiogroup", { name: "Tema" });
  await tema.getByRole("radio", { name: "Oscuro" }).click();
  await expect(a.locator("html")).toHaveAttribute("data-theme", "dark");
  await expect(tema.getByRole("radio", { name: "Oscuro" })).toHaveAttribute("aria-checked", "true");
  await a.waitForTimeout(300);
  await a.goto("/inicio");
  await expect(a.locator("html")).toHaveAttribute("data-theme", "dark");
  expect(await a.evaluate(() => getComputedStyle(document.body).backgroundColor)).toBe("rgb(15, 15, 26)");
  await a.goto("/perfil");
  await a.getByRole("radiogroup", { name: "Tema" }).getByRole("radio", { name: "Sistema" }).click();
  await expect(a.locator("html")).not.toHaveAttribute("data-theme", /.+/);
});

test("Contenido busca por título", async ({ browser }) => {
  const adm = await sesion(browser, "admin@pea.local");
  await adm.goto("/contenido?tab=articulos");
  await adm.getByRole("searchbox", { name: "Buscar por título" }).fill("EVA 21");
  await adm.getByRole("button", { name: "Buscar" }).click();
  await expect(adm).toHaveURL(/q=EVA/);
  const lista = adm.getByRole("list", { name: "Contenido editable" });
  await expect(lista.getByRole("listitem").first()).toBeVisible();
  for (const fila of await lista.getByRole("listitem").all()) await expect(fila).toContainText(/EVA 21/i);
  await adm.getByRole("searchbox", { name: "Buscar por título" }).fill("zzz-no-existe");
  await adm.getByRole("button", { name: "Buscar" }).click();
  await expect(adm.getByText("Sin resultados.")).toBeVisible();
});

test("Ayuda explica qué hace cada puesto y el organigrama ya no lo repite", async ({ browser }) => {
  const a = await sesion(browser, "asesor.nqn@pea.local");
  await a.goto("/ayuda");
  const puestos = a.getByRole("region", { name: "Qué hace cada puesto" });
  await puestos.getByText("Front").click();
  await expect(puestos.getByText(/mesa de entrada/)).toBeVisible();
  await a.goto("/organigrama");
  await expect(a.getByText("Qué hace cada puesto")).toHaveCount(0);
});

test("en pantallas anchas la barra lateral muestra las etiquetas al costado", async ({ browser }) => {
  const a = await sesion(browser, "asesor.nqn@pea.local", { viewport: { width: 1440, height: 900 } });
  const tablero = a.getByRole("navigation", { name: "Principal" }).getByRole("link", { name: /^Tablero/ });
  const caja = await tablero.boundingBox();
  expect(caja?.width ?? 0).toBeGreaterThan(180);
  expect(caja?.height ?? 0).toBeLessThan(56);
});
