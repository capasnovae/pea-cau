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

test.describe.serial("perfil, insignias y certificados", () => {
  let pdf = "";
  let verificar = "";

  test("aprobar el final del Nivel 1 da la insignia, el certificado PDF y la verificación", async ({
    browser,
  }) => {
    const a = await sesion(browser, "asesor.nqn@pea.local");
    await a.goto("/examenes/d1000000-0000-4000-8000-000000000001");
    await a.getByRole("button", { name: /^(Empezar|Continuar)$/ }).click();
    await rendirTodoBien(a);
    await expect(a.getByRole("region", { name: "Resultado" })).toContainText("Aprobado");

    await a.goto("/perfil");
    const insignias = a.getByRole("list", { name: "Insignias" });
    await expect(insignias).toContainText("Base (ejemplo)");
    await expect(insignias).not.toContainText("Perdida");
    const certificados = a.getByRole("list", { name: "Certificados" });
    await expect(certificados).toContainText("Vigente");
    pdf = (await certificados.getByRole("link", { name: "PDF" }).first().getAttribute("href"))!;
    verificar = (await certificados.getByRole("link", { name: "Verificar" }).first().getAttribute("href"))!;
    const r = await a.request.get(pdf);
    expect(r.status()).toBe(200);
    expect(r.headers()["content-type"]).toContain("application/pdf");

    const anon = await (await browser.newContext()).newPage();
    await anon.goto(verificar);
    await expect(anon.getByRole("region", { name: "Certificado" })).toContainText("Vigente");
    await expect(anon.getByRole("region", { name: "Certificado" })).toContainText("Andrés Asesor");
  });

  test("otro asesor no descarga ese PDF", async ({ browser }) => {
    const r = await sesion(browser, "asesor.roca@pea.local");
    expect((await r.request.get(pdf)).status()).toBe(404);
  });

  test("el admin revoca el certificado: la verificación lo muestra y la insignia se pierde", async ({
    browser,
  }) => {
    const codigo = verificar.split("/").pop()!;
    const adm = await sesion(browser, "admin@pea.local");
    const fila = adm.getByRole("list", { name: "Certificados" }).getByRole("listitem").filter({ hasText: codigo });
    await adm.goto("/admin/certificaciones?q=Asesor");
    await expect(fila).toBeVisible();
    await adm.goto(`/admin/certificaciones?q=${encodeURIComponent("Andrés Asesor")}`);
    await expect(fila).toBeVisible();
    await fila.getByText("Revocar").click();
    await fila.getByLabel("Motivo").fill("Prueba E2E");
    await fila.getByRole("button", { name: "Confirmar" }).click();
    await expect(fila).toContainText("Revocado");

    const anon = await (await browser.newContext()).newPage();
    await anon.goto(verificar);
    await expect(anon.getByRole("region", { name: "Certificado" })).toContainText("Revocado");

    const a = await sesion(browser, "asesor.nqn@pea.local");
    await a.goto("/perfil");
    await expect(a.getByRole("list", { name: "Insignias" })).toContainText("Perdida");
    await expect(
      a.getByRole("list", { name: "Certificados" }).getByRole("listitem").filter({ hasText: "Revocado" }).getByRole("link", { name: "PDF" }),
    ).toHaveCount(0);
    expect((await a.request.get(pdf)).status()).toBe(404);
  });
});

test("un código inexistente se informa", async ({ page }) => {
  await page.goto("/verificar/NOEXISTE");
  await expect(page.getByRole("heading", { name: "Código no encontrado" })).toBeVisible();
});
