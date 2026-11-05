import { expect, test } from "@playwright/test";
import { esperarInicio, hayApiRest, ingresar } from "./ayudantes";

test.beforeEach(async () => test.skip(!(await hayApiRest()), "PostgREST no disponible en este entorno"));

test("el asesor que entra a /admin/usuarios ve 404", async ({ page }) => {
  await ingresar(page, "asesor.nqn@pea.local");
  await esperarInicio(page);
  const r = await page.goto("/admin/usuarios");
  expect(r?.status()).toBe(404);
});

test("el admin ve las 7 sedes", async ({ page }) => {
  await ingresar(page, "admin@pea.local");
  await esperarInicio(page);
  await page.goto("/admin/sedes");
  await expect(page.getByRole("list", { name: "Sedes" }).getByRole("listitem")).toHaveCount(7);
});

test("el admin invita a un usuario nuevo", async ({ page }) => {
  const email = `nuevo.${Date.now()}@pea.local`;
  await ingresar(page, "admin@pea.local");
  await esperarInicio(page);
  await page.goto("/admin/usuarios");
  await page.getByLabel("Nombre", { exact: true }).fill("Nico");
  await page.getByLabel("Apellido").fill("Nuevo");
  await page.getByLabel("Email").fill(email);
  await page.getByLabel("Sede").selectOption({ label: "Zapala" });
  await page.getByRole("button", { name: "Mandar invitación" }).click();
  await expect(page.getByText(`Invitación enviada a ${email}.`)).toBeVisible();
  await expect(page.getByRole("listitem").filter({ hasText: email })).toBeVisible();
});
