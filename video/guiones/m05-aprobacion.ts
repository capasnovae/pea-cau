// Video del módulo 5 · Aprobación (contenido/videos/modulos/05-aprobacion.guion.md).
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const ana = persona("Ana", "Estudiante de EDH", 0);
const vera = persona("Vera", "Estudiante de ED", 1);

const guion: Guion = {
  titulo: "Aprobación",
  bajada: "Módulo 5 · Evaluación",
  tipo: "módulo",
  estudiante: ana,
  planos: [
    ...apertura("Cómo termina una materia", ["Promoción", "Regular", "Libre por nota"],
      "Una materia puede terminar promocionada, regular o libre por nota. Cada condición cambia cómo y cuándo se rinde el final."),
    cap("Promoción", "1"),
    tab("Promoción", "estrella", [
      t("Directa: todo con 7", "ok", 0, "", "Sin final"),
      t("Indirecta: 4 TP con 7", "neutro", 1, "y parciales con 5 o 6: va al integrador"),
    ], [
      n("Promoción directa: todo con siete o más.", 0),
      n("Promoción indirecta: los cuatro TP con siete y los parciales con cinco o seis. En ese caso va al integrador, y si saca siete, promociona.", 1),
    ]),
    cap("Regular", "2"),
    tab("Regular", "calendario", [
      t("Final de 30 preguntas", "neutro", 0, "se aprueba con 4"),
      t("18 meses y 3 oportunidades", "ok", 0),
    ], [n("Si quedó regular, rinde un final de treinta preguntas, que se aprueba con cuatro. Tiene dieciocho meses y tres oportunidades.", 0)]),
    cap("Libre por nota", "3"),
    tab("Libre por nota", "alerta", [
      t("Final de 50 preguntas", "neutro", 0),
      t("3 meses y una sola oportunidad", "mal", 0, "", "Una oportunidad"),
    ], [n("Libre por nota es distinto: el final tiene cincuenta preguntas, hay tres meses para rendirlo y una sola oportunidad.", 0)]),
    cap("Caso 1 · ¿Cuántas veces puedo rendir?"),
    chat(ana, [
      es("Me quedó Contabilidad regular. ¿Cuántas veces puedo rendir el final?"),
      as("Como está regular, tenés tres oportunidades dentro de dieciocho meses. El final tiene treinta preguntas y se aprueba con cuatro."),
      n("Antes de responder, mirá la condición de la materia."),
    ]),
    cap("Caso 2 · Quedé libre por nota"),
    chat(vera, [
      es("Me dicen que quedé libre por nota. ¿Es lo mismo que regular?", "audio"),
      as("No. Libre por nota tiene un final de cincuenta preguntas, tres meses para rendirlo y una sola oportunidad. Te conviene anotarte con tiempo."),
    ]),
    cierre(["Directa: todo con 7.", "Regular: 18 meses y 3 oportunidades.", "Libre por nota: 3 meses y una."], [
      n("Uno: promoción directa, todo con siete.", 0),
      n("Dos: regular, final de treinta, dieciocho meses y tres oportunidades.", 1),
      n("Tres: libre por nota, final de cincuenta, tres meses y una oportunidad.", 2),
    ]),
  ],
};
export default guion;
