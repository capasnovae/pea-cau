// Guion del video de «Cambio de modalidad», tal como lo aprobó la dueña (contenido/videos/05-cambio-de-modalidad.guion.md).
// Cada plano es lo que se ve; cada línea es lo que se dice. La duración sale del audio.
import type { Guion } from "./tipos.ts";

const guion: Guion = {
  titulo: "Cambio de modalidad",
  bajada: "Un caso real, paso a paso",
  musica: "suave",
  estudiante: { id: "lucia", nombre: "Lucía", detalle: "Estudiante · ED" },
  planos: [
    { tipo: "portada" },
    {
      tipo: "escena",
      lugar: "colectivo",
      rotulo: "Lucía, estudiante de ED, va al trabajo",
      lineas: [{ quien: "nadie", texto: "", pausa: 2.6 }],
    },
    {
      tipo: "chat",
      lineas: [
        {
          quien: "estudiante",
          modo: "escribe",
          texto: "Hola! Curso ED pero con el trabajo no llego a cumplir la asistencia en el CAU. Me quiero pasar a EDH. ¿Se puede? ¿Cómo hago?",
        },
      ],
    },
    {
      tipo: "nota",
      texto: "Lucía está cursando 2 materias y el jueves rinde un final.",
      detalle: "Ella no lo menciona.",
      lineas: [{ quien: "nadie", texto: "", pausa: 3.4 }],
    },
    {
      tipo: "escena",
      lugar: "cau",
      rotulo: "Martín, asesor del CAU, recibe el mensaje",
      lineas: [{ quien: "nadie", texto: "", pausa: 2.4 }],
    },
    {
      tipo: "chat",
      sigue: true,
      lineas: [
        { quien: "martin", modo: "escribe", texto: "Sí, Lucía, ya lo pido por interno y listo…", corta: true },
        {
          quien: "narradora",
          modo: "congela",
          texto: "¡Pará, Martín! Si pedís el pase ahora, a Lucía se le puede complicar con el final del jueves y con las materias que está cursando. Antes de pedir un cambio de modalidad, hay que revisar cómo está.",
        },
      ],
    },
    {
      tipo: "chat",
      sigue: true,
      borra: true,
      lineas: [
        {
          quien: "martin",
          modo: "escribe",
          texto: "Hola, Lucía. Antes de decirte cómo seguir, voy a hacer un chequeo de tus materias, porque si tenés materias cursando se pierden, y con un final anotado todavía no se puede pedir el pase.",
        },
        {
          quien: "estudiante",
          modo: "audio",
          texto: "Sí, el jueves rindo un final, como Libre por Nota. Tengo cuatro aprobadas, una regular y las dos que estoy cursando ahora. Y el Seminario de Práctica lo regularicé el año pasado.",
        },
      ],
    },
    {
      tipo: "tablero",
      titulo: "Chequeo académico de Lucía",
      icono: "lupa",
      tarjetas: [
        { texto: "4 materias aprobadas", tono: "ok" },
        { texto: "1 materia regular", tono: "ok" },
        { texto: "2 materias cursando", tono: "aviso" },
        { texto: "Seminario de Práctica regular", tono: "ok" },
        { texto: "Final Libre por Nota anotado", detalle: "el jueves", tono: "mal" },
      ],
      lineas: [{ quien: "narradora", texto: "Con solo un chequeo académico ya sabés casi todo." }],
    },
    { tipo: "capitulo", numero: "1", texto: "Antes de pedirlo, que esté en regla" },
    {
      tipo: "lista",
      titulo: "Antes de pedirlo, que esté en regla",
      icono: "check",
      items: [
        "En las fechas del calendario de trámites",
        "Condiciones de ingreso de la nueva modalidad",
        "Libre deuda",
        "Legajo completo",
        "Sin mesa de final anotada ni nota pendiente de carga",
      ],
      lineas: [
        { quien: "narradora", texto: "Para pedir el pase, tienen que cumplirse cinco cosas." },
        {
          quien: "narradora",
          marca: 0,
          texto: "Uno: que sea en las fechas del calendario de trámites. Las fechas cambian según la modalidad de origen, y fuera de esa ventana no se puede.",
        },
        { quien: "narradora", marca: 1, texto: "Dos: que cumpla las condiciones de ingreso de la nueva modalidad." },
        { quien: "narradora", marca: 2, texto: "Tres: libre deuda." },
        { quien: "narradora", marca: 3, texto: "Cuatro: legajo completo." },
        {
          quien: "narradora",
          marca: 4,
          texto: "Y cinco: no estar anotada a una mesa de final ni tener una nota de final pendiente de carga.",
        },
      ],
    },
    {
      tipo: "tablero",
      titulo: "El final del jueves",
      icono: "calendario",
      numeradas: true,
      tarjetas: [
        { texto: "Rinde el final", detalle: "o se da de baja de la mesa", tono: "neutro", marca: 0 },
        { texto: "Espera que carguen la nota", tono: "neutro", marca: 0 },
        { texto: "Avisa al CAU", detalle: "y el CAU pide el pase por interno", tono: "ok", marca: 0 },
        { texto: "No hace falta tener materias aprobadas", tono: "aviso", marca: 1 },
      ],
      lineas: [
        { quien: "narradora", texto: "Lucía está anotada al final del jueves." },
        {
          quien: "narradora",
          marca: 0,
          texto: "Entonces, primero rinde (o se da de baja de esa mesa), espera que carguen la nota, y recién después le avisa al CAU para que pida el pase.",
        },
        { quien: "narradora", marca: 1, texto: "Ah, y no hace falta tener materias aprobadas." },
      ],
    },
    { tipo: "capitulo", numero: "2", texto: "Qué pasa con cada materia" },
    {
      tipo: "tablero",
      titulo: "Qué pasa con cada materia",
      columnas: ["Se conserva", "Se recursa"],
      tarjetas: [
        { texto: "4 aprobadas", detalle: "siguen aprobadas", tono: "ok", columna: 0, marca: 0 },
        { texto: "1 regular", detalle: "la rinde con las reglas de EDH", tono: "ok", columna: 0, marca: 1 },
        { texto: "2 cursando", detalle: "quedan Libre por Pase", tono: "mal", columna: 1, marca: 2 },
        { texto: "Libre por Nota", detalle: "también se recursa", tono: "mal", columna: 1, marca: 3 },
      ],
      lineas: [
        { quien: "narradora", texto: "La regla es simple: lo que ya ganó, lo conserva." },
        { quien: "narradora", marca: 0, texto: "Las cuatro aprobadas siguen aprobadas." },
        { quien: "narradora", marca: 1, texto: "La regular sigue regular, pero la va a rendir con las reglas de evaluación de EDH." },
        {
          quien: "narradora",
          marca: 2,
          texto: "Lo que está en curso, en cambio, se pierde: las dos que está cursando quedan «Libre por Pase» y las tiene que recursar.",
        },
        {
          quien: "narradora",
          marca: 3,
          texto: "Lo mismo pasa con las que estén «Libre por Nota»: por eso le conviene rendir el jueves antes del pase.",
        },
        { quien: "narradora", texto: "Por eso conviene que, antes de pedir el pase, Lucía sepa cómo le quedarían sus materias." },
      ],
    },
    { tipo: "capitulo", numero: "3", texto: "La excepción del Seminario" },
    {
      tipo: "tablero",
      titulo: "La excepción",
      icono: "estrella",
      tarjetas: [
        { texto: "Seminario de Práctica", detalle: "en casi todos los pases pierde su condición", tono: "aviso" },
        { texto: "Entre ED y EDH, si está regular, la conserva", detalle: "Lucía no lo pierde", tono: "ok", marca: 0 },
        { texto: "Seminario Final regular", detalle: "se mantiene en cualquier pase", tono: "ok", marca: 1 },
      ],
      lineas: [
        { quien: "narradora", texto: "En casi todos los pases, el Seminario de Práctica pierde su condición." },
        {
          quien: "narradora",
          marca: 0,
          texto: "Pero hay una excepción, y justo es el pase más común del CAU: entre ED y EDH, si está regular, conserva la regularidad. Lucía no lo pierde.",
        },
        { quien: "narradora", marca: 1, texto: "Y el Seminario Final regular se mantiene siempre, en cualquier pase." },
      ],
    },
    {
      tipo: "tablero",
      titulo: "Ojo con el caso al revés",
      icono: "alerta",
      tarjetas: [
        { texto: "Pase a EDH", detalle: "a Lucía esto no le toca", tono: "ok" },
        { texto: "Pase a ED o cambio de CAU", detalle: "contactar al CAU de destino antes", tono: "aviso", marca: 0 },
        { texto: "No todos los CAU ofrecen todas las carreras ni todas las materias", tono: "neutro", marca: 0 },
      ],
      lineas: [
        { quien: "narradora", texto: "A Lucía esto no le toca, porque se va a EDH." },
        {
          quien: "narradora",
          marca: 0,
          texto: "Pero si te llega el caso al revés, alguien que pasa a ED o que cambia de CAU, que no se vaya sin confirmar su lugar: en esos casos es responsabilidad del estudiante contactar al CAU de destino, porque no todos los CAU ofrecen todas las carreras ni todas las materias.",
        },
      ],
    },
    { tipo: "capitulo", texto: "Ahora sí, la respuesta" },
    {
      tipo: "chat",
      sigue: true,
      lineas: [
        {
          quien: "martin",
          modo: "escribe",
          texto: "Sí se puede, pero todavía no. Primero rendí el final del jueves (o date de baja de esa mesa) y esperá que carguen la nota. Las 2 materias que estás cursando te quedarían Libre por Pase; las aprobadas, la regular y el Seminario de Práctica los conservás. Cuando tengas la nota cargada, avisanos y lo pedimos por interno, dentro de las fechas del calendario de trámites.",
        },
        { quien: "estudiante", modo: "audio", texto: "Buenísimo, entonces rindo el jueves y después les aviso. ¡Gracias, Martín!" },
      ],
    },
    {
      tipo: "cierre",
      items: ["Primero, sin finales pendientes.", "Después, el pase.", "Y siempre, en fecha."],
      lineas: [
        { quien: "narradora", marca: 0, texto: "Primero, sin finales pendientes." },
        { quien: "narradora", marca: 1, texto: "Después, el pase." },
        { quien: "narradora", marca: 2, texto: "Y siempre, en fecha." },
        { quien: "narradora", marca: 3, texto: "Ahora probá vos con los casos que siguen." },
      ],
    },
  ],
};

export default guion;
