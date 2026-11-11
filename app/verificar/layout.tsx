import Link from "next/link";

export default function LayoutVerificar({ children }: LayoutProps<"/verificar">) {
  return (
    <div className="flex min-h-dvh flex-1 flex-col bg-background">
      <header className="sobre-oscuro flex h-16 items-center bg-nav px-5">
        <Link href="/" className="text-xl font-extrabold text-white">
          PEA
        </Link>
        <span className="ml-2 text-sm text-nav-fg-muted">Verificación de certificados</span>
      </header>
      <main className="mx-auto flex w-full max-w-lg flex-1 flex-col justify-center gap-4 px-4 py-10">
        {children}
      </main>
    </div>
  );
}
