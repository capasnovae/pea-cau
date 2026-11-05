import { z } from "zod";
import { ROLES, type RolApp } from "./roles";

const ROLES_CON_SEDE: RolApp[] = ["asesor", "lider", "coordinador"];

const opcionalUuid = z.preprocess((v) => (v === "" || v === undefined ? null : v), z.uuid().nullable());
const opcionalArea = z.preprocess((v) => (v === "" || v === undefined ? null : v), z.enum(["servicio", "ventas"]).nullable());

export const esquemaInvitacion = z
  .object({
    email: z.email("Revisá el email.").transform((v) => v.trim().toLowerCase()),
    nombre: z.string().trim().min(1, "Falta el nombre.").max(80),
    apellido: z.string().trim().min(1, "Falta el apellido.").max(80),
    rol: z.enum(ROLES as [RolApp, ...RolApp[]]),
    sede_id: opcionalUuid,
    area: opcionalArea,
    puesto_id: opcionalUuid,
  })
  .superRefine((d, ctx) => {
    if (ROLES_CON_SEDE.includes(d.rol)) {
      if (!d.sede_id) ctx.addIssue({ code: "custom", path: ["sede_id"], message: "Elegí la sede." });
      if (!d.area) ctx.addIssue({ code: "custom", path: ["area"], message: "Elegí el área." });
    }
  });

export type DatosInvitacion = z.infer<typeof esquemaInvitacion>;

export function mensajeErrorInvitacion(mensajeOriginal: string): string {
  if (/already (been )?registered|already exists/i.test(mensajeOriginal)) return "Ya existe un usuario con ese email.";
  return "No pudimos mandar la invitación. Probá de nuevo.";
}

export const esquemaAsignacion = z
  .object({
    id: z.uuid(),
    sede_id: opcionalUuid,
    area: opcionalArea,
    equipo_id: opcionalUuid,
    puesto_id: opcionalUuid,
    subrol_ids: z.array(z.uuid()).default([]),
  })
  .refine((d) => !d.equipo_id || (d.sede_id && d.area), {
    path: ["equipo_id"],
    message: "Para asignar un equipo, elegí sede y área.",
  });

export type DatosAsignacion = z.infer<typeof esquemaAsignacion>;
