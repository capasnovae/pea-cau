import Link from "next/link";

/** Pantalla breve para "no encontrado" y errores: un título y una salida. */
export function AvisoPagina({ titulo, children }: { titulo: string; children?: React.ReactNode }) {
  return (
    <div className="mx-auto flex min-h-[50vh] max-w-md flex-col items-center justify-center gap-4 px-4 text-center">
      <h1 className="text-2xl font-extrabold">{titulo}</h1>
      <div className="flex flex-wrap justify-center gap-3">
        {children}
        <Link
          href="/inicio"
          className="inline-flex min-h-12 items-center rounded-2xl bg-primary px-5 font-bold text-white"
        >
          Ir al inicio
        </Link>
      </div>
    </div>
  );
}
