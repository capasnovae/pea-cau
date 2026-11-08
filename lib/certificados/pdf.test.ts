import { PDFDocument, StandardFonts } from "pdf-lib";
import { describe, expect, it } from "vitest";
import { generarCertificadoPdf, seguro, tamanoQueEntra } from "./pdf";

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

describe("textos del PDF", async () => {
  const doc = await PDFDocument.create();
  const fuente = await doc.embedFont(StandardFonts.HelveticaBold);
  it("reemplaza solo los caracteres que no entran y conserva las tildes", () => {
    expect(seguro("Łukasz Ñandú", fuente)).toBe("?ukasz Ñandú");
    expect(seguro("Andrés", fuente)).toBe("Andrés");
  });
  it("achica la letra hasta que el texto entra en el ancho", () => {
    const largo = "María de los Ángeles Fernández Rodríguez de la Santísima Trinidad";
    const t = tamanoQueEntra(largo, fuente, 36, 746);
    expect(t).toBeLessThan(36);
    expect(fuente.widthOfTextAtSize(largo, t)).toBeLessThanOrEqual(746);
    expect(tamanoQueEntra("Ana Paz", fuente, 36, 746)).toBe(36);
  });
});
