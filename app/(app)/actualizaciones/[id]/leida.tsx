"use client";

import { useTransition } from "react";
import { marcarLeida } from "../acciones";

export function BotonLeida({ id }: { id: string }) {
  const [pendiente, iniciar] = useTransition();
  return (
    <button
      type="button"
      disabled={pendiente}
      onClick={() => iniciar(async () => void (await marcarLeida(id)))}
      className="min-h-12 rounded-2xl bg-primary px-5 font-bold text-primary-foreground disabled:opacity-60"
    >
      {pendiente ? "Guardando…" : "Ya lo leí"}
    </button>
  );
}
