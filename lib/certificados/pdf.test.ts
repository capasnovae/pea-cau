import { PDFDocument } from "pdf-lib";
import { describe, expect, it } from "vitest";
import { generarCertificadoPdf } from "./pdf";

describe("generarCertificadoPdf", () => {
  it("arma un PDF apaisado de una página con el título del certificado", async () => {
    const bytes = await generarCertificadoPdf({
      nombre: "Andrés Núñez",
      nivel: 1,
      curso: "Base: reglamento y plataformas",
      emitidaAt: "2026-11-11T12:00:00Z",
      venceAt: null,
      codigo: "AB12CD34EF",
      urlVerificacion: "https://pea.app/verificar/AB12CD34EF",
    });
    expect(new TextDecoder().decode(bytes.slice(0, 4))).toBe("%PDF");
    const doc = await PDFDocument.load(bytes);
    expect(doc.getPageCount()).toBe(1);
    const { width, height } = doc.getPage(0).getSize();
    expect(width).toBeGreaterThan(height);
    expect(doc.getTitle()).toBe("Certificado Nivel 1 · Andrés Núñez");
  });
});
