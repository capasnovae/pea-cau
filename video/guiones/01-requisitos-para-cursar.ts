// Guion del video de «Requisitos para cursar», tal como lo aprobó la dueña (contenido/videos/01-requisitos-para-cursar.guion.md).
import type { Guion } from "./tipos.ts";

const guion: Guion = {
  titulo: "Requisitos para cursar",
  bajada: "Un caso real, paso a paso",
  estudiante: { id: "sofia", nombre: "Sofía", detalle: "Estudiante" },
  planos: [
    { tipo: "portada" },
    {
      tipo: "escena",
      lugar: "casa",
      rotulo: "Sofía, en su casa, con la tablet",
      lineas: [{ quien: "nadie", texto: "", pausa: 2.6 }],
    },
    {
      tipo: "chat",
      lineas: [
        {
          quien: "estudiante",
          modo: "escribe",
          texto: "Hola! No me llegó nada del cambio de fecha del parcial y mañana tengo que rendir. ¿Lo puedo hacer desde la tablet?",
        },
      ],
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
        { quien: "martin", modo: "escribe", texto: "Sí, Sofía, desde la tablet no hay problema…", corta: true },
        {
          quien: "narradora",
          modo: "congela",
          texto: "¡Pará, Martín! Para rendir virtual no sirve cualquier equipo. Y si el aviso no le llegó, primero hay que ver a qué correo se lo mandaron.",
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
          texto: "Hola, Sofía. Antes de seguir, dos preguntas: ¿el mail que tenés registrado es el que usás hoy? ¿Y con qué equipo pensás rendir?",
        },
        {
          quien: "estudiante",
          modo: "audio",
          texto: "Uh, cambié de mail el año pasado y creo que nunca lo actualicé. Y notebook no tengo, hago todo con la tablet.",
        },
      ],
    },
    {
      tipo: "tablero",
      titulo: "Lo que ya sabés de Sofía",
      icono: "lupa",
      tarjetas: [
        { texto: "Cambió de mail y no lo actualizó", detalle: "los avisos van a una casilla que no usa", tono: "mal", sello: "Ojo" },
        { texto: "Quiere rendir desde la tablet", detalle: "no tiene notebook", tono: "mal", sello: "No sirve" },
      ],
      lineas: [{ quien: "narradora", texto: "Con dos preguntas ya sabés dónde está el problema." }],
    },
    { tipo: "capitulo", numero: "1", texto: "El correo registrado" },
    {
      tipo: "tablero",
      titulo: "El correo registrado es el canal oficial",
      icono: "correo",
      tarjetas: [
        { texto: "Todos los avisos van al correo registrado", tono: "neutro", marca: 0 },
        { texto: "Mantenerlo actualizado le toca al estudiante", tono: "aviso", marca: 1, sello: "Responsabilidad suya" },
        { texto: "Si cambió de mail: que lo actualice en sus datos", detalle: "y que revise la casilla registrada", tono: "ok", marca: 2 },
      ],
      lineas: [
        { quien: "narradora", marca: 0, texto: "Todas las notificaciones de la Universidad llegan al correo que la persona registró." },
        { quien: "narradora", marca: 1, texto: "Mantenerlo actualizado es responsabilidad suya." },
        {
          quien: "narradora",
          marca: 2,
          texto: "Si cambió de mail y no lo actualizó, los avisos le siguen llegando a una casilla que no usa. Por eso, que lo actualice en sus datos y revise la casilla registrada.",
        },
      ],
    },
    { tipo: "capitulo", numero: "2", texto: "El equipo para rendir" },
    {
      tipo: "lista",
      titulo: "El equipo para rendir virtual",
      icono: "notebook",
      items: [
        "Una notebook",
        "Con cámara y micrófono",
        "Windows 10 o superior, o Mac Monterrey 12.6.3 o superior",
        "Procesador i3 o superior, 64 bits y 4 GB de RAM",
        "Conexión a Internet",
      ],
      lineas: [
        { quien: "narradora", marca: 0, texto: "Para rendir exámenes virtuales hace falta una notebook." },
        { quien: "narradora", marca: 1, texto: "Con cámara y micrófono." },
        { quien: "narradora", marca: 2, texto: "Con Windows 10 o superior, o Mac Monterrey 12.6.3 o superior." },
        { quien: "narradora", marca: 3, texto: "Con procesador i3 o superior, de 64 bits y 4 GB de RAM." },
        { quien: "narradora", marca: 4, texto: "Y con conexión a Internet." },
        { quien: "narradora", texto: "Tiene que cumplir todo, no solo una parte: la tablet o el celular no sirven." },
      ],
    },
    { tipo: "capitulo", numero: "3", texto: "Sin Internet, se informa" },
    {
      tipo: "tablero",
      titulo: "Sin Internet, se informa",
      icono: "wifi",
      numeradas: true,
      tarjetas: [
        { texto: "La conexión a Internet es requisito para cursar", tono: "neutro" },
        { texto: "Si no la tiene, lo informa a la Universidad", tono: "aviso", marca: 0 },
        { texto: "La Universidad evalúa si puede admitirlo o seguir cursando", detalle: "el CAU no lo da por resuelto", tono: "ok", marca: 1, sello: "Decide la Universidad" },
      ],
      lineas: [
        { quien: "narradora", texto: "La conexión a Internet es requisito para cursar." },
        { quien: "narradora", marca: 0, texto: "Si alguien no la tiene, tiene que informarlo a la Universidad," },
        {
          quien: "narradora",
          marca: 1,
          texto: "que evalúa si puede admitirlo o si puede seguir cursando. No es algo que el CAU pueda dar por resuelto.",
        },
      ],
    },
    {
      tipo: "tablero",
      titulo: "Ojo con esto",
      icono: "alerta",
      tarjetas: [
        { texto: "Sin sanciones académicas o administrativas", detalle: "para seguir cursando", tono: "aviso", marca: 0 },
        { texto: "Expulsión en otra universidad o instituto oficial", detalle: "inhabilita para cursar, salvo resolución del Rectorado", tono: "mal", marca: 1, sello: "Inhabilita" },
        { texto: "Ambo o chaquetilla", detalle: "obligatorio en las carreras que lo piden; lo compra cada estudiante", tono: "neutro", marca: 2, sello: "Obligatorio" },
      ],
      lineas: [
        { quien: "narradora", marca: 0, texto: "Seguir cursando depende de no tener sanciones académicas o administrativas." },
        {
          quien: "narradora",
          marca: 1,
          texto: "Una expulsión en otra universidad o instituto oficial inhabilita para cursar, salvo resolución del Rectorado.",
        },
        {
          quien: "narradora",
          marca: 2,
          texto: "Y en las carreras que lo piden, el ambo o la chaquetilla es obligatorio y lo compra cada estudiante.",
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
          texto: "Los avisos llegan al correo que tenés registrado: revisá esa casilla y actualizá tu mail en tus datos. El virtual no lo podés rendir desde la tablet: necesitás una notebook con cámara, micrófono y Windows 10 o superior (o Mac Monterrey 12.6.3 o superior). Si no, podés venir a rendir al CAU en nuestro horario de atención.",
        },
        { quien: "estudiante", modo: "audio", texto: "Ahí reviso el mail viejo y lo actualizo. ¡Gracias, Martín!" },
      ],
    },
    {
      tipo: "cierre",
      items: ["Los avisos, al correo registrado.", "El virtual, con una notebook que cumpla los requisitos."],
      lineas: [
        { quien: "narradora", marca: 0, texto: "Los avisos, al correo registrado." },
        { quien: "narradora", marca: 1, texto: "El virtual, con una notebook que cumpla los requisitos." },
        { quien: "narradora", marca: 2, texto: "Ahora probá vos con los casos que siguen." },
      ],
    },
  ],
};

export default guion;
