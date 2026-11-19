// Video del módulo 3 · Cursado (contenido/videos/modulos/03-cursado.guion.md).
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const agustina = persona("Agustina", "Abogacía, plan 2022", 0);
const lara = persona("Lara", "Estudiante", 1);

const guion: Guion = {
  titulo: "Cursado",
  bajada: "Módulo 3 · Cursado y modalidades",
  tipo: "módulo",
  estudiante: agustina,
  planos: [
    ...apertura("El día a día", ["Inscripción y calendario", "Correlativas, electivas e Inglés", "Cuando algo sale mal"],
      "Este módulo es el día a día: inscribirse a materias, el calendario, las correlativas, el idioma y lo que pasa cuando algo sale mal con una materia o con un docente."),
    cap("Inscribirse a materias", "1"),
    tab("Inscribirse a materias", "check", [
      t("En fecha, al día y con correlativas", "ok", 0, "sin pago, no queda inscripto"),
      t("Distancia grado: 6 + 2 extras", "neutro", 1, "pregrado 4 + 2; PD hasta 8"),
      t("Ingresantes", "mal", 1, "no suman extras", "Sin extras"),
    ], [
      n("Se inscribe en fecha, al día con los pagos y con las correlativas. Si no paga, no queda inscripto.", 0),
      n("A distancia, en grado puede cursar seis materias más dos extras; en pregrado, cuatro más dos. En PD, hasta ocho. Los ingresantes no suman extras.", 1),
    ]),
    cap("El calendario y el verano", "2"),
    tab("El calendario y el verano", "calendario", [
      t("Calendario vigente en el Portal", "neutro", 0, "parciales: semanas 1 a 4 y 5 a 8"),
      t("Parcial en feriado: se reprograma", "aviso", 0, "en PD, solo por feriado nacional"),
      t("Verano: hasta 4 materias", "neutro", 1, "solo reinscriptos, sin becas ni beneficios"),
    ], [
      n("Las fechas están en el calendario vigente de su modalidad, en el Portal. A distancia, los parciales van en las semanas uno a cuatro y cinco a ocho, y los recuperatorios en la nueve. Si un parcial cae en feriado, se reprograma; en PD, solo por feriado nacional.", 0),
      n("En verano solo se inscriben quienes se reinscribieron, hasta cuatro materias, con un arancel por materia y sin becas ni beneficios.", 1),
    ]),
    cap("Correlativas y planes", "3"),
    tab("Correlativas y planes", "lupa", [
      t("Para cursar: correlativa regular", "neutro", 0),
      t("Para aprobar: correlativa aprobada", "neutro", 0),
      t("Promocionó sin la correlativa", "aviso", 0, "60 días para aprobarla", "60 días"),
      t("Plan viejo inactivo: migra", "ok", 1, "lo que coincide se reconoce solo"),
    ], [
      n("Para inscribirse a una materia, la correlativa tiene que estar regular. Para aprobarla o promocionarla, aprobada. Si promocionó con una correlativa pendiente, tiene sesenta días para aprobarla; si no, la materia queda Regular.", 0),
      n("Y si está en un plan viejo, inactivo y fuera de plazo, migra al plan vigente: lo que coincide se reconoce solo.", 1),
    ]),
    cap("Electivas", "4"),
    tab("Electivas", "estrella", [
      t("4 créditos = 1 electiva", "neutro", 0),
      t("8 créditos = 2 electivas", "neutro", 0),
      t("Nunca más de las del plan", "mal", 1, "solo las que habilita el director", "No más"),
      t("Idiomas", "mal", 1, "no cuentan como electivas"),
    ], [
      n("Cuatro créditos son una electiva; ocho, dos. Psicología no tiene.", 0),
      n("Nunca puede cursar más de las que pide su plan, y solo las que habilita el director. Los idiomas no cuentan como electivas.", 1),
    ]),
    cap("Inglés", "5"),
    tab("Inglés", "check", [
      t("Desde la segunda matrícula", "neutro", 0, "English Discoveries, por un año"),
      t("Placement Test, una vez", "aviso", 0, "70 % para avanzar de nivel"),
      t("Final con 4", "ok", 1, "18 meses y 3 oportunidades"),
      t("Si vence, empieza de cero", "mal", 1, "", "De cero"),
    ], [
      n("Inglés se cursa desde la segunda matrícula, en English Discoveries, que dura un año. El Placement Test se hace una sola vez y define el nivel de inicio. Para avanzar necesita setenta por ciento, y queda regular con el último nivel que le corresponde.", 0),
      n("El final se aprueba con cuatro, y tiene dieciocho meses y tres oportunidades. Si vence, empieza de cero. Portugués se cursa después de aprobar Inglés.", 1),
    ]),
    cap("Cuando algo sale mal", "6"),
    tab("Cuando algo sale mal", "alerta", [
      t("Inscripción por excepción", "neutro", 0, "pago, correlativas y materia abierta"),
      t("Renunciar a la regularidad", "mal", 1, "autogestivo: avisale antes", "Irreversible"),
      t("Condición sin actualizar", "aviso", 2, "esperá 72 horas desde el fin"),
      t("Docente sin respuesta", "neutro", 3, "48 horas y captura: a SGEA"),
    ], [
      n("Si se pasó la fecha y quiere inscribirse, la inscripción por excepción necesita el pago, las correlativas y que la materia esté abierta.", 0),
      n("Si quiere anular una inscripción, en período lo hace desde el Portal. Renunciar a la regularidad es autogestivo e irreversible: avisale antes de que confirme.", 1),
      n("Si la condición de una materia no se actualizó, esperás setenta y dos horas desde el fin del cursado antes de derivar.", 2),
      n("Y si el docente no responde por la mensajería del aula en cuarenta y ocho horas, se deriva a SGEA con la captura.", 3),
    ]),
    cap("Caso 1 · Otra electiva"),
    chat(agustina, [
      es("Estudio Abogacía, plan 2022. Ya aprobé una electiva y quiero anotarme a otra porque me interesa el tema."),
      as("Agustina, tu plan pide cuatro créditos, que es una electiva, y ya la cumpliste. No corresponde inscribirte a otra. Podés seguir con las materias habilitadas de tu carrera desde el Portal."),
      n("Antes de hablar de electivas, validá carrera, plan y créditos."),
    ]),
    cap("Caso 2 · El docente no me contesta"),
    chat(lara, [
      es("Le escribí al profe hace tres días y no me contesta nada.", "audio"),
      as("¿Le escribiste por la mensajería del aula? Si pasaron más de cuarenta y ocho horas, mandame una captura del mensaje y lo derivo a SGEA."),
      n("Canal correcto, plazo cumplido y evidencia: con eso se deriva."),
    ]),
    cierre(["En fecha, al día y con correlativas.", "Regular para cursar, aprobada para aprobar.", "La renuncia no tiene vuelta atrás."], [
      n("Uno: se inscribe en fecha, al día y con correlativas.", 0),
      n("Dos: correlativa regular para cursar, aprobada para aprobar.", 1),
      n("Tres: renunciar a la regularidad no tiene vuelta atrás. Avisale antes.", 2),
    ]),
  ],
};
export default guion;
