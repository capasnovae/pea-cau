import { expect, test, type Browser, type Page } from "@playwright/test";
import { esperarInicio, hayApiRest, ingresar } from "./ayudantes";

test.beforeEach(async () => test.skip(!(await hayApiRest()), "PostgREST no disponible en este entorno"));

async function sesion(browser: Browser, email: string): Promise<Page> {
  const page = await (await browser.newContext()).newPage();
  await ingresar(page, email);
  await esperarInicio(page);
  return page;
}

test("el asesor recorre el Nivel 1 en orden y desbloquea el Nivel 2", async ({ browser }) => {
  const a = await sesion(browser, "asesor.nqn@pea.local");
  const ruta = a.getByRole("region", { name: "Tu ruta" });
  await expect(ruta).toContainText("Base: reglamento y plataformas");
  await expect(ruta).toContainText("0%");

  await a.goto("/estudiar");
  const todos = a.getByRole("region", { name: "Todos los cursos" });
  await expect(todos.getByRole("row").filter({ hasText: "Operativo: modalidades y trámites" })).toContainText(
    "Bloqueado",
  );
  await todos.getByRole("link", { name: /Base: reglamento y plataformas/ }).click();
  const plataformas = a.getByRole("listitem").filter({ hasText: "Portal de estudiantes" }).last();
  await expect(plataformas).toContainText("completá lo anterior");

  // Paso 1: artículo (ver) → se marca al abrirlo
  await a.goto("/inicio");
  await a.getByRole("link", { name: "Continuar" }).click();
  await expect(a.getByRole("heading", { name: "Inscripción a materias", level: 1 })).toBeVisible();
  await a.getByRole("link", { name: "Siguiente" }).click();

  // Paso 2: página (marcar como hecho)
  await expect(
    a.getByRole("heading", { name: "Cómo buscar una materia en el portal (ejemplo)" }),
  ).toBeVisible();
  await expect(a.getByText("Error común:")).toBeVisible();
  await a.getByRole("button", { name: "Listo, siguiente" }).click();

  // Paso 3: video embebido
  await expect(a.getByRole("heading", { name: "Video: recorrido por el portal (ejemplo)" })).toBeVisible();
  await expect(a.locator('iframe[src^="https://www.youtube-nocookie.com/embed/"]')).toBeVisible();
  await a.getByRole("link", { name: "Siguiente" }).click();

  // Paso 4: Plataformas ya habilitado
  await expect(a.getByRole("heading", { name: "Portal de estudiantes", level: 1 })).toBeVisible();
  await a.getByRole("button", { name: "Listo, siguiente" }).click();
  await expect(a).toHaveURL(/\/estudiar\/c4000000-0000-4000-8000-000000000001$/);
  await expect(a.getByText("100% completado")).toBeVisible();

  await a.goto("/estudiar");
  await expect(
    a
      .getByRole("region", { name: "Todos los cursos" })
      .getByRole("link", { name: /Operativo: modalidades y trámites/ }),
  ).toBeVisible();
  await expect(a.getByRole("region", { name: "Terminados" })).toContainText("Base: reglamento y plataformas");
});

test("las capacitaciones dependen del puesto", async ({ browser }) => {
  const ceo = await sesion(browser, "asesor2.nqn@pea.local");
  await ceo.goto("/estudiar");
  const fila = ceo
    .getByRole("region", { name: "Todos los cursos" })
    .getByRole("row")
    .filter({ hasText: "Herramientas del CEO (ejemplo)" });
  await expect(fila).toContainText("Capacitación");
  await expect(fila).toContainText("Obligatorio");

  const front = await sesion(browser, "asesor.roca@pea.local");
  await front.goto("/estudiar");
  await expect(front.getByText("Herramientas del CEO (ejemplo)")).toHaveCount(0);
});

test("el asesor marca un curso como favorito y aparece primero", async ({ browser }) => {
  const a = await sesion(browser, "asesor2.nqn@pea.local");
  await a.goto("/estudiar");
  const estrella = a
    .getByRole("region", { name: "Todos los cursos" })
    .getByRole("row")
    .filter({ hasText: "Herramientas del CEO (ejemplo)" })
    .getByRole("button", { name: "Marcar como favorito" });
  await estrella.click();
  await expect(
    a.getByRole("region", { name: "Todos los cursos" }).getByRole("button", { name: "Quitar de favoritos" }),
  ).toHaveAttribute("aria-pressed", "true");
  await a.goto("/inicio?vista=cursos");
  await expect(a.getByRole("list", { name: "Mis cursos" }).getByRole("listitem").first()).toContainText(
    "Herramientas del CEO (ejemplo)",
  );
});

