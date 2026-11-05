"use client";

import { useActionState, useState, useTransition } from "react";
import { Campo, CamposAlcance, MensajeResultado } from "@/components/contenido/campos";
import { ContenidoLeccion } from "@/components/leccion/contenido";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { borrarFila, guardarCurso, guardarItem, guardarModulo, type ResultadoCurso } from "./acciones";

type Opcion = { id: string; nombre: string };

export type CursoEditable = {
  id: string; tipo: "nivel" | "capacitacion"; nivel_orden: number | null; titulo: string; descripcion_md: string;
  alcance: "global" | "sede"; sede_id: string | null; estado: string; vigencia_meses: number | null;
};

export function FormularioCurso({ curso, alcances, sedes }: { curso?: CursoEditable; alcances: ("global" | "sede")[]; sedes: Opcion[] }) {
  const [r, accion, pendiente] = useActionState<ResultadoCurso, FormData>(guardarCurso, null);
  const [tipo, setTipo] = useState(curso?.tipo ?? (alcances.includes("global") ? "nivel" : "capacitacion"));
  const p = curso?.id ?? "nuevo";
  return (
    <form action={accion} className="flex flex-col gap-3">
      <input type="hidden" name="id" value={curso?.id ?? ""} />
      <div className="grid gap-3 sm:grid-cols-[1fr_8rem]">
        <Campo id={`${p}-titulo`} etiqueta="Título del curso">
          <Input id={`${p}-titulo`} name="titulo" required defaultValue={curso?.titulo} />
        </Campo>
        <Campo id={`${p}-tipo`} etiqueta="Tipo">
          <Select id={`${p}-tipo`} name="tipo" value={tipo} onChange={(e) => setTipo(e.target.value as "nivel" | "capacitacion")}>
            {alcances.includes("global") && <option value="nivel">Nivel</option>}
            <option value="capacitacion">Capacitación</option>
          </Select>
        </Campo>
      </div>
      <Campo id={`${p}-desc`} etiqueta="Descripción">
        <textarea id={`${p}-desc`} name="descripcion_md" rows={3} defaultValue={curso?.descripcion_md} className="w-full rounded-xl border border-border bg-card p-3 text-sm" />
      </Campo>
      <div className="grid gap-3 sm:grid-cols-4">
        {tipo === "nivel" ? (
          <>
            <Campo id={`${p}-nivel`} etiqueta="Número de nivel">
              <Input id={`${p}-nivel`} name="nivel_orden" type="number" min={1} max={9} required defaultValue={curso?.nivel_orden ?? ""} />
            </Campo>
            <input type="hidden" name="alcance" value="global" />
            <input type="hidden" name="sede_id" value="" />
            <Campo id={`${p}-estado`} etiqueta="Estado">
              <Select id={`${p}-estado`} name="estado" defaultValue={curso?.estado ?? "borrador"}>
                <option value="borrador">Borrador</option>
                <option value="publicado">Publicado</option>
                <option value="archivado">Archivado</option>
              </Select>
            </Campo>
          </>
        ) : (
          <CamposAlcance prefijo={`${p}-`} alcances={alcances} sedes={sedes} alcance={curso?.alcance} sedeId={curso?.sede_id} estado={curso?.estado} />
        )}
        <Campo id={`${p}-vig`} etiqueta="Vigencia (meses)" ayuda="Vacío: no vence.">
          <Input id={`${p}-vig`} name="vigencia_meses" type="number" min={1} max={120} defaultValue={curso?.vigencia_meses ?? ""} />
        </Campo>
      </div>
      <MensajeResultado r={r} />
      <Button type="submit" disabled={pendiente} className="self-start">{curso ? "Guardar curso" : "Crear curso"}</Button>
    </form>
  );
}

