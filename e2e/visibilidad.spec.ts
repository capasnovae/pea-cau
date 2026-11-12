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

test("el admin invita con un link (sin mail), la persona entra y después puede pedir otro", async ({
  page,
  browser,
}) => {
  const email = `nuevo.${Date.now()}@pea.local`;
  await ingresar(page, "admin@pea.local");
  await esperarInicio(page);
  await page.goto("/admin/usuarios");
  await page.getByRole("button", { name: "Invitar" }).click();
  const form = page.locator("form").filter({ has: page.getByRole("button", { name: "Generar invitación" }) });
  await form.getByLabel("Nombre", { exact: true }).fill("Nico");
  await form.getByLabel("Apellido").fill("Nuevo");
  await form.getByLabel("Email").fill(email);
  await form.getByLabel("Sede").selectOption({ label: "Zapala" });
  await form.getByRole("button", { name: "Generar invitación" }).click();
  await expect(form.getByRole("status")).toContainText("Mandale este link a Nico");
  const enlace = await form.getByLabel("Link de acceso").inputValue();
  expect(enlace).toMatch(/\/auth\/confirm\?token_hash=[^&]+&type=invite$/);
  await expect(form.getByRole("link", { name: "Enviar por WhatsApp" })).toHaveAttribute(
    "href",
    /^https:\/\/wa\.me\/\?text=/,
  );

  // La persona abre el link, define su contraseña y entra
  const nico = await (await browser.newContext()).newPage();
  await nico.goto(enlace);
  await expect(nico).toHaveURL(/\/definir-clave$/);
  await nico.getByLabel("Contraseña nueva").fill("una-clave-larga-1");
  await nico.getByLabel("Repetila").fill("una-clave-larga-1");
  await nico.getByRole("button", { name: "Guardar y entrar" }).click();
  await expect(nico.getByText(/^¡Hola, Nico/)).toBeVisible();

  // El mismo link no sirve dos veces
  const otra = await (await browser.newContext()).newPage();
  await otra.goto(enlace);
  await expect(otra).toHaveURL(/\/ingresar\?motivo=link-invalido/);

  // Si se olvida la contraseña, el admin le genera otro link
  await page.goto(`/admin/usuarios?q=${encodeURIComponent(email)}`);
  const fila = page.getByRole("listitem").filter({ hasText: email });
  await fila.getByRole("button", { name: "Link para entrar" }).click();
  await expect(fila.getByRole("status")).toContainText("Mandale este link a Nico");
  const nuevo = await fila.getByLabel("Link de acceso").inputValue();
  expect(nuevo).toMatch(/type=recovery$/);
  const denuevo = await (await browser.newContext()).newPage();
  await denuevo.goto(nuevo);
  await expect(denuevo).toHaveURL(/\/definir-clave$/);
});