test("el coordinador arma un curso de sede y solo lo ve su sede", async ({ browser }) => {
  const titulo = `Atención en mostrador ${Date.now()}`;
  const coord = await sesion(browser, "coord.servicio.nqn@pea.local");
  await coord.goto("/contenido/cursos");
  const nuevo = coord.locator("form").filter({ has: coord.getByRole("button", { name: "Crear curso" }) });
  await nuevo.getByLabel("Título del curso").fill(titulo);
  await nuevo.getByLabel("Estado").selectOption("publicado");
  await nuevo.getByRole("button", { name: "Crear curso" }).click();
  await expect(coord).toHaveURL(/creado=1/);
  const cursoUrl = coord.url().split("?")[0]!;
  const cursoId = cursoUrl.split("/").pop()!;

  const formModulo = coord
    .locator("form")
    .filter({ has: coord.getByRole("button", { name: "Agregar módulo" }) });
  await formModulo.getByLabel("Título del módulo").fill("Saludo");
  await formModulo.getByRole("button", { name: "Agregar módulo" }).click();
  await expect(coord.getByRole("region", { name: "Módulo Saludo" })).toBeVisible();
  const formPaso = coord
    .getByRole("region", { name: "Módulo Saludo" })
    .locator("form")
    .filter({ has: coord.getByRole("button", { name: "Agregar paso" }) });
  await formPaso.getByLabel("Título del paso").fill("Cómo recibir al alumno");
  await expect(formPaso.getByLabel("Tipo")).toHaveValue("leccion");
  await formPaso.getByLabel("En 30 segundos 1", { exact: true }).fill("Saludá por el nombre y ofrecé ayuda.");
  await formPaso.getByLabel("Consulta 1", { exact: true }).fill("Hola, vengo a averiguar.");
  await formPaso.getByLabel("Respuesta 1", { exact: true }).fill("¡Bienvenido! Contame qué necesitás.");
  await formPaso.getByLabel("Fuente").selectOption({ index: 1 });
  await formPaso.getByRole("button", { name: "Agregar paso" }).click();
  await expect(coord.getByText("Ítem guardado.")).toBeVisible();

  const asesor = await sesion(browser, "asesor.nqn@pea.local");
  await asesor.goto(`/estudiar/${cursoId}`);
  await expect(asesor.getByRole("heading", { name: titulo })).toBeVisible();
  await expect(asesor.getByText("Cómo recibir al alumno")).toBeVisible();

  const roca = await sesion(browser, "asesor.roca@pea.local");
  expect((await roca.goto(`/estudiar/${cursoId}`))?.status()).toBe(404);
});

test("una lección: bloques fijos, Probalo con corrección y el paso queda cumplido", async ({ browser }) => {
  const a = await (await browser.newContext()).newPage();
  await ingresar(a, "asesor.nqn@pea.local");
  await esperarInicio(a);
  await a.goto("/estudiar/c4000000-0000-4000-8000-000000000009/c6000000-0000-4000-8000-000000000009");
  await expect(a.getByRole("region", { name: "En 30 segundos" })).toContainText("calendario académico");
  await expect(a.getByRole("region", { name: "Así llega al CAU" })).toContainText("Se me pasó la fecha");
  await expect(a.getByRole("region", { name: "Ojo con" })).toBeVisible();
  await expect(a.getByRole("region", { name: "Fuente" }).getByRole("link")).toBeVisible();
  await expect(a.getByRole("button", { name: "Listo, siguiente" })).toHaveCount(0);

  const probalo = a.getByRole("region", { name: "Probalo" });
  await probalo.getByRole("radio", { name: "Verdadero" }).check();
  await probalo.getByRole("button", { name: "Comprobar" }).click();
  await expect(probalo.getByRole("status")).toContainText("Todavía no");
  await probalo.getByRole("button", { name: "Otra vez" }).click();
  await probalo.getByRole("radio", { name: "Falso" }).check();
  await probalo.getByRole("button", { name: "Comprobar" }).click();
  await expect(probalo.getByRole("status")).toContainText("¡Bien!");
  await expect(probalo).toContainText("1/1 acertadas");

  await a.goto("/estudiar/c4000000-0000-4000-8000-000000000009");
  await expect(a.getByText("100% completado")).toBeVisible();
});

test("vista previa: el admin recorre un curso en borrador y un asesor no lo ve", async ({ browser }) => {
  const TRAMITES = "9fe6df40-deab-4faa-8040-e0ecc8236963";
  const adm = await (await browser.newContext()).newPage();
  await ingresar(adm, "admin@pea.local");
  await esperarInicio(adm);
  await adm.goto(`/contenido/cursos/${TRAMITES}`);
  await adm.getByRole("link", { name: /Ver como asesor/ }).click();
  await expect(adm.getByRole("status").filter({ hasText: "Vista previa" })).toBeVisible();
  await adm.getByRole("link", { name: /Cambio de modalidad/ }).click();
  await expect(adm.getByRole("region", { name: "En 30 segundos" })).toBeVisible();
  const probalo = adm.getByRole("region", { name: "Probalo" });
  await probalo.getByRole("radio").first().check();
  await probalo.getByRole("button", { name: "Comprobar" }).click();
  // Probalo como caso: explica por qué la opción elegida está bien o mal
  await expect(probalo.getByRole("status")).toContainText("Tu respuesta:");
  await expect(adm.getByRole("status").filter({ hasText: "Vista previa" })).toBeVisible();

  const a = await (await browser.newContext()).newPage();
  await ingresar(a, "asesor.nqn@pea.local");
  await esperarInicio(a);
  expect((await a.goto(`/estudiar/${TRAMITES}`))?.status()).toBe(404);
});
