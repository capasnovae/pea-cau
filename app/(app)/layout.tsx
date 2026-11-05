import { MenuPrincipal } from "@/components/nav/menu-principal";
import { Button } from "@/components/ui/button";
import { menuPorRol } from "@/lib/dominio/roles";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { salir } from "../(auth)/acciones";

export default async function LayoutApp({ children }: LayoutProps<"/">) {
  const perfil = await requerirPerfil();
  const items = menuPorRol(perfil.rol);
  return (
    <div className="flex min-h-full flex-1 flex-col">
      <header className="flex h-14 items-center justify-between border-b border-border bg-card px-4">
        <span className="font-semibold text-primary">PEA</span>
        <form action={salir} className="flex items-center gap-3">
          <span className="hidden text-sm text-muted sm:inline">{perfil.nombre}</span>
          <Button type="submit" variante="fantasma" className="h-9">
            Salir
          </Button>
        </form>
      </header>
      <div className="flex flex-1">
        <MenuPrincipal items={items} variante="lateral" />
        <main className="mx-auto w-full max-w-4xl flex-1 px-4 pb-24 pt-6 md:pb-10">{children}</main>
      </div>
      <MenuPrincipal items={items} variante="inferior" />
    </div>
  );
}
