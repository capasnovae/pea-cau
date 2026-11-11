import Link from "next/link";
import { salir } from "@/app/(auth)/acciones";
import { ETIQUETA_ROL, type RolApp } from "@/lib/dominio/roles";
import { cn } from "@/lib/utils/cn";

export function Avatar({ nombre, className }: { nombre: string; className?: string }) {
  return (
    <span
      aria-hidden="true"
      className={cn(
        "flex size-8 items-center justify-center rounded-full bg-avatar font-extrabold text-avatar-fg",
        className,
      )}
    >
      {nombre.slice(0, 1).toUpperCase()}
    </span>
  );
}

/** Menú de cuenta: en PC se abre desde la barra lateral; en celular, desde el encabezado. */
export function PanelCuenta({
  perfil,
  variante,
}: {
  perfil: { nombre: string; apellido: string; rol: RolApp };
  variante: "lateral" | "encabezado";
}) {
  return (
    <>
      <button
        type="button"
        popoverTarget={`cuenta-${variante}`}
        className={cn(
          "flex cursor-pointer flex-col items-center justify-center gap-1",
          variante === "lateral"
            ? "w-full px-1 py-2.5 text-xs text-nav-fg hover:text-white"
            : "size-11 rounded-full",
        )}
      >
        <Avatar nombre={perfil.nombre} />
        {variante === "lateral" ? <span>Cuenta</span> : <span className="sr-only">Cuenta</span>}
      </button>
      <div
        id={`cuenta-${variante}`}
        popover="auto"
        className={cn(
          "menu-flotante w-60 rounded-tarjeta bg-card p-4 text-ink shadow-3",
          variante === "lateral" ? "left-[100px] top-14 origin-top-left" : "right-3 top-14 origin-top-right",
        )}
      >
        <div className="flex items-center gap-3">
          <Avatar nombre={perfil.nombre} className="size-11 text-lg" />
          <div className="min-w-0">
            <p className="truncate font-bold">
              {perfil.nombre} {perfil.apellido}
            </p>
            <p className="text-xs text-muted">{ETIQUETA_ROL[perfil.rol]}</p>
          </div>
        </div>
        <ul className="mt-3 flex flex-col gap-0.5 text-sm">
          <li>
            <Link href="/perfil" className="block rounded-lg px-2 py-2 font-semibold hover:bg-primary-soft">
              Mi perfil
            </Link>
          </li>
          <li>
            <Link
              href="/perfil#insignias"
              className="flex items-center justify-between rounded-lg px-2 py-2 font-semibold hover:bg-primary-soft"
            >
              Mis insignias
            </Link>
          </li>
          <li>
            <form action={salir}>
              <button
                type="submit"
                className="w-full rounded-lg px-2 py-2 text-left font-semibold hover:bg-primary-soft"
              >
                Salir
              </button>
            </form>
          </li>
        </ul>
      </div>
    </>
  );
}
