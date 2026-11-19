// Video del módulo 4 · Trabajos y exámenes (contenido/videos/modulos/04-trabajos-y-examenes.guion.md).
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const milena = persona("Milena", "Estudiante de EDH", 0);
const sol = persona("Sol", "Estudiante de ED", 1);

const guion: Guion = {
  titulo: "Trabajos y exámenes",
  bajada: "Módulo 4 · Evaluación",
  tipo: "módulo",
  estudiante: milena,
  planos: [
    ...apertura("Cada examen tiene su regla", ["Trabajos prácticos", "Parciales, recuperatorios e integradores", "Inscripción y problemas"],
      "Trabajos prácticos, parciales, recuperatorios, integradores y finales. Cada uno tiene su regla, y la mayoría de las consultas salen de confundirlas."),
    cap("Los trabajos prácticos", "1"),
    tab("Los trabajos prácticos", "check", [
      t("Regulariza con 3 de 4 TP", "neutro", 0, "aprobados con 5 o más"),
      t("MEC y MAP: se rehacen", "ok", 1, "tarde: menos 5 por día, sin bajar de 5"),
      t("MIA y MIP: una sola entrega", "mal", 2, "si no entrega, 0 y promedia", "Una sola entrega"),
    ], [
      n("Regulariza con tres de cuatro TP aprobados con cinco o más.", 0),
      n("En las MEC y las MAP, el TP se rehace sin límite mientras esté en fecha; si lo entrega tarde, se descuentan cinco puntos por día, sin bajar de cinco.", 1),
      n("En las MIA y las MIP hay una sola entrega en fecha: si no entrega, tiene cero y promedia.", 2),
    ]),
    cap("Parciales e integradores", "2"),
    tab("Parciales, recuperatorios e integradores", "estrella", [
      t("Parcial: 20 preguntas", "neutro", 0, "aprueba con 5"),
      t("Un 7 no se recupera", "mal", 0, "", "No se recupera"),
      t("Se recupera", "ok", 1, "menos de 5, ausente, o para llegar a 7"),
      t("Integrador con 5 o 6 en los dos", "aviso", 2, "su nota reemplaza aunque baje"),
    ], [
      n("El parcial tiene veinte preguntas y se aprueba con cinco. Un siete o más no se recupera.", 0),
      n("Se recupera si sacó menos de cinco, si estuvo ausente, o para llegar a siete cuando el otro parcial ya tiene siete.", 1),
      n("Con cinco o seis en los dos, va al integrador: si saca siete, promociona. Ojo, la nota del integrador reemplaza aunque baje.", 2),
    ]),
    cap("Inscribirse a los exámenes", "3"),
    tab("Inscribirse a los exámenes", "calendario", [
      t("Parcial: hasta 24 h antes", "neutro", 0, "no se anula; en PD, sin inscripción"),
      t("Recuperatorio e integrador: 24 h", "neutro", 1, "se anulan hasta 48 h antes"),
      t("Final: 4 días corridos", "aviso", 2, "se anula hasta 8 días antes"),
      t("Para rendir", "ok", 3, "DNI, matrícula paga y 15 min de tolerancia"),
    ], [
      n("Al parcial se inscribe hasta veinticuatro horas antes y no se anula; en PD no hace falta inscribirse.", 0),
      n("Recuperatorio e integrador: hasta veinticuatro horas antes, y se anulan hasta cuarenta y ocho horas antes.", 1),
      n("El final se pide con cuatro días corridos de anticipación y se anula hasta ocho días antes.", 2),
      n("Para rendir: DNI, matrícula paga, inscripción, y quince minutos de tolerancia.", 3),
    ]),
    cap("Reprogramar un examen", "4"),
    tab("Reprogramar un examen", "calendario", [
      t("ED y EDH: hasta 4 veces", "ok", 0, "si no lo empezó y está en período"),
      t("Sistema Q responde en 72 h hábiles", "neutro", 0),
      t("PD: los finales no", "mal", 1, "el resto, por formulario del supervisor", "Finales no"),
    ], [
      n("En ED y EDH, el CAU puede reprogramar hasta cuatro veces un examen, si no lo empezó y está dentro del período. Con los datos completos, Sistema Q responde en setenta y dos horas hábiles.", 0),
      n("En PD, los finales no se reprograman; el resto, por un formulario que carga el supervisor.", 1),
    ]),
    cap("Problemas en el examen", "5"),
    tab("Problemas en el examen", "alerta", [
      t("Empezó y Klarway lo cortó", "aviso", 0, "se pide la anulación"),
      t("No pudo entrar", "neutro", 0, "se reprograma"),
      t("Revisión: primero en Klarway", "neutro", 1),
      t("Falta una nota", "neutro", 2, "primero, el historial"),
    ], [
      n("Si empezó el examen, Klarway lo cortó y le quedó una nota, se pide la anulación. Si directamente no pudo entrar, se reprograma.", 0),
      n("Si no está de acuerdo con la nota, la revisión se pide primero en Klarway; se deriva solo si ya le respondieron y sigue en desacuerdo.", 1),
      n("Y si falta una nota, primero mirá el historial.", 2),
    ]),
    cap("Caso 1 · Saqué 7 en el primero"),
    chat(milena, [
      es("Saqué 7 en el primero y 4 en el segundo. ¿Puedo recuperar el primero para subir?"),
      as("El 7 no se recupera. Lo que podés recuperar es el segundo, porque tenés menos de cinco. Si en el recuperatorio llegás a 7, tenés los dos parciales con 7."),
      n("Se recupera lo que está abajo de cinco, o para llegar a siete. Nunca un siete."),
    ]),
    cap("Caso 2 · Klarway se cortó"),
    chat(sol, [
      es("Arranqué el final, a los diez minutos se me cerró Klarway y me quedó un 2.", "audio"),
      as("Como empezaste el examen y Klarway lo cortó, corresponde pedir la anulación. Mandame una captura con fecha y hora y lo gestiono."),
      n("Empezó y se cortó: anulación. No pudo entrar: reprogramación."),
    ]),
    cierre(["MEC y MAP se rehacen; MIA y MIP, una entrega.", "Un 7 no se recupera.", "Final: 4 días antes, anula hasta 8."], [
      n("Uno: MEC y MAP se rehacen; MIA y MIP tienen una sola entrega.", 0),
      n("Dos: un siete no se recupera, y el integrador reemplaza aunque baje.", 1),
      n("Tres: el final se pide con cuatro días corridos y se anula hasta ocho días antes.", 2),
    ]),
  ],
};
export default guion;
