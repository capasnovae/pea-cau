// Guion del video del módulo 1 · Ingreso (contenido/videos/modulos/01-ingreso.guion.md). Sin personajes dibujados.
// El id elige un dibujo de public/peeps; en los videos sin personajes no se ve, pero tiene que existir.
import type { Guion } from "./tipos.ts";

const noelia = { id: "lucia", nombre: "Noelia", detalle: "Ingresante" };
const rosa = { id: "sofia", nombre: "Rosa", detalle: "Aspirante, 42 años" };

const guion: Guion = {
  titulo: "Ingreso",
  bajada: "Módulo 1 · Cursado y modalidades",
  estudiante: noelia,
  planos: [
    { tipo: "portada" },
    {
      tipo: "nota",
      texto: "Antes de cursar, el legajo en regla",
      detalle: "Qué se presenta, dónde se carga y los casos especiales",
      lineas: [
        {
          quien: "narradora",
          texto: "Antes de cursar, cada estudiante tiene que tener su legajo en regla y lo básico para estudiar. En este módulo vemos qué se presenta, dónde se carga y qué pasa en los casos especiales.",
        },
      ],
    },
    { tipo: "capitulo", numero: "1", texto: "Lo básico para cursar" },
    {
      tipo: "tablero",
      titulo: "Lo básico para cursar",
      icono: "notebook",
      tarjetas: [
        { texto: "Los avisos llegan al correo registrado", detalle: "actualizarlo le toca al estudiante", tono: "aviso", marca: 0, sello: "Responsabilidad suya" },
        { texto: "Para rendir virtual, una notebook", detalle: "con cámara, micrófono y el sistema mínimo", tono: "ok", marca: 1 },
        { texto: "Tablet o celular", tono: "mal", marca: 2, sello: "No sirve" },
        { texto: "Sin conexión, lo informa", detalle: "la Universidad decide cómo sigue", tono: "neutro", marca: 3 },
      ],
      lineas: [
        { quien: "narradora", marca: 0, texto: "Todos los avisos de la Universidad llegan al correo que registró el estudiante, y mantenerlo actualizado le toca a él." },
        { quien: "narradora", marca: 1, texto: "Para rendir virtual necesita una notebook con cámara, micrófono y el sistema operativo mínimo." },
        { quien: "narradora", marca: 2, texto: "Una tablet o un celular no sirven." },
        { quien: "narradora", marca: 3, texto: "Y si se queda sin conexión, lo informa a la Universidad, que decide cómo sigue." },
      ],
    },
    { tipo: "capitulo", numero: "2", texto: "La documentación obligatoria" },
    {
      tipo: "lista",
      titulo: "El legajo de grado y pregrado",
      icono: "check",
      items: ["Solicitud de inscripción firmada", "DNI vigente", "Secundario completo", "Dos fotos color de 3 × 3", "Ficha médica"],
      lineas: [
        { quien: "narradora", texto: "En grado y pregrado, el legajo lleva:" },
        { quien: "narradora", marca: 0, texto: "la solicitud de inscripción firmada," },
        { quien: "narradora", marca: 1, texto: "el DNI vigente," },
        { quien: "narradora", marca: 2, texto: "el secundario completo," },
        { quien: "narradora", marca: 3, texto: "dos fotos color de tres por tres" },
        { quien: "narradora", marca: 4, texto: "y la ficha médica." },
        { quien: "narradora", texto: "Si todavía no tiene el analítico, sirve una constancia de título en trámite que diga que no adeuda materias." },
      ],
    },
    {
      tipo: "tablero",
      titulo: "Plazo para completarlo",
      icono: "calendario",
      columnas: ["Grado", "Pregrado"],
      tarjetas: [
        { texto: "Un año y medio", tono: "neutro", columna: 0, marca: 0 },
        { texto: "Un año", tono: "neutro", columna: 1, marca: 0 },
        { texto: "Si no lo completa, no se reinscribe", tono: "mal", columna: 0, marca: 1, sello: "No se reinscribe" },
      ],
      lineas: [
        { quien: "narradora", marca: 0, texto: "En grado hay un año y medio para completar el legajo; en pregrado, un año." },
        { quien: "narradora", marca: 1, texto: "Si no lo completa, no se puede reinscribir." },
      ],
    },
    { tipo: "capitulo", numero: "3", texto: "Dónde se carga" },
    {
      tipo: "tablero",
      titulo: "Dónde se carga y qué se rechaza",
      icono: "lupa",
      numeradas: true,
      tarjetas: [
        { texto: "Se carga en Digital Admin", detalle: "se ve en Documentos Digitales en hasta 7 días hábiles", tono: "ok", marca: 0 },
        { texto: "DNI descargado de Mi Argentina", detalle: "no trae el lugar de nacimiento", tono: "mal", marca: 1, sello: "No sirve" },
        { texto: "Certificado de buena salud", detalle: "vale solo el modelo oficial de ficha médica, firmado", tono: "mal", marca: 2, sello: "No sirve" },
      ],
      lineas: [
        { quien: "narradora", marca: 0, texto: "La documentación se carga en Digital Admin. Puede tardar hasta siete días hábiles en verse en Documentos Digitales." },
        { quien: "narradora", marca: 1, texto: "El DNI de Mi Argentina no sirve, porque no trae el lugar de nacimiento." },
        {
          quien: "narradora",
          marca: 2,
          texto: "Y la ficha médica tiene que ser el modelo oficial, firmado por un profesional matriculado: un certificado de buena salud no la reemplaza.",
        },
      ],
    },
    { tipo: "capitulo", numero: "4", texto: "Casos especiales" },
    {
      tipo: "tablero",
      titulo: "Casos especiales",
      icono: "estrella",
      numeradas: true,
      tarjetas: [
        { texto: "Estudiantes extranjeros", detalle: "convalidación del secundario; residencia y DNI argentino en el primer año", tono: "neutro", marca: 0 },
        { texto: "Mayores de 25 sin secundario", detalle: "carta, DNI, CV con certificados y ciclo básico aprobado", tono: "aviso", marca: 1, sello: "Se evalúa" },
        { texto: "Universitarios 21", detalle: "aprobadas para 4.º cuatrimestre, o 5 aprobadas en el legajo", tono: "ok", marca: 2 },
      ],
      lineas: [
        {
          quien: "narradora",
          marca: 0,
          texto: "Primero, estudiantes extranjeros: el secundario del exterior se convalida, legalizado y traducido si no está en español, y durante el primer año tramita la residencia y el DNI argentino.",
        },
        {
          quien: "narradora",
          marca: 1,
          texto: "Segundo, mayores de veinticinco sin secundario: presentan una carta a la Rectora, el DNI, un CV con certificados y el analítico con el ciclo básico aprobado. La admisión no es automática: la Universidad la evalúa.",
        },
        {
          quien: "narradora",
          marca: 2,
          texto: "Tercero, Universitarios 21: sus dos materias tienen que estar aprobadas para anotarse en cuarto cuatrimestre, salvo que tenga cinco o más aprobadas en el legajo.",
        },
        { quien: "narradora", texto: "Y algunas materias troncales tienen Módulo 0: lecturas niveladoras en Canvas, disponibles un mes antes de empezar." },
      ],
    },
    { tipo: "capitulo", texto: "Caso 1 · Subí todo y no aparece" },
    {
      tipo: "chat",
      estudiante: noelia,
      lineas: [
        {
          quien: "estudiante",
          modo: "escribe",
          texto: "Subí la foto del DNI desde Mi Argentina y un certificado de buena salud hace tres días, y en Documentos Digitales no aparece nada.",
        },
        {
          quien: "martin",
          modo: "escribe",
          texto: "Hola, Noelia. Lo que cargás en Digital Admin puede tardar hasta siete días hábiles en verse. Igual tenés que volver a cargar dos cosas: el DNI con frente y dorso, porque el de Mi Argentina no sirve, y la ficha médica en el modelo oficial, firmada por un profesional matriculado.",
        },
        { quien: "narradora", texto: "Primero el plazo, después lo que hay que corregir." },
      ],
    },
    { tipo: "capitulo", texto: "Caso 2 · No terminé el secundario" },
    {
      tipo: "chat",
      estudiante: rosa,
      lineas: [
        {
          quien: "estudiante",
          modo: "audio",
          texto: "Tengo cuarenta y dos años, hice hasta tercer año del secundario y trabajo hace quince años en una contaduría. ¿Puedo estudiar Contador?",
        },
        {
          quien: "martin",
          modo: "escribe",
          texto: "Sí, Rosa, podés pedir el ingreso por el régimen de mayores de 25. Presentás una carta a la Rectora, tu DNI, un CV con los certificados de tu trabajo y el analítico incompleto legalizado. La Universidad evalúa tu caso y puede aprobarlo o no.",
        },
        { quien: "narradora", texto: "Si el trámite queda más de treinta días hábiles «Pendiente en Tutor», se deriva." },
      ],
    },
    {
      tipo: "cierre",
      items: [
        "Avisos al correo registrado; virtual, con notebook.",
        "Se carga en Digital Admin: nada de Mi Argentina ni de buena salud.",
        "Casos especiales: se presenta lo que corresponde y la Universidad evalúa.",
      ],
      lineas: [
        { quien: "narradora", marca: 0, texto: "Uno: los avisos llegan al correo registrado, y para rendir virtual hace falta una notebook." },
        { quien: "narradora", marca: 1, texto: "Dos: la documentación se carga en Digital Admin, nada de Mi Argentina ni de certificado de buena salud." },
        { quien: "narradora", marca: 2, texto: "Tres: en los casos especiales, se presenta lo que corresponde y la Universidad evalúa." },
      ],
    },
  ],
};

export default guion;
