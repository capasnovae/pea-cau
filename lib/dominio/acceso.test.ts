import { describe, expect, it } from "vitest";
import { decidirRedireccion, destinoInactivo, esRutaPublica } from "./acceso";

describe("decidirRedireccion", () => {
  it("manda al anónimo a ingresar", () => {
    expect(decidirRedireccion("/inicio", "anonimo")).toBe("/ingresar");
  });
  it("deja al anónimo en las rutas públicas", () => {
    expect(decidirRedireccion("/ingresar", "anonimo")).toBeNull();
    expect(decidirRedireccion("/verificar/ABC123", "anonimo")).toBeNull();
    expect(decidirRedireccion("/auth/confirm", "anonimo")).toBeNull();
  });
  it("saca al usuario activo de la pantalla de ingreso", () => {
    expect(decidirRedireccion("/ingresar", "activo")).toBe("/inicio");
  });
  it("deja pasar al usuario activo", () => {
    expect(decidirRedireccion("/inicio", "activo")).toBeNull();
  });
  it("deja al usuario activo definir su clave (invitación o recuperación)", () => {
    expect(decidirRedireccion("/definir-clave", "activo")).toBeNull();
  });
  it("saca al usuario inactivo", () => {
    expect(decidirRedireccion("/inicio", "inactivo")).toBe("/ingresar?motivo=inactivo");
    expect(decidirRedireccion("/ingresar", "inactivo")).toBeNull();
  });
});

describe("salida forzada", () => {
  it("deja que cualquier estado pase por /salir para cerrar la sesión", () => {
    expect(decidirRedireccion("/salir", "activo")).toBeNull();
    expect(decidirRedireccion("/salir", "anonimo")).toBeNull();
  });
  it("no rebota a /inicio al que llega a /ingresar avisado de inactividad", () => {
    expect(decidirRedireccion("/ingresar?motivo=inactivo", "activo")).toBeNull();
  });
  it("el destino de un inactivo pasa por /salir", () => {
    expect(destinoInactivo()).toBe("/salir?motivo=inactivo");
  });
});

describe("esRutaPublica", () => {
  it("no confunde prefijos", () => {
    expect(esRutaPublica("/ingresarx")).toBe(false);
    expect(esRutaPublica("/verificar")).toBe(true);
  });
});
