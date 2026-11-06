import { ROLES_GESTION } from "@/lib/dominio/roles";
import { requerirRol } from "@/lib/supabase/permisos";
import { PestanasEquipo } from "./pestanas";

export default async function LayoutEquipo({ children }: LayoutProps<"/equipo">) {
  const perfil = await requerirRol([...ROLES_GESTION]);
  return (
    <div className="flex flex-col gap-5">
      <PestanasEquipo conUbicacion={perfil.rol !== "lider"} />
      {children}
    </div>
  );
}
