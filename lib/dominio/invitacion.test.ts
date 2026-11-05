import { describe, expect, it } from "vitest";
import { esquemaInvitacion, mensajeErrorInvitacion } from "./invitacion";

const SEDE = "8a4f6a3e-0b8d-4f7e-9a51-1d2c3b4a5e6f";
const base = { email: "ana@siglo.test", nombre: "Ana", apellido: "Paz", rol: "asesor", sede_id: SEDE, area: "servicio", puesto_id: null };

describe("esquemaInvitacion", () => {
  it("acepta un asesor completo", () => {
    expect(esquemaInvitacion.safeParse(base).success).toBe(true);
  });
  it("exige sede al asesor", () => {
    expect(esquemaInvitacion.safeParse({ ...base, rol: "asesor", sede_id: null }).success).toBe(false);
  });
  it("exige área al coordinador", () => {
    expect(esquemaInvitacion.safeParse({ ...base, rol: "coordinador", area: null }).success).toBe(false);
  });
  it("permite director sin sede ni área", () => {
    expect(esquemaInvitacion.safeParse({ ...base, rol: "director", sede_id: null, area: null }).success).toBe(true);
  });
  it("rechaza un email inválido", () => {
    expect(esquemaInvitacion.safeParse({ ...base, email: "no-es-mail" }).success).toBe(false);
  });
  it("rechaza un rol inexistente", () => {
    expect(esquemaInvitacion.safeParse({ ...base, rol: "superadmin" }).success).toBe(false);
  });
});

describe("mensajeErrorInvitacion", () => {
  it("traduce el email duplicado", () => {
    expect(mensajeErrorInvitacion("A user with this email address has already been registered")).toBe(
      "Ya existe un usuario con ese email.",
    );
  });
  it("da un mensaje genérico para el resto", () => {
    expect(mensajeErrorInvitacion("boom")).toBe("No pudimos mandar la invitación. Probá de nuevo.");
  });
});
