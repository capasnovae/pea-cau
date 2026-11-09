import { aCsv, motivosAtraso } from "@/lib/dominio/panel";
import { ROLES_GESTION } from "@/lib/dominio/roles";
import { COLUMNAS_CSV, cargarPanel, type TablaCsv } from "@/lib/panel/datos";
import { requerirPerfil } from "@/lib/supabase/permisos";

/** Exportación a CSV de cada tabla del panel. Lee con el usuario: las RPCs deciden el alcance. */
export async function GET(_req: Request, { params }: { params: Promise<{ tabla: string }> }) {
  const perfil = await requerirPerfil();
  const { tabla } = await params;
  if (!ROLES_GESTION.includes(perfil.rol) || !Object.hasOwn(COLUMNAS_CSV, tabla))
    return new Response("No encontrado", { status: 404 });
  const d = await cargarPanel();
  const ahora = new Date();
  const filas: Record<string, unknown>[] =
    tabla === "asesores"
      ? d.asesores.map((a) => ({ ...a, motivos: motivosAtraso(a, ahora).join(" · ") }))
      : tabla === "preguntas"
        ? d.preguntas
        : tabla === "categorias"
          ? d.categorias
          : d.cola;
  const fecha = ahora.toISOString().slice(0, 10);
  return new Response(aCsv([...COLUMNAS_CSV[tabla as TablaCsv]], filas), {
    headers: {
      "Content-Type": "text/csv; charset=utf-8",
      "Content-Disposition": `attachment; filename="panel-${tabla}-${fecha}.csv"`,
      "Cache-Control": "private, no-store",
    },
  });
}
