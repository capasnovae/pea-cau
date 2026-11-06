"use client";

import { useActionState } from "react";
import { Campo } from "@/components/contenido/campos";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { crearEvento, type ResultadoEvento } from "./acciones";

export function FormularioEvento({
  sedes,
  permiteTodas,
  fecha,
}: {
  sedes: { id: string; nombre: string }[];
  permiteTodas: boolean;
  fecha: string;
}) {
  const [r, accion, pendiente] = useActionState<ResultadoEvento, FormData>(crearEvento, null);
  return (
    <form action={accion} className="flex flex-col gap-3" aria-label="Nuevo evento">
      <Campo id="ev-titulo" etiqueta="Título">
        <Input id="ev-titulo" name="titulo" required maxLength={120} />
      </Campo>
      <div className="grid grid-cols-2 gap-2">
        <Campo id="ev-fecha" etiqueta="Fecha">
          <Input id="ev-fecha" name="fecha" type="date" required defaultValue={fecha} className="min-w-0" />
        </Campo>
        <Campo id="ev-hora" etiqueta="Hora">
          <Input id="ev-hora" name="hora" type="time" className="min-w-0" />
        </Campo>
      </div>
      <Campo id="ev-tipo" etiqueta="Tipo">
        <Select id="ev-tipo" name="tipo" defaultValue="evento">
          <option value="evento">Evento</option>
          <option value="capacitacion">Capacitación</option>
        </Select>
      </Campo>
      <Campo id="ev-sede" etiqueta="Sede">
        <Select id="ev-sede" name="sede_id" defaultValue={permiteTodas ? "" : sedes[0]?.id}>
          {permiteTodas && <option value="">Todas</option>}
          {sedes.map((s) => (
            <option key={s.id} value={s.id}>
              {s.nombre}
            </option>
          ))}
        </Select>
      </Campo>
      <Button type="submit" disabled={pendiente}>
        Crear evento
      </Button>
      {r && (
        <p role="status" className={`text-sm font-semibold ${r.ok ? "text-success" : "text-destructive"}`}>
          {r.ok ? r.mensaje : r.error}
        </p>
      )}
    </form>
  );
}
