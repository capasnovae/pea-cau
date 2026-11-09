import "server-only";
import {
  porCategoria,
  rankingPreguntas,
  tasa,
  type FilaAsesor,
  type FilaPregunta,
} from "@/lib/dominio/panel";
import { crearClienteServidor } from "@/lib/supabase/servidor";

/** Los cuatro reportes del panel, leídos con el usuario (las RPCs deciden el alcance). */
export async function cargarPanel() {
  const supabase = await crearClienteServidor();
  const [{ data: asesores }, { data: preguntas }, { data: cola }] = await Promise.all([
    supabase.rpc("panel_asesores"),
    supabase.rpc("panel_preguntas"),
    supabase.rpc("panel_correccion"),
  ]);
  const filasPreguntas = (preguntas ?? []) as FilaPregunta[];
  return {
    asesores: (asesores ?? []) as FilaAsesor[],
    preguntas: rankingPreguntas(filasPreguntas).map((p) => ({ ...p, tasa: tasa(p.aciertos, p.respuestas) })),
    categorias: porCategoria(filasPreguntas),
    cola: cola ?? [],
    tasaGeneral: tasa(
      filasPreguntas.reduce((s, p) => s + p.aciertos, 0),
      filasPreguntas.reduce((s, p) => s + p.respuestas, 0),
    ),
  };
}

export const COLUMNAS_CSV = {
  asesores: [
    { clave: "apellido", titulo: "Apellido" },
    { clave: "nombre", titulo: "Nombre" },
    { clave: "sede", titulo: "Sede" },
    { clave: "equipo", titulo: "Equipo" },
    { clave: "puesto", titulo: "Puesto" },
    { clave: "nivel_actual", titulo: "Nivel" },
    { clave: "cursos_cumplidos", titulo: "Cursos cumplidos" },
    { clave: "cursos_total", titulo: "Cursos obligatorios" },
    { clave: "ultima_actividad", titulo: "Última actividad" },
    { clave: "consignas_vencidas", titulo: "Consignas vencidas" },
    { clave: "cert_vencidas", titulo: "Certificaciones vencidas" },
    { clave: "cert_por_vencer", titulo: "Por vencer" },
    { clave: "motivos", titulo: "Atrasos" },
  ],
  preguntas: [
    { clave: "enunciado_md", titulo: "Pregunta" },
    { clave: "uso", titulo: "Uso" },
    { clave: "categoria", titulo: "Categoría" },
    { clave: "modulo", titulo: "Módulo" },
    { clave: "respuestas", titulo: "Respuestas" },
    { clave: "aciertos", titulo: "Aciertos" },
    { clave: "tasa", titulo: "Tasa %" },
  ],
  categorias: [
    { clave: "categoria", titulo: "Categoría" },
    { clave: "respuestas", titulo: "Respuestas" },
    { clave: "aciertos", titulo: "Aciertos" },
    { clave: "tasa", titulo: "Tasa %" },
  ],
  correccion: [
    { clave: "sede", titulo: "Sede" },
    { clave: "pendientes", titulo: "Pendientes" },
    { clave: "tomados", titulo: "Tomados" },
    { clave: "vencidos", titulo: "Vencidos" },
  ],
} as const;
export type TablaCsv = keyof typeof COLUMNAS_CSV;
