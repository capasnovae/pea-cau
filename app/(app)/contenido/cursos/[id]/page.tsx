import Link from "next/link";
import { notFound } from "next/navigation";
import { BotonPromover } from "@/components/contenido/boton-promover";
import { Card } from "@/components/ui/card";
import { cargarOpcionesEdicion } from "@/lib/contenido/opciones";
import { ROLES_EDITORES } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { BotonBorrar, FormularioCurso, FormularioItem, FormularioModulo } from "../formularios";
import { FormularioInsignia } from "../insignia";

/** Solo contenido que ve todo el público del curso: global, o de su misma sede si el curso es de sede. */
function filtroCompatible(curso: { alcance: string; sede_id: string | null }): string {
  return curso.alcance === "sede" && curso.sede_id
    ? `alcance.eq.global,sede_id.eq.${curso.sede_id}`
    : "alcance.eq.global";
}

export default async function PaginaEditarCurso({
  params,
  searchParams,
}: PageProps<"/contenido/cursos/[id]">) {
  const perfil = await requerirRol([...ROLES_EDITORES]);
  const { id } = await params;
  const { creado } = await searchParams;
  if (!/^[0-9a-f-]{36}$/i.test(id)) notFound();
  const supabase = await crearClienteServidor();
  const opciones = await cargarOpcionesEdicion(perfil);
  const { data: curso } = await supabase
    .from("cursos")
    .select("id, tipo, nivel_orden, titulo, descripcion_md, alcance, sede_id, estado, vigencia_meses")
    .eq("id", id)
    .maybeSingle();
  if (!curso) notFound();
  const { data: insignia } =
    curso.tipo === "nivel"
      ? await supabase.from("insignias").select("nombre, descripcion").eq("curso_id", curso.id).maybeSingle()
      : { data: null };
  const [{ data: modulos }, { data: articulos }, { data: recursos }] = await Promise.all([
    supabase
      .from("modulos")
      .select(
        "id, titulo, orden, avance_secuencial, modulo_prerrequisitos!modulo_prerrequisitos_modulo_id_fkey(requiere_modulo_id), items(id, titulo, tipo, requisito, orden, articulo_id, recurso_id, contenido_md, url, examen_id)",
      )
      .eq("curso_id", id)
      .order("orden"),
    supabase
      .from("articulos")
      .select("id, titulo")
      .eq("estado", "publicado")
      .or(filtroCompatible(curso))
      .order("titulo")
      .limit(500),
    supabase
      .from("recursos")
      .select("id, titulo")
      .eq("estado", "publicado")
      .or(filtroCompatible(curso))
      .order("titulo")
      .limit(500),
  ]);
  const listaArt = (articulos ?? []).map((a) => ({ id: a.id, nombre: a.titulo }));
  const listaRec = (recursos ?? []).map((a) => ({ id: a.id, nombre: a.titulo }));
  const { data: examenes } = await supabase
    .from("examenes")
    .select("id, titulo, tipo")
    .eq("estado", "publicado")
    .neq("tipo", "ubicacion")
    .order("titulo");
  const listaEx = (examenes ?? [])
    .filter((e) => e.tipo !== "practica")
    .map((e) => ({ id: e.id, nombre: e.titulo }));
  const listaPr = (examenes ?? [])
    .filter((e) => e.tipo === "practica")
    .map((e) => ({ id: e.id, nombre: e.titulo }));
  const mods = modulos ?? [];

  return (
    <div className="flex flex-col gap-5">
      <div>
        <Link href="/contenido/cursos" className="text-sm font-semibold text-primary-strong">
          ← Cursos
        </Link>
        <h1 className="mt-1 text-2xl font-extrabold">{curso.titulo}</h1>
        {creado && (
          <p role="status" className="text-sm font-semibold text-success">
            Curso creado. Ahora sumale módulos y pasos.
          </p>
        )}
        <Link href={`/estudiar/${curso.id}`} className="text-sm font-semibold text-primary-strong">
          Ver como asesor →
        </Link>
      </div>
      <Card>
        <FormularioCurso curso={curso} alcances={opciones.alcances} sedes={opciones.sedes} />
      </Card>
      {perfil.rol === "admin" && curso.tipo === "nivel" && curso.nivel_orden !== null && insignia && (
        <Card>
          <h2 className="mb-3 font-extrabold">Insignia</h2>
          <FormularioInsignia
            cursoId={curso.id}
            nivel={curso.nivel_orden}
            nombre={insignia.nombre}
            descripcion={insignia.descripcion}
          />
        </Card>
      )}
      {perfil.rol === "admin" && curso.alcance === "sede" && (
        <Card>
          <BotonPromover tabla="cursos" id={curso.id} />
        </Card>
      )}

      {mods.map((m) => {
        const items = [...(m.items ?? [])].sort((a, b) => a.orden - b.orden);
        return (
          <section
            key={m.id}
            className="flex flex-col gap-3 rounded-3xl border-2 border-primary-soft p-4"
            aria-label={`Módulo ${m.titulo}`}
          >
            <div className="flex items-center justify-between">
              <h2 className="text-lg font-extrabold">Módulo: {m.titulo}</h2>
              <BotonBorrar tabla="modulos" id={m.id} etiqueta={`el módulo “${m.titulo}” y sus pasos`} />
            </div>
            <FormularioModulo
              cursoId={curso.id}
              otros={mods.filter((o) => o.id !== m.id).map((o) => ({ id: o.id, titulo: o.titulo }))}
              modulo={{
                id: m.id,
                titulo: m.titulo,
                orden: m.orden,
                avance_secuencial: m.avance_secuencial,
                prerrequisitos: (m.modulo_prerrequisitos ?? []).map((p) => p.requiere_modulo_id),
              }}
            />
            {items.map((it) => (
              <details key={it.id} className="rounded-2xl bg-card p-3 shadow-[var(--shadow-suave)]">
                <summary className="cursor-pointer font-semibold">
                  {it.orden}. {it.titulo} <span className="text-xs font-normal text-muted">({it.tipo})</span>
                </summary>
                <div className="pt-3">
                  <FormularioItem
                    moduloId={m.id}
                    item={it}
                    articulos={listaArt}
                    recursos={listaRec}
                    examenes={listaEx}
                    practicas={listaPr}
                    siguienteOrden={items.length + 1}
                  />
                  <div className="mt-2">
                    <BotonBorrar tabla="items" id={it.id} etiqueta={`el paso “${it.titulo}”`} />
                  </div>
                </div>
              </details>
            ))}
            <div className="rounded-2xl bg-background p-3">
              <h3 className="mb-2 text-sm font-bold">Nuevo paso</h3>
              <FormularioItem
                moduloId={m.id}
                articulos={listaArt}
                recursos={listaRec}
                examenes={listaEx}
                practicas={listaPr}
                siguienteOrden={items.length + 1}
              />
            </div>
          </section>
        );
      })}

      <Card>
        <h2 className="mb-3 font-extrabold">Nuevo módulo</h2>
        <FormularioModulo cursoId={curso.id} otros={mods.map((o) => ({ id: o.id, titulo: o.titulo }))} />
      </Card>
    </div>
  );
}
