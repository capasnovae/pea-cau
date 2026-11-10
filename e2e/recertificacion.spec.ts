import { expect, test, type Browser, type Page } from "@playwright/test";
import { esperarInicio, hayApiRest, ingresar } from "./ayudantes";
import { rendirTodoBien } from "./ayudantes-examenes";

test.beforeEach(async () => test.skip(!(await hayApiRest()), "PostgREST no disponible en este entorno"));

async function sesion(browser: Browser, email: string): Promise<Page> {
  const page = await (await browser.newContext()).newPage();
  await ingresar(page, email);
  await esperarInicio(page);
  return page;
}

test.describe.serial("avisos, recertificación y actualizaciones", () => {
  test("la asesora ve sus avisos y los marca como leídos", async ({ browser }) => {
    const r = await sesion(browser, "asesor.roca@pea.local");
    await r
      .getByRole("link", { name: /^Avisos: 2 sin leer$/ })
      .first()
      .click();
    const lista = r.getByRole("list", { name: "Avisos" });
    await expect(lista).toContainText("Tu Nivel 1 vence pronto");
    await expect(lista).toContainText("Nueva actualización");
    await r.getByRole("button", { name: "Marcar todo como leído" }).click();
    await expect(r.getByRole("link", { name: /^Avisos$/ }).first()).toBeVisible();
  });

  test("completa la actualización: la lee y aprueba el mini examen", async ({ browser }) => {
    const r = await sesion(browser, "asesor.roca@pea.local");
    await r.goto("/actualizaciones");
    await r.getByRole("link", { name: /Cambió el acceso al portal/ }).click();
    await expect(r.getByText("Pendiente", { exact: true })).toBeVisible();
    await r.getByRole("button", { name: "Ya lo leí" }).click();
    await expect(r.getByRole("button", { name: "Ya lo leí" })).toHaveCount(0);
    await expect(r.getByText("Pendiente", { exact: true })).toBeVisible();
    await r.getByRole("link", { name: "Rendir el mini examen" }).click();
    await r.getByRole("button", { name: "Empezar" }).click();
    await rendirTodoBien(r);
    await expect(r.getByRole("region", { name: "Resultado" })).toContainText("Aprobado");
    await r.goto("/actualizaciones");
    await expect(r.getByRole("list", { name: "Actualizaciones" })).toContainText("Cumplida");
  });

  test("el admin publica una actualización y un asesor no entra a esa sección", async ({ browser }) => {
    const adm = await sesion(browser, "admin@pea.local");
    await adm.goto("/contenido/actualizaciones");
    await adm.getByLabel("Título").fill("Cambió la inscripción (E2E)");
    await adm.getByLabel("Artículo").selectOption({ label: "Inscripción a materias (ejemplo)" });
    await adm.getByLabel("Plazo (días)").fill("10");
    await adm.getByRole("button", { name: "Publicar actualización" }).click();
    await expect(adm.getByRole("status")).toContainText("Publicada. Asignada a");
    await expect(adm.getByRole("list", { name: "Actualizaciones publicadas" })).toContainText(
      "Cambió la inscripción (E2E)",
    );

    const a = await sesion(browser, "asesor.nqn@pea.local");
    expect((await a.goto("/contenido/actualizaciones"))?.status()).toBe(404);
  });
});
