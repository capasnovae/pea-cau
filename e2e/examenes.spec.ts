import { expect, test, type Browser, type Page } from "@playwright/test";
import { esperarInicio, hayApiRest, ingresar } from "./ayudantes";

test.beforeEach(async () => test.skip(!(await hayApiRest()), "PostgREST no disponible en este entorno"));

async function sesion(browser: Browser, email: string): Promise<Page> {
  const page = await (await browser.newContext()).newPage();
  await ingresar(page, email);
  await esperarInicio(page);
  return page;
}

async function guardado(p: Page) {
  await expect(p.getByText("Guardado", { exact: true })).toBeVisible();
}

const ORDEN_CORRECTO = [
  "Ingresar al portal",
  "Buscar la materia",
  "Elegir la comisión",
  "Confirmar la inscripción",
];

/** Responde bien la pregunta en pantalla, según las preguntas de ejemplo del seed. */
async function responderBien(p: Page) {
  const pregunta = p.getByRole("region", { name: /^Pregunta \d+ de \d+$/ });
  const texto = (await pregunta.textContent()) ?? "";
  const marcar = async (...opciones: string[]) => {
    for (const o of opciones) await pregunta.getByLabel(o, { exact: true }).check();
  };
  if (texto.includes("¿Qué necesita un alumno")) await marcar("Estar regular", "No tener deuda");
  else if (texto.includes("fuera de término")) await marcar("Falso");
  else if (texto.includes("¿Qué le respondés?")) await marcar("Primero tiene que aprobar las correlativas");
  else if (texto.includes("¿Qué sistema abrís primero?")) await marcar("Portal de estudiantes");
  else if (texto.includes("La mesa no está habilitada")) await marcar("Gestión de exámenes (ticket)");
  else if (texto.includes("¿Cuál es una modalidad")) await marcar("Educación Distribuida Home");
  else if (texto.includes("Presencial Distribuida no hay")) await marcar("Falso");
  else if (texto.includes("¿Dónde se ven las notas")) await marcar("En el portal de estudiantes");
  else if (texto.includes("Explicá con tus palabras")) {
    await pregunta
      .getByLabel("Tu respuesta")
      .fill(
        "Home es a distancia, Distribuida es híbrida y Presencial Distribuida tiene encuentros presenciales.",
      );
    await pregunta.getByLabel("Tu respuesta").blur();
  } else if (texto.includes("Ubicá cada consulta")) {
    await pregunta.getByLabel("Columna para Reinscripción").selectOption("CAU");
    await pregunta.getByLabel("Columna para Cuota vencida").selectOption("Tesorería");
    await pregunta.getByLabel("Columna para Cambio de carrera").selectOption("CAU");
  } else if (texto.includes("Creá el caso en el sistema")) {
    await pregunta.getByLabel("Área").selectOption("Tesorería");
    await pregunta.getByLabel("Prioridad").selectOption("Alta");
    await pregunta.getByLabel("Motivo").fill("Cuota vencida");
    await pregunta.getByLabel("Motivo").blur();
  } else if (texto.includes("Ordená los pasos")) {
    const lista = pregunta.getByRole("list", { name: "Pasos en orden" });
    for (let i = 0; i < ORDEN_CORRECTO.length; i++) {
      const actual = await lista.locator("li > span.flex-1").allTextContents();
      for (let j = actual.indexOf(ORDEN_CORRECTO[i]!); j > i; j--) {
        await pregunta.getByRole("button", { name: `Subir ${ORDEN_CORRECTO[i]}` }).click();
      }
    }
    const confirmar = pregunta.getByRole("button", { name: "Confirmar este orden" });
    if (await confirmar.isVisible()) await confirmar.click();
  } else {
    throw new Error(`Pregunta sin respuesta conocida: ${texto.slice(0, 80)}`);
  }
  await guardado(p);
}

/** Responde todas las preguntas del intento y entrega desde "Revisar". */
async function rendirTodoBien(p: Page) {
  await expect(p).toHaveURL(/\/examenes\/intento\/[0-9a-f-]{36}$/);
  for (;;) {
    await responderBien(p);
    const siguiente = p.getByRole("button", { name: "Siguiente", exact: true });
    if (await siguiente.isVisible()) await siguiente.click();
    else break;
  }
  await p.getByRole("button", { name: "Entregar", exact: true }).click();
  await p.getByRole("button", { name: /^Confirmar entrega/ }).click();
  await expect(p).toHaveURL(/\/resultado$/);
}

