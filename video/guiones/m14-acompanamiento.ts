// Video del módulo 14 · Acompañamiento (contenido/videos/modulos/14-acompanamiento.guion.md).
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const camila = persona("Camila", "Estudiante de EDH", 0);
const abril = persona("Abril", "Estudiante de ED", 1);

const guion: Guion = {
  titulo: "Acompañamiento",
  bajada: "Módulo 14 · Normas y acompañamiento",
  tipo: "módulo",
  estudiante: camila,
  planos: [
    ...apertura("No todo es trámite", ["Gabinete de Bienestar", "Accesibilidad"],
      "No todo es trámite. Hay estudiantes que necesitan apoyo emocional o ajustes para estudiar en igualdad de condiciones. Saber a dónde derivar hace la diferencia."),
    cap("Gabinete de Bienestar", "1"),
    tab("Gabinete de Bienestar", "estrella", [
      t("Psicólogos para todas las modalidades", "neutro", 0),
      t("Encuentro individual desde La Nube", "ok", 0),
      t("Ciclos para el EFIP y la Defensa", "neutro", 0),
    ], [n("El Gabinete de Bienestar tiene psicólogos para estudiantes de todas las modalidades. El encuentro individual se pide desde La Nube. También arma ciclos para preparar el EFIP y la Defensa Oral, con herramientas de estudio y emocionales.", 0)]),
    cap("Accesibilidad", "2"),
    tab("Accesibilidad", "check", [
      t("CUD o certificado en Digital Admin", "neutro", 0),
      t("Primera vez: Accesibilidad", "ok", 0, "contacto en 72 horas hábiles"),
      t("Con el check: Sistema Q", "neutro", 0, "por cada examen"),
      t("Hasta el doble de tiempo", "ok", 1, "nunca se recortan contenidos", "Hasta 100 %"),
    ], [
      n("Para pedir ajustes por discapacidad, primero carga el CUD o un certificado en Digital Admin. La primera vez se deriva a Accesibilidad, que lo contacta en setenta y dos horas hábiles. Si ya tiene el check de discapacidad, cada examen con más tiempo se pide por Sistema Q.", 0),
      n("Los ajustes incluyen hasta el doble de tiempo, lectores de pantalla, intérprete de lengua de señas y otros apoyos. Lo que nunca se hace es recortar contenidos.", 1),
    ]),
    cap("Caso 1 · Necesito más tiempo"),
    chat(camila, [
      es("Tengo una discapacidad visual y necesito más tiempo en los exámenes. Nunca lo pedí."),
      as("Camila, primero cargá tu CUD o certificado en Digital Admin, en un solo PDF. Como es la primera vez, lo derivo a Accesibilidad y te contactan en setenta y dos horas hábiles. Después, cada examen con más tiempo lo pedimos por Sistema Q."),
    ]),
    cap("Caso 2 · Estoy muy angustiada"),
    chat(abril, [
      es("Estoy muy angustiada con los finales, no me puedo concentrar.", "audio"),
      as("Gracias por contarlo. Podés pedir un encuentro individual con el Gabinete de Bienestar desde La Nube: hay psicólogos que acompañan justo en estos momentos."),
      n("Escuchar primero, y después mostrar el camino."),
    ]),
    cierre(["Bienestar: desde La Nube.", "CUD en Digital Admin; después, Sistema Q.", "Nunca se recortan contenidos."], [
      n("Uno: el Gabinete de Bienestar se pide desde La Nube.", 0),
      n("Dos: CUD en Digital Admin; la primera vez, Accesibilidad; después, Sistema Q por examen.", 1),
      n("Tres: los ajustes nunca recortan contenidos.", 2),
    ]),
  ],
};
export default guion;
