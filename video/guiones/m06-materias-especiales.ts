// Video del módulo 6 · Materias especiales (contenido/videos/modulos/06-materias-especiales.guion.md).
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const carla = persona("Carla", "Práctica Profesional", 0);
const valentina = persona("Valentina", "Práctica Solidaria", 1);

const guion: Guion = {
  titulo: "Materias especiales",
  bajada: "Módulo 6 · Evaluación",
  tipo: "módulo",
  estudiante: carla,
  planos: [
    ...apertura("Materias con reglas propias", ["Prácticas", "Idiomas a distancia", "EFIP"],
      "Hay materias que no siguen las reglas de siempre: las de proceso, como las prácticas, los idiomas a distancia y el EFIP. Vamos una por una."),
    cap("Práctica Profesional", "1"),
    tab("Práctica Profesional", "notebook", [
      t("No se promocionan ni se rinden libres", "mal", 0, "si no cumple, recursa", "Se recursa"),
      t("Canvas + 250 horas con tutor", "neutro", 1, "3 TP con 5, el TP4 obligatorio"),
      t("Desempeño con 7 y planilla", "ok", 1, "se entregan con el TP4"),
      t("Taller antes de Soy Siglo", "aviso", 2),
    ], [
      n("Las materias de proceso no se promocionan ni se rinden libres: si no cumple, se recursa.", 0),
      n("La Práctica Profesional tiene una parte en Canvas, con los TP, y doscientas cincuenta horas en una organización, con un tutor. Necesita tres TP con cinco, y el TP4 es obligatorio. Con el TP4 entrega la evaluación de desempeño, con siete o más, y la planilla de asistencia.", 1),
      n("Antes de cargar cualquier formulario en Soy Siglo, tiene que hacer el taller.", 2),
    ]),
    tab("Soy Siglo, sin confundirse", "lupa", [
      t("«Aprobado» no es asignado", "mal", 0, "se confirma con organización y tutor en «Revisar»", "Ojo"),
      t("Se deriva a los 10 días hábiles", "neutro", 0),
      t("Convenios digitales", "ok", 1, "el estudiante no firma nada", "No firma"),
    ], [
      n("Ojo con un detalle: si pidió que la Universidad le asigne organización, «Aprobado» no significa que ya tenga una. La asignación se confirma cuando ve los datos de la organización y del tutor en «Revisar». Se deriva recién si pasaron más de diez días hábiles.", 0),
      n("Los convenios se firman de forma digital en Soy Siglo, entre la Universidad y la organización. El seguro cubre desde el primer día de clases.", 1),
    ]),
    cap("Práctica Solidaria", "2"),
    tab("Práctica Solidaria", "estrella", [
      t("Desde el 3.er cuatrimestre", "neutro", 0, "sin costo, con 4 encuentros"),
      t("Acción directa en derechos humanos", "ok", 0, "3 años de trayectoria y un tutor"),
      t("Protectora de animales", "mal", 1, "", "No se aprueba"),
      t("No rechaza la asignada", "aviso", 1, "propone otra"),
    ], [
      n("Se cursa desde el tercer cuatrimestre y no tiene costo. Tiene cuatro encuentros en el semestre. La organización tiene que ser de la sociedad civil, con acción directa en derechos humanos, tres años de trayectoria y un tutor.", 0),
      n("Una protectora de animales no sirve. Y si no le gusta la organización asignada, no la rechaza: propone otra.", 1),
    ]),
    cap("Idiomas a distancia", "3"),
    tab("Idiomas a distancia", "check", [
      t("Regular dentro del año", "aviso", 0, "si no, reinicia"),
      t("Integrador de 50 preguntas", "neutro", 0, "aprueba con 4"),
      t("Eximición", "ok", 1, "certificación de la lista, comprobable"),
    ], [
      n("A distancia, el idioma tiene que quedar regular dentro del año; si no, reinicia. El integrador tiene cincuenta preguntas y se aprueba con cuatro.", 0),
      n("Con una certificación internacional de la lista, con el nivel mínimo y comprobable, se puede eximir.", 1),
    ]),
    cap("EFIP", "4"),
    tab("EFIP", "calendario", [
      t("Solo grado en ED y EDH", "neutro", 0, "presencial, ante un tribunal"),
      t("EFIP I: hasta 3 veces", "aviso", 1),
      t("EFIP II", "neutro", 1, "todo aprobado, Seminario regular, sin deuda"),
      t("Anulación: 7 días corridos antes", "neutro", 2, "error o nota faltante: SAI"),
    ], [
      n("El EFIP es solo para carreras de grado en ED y EDH, presencial ante un tribunal, con las fechas en la Cartelera.", 0),
      n("El EFIP I se puede rendir hasta tres veces. El EFIP II pide todo aprobado, el Seminario Final regular y no tener deuda.", 1),
      n("Se inscribe el estudiante, o el asesor con el botón. Se anula hasta siete días corridos antes. Si da error o falta la nota, va a SAI.", 2),
    ]),
    cap("Caso 1 · Me figura Aprobado"),
    chat(carla, [
      es("Pedí que la Universidad me asigne una organización y en Soy Siglo me figura «Aprobado», pero no sé a dónde ir.", "audio"),
      as("Carla, «Aprobado» quiere decir que recibieron tu pedido. Entrá a «Revisar»: si no ves la organización ni el tutor, todavía no te asignaron. Si pasan más de diez días hábiles desde que cargaste el formulario, lo derivo."),
      n("Aprobado no es asignado."),
    ]),
    cap("Caso 2 · En un refugio"),
    chat(valentina, [
      es("Quiero hacer la Práctica Solidaria en un refugio de animales donde ya colaboro."),
      as("Valentina, un refugio de animales no se aprueba: la organización tiene que trabajar en forma directa con personas, en derechos humanos. Podés proponer otra que cumpla los requisitos o pedir que la Universidad te asigne una."),
    ]),
    cierre(["Proceso: si no cumple, recursa.", "Aprobado no es asignado.", "EFIP: solo grado a distancia."], [
      n("Uno: las materias de proceso no se promocionan: si no cumple, recursa.", 0),
      n("Dos: en las prácticas, «Aprobado» no es asignación, y el estudiante no firma convenios.", 1),
      n("Tres: el EFIP es solo para grado a distancia.", 2),
    ]),
  ],
};
export default guion;
