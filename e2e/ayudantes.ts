import { expect, type Page } from "@playwright/test";

export const CLAVE_DEV = "pea-dev-1234";

/** true si la API REST de Supabase (PostgREST) responde; sin ella las pantallas logueadas no cargan. */
export async function hayApiRest(): Promise<boolean> {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL ?? "http://127.0.0.1:54321";
  try {
    const r = await fetch(`${url}/rest/v1/`, {
      headers: { apikey: process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY ?? "" },
    });
    return r.status < 500 && r.status !== 404;
  } catch {
    return false;
  }
}

export async function ingresar(page: Page, email: string, clave = CLAVE_DEV) {
  await page.goto("/ingresar");
  await page.getByLabel("Email").fill(email);
  await page.getByLabel("Contraseña").fill(clave);
  await page.getByRole("button", { name: "Ingresar" }).click();
}

export async function esperarInicio(page: Page) {
  await expect(page.getByText(/^¡Hola, /)).toBeVisible();
}
