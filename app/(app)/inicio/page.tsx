import { Card } from "@/components/ui/card";
import { requerirPerfil } from "@/lib/supabase/permisos";

export default async function PaginaInicio() {
  const perfil = await requerirPerfil();
  return (
    <div className="flex flex-col gap-4">
      <h1 className="text-2xl font-semibold">Hola, {perfil.nombre}</h1>
      <Card>
        <p>Tu ruta de aprendizaje llega en la próxima etapa.</p>
      </Card>
    </div>
  );
}
