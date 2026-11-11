"use client";

import { useId, type ReactNode } from "react";
import { Button } from "./button";
import { Icono, type NombreIcono } from "./icono";

/** Botón que abre un diálogo con contenido propio (un formulario, un detalle). */
export function Dialogo({
  boton,
  icono,
  titulo,
  children,
}: {
  boton: string;
  icono?: NombreIcono;
  titulo: string;
  children: ReactNode;
}) {
  const id = useId();
  const dialogo = () => document.getElementById(id) as HTMLDialogElement | null;
  return (
    <>
      <Button type="button" aria-haspopup="dialog" onClick={() => dialogo()?.showModal()}>
        {icono && <Icono nombre={icono} />}
        {boton}
      </Button>
      <dialog
        id={id}
        aria-labelledby={`${id}-titulo`}
        className="dialogo dialogo-ancho"
        onClick={(e) => e.target === e.currentTarget && e.currentTarget.close()}
      >
        <div className="flex flex-col gap-4 p-6">
          <div className="flex items-center justify-between gap-3">
            <h2 id={`${id}-titulo`} className="text-h2">
              {titulo}
            </h2>
            <button
              type="button"
              aria-label="Cerrar"
              onClick={() => dialogo()?.close()}
              className="flex size-11 items-center justify-center rounded-full text-muted transition-colors hover:bg-surface-2"
            >
              <Icono nombre="cruz" />
            </button>
          </div>
          {children}
        </div>
      </dialog>
    </>
  );
}
