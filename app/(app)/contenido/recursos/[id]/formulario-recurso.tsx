"use client";

import { useActionState, useState } from "react";
import { Campo, CampoFecha, CamposAlcance, MensajeResultado } from "@/components/contenido/campos";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { guardarRecurso, type ResultadoGuardado } from "../../acciones";

type Opcion = { id: string; nombre: string };
const MAX_MB = 50;
const ACEPTA = ".png,.jpg,.jpeg,.webp,.gif,.pdf,.pptx,.docx,.xlsx,.mp4";

export type RecursoEditable = {
  id: string;
  titulo: string;
  descripcion: string;
  tipo: string;
  categoria_id: string;
  campana_id: string | null;
  etiquetas: string[];
  url_externa: string | null;
  archivo_path: string | null;
  alcance: "global" | "sede";
  sede_id: string | null;
  estado: string;
  vigente_hasta: string | null;
};

export function FormularioRecurso({
  recurso,
  categorias,
  campanas,
  alcances,
  sedes,
}: {
  recurso?: RecursoEditable;
  categorias: Opcion[];
  campanas: Opcion[];
  alcances: ("global" | "sede")[];
  sedes: Opcion[];
}) {
  const [r, accion, pendiente] = useActionState<ResultadoGuardado, FormData>(guardarRecurso, null);
  const [errorArchivo, setErrorArchivo] = useState<string | null>(null);
  return (
    <form action={accion} className="flex flex-col gap-4">
      <input type="hidden" name="id" value={recurso?.id ?? ""} />
      <Campo id="titulo" etiqueta="Título">
        <Input id="titulo" name="titulo" required defaultValue={recurso?.titulo} />
      </Campo>
      <Campo id="descripcion" etiqueta="Descripción">
        <Input id="descripcion" name="descripcion" maxLength={500} defaultValue={recurso?.descripcion} />
      </Campo>
      <div className="grid gap-4 sm:grid-cols-3">
        <Campo id="tipo" etiqueta="Tipo">
          <Select id="tipo" name="tipo" defaultValue={recurso?.tipo ?? "pdf"}>
            <option value="pdf">PDF</option>
            <option value="imagen">Imagen</option>
            <option value="presentacion">Presentación</option>
            <option value="video">Video</option>
            <option value="enlace">Enlace</option>
            <option value="otro">Otro</option>
          </Select>
        </Campo>
        <Campo id="categoria_id" etiqueta="Categoría">
          <Select id="categoria_id" name="categoria_id" defaultValue={recurso?.categoria_id ?? categorias[0]?.id}>
            {categorias.map((c) => (
              <option key={c.id} value={c.id}>{c.nombre}</option>
            ))}
          </Select>
        </Campo>
        <Campo id="campana_id" etiqueta="Campaña (opcional)">
          <Select id="campana_id" name="campana_id" defaultValue={recurso?.campana_id ?? ""}>
            <option value="">Sin campaña</option>
            {campanas.map((c) => (
              <option key={c.id} value={c.id}>{c.nombre}</option>
            ))}
          </Select>
        </Campo>
      </div>
      <Campo
        id="archivo"
        etiqueta={recurso?.archivo_path ? "Reemplazar archivo (opcional)" : "Archivo"}
        ayuda={`Hasta ${MAX_MB} MB: imágenes, PDF, PowerPoint, Word, Excel o MP4. Para videos largos usá un link.`}
      >
        <Input
          id="archivo"
          name="archivo"
          type="file"
          accept={ACEPTA}
          className="h-auto py-2"
          onChange={(e) => {
            const f = e.target.files?.[0];
            setErrorArchivo(f && f.size > MAX_MB * 1024 * 1024 ? `El archivo pesa más de ${MAX_MB} MB.` : null);
          }}
        />
      </Campo>
      {recurso?.archivo_path && <p className="text-xs text-muted">Archivo actual: {recurso.archivo_path.split("/").pop()}</p>}
      {errorArchivo && <p role="alert" className="text-sm text-destructive">{errorArchivo}</p>}
      <Campo id="url_externa" etiqueta="Link (para enlaces o videos de YouTube/Vimeo)">
        <Input id="url_externa" name="url_externa" type="url" defaultValue={recurso?.url_externa ?? ""} />
      </Campo>
      <Campo id="etiquetas" etiqueta="Etiquetas" ayuda="Separadas por comas, por ejemplo: becas, descuentos">
        <Input id="etiquetas" name="etiquetas" defaultValue={recurso?.etiquetas.join(", ") ?? ""} />
      </Campo>
      <div className="grid gap-4 sm:grid-cols-4">
        <CamposAlcance alcances={alcances} sedes={sedes} alcance={recurso?.alcance} sedeId={recurso?.sede_id} estado={recurso?.estado} />
        <CampoFecha id="vigente_hasta" etiqueta="Vigente hasta" valor={recurso?.vigente_hasta} />
      </div>
      <MensajeResultado r={r} />
      <Button type="submit" disabled={pendiente || !!errorArchivo} className="self-start">
        {pendiente ? "Guardando…" : recurso ? "Guardar cambios" : "Crear recurso"}
      </Button>
    </form>
  );
}
