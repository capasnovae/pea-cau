import { Logo } from "@/components/marca/logo";

export default function LayoutAuth({ children }: LayoutProps<"/">) {
  return (
    <main className="mx-auto flex w-full max-w-sm flex-1 flex-col justify-center px-4 py-10">
      <p className="mb-6 flex flex-col items-center gap-2 text-primary">
        <Logo tamano={40} />
        <span className="text-caption font-semibold text-muted">Perfil Evolutivo de Asesor</span>
      </p>
      {children}
    </main>
  );
}
