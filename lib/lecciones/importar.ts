// Convierte las lecciones escritas a mano (contenido/lecciones/*.md) en SQL de borradores.
// Sin imports con alias: lo usa también el script de línea de comandos.
import { createHash } from "node:crypto";
import type { LeccionV2, Tarjeta } from "../dominio/lecciones";

export type Leccion = {
  resumen: string[];
  ejemplos: { consulta: string; respuesta: string }[];
  ojo: string[];
};
export type OpcionProbalo = {
  texto: string;
  correcta: boolean;
  /** Por qué es correcta o no: se muestra al comprobar. */
  explicacion?: string;
  /** Solo en "ordenar": lugar correcto (1, 2, 3…). */
  posicion?: number;
  /** Solo en "clasificar": columna correcta. */
  grupo?: string;
};
export type PreguntaProbalo = {
  tipo: "opcion_multiple" | "verdadero_falso" | "ordenar" | "clasificar";
  enunciado: string;
  opciones: OpcionProbalo[];
  explicacion: string;
  /** Solo en "clasificar": columnas en el orden en que aparecen. */
  columnas?: string[];
};
export type LeccionArchivo = {
  slug: string;
  titulo: string;
  curso: string;
  modulo: string;
  orden: number;
  fuente: string;
  leccion: Leccion | LeccionV2;
  probalo: PreguntaProbalo[];
};

/** Cursos temáticos (capacitaciones). Las rutas por puesto deciden cuáles son obligatorios. */
export const CURSOS = [
  {
    slug: "plataformas",
    titulo: "Plataformas del estudiante",
    descripcion: "Portal de Estudiantes, Aula Virtual (Canvas), app y exámenes online.",
    modulos: ["Portal y aula", "Exámenes online"],
  },
  {
    slug: "cursado",
    titulo: "Cursado y modalidades",
    descripcion: "Ingreso, modalidades ED, EDH y PD, inscripción y calendario.",
    modulos: ["Ingreso", "Modalidades", "Cursado"],
  },
  {
    slug: "evaluacion",
    titulo: "Evaluación (EVA 21)",
    descripcion: "Trabajos prácticos, exámenes, condiciones de aprobación, prácticas y EFIP.",
    modulos: ["Trabajos y exámenes", "Aprobación", "Materias especiales"],
  },
  {
    slug: "tramites",
    titulo: "Trámites",
    descripcion: "Cambio de modalidad, equivalencias y baja.",
    modulos: ["Trámites"],
  },
  {
    slug: "aranceles",
    titulo: "Aranceles, becas y pagos",
    descripcion: "Matrícula, aranceles, pagos, deuda, becas y beneficios.",
    modulos: ["Aranceles y pagos", "Becas y beneficios"],
  },
  {
    slug: "egreso",
    titulo: "Egreso",
    descripcion: "Graduación, Trabajo Final de Graduación, título y colación.",
    modulos: ["Trabajo final", "Título y colación"],
  },
  {
    slug: "normas",
    titulo: "Normas y acompañamiento",
    descripcion: "Sanciones, canales de contacto, tutores y bienestar.",
    modulos: ["Normas", "Acompañamiento"],
  },
] as const;

