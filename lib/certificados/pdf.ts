import { PDFDocument, StandardFonts, rgb, type PDFFont } from "pdf-lib";
import QRCode from "qrcode";
import { formatearFecha } from "@/lib/dominio/contenido";

export type DatosCertificado = {
  nombre: string;
  nivel: number;
  curso: string;
  emitidaAt: string;
  venceAt: string | null;
  codigo: string;
  urlVerificacion: string;
};

const INDIGO = rgb(0x1e / 255, 0x1b / 255, 0x4b / 255);
const PRIMARIO = rgb(0x4f / 255, 0x46 / 255, 0xe5 / 255);
const TINTA = rgb(0x1a / 255, 0x1a / 255, 0x2e / 255);
const GRIS = rgb(0x5b / 255, 0x5b / 255, 0x70 / 255);

/** Helvetica (WinAnsi) cubre el español; cada carácter que no entre pasa a su versión sin tilde o a "?". */
export function seguro(texto: string, fuente: PDFFont): string {
  const entra = (c: string) => {
    try {
      fuente.encodeText(c);
      return true;
    } catch {
      return false;
    }
  };
  if (entra(texto)) return texto;
  return [...texto]
    .map((c) => {
      if (entra(c)) return c;
      const base = c.normalize("NFD").replace(/\p{Diacritic}/gu, "");
      return base && entra(base) ? base : "?";
    })
    .join("");
}

/** El tamaño más grande (hasta tamMax, mínimo 10) con el que el texto entra en el ancho. */
export function tamanoQueEntra(texto: string, fuente: PDFFont, tamMax: number, anchoMax: number): number {
  const ancho = fuente.widthOfTextAtSize(texto, tamMax);
  if (ancho <= anchoMax) return tamMax;
  return Math.max(10, Math.floor(((tamMax * anchoMax) / ancho) * 10) / 10);
}

function centrado(
  page: ReturnType<PDFDocument["addPage"]>,
  texto: string,
  y: number,
  fuente: PDFFont,
  tam: number,
  color = TINTA,
  ancho = 842,
  x0 = 0,
) {
  const t = seguro(texto, fuente);
  const tamano = tamanoQueEntra(t, fuente, tam, ancho - 96);
  page.drawText(t, {
    x: x0 + (ancho - fuente.widthOfTextAtSize(t, tamano)) / 2,
    y,
    size: tamano,
    font: fuente,
    color,
  });
}

/** Certificado A4 apaisado con QR a la página pública de verificación. */
export async function generarCertificadoPdf(d: DatosCertificado): Promise<Uint8Array> {
  const doc = await PDFDocument.create();
  doc.setTitle(`Certificado Nivel ${d.nivel} · ${d.nombre}`);
  doc.setAuthor("PEA · Perfil Evolutivo de Asesor");
  doc.setLanguage("es-AR");
  const page = doc.addPage([842, 595]);
  const normal = await doc.embedFont(StandardFonts.Helvetica);
  const negrita = await doc.embedFont(StandardFonts.HelveticaBold);

  // Marco y franja
  page.drawRectangle({ x: 0, y: 0, width: 842, height: 595, color: rgb(0.97, 0.97, 0.985) });
  page.drawRectangle({ x: 0, y: 515, width: 842, height: 80, color: INDIGO });
  page.drawText("PEA", { x: 48, y: 548, size: 30, font: negrita, color: rgb(1, 1, 1) });
  page.drawText(seguro("Perfil Evolutivo de Asesor", normal), {
    x: 118,
    y: 553,
    size: 13,
    font: normal,
    color: rgb(0.78, 0.82, 0.99),
  });

  centrado(page, "CERTIFICADO", 445, negrita, 16, PRIMARIO);
  centrado(page, "Se certifica que", 400, normal, 14, GRIS);
  centrado(page, d.nombre, 352, negrita, 36);
  centrado(page, `aprobó el Nivel ${d.nivel} · ${d.curso}`, 312, normal, 16);

  const fechas = `Emitido el ${formatearFecha(d.emitidaAt)}  ·  ${d.venceAt ? `Vence el ${formatearFecha(d.venceAt)}` : "Sin vencimiento"}`;
  centrado(page, fechas, 262, normal, 12, GRIS);

  // QR y código
  const qr = await QRCode.toBuffer(d.urlVerificacion, { margin: 1, width: 240, errorCorrectionLevel: "M" });
  const imagen = await doc.embedPng(qr);
  page.drawImage(imagen, { x: 48, y: 48, width: 120, height: 120 });
  page.drawText(seguro("Verificá este certificado", negrita), {
    x: 184,
    y: 128,
    size: 12,
    font: negrita,
    color: TINTA,
  });
  page.drawText(seguro(d.urlVerificacion, normal), { x: 184, y: 108, size: 10, font: normal, color: GRIS });
  page.drawText(seguro(`Código: ${d.codigo}`, negrita), {
    x: 184,
    y: 86,
    size: 12,
    font: negrita,
    color: PRIMARIO,
  });

  return doc.save();
}
