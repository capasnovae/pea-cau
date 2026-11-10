"use client";

import { useActionState, useState } from "react";
import { Campo, CamposAlcance, MensajeResultado } from "@/components/contenido/campos";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { ETIQUETA_TIPO_EXAMEN, TIPOS_EXAMEN, type TipoExamen } from "@/lib/dominio/examenes";
import { guardarExamen, type ResultadoExamen } from "./acciones";

type Opcion = { id: string; nombre: string };
type Fuente = { clase: "modulo" | "categoria" | "curso"; ref: string; cantidad: string };
export type ExamenEditable = {
  id: string;
  titulo: string;
  tipo: TipoExamen;
  modulo_id: string | null;
  categoria_id: string | null;
  curso_id: string | null;
  cantidad_preguntas: number;
  nota_minima: number;
  max_intentos: number;
  espera_horas: number;
  tiempo_limite_min: number | null;
  mezclar: boolean;
  alcance: "global" | "sede";
  sede_id: string | null;
  estado: string;
  fuentes: {
    modulo_id: string | null;
    categoria_id: string | null;
    curso_id: string | null;
    cantidad: number | null;
  }[];
};

export function FormularioExamen({
  examen,
  alcances,
  sedes,
  categorias,
  modulos,
  niveles,
}: {
  examen?: ExamenEditable;
  alcances: ("global" | "sede")[];
  sedes: Opcion[];
  categorias: Opcion[];
  modulos: Opcion[];
  niveles: Opcion[];
}) {
  const [r, accion, pendiente] = useActionState<ResultadoExamen, FormData>(guardarExamen, null);
  const [tipo, setTipo] = useState<TipoExamen>(examen?.tipo ?? "modulo");
  const [fuentes, setFuentes] = useState<Fuente[]>(
    (examen?.fuentes ?? []).map((f) => ({
      clase: f.modulo_id ? "modulo" : f.categoria_id ? "categoria" : "curso",
      ref: f.modulo_id ?? f.categoria_id ?? f.curso_id ?? "",
      cantidad: f.cantidad ? String(f.cantidad) : "",
    })),
  );
  const listaDe = (c: Fuente["clase"]) =>
    c === "modulo" ? modulos : c === "categoria" ? categorias : niveles;
  const setF = (i: number, cambios: Partial<Fuente>) =>
    setFuentes(fuentes.map((f, j) => (j === i ? { ...f, ...cambios } : f)));
  const json = fuentes.map((f) => ({
    modulo_id: f.clase === "modulo" ? f.ref : "",
    categoria_id: f.clase === "categoria" ? f.ref : "",
    curso_id: f.clase === "curso" ? f.ref : "",
    cantidad: f.cantidad,
  }));

  return (
    <form action={accion} className="flex flex-col gap-4">
      <input type="hidden" name="id" value={examen?.id ?? ""} />
      <input type="hidden" name="fuentes" value={JSON.stringify(json)} />
      <div className="grid gap-3 sm:grid-cols-[1fr_12rem]">
        <Campo id="ex-titulo" etiqueta="Título">
          <Input id="ex-titulo" name="titulo" required maxLength={150} defaultValue={examen?.titulo} />
        </Campo>
        <Campo id="ex-tipo" etiqueta="Tipo">
          <Select
            id="ex-tipo"
            name="tipo"
            value={tipo}
            onChange={(e) => setTipo(e.target.value as TipoExamen)}
          >
            {TIPOS_EXAMEN.map((t) => (
              <option key={t} value={t}>
                {ETIQUETA_TIPO_EXAMEN[t]}
              </option>
            ))}
          </Select>
        </Campo>
      </div>

      {(tipo === "modulo" || tipo === "practica" || tipo === "actualizacion") && (
        <Campo
          id="ex-modulo"
          etiqueta={tipo === "practica" || tipo === "actualizacion" ? "Módulo (opcional)" : "Módulo"}
        >
          <Select id="ex-modulo" name="modulo_id" defaultValue={examen?.modulo_id ?? ""}>
            <option value="">
              {tipo === "practica" || tipo === "actualizacion" ? "Ninguno" : "Elegí el módulo"}
            </option>
            {modulos.map((m) => (
              <option key={m.id} value={m.id}>
                {m.nombre}
              </option>
            ))}
          </Select>
        </Campo>
      )}
      {(tipo === "categoria" || tipo === "practica" || tipo === "actualizacion") && (
        <Campo
          id="ex-categoria"
          etiqueta={tipo === "practica" || tipo === "actualizacion" ? "Categoría (opcional)" : "Categoría"}
        >
          <Select id="ex-categoria" name="categoria_id" defaultValue={examen?.categoria_id ?? ""}>
            <option value="">
              {tipo === "practica" || tipo === "actualizacion" ? "Ninguna" : "Elegí la categoría"}
            </option>
            {categorias.map((c) => (
              <option key={c.id} value={c.id}>
                {c.nombre}
              </option>
            ))}
          </Select>
        </Campo>
      )}
      {tipo === "nivel" && (
        <Campo id="ex-nivel" etiqueta="Nivel">
          <Select id="ex-nivel" name="curso_id" defaultValue={examen?.curso_id ?? ""} required>
            <option value="" disabled>
              Elegí el nivel
            </option>
            {niveles.map((n) => (
              <option key={n.id} value={n.id}>
                {n.nombre}
              </option>
            ))}
          </Select>
        </Campo>
      )}
      {tipo === "integrador" && (
        <fieldset className="flex flex-col gap-2">
          <legend className="mb-1 text-sm font-medium">Fuentes (cupo opcional)</legend>
          {fuentes.map((f, i) => (
            <div key={i} className="grid grid-cols-[8rem_1fr_6rem_2.5rem] gap-2">
              <Select
                aria-label={`Tipo de la fuente ${i + 1}`}
                value={f.clase}
                onChange={(e) => setF(i, { clase: e.target.value as Fuente["clase"], ref: "" })}
              >
                <option value="modulo">Módulo</option>
                <option value="categoria">Categoría</option>
                <option value="curso">Nivel</option>
              </Select>
              <Select
                aria-label={`Fuente ${i + 1}`}
                value={f.ref}
                onChange={(e) => setF(i, { ref: e.target.value })}
              >
                <option value="">Elegí…</option>
                {listaDe(f.clase).map((o) => (
                  <option key={o.id} value={o.id}>
                    {o.nombre}
                  </option>
                ))}
              </Select>
              <Input
                aria-label={`Cupo de la fuente ${i + 1}`}
                type="number"
                min={1}
                placeholder="Cupo"
                value={f.cantidad}
                onChange={(e) => setF(i, { cantidad: e.target.value })}
              />
              <button
                type="button"
                onClick={() => setFuentes(fuentes.filter((_, j) => j !== i))}
                aria-label={`Quitar fuente ${i + 1}`}
                className="rounded-lg text-muted"
              >
                ×
              </button>
            </div>
          ))}
          <button
            type="button"
            onClick={() => setFuentes([...fuentes, { clase: "modulo", ref: "", cantidad: "" }])}
            className="self-start text-sm font-semibold text-primary-strong"
          >
            + Fuente
          </button>
        </fieldset>
      )}

      <div className="grid grid-cols-2 gap-3 sm:grid-cols-5">
        <Campo id="ex-cantidad" etiqueta="Preguntas">
          <Input
            id="ex-cantidad"
            name="cantidad_preguntas"
            type="number"
            min={1}
            max={100}
            required
            defaultValue={examen?.cantidad_preguntas ?? 10}
          />
        </Campo>
        <Campo id="ex-nota" etiqueta="Nota mínima">
          <Input
            id="ex-nota"
            name="nota_minima"
            type="number"
            min={1}
            max={100}
            defaultValue={examen?.nota_minima ?? 80}
          />
        </Campo>
        <Campo id="ex-intentos" etiqueta="Intentos">
          <Input
            id="ex-intentos"
            name="max_intentos"
            type="number"
            min={1}
            max={10}
            defaultValue={examen?.max_intentos ?? 3}
          />
        </Campo>
        <Campo id="ex-espera" etiqueta="Espera (h)">
          <Input
            id="ex-espera"
            name="espera_horas"
            type="number"
            min={0}
            max={720}
            defaultValue={examen?.espera_horas ?? 24}
          />
        </Campo>
        <Campo id="ex-tiempo" etiqueta="Tiempo (min)">
          <Input
            id="ex-tiempo"
            name="tiempo_limite_min"
            type="number"
            min={1}
            max={300}
            placeholder="Libre"
            defaultValue={examen?.tiempo_limite_min ?? ""}
          />
        </Campo>
      </div>
      <label className="flex items-center gap-2 text-sm font-medium">
        <input
          type="checkbox"
          name="mezclar"
          defaultChecked={examen?.mezclar ?? true}
          className="size-5 accent-primary"
        />
        Mezclar preguntas y opciones
      </label>
      <div className="grid gap-3 sm:grid-cols-3">
        <CamposAlcance
          alcances={alcances}
          sedes={sedes}
          alcance={examen?.alcance}
          sedeId={examen?.sede_id}
          estado={examen?.estado}
          prefijo="ex-"
        />
      </div>
      <MensajeResultado r={r} />
      <Button type="submit" disabled={pendiente} className="self-start">
        Guardar examen
      </Button>
    </form>
  );
}
