"use client";

import { useActionState, useState } from "react";
import { Markdown } from "@/components/markdown";
import { Campo, CampoFecha, CamposAlcance, MensajeResultado } from "@/components/contenido/campos";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { slugificar } from "@/lib/dominio/contenido";
import { cn } from "@/lib/utils/cn";
import { guardarArticulo, type ResultadoGuardado } from "../../acciones";

type Opcion = { id: string; nombre: string };
type Padre = { id: string; titulo: string; categoria_id: string };
export type ArticuloEditable = {
  id: string;
  titulo: string;
  slug: string;
  categoria_id: string;
  padre_id: string | null;
  resumen: string;
  cuerpo_md: string;
  alcance: "global" | "sede";
  sede_id: string | null;
  estado: string;
  vigente_desde: string | null;
  vigente_hasta: string | null;
  fuente_url: string | null;
};

export function FormularioArticulo({
  articulo,
  categorias,
  padres,
  alcances,
  sedes,
}: {
  articulo?: ArticuloEditable;
  categorias: Opcion[];
  padres: Padre[];
  alcances: ("global" | "sede")[];
  sedes: Opcion[];
}) {
  const [r, accion, pendiente] = useActionState<ResultadoGuardado, FormData>(guardarArticulo, null);
  const [titulo, setTitulo] = useState(articulo?.titulo ?? "");
  const [slug, setSlug] = useState(articulo?.slug ?? "");
  const [slugTocado, setSlugTocado] = useState(!!articulo);
  const [categoria, setCategoria] = useState(articulo?.categoria_id ?? categorias[0]?.id ?? "");
  const [cuerpo, setCuerpo] = useState(articulo?.cuerpo_md ?? "");
  const [vista, setVista] = useState<"editar" | "previa">("editar");

  return (
    <form action={accion} className="flex flex-col gap-4">
      <input type="hidden" name="id" value={articulo?.id ?? ""} />
      <Campo id="titulo" etiqueta="Título">
        <Input
          id="titulo"
          name="titulo"
          required
          value={titulo}
          onChange={(e) => {
            setTitulo(e.target.value);
            if (!slugTocado) setSlug(slugificar(e.target.value));
          }}
        />
      </Campo>
      <Campo id="slug" etiqueta="Dirección (slug)" ayuda={`Queda en /repositorio/…/${slug || "…"}`}>
        <Input
          id="slug"
          name="slug"
          value={slug}
          onChange={(e) => {
            setSlug(e.target.value);
            setSlugTocado(true);
          }}
        />
      </Campo>
      <div className="grid gap-4 sm:grid-cols-2">
        <Campo id="categoria_id" etiqueta="Categoría">
          <Select
            id="categoria_id"
            name="categoria_id"
            value={categoria}
            onChange={(e) => setCategoria(e.target.value)}
          >
            {categorias.map((c) => (
              <option key={c.id} value={c.id}>
                {c.nombre}
              </option>
            ))}
          </Select>
        </Campo>
        <Campo id="padre_id" etiqueta="Dentro de (opcional)">
          <Select id="padre_id" name="padre_id" defaultValue={articulo?.padre_id ?? ""} key={categoria}>
            <option value="">Ninguno (va en la raíz de la categoría)</option>
            {padres
              .filter((p) => p.categoria_id === categoria && p.id !== articulo?.id)
              .map((p) => (
                <option key={p.id} value={p.id}>
                  {p.titulo}
                </option>
              ))}
          </Select>
        </Campo>
      </div>
      <Campo
        id="resumen"
        etiqueta="Resumen"
        ayuda="Una o dos líneas. Se muestra en los listados y en la búsqueda."
      >
        <Input id="resumen" name="resumen" maxLength={300} defaultValue={articulo?.resumen ?? ""} />
      </Campo>
      <div className="flex flex-col gap-1.5">
        <div className="flex items-center justify-between">
          <span className="text-sm font-medium">Contenido</span>
          <div className="flex gap-1 rounded-lg border border-border p-0.5" role="tablist">
            {(["editar", "previa"] as const).map((v) => (
              <button
                key={v}
                type="button"
                role="tab"
                aria-selected={vista === v}
                onClick={() => setVista(v)}
                className={cn(
                  "rounded-md px-3 py-1 text-sm",
                  vista === v ? "bg-background font-semibold" : "text-muted",
                )}
              >
                {v === "editar" ? "Escribir" : "Vista previa"}
              </button>
            ))}
          </div>
        </div>
        <textarea
          id="cuerpo_md"
          name="cuerpo_md"
          aria-label="Contenido en Markdown"
          value={cuerpo}
          onChange={(e) => setCuerpo(e.target.value)}
          rows={16}
          className={cn(
            "w-full rounded-lg border border-border bg-card p-3 font-mono text-sm",
            vista === "previa" && "hidden",
          )}
        />
        {vista === "previa" && (
          <div className="min-h-40 rounded-lg border border-border bg-card p-4">
            {cuerpo.trim() ? (
              <Markdown texto={cuerpo} />
            ) : (
              <p className="text-sm text-muted">Todavía no escribiste nada.</p>
            )}
          </div>
        )}
        <p className="text-xs text-muted">
          Usá ## para títulos, - para listas y **negrita**. Las tablas también funcionan.
        </p>
      </div>
      <div className="grid gap-4 sm:grid-cols-3">
        <CamposAlcance
          alcances={alcances}
          sedes={sedes}
          alcance={articulo?.alcance}
          sedeId={articulo?.sede_id}
          estado={articulo?.estado}
        />
      </div>
      <div className="grid gap-4 sm:grid-cols-3">
        <CampoFecha id="vigente_desde" etiqueta="Vigente desde" valor={articulo?.vigente_desde} />
        <CampoFecha id="vigente_hasta" etiqueta="Vigente hasta" valor={articulo?.vigente_hasta} />
        <Campo id="fuente_url" etiqueta="Fuente (link)">
          <Input id="fuente_url" name="fuente_url" type="url" defaultValue={articulo?.fuente_url ?? ""} />
        </Campo>
      </div>
      {articulo && (
        <Campo id="ultimo_cambio" etiqueta="¿Qué cambió?" ayuda="Queda en el historial de versiones.">
          <Input id="ultimo_cambio" name="ultimo_cambio" maxLength={200} />
        </Campo>
      )}
      <MensajeResultado r={r} />
      <Button type="submit" disabled={pendiente} className="self-start">
        {pendiente ? "Guardando…" : articulo ? "Guardar cambios" : "Crear artículo"}
      </Button>
    </form>
  );
}
