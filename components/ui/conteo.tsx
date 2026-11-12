"use client";

import { useEffect, useState } from "react";

/** Cuenta de 0 al valor al entrar. Sin movimiento (o sin JS) muestra el valor final directo. */
export function Conteo({ valor, sufijo = "", ms = 700 }: { valor: number; sufijo?: string; ms?: number }) {
  const [n, setN] = useState(valor);
  useEffect(() => {
    if (valor <= 0 || window.matchMedia("(prefers-reduced-motion: reduce)").matches) return;
    let cuadro = 0;
    const inicio = performance.now();
    const paso = (t: number) => {
      const k = Math.min(1, (t - inicio) / ms);
      setN(Math.round(valor * (1 - Math.pow(1 - k, 3))));
      if (k < 1) cuadro = requestAnimationFrame(paso);
    };
    cuadro = requestAnimationFrame(paso);
    return () => cancelAnimationFrame(cuadro);
  }, [valor, ms]);
  return (
    <span className="cifras" aria-label={`${valor}${sufijo}`}>
      <span aria-hidden="true">
        {n}
        {sufijo}
      </span>
    </span>
  );
}
