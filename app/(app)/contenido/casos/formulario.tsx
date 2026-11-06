"use client";

import { useActionState } from "react";
import { Campo, CamposAlcance, MensajeResultado } from "@/components/contenido/campos";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { guardarCaso, type ResultadoCaso } from "./acciones";

type Opcion = { id: string; nombre: string };
export type CasoEditable = {
  id: string;
  titulo: string;
  contexto_md: string;
  categoria_id: string | null;
  alcance: "global" | "sede";
  sede_id: string | null;
  estado: string;
};

export function FormularioCaso({
  caso,
  alcances,
  sedes,
  categorias,
}: {
  caso?: CasoEditable;
  alcances: ("global" | "sede")[];
  sedes: Opcion[];
  categorias: Opcion[];
}) {
  const [r, accion, pendiente] = useActionState<ResultadoCaso, FormData>(guardarCaso, null);
  return (
    <form action={accion} className="flex flex-col gap-3">
      <input type="hidden" name="id" value={caso?.id ?? ""} />
      <Campo id="caso-titulo" etiqueta="Título">
        <Input id="caso-titulo" name="titulo" required maxLength={150} defaultValue={caso?.titulo} />
      </Campo>
      <Campo id="caso-contexto" etiqueta="Situación">
        <textarea
          id="caso-contexto"
          name="contexto_md"
          rows={5}
          defaultValue={caso?.contexto_md}
          className="w-full rounded-xl border border-border bg-card p-3 text-sm"
        />
      </Campo>
      <div className="grid gap-3 sm:grid-cols-2">
        <Campo id="caso-categoria" etiqueta="Categoría">
          <Select id="caso-categoria" name="categoria_id" defaultValue={caso?.categoria_id ?? ""}>
            <option value="">Sin categoría</option>
            {categorias.map((c) => (
              <option key={c.id} value={c.id}>
                {c.nombre}
              </option>
            ))}
          </Select>
        </Campo>
        <CamposAlcance
          alcances={alcances}
          sedes={sedes}
          alcance={caso?.alcance}
          sedeId={caso?.sede_id}
          estado={caso?.estado}
          prefijo="caso-"
        />
      </div>
      <MensajeResultado r={r} />
      <Button type="submit" disabled={pendiente} className="self-start">
        Guardar caso
      </Button>
    </form>
  );
}
