export default function LayoutAuth({ children }: LayoutProps<"/">) {
  return (
    <main className="mx-auto flex w-full max-w-sm flex-1 flex-col justify-center px-4 py-10">
      <p className="mb-6 text-center text-sm font-extrabold tracking-wide text-primary">
        PEA · Perfil Evolutivo de Asesor
      </p>
      {children}
    </main>
  );
}
