import Link from "next/link";
import {
  COLOR_ESTADO_CERT,
  ETIQUETA_ESTADO_CERT,
  normalizarCodigo,
  textoVencimiento,
  type EstadoCertificado,
} from "@/lib/dominio/certificados";
import { formatearFecha } from "@/lib/dominio/contenido";
import { crearClienteServidor } from "@/lib/supabase/servidor";
import { Icono } from "@/components/ui/icono";
import { cn } from "@/lib/utils/cn";

export default async function PaginaVerificar({ params }: PageProps<"/verificar/[codigo]">) {
  const { codigo } = await params;
  const limpio = normalizarCodigo(decodeURIComponent(codigo)).slice(0, 40);
  const supabase = await crearClienteServidor();
  const { data } = await supabase.rpc("verificar_certificado", { p_codigo: limpio }).maybeSingle();

  if (!data) {
    return (
      <section className="flex flex-col items-center gap-3 rounded-hoja bg-card p-8 text-center shadow-2">
        <span className="flex size-14 items-center justify-center rounded-full bg-destructive-soft text-destructive">
          <Icono nombre="cruz" tamano={32} />
        </span>
        <h1 className="text-h1">Código no encontrado</h1>
        <p className="font-mono text-muted">{limpio}</p>
        <Link href="/verificar" className="font-bold text-primary-strong">
          Probar otro código
        </Link>
      </section>
    );
  }
  const estado = data.estado as EstadoCertificado;
  return (
    <section
      aria-label="Certificado"
      className="flex flex-col items-center gap-3 rounded-hoja bg-card p-8 text-center shadow-2"
    >
      <span
        className={cn(
          "animate-pop flex size-20 items-center justify-center rounded-full",
          COLOR_ESTADO_CERT[estado],
        )}
      >
        <Icono
          nombre={estado === "vigente" ? "sello" : estado === "vencida" ? "reloj" : "cruz"}
          tamano={32}
        />
      </span>
      <span className={cn("rounded-full px-4 py-1.5 text-h3", COLOR_ESTADO_CERT[estado])}>
        {ETIQUETA_ESTADO_CERT[estado]}
      </span>
      <h1 className="text-h1">{data.nombre}</h1>
      <p className="text-lg font-semibold">
        Nivel {data.nivel} · {data.curso}
      </p>
      <p className="text-sm text-muted">
        Emitido el {formatearFecha(data.emitida_at)} · {textoVencimiento(data.vence_at)}
      </p>
      <p className="rounded-chip bg-surface-2 px-2 py-1 font-mono text-xs tracking-wider text-muted">
        {limpio}
      </p>
    </section>
  );
}
