// Convierte las lecciones escritas a mano (contenido/lecciones/*.md) en SQL de borradores.
// Sin imports con alias: lo usa también el script de línea de comandos.
import { createHash } from "node:crypto";

export type Leccion = {
  resumen: string[];
  ejemplos: { consulta: string; respuesta: string }[];
  ojo: string[];
};
export type PreguntaProbalo = {
  tipo: "opcion_multiple" | "verdadero_falso";
  enunciado: string;
  opciones: { texto: string; correcta: boolean }[];
  explicacion: string;
};
export type LeccionArchivo = {
  slug: string;
  titulo: string;
  curso: string;
  modulo: string;
  orden: number;
  fuente: string;
  leccion: Leccion;
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

function leerPregunta(ruta: string, q: string): PreguntaProbalo {
  const [cabeza, ...resto] = q.split("\n");
  const c = /^(unica|vf):\s*(.+)$/.exec((cabeza ?? "").trim());
  if (!c) throw new Error(`Pregunta sin tipo (unica|vf) en ${ruta}: ${cabeza}`);
  const lineas = resto.map((l) => l.trim());
  return {
    tipo: c[1] === "vf" ? "verdadero_falso" : "opcion_multiple",
    enunciado: c[2]!.trim(),
    opciones: lineas
      .filter((l) => /^- \[( |x)\] /.test(l))
      .map((l) => ({ texto: l.slice(6).trim(), correcta: l.startsWith("- [x]") })),
    explicacion: lineas
      .filter((l) => l.startsWith("> "))
      .map((l) => l.slice(2))
      .join(" ")
      .trim(),
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
    leccion: { resumen: vinetas(b.get("En 30 segundos")), ejemplos, ojo: vinetas(b.get("Ojo con")) },
    probalo,
  };
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
    s.push(`insert into public.items (id, modulo_id, orden, titulo, tipo, articulo_id, leccion, requisito)
select ${item}, ${moduloId(l)}, ${l.orden}, ${literal(l.titulo)}, 'leccion', a.id,
       ${literal(JSON.stringify(l.leccion))}::jsonb, 'marcar_hecho'
from public.articulos a where a.slug = ${literal(l.fuente)} and a.alcance = 'global'
on conflict do nothing;`);
    l.probalo.forEach((p, n) => {
      const pid = id(`pea-pregunta:${l.slug}:${n + 1}`);
      s.push(`insert into public.preguntas (id, tipo, enunciado_md, explicacion_md, categoria_id, estado, alcance, uso, item_id)
select ${pid}, '${p.tipo}', ${literal(p.enunciado)}, ${literal(p.explicacion)}, (select id from public.categorias where slug = 'reglamento'),
       'publicado', 'global', 'practica', ${item}
where exists (select 1 from public.items where id = ${item})
on conflict do nothing;`);
      const filas = p.opciones
        .map(
          (o, k) =>
            `  (${id(`pea-opcion:${l.slug}:${n + 1}:${k + 1}`)}, ${literal(o.texto)}, ${o.correcta}, ${k + 1})`,
        )
        .join(",\n");
      s.push(`insert into public.opciones (id, pregunta_id, texto, es_correcta, orden)
select x.id, ${pid}, x.texto, x.correcta, x.orden from (values
${filas}
) as x(id, texto, correcta, orden)
where exists (select 1 from public.preguntas where id = ${pid})
on conflict do nothing;`);
    });
  }
  return s.join("\n\n") + "\n";
}
