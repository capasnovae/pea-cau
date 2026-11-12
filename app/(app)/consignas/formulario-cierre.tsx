"use client";

import { Icono } from "@/components/ui/icono";
import { startTransition, useActionState, useState, useTransition } from "react";
import { MensajeResultado } from "@/components/contenido/campos";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { crearClienteNavegador } from "@/lib/supabase/navegador";
import {
  actualizarAsignacion,
  confirmarLectura,
  prepararEvidencia,
  type ResultadoAsignacion,
} from "./acciones";

export function BotonLeido({ asignacionId, leida }: { asignacionId: string; leida: boolean }) {
  const [pendiente, iniciar] = useTransition();
  const [r, setR] = useState<ResultadoAsignacion>(null);
  if (leida)
    return (
      <p className="inline-flex items-center gap-1 text-sm font-semibold text-success">
        <Icono nombre="tilde" tamano={16} />
        Lectura confirmada
      </p>
    );
  return (
    <div className="flex flex-col items-start gap-1">
      <Button
        type="button"
        variante="secundario"
        className="h-9"
        disabled={pendiente}
        onClick={() => iniciar(async () => setR(await confirmarLectura(asignacionId)))}
      >
        Ya lo leí
      </Button>
      <MensajeResultado r={r} />
    </div>
  );
}

export function FormularioCierre({
  asignacionId,
  estado,
  comentario,
  requiereEvidencia,
  tieneEvidencia,
}: {
  asignacionId: string;
  estado: string;
  comentario: string | null;
  requiereEvidencia: boolean;
  tieneEvidencia: boolean;
}) {
  const [r, accion, pendiente] = useActionState<ResultadoAsignacion, FormData>(actualizarAsignacion, null);
  const [errorSubida, setErrorSubida] = useState<string | null>(null);
  const [subiendo, setSubiendo] = useState(false);
  const p = (k: string) => `${k}-${asignacionId}`;

  async function enviar(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const boton = (e.nativeEvent as SubmitEvent).submitter as HTMLButtonElement | null;
    const formData = new FormData(e.currentTarget);
    formData.set("estado", boton?.value ?? "hecha");
    const archivo = formData.get("evidencia");
    formData.delete("evidencia");
    if (archivo instanceof File && archivo.size > 0) {
      setSubiendo(true);
      setErrorSubida(null);
      const prep = await prepararEvidencia({
        asignacionId,
        nombre: archivo.name,
        tamano: archivo.size,
        tipoMime: archivo.type,
      });
      if (!prep.ok) {
        setSubiendo(false);
        setErrorSubida(prep.error);
        return;
      }
      const { error } = await crearClienteNavegador()
        .storage.from("evidencias")
        .uploadToSignedUrl(prep.path, prep.token, archivo, { contentType: archivo.type });
      setSubiendo(false);
      if (error) {
        setErrorSubida("No pudimos subir la evidencia. Probá de nuevo.");
        return;
      }
      formData.set("evidencia_path", prep.path);
    }
    startTransition(() => accion(formData));
  }

  return (
    <form onSubmit={enviar} className="flex flex-col gap-3 border-t border-border pt-3">
      <input type="hidden" name="id" value={asignacionId} />
      <div className="flex flex-col gap-1.5">
        <Label htmlFor={p("comentario")}>Comentario (opcional)</Label>
        <Input id={p("comentario")} name="comentario" maxLength={1000} defaultValue={comentario ?? ""} />
      </div>
      <div className="flex flex-col gap-1.5">
        <Label htmlFor={p("evidencia")}>
          Evidencia {requiereEvidencia ? "(obligatoria)" : "(opcional)"}
          {tieneEvidencia && <span className="ml-1 font-normal text-primary">· ya subiste una</span>}
        </Label>
        <Input
          id={p("evidencia")}
          name="evidencia"
          type="file"
          accept=".png,.jpg,.jpeg,.webp,.pdf"
          className="h-auto py-2"
        />
      </div>
      {errorSubida && (
        <p role="alert" className="text-sm text-destructive">
          {errorSubida}
        </p>
      )}
      <MensajeResultado r={r} />
      <div className="flex flex-wrap gap-2">
        {estado === "pendiente" && (
          <Button
            type="submit"
            name="estado"
            value="en_curso"
            variante="secundario"
            disabled={pendiente || subiendo}
          >
            La estoy haciendo
          </Button>
        )}
        <Button type="submit" name="estado" value="hecha" disabled={pendiente || subiendo}>
          {subiendo ? "Subiendo…" : "Marcar como hecha"}
        </Button>
      </div>
    </form>
  );
}
