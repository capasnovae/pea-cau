// Video del módulo 13 · Normas (contenido/videos/modulos/13-normas.guion.md).
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const micaela = persona("Micaela", "Estudiante de ED", 0);

const guion: Guion = {
  titulo: "Normas",
  bajada: "Módulo 13 · Normas y acompañamiento",
  tipo: "módulo",
  estudiante: micaela,
  planos: [
    ...apertura("Explicar sin adelantar nada", ["Faltas y consecuencias", "Plazos", "Descargo y recursos"],
      "Cuando un examen se audita y aparece una irregularidad, hay un procedimiento con plazos fijos. Tu trabajo es explicarlo bien y no adelantar nada."),
    cap("Las faltas", "1"),
    tab("Las faltas y sus consecuencias", "alerta", [
      t("Leve: llamado de atención", "neutro", 0, "0 en la actividad, sin registro"),
      t("Grave: apercibimiento", "mal", 1, "materia libre y registro en el legajo", "Libre"),
      t("Suspensión", "mal", 2, "6 o 12 meses sin cursar ni rendir"),
      t("Copia de TP", "aviso", 3, "menos del 50 % leve; más, grave"),
    ], [
      n("Una falta leve es un llamado de atención y un cero en la actividad: no queda libre y no va al analítico.", 0),
      n("Desde el apercibimiento, que es falta grave, queda libre en la materia y se registra en el legajo.", 1),
      n("La suspensión, además, le impide cursar y rendir por seis o doce meses.", 2),
      n("Y copiar un TP: menos del cincuenta por ciento, leve; más del cincuenta, grave y materia libre.", 3),
    ]),
    cap("Los plazos", "2"),
    tab("Los plazos", "calendario", [
      t("10 días hábiles de auditoría", "neutro", 0),
      t("7 días hábiles para notificar", "neutro", 0, "al correo registrado"),
      t("Mientras tanto", "aviso", 1, "que espere la notificación", "No se deriva"),
    ], [
      n("Después del examen, la Universidad tiene diez días hábiles para auditarlo, y siete más para notificar al correo registrado.", 0),
      n("Mientras corren esos plazos, si consulta por un cambio de nota, no se deriva: que espere la notificación.", 1),
    ]),
    cap("Descargo y recursos", "3"),
    tab("Descargo y recursos", "check", [
      t("Descargo: 5 días hábiles", "aviso", 0, "la única instancia para ofrecer prueba"),
      t("Reconsideración", "neutro", 1),
      t("Jerárquico", "neutro", 1, "no se ofrece de entrada"),
    ], [
      n("Con la notificación, tiene cinco días hábiles para presentar su descargo, por el medio que indica la notificación. Es la única instancia para ofrecer prueba.", 0),
      n("Si no está de acuerdo con la respuesta, puede presentar la reconsideración y, después, el recurso jerárquico. El jerárquico no se ofrece de entrada.", 1),
    ]),
    cap("Caso · Tengo un cero"),
    chat(micaela, [
      es("Tengo un cero en el parcial que rendí hace tres días y no me llegó nada. Quiero reclamar ya.", "audio"),
      as("Micaela, la Universidad tiene diez días hábiles para auditar el examen y siete más para notificarte al correo registrado. Rendiste hace tres días, así que todavía corre el plazo. Si te notifican, vas a tener cinco días hábiles para presentar tu descargo."),
      n("Se deriva solo si pasó el plazo y no hay ninguna notificación."),
    ]),
    cierre(["Leve: 0 sin registro. Grave: libre.", "10 + 7 días hábiles.", "Descargo en 5, con prueba."], [
      n("Uno: leve, cero sin registro; grave, cero, libre y registro.", 0),
      n("Dos: diez días hábiles de auditoría y siete para notificar.", 1),
      n("Tres: descargo en cinco días hábiles, la única vez que puede presentar prueba.", 2),
    ]),
  ],
};
export default guion;
