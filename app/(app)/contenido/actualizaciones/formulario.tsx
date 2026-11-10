"use client";

import { useActionState } from "react";
import { Campo } from "@/components/contenido/campos";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { publicarActualizacion, type ResultadoActualizacion } from "./acciones";

type Opcion = { id: string; nombre: string };

export function FormularioActualizacion({
  articulos,
  modulos,
  examenes,
}: {
  articulos: Opcion[];
  modulos: Opcion[];
  examenes: Opcion[];
}) {
  const [r, accion, pendiente] = useActionState<ResultadoActualizacion, FormData>(
    publicarActualizacion,
    null,
  );
  return (
    <form action={accion} className="flex flex-col gap-3">
      <Campo id="ac-titulo" etiqueta="Título">
        <Input id="ac-titulo" name="titulo" required maxLength={160} />
      </Campo>
      <Campo id="ac-desc" etiqueta="Qué cambió">
        <textarea
          id="ac-desc"
          name="descripcion_md"
          rows={3}
          maxLength={4000}
          className="w-full rounded-xl border border-border bg-card p-3 text-sm"
        />
      </Campo>
      <div className="grid gap-3 sm:grid-cols-2">
        <Campo id="ac-art" etiqueta="Artículo">
          <Select id="ac-art" name="articulo_id" defaultValue="">
            <option value="">Ninguno</option>
            {articulos.map((a) => (
              <option key={a.id} value={a.id}>
                {a.nombre}
              </option>
            ))}
          </Select>
        </Campo>
        <Campo id="ac-mod" etiqueta="Módulo">
          <Select id="ac-mod" name="modulo_id" defaultValue="">
            <option value="">Ninguno</option>
            {modulos.map((m) => (
              <option key={m.id} value={m.id}>
                {m.nombre}
              </option>
            ))}
          </Select>
        </Campo>
        <Campo id="ac-ex" etiqueta="Mini examen (opcional)">
          <Select id="ac-ex" name="examen_id" defaultValue="">
            <option value="">Sin mini examen</option>
            {examenes.map((e) => (
              <option key={e.id} value={e.id}>
                {e.nombre}
              </option>
            ))}
          </Select>
        </Campo>
        <Campo id="ac-plazo" etiqueta="Plazo (días)">
          <Input id="ac-plazo" name="plazo_dias" type="number" min={1} max={90} defaultValue={15} required />
        </Campo>
      </div>
      {r && (
        <p
          role={r.ok ? "status" : "alert"}
          className={r.ok ? "text-sm font-semibold text-success" : "text-sm font-semibold text-[#b91c1c]"}
        >
          {r.ok
            ? `Publicada. Asignada a ${r.asignadas} ${r.asignadas === 1 ? "persona" : "personas"}.`
            : r.error}
        </p>
      )}
      <Button type="submit" disabled={pendiente} className="self-start">
        Publicar actualización
      </Button>
    </form>
  );
}
