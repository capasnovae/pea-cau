import { Card } from "@/components/ui/card";
import { requerirPerfil } from "@/lib/supabase/permisos";

const CONTACTOS = [
  { tema: "Dudas de cursos y exámenes", quien: "Tu coordinador (ejemplo)" },
  { tema: "Problemas para ingresar", quien: "Administración de PEA (ejemplo)" },
  { tema: "Contenido desactualizado", quien: "Coordinación de tu sede (ejemplo)" },
];

export default async function PaginaAyuda() {
  await requerirPerfil();
  return (
    <div className="flex flex-col gap-5">
      <h1 className="text-2xl font-extrabold md:text-[32px]">Ayuda</h1>
      <Card className="p-0!">
        <ul>
          {CONTACTOS.map((c) => (
            <li
              key={c.tema}
              className="flex flex-col gap-0.5 border-t border-border px-5 py-4 first:border-t-0 sm:flex-row sm:justify-between"
            >
              <span className="font-semibold">{c.tema}</span>
              <span className="text-sm text-muted">{c.quien}</span>
            </li>
          ))}
        </ul>
      </Card>
    </div>
  );
}
