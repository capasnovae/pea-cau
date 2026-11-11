"use client";

import Link from "next/link";
import { useState } from "react";
import { Icono } from "@/components/ui/icono";
import { cn } from "@/lib/utils/cn";

const OPCIONES = [
  {
    clave: "asesor",
    nombre: "Asesor",
    fondo: "var(--nivel-1-soft)",
    trazo: "var(--nivel-1)",
    icono: (
      <>
        <path d="M3 9l9-5 9 5-9 5-9-5z" />
        <path d="M7 11v5c3 2 7 2 10 0v-5" />
      </>
    ),
  },
  {
    clave: "coordinador",
    nombre: "Coordinador o líder",
    fondo: "var(--nivel-2-soft)",
    trazo: "var(--nivel-2)",
    icono: (
      <>
        <circle cx="9" cy="8" r="3" />
        <circle cx="17" cy="9" r="2.5" />
        <path d="M3 19c0-3 3-5 6-5s6 2 6 5M15 15c3 0 6 1.5 6 4" />
      </>
    ),
  },
  {
    clave: "director",
    nombre: "Director",
    fondo: "var(--nivel-3-soft)",
    trazo: "var(--nivel-3)",
    icono: (
      <>
        <path d="M4 20V9l8-5 8 5v11" />
        <path d="M9 20v-6h6v6" />
      </>
    ),
  },
] as const;

export function ElegirRol() {
  const [elegido, setElegido] = useState<string>("asesor");
  return (
    <>
      <div role="radiogroup" aria-label="Rol" className="flex max-w-xl flex-col gap-3">
        {OPCIONES.map((o) => (
          <label
            key={o.clave}
            className={cn(
              "relative flex cursor-pointer items-center gap-4 rounded-tarjeta border-2 bg-card px-5 py-4 transition active:scale-[0.99] has-focus-visible:outline-2 has-focus-visible:outline-offset-2 has-focus-visible:outline-ring",
              elegido === o.clave
                ? "border-primary bg-primary-soft shadow-2"
                : "border-border hover:border-border-control",
            )}
          >
            <input
              type="radio"
              name="rol"
              value={o.clave}
              checked={elegido === o.clave}
              onChange={() => setElegido(o.clave)}
              className="absolute inset-0 cursor-pointer opacity-0"
            />
            <span
              aria-hidden="true"
              className="flex size-12 shrink-0 items-center justify-center rounded-[14px]"
              style={{ background: o.fondo }}
            >
              <svg
                width="26"
                height="26"
                viewBox="0 0 24 24"
                fill="none"
                strokeWidth="1.8"
                style={{ stroke: o.trazo }}
              >
                {o.icono}
              </svg>
            </span>
            <span className="flex-1 text-h3">{o.nombre}</span>
            {elegido === o.clave && <Icono nombre="tilde" className="text-primary" />}
          </label>
        ))}
      </div>
      <Link
        href="/ingresar"
        className="flex min-h-13 w-full max-w-xl items-center justify-center gap-2 rounded-boton bg-primary px-7 text-base font-bold text-primary-foreground shadow-brand transition hover:bg-primary-strong active:scale-[0.98] md:w-fit md:min-w-48"
      >
        Ingresar
        <Icono nombre="flecha-der" />
      </Link>
    </>
  );
}