function bloques(cuerpo: string): Map<string, string> {
  const m = new Map<string, string>();
  for (const parte of cuerpo.split(/^## /m).slice(1)) {
    const i = parte.indexOf("\n");
    m.set(parte.slice(0, i).trim(), parte.slice(i + 1).trim());
  }
  return m;
}

const vinetas = (texto: string | undefined) =>
  (texto ?? "")
    .split("\n")
    .filter((l) => l.startsWith("- "))
    .map((l) => l.slice(2).trim());

const TIPOS_PROBALO = {
  unica: "opcion_multiple",
  vf: "verdadero_falso",
  ordenar: "ordenar",
  clasificar: "clasificar",
} as const;

/**
 * Una pregunta del Probalo. Formato:
 * - unica / vf: "- [x] opción" y, debajo y con sangría, "  > por qué" (explicación de esa opción).
 * - ordenar: "1. paso" en el orden correcto (se muestran mezclados).
 * - clasificar: "- ítem → Columna".
 * - "> texto" sin sangría: explicación general.
 */
function leerPregunta(ruta: string, q: string): PreguntaProbalo {
  const [cabeza, ...lineas] = q.split("\n");
  const c = /^(unica|vf|ordenar|clasificar):\s*(.+)$/.exec((cabeza ?? "").trim());
  if (!c) throw new Error(`Pregunta sin tipo (unica|vf|ordenar|clasificar) en ${ruta}: ${cabeza}`);
  const tipo = TIPOS_PROBALO[c[1] as keyof typeof TIPOS_PROBALO];
  const opciones: OpcionProbalo[] = [];
  const general: string[] = [];
  for (const cruda of lineas) {
    const l = cruda.trim();
    const sangria = /^\s+>/.test(cruda);
    let m: RegExpExecArray | null;
    if ((tipo === "opcion_multiple" || tipo === "verdadero_falso") && (m = /^- \[( |x)\] (.+)$/.exec(l))) {
      opciones.push({ texto: m[2]!.trim(), correcta: m[1] === "x" });
    } else if (tipo === "ordenar" && (m = /^(\d+)\. (.+)$/.exec(l))) {
      opciones.push({ texto: m[2]!.trim(), correcta: false, posicion: opciones.length + 1 });
    } else if (tipo === "clasificar" && (m = /^- (.+?)\s*→\s*(.+)$/.exec(l))) {
      opciones.push({ texto: m[1]!.trim(), correcta: false, grupo: m[2]!.trim() });
    } else if (l.startsWith("> ") && sangria && opciones.length) {
      const o = opciones[opciones.length - 1]!;
      o.explicacion = [o.explicacion, l.slice(2).trim()].filter(Boolean).join(" ");
    } else if (l.startsWith("> ")) {
      general.push(l.slice(2));
    }
  }
  const columnas = tipo === "clasificar" ? [...new Set(opciones.map((o) => o.grupo!))] : undefined;
  return {
    tipo,
    enunciado: c[2]!.trim(),
    opciones,
    explicacion: general.join(" ").trim(),
    ...(columnas ? { columnas } : {}),
  };
}

export function leerLeccion(ruta: string, texto: string): LeccionArchivo {
  const m = /^---\n([\s\S]*?)\n---\n([\s\S]*)$/.exec(texto);
  if (!m) throw new Error(`Sin metadata: ${ruta}`);
  const meta: Record<string, unknown> = {};
  for (const linea of m[1]!.split("\n")) {
    const i = linea.indexOf(":");
    if (i > 0) meta[linea.slice(0, i).trim()] = JSON.parse(linea.slice(i + 1).trim());
  }
  if (meta.formato === "tarjetas") return conMeta(ruta, meta, leerTarjetas(ruta, m[2]!));
  const b = bloques(m[2]!);
  if (!b.has("En 30 segundos") || !b.has("Así llega al CAU")) throw new Error(`Faltan bloques en ${ruta}`);
  const ejemplos = vinetas(b.get("Así llega al CAU")).map((l) => {
    const e = /^"(.+?)"\s*→\s*(.+)$/.exec(l);
    if (!e) throw new Error(`Ejemplo sin formato "consulta" → respuesta en ${ruta}: ${l}`);
    return { consulta: e[1]!.trim(), respuesta: e[2]!.trim() };
  });
  const probalo = (b.get("Probalo") ?? "")
    .split(/^### /m)
    .slice(1)
    .map((q) => leerPregunta(ruta, q));
  return conMeta(ruta, meta, {
    leccion: { resumen: vinetas(b.get("En 30 segundos")), ejemplos, ojo: vinetas(b.get("Ojo con")) },
    probalo,
  });
}

function conMeta(
  ruta: string,
  meta: Record<string, unknown>,
  cuerpo: Pick<LeccionArchivo, "leccion" | "probalo">,
): LeccionArchivo {
  const curso = String(meta.curso ?? "");
  const modulo = String(meta.modulo ?? "");
  const c = CURSOS.find((x) => x.slug === curso);
  if (!c) throw new Error(`Curso desconocido en ${ruta}: ${curso}`);
  if (!(c.modulos as readonly string[]).includes(modulo))
    throw new Error(`Módulo desconocido en ${ruta}: ${modulo} (curso ${curso})`);
  return {
    slug: ruta.split("/").pop()!.replace(/\.md$/, ""),
    titulo: String(meta.titulo ?? ""),
    curso,
    modulo,
    orden: Number(meta.orden ?? 0),
    fuente: String(meta.fuente ?? ""),
    ...cuerpo,
  };
}

/** "campo: valor" al principio de una línea. */
const campo = (lineas: string[], nombre: string) =>
  lineas
    .find((l) => l.startsWith(`${nombre}:`))
    ?.slice(nombre.length + 1)
    .trim();
const sinCampos = (lineas: string[], nombres: string[]) =>
  lineas.filter((l) => !nombres.some((n) => l.startsWith(`${n}:`)));
const parrafo = (lineas: string[]) =>
  lineas
    .map((l) => l.trim())
    .filter(Boolean)
    .join("\n");

/**
 * Lección por tarjetas (front matter `formato: "tarjetas"`): una sección "## tipo" por tarjeta, en orden,
 * y al final el bloque "## Probalo" con las preguntas de siempre.
 */
function leerTarjetas(ruta: string, cuerpo: string): Pick<LeccionArchivo, "leccion" | "probalo"> {
  const tarjetas: Tarjeta[] = [];
  let probalo: PreguntaProbalo[] = [];
  for (const parte of cuerpo.split(/^## /m).slice(1)) {
    const i = parte.indexOf("\n");
    const cabeza = (i < 0 ? parte : parte.slice(0, i)).trim();
    const lineas = (i < 0 ? "" : parte.slice(i + 1)).split("\n").map((l) => l.replace(/\s+$/, ""));
    let m: RegExpExecArray | null;
    if (cabeza === "Probalo") {
      probalo = lineas
        .join("\n")
        .split(/^### /m)
        .slice(1)
        .map((q) => leerPregunta(ruta, q));
    } else if (cabeza === "video") {
      tarjetas.push({ tipo: "video", ruta: campo(lineas, "ruta") ?? "" });
    } else if (cabeza === "caso") {
      tarjetas.push({
        tipo: "caso",
        persona: campo(lineas, "persona") ?? "",
        canal: (campo(lineas, "canal") ?? "") as "whatsapp",
        consulta: parrafo(sinCampos(lineas, ["persona", "canal"])),
      });
    } else if (cabeza === "preguntar") {
      const opciones: { texto: string; clave: boolean; porque: string }[] = [];
      for (const cruda of lineas) {
        const l = cruda.trim();
        if ((m = /^- \[( |x)\] (.+)$/.exec(l)))
          opciones.push({ texto: m[2]!.trim(), clave: m[1] === "x", porque: "" });
        else if (l.startsWith("> ") && opciones.length) opciones.at(-1)!.porque = l.slice(2).trim();
      }
      tarjetas.push({ tipo: "preguntar", opciones });
    } else if ((m = /^idea:\s*(.+)$/.exec(cabeza))) {
      const ejemplo = campo(lineas, "ejemplo");
      tarjetas.push({
        tipo: "idea",
        titulo: m[1]!.trim(),
        texto: parrafo(sinCampos(lineas, ["clave", "ejemplo"])),
        clave: campo(lineas, "clave") ?? "",
        ...(ejemplo ? { ejemplo } : {}),
      });
    } else if ((m = /^probalo (\d+)$/.exec(cabeza))) {
      tarjetas.push({ tipo: "probalo", n: Number(m[1]) });
    } else if (cabeza === "ojo") {
      tarjetas.push({ tipo: "ojo", texto: parrafo(lineas) });
    } else if (cabeza === "cierre") {
      tarjetas.push({
        tipo: "cierre",
        resolucion: parrafo(sinCampos(lineas, ["recordar"])),
        recordar: campo(lineas, "recordar") ?? "",
      });
    } else {
      throw new Error(`Tarjeta desconocida en ${ruta}: ## ${cabeza}`);
    }
  }
  for (const t of tarjetas)
    if (t.tipo === "probalo" && t.n > probalo.length)
      throw new Error(`La tarjeta "probalo ${t.n}" no tiene pregunta en ${ruta}`);
  return { leccion: { version: 2, tarjetas }, probalo };
}

function literal(texto: string): string {
  let n = 0;
  while (texto.includes(`$pea${n}$`)) n++;
  return `$pea${n}$${texto}$pea${n}$`;
}
/** UUID determinístico y válido (versión 4, variante RFC) a partir de una clave: el servidor valida los ids con z.uuid. */
export function idDe(clave: string): string {
  const h = createHash("md5").update(clave).digest("hex").split("");
  h[12] = "4";
  h[16] = "8";
  const x = h.join("");
  return `${x.slice(0, 8)}-${x.slice(8, 12)}-${x.slice(12, 16)}-${x.slice(16, 20)}-${x.slice(20)}`;
}
const id = (clave: string) => `'${idDe(clave)}'::uuid`;

/** Un curso de capacitación en borrador por tema, con sus módulos, lecciones (fuente = artículo relevado) y Probalo. */
export function armarSqlLecciones(lecciones: LeccionArchivo[]): string {
  const s: string[] = [
    "-- Generado por scripts/importar-lecciones.mts a partir de contenido/lecciones. No editar a mano.",
    '-- Borradores "A validar": coordinación los revisa y publica (junto con sus artículos fuente).',
  ];
  const moduloId = (l: { curso: string; modulo: string }) => id(`pea-modulo:${l.curso}:${l.modulo}`);
  for (const c of CURSOS) {
    if (!lecciones.some((l) => l.curso === c.slug)) continue;
    s.push(`insert into public.cursos (id, tipo, titulo, descripcion_md, alcance, estado)
values (${id(`pea-curso:${c.slug}`)}, 'capacitacion', ${literal(c.titulo)}, ${literal(`${c.descripcion} A validar.`)}, 'global', 'borrador')
on conflict do nothing;`);
    c.modulos
      .filter((m) => lecciones.some((l) => l.curso === c.slug && l.modulo === m))
      .forEach((m, i) =>
        s.push(`insert into public.modulos (id, curso_id, orden, titulo)
values (${moduloId({ curso: c.slug, modulo: m })}, ${id(`pea-curso:${c.slug}`)}, ${i + 1}, ${literal(m)})
on conflict do nothing;`),
      );
  }
  for (const l of [...lecciones].sort((a, b) => a.orden - b.orden || a.slug.localeCompare(b.slug))) {
    const item = id(`pea-item:${l.slug}`);
    // Solo se pisa lo que sigue en borrador: lo publicado ya lo validó coordinación.
    const enBorrador = `exists (select 1 from public.modulos m join public.cursos c on c.id = m.curso_id
               where m.id = ${moduloId(l)} and c.estado = 'borrador')`;
    s.push(`insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select ${item}, ${moduloId(l)}, ${l.orden}, ${literal(l.titulo)}, 'leccion', a.id,
       ${literal(JSON.stringify(l.leccion))}::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = ${literal(l.fuente)} and a.alcance = 'global'
on conflict (id) do update set orden = excluded.orden, titulo = excluded.titulo, leccion = excluded.leccion,
  articulo_id = excluded.articulo_id
where ${enBorrador};`);
    const ids = l.probalo.map((_, n) => idDe(`pea-pregunta:${l.slug}:${n + 1}`));
    s.push(`delete from public.preguntas
where item_id = ${item} and id not in (${ids.map((x) => `'${x}'::uuid`).join(", ") || "null"})
  and ${enBorrador};`);
    l.probalo.forEach((p, n) => {
      const pid = `'${ids[n]}'::uuid`;
      // "unica": una sola correcta; se muestra con botones de radio en vez de "Marcá todas las correctas"
      const config = p.columnas
        ? literal(JSON.stringify({ columnas: p.columnas })) + "::jsonb"
        : p.tipo === "opcion_multiple"
          ? literal(JSON.stringify({ una: true })) + "::jsonb"
          : "null";
      s.push(`insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id, config)
select ${pid}, '${p.tipo}', ${literal(p.enunciado)}, ${literal(p.explicacion)}, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', ${item}, ${config}
where exists (select 1 from public.items where id = ${item})
on conflict (id) do update set tipo = excluded.tipo, enunciado_md = excluded.enunciado_md,
  explicacion_md = excluded.explicacion_md, config = excluded.config
where ${enBorrador};`);
      const valor = (v: string | number | undefined) =>
        v === undefined ? "null" : typeof v === "number" ? String(v) : literal(v);
      const filas = p.opciones
        .map(
          (o, k) =>
            `  (${id(`pea-opcion:${l.slug}:${n + 1}:${k + 1}`)}, ${literal(o.texto)}, ${o.correcta}, ${k + 1}, ${valor(o.explicacion)}, ${valor(o.posicion)}::int, ${valor(o.grupo)})`,
        )
        .join(",\n");
      s.push(`delete from public.opciones where pregunta_id = ${pid} and ${enBorrador};`);
      s.push(`insert into public.opciones (id, pregunta_id, texto, es_correcta, orden, explicacion, posicion_correcta, grupo)
select x.id, ${pid}, x.texto, x.correcta, x.orden, x.explicacion, x.posicion, x.grupo from (values
${filas}
) as x(id, texto, correcta, orden, explicacion, posicion, grupo)
where exists (select 1 from public.preguntas where id = ${pid})
on conflict do nothing;`);
    });
  }
  return s.join("\n\n") + "\n";
}
