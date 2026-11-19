// Video del módulo 2 · Modalidades (contenido/videos/modulos/02-modalidades.guion.md).
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const julieta = persona("Julieta", "Estudiante de PD", 0);
const camila = persona("Camila", "Estudiante de EDH", 1);

const guion: Guion = {
  titulo: "Modalidades",
  bajada: "Módulo 2 · Cursado y modalidades",
  tipo: "módulo",
  estudiante: julieta,
  planos: [
    ...apertura("Primero, la modalidad", ["ED, EDH y PD", "Cambio de CAU y de carrera", "Datos del legajo"],
      "Cada modalidad tiene sus reglas de asistencia, de exámenes y de egreso. Si no sabés en qué modalidad está el estudiante, cualquier respuesta puede estar mal. Arranquemos por ahí."),
    cap("Las tres modalidades", "1"),
    tab("ED, EDH y PD", "estrella", [
      t("ED", "neutro", 0, "plataforma + Open Class cada 2 semanas"),
      t("EDH", "neutro", 1, "todo en la plataforma, sin ir al CAU"),
      t("PD", "neutro", 2, "presencial y cuatrimestral, con telepresencia"),
      t("75 % de asistencia en ED y PD", "aviso", 3, "EDH no tiene asistencia", "75 %"),
    ], [
      n("A distancia están ED y EDH. En ED se cursa en la plataforma y se va a Open Class en el CAU cada dos semanas por materia; en grado, puede sumar una materia ciento por ciento virtual.", 0),
      n("En EDH, todo es en la plataforma, sin ir al CAU.", 1),
      n("PD, en cambio, es presencial y cuatrimestral, con telepresencia.", 2),
      n("ED y PD piden setenta y cinco por ciento de asistencia. EDH no tiene asistencia.", 3),
    ]),
    cap("Exámenes y egreso", "2"),
    tab("Según la modalidad", "calendario", [
      t("Parciales con inscripción", "neutro", 0, "en ED y EDH; en PD son automáticos"),
      t("Final con instancia oral", "neutro", 1, "solo en PD"),
      t("EFIP en ED y EDH", "ok", 2, "en PD, Defensa Oral después del Seminario"),
    ], [
      n("En ED y EDH, a los parciales hay que inscribirse; en PD, son automáticos.", 0),
      n("El final es escrito en todas, pero en PD suma una instancia oral.", 1),
      n("Y al final de la carrera: en ED y EDH se rinde el EFIP; en PD no hay EFIP: después del Seminario Final va la Defensa Oral.", 2),
    ]),
    cap("Cambio de CAU", "3"),
    tab("Cambio de CAU", "lupa", [
      t("Sin deuda ni final anotado", "aviso", 0),
      t("Su carrera, en el CAU de destino", "aviso", 0),
      t("Formulario + ticket a Gestiones N2", "ok", 1, "3 días hábiles"),
    ], [
      n("Para cambiar de CAU, el estudiante no tiene que tener deuda ni un final anotado, y su carrera tiene que existir en el CAU de destino.", 0),
      n("Completa el formulario y vos cargás el ticket a Gestiones N2, que tarda tres días hábiles.", 1),
    ]),
    cap("Cambio de carrera y de plan", "4"),
    tab("Cambio de carrera y de plan", "check", [
      t("Sin deuda ni notas pendientes", "aviso", 0, "y con el legajo completo"),
      t("Ticket a Trámites", "ok", 0, "hasta 5 días hábiles"),
      t("Plan nuevo: explicá el impacto", "neutro", 1, "y dejá su aceptación en el ticket", "Con su aceptación"),
    ], [
      n("Para cambiar de carrera: sin deuda, sin final anotado ni notas pendientes, y con el legajo completo. Se deriva a Trámites con la aceptación del estudiante, y tarda hasta cinco días hábiles.", 0),
      n("Si pasa a un plan nuevo, explicale cómo impacta en sus materias y dejá su aceptación en el ticket.", 1),
    ]),
    cap("Datos y estado del legajo", "5"),
    tab("Datos y estado del legajo", "lupa", [
      t("Dato mal: copia del DNI físico", "neutro", 0, "a Gestiones N2, se corrige todo de una vez"),
      t("Baja administrativa", "aviso", 1, "se reactiva al pagar la deuda"),
      t("Si hubo anulación de pago", "mal", 1, "primero, Cobranzas"),
    ], [
      n("Si hay un dato mal, se corrige con la copia del DNI físico, a Gestiones N2, y se arregla todo el registro de una vez.", 0),
      n("Si tiene baja administrativa, se reactiva al pagar la deuda. Pero si hubo una anulación de pago, primero va a Cobranzas.", 1),
    ]),
    cap("Caso 1 · ¿Me inscribo a los parciales?"),
    chat(julieta, [
      es("Estoy en PD y una amiga en EDH me dijo que tengo que inscribirme a los parciales y que después rindo el EFIP. ¿Es así para mí también?", "audio"),
      as("No, Julieta. En PD los parciales son automáticos, y no rendís EFIP: después del Seminario Final vas a la Defensa Oral. Sí te tenés que inscribir a los recuperatorios, a los integradores y a los finales, que además tienen una parte oral."),
      n("La amiga tenía razón para su modalidad, no para la de Julieta."),
    ]),
    cap("Caso 2 · Me quiero cambiar de carrera"),
    chat(camila, [
      es("Quiero pasarme a otra carrera. ¿Lo pedís vos?"),
      as("Sí. Antes reviso que no tengas deuda, ni un final anotado, ni notas pendientes, y que tu legajo esté completo. Después te cuento qué materias se reconocen y cuáles no, y con tu aceptación cargo el pedido a Trámites."),
      n("Revisar primero y dejar la aceptación por escrito te ahorra un reclamo después."),
    ]),
    cierre(["Primero, la modalidad.", "Distancia: inscripción y EFIP. PD: automáticos y Defensa.", "Cambios: sin deuda ni finales."], [
      n("Uno: primero preguntá la modalidad.", 0),
      n("Dos: en ED y EDH, parciales con inscripción y EFIP; en PD, parciales automáticos, final con oral y Defensa Oral.", 1),
      n("Tres: cambio de CAU o de carrera, siempre sin deuda y sin finales anotados.", 2),
    ]),
  ],
};
export default guion;
