import { z } from "zod";

const vacioANull = (v: unknown) => (v === "" || v === undefined ? null : v);
const uuidOpcional = z.preprocess(vacioANull, z.uuid().nullable());
const enteroOpcional = (min: number, max: number) => z.preprocess(vacioANull, z.coerce.number().int().min(min).max(max).nullable());
const texto = (max: number) => z.preprocess((v) => (v ?? "") as string, z.string().trim().max(max));
const booleano = z.preprocess((v) => v === true || v === "on" || v === "true", z.boolean());

export const esquemaCurso = z
  .object({
    tipo: z.enum(["nivel", "capacitacion"]),
    nivel_orden: enteroOpcional(1, 9),
    titulo: z.string().trim().min(1, "Falta el título.").max(160),
    descripcion_md: texto(5000),
    alcance: z.enum(["global", "sede"]),
    sede_id: uuidOpcional,
    estado: z.enum(["borrador", "publicado", "archivado"]),
    vigencia_meses: enteroOpcional(1, 120),
  })
  .superRefine((d, ctx) => {
    if (d.tipo === "nivel" && !d.nivel_orden) ctx.addIssue({ code: "custom", path: ["nivel_orden"], message: "Elegí el número de nivel." });
    if (d.tipo === "nivel" && d.alcance !== "global") ctx.addIssue({ code: "custom", path: ["alcance"], message: "Los niveles son para todos los CAU." });
    if (d.alcance === "sede" && !d.sede_id) ctx.addIssue({ code: "custom", path: ["sede_id"], message: "Elegí la sede." });
  })
  .transform((d) => ({
    ...d,
    nivel_orden: d.tipo === "nivel" ? d.nivel_orden : null,
    sede_id: d.alcance === "sede" ? d.sede_id : null,
  }));

export const esquemaModulo = z.object({
  curso_id: z.uuid(),
  titulo: z.string().trim().min(1, "Falta el título.").max(160),
  orden: z.coerce.number().int().min(0).max(999),
  avance_secuencial: booleano,
  prerrequisitos: z.array(z.uuid()).default([]),
});

export const esquemaItem = z
  .object({
    modulo_id: z.uuid(),
    titulo: z.string().trim().min(1, "Falta el título.").max(160),
    tipo: z.enum(["articulo", "recurso", "pagina", "video", "enlace", "examen"]),
    requisito: z.enum(["ninguno", "ver", "marcar_hecho", "aprobar"]),
    orden: z.coerce.number().int().min(0).max(999),
    articulo_id: uuidOpcional,
    recurso_id: uuidOpcional,
    contenido_md: z.preprocess(vacioANull, z.string().trim().max(100_000).nullable()),
    url: z.preprocess(vacioANull, z.url({ protocol: /^https?$/, message: "Poné un link que empiece con http:// o https://." }).nullable()),
  })
  .superRefine((d, ctx) => {
    if (d.requisito === "aprobar" && d.tipo !== "examen") ctx.addIssue({ code: "custom", path: ["requisito"], message: "“Aprobar” es solo para exámenes." });
    const falta =
      (d.tipo === "articulo" && !d.articulo_id && "Elegí el artículo.") ||
      (d.tipo === "recurso" && !d.recurso_id && "Elegí el recurso.") ||
      (d.tipo === "pagina" && !d.contenido_md && "Escribí el contenido de la página.") ||
      (d.tipo === "video" && !d.url && !d.recurso_id && "Poné el link del video o elegí un recurso.") ||
      (d.tipo === "enlace" && !d.url && "Poné el link.");
    if (falta) ctx.addIssue({ code: "custom", path: ["tipo"], message: falta });
  })
  .transform((d) => ({
    ...d,
    articulo_id: d.tipo === "articulo" ? d.articulo_id : null,
    recurso_id: d.tipo === "recurso" || d.tipo === "video" ? d.recurso_id : null,
    contenido_md: d.tipo === "pagina" ? d.contenido_md : null,
    url: d.tipo === "video" || d.tipo === "enlace" ? d.url : null,
  }));
