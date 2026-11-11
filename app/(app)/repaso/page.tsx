import Link from "next/link";
import { Practica } from "@/app/(app)/estudiar/[curso]/[item]/practica";
import { Card } from "@/components/ui/card";
import { textoRacha } from "@/lib/dominio/repaso";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function PaginaRepaso() {
  await requerirPerfil();
  const supabase = await crearClienteServidor();
  const [{ data: preguntas }, { data: resumen }] = await Promise.all([
    supabase.rpc("repaso_de_hoy"),
    supabase.rpc("mi_repaso").maybeSingle(),
  ]);
  const racha = textoRacha(resumen?.racha ?? 0);
  const lista = preguntas ?? [];
  return (
    <div className="mx-auto flex w-full max-w-2xl flex-col gap-4">
      <div className="flex items-baseline justify-between gap-3">
        <h1 className="text-h1">Repaso de hoy</h1>
        {racha && (
          <span className="rounded-full bg-warning-soft px-3 py-1 text-sm font-bold text-warning">
            {racha}
          </span>
        )}
      </div>
      {lista.length === 0 ? (
        <Card className="flex flex-col items-start gap-3">
          <p role="status" className="text-lg font-extrabold">
            {(resumen?.hechas_hoy ?? 0) > 0 ? "Listo por hoy" : "Nada para repasar hoy"}
          </p>
          <Link href="/estudiar" className="font-semibold text-primary-strong">
            Seguir estudiando →
          </Link>
        </Card>
      ) : (
        <Card>
          <Practica
            key={lista.map((p) => p.pregunta_id).join()}
            origen={{ tipo: "repaso" }}
            preguntas={lista as unknown as Parameters<typeof Practica>[0]["preguntas"]}
          />
        </Card>
      )}
    </div>
  );
}
