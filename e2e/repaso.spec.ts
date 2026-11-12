import { expect, test } from "@playwright/test";
import { esperarInicio, hayApiRest, ingresar } from "./ayudantes";

test.beforeEach(async () => test.skip(!(await hayApiRest()), "PostgREST no disponible en este entorno"));

test("repaso diario: del tablero al repaso, responde y queda la racha", async ({ browser }) => {
  const r = await (await browser.newContext()).newPage();
  await ingresar(r, "asesor.roca@pea.local");
  await esperarInicio(r);
  const tarjeta = r.getByRole("link", { name: "Repaso de hoy" });
  await expect(tarjeta).toContainText("1 pregunta");
  await tarjeta.click();
  const repaso = r.getByRole("region", { name: "Repaso" });
  await repaso.getByRole("radio", { name: "Falso" }).check();
  await repaso.getByRole("button", { name: "Comprobar" }).click();
  await expect(repaso.getByRole("status")).toContainText("¡Bien!");
  await repaso.getByRole("button", { name: "Terminar" }).click();
  await expect(r.getByRole("status").filter({ hasText: "Listo por hoy" })).toBeVisible();
  await expect(r.getByText("Racha de 1 día")).toBeVisible();
  await r.goto("/inicio");
  await expect(r.getByRole("link", { name: "Repaso de hoy" })).toHaveCount(0);
});

test("sin nada pendiente, el repaso lo dice en una línea", async ({ browser }) => {
  const a = await (await browser.newContext()).newPage();
  await ingresar(a, "asesor3.nqn@pea.local");
  await esperarInicio(a);
  await a.goto("/repaso");
  await expect(a.getByRole("status").filter({ hasText: "Nada para repasar hoy" })).toBeVisible();
});
