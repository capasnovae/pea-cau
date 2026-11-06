"use client";

import { useState } from "react";
import { Input, Select } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

type Sede = { id: string; nombre: string };

export function Campo({
  id,
  etiqueta,
  children,
  ayuda,
}: {
  id: string;
  etiqueta: string;
  children: React.ReactNode;
  ayuda?: string;
}) {
  return (
    <div className="flex flex-col gap-1.5">
      <Label htmlFor={id}>{etiqueta}</Label>
      {children}
      {ayuda && <p className="text-xs text-muted">{ayuda}</p>}
    </div>
  );
}

export function CamposAlcance({
  alcances,
  sedes,
  alcance,
  sedeId,
  estado,
  prefijo = "",
}: {
  prefijo?: string;
  alcances: ("global" | "sede")[];
  sedes: Sede[];
  alcance?: "global" | "sede";
  sedeId?: string | null;
  estado?: string;
}) {
  const [actual, setActual] = useState(alcance ?? alcances[0] ?? "sede");
  return (
    <>
      <Campo id={`${prefijo}alcance`} etiqueta="¿Quién lo ve?">
        <Select
          id={`${prefijo}alcance`}
          name="alcance"
          value={actual}
          onChange={(e) => setActual(e.target.value as "global" | "sede")}
        >
          {alcances.includes("global") && <option value="global">Todos los CAU</option>}
          {alcances.includes("sede") && <option value="sede">Una sede</option>}
        </Select>
      </Campo>
      {actual === "sede" ? (
        <Campo id={`${prefijo}sede_id`} etiqueta="Sede">
          <Select
            id={`${prefijo}sede_id`}
            name="sede_id"
            defaultValue={sedeId ?? sedes[0]?.id ?? ""}
            required
          >
            {sedes.map((s) => (
              <option key={s.id} value={s.id}>
                {s.nombre}
              </option>
            ))}
          </Select>
        </Campo>
      ) : (
        <input type="hidden" name="sede_id" value="" />
      )}
      <Campo id={`${prefijo}estado`} etiqueta="Estado">
        <Select id={`${prefijo}estado`} name="estado" defaultValue={estado ?? "borrador"}>
          <option value="borrador">Borrador (solo lo ven los editores)</option>
          <option value="publicado">Publicado</option>
          <option value="archivado">Archivado</option>
        </Select>
      </Campo>
    </>
  );
}

export function CampoFecha({
  id,
  etiqueta,
  valor,
  prefijo = "",
}: {
  id: string;
  etiqueta: string;
  valor?: string | null;
  prefijo?: string;
}) {
  return (
    <Campo id={`${prefijo}${id}`} etiqueta={etiqueta}>
      <Input id={`${prefijo}${id}`} name={id} type="date" defaultValue={valor ?? ""} />
    </Campo>
  );
}

export function MensajeResultado({
  r,
}: {
  r: { ok: true; mensaje: string } | { ok: false; error: string } | null;
}) {
  if (!r) return null;
  return (
    <p role={r.ok ? "status" : "alert"} className={`text-sm ${r.ok ? "text-primary" : "text-destructive"}`}>
      {r.ok ? r.mensaje : r.error}
    </p>
  );
}
