import { expect, test, type Browser, type Page } from "@playwright/test";
import { esperarInicio, hayApiRest, ingresar } from "./ayudantes";

test.beforeEach(async () => test.skip(!(await hayApiRest()), "PostgREST no disponible en este entorno"));

async function sesion(browser: Browser, email: string): Promise<Page> {
  const page = await (await browser.newContext()).newPage();
  await ingresar(page, email);
  await esperarInicio(page);
  return page;
}

// PNG de 1x1 válido
const PNG = Buffer.from(
  "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==",
  "base64",
);

test("el organigrama muestra la dirección, las sedes y los equipos", async ({ browser }) => {
  const asesor = await sesion(browser, "asesor.nqn@pea.local");
  await asesor.goto("/organigrama");
  await expect(asesor.getByText("Diego Director")).toBeVisible();
  await expect(asesor.getByText("Equipo Lucía")).toBeVisible();
  await expect(asesor.getByText("Lucía Líder")).toBeVisible();
  await asesor.getByText("CAU Roca").click();
  await expect(asesor.getByText("Rocío Asesora")).toBeVisible();
});

test("consigna de lectura del líder a su equipo", async ({ browser }) => {
  const titulo = `Leer inscripción ${Date.now()}`;
  const lider = await sesion(browser, "lider.nqn@pea.local");
  await lider.goto("/equipo/consignas/nueva");
  await lider.getByLabel("Título").fill(titulo);
  await lider.getByLabel("Tipo").selectOption("lectura");
  await lider.getByLabel("Artículo a leer").selectOption({ label: "Inscripción a materias (ejemplo)" });
  await lider.getByLabel("¿Para quién?").selectOption("equipo");
  await lider.getByRole("button", { name: "Asignar consigna" }).click();
  await expect(lider).toHaveURL(/creada=1/);
  await expect(lider.getByText("Consigna asignada a 1 persona.")).toBeVisible();
  const detalle = lider.url().split("?")[0]!;

  const asesor = await sesion(browser, "asesor.nqn@pea.local");
  await expect(asesor.getByRole("list", { name: "Consignas pendientes" })).toContainText(titulo);
  await asesor.goto("/consignas");
  const tarjeta = asesor.getByRole("listitem").filter({ hasText: titulo });
  await tarjeta.getByRole("link", { name: /Leer: Inscripción a materias/ }).click();
  await expect(asesor.getByRole("heading", { name: "Inscripción a materias (ejemplo)" })).toBeVisible();
  await asesor.goto("/consignas");
  await tarjeta.getByRole("button", { name: "Ya lo leí" }).click();
  await expect(tarjeta.getByText("Lectura confirmada")).toBeVisible();
  await tarjeta.getByRole("button", { name: "Marcar como hecha" }).click();
  await expect(asesor.getByRole("listitem").filter({ hasText: titulo })).toHaveCount(0);

  await lider.goto(detalle);
  await expect(lider.getByText("Avance: 1 de 1 hechas")).toBeVisible();

  const otro = await sesion(browser, "asesor2.nqn@pea.local");
  await otro.goto("/consignas");
  await expect(otro.getByText(titulo)).toHaveCount(0);
});

test("tarea con evidencia obligatoria para un subrol", async ({ browser }) => {
  const titulo = `Control de mesas ${Date.now()}`;
  const coord = await sesion(browser, "coord.servicio.nqn@pea.local");
  await coord.goto("/equipo/consignas/nueva");
  await coord.getByLabel("Título").fill(titulo);
  await coord.getByLabel("¿Para quién?").selectOption("subrol");
  await coord.getByLabel("Subrol").selectOption({ label: "CEO" });
  await coord.getByLabel("Pedir evidencia para cerrarla (foto o PDF)").check();
  await coord.getByRole("button", { name: "Asignar consigna" }).click();
  await expect(coord).toHaveURL(/creada=1/);
  const detalle = coord.url().split("?")[0]!;

  const ceo = await sesion(browser, "asesor2.nqn@pea.local");
  await ceo.goto("/consignas");
  const tarjeta = ceo.getByRole("listitem").filter({ hasText: titulo });
  await tarjeta.getByRole("button", { name: "Marcar como hecha" }).click();
  await expect(tarjeta.getByText("Esta consigna pide evidencia")).toBeVisible();
  await tarjeta.getByLabel(/Evidencia/).setInputFiles({ name: "mesa.png", mimeType: "image/png", buffer: PNG });
  await tarjeta.getByRole("button", { name: "Marcar como hecha" }).click();
  await expect(ceo.getByRole("listitem").filter({ hasText: titulo })).toHaveCount(0);

  await coord.goto(detalle);
  await expect(coord.getByText("Avance: 1 de 1 hechas")).toBeVisible();
  const [popup] = await Promise.all([coord.waitForEvent("popup"), coord.getByRole("button", { name: "Ver evidencia" }).click()]);
  expect((await coord.request.get(popup.url())).status()).toBe(200);
});

test("el admin filtra usuarios por rol", async ({ browser }) => {
  const admin = await sesion(browser, "admin@pea.local");
  await admin.goto("/admin/usuarios?rol=lider");
  const lista = admin.getByRole("list", { name: "Usuarios" });
  await expect(lista.getByRole("listitem")).toHaveCount(1);
  await expect(lista).toContainText("Lucía");
});