export function FormularioModulo({
  cursoId, modulo, otros,
}: {
  cursoId: string;
  modulo?: { id: string; titulo: string; orden: number; avance_secuencial: boolean; prerrequisitos: string[] };
  otros: { id: string; titulo: string }[];
}) {
  const [r, accion, pendiente] = useActionState<ResultadoCurso, FormData>(guardarModulo, null);
  const p = modulo?.id ?? `nuevo-${cursoId}`;
  return (
    <form action={accion} className="flex flex-col gap-3">
      <input type="hidden" name="id" value={modulo?.id ?? ""} />
      <input type="hidden" name="curso_id" value={cursoId} />
      <div className="grid gap-3 sm:grid-cols-[1fr_6rem]">
        <Campo id={`${p}-titulo`} etiqueta="Título del módulo">
          <Input id={`${p}-titulo`} name="titulo" required defaultValue={modulo?.titulo} />
        </Campo>
        <Campo id={`${p}-orden`} etiqueta="Orden">
          <Input id={`${p}-orden`} name="orden" type="number" min={0} defaultValue={modulo?.orden ?? otros.length + 1} />
        </Campo>
      </div>
      <label className="flex items-center gap-2 text-sm">
        <input type="checkbox" name="avance_secuencial" defaultChecked={modulo?.avance_secuencial} className="size-4" />
        Avance en orden (cada paso se habilita al terminar el anterior)
      </label>
      {otros.length > 0 && (
        <fieldset className="flex flex-col gap-1">
          <legend className="text-sm font-medium">Para empezarlo hay que terminar:</legend>
          {otros.map((o) => (
            <label key={o.id} className="flex items-center gap-2 text-sm">
              <input type="checkbox" name="prerrequisitos" value={o.id} defaultChecked={modulo?.prerrequisitos.includes(o.id)} className="size-4" />
              {o.titulo}
            </label>
          ))}
        </fieldset>
      )}
      <MensajeResultado r={r} />
      <Button type="submit" variante={modulo ? "secundario" : "primario"} disabled={pendiente} className="self-start">
        {modulo ? "Guardar módulo" : "Agregar módulo"}
      </Button>
    </form>
  );
}

export type ItemEditable = {
  id: string; titulo: string; tipo: string; requisito: string; orden: number;
  articulo_id: string | null; recurso_id: string | null; contenido_md: string | null; url: string | null;
};

