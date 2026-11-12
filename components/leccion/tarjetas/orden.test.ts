import { describe, expect, it } from "vitest";
import type { Tarjeta } from "@/lib/dominio/lecciones";
import { ordenarTarjetas } from "./orden";

const caso: Tarjeta = { tipo: "caso", persona: "Lucía", canal: "whatsapp", consulta: "¿Me paso?" };
const idea: Tarjeta = { tipo: "idea", titulo: "T", texto: "x", clave: "k" };
const cierre: Tarjeta = { tipo: "cierre", resolucion: "r", recordar: "k" };
const p = (n: number): Tarjeta => ({ tipo: "probalo", n });

describe("ordenarTarjetas", () => {
  it("ubica cada probalo N con la pregunta N y pone las sueltas antes del cierre", () => {
    const r = ordenarTarjetas([caso, idea, p(1), idea, p(3), cierre], ["q1", "q2", "q3"]);
    expect(r.map((t) => (t.tipo === "probalo" ? t.preguntaId : t.tipo))).toEqual([
      "caso",
      "idea",
      "q1",
      "idea",
      "q3",
      "q2",
      "cierre",
    ]);
  });
  it("omite una tarjeta probalo sin pregunta", () => {
    const r = ordenarTarjetas([caso, p(2), idea, cierre], ["q1"]);
    expect(r.map((t) => (t.tipo === "probalo" ? t.preguntaId : t.tipo))).toEqual([
      "caso",
      "idea",
      "q1",
      "cierre",
    ]);
  });
  it("sin video no hay tarjeta de video, y el video se omite si no hay enlace", () => {
    expect(ordenarTarjetas([caso, cierre], []).some((t) => t.tipo === "video")).toBe(false);
    const conVideo: Tarjeta[] = [{ tipo: "video", ruta: "a.mp4" }, caso, cierre];
    expect(ordenarTarjetas(conVideo, [], null).some((t) => t.tipo === "video")).toBe(false);
    expect(ordenarTarjetas(conVideo, [], "https://firmado/a.mp4")[0]).toEqual({
      tipo: "video",
      ruta: "a.mp4",
      url: "https://firmado/a.mp4",
    });
  });
});
