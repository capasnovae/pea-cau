import { Badge } from "@/components/ui/badge";
import { esNuevaVersion, estaVencido } from "@/lib/dominio/contenido";

type Datos = {
  version?: number;
  updated_at?: string;
  vigente_hasta: string | null;
  alcance: "global" | "sede";
  estado?: "borrador" | "publicado" | "archivado";
};

export function BadgesContenido({ c }: { c: Datos }) {
  return (
    <span className="inline-flex flex-wrap gap-1">
      {c.estado && c.estado !== "publicado" && (
        <Badge className="border-transparent bg-background">{c.estado === "borrador" ? "Borrador" : "Archivado"}</Badge>
      )}
      {c.alcance === "sede" && <Badge className="border-primary/40 text-primary">De tu sede</Badge>}
      {c.version !== undefined && c.updated_at && esNuevaVersion(c.version, c.updated_at) && (
        <Badge className="border-transparent bg-primary text-primary-foreground">Nueva versión</Badge>
      )}
      {estaVencido(c.vigente_hasta) && <Badge className="border-destructive/50 text-destructive">Vencido</Badge>}
    </span>
  );
}