export function FormularioItem({
  moduloId, item, articulos, recursos, siguienteOrden,
}: {
  moduloId: string;
  item?: ItemEditable;
  articulos: Opcion[];
  recursos: Opcion[];
  siguienteOrden: number;
}) {
  const [r, accion, pendiente] = useActionState<ResultadoCurso, FormData>(guardarItem, null);
  const [tipo, setTipo] = useState(item?.tipo ?? "pagina");
  const [md, setMd] = useState(item?.contenido_md ?? "");
  const [previa, setPrevia] = useState(false);
  const p = item?.id ?? `nuevo-${moduloId}`;
  return (
    <form action={accion} className="flex flex-col gap-3">
      <input type="hidden" name="id" value={item?.id ?? ""} />
      <input type="hidden" name="modulo_id" value={moduloId} />
      <div className="grid gap-3 sm:grid-cols-[1fr_9rem_10rem_5rem]">
        <Campo id={`${p}-titulo`} etiqueta="Título del paso">
          <Input id={`${p}-titulo`} name="titulo" required defaultValue={item?.titulo} />
        </Campo>
        <Campo id={`${p}-tipo`} etiqueta="Tipo">
          <Select id={`${p}-tipo`} name="tipo" value={tipo} onChange={(e) => setTipo(e.target.value)}>
            <option value="pagina">Página</option>
            <option value="articulo">Artículo</option>
            <option value="video">Video</option>
            <option value="recurso">Recurso</option>
            <option value="enlace">Enlace</option>
            <option value="examen">Examen</option>
          </Select>
        </Campo>
        <Campo id={`${p}-req`} etiqueta="Para cumplirlo">
          <Select id={`${p}-req`} name="requisito" defaultValue={item?.requisito ?? "ver"}>
            <option value="ver">Verlo</option>
            <option value="marcar_hecho">Marcar como hecho</option>
            <option value="ninguno">Opcional</option>
            {tipo === "examen" && <option value="aprobar">Aprobar</option>}
          </Select>
        </Campo>
        <Campo id={`${p}-orden`} etiqueta="Orden">
          <Input id={`${p}-orden`} name="orden" type="number" min={0} defaultValue={item?.orden ?? siguienteOrden} />
        </Campo>
      </div>
      {tipo === "articulo" && (
        <Campo id={`${p}-art`} etiqueta="Artículo del repositorio">
          <Select id={`${p}-art`} name="articulo_id" defaultValue={item?.articulo_id ?? ""} required>
            <option value="" disabled>Elegí un artículo</option>
            {articulos.map((a) => <option key={a.id} value={a.id}>{a.nombre}</option>)}
          </Select>
        </Campo>
      )}
      {(tipo === "recurso" || tipo === "video") && (
        <Campo id={`${p}-rec`} etiqueta={tipo === "video" ? "Recurso de video (opcional si ponés link)" : "Recurso"}>
          <Select id={`${p}-rec`} name="recurso_id" defaultValue={item?.recurso_id ?? ""}>
            <option value="">{tipo === "video" ? "Ninguno" : "Elegí un recurso"}</option>
            {recursos.map((a) => <option key={a.id} value={a.id}>{a.nombre}</option>)}
          </Select>
        </Campo>
      )}
      {(tipo === "video" || tipo === "enlace") && (
        <Campo id={`${p}-url`} etiqueta={tipo === "video" ? "Link de YouTube o Vimeo" : "Link"}>
          <Input id={`${p}-url`} name="url" type="url" defaultValue={item?.url ?? ""} />
        </Campo>
      )}
      {tipo === "pagina" && (
        <div className="flex flex-col gap-1.5">
          <div className="flex items-center justify-between">
            <label htmlFor={`${p}-md`} className="text-sm font-medium">Contenido</label>
            <button type="button" onClick={() => setPrevia(!previa)} className="text-sm font-semibold text-primary-strong">
              {previa ? "Escribir" : "Vista previa"}
            </button>
          </div>
          <textarea id={`${p}-md`} name="contenido_md" rows={10} value={md} onChange={(e) => setMd(e.target.value)}
            className={`w-full rounded-xl border border-border bg-card p-3 font-mono text-sm ${previa ? "hidden" : ""}`} />
          {previa && <div className="rounded-xl border border-border bg-card p-4"><ContenidoLeccion texto={md || "_Sin contenido_"} /></div>}
          <p className="text-xs text-muted">
            Capturas: <code>![Paso 1](recurso:ID-del-recurso)</code>. Cajas: una línea que empiece con <code>&gt; **Error común:**</code> o <code>&gt; **Tip:**</code>.
          </p>
        </div>
      )}
      {tipo === "examen" && <p className="text-sm text-muted">Los exámenes se configuran en la próxima etapa.</p>}
      <MensajeResultado r={r} />
      <Button type="submit" variante={item ? "secundario" : "primario"} disabled={pendiente} className="self-start">
        {item ? "Guardar paso" : "Agregar paso"}
      </Button>
    </form>
  );
}

export function BotonBorrar({ tabla, id, etiqueta }: { tabla: "modulos" | "items"; id: string; etiqueta: string }) {
  const [pendiente, iniciar] = useTransition();
  const [r, setR] = useState<ResultadoCurso>(null);
  return (
    <span className="inline-flex flex-col">
      <button type="button" disabled={pendiente} className="text-sm font-semibold text-destructive"
        onClick={() => { if (window.confirm(`¿Eliminar ${etiqueta}?`)) iniciar(async () => setR(await borrarFila(tabla, id))); }}>
        Eliminar
      </button>
      {r && !r.ok && <span className="text-xs text-destructive">{r.error}</span>}
    </span>
  );
}
