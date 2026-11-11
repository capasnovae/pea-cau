const DIAS_NUEVA_VERSION = 14;

export function slugificar(texto: string): string {
  return texto
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 80)
    .replace(/-+$/g, "");
}

function fechaLocal(d: Date): string {
  const m = String(d.getMonth() + 1).padStart(2, "0");
  const dia = String(d.getDate()).padStart(2, "0");
  return `${d.getFullYear()}-${m}-${dia}`;
}

/** Vencido = la fecha de vigencia ya pasó (el día de vencimiento todavía vale). */
export function estaVencido(vigenteHasta: string | null | undefined, hoy: Date = new Date()): boolean {
  if (!vigenteHasta) return false;
  return vigenteHasta < fechaLocal(hoy);
}

export function esNuevaVersion(version: number, updatedAt: string, hoy: Date = new Date()): boolean {
  if (version <= 1) return false;
  const dias = (hoy.getTime() - new Date(updatedAt).getTime()) / 86_400_000;
  return dias >= 0 && dias < DIAS_NUEVA_VERSION;
}

export function rutaArchivo(carpeta: string, nombreOriginal: string, id: string): string {
  const punto = nombreOriginal.lastIndexOf(".");
  const base = punto > 0 ? nombreOriginal.slice(0, punto) : nombreOriginal;
  const ext =
    punto > 0
      ? nombreOriginal
          .slice(punto + 1)
          .toLowerCase()
          .replace(/[^a-z0-9]/g, "")
      : "";
  const nombre = slugificar(base) || "archivo";
  return `${carpeta}/${id}-${nombre}${ext ? `.${ext}` : ""}`;
}

export function formatearFecha(iso: string): string {
  const [a, m, d] = iso.slice(0, 10).split("-");
  return `${d}/${m}/${a}`;
}

/** Saca tildes y eñes, igual que f_unaccent en la columna de búsqueda, para que la consulta matchee. */
export function normalizarBusqueda(q: string): string {
  return q.normalize("NFD").replace(/\p{M}/gu, "").trim();
}
