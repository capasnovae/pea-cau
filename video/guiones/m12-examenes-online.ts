// Video del módulo 12 · Exámenes online (contenido/videos/modulos/12-examenes-online.guion.md).
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const luz = persona("Luz", "Estudiante de EDH", 0);
const nadia = persona("Nadia", "Estudiante de ED", 1);

const guion: Guion = {
  titulo: "Exámenes online",
  bajada: "Módulo 12 · Plataformas",
  tipo: "módulo",
  estudiante: luz,
  planos: [
    ...apertura("Rendir online, en dos partes", ["Inscribirse en el Portal", "Klarway antes y durante el examen"],
      "Rendir online tiene dos partes: inscribirse bien en el Portal y tener Klarway listo antes del examen."),
    cap("Inscribirse en el Portal", "1"),
    tab("Inscribirse en el Portal", "calendario", [
      t("Exámenes › Nueva inscripción", "neutro", 0, "desde la primera semana, a los dos parciales"),
      t("Fuera de plazo", "aviso", 1, "el sistema asigna una fecha"),
      t("En PD", "neutro", 1, "el parcial ya viene asignado"),
    ], [
      n("En el Portal, en Exámenes, Nueva inscripción. Desde la primera semana puede inscribirse a los dos parciales, sin esperar a rendir el primero.", 0),
      n("Si no se inscribe en el plazo, el sistema le asigna una fecha automáticamente. En PD, el parcial ya viene asignado.", 1),
    ]),
    cap("Klarway", "2"),
    tab("Klarway", "notebook", [
      t("PC o Mac", "neutro", 0, "el celular no sirve"),
      t("Registro: hasta 24 h hábiles", "aviso", 0, "", "Con tiempo"),
      t("Durante el examen", "neutro", 1, "programas cerrados, rostro, luz y micrófono"),
      t("Si algo falla", "ok", 2, "captura con fecha y hora"),
    ], [
      n("Klarway se usa en PC o Mac. El registro tarda hasta veinticuatro horas hábiles, así que tiene que hacerlo con anticipación.", 0),
      n("Durante el examen: programas cerrados, el rostro validado, buena luz y el micrófono encendido.", 1),
      n("Si algo falla, que saque una captura con fecha y hora. Se informa por Consulta Alumnos, al Área Tecnológica.", 2),
    ]),
    cap("Caso 1 · Rindo mañana"),
    chat(luz, [
      es("Mañana rindo y todavía no me registré en Klarway."),
      as("Registrate ya: puede tardar hasta veinticuatro horas hábiles. Necesitás una PC o una Mac, no sirve el celular."),
      n("Klarway se prepara con tiempo, no la noche anterior."),
    ]),
    cap("Caso 2 · No me anoté al parcial"),
    chat(nadia, [
      es("Se me pasó la fecha para anotarme al parcial. ¿Pierdo el examen?", "audio"),
      as("No. Si no te anotaste en el plazo, el sistema te asigna una fecha. Entrá al Portal y fijate cuál te tocó."),
    ]),
    cierre(["Desde la primera semana, los dos parciales.", "Klarway: PC o Mac, con 24 h hábiles.", "Si falla: captura con fecha y hora."], [
      n("Uno: desde la primera semana, inscripción a los dos parciales.", 0),
      n("Dos: Klarway, en PC o Mac, registrado con veinticuatro horas hábiles de anticipación.", 1),
      n("Tres: si algo falla, captura con fecha y hora.", 2),
    ]),
  ],
};
export default guion;
