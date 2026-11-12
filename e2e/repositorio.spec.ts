import { expect, test, type Browser, type Page } from "@playwright/test";
import { esperarInicio, hayApiRest, ingresar } from "./ayudantes";

test.beforeEach(async () => test.skip(!(await hayApiRest()), "PostgREST no disponible en este entorno"));

async function sesion(browser: Browser, email: string): Promise<Page> {
  const page = await (await browser.newContext()).newPage();
  await ingresar(page, email);
  await esperarInicio(page);
  return page;
}

const PDF_MINIMO = Buffer.from(
  "%PDF-1.4\n1 0 obj<</Type/Catalog/Pages 2 0 R>>endobj 2 0 obj<</Type/Pages/Kids[]/Count 0>>endobj\ntrailer<</Root 1 0 R>>\n%%EOF\n",
);

test("el asesor navega, busca y no ve contenido de otra sede", async ({ browser }) => {
  const asesor = await sesion(browser, "asesor.nqn@pea.local");
  await asesor.goto("/repositorio");
  await asesor.getByRole("link", { name: /Reglamento/ }).click();
  await asesor.getByRole("link", { name: "Inscripción a materias (ejemplo)" }).first().click();
  await expect(asesor.getByRole("heading", { name: "Inscripción a materias (ejemplo)" })).toBeVisible();
  await expect(asesor.getByRole("link", { name: "Correlatividades (ejemplo)" })).toBeVisible();

  await asesor.goto("/buscar?q=inscripcion");
  await expect(asesor.getByRole("link", { name: "Inscripción a materias (ejemplo)" })).toBeVisible();

  const r = await asesor.goto("/repositorio/institucional/horarios-cau-roca-ejemplo");
  expect(r?.status()).toBe(404);
});

