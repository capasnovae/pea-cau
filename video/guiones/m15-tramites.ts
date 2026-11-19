// Video del módulo 15 · Trámites (contenido/videos/modulos/15-tramites.guion.md).
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const lucia = persona("Lucía", "Estudiante de ED", 0);
const florencia = persona("Florencia", "Equivalencias externas", 1);

const guion: Guion = {
  titulo: "Trámites",
  bajada: "Módulo 15 · Trámites",
  tipo: "módulo",
  estudiante: lucia,
  planos: [
    ...apertura("Requisitos antes del pedido", ["Cambio de modalidad", "Equivalencias y segunda carrera", "Certificados, analíticos y baja"],
      "Cambio de modalidad, equivalencias, certificados, analíticos y bajas. Cada trámite tiene requisitos previos: si no los revisás, el pedido rebota."),
    cap("Cambio de modalidad", "1"),
    tab("Cambio de modalidad", "check", [
      t("En fecha, sin deuda", "neutro", 0, "legajo completo y sin finales pendientes"),
      t("Aprobadas y regulares se conservan", "ok", 0, "cursando y libres por nota se recursan"),
      t("Final anotado", "aviso", 1, "primero rinde, después el pase", "Primero el final"),
    ], [
      n("Se pide en fecha, sin deuda, con el legajo completo y sin finales pendientes. Las materias aprobadas y regulares se conservan; las que está cursando y las libres por nota se recursan.", 0),
      n("Si tiene un final anotado, primero rinde, después se pide el pase.", 1),
    ]),
    cap("Equivalencias", "2"),
    tab("Equivalencias", "lupa", [
      t("Se comparan programas", "neutro", 0, "hasta el 70 % del plan"),
      t("Con regla: 3 días hábiles", "ok", 1, "sin regla: programas, tutor y 30 días"),
      t("Condicional", "aviso", 2, "documentación hasta la 5.ª semana", "5.ª semana"),
      t("Segunda carrera", "neutro", 3, "a Equivalencias, con los dos legajos"),
    ], [
      n("Se comparan programas, no nombres: contenidos, objetivos y bibliografía. Nada parcial, y hasta el setenta por ciento del plan.", 0),
      n("El trámite lo hace el estudiante en el Portal de Equivalencias. Con regla, tarda tres días hábiles y no pide programas. Sin regla, lleva programas, lo analiza un tutor y tarda treinta días hábiles. El tutor puede rechazar la materia sugerida y reconocer otra.", 1),
      n("Si la equivalencia es condicional, la documentación se completa hasta la quinta semana de cursado; si no, quedan libres.", 2),
      n("Para una segunda carrera, el legajo de destino tiene que estar creado y sin duplicados. Se deriva a Equivalencias con los dos legajos y las dos carreras.", 3),
    ]),
    cap("Certificados, analíticos y baja", "3"),
    tab("Certificados, analíticos y baja", "correo", [
      t("Alumno regular del Portal", "ok", 0, "tiene plena validez"),
      t("Analítico parcial", "neutro", 1, "tasa vigente 3 meses; 5 días hábiles"),
      t("La baja", "mal", 2, "sin deuda ni libros pendientes", "Sin reintegro"),
    ], [
      n("El certificado de alumno regular del Portal tiene plena validez; con firma digital, solo si la entidad lo exige.", 0),
      n("El analítico parcial necesita DNI, analítico secundario, legajo completo y la tasa paga, que vale tres meses. Va a Secretaría Académica y tarda cinco días hábiles. Para egresados, la constancia de título en trámite se valida en el SGU y en SIDCer.", 1),
      n("La baja se pide en la Mesa o por el Portal, sin deuda y sin libros pendientes. No devuelve lo pagado ni cancela la deuda.", 2),
    ]),
    cap("Caso 1 · Me quiero pasar a EDH"),
    chat(lucia, [
      es("Curso ED y con el trabajo no llego a la asistencia. Me quiero pasar a EDH."),
      as("Lucía, antes reviso tus materias. ¿Tenés algún final anotado? Si es así, primero rendís y después pedimos el pase, en las fechas del calendario de trámites."),
    ]),
    cap("Caso 2 · Me dieron otra materia"),
    chat(florencia, [
      es("Pedí equivalencias y una materia que sugerí me la rechazaron, pero me dieron otra distinta. ¿Es un error?", "audio"),
      as("No es un error: el tutor puede rechazar la que sugeriste y reconocerte otra que considere equivalente. En el portal, en «Ver motivo de rechazo», tenés el detalle."),
    ]),
    cierre(["Modalidad: sin finales pendientes.", "Con regla 3 días; sin regla 30.", "La baja no devuelve lo pagado."], [
      n("Uno: cambio de modalidad, sin finales pendientes y en fecha.", 0),
      n("Dos: equivalencias, se comparan programas; con regla, tres días hábiles; sin regla, treinta.", 1),
      n("Tres: la baja no devuelve lo pagado.", 2),
    ]),
  ],
};
export default guion;
