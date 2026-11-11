import { redirect } from "next/navigation";
import { normalizarCodigo } from "@/lib/dominio/certificados";

async function buscar(formData: FormData) {
  "use server";
  const codigo = normalizarCodigo(String(formData.get("codigo") ?? ""));
  redirect(codigo ? `/verificar/${encodeURIComponent(codigo)}` : "/verificar");
}

export default function PaginaBuscarCertificado() {
  return (
    <form action={buscar} className="flex flex-col gap-3 rounded-3xl bg-card p-6 shadow-1">
      <h1 className="text-h1">Verificar un certificado</h1>
      <label className="flex flex-col gap-1.5 text-sm font-semibold">
        Código
        <input
          name="codigo"
          required
          maxLength={40}
          autoComplete="off"
          className="h-12 rounded-xl border border-border bg-card px-3 font-mono text-lg uppercase"
        />
      </label>
      <button type="submit" className="min-h-12 rounded-2xl bg-primary font-extrabold text-white">
        Verificar
      </button>
    </form>
  );
}
