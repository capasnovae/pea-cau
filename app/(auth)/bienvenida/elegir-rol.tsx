"use client";

import Link from "next/link";
import { useState } from "react";
import { cn } from "@/lib/utils/cn";

const OPCIONES = [
  {
    clave: "asesor",
    nombre: "Asesor",
    fondo: "#eef2ff",
    trazo: "#4f46e5",
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
    fondo: "#f0fdfa",
    trazo: "#0f766e",
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
    fondo: "#fff7ed",
    trazo: "#c2410c",
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
              "flex cursor-pointer items-center gap-4 rounded-[18px] border-2 bg-card px-5 py-4",
              elegido === o.clave
                ? "border-primary shadow-[0_6px_18px_rgba(79,70,229,0.12)]"
                : "border-border",
            )}
          >
            <input
              type="radio"
              name="rol"
              value={o.clave}
              checked={elegido === o.clave}
              onChange={() => setElegido(o.clave)}
              className="size-[18px] accent-primary"
            />
            <span
              aria-hidden="true"
              className="flex size-12 shrink-0 items-center justify-center rounded-[14px]"
              style={{ background: o.fondo }}
            >
              <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke={o.trazo} strokeWidth="1.8">
                {o.icono}
              </svg>
            </span>
            <span className="text-[17px] font-extrabold">{o.nombre}</span>
          </label>
        ))}
      </div>
      <Link
        href="/ingresar"
        className="flex min-h-12 w-fit items-center rounded-[14px] bg-primary px-7 text-base font-extrabold text-white hover:bg-primary-strong"
      >
        Ingresar
      </Link>
    </>
  );
}
