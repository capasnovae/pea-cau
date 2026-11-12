import type { ReactNode } from "react";
import { Icono, type NombreIcono } from "./icono";

/** Estado vacío: ícono, una frase corta y, si hace falta, una acción. Sin párrafos. */
export function Vacio({
  icono = "tilde",
  texto,
  accion,
}: {
  icono?: NombreIcono;
  texto: string;
  accion?: ReactNode;
}) {
  return (
    <div className="flex flex-col items-center gap-3 py-6 text-center">
      <span className="flex size-10 items-center justify-center rounded-full bg-primary-soft text-primary-strong">
        <Icono nombre={icono} />
      </span>
      <p role="status" className="text-h3">
        {texto}
      </p>
      {accion}
    </div>
  );
}
