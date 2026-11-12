import { describe, expect, it } from "vitest";
import {
  enlaceAcceso,
  enlaceWhatsApp,
  esquemaAsignacion,
  esquemaInvitacion,
  mensajeErrorInvitacion,
} from "./invitacion";

const SEDE = "8a4f6a3e-0b8d-4f7e-9a51-1d2c3b4a5e6f";
const base = {
  email: "ana@siglo.test",
  nombre: "Ana",
  apellido: "Paz",
  rol: "asesor",
  sede_id: SEDE,
  area: "servicio",
  puesto_id: null,
};

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
    expect(esquemaInvitacion.safeParse({ ...base, rol: "director", sede_id: null, area: null }).success).toBe(
      true,
    );
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

describe("esquemaAsignacion", () => {
  const U = "0b1c2d3e-4f50-4a61-8b72-9c83d4e5f601";
  const ok = {
    id: U,
    sede_id: SEDE,
    area: "servicio",
    equipo_id: "",
    puesto_id: "",
    subrol_ids: [] as string[],
  };
  it("acepta sede y área con equipo y puesto vacíos", () => {
    const r = esquemaAsignacion.safeParse(ok);
    expect(r.success).toBe(true);
    expect(r.success && r.data.equipo_id).toBeNull();
  });
  it("rechaza un id que no es uuid", () => {
    expect(esquemaAsignacion.safeParse({ ...ok, id: "1 or 1=1" }).success).toBe(false);
  });
  it("rechaza subroles que no son uuid", () => {
    expect(esquemaAsignacion.safeParse({ ...ok, subrol_ids: ["x"] }).success).toBe(false);
  });
  it("no permite equipo sin sede", () => {
    expect(esquemaAsignacion.safeParse({ ...ok, sede_id: "", equipo_id: U }).success).toBe(false);
  });
});

describe("enlaceAcceso", () => {
  it("arma el link a /auth/confirm con el token y el tipo", () => {
    expect(enlaceAcceso("https://peacapa.netlify.app", "abc123", "invite")).toBe(
      "https://peacapa.netlify.app/auth/confirm?token_hash=abc123&type=invite",
    );
    expect(enlaceAcceso("http://127.0.0.1:3000/", "a b", "recovery")).toBe(
      "http://127.0.0.1:3000/auth/confirm?token_hash=a+b&type=recovery",
    );
  });
  it("no arma links con un origen raro", () => {
    expect(() => enlaceAcceso("javascript:alert(1)", "x", "invite")).toThrow();
    expect(() => enlaceAcceso("", "x", "invite")).toThrow();
  });
});

describe("enlaceWhatsApp", () => {
  it("prepara el mensaje para mandar por WhatsApp", () => {
    const url = new URL(enlaceWhatsApp("Ana", "https://pea.test/auth/confirm?token_hash=t&type=invite"));
    expect(url.origin).toBe("https://wa.me");
    expect(url.searchParams.get("text")).toBe(
      "Hola Ana, te sumamos a PEA. Entrá con este link para definir tu contraseña (sirve una sola vez y vence en 24 horas): https://pea.test/auth/confirm?token_hash=t&type=invite",
    );
  });
});
