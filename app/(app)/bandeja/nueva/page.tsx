import Link from "next/link";
import { notFound } from "next/navigation";
import { Card } from "@/components/ui/card";
import { puedeAnunciar } from "@/lib/dominio/bandeja";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { FormularioAnuncio, FormularioNuevo } from "../formularios";

export default async function PaginaNuevoMensaje({ searchParams }: PageProps<"/bandeja/nueva">) {
  const perfil = await requerirPerfil();
  const { anuncio, para } = await searchParams;
  const esAnuncio = anuncio === "1";
  if (esAnuncio && !puedeAnunciar(perfil.rol)) notFound();
  const supabase = await crearClienteServidor();

  return (
    <div className="mx-auto flex w-full max-w-2xl flex-col gap-4">
      <Link href="/bandeja" className="text-sm font-semibold text-primary-strong">
        ‹ Bandeja
      </Link>
      <h1 className="text-2xl font-extrabold">{esAnuncio ? "Nuevo anuncio" : "Nuevo mensaje"}</h1>
      <Card>
        {esAnuncio ? (
          <FormAnuncio rol={perfil.rol} sedeId={perfil.sede_id} />
        ) : (
          <FormularioNuevo
            contactos={(await supabase.rpc("contactos_bandeja")).data ?? []}
            para={typeof para === "string" ? para : undefined}
          />
        )}
      </Card>
    </div>
  );
}

async function FormAnuncio({ rol, sedeId }: { rol: string; sedeId: string | null }) {
  const supabase = await crearClienteServidor();
  const { data: sedes } = await supabase.from("sedes").select("id, nombre").order("nombre");
  const lista = rol === "coordinador" ? (sedes ?? []).filter((s) => s.id === sedeId) : (sedes ?? []);
  return <FormularioAnuncio sedes={lista} permiteTodas={rol !== "coordinador"} />;
}
