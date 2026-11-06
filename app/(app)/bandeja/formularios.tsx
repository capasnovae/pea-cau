"use client";

import { useRouter } from "next/navigation";
import { useActionState, useMemo, useState } from "react";
import { Campo } from "@/components/contenido/campos";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { enviarNuevo, publicarAnuncio, responder, type ResultadoBandeja } from "./acciones";

function MensajeError({ r }: { r: ResultadoBandeja }) {
  if (!r || r.ok) return null;
  return (
    <p role="alert" className="text-sm font-semibold text-destructive">
      {r.error}
    </p>
  );
}

const AREA = "w-full rounded-xl border border-border bg-card p-3 text-sm";

export function SelectFiltro({
  actual,
  opciones,
}: {
  actual: string;
  opciones: { valor: string; etiqueta: string }[];
}) {
  const router = useRouter();
  return (
    <Select
      aria-label="Filtro"
      value={actual}
      onChange={(e) =>
        router.push(e.target.value === "entrada" ? "/bandeja" : `/bandeja?filtro=${e.target.value}`)
      }
      className="h-10 w-auto!"
    >
      {opciones.map((o) => (
        <option key={o.valor} value={o.valor}>
          {o.etiqueta}
        </option>
      ))}
    </Select>
  );
}

type Contacto = { id: string; nombre: string; apellido: string; sede: string | null };

export function FormularioNuevo({ contactos, para }: { contactos: Contacto[]; para?: string }) {
  const [r, accion, pendiente] = useActionState<ResultadoBandeja, FormData>(enviarNuevo, null);
  const [buscar, setBuscar] = useState("");
  const grupos = useMemo(() => {
    const q = buscar.trim().toLowerCase();
    const m = new Map<string, Contacto[]>();
    for (const c of contactos) {
      if (q && !`${c.nombre} ${c.apellido}`.toLowerCase().includes(q)) continue;
      const g = c.sede ?? "Dirección";
      m.set(g, [...(m.get(g) ?? []), c]);
    }
    return [...m];
  }, [contactos, buscar]);
  return (
    <form action={accion} className="flex flex-col gap-4">
      <fieldset className="flex flex-col gap-2">
        <legend className="mb-1.5 text-sm font-semibold">Para</legend>
        <Input
          aria-label="Buscar personas"
          placeholder="Buscar…"
          value={buscar}
          onChange={(e) => setBuscar(e.target.value)}
        />
        <div className="max-h-64 overflow-y-auto rounded-xl border border-border p-2">
          {grupos.map(([sede, lista]) => (
            <div key={sede} className="py-1">
              <p className="px-2 py-1 text-xs font-bold uppercase text-muted">{sede}</p>
              {lista.map((c) => (
                <label
                  key={c.id}
                  className="flex min-h-11 cursor-pointer items-center gap-3 rounded-lg px-2 hover:bg-primary-soft"
                >
                  <input
                    type="checkbox"
                    name="para"
                    value={c.id}
                    defaultChecked={c.id === para}
                    className="size-4 accent-primary"
                  />
                  {c.nombre} {c.apellido}
                </label>
              ))}
            </div>
          ))}
        </div>
      </fieldset>
      <Campo id="msg-asunto" etiqueta="Asunto">
        <Input id="msg-asunto" name="asunto" required maxLength={150} />
      </Campo>
      <Campo id="msg-cuerpo" etiqueta="Mensaje">
        <textarea id="msg-cuerpo" name="cuerpo" required maxLength={5000} rows={6} className={AREA} />
      </Campo>
      <MensajeError r={r} />
      <Button type="submit" disabled={pendiente} className="w-fit">
        Enviar
      </Button>
    </form>
  );
}

export function FormularioAnuncio({
  sedes,
  permiteTodas,
}: {
  sedes: { id: string; nombre: string }[];
  permiteTodas: boolean;
}) {
  const [r, accion, pendiente] = useActionState<ResultadoBandeja, FormData>(publicarAnuncio, null);
  return (
    <form action={accion} className="flex flex-col gap-4">
      <Campo id="an-sede" etiqueta="Para">
        <Select id="an-sede" name="sede_id" defaultValue={permiteTodas ? "" : sedes[0]?.id}>
          {permiteTodas && <option value="">Todas las sedes</option>}
          {sedes.map((s) => (
            <option key={s.id} value={s.id}>
              {s.nombre}
            </option>
          ))}
        </Select>
      </Campo>
      <Campo id="an-asunto" etiqueta="Asunto">
        <Input id="an-asunto" name="asunto" required maxLength={150} />
      </Campo>
      <Campo id="an-cuerpo" etiqueta="Mensaje">
        <textarea id="an-cuerpo" name="cuerpo" required maxLength={5000} rows={6} className={AREA} />
      </Campo>
      <MensajeError r={r} />
      <Button type="submit" disabled={pendiente} className="w-fit">
        Publicar
      </Button>
    </form>
  );
}

export function FormularioRespuesta({ conversacion }: { conversacion: string }) {
  const [r, accion, pendiente] = useActionState<ResultadoBandeja, FormData>(async (prev, fd) => {
    const res = await responder(prev, fd);
    if (res?.ok) (document.getElementById("resp-cuerpo") as HTMLTextAreaElement | null)?.form?.reset();
    return res;
  }, null);
  return (
    <form action={accion} className="flex flex-col gap-2 border-t border-border bg-card p-4">
      <input type="hidden" name="conversacion" value={conversacion} />
      <label htmlFor="resp-cuerpo" className="sr-only">
        Respuesta
      </label>
      <textarea
        id="resp-cuerpo"
        name="cuerpo"
        required
        maxLength={5000}
        rows={3}
        placeholder="Escribí tu respuesta…"
        className={AREA}
      />
      <MensajeError r={r} />
      <Button type="submit" disabled={pendiente} className="w-fit self-end">
        Enviar
      </Button>
    </form>
  );
}
