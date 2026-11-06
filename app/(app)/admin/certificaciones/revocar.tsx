"use client";

import { useActionState } from "react";
import { revocar, type ResultadoRevocar } from "./acciones";

export function Revocar({ id }: { id: string }) {
  const [r, accion, pendiente] = useActionState<ResultadoRevocar, FormData>(revocar.bind(null, id), null);
  if (r?.ok)
    return (
      <span role="status" className="text-sm font-bold text-[#b91c1c]">
        {r.mensaje}
      </span>
    );
  return (
    <details className="relative">
      <summary className="cursor-pointer list-none rounded-xl border border-[#b91c1c] px-3 py-1.5 text-sm font-bold text-[#b91c1c] [&::-webkit-details-marker]:hidden">
        Revocar
      </summary>
      <form
        action={accion}
        className="absolute right-0 z-10 mt-2 flex w-72 flex-col gap-2 rounded-2xl bg-card p-4 shadow-lg"
      >
        <label className="flex flex-col gap-1.5 text-sm font-semibold">
          Motivo
          <input
            name="motivo"
            required
            maxLength={300}
            className="h-11 rounded-xl border border-border bg-card px-3 font-normal"
          />
        </label>
        {r && !r.ok && (
          <p role="alert" className="text-sm text-[#b91c1c]">
            {r.error}
          </p>
        )}
        <button
          type="submit"
          disabled={pendiente}
          className="min-h-11 rounded-xl bg-[#b91c1c] font-bold text-white"
        >
          Confirmar
        </button>
      </form>
    </details>
  );
}
