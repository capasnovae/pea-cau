import { expect, test } from "@playwright/test";
import { esperarInicio, hayApiRest, ingresar } from "./ayudantes";

test.beforeEach(async () => test.skip(!(await hayApiRest()), "PostgREST no disponible en este entorno"));

test("en el celular, Siguiente no flota sobre el Probalo", async ({ browser }) => {
  const a = await (await browser.newContext()).newPage();
  await ingresar(a, "asesor.nqn@pea.local");
  await esperarInicio(a);
  await a.goto("/estudiar/c4000000-0000-4000-8000-000000000009/c6000000-0000-4000-8000-000000000009");
  const siguiente = a.getByRole("link", { name: "Siguiente" });
  await expect(siguiente).toBeVisible();
  expect(await siguiente.evaluate((el) => getComputedStyle(el.parentElement!).position)).toBe("static");
  // El botón queda debajo del Probalo, no encima
  const probalo = await a.getByRole("region", { name: "Probalo" }).boundingBox();
  const boton = await siguiente.boundingBox();
  expect(boton!.y).toBeGreaterThanOrEqual(probalo!.y + probalo!.height);
});

test("Contenido no desborda en el celular y pagina la lista", async ({ browser }) => {
  const adm = await (await browser.newContext()).newPage();
  await ingresar(adm, "admin@pea.local");
  await esperarInicio(adm);
  await adm.goto("/contenido");
  const desborde = await adm.evaluate(
    () => document.documentElement.scrollWidth - document.documentElement.clientWidth,
  );
  expect(desborde).toBeLessThanOrEqual(0);
  const lista = adm.getByRole("list", { name: "Contenido editable" });
  expect(await lista.getByRole("listitem").count()).toBeLessThanOrEqual(30);
  await adm.getByRole("link", { name: "Siguiente" }).click();
  await expect(adm).toHaveURL(/pagina=2/);
  await expect(lista.getByRole("listitem").first()).toBeVisible();
  await expect(adm.getByRole("link", { name: "Anterior" })).toBeVisible();
});
