/** Repaso diario espaciado: textos de la racha y del resumen. */
export function textoRacha(dias: number): string {
  if (dias <= 0) return "";
  return `Racha de ${dias} ${dias === 1 ? "día" : "días"}`;
}

export function textoRepaso(pendientes: number): string {
  return `${pendientes} ${pendientes === 1 ? "pregunta" : "preguntas"}`;
}
