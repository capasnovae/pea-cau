"use client";

import { useEffect, useRef } from "react";

const COLORES = ["--nivel-1", "--nivel-2", "--nivel-3", "--nivel-4", "--gold"];

/** Confeti de una sola pasada con los colores de los niveles. No se dibuja si se pidió menos movimiento. */
export function Confeti({ piezas = 80, ms = 1800 }: { piezas?: number; ms?: number }) {
  const ref = useRef<HTMLCanvasElement>(null);
  useEffect(() => {
    const lienzo = ref.current;
    const ctx = lienzo?.getContext("2d");
    if (!lienzo || !ctx || window.matchMedia("(prefers-reduced-motion: reduce)").matches) return;
    const ancho = (lienzo.width = window.innerWidth);
    const alto = (lienzo.height = window.innerHeight);
    const estilo = getComputedStyle(document.documentElement);
    const colores = COLORES.map((c) => estilo.getPropertyValue(c).trim() || "#4f46e5");
    const p = Array.from({ length: piezas }, (_, i) => ({
      x: ancho / 2 + (Math.random() - 0.5) * ancho * 0.3,
      y: alto * 0.3,
      vx: (Math.random() - 0.5) * 9,
      vy: -Math.random() * 9 - 3,
      giro: Math.random() * Math.PI,
      vg: (Math.random() - 0.5) * 0.3,
      lado: 6 + Math.random() * 5,
      color: colores[i % colores.length]!,
    }));
    let cuadro = 0;
    const inicio = performance.now();
    const paso = (t: number) => {
      const k = (t - inicio) / ms;
      ctx.clearRect(0, 0, ancho, alto);
      if (k >= 1) return;
      ctx.globalAlpha = k > 0.7 ? (1 - k) / 0.3 : 1;
      for (const q of p) {
        q.vy += 0.25;
        q.vx *= 0.99;
        q.x += q.vx;
        q.y += q.vy;
        q.giro += q.vg;
        ctx.save();
        ctx.translate(q.x, q.y);
        ctx.rotate(q.giro);
        ctx.fillStyle = q.color;
        ctx.fillRect(-q.lado / 2, -q.lado / 4, q.lado, q.lado / 2);
        ctx.restore();
      }
      cuadro = requestAnimationFrame(paso);
    };
    cuadro = requestAnimationFrame(paso);
    return () => cancelAnimationFrame(cuadro);
  }, [piezas, ms]);
  return <canvas ref={ref} aria-hidden="true" className="pointer-events-none fixed inset-0 z-50 size-full" />;
}
