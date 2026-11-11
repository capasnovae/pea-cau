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

test("una página que no existe muestra el aviso propio, en castellano", async ({ browser }) => {
  const a = await (await browser.newContext()).newPage();
  await ingresar(a, "asesor.nqn@pea.local");
  await esperarInicio(a);
  const r = await a.goto("/estudiar/00000000-0000-4000-8000-000000000000");
  expect(r?.status()).toBe(404);
  await expect(a.getByRole("heading", { name: "No encontramos esa página" })).toBeVisible();
  await expect(a.getByText("This page could not be found")).toHaveCount(0);
  await a.getByRole("link", { name: "Ir al inicio" }).click();
  await esperarInicio(a);
});

test("las respuestas llevan cabeceras de seguridad", async ({ request }) => {
  const h = (await request.get("/ingresar")).headers();
  expect(h["x-content-type-options"]).toBe("nosniff");
  expect(h["x-frame-options"]).toBe("DENY");
  expect(h["referrer-policy"]).toBe("strict-origin-when-cross-origin");
  expect(h["content-security-policy"]).toContain("frame-ancestors 'none'");
  expect(h["permissions-policy"]).toContain("camera=()");
});
