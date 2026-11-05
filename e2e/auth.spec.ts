import { expect, test } from "@playwright/test";
import { esperarInicio, hayApiRest, ingresar } from "./ayudantes";

test("el anónimo que entra a /inicio termina en /ingresar", async ({ page }) => {
  await page.goto("/inicio");
  await expect(page).toHaveURL(/\/ingresar$/);
  await expect(page.getByRole("heading", { name: "Ingresá a PEA" })).toBeVisible();
});

test("contraseña incorrecta muestra el error", async ({ page }) => {
  await ingresar(page, "asesor.nqn@pea.local", "incorrecta-123");
  await expect(page.getByText("El email o la contraseña no son correctos.")).toBeVisible();
});

test.describe("con API REST", () => {
  test.beforeEach(async () => test.skip(!(await hayApiRest()), "PostgREST no disponible en este entorno"));

  test("el asesor ingresa y ve su inicio", async ({ page }) => {
    await ingresar(page, "asesor.nqn@pea.local");
    await esperarInicio(page);
  });

  test("un usuario desactivado pierde el acceso en el request siguiente", async ({ browser }) => {
    const asesor = await browser.newPage();
    await ingresar(asesor, "asesor.roca@pea.local");
    await esperarInicio(asesor);

    const admin = await browser.newPage();
    await ingresar(admin, "admin@pea.local");
    await esperarInicio(admin);
    await admin.goto("/admin/usuarios?estado=todos");
    const fila = admin.getByRole("listitem").filter({ hasText: "asesor.roca@pea.local" });
    await fila.getByRole("button", { name: "Desactivar" }).click();
    await expect(fila.getByText("Inactivo")).toBeVisible();

    await asesor.goto("/perfil");
    await expect(asesor).toHaveURL(/\/ingresar\?motivo=inactivo$/);
    await expect(asesor.getByText("Tu usuario está desactivado. Hablá con tu coordinador.")).toBeVisible();

    await fila.getByRole("button", { name: "Activar" }).click();
    await expect(fila.getByText("Inactivo")).toHaveCount(0);
  });
});