test("el asesor rinde Plataformas (cuadro, formulario, ordenar) y aprueba con 100", async ({ browser }) => {
  const a = await sesion(browser, "asesor.nqn@pea.local");
  await a.goto("/examenes");
  const fila = a
    .getByRole("list", { name: "Exámenes" })
    .getByRole("link", { name: /Plataformas \(ejemplo\)/ });
  await expect(fila).toContainText("Disponible");
  await fila.click();
  await a.getByRole("button", { name: "Empezar" }).click();
  await expect(a.getByRole("timer")).toBeVisible();
  await rendirTodoBien(a);
  await expect(a.getByRole("region", { name: "Resultado" })).toContainText("100%");
  await expect(a.getByRole("region", { name: "Resultado" })).toContainText("Aprobado");
  await expect(a.getByRole("list", { name: "Revisión" }).getByLabel("Correcta").first()).toBeVisible();
});

test("revisar antes de entregar, entregar sin responder y ver la revisión", async ({ browser }) => {
  const a = await sesion(browser, "asesor.nqn@pea.local");
  await a.goto("/examenes/d1000000-0000-4000-8000-000000000001");
  await a.getByRole("button", { name: "Empezar" }).click();
  await a.getByRole("button", { name: "Revisar y entregar" }).click();
  const revisar = a.getByRole("region", { name: "Revisar" });
  await expect(revisar.getByText("Sin responder").first()).toBeVisible();
  await revisar.getByRole("button", { name: /Pregunta 1/ }).click();
  await responderBien(a);
  await a.getByRole("button", { name: "Revisar y entregar" }).click();
  await expect(a.getByRole("region", { name: "Revisar" }).getByText("Respondida")).toBeVisible();
  await a.getByRole("button", { name: /^Confirmar entrega/ }).click();
  await expect(a.getByRole("region", { name: "Resultado" })).toContainText("No aprobado");
  await expect(a.getByRole("link", { name: "Estudiá esto →" }).first()).toBeVisible();
  await a.goto("/examenes/d1000000-0000-4000-8000-000000000001");
  await expect(a.getByText("Intentos", { exact: true }).locator("..")).toContainText("2");
});

