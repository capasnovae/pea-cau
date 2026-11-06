import { generarCertificadoPdf } from "@/lib/certificados/pdf";
import { urlVerificacion } from "@/lib/dominio/certificados";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

/** PDF del certificado, generado a demanda. Lo lee el cliente del usuario: decide la RLS (dueño o quien lo puede ver). */
export async function GET(req: Request, { params }: { params: Promise<{ id: string }> }) {
  await requerirPerfil();
  const { id } = await params;
  if (!/^[0-9a-f-]{36}$/i.test(id)) return new Response("No encontrado", { status: 404 });
  const supabase = await crearClienteServidor();
  const { data: c } = await supabase
    .from("certificaciones")
    .select(
      "id, origen, codigo_verificacion, emitida_at, vence_at, cursos(nivel_orden, titulo), perfiles!certificaciones_usuario_id_fkey(nombre, apellido)",
    )
    .eq("id", id)
    .maybeSingle();
  if (!c || c.origen !== "examen" || !c.cursos?.nivel_orden || !c.perfiles)
    return new Response("No encontrado", { status: 404 });
  const bytes = await generarCertificadoPdf({
    nombre: `${c.perfiles.nombre} ${c.perfiles.apellido}`.trim(),
    nivel: c.cursos.nivel_orden,
    curso: c.cursos.titulo,
    emitidaAt: c.emitida_at,
    venceAt: c.vence_at,
    codigo: c.codigo_verificacion,
    urlVerificacion: urlVerificacion(new URL(req.url).origin, c.codigo_verificacion),
  });
  return new Response(new Blob([bytes as BlobPart], { type: "application/pdf" }), {
    headers: {
      "Content-Type": "application/pdf",
      "Content-Disposition": `attachment; filename="certificado-nivel-${c.cursos.nivel_orden}.pdf"`,
      "Cache-Control": "private, no-store",
    },
  });
}
