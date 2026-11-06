"use client";

import { useActionState } from "react";
import { Campo, MensajeResultado } from "@/components/contenido/campos";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { guardarArea, type ResultadoArea } from "./acciones";

export type AreaEditable = {
  id: string;
  nombre: string;
  que_resuelve_md: string;
  que_no_resuelve_md: string;
  canal_contacto: string;
  plazo_esperado: string;
  orden: number;
};

export function FormularioArea({ area }: { area?: AreaEditable }) {
  const [r, accion, pendiente] = useActionState<ResultadoArea, FormData>(guardarArea, null);
  const p = area?.id ?? "nueva";
  const area_ = (k: string) => `${p}-${k}`;
  return (
    <form action={accion} className="flex flex-col gap-3">
      <input type="hidden" name="id" value={area?.id ?? ""} />
      <div className="grid gap-3 sm:grid-cols-[1fr_6rem]">
        <Campo id={area_("nombre")} etiqueta="Nombre del área">
          <Input id={area_("nombre")} name="nombre" required defaultValue={area?.nombre} />
        </Campo>
        <Campo id={area_("orden")} etiqueta="Orden">
          <Input id={area_("orden")} name="orden" type="number" min={0} defaultValue={area?.orden ?? 0} />
        </Campo>
      </div>
      <Campo id={area_("resuelve")} etiqueta="Qué resuelve">
        <textarea
          id={area_("resuelve")}
          name="que_resuelve_md"
          rows={3}
          defaultValue={area?.que_resuelve_md}
          className="w-full rounded-lg border border-border bg-card p-3 text-sm"
        />
      </Campo>
      <Campo id={area_("noresuelve")} etiqueta="Qué no resuelve">
        <textarea
          id={area_("noresuelve")}
          name="que_no_resuelve_md"
          rows={2}
          defaultValue={area?.que_no_resuelve_md}
          className="w-full rounded-lg border border-border bg-card p-3 text-sm"
        />
      </Campo>
      <div className="grid gap-3 sm:grid-cols-2">
        <Campo id={area_("canal")} etiqueta="Canal de contacto">
          <Input id={area_("canal")} name="canal_contacto" defaultValue={area?.canal_contacto} />
        </Campo>
        <Campo id={area_("plazo")} etiqueta="Plazo esperado">
          <Input
            id={area_("plazo")}
            name="plazo_esperado"
            placeholder="Ej.: 48 h hábiles"
            defaultValue={area?.plazo_esperado}
          />
        </Campo>
      </div>
      <MensajeResultado r={r} />
      <Button
        type="submit"
        variante={area ? "secundario" : "primario"}
        disabled={pendiente}
        className="self-start"
      >
        {area ? "Guardar" : "Agregar área"}
      </Button>
    </form>
  );
}
