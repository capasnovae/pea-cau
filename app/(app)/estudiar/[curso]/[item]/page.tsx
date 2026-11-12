import Link from "next/link";
import { notFound } from "next/navigation";
import { BarraSiguiente, MarcarVisto } from "@/components/leccion/acciones-leccion";
import { ContenidoLeccion } from "@/components/leccion/contenido";
import { VistaLeccion } from "@/components/leccion/vista-leccion";
import { esLeccionV2, esquemaLeccion, esquemaLeccionV2, minutosDeLectura } from "@/lib/dominio/lecciones";
import { ordenarTarjetas } from "@/components/leccion/tarjetas/orden";
import { VistaTarjetas } from "@/components/leccion/tarjetas/vista-tarjetas";
import { Markdown } from "@/components/markdown";
import { BotonDescargar } from "@/app/(app)/recursos/boton-descargar";
import { Icono } from "@/components/ui/icono";
import { colorNivel, idsRecursoEnMarkdown, reemplazarRecursos, urlEmbedVideo } from "@/lib/dominio/leccion";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { Practica } from "./practica";

const UUID = /^[0-9a-f-]{36}$/i;

export default async function PaginaLeccion({ params }: PageProps<"/estudiar/[curso]/[item]">) {
  await requerirPerfil();
  const { curso: cursoId, item: itemId } = await params;
  if (!UUID.test(cursoId) || !UUID.test(itemId)) notFound();
  const supabase = await crearClienteServidor();
  const [{ data: curso }, { data: item }, { data: estado }] = await Promise.all([
    supabase.from("cursos").select("id, titulo, tipo, nivel_orden, estado").eq("id", cursoId).maybeSingle(),
    supabase
      .from("items")
      .select(
        "id, titulo, tipo, requisito, contenido_md, url, articulo_id, recurso_id, modulo_id, examen_id, leccion",
      )
      .eq("id", itemId)
      .maybeSingle(),
    supabase.rpc("estado_curso", { p_curso: cursoId }),
  ]);
  if (!curso || !item) notFound();
  const filas = estado ?? [];
  const idx = filas.findIndex((f) => f.item_id === itemId);
  if (idx < 0) notFound();
  const fila = filas[idx]!;
  const delModulo = filas.filter((f) => f.modulo_id === fila.modulo_id);
  const posModulo = delModulo.findIndex((f) => f.item_id === itemId);
  const siguiente = filas[idx + 1];
  const siguienteHref = siguiente ? `/estudiar/${cursoId}/${siguiente.item_id}` : `/estudiar/${cursoId}`;
  const color = colorNivel(curso.nivel_orden).fondo;

  if (!fila.disponible) {
    const pendiente = filas.find((f) => f.disponible && !f.cumplido);
    return (
      <div className="flex flex-col gap-4">
        <Link
          href={`/estudiar/${cursoId}`}
          className="inline-flex items-center gap-1 text-sm font-semibold text-primary-strong"
        >
          <Icono nombre="chevron-izq" tamano={16} />
          {curso.titulo}
        </Link>
        <div className="rounded-3xl bg-card p-6 text-center shadow-1">
          <h1 className="text-h2">{item.titulo}</h1>
          <p className="mt-2 text-muted">
            Esta lección todavía está bloqueada. Completá lo anterior para seguir.
          </p>
          {pendiente && (
            <Link
              href={`/estudiar/${cursoId}/${pendiente.item_id}`}
              className="mt-4 inline-flex min-h-11 items-center rounded-2xl bg-primary px-5 font-bold text-primary-foreground"
            >
              Ir a: {pendiente.titulo}
            </Link>
          )}
        </div>
      </div>
    );
  }

  let cuerpo: React.ReactNode = null;
  let probalo: React.ReactNode = null;
  let conProbalo = false;
  let sinMarco = false;
  let barraEnTarjetas = false;
  const barra = () => (
    <BarraSiguiente
      itemId={itemId}
      requisito={item.tipo === "practica" || conProbalo ? "ninguno" : item.requisito}
      cumplido={fila.cumplido}
      siguienteHref={siguienteHref}
      color={color}
    />
  );
  const v2 =
    item.tipo === "leccion" && esLeccionV2(item.leccion) ? esquemaLeccionV2.safeParse(item.leccion) : null;
  const leccion = item.tipo === "leccion" && !v2 ? esquemaLeccion.safeParse(item.leccion) : null;
  if (v2) {
    const [{ data: art }, { data: preguntas }] = await Promise.all([
      item.articulo_id
        ? supabase
            .from("articulos")
            .select("titulo, slug, categorias(slug)")
            .eq("id", item.articulo_id)
            .maybeSingle()
        : Promise.resolve({ data: null }),
      supabase.rpc("probalo_preguntas", { p_item: itemId }),
    ]);
    type P = Parameters<typeof Practica>[0]["preguntas"][number];
    const lista = (preguntas ?? []) as unknown as P[];
    conProbalo = lista.length > 0;
    sinMarco = true;
    if (!v2.success) cuerpo = <p className="text-muted">Esta lección no se puede mostrar.</p>;
    else {
      // El video vive en un bucket privado: se ve con un enlace firmado; si no está, la tarjeta no aparece
      const ruta = v2.data.tarjetas.find((t) => t.tipo === "video")?.ruta;
      const { data: firmado } = ruta
        ? await supabase.storage.from("videos").createSignedUrl(ruta, 3600)
        : { data: null };
      cuerpo = (
        <VistaTarjetas
          tarjetas={ordenarTarjetas(
            v2.data.tarjetas,
            lista.map((p) => p.pregunta_id),
            firmado?.signedUrl ?? null,
          )}
          preguntas={Object.fromEntries(lista.map((p) => [p.pregunta_id, p]))}
          itemId={itemId}
          minutos={minutosDeLectura(v2.data)}
          color={color}
          fuente={
            art ? { titulo: art.titulo, href: `/repositorio/${art.categorias?.slug}/${art.slug}` } : null
          }
          alFinal={barra()}
        />
      );
      barraEnTarjetas = true;
    }
  } else if (leccion) {
    const [{ data: art }, { data: preguntas }] = await Promise.all([
      item.articulo_id
        ? supabase
            .from("articulos")
            .select("titulo, slug, categorias(slug)")
            .eq("id", item.articulo_id)
            .maybeSingle()
        : Promise.resolve({ data: null }),
      supabase.rpc("probalo_preguntas", { p_item: itemId }),
    ]);
    cuerpo = leccion.success ? (
      <VistaLeccion
        leccion={leccion.data}
        minutos={minutosDeLectura(leccion.data)}
        fuente={art ? { titulo: art.titulo, href: `/repositorio/${art.categorias?.slug}/${art.slug}` } : null}
      />
    ) : (
      <p className="text-muted">Esta lección no se puede mostrar.</p>
    );
    conProbalo = (preguntas ?? []).length > 0;
    if (conProbalo)
      probalo = (
        <div className="rounded-3xl bg-card p-5 shadow-1">
          <Practica
            origen={{ tipo: "leccion", id: itemId }}
            preguntas={(preguntas ?? []) as unknown as Parameters<typeof Practica>[0]["preguntas"]}
          />
        </div>
      );
  } else if (item.tipo === "pagina" && item.contenido_md) {
    const ids = idsRecursoEnMarkdown(item.contenido_md);
    const urls: Record<string, string> = {};
    if (ids.length) {
      const { data: recursos } = await supabase.from("recursos").select("id, archivo_path").in("id", ids);
      for (const r of recursos ?? []) {
        if (!r.archivo_path) continue;
        const { data } = await supabase.storage.from("recursos").createSignedUrl(r.archivo_path, 3600);
        if (data) urls[r.id] = data.signedUrl;
      }
    }
    cuerpo = <ContenidoLeccion texto={reemplazarRecursos(item.contenido_md, urls)} />;
  } else if (item.tipo === "articulo" && item.articulo_id) {
    const { data: art } = await supabase
      .from("articulos")
      .select("titulo, cuerpo_md, slug, categorias(slug)")
      .eq("id", item.articulo_id)
      .maybeSingle();
    cuerpo = art ? (
      <>
        <Markdown texto={art.cuerpo_md} />
        <Link
          href={`/repositorio/${art.categorias?.slug}/${art.slug}`}
          className="inline-flex items-center gap-1 mt-4 inline-block text-sm font-semibold text-primary-strong"
        >
          Ver en el repositorio
          <Icono nombre="flecha-der" tamano={16} />
        </Link>
      </>
    ) : (
      <p className="text-muted">El artículo de esta lección ya no está disponible.</p>
    );
  } else if (item.tipo === "video") {
    const embed = item.url ? urlEmbedVideo(item.url) : null;
    if (embed) {
      cuerpo = (
        <div className="aspect-video overflow-hidden rounded-2xl bg-black">
          <iframe
            src={embed}
            title={item.titulo}
            className="size-full"
            allow="accelerometer; encrypted-media; gyroscope; picture-in-picture"
            allowFullScreen
          />
        </div>
      );
    } else if (item.url) {
      cuerpo = (
        <a
          href={item.url}
          target="_blank"
          rel="noopener noreferrer"
          className="font-semibold text-primary-strong underline"
        >
          Abrir el video
        </a>
      );
    } else if (item.recurso_id) {
      cuerpo = <BotonDescargar recursoId={item.recurso_id} />;
    }
  } else if (item.tipo === "recurso" && item.recurso_id) {
    cuerpo = <BotonDescargar recursoId={item.recurso_id} />;
  } else if (item.tipo === "enlace" && item.url) {
    cuerpo = (
      <a
        href={item.url}
        target="_blank"
        rel="noopener noreferrer"
        className="inline-flex min-h-11 items-center rounded-2xl bg-primary-soft px-5 font-bold text-primary-strong"
      >
        Abrir enlace
      </a>
    );
  } else if (item.tipo === "practica" && item.examen_id) {
    const { data: preguntas, error } = await supabase.rpc("practica_preguntas", { p_examen: item.examen_id });
    cuerpo = error ? (
      <p className="text-sm text-muted">Completá lo anterior para practicar.</p>
    ) : (
      <Practica
        origen={{ tipo: "examen", id: item.examen_id }}
        preguntas={(preguntas ?? []) as unknown as Parameters<typeof Practica>[0]["preguntas"]}
      />
    );
  } else if (item.tipo === "examen") {
    const { data: examen } = item.examen_id
      ? await supabase
          .from("examenes")
          .select("id, titulo, nota_minima, cantidad_preguntas")
          .eq("id", item.examen_id)
          .maybeSingle()
      : { data: null };
    cuerpo = examen ? (
      <div className="flex flex-wrap items-center gap-4">
        <div className="min-w-0 flex-1">
          <p className="font-extrabold">{examen.titulo}</p>
          <p className="text-sm text-muted">
            {examen.cantidad_preguntas} preguntas · para aprobar {examen.nota_minima}%
          </p>
        </div>
        {fila.cumplido ? (
          <span className="rounded-full bg-success-soft px-3 py-1.5 text-sm font-bold text-success">
            Aprobado
          </span>
        ) : (
          <Link
            href={`/examenes/${examen.id}`}
            className="inline-flex min-h-11 items-center rounded-2xl bg-primary px-5 font-bold text-primary-foreground"
          >
            Ir al examen
          </Link>
        )}
      </div>
    ) : (
      <p className="text-sm text-muted">Examen sin configurar.</p>
    );
  }

  return (
    <article className="flex flex-col gap-4 pb-24 md:pb-0">
      {curso.estado !== "publicado" && (
        <p role="status" className="rounded-2xl bg-warning-soft px-4 py-2.5 text-sm font-bold text-warning">
          Vista previa · borrador
        </p>
      )}
      {fila.disponible && !fila.cumplido && item.requisito === "ver" && <MarcarVisto itemId={itemId} />}
      <div className="flex items-center gap-3">
        <Link
          href={`/estudiar/${cursoId}`}
          aria-label="Volver al curso"
          className="flex size-11 items-center justify-center rounded-full bg-card shadow-1 transition active:scale-95"
        >
          <Icono nombre="cruz" />
        </Link>
        <div
          className="grid flex-1 gap-1.5"
          style={{ gridTemplateColumns: `repeat(${delModulo.length}, minmax(0, 1fr))` }}
          aria-label={`Paso ${posModulo + 1} de ${delModulo.length}`}
          role="img"
        >
          {delModulo.map((f, i) => (
            <div key={f.item_id} className="h-2 overflow-hidden rounded-full bg-border">
              {(f.cumplido || i < posModulo) && (
                <div
                  className={`h-full w-full origin-left rounded-full ${i === posModulo ? "barra-llenar" : ""}`}
                  style={{ background: color, "--v": 1 } as React.CSSProperties}
                />
              )}
            </div>
          ))}
        </div>
      </div>
      <p className="text-sm font-semibold text-muted">
        {fila.modulo_titulo} · paso {posModulo + 1} de {delModulo.length}
      </p>
      <h1 className="text-h1 leading-tight">{item.titulo}</h1>
      {sinMarco ? cuerpo : <div className="rounded-3xl bg-card p-5 shadow-1">{cuerpo}</div>}
      {probalo}
      {!barraEnTarjetas && barra()}
    </article>
  );
}
