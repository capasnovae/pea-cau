import { expect, test, type Browser, type Page } from "@playwright/test";
import { esperarInicio, hayApiRest, ingresar } from "./ayudantes";

async function sesion(browser: Browser, email: string): Promise<Page> {
  const page = await (await browser.newContext()).newPage();
  await ingresar(page, email);
  await esperarInicio(page);
  return page;
}

function hoyAr(): string {
  return new Intl.DateTimeFormat("en-CA", { timeZone: "America/Argentina/Buenos_Aires" }).format(new Date());
}

async function sinLeer(page: Page): Promise<number> {
  const contador = page.getByRole("navigation", { name: "Principal" }).getByLabel(/sin leer/);
  if ((await contador.count()) === 0) return 0;
  return Number((await contador.first().getAttribute("aria-label"))!.split(" ")[0]);
}

test("el anónimo que entra a la raíz ve la bienvenida y va al ingreso", async ({ page }) => {
  await page.goto("/");
  await expect(page).toHaveURL(/\/bienvenida$/);
  await expect(page.getByRole("heading", { name: "¿Cómo ingresás?" })).toBeVisible();
  await page.getByLabel("Director").check();
  await expect(page.getByRole("radio", { name: "Director" })).toBeChecked();
  await page.getByRole("link", { name: "Ingresar" }).click();
  await expect(page).toHaveURL(/\/ingresar$/);
});

