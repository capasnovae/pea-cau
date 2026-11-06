import { parseFiltro, puedeAnunciar } from "@/lib/dominio/bandeja";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { MarcoBandeja } from "./lista";

export default async function PaginaBandeja({ searchParams }: PageProps<"/bandeja">) {
  const perfil = await requerirPerfil();
  const { filtro } = await searchParams;
  return (
    <MarcoBandeja
      filtro={parseFiltro(typeof filtro === "string" ? filtro : undefined)}
      puedeAnunciar={puedeAnunciar(perfil.rol)}
    >
      <div className="flex flex-1 flex-col items-center justify-center gap-4 p-10 text-muted">
        <span
          aria-hidden="true"
          className="flex size-24 items-center justify-center rounded-full bg-primary-soft text-primary"
        >
          <svg width="44" height="44" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6">
            <path d="M4 13l3-8h10l3 8v6H4z" />
            <path d="M4 13h5l1 2h4l1-2h5" />
          </svg>
        </span>
        <p className="text-lg font-extrabold text-ink">Ninguna conversación abierta</p>
      </div>
    </MarcoBandeja>
  );
}
