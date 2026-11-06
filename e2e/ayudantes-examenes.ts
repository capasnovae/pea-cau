import { expect, type Page } from "@playwright/test";

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
export async function responderBien(p: Page) {
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
export async function rendirTodoBien(p: Page) {
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
