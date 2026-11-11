"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { useEffect, useRef } from "react";
import type { ItemMenu } from "@/lib/dominio/roles";
import { cn } from "@/lib/utils/cn";
import { Contador, esActivo } from "./barra-lateral";
import { IconoNav } from "./iconos";
import { useIndicador } from "./indicador";

/** Píldora inferior en celular: los primeros 4 ítems y "Más", que abre una hoja con el resto. */
export function MenuPrincipal({
  items,
  sinLeer,
  maxInferior = 4,
}: {
  items: ItemMenu[];
  sinLeer: number;
  maxInferior?: number;
}) {
  const ruta = usePathname();
  const visibles = items.length > maxInferior + 1 ? items.slice(0, maxInferior) : items;
  const resto = items.length > maxInferior + 1 ? items.slice(maxInferior) : [];
  const restoActivo = resto.some((i) => esActivo(ruta, i.href));
  const { ref, caja } = useIndicador<HTMLUListElement>(ruta);
  const hoja = useRef<HTMLDialogElement>(null);
  // Al navegar, la hoja se cierra sola
  useEffect(() => hoja.current?.close(), [ruta]);
  const clase = (activo: boolean) =>
    cn(
      "relative flex min-h-14 w-full flex-col items-center justify-center gap-0.5 px-1 text-[11px] transition-colors",
      activo ? "font-bold text-white" : "text-nav-fg-muted",
    );
  return (
    <>
      <nav
        aria-label="Principal"
        className="sobre-oscuro fixed inset-x-3 bottom-3 z-10 rounded-tarjeta bg-ink shadow-3 md:hidden"
      >
        <ul ref={ref} className="relative flex">
          {caja && (
            <li
              aria-hidden="true"
              className="pointer-events-none absolute left-0 top-1.5 rounded-boton bg-white/12 transition-transform duration-(--dur-3) ease-salida"
              style={{
                width: caja.ancho - 12,
                height: caja.alto - 12,
                transform: `translateX(${caja.x + 6}px)`,
              }}
            />
          )}
          {visibles.map((i) => {
            const activo = esActivo(ruta, i.href);
            return (
              <li key={i.href} className="flex-1">
                <Link href={i.href} aria-current={activo ? "page" : undefined} className={clase(activo)}>
                  <IconoNav icono={i.icono} tamano={20} />
                  <span className="flex items-center">
                    {i.etiqueta}
                    {i.icono === "bandeja" && <Contador n={sinLeer} />}
                  </span>
                </Link>
              </li>
            );
          })}
          {resto.length > 0 && (
            <li className="flex-1">
              <button
                type="button"
                aria-haspopup="dialog"
                data-activo={restoActivo}
                onClick={() => hoja.current?.showModal()}
                className={clase(restoActivo)}
              >
                <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                  <circle cx="5" cy="12" r="2" />
                  <circle cx="12" cy="12" r="2" />
                  <circle cx="19" cy="12" r="2" />
                </svg>
                Más
              </button>
            </li>
          )}
        </ul>
      </nav>
      {resto.length > 0 && (
        <dialog
          ref={hoja}
          aria-label="Más secciones"
          className="hoja md:hidden"
          onClick={(e) => e.target === e.currentTarget && e.currentTarget.close()}
        >
          <div className="px-4 pb-6 pt-3">
            <span aria-hidden="true" className="mx-auto mb-4 block h-1 w-10 rounded-full bg-border" />
            <ul className="grid grid-cols-3 gap-2">
              {resto.map((i) => {
                const activo = esActivo(ruta, i.href);
                return (
                  <li key={i.href}>
                    <Link
                      href={i.href}
                      aria-current={activo ? "page" : undefined}
                      className={cn(
                        "flex min-h-20 flex-col items-center justify-center gap-1.5 rounded-boton px-1 text-center text-caption font-semibold transition active:scale-95",
                        activo ? "bg-primary-soft text-primary-strong" : "bg-surface-2 text-ink",
                      )}
                    >
                      <IconoNav icono={i.icono} tamano={22} />
                      {i.etiqueta}
                    </Link>
                  </li>
                );
              })}
            </ul>
          </div>
        </dialog>
      )}
    </>
  );
}
