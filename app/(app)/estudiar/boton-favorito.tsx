"use client";

import { useState, useTransition } from "react";
import { alternarFavorito } from "./acciones";

export function BotonFavorito({ cursoId, inicial }: { cursoId: string; inicial: boolean }) {
  const [favorito, setFavorito] = useState(inicial);
  const [pendiente, iniciar] = useTransition();
  return (
    <button
      type="button"
      aria-label={favorito ? "Quitar de favoritos" : "Marcar como favorito"}
      aria-pressed={favorito}
      disabled={pendiente}
      onClick={() =>
        iniciar(async () => {
          const r = await alternarFavorito(cursoId);
          if (r.ok) setFavorito(r.favorito);
        })
      }
      className={`flex size-11 items-center justify-center rounded-xl text-xl hover:bg-primary-soft ${favorito ? "text-gold" : "text-border-control"}`}
    >
      {favorito ? "★" : "☆"}
    </button>
  );
}
