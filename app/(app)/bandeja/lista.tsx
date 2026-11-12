import Link from "next/link";
import { ETIQUETA_FILTRO, FILTROS_BANDEJA, fechaCorta, type FiltroBandeja } from "@/lib/dominio/bandeja";
import { AvatarIniciales } from "@/components/ui/avatar";
import { Icono } from "@/components/ui/icono";
import { Vacio } from "@/components/ui/vacio";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { cn } from "@/lib/utils/cn";
import { SelectFiltro } from "./formularios";

export { AvatarIniciales } from "@/components/ui/avatar";

/** Barra superior, lista de conversaciones y panel derecho. En celular se ve la lista o la conversación, no las dos. */
export async function MarcoBandeja({
  filtro,
  actual,
  puedeAnunciar,
  children,
}: {
  filtro: FiltroBandeja;
  actual?: string;
  puedeAnunciar: boolean;
  children: React.ReactNode;
}) {
  const supabase = await crearClienteServidor();
  const { data } = await supabase.rpc("mi_bandeja", { p_filtro: filtro });
  const filas = data ?? [];
  const ahora = new Date();
  return (
    <div className="-mx-4 -mt-2 flex flex-col md:fixed md:inset-y-0 md:left-[92px] md:right-0 md:m-0 xl:left-[232px]">
      <div className="flex flex-wrap items-center gap-2.5 border-b border-border bg-card px-4 py-3 md:px-7 md:py-4">
        <h1 className="mr-2 text-h2 md:text-[26px]">Bandeja de entrada</h1>
        <SelectFiltro
          actual={filtro}
          opciones={FILTROS_BANDEJA.map((f) => ({ valor: f, etiqueta: ETIQUETA_FILTRO[f] }))}
        />
        <span className="flex-1" />
        {puedeAnunciar && (
          <Link
            href="/bandeja/nueva?anuncio=1"
            className="flex h-11 items-center rounded-boton border border-border-control px-3.5 text-sm font-bold text-primary-strong transition hover:bg-primary-soft active:scale-[0.97]"
          >
            Nuevo anuncio
          </Link>
        )}
        <Link
          href="/bandeja/nueva"
          className="flex h-11 items-center gap-1.5 rounded-boton bg-primary px-4 text-sm font-bold text-primary-foreground transition hover:bg-primary-strong active:scale-[0.97]"
        >
          <Icono nombre="lapiz" tamano={16} />
          Nuevo mensaje
        </Link>
      </div>
      <div className="flex min-h-0 flex-1">
        <section
          aria-label="Conversaciones"
          className={cn(
            "w-full overflow-y-auto bg-card md:w-[420px] md:shrink-0 md:border-r md:border-border",
            actual && "hidden md:block",
          )}
        >
          {filas.length === 0 ? (
            <Vacio icono="mensaje" texto="Sin conversaciones." />
          ) : (
            <ul>
              {filas.map((f) => (
                <li key={f.conversacion_id}>
                  <Link
                    href={`/bandeja/${f.conversacion_id}${filtro === "entrada" ? "" : `?filtro=${filtro}`}`}
                    aria-current={actual === f.conversacion_id ? "page" : undefined}
                    className={cn(
                      "flex items-start gap-3 border-b border-border px-4 py-3.5 transition-colors hover:bg-surface-2",
                      actual === f.conversacion_id && "bg-primary-soft",
                    )}
                  >
                    <span
                      className={cn(
                        "mt-4 size-2 shrink-0 rounded-full",
                        f.sin_leer ? "bg-primary" : "bg-transparent",
                      )}
                      aria-label={f.sin_leer ? "Sin leer" : undefined}
                    />
                    <AvatarIniciales nombre={f.participantes ?? ""} />
                    <span className="min-w-0 flex-1">
                      <span className="flex items-baseline justify-between gap-2">
                        <span
                          className={cn("truncate text-sm", f.sin_leer ? "font-extrabold" : "font-semibold")}
                        >
                          {f.participantes}
                          {f.es_anuncio && (
                            <span className="ml-1.5 rounded-chip bg-warning-soft px-1.5 py-0.5 text-[10px] font-extrabold text-warning">
                              ANUNCIO
                            </span>
                          )}
                        </span>
                        <span className="shrink-0 text-xs text-muted">
                          {fechaCorta(f.ultimo_mensaje_at, ahora)}
                        </span>
                      </span>
                      <span
                        className={cn("block truncate text-[13px]", f.sin_leer ? "font-bold" : "text-muted")}
                      >
                        {f.asunto}
                      </span>
                      <span className="block truncate text-xs text-muted">{f.ultimo_cuerpo}</span>
                    </span>
                  </Link>
                </li>
              ))}
            </ul>
          )}
        </section>
        <section className={cn("min-w-0 flex-1 flex-col", actual ? "flex" : "hidden md:flex")}>
          {children}
        </section>
      </div>
    </div>
  );
}
