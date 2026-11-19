// Video del módulo 8 · Becas y beneficios (contenido/videos/modulos/08-becas-y-beneficios.guion.md).
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const flor = persona("Flor", "Estudiante", 0);
const ines = persona("Inés", "Último año", 1);

const guion: Guion = {
  titulo: "Becas y beneficios",
  bajada: "Módulo 8 · Aranceles, becas y pagos",
  tipo: "módulo",
  estudiante: flor,
  planos: [
    ...apertura("Bajan el arancel, con reglas", ["La regla de oro", "Las becas", "Los beneficios"],
      "Becas y beneficios bajan el arancel, pero tienen reglas distintas. La primera de todas: no se suman."),
    cap("La regla de oro", "1"),
    tab("La regla de oro", "alerta", [
      t("Beca + beneficio", "mal", 0, "se aplica el que más conviene", "No se suman"),
      t("Un semestre, no retroactivos", "neutro", 0),
    ], [n("Una beca y un beneficio no se acumulan: se aplica el que más le conviene. Las dos cosas duran un semestre y no son retroactivas.", 0)]),
    cap("Cómo se pide una beca", "2"),
    tab("Cómo se pide una beca", "check", [
      t("Formulario de La Nube", "neutro", 0, "el ticket se crea solo"),
      t("Incompleta: se cierra", "aviso", 0, "y la pide de nuevo"),
      t("Completa: a Becas", "ok", 0, "sin tocar el formulario"),
    ], [n("La beca se pide con el formulario de La Nube y el ticket se crea solo. Si la postulación llega incompleta, se cierra y la pide de nuevo. Si está completa, la derivás a Becas sin tocar el formulario.", 0)]),
    cap("Las becas", "3"),
    tab("Las becas", "estrella", [
      t("Ayuda económica: 50 % o 70 %", "neutro", 0, "promedio 8, 2 aprobadas y vulnerabilidad"),
      t("Mejor promedio 50 %; alto rendimiento 30 %", "neutro", 1, "las dos con 8 o más"),
      t("Horas de retribución", "aviso", 2, "10, 8 o 4 por semana"),
    ], [
      n("Las de ayuda económica, del cincuenta o del setenta por ciento, piden promedio ocho, dos materias aprobadas y una situación de vulnerabilidad comprobable.", 0),
      n("Mejor promedio da cincuenta por ciento y alto rendimiento, treinta; las dos con ocho o más.", 1),
      n("Y las becas tienen horas de retribución: diez por semana con el setenta, ocho con el cincuenta y cuatro con el treinta.", 2),
    ]),
    cap("Los beneficios", "4"),
    tab("Los beneficios", "check", [
      t("Familiar", "neutro", 0, "con la documentación del vínculo"),
      t("Segunda carrera y empresa amiga", "neutro", 0, "a Becas, 3 días hábiles"),
      t("Persistencia: 30 %", "ok", 1, "promedio 8, 1 o 2 materias por cursar", "Una sola vez"),
    ], [
      n("Familiar, con la documentación del vínculo. Segunda carrera, solo para legajos de la Universidad. Empresa amiga, con el recibo de sueldo. Revisás el SGU, juntás la documentación y derivás a Becas, que tarda tres días hábiles.", 0),
      n("Y cerca del final está el beneficio de persistencia: treinta por ciento del arancel, con promedio ocho y una o dos materias por cursar, una sola vez. Lo pide el estudiante en el Portal; derivás solo si cumple y el Portal falla.", 1),
    ]),
    cap("Caso 1 · Tengo beca y beneficio"),
    chat(flor, [
      es("Tengo el beneficio familiar y me salió la beca de mejor promedio. ¿Se me suman?"),
      as("No se suman: se aplica el que más te conviene, y Becas te confirma cuál queda."),
      n("Nunca las dos juntas."),
    ]),
    cap("Caso 2 · Me falta una sola materia"),
    chat(ines, [
      es("Me queda una materia para recibirme y tengo promedio nueve. ¿Hay algún descuento?", "audio"),
      as("Sí, el beneficio de persistencia: treinta por ciento del arancel, una sola vez. Lo pedís vos desde el Portal. Si el Portal te da error, avisame y lo derivo."),
    ]),
    cierre(["Beca y beneficio no se suman.", "Completa: a Becas sin tocarla.", "Persistencia: 30 %, una vez."], [
      n("Uno: beca y beneficio no se suman.", 0),
      n("Dos: la beca se pide por formulario, y completa se deriva sin tocarla.", 1),
      n("Tres: persistencia, treinta por ciento, una sola vez, desde el Portal.", 2),
    ]),
  ],
};
export default guion;
