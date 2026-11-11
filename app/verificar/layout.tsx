import Link from "next/link";
import { Logo } from "@/components/marca/logo";

export default function LayoutVerificar({ children }: LayoutProps<"/verificar">) {
  return (
    <div className="flex min-h-dvh flex-1 flex-col bg-background">
      <header className="sobre-oscuro flex h-16 items-center bg-nav px-5">
        <Link href="/" aria-label="PEA" className="flex min-h-11 items-center text-white">
          <Logo tamano={28} />
        </Link>
        <span className="ml-3 text-sm text-nav-fg-muted">Verificación de certificados</span>
      </header>
      <main className="mx-auto flex w-full max-w-lg flex-1 flex-col justify-center gap-4 px-4 py-10">
        {children}
      </main>
    </div>
  );
}
