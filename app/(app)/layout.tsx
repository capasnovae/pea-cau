import Link from "next/link";
import { BarraLateral } from "@/components/nav/barra-lateral";
import { MenuPrincipal } from "@/components/nav/menu-principal";
import { PanelCuenta } from "@/components/nav/panel-cuenta";
import { menuPorRol } from "@/lib/dominio/roles";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function LayoutApp({ children }: LayoutProps<"/">) {
  const perfil = await requerirPerfil();
  const supabase = await crearClienteServidor();
  const { data: sinLeer } = await supabase.rpc("mensajes_sin_leer");
  const items = menuPorRol(perfil.rol);
  const cuenta = { nombre: perfil.nombre, apellido: perfil.apellido, rol: perfil.rol };
  return (
    <div className="flex min-h-full flex-1">
      <BarraLateral
        items={items}
        sinLeer={sinLeer ?? 0}
        cuenta={<PanelCuenta perfil={cuenta} variante="lateral" />}
      />
      <div className="flex min-w-0 flex-1 flex-col">
        <header className="flex h-14 items-center justify-between px-4 md:hidden">
          <Link href="/inicio" className="text-xl font-extrabold text-primary">
            PEA
          </Link>
          <PanelCuenta perfil={cuenta} variante="encabezado" />
        </header>
        <main className="mx-auto w-full max-w-6xl flex-1 px-4 pb-28 pt-2 md:px-10 md:py-7">{children}</main>
      </div>
      <MenuPrincipal items={items} sinLeer={sinLeer ?? 0} />
    </div>
  );
}
