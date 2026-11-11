import { z } from "zod";
import { slugificar } from "./contenido";

const vacioANull = (v: unknown) => (v === "" || v === undefined ? null : v);
const uuidOpcional = z.preprocess(vacioANull, z.uuid().nullable());
const fechaOpcional = z.preprocess(vacioANull, z.iso.date().nullable());
const urlHttp = z.url({ protocol: /^https?$/, message: "Poné un link que empiece con http:// o https://." });
const urlOpcional = z.preprocess(vacioANull, urlHttp.nullable());
const textoOpcional = (max: number) => z.preprocess((v) => (v ?? "") as string, z.string().trim().max(max));

const alcanceYSede = {
  alcance: z.enum(["global", "sede"]),
  sede_id: uuidOpcional,
  estado: z.enum(["borrador", "publicado", "archivado"]),
};

function validarAlcance(d: { alcance: string; sede_id: string | null }, ctx: z.RefinementCtx) {
  if (d.alcance === "sede" && !d.sede_id)
    ctx.addIssue({ code: "custom", path: ["sede_id"], message: "Elegí la sede." });
  if (d.alcance === "global" && d.sede_id)
    ctx.addIssue({ code: "custom", path: ["sede_id"], message: "El contenido global no lleva sede." });
}

function validarVigencia(
  d: { vigente_desde?: string | null; vigente_hasta: string | null },
  ctx: z.RefinementCtx,
) {
  if (d.vigente_desde && d.vigente_hasta && d.vigente_hasta < d.vigente_desde) {
    ctx.addIssue({
      code: "custom",
      path: ["vigente_hasta"],
      message: "La fecha de fin tiene que ser posterior al inicio.",
    });
  }
}

export const esquemaArticulo = z
  .object({
    titulo: z.string().trim().min(1, "Falta el título.").max(160),
    slug: z.preprocess(vacioANull, z.string().trim().max(80).nullable()).optional(),
    categoria_id: z.uuid("Elegí la categoría."),
    padre_id: uuidOpcional,
    resumen: textoOpcional(300),
    cuerpo_md: textoOpcional(100_000),
    vigente_desde: fechaOpcional,
    vigente_hasta: fechaOpcional,
    fuente_url: urlOpcional,
    ultimo_cambio: textoOpcional(200),
    ...alcanceYSede,
  })
  .superRefine(validarAlcance)
  .superRefine(validarVigencia)
  .transform((d) => ({ ...d, slug: slugificar(d.slug || d.titulo) }));

export const esquemaRecurso = z
  .object({
    titulo: z.string().trim().min(1, "Falta el título.").max(160),
    descripcion: textoOpcional(500),
    tipo: z.enum(["imagen", "video", "pdf", "presentacion", "enlace", "otro"]),
    categoria_id: z.uuid("Elegí la categoría."),
    campana_id: uuidOpcional,
    etiquetas: z.preprocess(
      (v) =>
        (Array.isArray(v) ? v : String(v ?? "").split(","))
          .map((e) => String(e).trim().toLowerCase())
          .filter(Boolean),
      z.array(z.string().max(40)).max(20),
    ),
    url_externa: urlOpcional,
    vigente_hasta: fechaOpcional,
    tiene_archivo: z.preprocess((v) => v === true || v === "true" || v === "on", z.boolean()).default(false),
    ...alcanceYSede,
  })
  .superRefine(validarAlcance)
  .superRefine((d, ctx) => {
    const necesitaUrl = d.tipo === "enlace" || (d.tipo === "video" && !d.tiene_archivo);
    if (necesitaUrl && !d.url_externa)
      ctx.addIssue({ code: "custom", path: ["url_externa"], message: "Falta el link." });
    if (!d.tiene_archivo && !d.url_externa)
      ctx.addIssue({ code: "custom", path: ["url_externa"], message: "Subí un archivo o poné un link." });
  });

export const esquemaCampana = z
  .object({
    nombre: z.string().trim().min(1, "Falta el nombre.").max(120),
    descripcion_md: textoOpcional(5_000),
    vigente_desde: fechaOpcional,
    vigente_hasta: fechaOpcional,
    ...alcanceYSede,
  })
  .superRefine(validarAlcance)
  .superRefine(validarVigencia);

export type DatosArticulo = z.infer<typeof esquemaArticulo>;
export type DatosRecurso = z.infer<typeof esquemaRecurso>;
export type DatosCampana = z.infer<typeof esquemaCampana>;
