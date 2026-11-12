import Link from "next/link";
import { Logo } from "@/components/marca/logo";
import { BarraLateral } from "@/components/nav/barra-lateral";
import { Campana } from "@/components/nav/campana";
import { MenuPrincipal } from "@/components/nav/menu-principal";
import { PanelCuenta } from "@/components/nav/panel-cuenta";
import { menuPorRol } from "@/lib/dominio/roles";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

export default async function LayoutApp({ children }: LayoutProps<"/">) {
  const perfil = await requerirPerfil();
  const supabase = await crearClienteServidor();
  const [{ data: sinLeer }, { data: avisos }] = await Promise.all([
    supabase.rpc("mensajes_sin_leer"),
    supabase.rpc("alertas_sin_leer"),
  ]);
  const items = menuPorRol(perfil.rol);
  const cuenta = { nombre: perfil.nombre, apellido: perfil.apellido, rol: perfil.rol };
  return (
    <div className="flex min-h-full flex-1">
      <a
        href="#contenido"
        className="sr-only z-50 rounded-boton bg-primary px-4 py-3 font-bold text-primary-foreground focus:not-sr-only focus:fixed focus:left-3 focus:top-3"
      >
        Saltar al contenido
      </a>
      <BarraLateral
        items={items}
        sinLeer={sinLeer ?? 0}
        cuenta={<PanelCuenta perfil={cuenta} variante="lateral" />}
      />
      <div className="flex min-w-0 flex-1 flex-col">
        <header className="sticky top-0 z-10 flex h-14 items-center justify-between bg-background/80 px-4 backdrop-blur-md md:hidden">
          <Link href="/inicio" aria-label="PEA" className="flex min-h-11 items-center text-primary">
            <Logo tamano={28} />
          </Link>
          <div className="flex items-center gap-1">
            <Campana sinLeer={avisos ?? 0} />
            <PanelCuenta perfil={cuenta} variante="encabezado" />
          </div>
        </header>
        <div className="mx-auto hidden w-full max-w-6xl justify-end px-10 pt-4 md:flex">
          <Campana sinLeer={avisos ?? 0} />
        </div>
        <main
          id="contenido"
          tabIndex={-1}
          className="mx-auto outline-0 w-full max-w-6xl flex-1 px-4 pb-28 pt-2 md:px-10 md:pb-7 md:pt-2"
        >
          {children}
        </main>
      </div>
      <MenuPrincipal items={items} sinLeer={sinLeer ?? 0} />
    </div>
  );
}
