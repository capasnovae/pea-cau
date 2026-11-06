import { Card, CardTitle } from "@/components/ui/card";
import { FormularioIngreso } from "./formulario";

export default async function PaginaIngresar({ searchParams }: PageProps<"/ingresar">) {
  const { motivo } = await searchParams;
  return (
    <Card>
      <CardTitle className="mb-5">Ingresá a PEA</CardTitle>
      <FormularioIngreso inactivo={motivo === "inactivo"} />
    </Card>
  );
}
