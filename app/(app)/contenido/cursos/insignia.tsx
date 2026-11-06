"use client";

import { useActionState } from "react";
import { Campo, MensajeResultado } from "@/components/contenido/campos";
import { Insignia } from "@/components/perfil/insignia";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { guardarInsignia, type ResultadoCurso } from "./acciones";

export function FormularioInsignia({
  cursoId,
  nivel,
  nombre,
  descripcion,
}: {
  cursoId: string;
  nivel: number;
  nombre: string;
  descripcion: string;
}) {
  const [r, accion, pendiente] = useActionState<ResultadoCurso, FormData>(
    guardarInsignia.bind(null, cursoId),
    null,
  );
  return (
    <form action={accion} className="flex flex-col gap-3 sm:flex-row sm:items-start">
      <Insignia nivel={nivel} nombre={nombre} tamano="lg" />
      <div className="flex flex-1 flex-col gap-3">
        <Campo id="ins-nombre" etiqueta="Nombre de la insignia">
          <Input id="ins-nombre" name="nombre" required maxLength={60} defaultValue={nombre} />
        </Campo>
        <Campo id="ins-desc" etiqueta="Descripción">
          <Input id="ins-desc" name="descripcion" maxLength={300} defaultValue={descripcion} />
        </Campo>
        <MensajeResultado r={r} />
        <Button type="submit" variante="secundario" disabled={pendiente} className="self-start">
          Guardar insignia
        </Button>
      </div>
    </form>
  );
}
