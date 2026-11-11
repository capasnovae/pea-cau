"use client";

import { useState, useTransition } from "react";
import { preferirAvisosEmail } from "@/app/(app)/avisos/acciones";

export function AvisosEmail({ inicial }: { inicial: boolean }) {
  const [activo, setActivo] = useState(inicial);
  const [pendiente, iniciar] = useTransition();
  return (
    <label className="flex min-h-11 cursor-pointer items-center justify-between gap-3 text-sm">
      <span className="font-semibold">Avisos por email</span>
      <span className="relative inline-flex h-7 w-12 shrink-0 items-center">
        <input
          type="checkbox"
          role="switch"
          className="peer absolute inset-0 cursor-pointer appearance-none rounded-full bg-border-control transition-colors checked:bg-primary disabled:opacity-60"
          checked={activo}
          disabled={pendiente}
          onChange={(e) => {
            const v = e.target.checked;
            setActivo(v);
            iniciar(() => preferirAvisosEmail(v));
          }}
        />
        <span
          aria-hidden="true"
          className="pointer-events-none relative ml-0.5 size-6 rounded-full bg-white shadow-1 transition-transform duration-(--dur-2) ease-salida peer-checked:translate-x-5"
        />
      </span>
    </label>
  );
}