test("contenido de sede: borrador, publicación, versión, archivo y promoción", async ({ browser }) => {
  const titulo = `Procedimiento E2E ${Date.now()}`;
  const coord = await sesion(browser, "coord.servicio.nqn@pea.local");
  const asesor = await sesion(browser, "asesor.nqn@pea.local");
  const asesorRoca = await sesion(browser, "asesor.roca@pea.local");

  // 1. El coordinador crea un borrador de su sede
  await coord.goto("/contenido/articulos/nuevo");
  await coord.getByLabel("Título").fill(titulo);
  const slug = await coord.getByLabel("Dirección (slug)").inputValue();
  await coord.getByLabel("Categoría").selectOption({ label: "Trámites" });
  await coord.getByLabel("Contenido en Markdown").fill("## Pasos\n\n1. Uno\n2. Dos");
  await coord.getByRole("button", { name: "Crear artículo" }).click();
  await expect(coord).toHaveURL(/creado=1/);
  const editar = coord.url().split("?")[0]!;
  const ruta = `/repositorio/tramites/${slug}`;

  expect((await asesor.goto(ruta))?.status()).toBe(404);

  // 2. Lo publica: el asesor de Neuquén lo ve, el de Roca no
  await coord.getByLabel("Estado").selectOption("publicado");
  await coord.getByRole("button", { name: "Guardar cambios" }).click();
  await expect(coord.getByText("Artículo guardado.")).toBeVisible();
  await asesor.goto(ruta);
  await expect(asesor.getByRole("heading", { name: titulo })).toBeVisible();
  await expect(asesor.getByText("De tu sede")).toBeVisible();
  expect((await asesorRoca.goto(ruta))?.status()).toBe(404);

  // 3. Edición con "¿Qué cambió?": versión 2 y aviso de nueva versión
  await coord.goto(editar);
  await coord.getByLabel("Contenido en Markdown").fill("## Pasos\n\n1. Uno\n2. Dos\n3. Tres");
  await coord.getByLabel("¿Qué cambió?").fill("Agrego el paso tres");
  await coord.getByRole("button", { name: "Guardar cambios" }).click();
  await expect(coord.getByText("Artículo guardado.")).toBeVisible();
  await coord.reload();
  await expect(coord.getByRole("list", { name: "Historial de versiones" })).toContainText("Versión 2");
  await expect(coord.getByRole("list", { name: "Historial de versiones" })).toContainText(
    "Agrego el paso tres",
  );
  await asesor.goto(ruta);
  await expect(asesor.getByText("Nueva versión")).toBeVisible();

  // 4. Sube un PDF a la biblioteca de su sede y el asesor lo descarga
  const tituloPdf = `PDF E2E ${Date.now()}`;
  await coord.goto("/contenido/recursos/nuevo");
  await coord.getByLabel("Título").fill(tituloPdf);
  await coord
    .getByLabel("Archivo")
    .setInputFiles({ name: "guia.pdf", mimeType: "application/pdf", buffer: PDF_MINIMO });
  await coord.getByLabel("Estado").selectOption("publicado");
  await coord.getByRole("button", { name: "Crear recurso" }).click();
  await expect(coord).toHaveURL(/creado=1/);

  await asesor.goto(`/recursos?q=${encodeURIComponent("PDF E2E")}`);
  const tarjeta = asesor.getByRole("listitem").filter({ hasText: tituloPdf });
  const [popup] = await Promise.all([
    asesor.waitForEvent("popup"),
    tarjeta.getByRole("button", { name: "Descargar" }).click(),
  ]);
  // La pestaña nueva arranca en blanco y recién después navega al enlace firmado
  await popup.waitForURL(/\/storage\/v1\/object\/sign\/recursos\//, { timeout: 30_000 });
  const url = popup.url();
  expect(url).toContain("/storage/v1/object/sign/recursos/");
  expect((await asesor.request.get(url)).status()).toBe(200);

  // 5. El admin promueve el artículo y el asesor de Roca pasa a verlo
  const admin = await sesion(browser, "admin@pea.local");
  await admin.goto(editar);
  await admin.getByRole("button", { name: "Promover a todos los CAU" }).click();
  await admin
    .getByRole("dialog", { name: "¿Promover a todos los CAU?" })
    .getByRole("button", { name: "Promover" })
    .click();
  await expect(
    admin.getByText(/Ya lo ven todos los CAU|Listo: ahora lo ven todos los CAU/).first(),
  ).toBeVisible();
  await asesorRoca.goto(ruta);
  await expect(asesorRoca.getByRole("heading", { name: titulo })).toBeVisible();

  // 6. El admin promueve el PDF y el asesor de Roca lo descarga
  await admin.goto("/contenido?tab=recursos");
  await admin.getByRole("link", { name: tituloPdf }).click();
  await admin.getByRole("button", { name: "Promover a todos los CAU" }).click();
  await admin
    .getByRole("dialog", { name: "¿Promover a todos los CAU?" })
    .getByRole("button", { name: "Promover" })
    .click();
  await expect(
    admin.getByText(/Ya lo ven todos los CAU|Listo: ahora lo ven todos los CAU/).first(),
  ).toBeVisible();
  await asesorRoca.goto(`/recursos?q=${encodeURIComponent("PDF E2E")}`);
  const tarjetaRoca = asesorRoca.getByRole("listitem").filter({ hasText: tituloPdf });
  const [popupRoca] = await Promise.all([
    asesorRoca.waitForEvent("popup"),
    tarjetaRoca.getByRole("button", { name: "Descargar" }).click(),
  ]);
  expect((await asesorRoca.request.get(popupRoca.url())).status()).toBe(200);
});

test("el coordinador sube un archivo de más de 10 MB", async ({ browser }) => {
  const coord = await sesion(browser, "coord.servicio.nqn@pea.local");
  const titulo = `PDF grande ${Date.now()}`;
  await coord.goto("/contenido/recursos/nuevo");
  await coord.getByLabel("Título").fill(titulo);
  const grande = Buffer.concat([PDF_MINIMO, Buffer.alloc(12 * 1024 * 1024, 32)]);
  await coord
    .getByLabel("Archivo")
    .setInputFiles({ name: "grande.pdf", mimeType: "application/pdf", buffer: grande });
  await coord.getByLabel("Estado").selectOption("publicado");
  await coord.getByRole("button", { name: "Crear recurso" }).click();
  await expect(coord).toHaveURL(/creado=1/, { timeout: 30_000 });
});
