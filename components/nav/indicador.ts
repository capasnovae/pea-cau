"use client";

import { useLayoutEffect, useRef, useState } from "react";

type Caja = { x: number; y: number; ancho: number; alto: number };

/**
 * Mide el ítem activo (`aria-current="page"`) dentro de la lista para que un único indicador
 * se deslice hasta él. Mientras no hay medida, cada barra pinta el activo como antes.
 */
export function useIndicador<T extends HTMLElement>(clave: string) {
  const ref = useRef<T>(null);
  const [caja, setCaja] = useState<Caja | null>(null);
  useLayoutEffect(() => {
    const lista = ref.current;
    if (!lista) return;
    const medir = () => {
      const activo = lista.querySelector<HTMLElement>(
        '[aria-current="page"], [aria-selected="true"], [data-activo="true"]',
      );
      const li = activo?.closest("li") ?? activo;
      setCaja(
        li ? { x: li.offsetLeft, y: li.offsetTop, ancho: li.offsetWidth, alto: li.offsetHeight } : null,
      );
    };
    medir();
    if (typeof ResizeObserver === "undefined") return;
    const obs = new ResizeObserver(medir);
    obs.observe(lista);
    return () => obs.disconnect();
  }, [clave]);
  return { ref, caja };
}
