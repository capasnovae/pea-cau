"use client";

import { Icono } from "@/components/ui/icono";
import { useActionState, useState } from "react";
import { Campo, CamposAlcance, MensajeResultado } from "@/components/contenido/campos";
import { Button } from "@/components/ui/button";
import { Input, Select } from "@/components/ui/input";
import { ETIQUETA_TIPO_PREGUNTA, TIPOS_PREGUNTA, type TipoPregunta } from "@/lib/dominio/examenes";
import { guardarPregunta, type ResultadoPregunta } from "./acciones";

type Opcion = { id: string; nombre: string };
type OpcionEdit = { texto: string; es_correcta: boolean; grupo: string; explicacion?: string };
type CampoEdit = {
  id: string;
  etiqueta: string;
  tipo: "texto" | "select";
  opciones: string[];
  aceptadas: string[];
};

export type PreguntaEditable = {
  id: string;
  tipo: TipoPregunta;
  enunciado_md: string;
  contexto_md: string | null;
  explicacion_md: string;
  rubrica_md: string | null;
  puntaje_max: number;
  dificultad: number;
  caso_id: string | null;
  orden_en_caso: number | null;
  modulo_id: string | null;
  categoria_id: string | null;
  articulo_fuente_id: string | null;
  alcance: "global" | "sede";
  sede_id: string | null;
  estado: string;
  uso: "examen" | "practica";
  item_id: string | null;
  opciones: OpcionEdit[];
  columnas: string[];
  campos: CampoEdit[];
};

const AREA = "w-full rounded-xl border border-border bg-card p-3 text-sm";
const VACIA = (): OpcionEdit => ({ texto: "", es_correcta: false, grupo: "", explicacion: "" });

function mover<T>(lista: T[], i: number, d: -1 | 1): T[] {
  const n = [...lista];
  [n[i], n[i + d]] = [n[i + d]!, n[i]!];
  return n;
}

