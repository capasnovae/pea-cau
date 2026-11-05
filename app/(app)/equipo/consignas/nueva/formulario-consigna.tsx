"use client";

import { useActionState, useMemo, useState } from "react";
import { Campo, MensajeResultado } from "@/components/contenido/campos";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { ETIQUETA_DESTINO, ETIQUETA_PRIORIDAD, ETIQUETA_RECURRENCIA, type DestinoConsigna } from "@/lib/dominio/consignas";
import { crearConsigna, type ResultadoConsigna } from "../acciones";

type Opcion = { id: string; nombre: string };
export type PersonaDestino = { id: string; nombre: string; sede_id: string };
export type EquipoDestino = { id: string; nombre: string; sede_id: string };

export function FormularioConsigna({
  destinos,
  sedes,
  sedeFija,
  personas,
  equipos,
  subroles,
  articulos,
}: {
  destinos: DestinoConsigna[];
  sedes: Opcion[];
  sedeFija: string | null;
  personas: PersonaDestino[];
  equipos: EquipoDestino[];
  subroles: Opcion[];
  articulos: Opcion[];
}) {
  const [r, accion, pendiente] = useActionState<ResultadoConsigna, FormData>(crearConsigna, null);
  const [tipo, setTipo] = useState<"tarea" | "lectura">("tarea");
  const [destino, setDestino] = useState<DestinoConsigna>(destinos[0] ?? "usuario");
  const [sede, setSede] = useState(sedeFija ?? sedes[0]?.id ?? "");
  const [recurrencia, setRecurrencia] = useState("ninguna");
  const personasSede = useMemo(() => personas.filter((p) => p.sede_id === sede), [personas, sede]);
  const equiposSede = useMemo(() => equipos.filter((e) => e.sede_id === sede), [equipos, sede]);

  return (
    <form action={accion} className="flex flex-col gap-4">
      <Campo id="titulo" etiqueta="Título">
        <Input id="titulo" name="titulo" required maxLength={160} placeholder="Ej.: Llamar a la base de reinscripción" />
      </Campo>
      <Campo id="detalle_md" etiqueta="Detalle (opcional)">
        <textarea id="detalle_md" name="detalle_md" rows={4} maxLength={5000} className="w-full rounded-lg border border-border bg-card p-3 text-sm" />
      </Campo>
      <div className="grid gap-4 sm:grid-cols-2">
        <Campo id="tipo" etiqueta="Tipo">
          <Select id="tipo" name="tipo" value={tipo} onChange={(e) => setTipo(e.target.value as "tarea" | "lectura")}>
            <option value="tarea">Tarea</option>
            <option value="lectura">Lectura obligatoria</option>
          </Select>
        </Campo>
        {tipo === "lectura" && (
          <Campo id="articulo_id" etiqueta="Artículo a leer">
            <Select id="articulo_id" name="articulo_id" required defaultValue="">
              <option value="" disabled>Elegí un artículo</option>
              {articulos.map((a) => <option key={a.id} value={a.id}>{a.nombre}</option>)}
            </Select>
          </Campo>
        )}
      </div>
      <div className="grid gap-4 sm:grid-cols-2">
        {sedeFija ? (
          <input type="hidden" name="sede_id" value={sedeFija} />
        ) : (
          <Campo id="sede_id" etiqueta="Sede">
            <Select id="sede_id" name="sede_id" value={sede} onChange={(e) => setSede(e.target.value)}>
              {sedes.map((s) => <option key={s.id} value={s.id}>{s.nombre}</option>)}
            </Select>
          </Campo>
        )}
        <Campo id="destino" etiqueta="¿Para quién?">
          <Select id="destino" name="destino" value={destino} onChange={(e) => setDestino(e.target.value as DestinoConsigna)}>
            {destinos.map((d) => <option key={d} value={d}>{ETIQUETA_DESTINO[d]}</option>)}
          </Select>
        </Campo>
        {destino === "usuario" && (
          <Campo id="destino_usuario_id" etiqueta="Persona">
            <Select id="destino_usuario_id" name="destino_usuario_id" required defaultValue="" key={sede}>
              <option value="" disabled>Elegí a alguien</option>
              {personasSede.map((p) => <option key={p.id} value={p.id}>{p.nombre}</option>)}
            </Select>
          </Campo>
        )}
        {destino === "equipo" && (
          <Campo id="destino_equipo_id" etiqueta="Equipo">
            <Select id="destino_equipo_id" name="destino_equipo_id" required defaultValue={equiposSede[0]?.id ?? ""} key={sede}>
              {equiposSede.map((e) => <option key={e.id} value={e.id}>{e.nombre}</option>)}
            </Select>
          </Campo>
        )}
        {destino === "subrol" && (
          <Campo id="destino_subrol_id" etiqueta="Subrol">
            <Select id="destino_subrol_id" name="destino_subrol_id" required defaultValue={subroles[0]?.id ?? ""}>
              {subroles.map((s) => <option key={s.id} value={s.id}>{s.nombre}</option>)}
            </Select>
          </Campo>
        )}
      </div>
      <div className="grid gap-4 sm:grid-cols-3">
        <Campo id="recurrencia" etiqueta="¿Se repite?">
          <Select id="recurrencia" name="recurrencia" value={recurrencia} onChange={(e) => setRecurrencia(e.target.value)}>
            {Object.entries(ETIQUETA_RECURRENCIA).map(([v, e]) => <option key={v} value={v}>{e}</option>)}
          </Select>
        </Campo>
        {recurrencia === "ninguna" && (
          <Campo id="fecha_limite" etiqueta="Fecha límite (opcional)">
            <Input id="fecha_limite" name="fecha_limite" type="date" />
          </Campo>
        )}
        <Campo id="prioridad" etiqueta="Prioridad">
          <Select id="prioridad" name="prioridad" defaultValue="normal">
            {Object.entries(ETIQUETA_PRIORIDAD).map(([v, e]) => <option key={v} value={v}>{e}</option>)}
          </Select>
        </Campo>
      </div>
      <label className="flex items-center gap-2 text-sm">
        <input type="checkbox" name="requiere_evidencia" className="size-4" />
        Pedir evidencia para cerrarla (foto o PDF)
      </label>
      <MensajeResultado r={r} />
      <Button type="submit" disabled={pendiente} className="self-start">{pendiente ? "Asignando…" : "Asignar consigna"}</Button>
    </form>
  );
}
