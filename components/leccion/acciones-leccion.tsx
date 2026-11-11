"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { useEffect, useRef, useState, useTransition } from "react";
import { marcarItem } from "@/app/(app)/estudiar/acciones";
import { Icono } from "@/components/ui/icono";

/** Marca "visto" al abrir un ítem disponible de requisito ver. */
export function MarcarVisto({ itemId }: { itemId: string }) {
  const hecho = useRef(false);
  const router = useRouter();
  useEffect(() => {
    if (hecho.current) return;
    hecho.current = true;
    marcarItem(itemId, "visto").then((r) => {
      if (r.ok) router.refresh();
    });
  }, [itemId, router]);
  return null;
}

export function BarraSiguiente({
  itemId,
  requisito,
  cumplido,
  siguienteHref,
  color,
}: {
  itemId: string;
  requisito: string;
  cumplido: boolean;
  siguienteHref: string;
  color: string;
}) {
  const router = useRouter();
  const [pendiente, iniciar] = useTransition();
  const [error, setError] = useState<string | null>(null);
  const necesitaMarcar = requisito === "marcar_hecho" && !cumplido;
  return (
    <div>
      {error && (
        <p role="alert" className="mb-2 rounded-xl bg-warning-soft p-3 text-sm font-semibold text-warning">
          {error}
        </p>
      )}
      {necesitaMarcar ? (
        <button
          type="button"
          disabled={pendiente}
          className="flex min-h-14 w-full items-center justify-center gap-2 rounded-boton text-base font-bold text-white shadow-2 transition active:scale-[0.98] disabled:opacity-60"
          style={{ background: color }}
          onClick={() =>
            iniciar(async () => {
              const r = await marcarItem(itemId, "hecho");
              if (r.ok) router.push(siguienteHref);
              else setError(r.error);
            })
          }
        >
          {pendiente ? "Guardando…" : "Listo, siguiente"}
        </button>
      ) : (
        <Link
          href={siguienteHref}
          className="flex min-h-14 w-full items-center justify-center gap-2 rounded-boton text-base font-bold text-white shadow-2 transition active:scale-[0.98]"
          style={{ background: color }}
        >
          Siguiente
          <Icono nombre="flecha-der" />
        </Link>
      )}
    </div>
  );
}