test.describe.serial("ubicación, práctica y corrección", () => {
  test("asesor2 aprueba el bloque 1 de ubicación y se le abre el Nivel 2", async ({ browser }) => {
    const b = await sesion(browser, "asesor2.nqn@pea.local");
    await b.goto("/examenes");
    const ubicacion = b.getByRole("region", { name: "Examen de ubicación" });
    await expect(ubicacion).toContainText("Bloque 1");
    await ubicacion.getByRole("button", { name: "Empezar" }).click();
    await rendirTodoBien(b);
    await expect(b.getByRole("region", { name: "Resultado" })).toContainText("Aprobado");
    await expect(b.getByRole("button", { name: "Seguir con el Nivel 2" })).toBeVisible();
    await b.goto("/estudiar");
    await expect(
      b
        .getByRole("region", { name: "Todos los cursos" })
        .getByRole("link", { name: /Operativo: modalidades y trámites/ }),
    ).toBeVisible();
  });

  test("asesor2 practica: el cuadro mal muestra la solución y al acertar todo el paso se cumple", async ({
    browser,
  }) => {
    const b = await sesion(browser, "asesor2.nqn@pea.local");
    await b.goto("/estudiar/c4000000-0000-4000-8000-000000000002");
    await b.getByRole("link", { name: /Práctica: derivar consultas/ }).click();
    const practica = b.getByRole("region", { name: "Práctica" });
    await expect(practica).toContainText("Ubicá cada consulta");
    await practica.getByLabel("Columna para Reinscripción").selectOption("Tesorería");
    await practica.getByLabel("Columna para Cuota vencida").selectOption("Tesorería");
    await practica.getByLabel("Columna para No aparece la mesa").selectOption("Gestión de exámenes");
    await practica.getByRole("button", { name: "Comprobar" }).click();
    await expect(practica.getByRole("status")).toContainText("Todavía no");
    await expect(practica.getByRole("status")).toContainText("Reinscripción → CAU");
    await practica.getByRole("button", { name: "Otra vez" }).click();
    await practica.getByLabel("Columna para Reinscripción").selectOption("CAU");
    await practica.getByRole("button", { name: "Comprobar" }).click();
    await expect(practica.getByRole("status")).toContainText("¡Bien!");
    await practica.getByRole("button", { name: "Otra pregunta" }).click();
    await practica.getByLabel("Tipo de caso").selectOption("Consulta");
    await practica.getByLabel("Área").selectOption("Gestión de exámenes");
    await practica.getByLabel("Prioridad").selectOption("Alta");
    await practica.getByRole("button", { name: "Comprobar" }).click();
    await expect(practica).toContainText("2/2 acertadas");
  });

  test("asesor2 rinde el final del Nivel 2 (con libre), el líder lo corrige y aparece la nota", async ({
    browser,
  }) => {
    const b = await sesion(browser, "asesor2.nqn@pea.local");
    await b.goto("/examenes/d1000000-0000-4000-8000-000000000002");
    await b.getByRole("button", { name: "Empezar" }).click();
    await rendirTodoBien(b);
    await expect(b.getByRole("heading", { name: "Pendiente de corrección" })).toBeVisible();

    const l = await sesion(browser, "lider.nqn@pea.local");
    await l.goto("/equipo/correcciones");
    const fila = l
      .getByRole("list", { name: "Cola de corrección" })
      .getByRole("listitem")
      .filter({ hasText: "Final del Nivel 2" });
    await expect(fila).toContainText("Bruno");
    await fila.getByRole("button", { name: "Tomar" }).click();
    await l.getByLabel(/Puntaje/).fill("2");
    await l.getByLabel("Devolución").fill("Muy bien explicado.");
    await l.getByRole("button", { name: "Cerrar corrección" }).click();
    await expect(l).toHaveURL(/cerrada=1/);

    await b.goto("/examenes/d1000000-0000-4000-8000-000000000002");
    await expect(b.getByRole("region", { name: "Tus intentos" })).toContainText("100%");
  });
});

test("modo examen: sin menú, aviso al salir de la pestaña y salir entrega", async ({ browser }) => {
  const a = await sesion(browser, "asesor.roca@pea.local");
  await a.goto("/examenes/d1000000-0000-4000-8000-000000000003");
  await a.getByRole("button", { name: "Empezar" }).click();
  await expect(a).toHaveURL(/\/examenes\/intento\/[0-9a-f-]{36}$/);
  await expect(a.getByRole("navigation", { name: "Principal" })).toHaveCount(0);

  // Irse a otra pestaña y volver
  const cambiarVista = (estado: "hidden" | "visible") =>
    a.evaluate((e) => {
      Object.defineProperty(document, "visibilityState", { configurable: true, get: () => e });
      document.dispatchEvent(new Event("visibilitychange"));
    }, estado);
  await cambiarVista("hidden");
  await cambiarVista("visible");
  const aviso = a.getByRole("alertdialog", { name: "Saliste del examen" });
  await expect(aviso).toContainText("1 vez");
  await aviso.getByRole("button", { name: "Volver al examen" }).click();

  await a.getByRole("button", { name: "Salir" }).click();
  const salir = a.getByRole("alertdialog", { name: "¿Salir del examen?" });
  await expect(salir).toContainText("se va a entregar");
  await salir.getByRole("button", { name: "Volver al examen" }).click();
  await expect(salir).toHaveCount(0);
  await a.getByRole("button", { name: "Salir" }).click();
  await a.getByRole("alertdialog").getByRole("button", { name: "Entregar y salir" }).click();
  await expect(a).toHaveURL(/\/resultado$/);
  await expect(a.getByText("Salió del examen 1 vez")).toBeVisible();
  await expect(a.getByRole("navigation", { name: "Principal" }).first()).toBeAttached();
});

test("un asesor no entra a la cola de corrección", async ({ browser }) => {
  const r = await sesion(browser, "asesor.roca@pea.local");
  expect((await r.goto("/equipo/correcciones"))?.status()).toBe(404);
});
