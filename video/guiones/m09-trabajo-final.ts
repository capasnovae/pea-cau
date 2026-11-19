// Video del módulo 9 · Trabajo final (contenido/videos/modulos/09-trabajo-final.guion.md).
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const paula = persona("Paula", "Seminario Final", 0);
const cecilia = persona("Cecilia", "CAE aprobada", 1);

const guion: Guion = {
  titulo: "Trabajo final",
  bajada: "Módulo 9 · Egreso",
  tipo: "módulo",
  estudiante: paula,
  planos: [
    ...apertura("Tres paradas hasta el final", ["Seminario Final", "La CAE", "La Defensa Oral"],
      "El tramo final de la carrera de grado tiene tres paradas: el Seminario Final, la evaluación de la CAE y la Defensa Oral. En pregrado, en cambio, se cierra con Integración Profesional, Estudio del Caso."),
    cap("Seminario Final", "1"),
    tab("Seminario Final", "check", [
      t("Un cuatrimestre", "neutro", 0, "la temática no se cambia", "Temática fija"),
      t("2 de 3 entregas + la 4", "aviso", 0, "con 50 % o más"),
      t("10 días corridos para corregir", "neutro", 0, "en «Cursando», consultas a TFG"),
      t("Citas con APA", "mal", 1, "sin APA, es plagio"),
    ], [
      n("Dura un cuatrimestre. Elige una temática y no la puede cambiar. Tiene cuatro entregas: regulariza con dos de las tres primeras y la cuarta, con cincuenta por ciento o más. El docente tiene diez días corridos para corregir. Mientras la materia figura «Cursando», las consultas se derivan a TFG.", 0),
      n("Y un detalle que importa: sin citas en formato APA, es plagio.", 1),
    ]),
    cap("La CAE", "2"),
    tab("La CAE", "calendario", [
      t("Hasta 60 días corridos", "neutro", 0, "primera devolución en 15"),
      t("Si pide ajustes", "aviso", 0, "acta rúbrica con el plazo"),
      t("CAE aprobada", "ok", 0, "habilita a pedir la defensa"),
    ], [n("Cuando el Seminario Final queda regular, una Comisión Académica Evaluadora revisa el trabajo. Tiene hasta sesenta días corridos, con una primera devolución en los primeros quince. Si pide ajustes, manda un acta rúbrica con el plazo. Con la CAE aprobada, puede pedir la Defensa Oral.", 0)]),
    cap("La Defensa Oral", "3"),
    tab("La Defensa Oral", "estrella", [
      t("CAE + visado + EFIP II", "neutro", 0, "el EFIP II, a distancia"),
      t("Se pide en 30 días", "aviso", 0),
      t("Presencial en el Campus", "neutro", 0, "virtual: exterior o privación de libertad"),
      t("60 % Seminario y CAE, 40 % Defensa", "ok", 1, "nota en hasta 5 días hábiles"),
    ], [
      n("Para pedirla necesita la CAE aprobada, el visado y, a distancia, el EFIP II aprobado. La pide dentro de los treinta días de la aprobación. Se rinde en forma presencial en el Campus; la modalidad virtual es solo para quien vive en el exterior o está privado de la libertad.", 0),
      n("La nota final pesa sesenta por ciento el Seminario con la CAE, y cuarenta la Defensa. La nota puede tardar hasta cinco días hábiles en cargarse.", 1),
    ]),
    cap("La extensión de regularidad", "4"),
    tab("La extensión de regularidad", "alerta", [
      t("Con aprobación del Director", "aviso", 0, "y el plazo autorizado", "Solo con el Director"),
      t("Para el EFIP II", "mal", 0, "nunca"),
    ], [n("Extender la regularidad del Seminario Final solo se gestiona con la aprobación del Director de Carrera y el plazo autorizado. Nunca para rendir el EFIP II.", 0)]),
    cap("Caso 1 · Quiero cambiar de tema"),
    chat(paula, [
      es("Me desaprobaron la entrega 2 y quiero cambiar de tema."),
      as("Paula, la temática no se puede cambiar. Todavía podés regularizar si aprobás la entrega 1 o la 3, y la 4, con cincuenta por ciento o más."),
    ]),
    cap("Caso 2 · ¿La defensa por Zoom?"),
    chat(cecilia, [
      es("Me aprobaron la CAE y vivo en Mendoza. ¿Puedo hacer la defensa por Zoom?", "audio"),
      as("Cecilia, la defensa es presencial en el Campus. La virtual es solo para quien vive en el exterior o está privado de la libertad. Pedí la mesa dentro de los treinta días desde que te aprobaron."),
      n("Vivir lejos no habilita la defensa virtual."),
    ]),
    cierre(["La temática no se cambia.", "CAE en 60 días; defensa en 30.", "Defensa presencial."], [
      n("Uno: la temática del Seminario Final no se cambia.", 0),
      n("Dos: la CAE tiene hasta sesenta días, y con la CAE aprobada se pide la defensa en treinta.", 1),
      n("Tres: la Defensa Oral es presencial, salvo exterior o privación de la libertad.", 2),
    ]),
  ],
};
export default guion;
