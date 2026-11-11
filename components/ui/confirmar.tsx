"use client";

import { useId, type ReactNode } from "react";
import { Button } from "./button";

/**
 * Pregunta antes de una acción que no se deshace fácil. Usa <dialog>: el foco queda adentro,
 * Esc cierra y el fondo se atenúa, sin el cartel del navegador.
 */
export function Confirmar({
  titulo,
  detalle,
  confirmar,
  peligro = false,
  onConfirmar,
  children,
}: {
  titulo: string;
  detalle?: string;
  confirmar: string;
  peligro?: boolean;
  onConfirmar: () => void;
  children: (abrir: () => void) => ReactNode;
}) {
  const id = useId();
  const dialogo = () => document.getElementById(id) as HTMLDialogElement | null;
  return (
    <>
      {children(() => dialogo()?.showModal())}
      <dialog
        id={id}
        aria-labelledby={`${id}-titulo`}
        className="dialogo"
        onClick={(e) => e.target === e.currentTarget && e.currentTarget.close()}
      >
        <div className="flex flex-col gap-4 p-6">
          <h2 id={`${id}-titulo`} className="text-h2">
            {titulo}
          </h2>
          {detalle && <p className="text-sm text-muted">{detalle}</p>}
          <div className="flex flex-col-reverse gap-2 sm:flex-row sm:justify-end">
            <Button type="button" variante="secundario" onClick={() => dialogo()?.close()}>
              Cancelar
            </Button>
            <Button
              type="button"
              variante={peligro ? "peligro" : "primario"}
              onClick={() => {
                dialogo()?.close();
                onConfirmar();
              }}
            >
              {confirmar}
            </Button>
          </div>
        </div>
      </dialog>
    </>
  );
}
