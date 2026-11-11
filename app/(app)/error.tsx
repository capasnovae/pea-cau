"use client";

import { useEffect } from "react";
import { AvisoPagina } from "@/components/ui/aviso-pagina";

export default function ErrorApp({
  error,
  retry,
  reset,
}: {
  error: unknown;
  retry?: () => void;
  reset?: () => void;
}) {
  useEffect(() => {
    console.error(error);
  }, [error]);
  const reintentar = retry ?? reset;
  return (
    <AvisoPagina titulo="Algo salió mal">
      {reintentar && (
        <button
          type="button"
          onClick={() => reintentar()}
          className="min-h-12 rounded-2xl border-2 border-primary px-5 font-bold text-primary-strong"
        >
          Reintentar
        </button>
      )}
    </AvisoPagina>
  );
}
