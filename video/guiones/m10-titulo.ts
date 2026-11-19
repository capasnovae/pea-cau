// Video del módulo 10 · Título y colación (contenido/videos/modulos/10-titulo-y-colacion.guion.md). Solo título.
import type { Guion } from "./tipos.ts";
import { apertura, as, cap, chat, cierre, es, n, persona, t, tab } from "./ayuda.ts";

const marina = persona("Marina", "Egresada", 0);
const helena = persona("Helena", "Estudiante", 1);

const guion: Guion = {
  titulo: "Título",
  bajada: "Módulo 10 · Egreso",
  tipo: "módulo",
  estudiante: marina,
  planos: [
    ...apertura("La consulta más esperada", ["Cómo arranca el título", "Qué decir mientras tanto", "Envío, intermedio y firma digital"],
      "El estudiante egresó y quiere su título. Es la consulta más esperada y la que más ansiedad genera. Lo importante es saber qué decir y dónde mirarlo."),
    cap("Cómo arranca", "1"),
    tab("Cómo arranca", "calendario", [
      t("Egresado + documentación completa", "neutro", 0, "arranca solo a los 15 días hábiles"),
      t("Unos 120 días", "aviso", 0, "y tiene una tasa"),
      t("Visado: check por legajo", "neutro", 1, "72 horas y después, Operación Títulos"),
    ], [
      n("Con el estado Egresado y la documentación completa, el trámite arranca solo a los quince días hábiles y tarda unos ciento veinte días. Tiene una tasa.", 0),
      n("Antes está el visado: el check es por legajo. Si no aparece, esperás setenta y dos horas y después cargás el ticket a Operación Títulos.", 1),
    ]),
    cap("Qué decir mientras tanto", "2"),
    tab("Qué decir mientras tanto", "lupa", [
      t("«Está en proceso»", "ok", 0, "sin comprometer plazos", "En proceso"),
      t("El detalle, después de SIDCer", "aviso", 0, "si no coinciden, vale SIDCer"),
    ], [n("Mientras tanto, decí que está en proceso, sin comprometer plazos. El detalle se da solo si ya miraste SIDCer, con el DNI. El trámite pasa por validación, legalización y despacho; si los sistemas no coinciden, vale SIDCer.", 0)]),
    cap("Envío, retiro y duplicados", "3"),
    tab("Envío, retiro y duplicados", "correo", [
      t("SIDCer finalizado y SGU disponible", "neutro", 0, "más de 72 h: ticket a Correo"),
      t("Córdoba: turno o tercero", "neutro", 1, "otros CAU: envío al CAU del legajo"),
      t("Duplicado o rectificación", "neutro", 2, "Operación Títulos, con arancel"),
    ], [
      n("Para enviarlo, SIDCer tiene que figurar finalizado y el SGU «Disponible para Retirar/Enviar». Con más de setenta y dos horas, va el ticket a Correo con el legajo y el código del CAU.", 0),
      n("En Córdoba se retira con turno o por un tercero autorizado. En otros CAU, se envía al CAU del legajo.", 1),
      n("Un duplicado o una rectificación van a Operación Títulos, con el motivo, el documento y el arancel vigente.", 2),
    ]),
    cap("Intermedio y firma digital", "4"),
    tab("Título intermedio y firma digital", "check", [
      t("Intermedio: lo pide el estudiante", "neutro", 0, "materias, EFIP I, tasa y legajo"),
      t("Firma digital: vale en digital", "ok", 1, "impresa deja de ser original", "Solo digital"),
      t("Finalizado y no le llegó", "neutro", 1, "lo reenviás vos, sin derivar"),
    ], [
      n("El título intermedio lo pide el estudiante si cumple lo exigido: las materias del primero al sexto semestre con Inglés, el EFIP I si es a distancia, la tasa y el legajo completo. Va a Operación Títulos.", 0),
      n("Los documentos con firma digital se comparten por medios digitales todas las veces que haga falta. Impresos, dejan de valer como original. Si un trámite figura finalizado y no le llegó, lo reenviás vos desde la plataforma, sin derivar.", 1),
    ]),
    cap("Caso 1 · ¿Cuándo me dan el título?"),
    chat(marina, [
      es("Me recibí hace un mes. ¿Cuándo me dan el título?"),
      as("Felicitaciones. Tu título está en proceso. El trámite tarda en promedio unos ciento veinte días; apenas esté para enviar, te avisamos."),
      n("En proceso, sin prometer una fecha."),
    ]),
    cap("Caso 2 · Me lo piden impreso"),
    chat(helena, [
      es("En el trabajo me piden el certificado impreso y firmado, y además nunca me llegó.", "audio"),
      as("Te lo reenvío ahora desde la plataforma. Vale como original en formato digital: mandáselo así, que pueden verificar la firma online. Impreso deja de valer como original."),
    ]),
    cierre(["Arranca solo: unos 120 días.", "«En proceso», sin plazos.", "Firma digital: vale en digital."], [
      n("Uno: el título arranca solo y tarda unos ciento veinte días.", 0),
      n("Dos: decí «en proceso», sin plazos, y el detalle solo después de mirar SIDCer.", 1),
      n("Tres: la firma digital vale en digital; impresa, no.", 2),
    ]),
  ],
};
export default guion;