export function FormularioPregunta({
  pregunta,
  casoInicial,
  alcances,
  sedes,
  categorias,
  modulos,
  articulos,
  casos,
  lecciones = [],
}: {
  pregunta?: PreguntaEditable;
  casoInicial?: string;
  alcances: ("global" | "sede")[];
  sedes: Opcion[];
  categorias: Opcion[];
  modulos: Opcion[];
  articulos: Opcion[];
  casos: Opcion[];
  lecciones?: Opcion[];
}) {
  const [uso, setUso] = useState(pregunta?.uso ?? "examen");
  const [r, accion, pendiente] = useActionState<ResultadoPregunta, FormData>(guardarPregunta, null);
  const [tipo, setTipo] = useState<TipoPregunta>(
    pregunta?.tipo ?? (casoInicial ? "simulacion" : "opcion_multiple"),
  );
  const [opciones, setOpciones] = useState<OpcionEdit[]>(
    pregunta?.opciones.length ? pregunta.opciones : [VACIA(), VACIA()],
  );
  const [columnas, setColumnas] = useState<string[]>(
    pregunta?.columnas.length ? pregunta.columnas : ["", ""],
  );
  const [campos, setCampos] = useState<CampoEdit[]>(
    pregunta?.campos.length
      ? pregunta.campos
      : [{ id: "campo_1", etiqueta: "", tipo: "texto", opciones: [], aceptadas: [] }],
  );

  const cambiarTipo = (t: TipoPregunta) => {
    setTipo(t);
    if (t === "verdadero_falso")
      setOpciones([
        { texto: "Verdadero", es_correcta: true, grupo: "" },
        { texto: "Falso", es_correcta: false, grupo: "" },
      ]);
  };
  const conOpciones = !["libre", "formulario"].includes(tipo);
  const setOp = (i: number, cambios: Partial<OpcionEdit>) =>
    setOpciones(opciones.map((o, j) => (j === i ? { ...o, ...cambios } : o)));
  const setCampo = (i: number, cambios: Partial<CampoEdit>) =>
    setCampos(campos.map((c, j) => (j === i ? { ...c, ...cambios } : c)));

  return (
    <form action={accion} className="flex flex-col gap-4">
      <input type="hidden" name="id" value={pregunta?.id ?? ""} />
      <input type="hidden" name="opciones" value={JSON.stringify(conOpciones ? opciones : [])} />
      <input type="hidden" name="columnas" value={JSON.stringify(tipo === "clasificar" ? columnas : [])} />
      <input type="hidden" name="campos" value={JSON.stringify(tipo === "formulario" ? campos : [])} />

      <div className="grid gap-3 sm:grid-cols-3">
        <Campo id="pq-tipo" etiqueta="Tipo">
          <Select
            id="pq-tipo"
            name="tipo"
            value={tipo}
            onChange={(e) => cambiarTipo(e.target.value as TipoPregunta)}
          >
            {TIPOS_PREGUNTA.map((t) => (
              <option key={t} value={t}>
                {ETIQUETA_TIPO_PREGUNTA[t]}
              </option>
            ))}
          </Select>
        </Campo>
        <Campo id="pq-uso" etiqueta="Uso">
          <Select
            id="pq-uso"
            name="uso"
            value={uso}
            onChange={(e) => setUso(e.target.value as "examen" | "practica")}
          >
            <option value="examen">Examen</option>
            <option value="practica">Práctica</option>
          </Select>
        </Campo>
        <Campo id="pq-puntaje" etiqueta="Puntaje">
          <Input
            id="pq-puntaje"
            name="puntaje_max"
            type="number"
            min={1}
            max={100}
            defaultValue={pregunta?.puntaje_max ?? 1}
          />
        </Campo>
      </div>

      {tipo === "simulacion" && (
        <div className="grid gap-3 sm:grid-cols-[1fr_8rem]">
          <Campo id="pq-caso" etiqueta="Caso">
            <Select
              id="pq-caso"
              name="caso_id"
              defaultValue={pregunta?.caso_id ?? casoInicial ?? ""}
              required
            >
              <option value="" disabled>
                Elegí el caso
              </option>
              {casos.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.nombre}
                </option>
              ))}
            </Select>
          </Campo>
          <Campo id="pq-orden" etiqueta="Orden en el caso">
            <Input
              id="pq-orden"
              name="orden_en_caso"
              type="number"
              min={1}
              defaultValue={pregunta?.orden_en_caso ?? 1}
            />
          </Campo>
        </div>
      )}
      {tipo === "escenario" && (
        <Campo id="pq-contexto" etiqueta="Escenario">
          <textarea
            id="pq-contexto"
            name="contexto_md"
            rows={4}
            defaultValue={pregunta?.contexto_md ?? ""}
            className={AREA}
          />
        </Campo>
      )}
      <Campo id="pq-enunciado" etiqueta="Enunciado">
        <textarea
          id="pq-enunciado"
          name="enunciado_md"
          rows={3}
          required
          defaultValue={pregunta?.enunciado_md}
          className={AREA}
        />
      </Campo>

      {conOpciones && (
        <fieldset className="flex flex-col gap-2">
          <legend className="mb-1 text-sm font-medium">
            {tipo === "ordenar"
              ? "Pasos en el orden correcto"
              : tipo === "clasificar"
                ? "Elementos"
                : "Opciones (marcá las correctas)"}
          </legend>
          {tipo === "clasificar" && (
            <div className="flex flex-wrap items-center gap-2">
              <span className="text-sm text-muted">Columnas:</span>
              {columnas.map((c, i) => (
                <Input
                  key={i}
                  aria-label={`Columna ${i + 1}`}
                  value={c}
                  onChange={(e) => setColumnas(columnas.map((x, j) => (j === i ? e.target.value : x)))}
                  className="w-40! shrink-0"
                />
              ))}
              {columnas.length < 6 && (
                <button
                  type="button"
                  onClick={() => setColumnas([...columnas, ""])}
                  className="text-sm font-semibold text-primary-strong"
                >
                  + Columna
                </button>
              )}
            </div>
          )}
          {opciones.map((o, i) => (
            <div key={i} className="flex flex-col gap-1.5">
              <div className="flex items-center gap-2">
                {tipo !== "ordenar" && tipo !== "clasificar" && (
                  <input
                    type={tipo === "verdadero_falso" ? "radio" : "checkbox"}
                    name="__correcta"
                    aria-label={`Opción ${i + 1} correcta`}
                    checked={o.es_correcta}
                    onChange={() =>
                      setOpciones(
                        tipo === "verdadero_falso"
                          ? opciones.map((x, j) => ({ ...x, es_correcta: j === i }))
                          : opciones.map((x, j) => (j === i ? { ...x, es_correcta: !x.es_correcta } : x)),
                      )
                    }
                    className="size-5 accent-primary"
                  />
                )}
                {tipo === "ordenar" && (
                  <span className="w-5 text-center font-bold text-primary-strong">{i + 1}</span>
                )}
                <Input
                  aria-label={`Opción ${i + 1}`}
                  value={o.texto}
                  onChange={(e) => setOp(i, { texto: e.target.value })}
                  className="min-w-0 flex-1"
                />
                {tipo === "clasificar" && (
                  <Select
                    aria-label={`Columna de la opción ${i + 1}`}
                    value={o.grupo}
                    onChange={(e) => setOp(i, { grupo: e.target.value })}
                    className="w-40! shrink-0"
                  >
                    <option value="">Columna…</option>
                    {columnas.filter(Boolean).map((c) => (
                      <option key={c} value={c}>
                        {c}
                      </option>
                    ))}
                  </Select>
                )}
                {tipo === "ordenar" && (
                  <>
                    <button
                      type="button"
                      disabled={i === 0}
                      onClick={() => setOpciones(mover(opciones, i, -1))}
                      aria-label={`Subir opción ${i + 1}`}
                      className="size-9 rounded-lg disabled:opacity-30"
                    >
                      <Icono nombre="flecha-arriba" />
                    </button>
                    <button
                      type="button"
                      disabled={i === opciones.length - 1}
                      onClick={() => setOpciones(mover(opciones, i, 1))}
                      aria-label={`Bajar opción ${i + 1}`}
                      className="size-9 rounded-lg disabled:opacity-30"
                    >
                      <Icono nombre="flecha-abajo" />
                    </button>
                  </>
                )}
                {tipo !== "verdadero_falso" && opciones.length > 2 && (
                  <button
                    type="button"
                    onClick={() => setOpciones(opciones.filter((_, j) => j !== i))}
                    aria-label={`Quitar opción ${i + 1}`}
                    className="size-9 rounded-lg text-muted"
                  >
                    <Icono nombre="cruz" tamano={16} />
                  </button>
                )}
              </div>
              {(tipo === "opcion_multiple" || tipo === "verdadero_falso") && (
                <Input
                  aria-label={`Por qué la opción ${i + 1} ${o.es_correcta ? "es correcta" : "no es correcta"}`}
                  placeholder={o.es_correcta ? "Por qué es correcta (opcional)" : "Por qué no (opcional)"}
                  value={o.explicacion ?? ""}
                  maxLength={400}
                  onChange={(e) => setOp(i, { explicacion: e.target.value })}
                  className="h-9 text-sm"
                />
              )}
            </div>
          ))}
          {tipo !== "verdadero_falso" && opciones.length < (tipo === "clasificar" ? 12 : 8) && (
            <button
              type="button"
              onClick={() => setOpciones([...opciones, VACIA()])}
              className="self-start text-sm font-semibold text-primary-strong"
            >
              + Opción
            </button>
          )}
        </fieldset>
      )}

      {tipo === "formulario" && (
        <fieldset className="flex flex-col gap-3">
          <legend className="mb-1 text-sm font-medium">Campos del formulario</legend>
          {campos.map((c, i) => (
            <div key={i} className="grid gap-2 rounded-xl border border-border p-3 sm:grid-cols-[1fr_8rem]">
              <Input
                aria-label={`Etiqueta del campo ${i + 1}`}
                placeholder="Etiqueta"
                value={c.etiqueta}
                onChange={(e) => setCampo(i, { etiqueta: e.target.value })}
              />
              <Select
                aria-label={`Tipo del campo ${i + 1}`}
                value={c.tipo}
                onChange={(e) => setCampo(i, { tipo: e.target.value as "texto" | "select" })}
              >
                <option value="texto">Texto</option>
                <option value="select">Lista</option>
              </Select>
              {c.tipo === "select" && (
                <Input
                  aria-label={`Opciones del campo ${i + 1}`}
                  placeholder="Opciones separadas por ;"
                  value={c.opciones.join("; ")}
                  onChange={(e) =>
                    setCampo(i, {
                      opciones: e.target.value
                        .split(";")
                        .map((x) => x.trim())
                        .filter(Boolean),
                    })
                  }
                  className="sm:col-span-2"
                />
              )}
              <Input
                aria-label={`Respuestas aceptadas del campo ${i + 1}`}
                placeholder="Respuestas aceptadas separadas por ;"
                value={c.aceptadas.join("; ")}
                onChange={(e) =>
                  setCampo(i, {
                    aceptadas: e.target.value
                      .split(";")
                      .map((x) => x.trim())
                      .filter(Boolean),
                  })
                }
                className="sm:col-span-2"
              />
            </div>
          ))}
          {campos.length < 10 && (
            <button
              type="button"
              onClick={() =>
                setCampos([
                  ...campos,
                  {
                    id: `campo_${campos.length + 1}`,
                    etiqueta: "",
                    tipo: "texto",
                    opciones: [],
                    aceptadas: [],
                  },
                ])
              }
              className="self-start text-sm font-semibold text-primary-strong"
            >
              + Campo
            </button>
          )}
        </fieldset>
      )}

      {tipo === "libre" && (
        <Campo id="pq-rubrica" etiqueta="Rúbrica">
          <textarea
            id="pq-rubrica"
            name="rubrica_md"
            rows={3}
            required
            defaultValue={pregunta?.rubrica_md ?? ""}
            className={AREA}
          />
        </Campo>
      )}
      <Campo id="pq-explicacion" etiqueta="Explicación (se ve después de entregar)">
        <textarea
          id="pq-explicacion"
          name="explicacion_md"
          rows={2}
          defaultValue={pregunta?.explicacion_md ?? ""}
          className={AREA}
        />
      </Campo>

      <div className="grid gap-3 sm:grid-cols-3">
        <Campo id="pq-categoria" etiqueta="Categoría">
          <Select id="pq-categoria" name="categoria_id" defaultValue={pregunta?.categoria_id ?? ""}>
            <option value="">Sin categoría</option>
            {categorias.map((c) => (
              <option key={c.id} value={c.id}>
                {c.nombre}
              </option>
            ))}
          </Select>
        </Campo>
        <Campo id="pq-modulo" etiqueta="Módulo">
          <Select id="pq-modulo" name="modulo_id" defaultValue={pregunta?.modulo_id ?? ""}>
            <option value="">Sin módulo</option>
            {modulos.map((m) => (
              <option key={m.id} value={m.id}>
                {m.nombre}
              </option>
            ))}
          </Select>
        </Campo>
        {uso === "practica" && (
          <Campo id="pq-leccion" etiqueta="Lección (Probalo)">
            <Select id="pq-leccion" name="item_id" defaultValue={pregunta?.item_id ?? ""}>
              <option value="">Ninguna</option>
              {lecciones.map((l) => (
                <option key={l.id} value={l.id}>
                  {l.nombre}
                </option>
              ))}
            </Select>
          </Campo>
        )}
        <Campo id="pq-articulo" etiqueta="Artículo para estudiar">
          <Select
            id="pq-articulo"
            name="articulo_fuente_id"
            defaultValue={pregunta?.articulo_fuente_id ?? ""}
          >
            <option value="">Ninguno</option>
            {articulos.map((a) => (
              <option key={a.id} value={a.id}>
                {a.nombre}
              </option>
            ))}
          </Select>
        </Campo>
        <Campo id="pq-dificultad" etiqueta="Dificultad">
          <Select id="pq-dificultad" name="dificultad" defaultValue={String(pregunta?.dificultad ?? 1)}>
            <option value="1">Baja</option>
            <option value="2">Media</option>
            <option value="3">Alta</option>
          </Select>
        </Campo>
        <CamposAlcance
          alcances={alcances}
          sedes={sedes}
          alcance={pregunta?.alcance}
          sedeId={pregunta?.sede_id}
          estado={pregunta?.estado}
          prefijo="pq-"
        />
      </div>
      <MensajeResultado r={r} />
      <Button type="submit" disabled={pendiente} className="self-start">
        Guardar pregunta
      </Button>
    </form>
  );
}