test.describe("con API REST", () => {
  test.beforeEach(async () => test.skip(!(await hayApiRest()), "PostgREST no disponible en este entorno"));

  test("la barra lateral del asesor sigue el modelo Canvas", async ({ browser }) => {
    const a = await sesion(browser, "asesor.nqn@pea.local");
    await a.setViewportSize({ width: 1440, height: 900 });
    const nav = a.getByRole("navigation", { name: "Principal" });
    await expect(nav.getByRole("link")).toHaveText([
      "PEA",
      /^Tablero/,
      /^Cursos/,
      /^Calendario/,
      /^Bandeja/,
      /^Exámenes/,
      /^Repositorio/,
      /^Organigrama/,
      /^Ayuda/,
    ]);
    await expect(nav.getByRole("link", { name: /^Tablero/ })).toHaveAttribute("aria-current", "page");
    await expect(nav.getByRole("link", { name: /Contenido/ })).toHaveCount(0);
  });

  for (const ruta of ["/inicio", "/bandeja"]) {
    test(`en PC el panel de Cuenta se abre desde ${ruta} y permite salir`, async ({ browser }) => {
      const a = await sesion(browser, "asesor.nqn@pea.local");
      await a.setViewportSize({ width: 1440, height: 900 });
      await a.goto(ruta);
      await a.getByRole("navigation", { name: "Principal" }).getByText("Cuenta").click();
      await expect(a.getByRole("link", { name: "Mi perfil" })).toBeVisible();
      const enPantalla = await a.getByRole("link", { name: "Mi perfil" }).evaluate((el) => {
        const r = el.getBoundingClientRect();
        const arriba = document.elementFromPoint(r.left + r.width / 2, r.top + r.height / 2);
        return Boolean(arriba && el.contains(arriba));
      });
      expect(enPantalla, "el panel de Cuenta queda tapado o recortado").toBe(true);
      await a.getByRole("button", { name: "Salir" }).click();
      await expect(a).toHaveURL(/\/(ingresar|bienvenida)/);
    });
  }

  test("el anuncio de coordinación llega y no admite respuesta", async ({ browser }) => {
    const a = await sesion(browser, "asesor.nqn@pea.local");
    await a.goto("/bandeja?filtro=anuncios");
    const anuncio = a
      .getByRole("region", { name: "Conversaciones" })
      .getByRole("link", { name: /Campaña de reinscripción/ });
    await expect(anuncio).toContainText("ANUNCIO");
    await anuncio.click();
    await expect(a.getByRole("heading", { name: /Campaña de reinscripción/ })).toBeVisible();
    await expect(a.getByLabel("Respuesta")).toHaveCount(0);
  });

  test("dos asesores de la sede se escriben y el contador baja al leer", async ({ browser }) => {
    const a = await sesion(browser, "asesor.nqn@pea.local");
    await a.goto("/bandeja/nueva");
    await a.getByLabel("Buscar personas").fill("Bruno");
    await a.getByRole("checkbox", { name: /Bruno/ }).check();
    await a.getByLabel("Asunto").fill("Prueba E2E");
    await a.getByLabel("Mensaje").fill("Hola, ¿me pasás la matriz?");
    await a.getByRole("button", { name: "Enviar" }).click();
    await expect(a).toHaveURL(/\/bandeja\/[0-9a-f-]{36}$/);
    await expect(a.getByRole("list", { name: "Mensajes" })).toContainText("Hola, ¿me pasás la matriz?");

    const b = await sesion(browser, "asesor2.nqn@pea.local");
    await b.setViewportSize({ width: 1440, height: 900 });
    await b.goto("/bandeja");
    const fila = b.getByRole("region", { name: "Conversaciones" }).getByRole("link", { name: /Prueba E2E/ });
    await expect(fila.getByLabel("Sin leer")).toBeVisible();
    const antes = await sinLeer(b);
    expect(antes).toBeGreaterThan(0);
    await fila.click();
    await expect(b.getByRole("list", { name: "Mensajes" })).toContainText("Hola, ¿me pasás la matriz?");
    await expect.poll(() => sinLeer(b)).toBe(antes - 1);

    await b.getByLabel("Respuesta").fill("Dale, te la paso");
    await b.getByRole("button", { name: "Enviar" }).click();
    await expect(b.getByRole("list", { name: "Mensajes" })).toContainText("Dale, te la paso");
  });

  test("un asesor de Roca no tiene contactos de Neuquén salvo dirección", async ({ browser }) => {
    const r = await sesion(browser, "asesor.roca@pea.local");
    await r.goto("/bandeja/nueva");
    await expect(r.getByRole("checkbox", { name: /Diego Director/ })).toBeVisible();
    await expect(r.getByRole("checkbox", { name: /Andrés/ })).toHaveCount(0);
    await expect(r.getByRole("checkbox", { name: /Bruno/ })).toHaveCount(0);
  });

  test("el coordinador carga un evento que ve solo su sede", async ({ browser }) => {
    const dia = `${hoyAr().slice(0, 8)}15`;
    const c = await sesion(browser, "coord.servicio.nqn@pea.local");
    await c.goto("/calendario");
    const form = c.getByRole("form", { name: "Nuevo evento" });
    await form.getByLabel("Título").fill("Evento E2E");
    await form.getByLabel("Fecha").fill(dia);
    await form.getByRole("button", { name: "Crear evento" }).click();
    await expect(form.getByRole("status")).toHaveText("Evento creado.");

    const a = await sesion(browser, "asesor.nqn@pea.local");
    await a.goto("/calendario");
    await expect(a.getByRole("list", { name: "Agenda" })).toContainText("Evento E2E");
    const r = await sesion(browser, "asesor.roca@pea.local");
    await r.goto("/calendario");
    await expect(r.getByText("Evento E2E")).toHaveCount(0);
  });

  test("el director, sin sede, usa la bandeja y el calendario", async ({ browser }) => {
    const d = await sesion(browser, "director@pea.local");
    await d.goto("/bandeja");
    await expect(d.getByRole("heading", { name: "Bandeja de entrada" })).toBeVisible();
    await d.goto(`/calendario?mes=${hoyAr().slice(0, 7)}`);
    await expect(d.getByRole("list", { name: "Agenda" })).toContainText("Jornada de bienvenida (ejemplo)");
  });

  test("exámenes muestra los exámenes de los cursos como próximamente", async ({ browser }) => {
    const a = await sesion(browser, "asesor.nqn@pea.local");
    await a.goto("/examenes");
    await expect(a.getByRole("heading", { name: "Exámenes", level: 1 })).toBeVisible();
    await expect(a.getByRole("list", { name: "Exámenes" })).toContainText("Próximamente");
  });

  test("el repositorio tiene el buscador y la pestaña de recursos", async ({ browser }) => {
    const a = await sesion(browser, "asesor.nqn@pea.local");
    await a.goto("/repositorio");
    await a.getByRole("tab", { name: "Recursos" }).click();
    await expect(a).toHaveURL(/\/recursos$/);
    await a.getByRole("searchbox", { name: "Buscar en el repositorio" }).fill("inscripción");
    await a.getByRole("searchbox", { name: "Buscar en el repositorio" }).press("Enter");
    await expect(a).toHaveURL(/\/buscar\?q=inscripci/);
  });
});
