import { redirect } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { normalizarCodigo } from "@/lib/dominio/certificados";

async function buscar(formData: FormData) {
  "use server";
  const codigo = normalizarCodigo(String(formData.get("codigo") ?? ""));
  redirect(codigo ? `/verificar/${encodeURIComponent(codigo)}` : "/verificar");
}

export default function PaginaBuscarCertificado() {
  return (
    <form action={buscar} className="flex flex-col gap-4 rounded-hoja bg-card p-6 shadow-2">
      <h1 className="text-h1">Verificar un certificado</h1>
      <label className="flex flex-col gap-1.5 text-sm font-semibold">
        Código
        <Input
          name="codigo"
          required
          maxLength={40}
          autoComplete="off"
          className="h-13 font-mono text-lg uppercase tracking-wider"
        />
      </label>
      <Button type="submit" tamano="lg">
        Verificar
      </Button>
    </form>
  );
}
