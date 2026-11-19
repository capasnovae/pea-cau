// Video del módulo 11 · Portal y aula (contenido/videos/modulos/11-portal-y-aula.guion.md).
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const emilia = persona("Emilia", "Estudiante de EDH", 0);
const martina = persona("Martina", "Estudiante de ED", 1);

const guion: Guion = {
  titulo: "Portal y aula",
  bajada: "Módulo 11 · Plataformas",
  tipo: "módulo",
  estudiante: emilia,
  planos: [
    ...apertura("Las plataformas del estudiante", ["Portal y Canvas", "Problemas de acceso y materias", "Notas de TP y biblioteca"],
      "Primero recorremos las plataformas del estudiante. Después, los problemas más comunes y qué validar antes de derivar."),
    cap("Portal y aula", "1"),
    tab("Portal y aula", "notebook", [
      t("Portal: todo en un lugar", "neutro", 0, "carrera, inscripciones, pagos y simulador"),
      t("Ingresantes: datos por mail", "neutro", 0, "en hasta 48 horas hábiles"),
      t("Canvas: usuario sin dominio", "neutro", 1, "la clave llega al mail personal"),
      t("Dudas de contenido: al docente", "ok", 1, "por la mensajería del aula"),
    ], [
      n("En el Portal está todo: la carrera, las inscripciones, los pagos y el simulador de precios. Se entra con el usuario institucional; los ingresantes reciben los datos por mail, en hasta cuarenta y ocho horas hábiles.", 0),
      n("Al aula se entra con la cuenta institucional. El usuario va sin el dominio, y la clave llega al mail personal registrado. Las dudas sobre los contenidos se le preguntan al docente, por la mensajería del aula.", 1),
    ]),
    cap("No puedo entrar", "2"),
    tab("No puedo entrar", "lupa", [
      t("Correo institucional migrado", "neutro", 0),
      t("¿Una plataforma o todas?", "neutro", 0, "Klarway va a Sistema Q"),
      t("El recupero lo hace el estudiante", "aviso", 0),
      t("Si sigue: Error Plataformas", "ok", 1, "", "Captura obligatoria"),
    ], [
      n("Antes de derivar, validá tres cosas: que el correo institucional esté migrado, si falla una plataforma o todas, y si probó recuperar la contraseña. El recupero lo hace siempre el estudiante. Si ve «No tienes permiso para acceder a este recurso», se resuelve restableciendo la contraseña. Los problemas de Klarway van a Sistema Q.", 0),
      n("Si sigue sin entrar, derivás con la captura del error.", 1),
    ]),
    cap("Materias y notas", "3"),
    tab("La materia que no aparece y las notas", "alerta", [
      t("Materia que no aparece", "aviso", 0, "inscripto, cursado iniciado y 72 horas"),
      t("Derechos Reales no tiene cápsula", "neutro", 0, "queda Regular y rinde el final"),
      t("TP autocorregible", "aviso", 1, "", "Vale el último intento"),
      t("Se deriva", "neutro", 1, "si no reingresó o no sincroniza en 24 h"),
    ], [
      n("Si una materia no aparece en Canvas, verificás que esté inscripto, que el cursado haya empezado y que hayan pasado setenta y dos horas. Recién ahí se deriva. Hay materias sin contenido a propósito, como Principios Fundamentales de Derechos Reales: queda Regular y rinde el final.", 0),
      n("En los TP autocorregibles vale el último intento, aunque haya entrado solo a mirar. Se deriva si no volvió a entrar y la nota cambió, o si no se sincroniza en veinticuatro horas.", 1),
    ]),
    cap("La biblioteca", "4"),
    tab("La biblioteca", "estrella", [
      t("No entra solo a eBook21", "neutro", 0, "se pide el blanqueo"),
      t("Un libro falla", "neutro", 0, "primero, desde el proveedor"),
      t("Libre deuda de biblioteca", "ok", 0, "se genera solo con el visado"),
    ], [n("Si no entra solo a eBook21, se pide el blanqueo. Si un libro falla, primero que pruebe desde el proveedor. Si un libro no está, se pide. Y el libre deuda de biblioteca se genera solo con el visado.", 0)]),
    cap("Caso 1 · Estoy de viaje y no entro"),
    chat(emilia, [
      es("Estoy de viaje y Canvas me dice «No tienes permiso para acceder a este recurso»."),
      as("Emilia, ese mensaje aparece cuando iniciás sesión desde otro lugar. Se resuelve restableciendo tu contraseña desde el recupero."),
    ]),
    cap("Caso 2 · Me bajó la nota"),
    chat(martina, [
      es("Me saqué un nueve en el TP, entré a mirarlo y ahora tengo un seis.", "audio"),
      as("En estos TP vale el último intento, y entrar a mirarlo cuenta como uno nuevo. Podés volver a hacerlo antes del cierre para mejorar la nota."),
    ]),
    cierre(["El recupero lo hace el estudiante.", "Materia que no aparece: 72 horas.", "TP autocorregible: el último intento."], [
      n("Uno: el recupero de contraseña lo hace el estudiante.", 0),
      n("Dos: materia que no aparece, esperar setenta y dos horas.", 1),
      n("Tres: en los TP autocorregibles vale el último intento.", 2),
    ]),
  ],
};
export default guion;
