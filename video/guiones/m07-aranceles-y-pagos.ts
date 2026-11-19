// Video del módulo 7 · Aranceles y pagos (contenido/videos/modulos/07-aranceles-y-pagos.guion.md).
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const gabriela = persona("Gabriela", "Grado, EDH", 0);
const julia = persona("Julia", "Estudiante", 1);
const brenda = persona("Brenda", "Ingresante", 0);

const guion: Guion = {
  titulo: "Aranceles y pagos",
  bajada: "Módulo 7 · Aranceles, becas y pagos",
  tipo: "módulo",
  estudiante: gabriela,
  planos: [
    ...apertura("Consultas que cuestan plata", ["Matrícula, paquetes y pagos", "Deuda, anulaciones y bajas", "Reintegros y Garantía de Adaptación"],
      "Matrícula, tickets, pagos rechazados, deuda, bajas, reintegros y la Garantía de Adaptación. Son consultas delicadas: un dato mal dado le cuesta plata al estudiante."),
    cap("Matrícula y paquetes", "1"),
    tab("Matrícula y paquetes", "check", [
      t("Sin matrícula, no se rinde", "mal", 0),
      t("Grado distancia: hasta 3 = un ticket", "neutro", 1, "de 4 a 6: Ticket A + Ticket B"),
      t("Solo Subperíodo B", "neutro", 1, "Ticket B y hasta 3 materias"),
      t("Antes del ticket, validá", "aviso", 2, "clase de estudio, modalidad y subperíodo", "Validá antes"),
    ], [
      n("Sin la matrícula paga y activa, no se rinde.", 0),
      n("En grado a distancia, de una a tres materias se paga un ticket; de cuatro a seis, el semestre completo, Ticket A más Ticket B. Si empieza recién en el Subperíodo B, paga solo el Ticket B y cursa hasta tres. En PD, se paga por cantidad de materias. Las extras van aparte y sin becas, hasta dos por semestre.", 1),
      n("Antes de decirle qué ticket le corresponde, validá la clase de estudio, la modalidad, las materias y el subperíodo.", 2),
    ]),
    cap("Pagar", "2"),
    tab("Pagar", "calendario", [
      t("El pago va primero a la deuda", "aviso", 0),
      t("72 horas hábiles para acreditarse", "neutro", 0, "pagar con tiempo y guardar el comprobante"),
      t("Tarjeta rechazada", "neutro", 1, "lo resuelve con su banco"),
    ], [
      n("Todo pago va primero a la deuda: con deuda, no puede pagar lo actual. Los pagos tardan unas setenta y dos horas hábiles en acreditarse, así que conviene pagar con tiempo y guardar el comprobante.", 0),
      n("Si una tarjeta rechaza el pago, lo resuelve el estudiante con su banco: que pruebe con un monto menor y tipee los datos.", 1),
    ]),
    cap("Deuda y notas de crédito", "3"),
    tab("Deuda, saldo y notas de crédito", "lupa", [
      t("Nota de crédito", "neutro", 0, "nunca la matrícula", "Nunca la matrícula"),
      t("Libre deuda con error, sin deuda", "ok", 1, "a Tesorería con la captura"),
      t("Si la deuda existe", "aviso", 1, "a SOPER"),
    ], [
      n("La nota de crédito reconoce el cursado pagado y no cursado, nunca la matrícula, y se hace desde el botón.", 0),
      n("Si la deuda no se entiende, revisás todo y derivás. Para un libre deuda que da error sin deuda real, a Tesorería con la captura; si la deuda existe, a SOPER.", 1),
    ]),
    cap("Anular tickets y pagos", "4"),
    tab("Anular tickets y pagos", "alerta", [
      t("Antes de las 18 h se anula", "neutro", 0, "hasta 48 h, se devuelve"),
      t("Anular genera deuda", "mal", 1, "salvo un duplicado; y se pierde el descuento", "Ojo"),
    ], [
      n("Un pago se anula antes de las dieciocho horas del mismo día; hasta cuarenta y ocho horas, se devuelve. El ticket se anula desde la botonera.", 0),
      n("Ojo: salvo que sea un duplicado, anular un pago genera deuda y baja administrativa, y se pierde el descuento del medio de pago.", 1),
    ]),
    cap("Cuando quiere darse de baja", "5"),
    tab("Cuando quiere darse de baja", "estrella", [
      t("Escuchar", "neutro", 0),
      t("Ofrecer alternativas", "neutro", 0, "sin insistir"),
      t("Derivar a Grupo de Riesgo", "ok", 0, "contacto en 72 horas"),
      t("Recupero", "ok", 1, "2 o más matrículas impagas, en ED o EDH"),
    ], [
      n("Escuchá el motivo, revisá su situación y ofrecé alternativas, sin insistir. No prometas reintegros ni excepciones: se deriva a Grupo de Riesgo con el teléfono y las alternativas que ofreciste, y lo contactan en setenta y dos horas.", 0),
      n("Si debe dos o más matrículas en ED o EDH, podés ofrecerle el recupero: todo el semestre en un solo pago.", 1),
    ]),
    cap("Reintegros", "6"),
    tab("Reintegros", "alerta", [
      t("No hay reintegro habitual", "aviso", 0, "solo excepciones, con autorización"),
      t("La matrícula", "mal", 0, "", "No se devuelve"),
      t("Con baja: Grupo de Riesgo", "neutro", 1, "sin adelantar el resultado"),
      t("Fallecimiento y egresados", "neutro", 2, "Grupo de Riesgo y SOPER"),
    ], [
      n("La Universidad no hace reintegros como gestión habitual: solo se evalúan en forma excepcional, con autorización. La matrícula no se devuelve, porque cubre el alta del estudiante: el usuario, el legajo y los accesos.", 0),
      n("«No me gustó», «cambié de opinión» o «me voy a otra universidad» no justifican un reintegro. Escuchás, preguntás y ofrecés alternativas. Si el pedido viene con una baja, lo analiza solo Grupo de Riesgo, y vos no adelantás si va a salir.", 1),
      n("Si un familiar informa que un estudiante falleció, das tus condolencias, tomás sus datos de contacto y derivás a Grupo de Riesgo. Y si un egresado tiene saldo a favor, el reintegro va a SOPER.", 2),
    ]),
    cap("Garantía de Adaptación", "7"),
    tab("Garantía de Adaptación", "check", [
      t("Reinicia la carrera", "ok", 0, "con lo pagado a su favor", "Una sola vez"),
      t("Requisitos", "neutro", 1, "matrícula + ticket, sin aprobadas, hasta 2 años"),
      t("La pide el estudiante en el Portal", "aviso", 2, "regulares y libres vuelven a Cursando"),
      t("Con pase: ticket a N2", "neutro", 3, "primero la garantía, después el pase"),
    ], [
      n("Para el ingresante al que le costó arrancar existe la Garantía de Adaptación: reinicia la carrera con el cien por ciento de la matrícula y los aranceles pagados a su favor.", 0),
      n("Tiene que haber pagado al menos una matrícula y un ticket, no tener materias aprobadas del primer semestre y no haber pasado dos años desde el ingreso. Se usa una sola vez por legajo.", 1),
      n("La pide el estudiante en el Portal, en Gestiones; vos no podés hacerla por él. Las materias regulares o libres vuelven a Cursando, así que avisale antes.", 2),
      n("Si además quiere cambiar de carrera o de modalidad, va por ticket a N2: primero la garantía y después el pase.", 3),
    ]),
    cap("Caso 1 · ¿Qué tengo que pagar?"),
    chat(gabriela, [
      es("Soy de EDH, grado. Quiero cursar cinco materias este semestre. ¿Qué pago?"),
      as("Con cinco materias pagás la matrícula y el semestre completo, Ticket A más Ticket B."),
      n("De cuatro a seis materias, semestre completo."),
    ]),
    cap("Caso 2 · Quiero anular el pago"),
    chat(julia, [
      es("Pagué hoy a la mañana y me equivoqué de ticket. ¿Lo pueden anular?", "audio"),
      as("Si es antes de las dieciocho horas, se puede anular hoy. Antes te aviso: salvo que sea un pago duplicado, anularlo te deja con deuda y perdés el descuento del medio de pago. ¿Querés seguir?"),
      n("Primero la consecuencia, después la decisión."),
    ]),
    cap("Caso 3 · No me pude adaptar"),
    chat(brenda, [
      es("Empecé este año y no me pude adaptar, casi no cursé. Pagué la matrícula y el ticket A. ¿Pierdo todo?"),
      as("No lo perdés, Brenda. Como sos ingresante y no aprobaste materias, podés pedir la Garantía de Adaptación desde el Portal, en Gestiones. Reiniciás la carrera con lo que pagaste a favor. Se usa una sola vez."),
      n("Antes de hablar de reintegros, fijate si es ingresante: la garantía puede ser la respuesta."),
    ]),
    cierre(["Primero la deuda; 72 h hábiles.", "Validá antes del ticket.", "La matrícula no se devuelve.", "Ingresante: Garantía de Adaptación."], [
      n("Uno: el pago va primero a la deuda y tarda setenta y dos horas hábiles.", 0),
      n("Dos: validá clase de estudio, modalidad, materias y subperíodo antes del ticket.", 1),
      n("Tres: no hay reintegro habitual y la matrícula no se devuelve; en una baja, derivá sin prometer.", 2),
      n("Cuatro: el ingresante que no pudo arrancar tiene la Garantía de Adaptación, una sola vez, desde el Portal.", 3),
    ]),
  ],
};
export default guion;
