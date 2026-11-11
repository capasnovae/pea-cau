import Link from "next/link";
import { notFound } from "next/navigation";
import { BotonPromover } from "@/components/contenido/boton-promover";
import { Card } from "@/components/ui/card";
import { cargarOpcionesEdicion } from "@/lib/contenido/opciones";
import { formatearFecha } from "@/lib/dominio/contenido";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioArticulo } from "./formulario-articulo";

export default async function PaginaEditarArticulo({
  params,
  searchParams,
}: PageProps<"/contenido/articulos/[id]">) {
  const perfil = await requerirRol([...ROLES_EDITORES]);
  const { id } = await params;
  const { creado } = await searchParams;
  const supabase = await crearClienteServidor();
  const opciones = await cargarOpcionesEdicion(perfil);
  const nuevo = id === "nuevo";

  const { data: articulo } = nuevo
    ? { data: null }
    : await supabase
        .from("articulos")
        .select(
          "id, titulo, slug, categoria_id, padre_id, resumen, cuerpo_md, alcance, sede_id, estado, vigente_desde, vigente_hasta, fuente_url, version, promovido_at",
        )
        .eq("id", id)
        .maybeSingle();
  if (!nuevo && !articulo) notFound();

  const [{ data: padres }, { data: versiones }] = await Promise.all([
    supabase.from("articulos").select("id, titulo, categoria_id").is("padre_id", null).order("titulo"),
    nuevo
      ? Promise.resolve({ data: [] })
      : supabase
          .from("articulo_versiones")
          .select("version, created_at, resumen_cambio, perfiles(nombre, apellido)")
          .eq("articulo_id", id)
          .order("version", { ascending: false }),
  ]);

  return (
    <div className="flex flex-col gap-5">
      <div>
        <Link href="/contenido?tab=articulos" className="text-sm text-primary">
          ← Contenido
        </Link>
        <h1 className="mt-1 text-h1">{nuevo ? "Nuevo artículo" : "Editar artículo"}</h1>
        {creado && (
          <p role="status" className="text-sm text-primary">
            Artículo creado.
          </p>
        )}
      </div>
      <Card>
        <FormularioArticulo
          articulo={articulo ?? undefined}
          categorias={opciones.categorias}
          padres={padres ?? []}
          alcances={opciones.alcances}
          sedes={opciones.sedes}
        />
      </Card>
      {articulo && perfil.rol === "admin" && articulo.alcance === "sede" && (
        <Card>
          <BotonPromover tabla="articulos" id={articulo.id} />
        </Card>
      )}
      {articulo?.promovido_at && (
        <p role="status" className="text-sm text-primary">
          Ya lo ven todos los CAU (promovido el {formatearFecha(articulo.promovido_at)}).
        </p>
      )}
      {articulo && (
        <Card>
          <h2 className="mb-2 font-semibold">Historial de versiones</h2>
          <ul className="flex flex-col gap-1.5 text-sm" aria-label="Historial de versiones">
            <li>
              <strong>Versión {articulo.version}</strong> · actual
            </li>
            {(versiones ?? []).map((v) => (
              <li key={v.version}>
                Versión {v.version} · {formatearFecha(v.created_at)}
                {v.perfiles ? ` · ${v.perfiles.nombre} ${v.perfiles.apellido}` : ""}
                {v.resumen_cambio ? ` · ${v.resumen_cambio}` : ""}
              </li>
            ))}
          </ul>
        </Card>
      )}
    </div>
  );
}
