import { describe, expect, it } from "vitest";
import {
  esquemaAnuncio,
  esquemaMensajeNuevo,
  esquemaRespuesta,
  fechaCorta,
  iniciales,
  mensajeErrorBandeja,
  parseFiltro,
  puedeAnunciar,
} from "./bandeja";

const UUID = "c4000000-0000-4000-8000-000000000001";

describe("parseFiltro", () => {
  it("acepta los filtros conocidos y cae a la entrada", () => {
    expect(parseFiltro("anuncios")).toBe("anuncios");
    expect(parseFiltro("x")).toBe("entrada");
    expect(parseFiltro(undefined)).toBe("entrada");
  });
});

describe("esquemas", () => {
  it("un mensaje nuevo necesita destinatarios, asunto y cuerpo", () => {
    expect(esquemaMensajeNuevo.safeParse({ destinatarios: [], asunto: "Hola", cuerpo: "x" }).success).toBe(
      false,
    );
    expect(
      esquemaMensajeNuevo.safeParse({ destinatarios: [UUID], asunto: "a".repeat(151), cuerpo: "x" }).success,
    ).toBe(false);
    expect(
      esquemaMensajeNuevo.safeParse({ destinatarios: [UUID], asunto: " Hola ", cuerpo: " Qué tal " }).data,
    ).toEqual({
      destinatarios: [UUID],
      asunto: "Hola",
      cuerpo: "Qué tal",
    });
  });
  it("la respuesta no puede estar vacía", () => {
    expect(esquemaRespuesta.safeParse({ cuerpo: "   " }).success).toBe(false);
  });
  it("el anuncio convierte la sede vacía en null", () => {
    expect(esquemaAnuncio.safeParse({ asunto: "A", cuerpo: "B", sede_id: "" }).data?.sede_id).toBeNull();
  });
});

describe("fechaCorta", () => {
  const ahora = new Date("2026-11-06T15:00:00-03:00");
  it("hoy muestra la hora, ayer dice ayer, la semana el día y si no la fecha", () => {
    expect(fechaCorta("2026-11-06T10:24:00-03:00", ahora)).toBe("10:24");
    expect(fechaCorta("2026-11-05T22:00:00-03:00", ahora)).toBe("ayer");
    expect(fechaCorta("2026-11-02T09:00:00-03:00", ahora)).toBe("lun");
    expect(fechaCorta("2026-10-20T09:00:00-03:00", ahora)).toBe("20/10");
  });
});

describe("iniciales", () => {
  it("toma las iniciales de nombre y apellido", () => {
    expect(iniciales("Martín Gómez")).toBe("MG");
    expect(iniciales("Ana")).toBe("A");
  });
});

describe("mensajeErrorBandeja", () => {
  it("traduce los errores de la base", () => {
    expect(mensajeErrorBandeja("destinatario no permitido")).toBe(
      "Solo podés escribirle a gente de tu sede.",
    );
    expect(mensajeErrorBandeja("los anuncios no admiten respuestas")).toBe(
      "Este anuncio no admite respuestas.",
    );
    expect(mensajeErrorBandeja("otra cosa")).toBe("No pudimos enviar el mensaje.");
  });
});

describe("puedeAnunciar", () => {
  it("solo coordinación, dirección y admin", () => {
    expect(["asesor", "lider", "coordinador", "director", "admin"].map(puedeAnunciar)).toEqual([
      false,
      false,
      true,
      true,
      true,
    ]);
  });
});
