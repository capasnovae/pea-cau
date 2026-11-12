import { Icono } from "@/components/ui/icono";
import Link from "next/link";
import { Markdown } from "@/components/markdown";
import { Card } from "@/components/ui/card";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function PaginaDerivaciones() {
  await requerirPerfil();
  const supabase = await crearClienteServidor();
  const { data: areas } = await supabase
    .from("areas_derivacion")
    .select("id, nombre, que_resuelve_md, que_no_resuelve_md, canal_contacto, plazo_esperado")
    .order("orden");
  return (
    <div className="flex flex-col gap-5">
      <div>
        <Link href="/organigrama" className="inline-flex items-center gap-1 text-sm text-primary">
          <Icono nombre="chevron-izq" tamano={16} />
          Organigrama
        </Link>
        <h1 className="mt-1 text-h1">Áreas de derivación</h1>
        <p className="text-sm text-muted">Qué resuelve cada área de Siglo y cómo contactarla.</p>
      </div>
      {(areas ?? []).length === 0 ? (
        <Card>
          <p className="text-sm">Todavía no se cargaron las áreas de derivación.</p>
        </Card>
      ) : (
        <ul className="flex flex-col gap-3">
          {(areas ?? []).map((a) => (
            <li key={a.id}>
              <Card className="flex flex-col gap-2">
                <h2 className="text-h2">{a.nombre}</h2>
                {a.que_resuelve_md && (
                  <div>
                    <h3 className="text-sm font-medium">Qué resuelve</h3>
                    <Markdown texto={a.que_resuelve_md} />
                  </div>
                )}
                {a.que_no_resuelve_md && (
                  <div>
                    <h3 className="text-sm font-medium">Qué no resuelve</h3>
                    <Markdown texto={a.que_no_resuelve_md} />
                  </div>
                )}
                <p className="text-sm text-muted">
                  {a.canal_contacto && <>Contacto: {a.canal_contacto}</>}
                  {a.canal_contacto && a.plazo_esperado && " · "}
                  {a.plazo_esperado && <>Plazo esperado: {a.plazo_esperado}</>}
                </p>
              </Card>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
