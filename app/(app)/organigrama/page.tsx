import Link from "next/link";
import { Markdown } from "@/components/markdown";
import { Card } from "@/components/ui/card";
import { armarOrganigrama, type FilaOrganigrama, type Persona } from "@/lib/dominio/organigrama";
import { ETIQUETA_ROL } from "@/lib/dominio/roles";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

function Fila({ p, destacado }: { p: Persona; destacado?: boolean }) {
  const extra = [p.puesto, ...p.subroles].filter(Boolean).join(" · ");
  return (
    <li className="flex flex-col py-1">
      <span className={destacado ? "font-semibold" : ""}>
        {p.nombre} {p.apellido}
        {destacado && <span className="ml-1 text-xs font-normal text-primary">Líder</span>}
      </span>
      {extra && <span className="text-xs text-muted">{extra}</span>}
    </li>
  );
}

function Grupo({ titulo, personas }: { titulo: string; personas: Persona[] }) {
  if (personas.length === 0) return null;
  return (
    <div>
      <h4 className="text-xs font-semibold uppercase tracking-wide text-muted">{titulo}</h4>
      <ul>
        {personas.map((p) => (
          <Fila key={p.id} p={p} />
        ))}
      </ul>
    </div>
  );
}

export default async function PaginaOrganigrama() {
  const perfil = await requerirPerfil();
  const supabase = await crearClienteServidor();
  const [{ data }, { data: puestos }, { data: subroles }, { data: sedes }] = await Promise.all([
    supabase.rpc("organigrama"),
    supabase.from("puestos").select("id, nombre, descripcion_md").order("orden"),
    supabase.from("subroles").select("id, nombre, descripcion_md").order("orden"),
    supabase.from("sedes").select("id, nombre").eq("activa", true),
  ]);
  const org = armarOrganigrama((data ?? []) as FilaOrganigrama[], sedes ?? []);

  return (
    <div className="flex flex-col gap-5">
      <div className="flex flex-wrap items-end justify-between gap-2">
        <div>
          <h1 className="text-h1">Organigrama</h1>
          <p className="text-sm text-muted">Quién es quién en los CAU.</p>
        </div>
        <Link href="/organigrama/derivaciones" className="text-sm text-primary">
          Áreas de derivación →
        </Link>
      </div>

      {org.directores.length > 0 && (
        <Card className="border-primary/40 p-4">
          <h2 className="text-xs font-semibold uppercase tracking-wide text-muted">
            Dirección · todos los CAU
          </h2>
          <ul>
            {org.directores.map((p) => (
              <Fila key={p.id} p={{ ...p, puesto: p.puesto ?? ETIQUETA_ROL[p.rol] }} />
            ))}
          </ul>
        </Card>
      )}

      <div className="flex flex-col gap-3" aria-label="Sedes">
        {org.sedes.map((s) => (
          <details
            key={s.id}
            open={s.id === perfil.sede_id}
            className="rounded-xl border border-border bg-card shadow-sm"
          >
            <summary className="cursor-pointer list-none p-4 font-semibold [&::-webkit-details-marker]:hidden">
              CAU {s.nombre}
              <span className="ml-2 text-sm font-normal text-muted">
                {s.equipos.length} {s.equipos.length === 1 ? "equipo" : "equipos"}
              </span>
            </summary>
            <div className="flex flex-col gap-4 border-t border-border p-4">
              {s.equipos.length +
                s.coordinadores.servicio.length +
                s.coordinadores.ventas.length +
                s.sinEquipo.servicio.length +
                s.sinEquipo.ventas.length ===
                0 && <p className="text-sm text-muted">Todavía no hay personas cargadas en esta sede.</p>}
              <div className="grid gap-3 sm:grid-cols-2">
                <Grupo titulo="Coordinación de alumnado" personas={s.coordinadores.servicio} />
                <Grupo titulo="Coordinación de ventas" personas={s.coordinadores.ventas} />
              </div>
              {s.equipos.map((e) => (
                <div key={e.id} className="rounded-lg border border-border p-3">
                  <h3 className="font-medium">
                    {e.nombre}
                    {e.area && (
                      <span className="ml-2 text-xs text-muted">
                        {e.area === "servicio" ? "Servicio" : "Ventas"}
                      </span>
                    )}
                  </h3>
                  <ul>
                    {e.lider && <Fila p={e.lider} destacado />}
                    {e.miembros.map((p) => (
                      <Fila key={p.id} p={p} />
                    ))}
                  </ul>
                </div>
              ))}
              <div className="grid gap-3 sm:grid-cols-2">
                <Grupo titulo="Servicio · sin equipo" personas={s.sinEquipo.servicio} />
                <Grupo titulo="Ventas · sin equipo" personas={s.sinEquipo.ventas} />
              </div>
            </div>
          </details>
        ))}
      </div>

      <Card>
        <h2 className="mb-3 text-h2">Qué hace cada puesto</h2>
        <dl className="flex flex-col gap-3">
          {[...(puestos ?? []), ...(subroles ?? [])].map((p) => (
            <div key={p.id}>
              <dt className="font-medium">{p.nombre}</dt>
              <dd className="text-sm text-muted">
                {p.descripcion_md ? <Markdown texto={p.descripcion_md} /> : "—"}
              </dd>
            </div>
          ))}
        </dl>
      </Card>
    </div>
  );
}
