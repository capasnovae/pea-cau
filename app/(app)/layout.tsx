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
      <header className="flex h-16 items-center justify-between px-4 md:px-6">
        <div className="flex items-center gap-4">
          <span className="text-xl font-extrabold text-primary">PEA</span>
          <form action="/buscar" role="search" className="hidden sm:block">
            <input
              name="q"
              aria-label="Buscar en PEA"
              placeholder="Buscar…"
              className="h-10 w-64 rounded-xl border border-border bg-card px-3 text-sm"
            />
          </form>
        </div>
        <form action={salir} className="flex items-center gap-3">
          <span className="hidden text-sm text-muted sm:inline">{perfil.nombre}</span>
          <Button type="submit" variante="fantasma" className="h-9">
            Salir
          </Button>
        </form>
      </header>
      <div className="flex flex-1">
        <MenuPrincipal items={items} variante="lateral" />
        <main className="mx-auto w-full max-w-5xl flex-1 px-4 pb-28 pt-2 md:pb-10 md:pt-4">{children}</main>
      </div>
      <MenuPrincipal items={items} variante="inferior" maxInferior={4} />
    </div>
  );
}
