"use client";

import { useState, useTransition } from "react";
import { preferirAvisosEmail } from "@/app/(app)/avisos/acciones";

export function AvisosEmail({ inicial }: { inicial: boolean }) {
  const [activo, setActivo] = useState(inicial);
  const [pendiente, iniciar] = useTransition();
  return (
    <label className="flex items-center justify-between gap-3 text-sm">
      <span className="font-semibold">Avisos por email</span>
      <input
        type="checkbox"
        role="switch"
        className="size-5 accent-[var(--color-primary)]"
        checked={activo}
        disabled={pendiente}
        onChange={(e) => {
          const v = e.target.checked;
          setActivo(v);
          iniciar(() => preferirAvisosEmail(v));
        }}
      />
    </label>
  );
}
