import Link from "next/link";
import { Markdown } from "@/components/markdown";
import { AvatarIniciales } from "@/components/ui/avatar";
import { Card } from "@/components/ui/card";
import { Icono } from "@/components/ui/icono";
import { armarOrganigrama, type FilaOrganigrama, type Persona } from "@/lib/dominio/organigrama";
import { ETIQUETA_ROL } from "@/lib/dominio/roles";
import { requerirPerfil } from "@/lib/supabase/permisos";
import { crearClienteServidor } from "@/lib/supabase/servidor";

function Fila({ p, destacado }: { p: Persona; destacado?: boolean }) {
  const extra = [p.puesto, ...p.subroles].filter(Boolean).join(" · ");
  return (
    <li className="flex items-center gap-3 py-1.5">
      <AvatarIniciales nombre={`${p.nombre} ${p.apellido}`} className="size-9 text-xs" />
      <span className="flex min-w-0 flex-col">
        <span className={destacado ? "font-bold" : "font-medium"}>
          {p.nombre} {p.apellido}
          {destacado && (
            <span className="ml-1.5 rounded-chip bg-primary-soft px-1.5 py-0.5 text-[10px] font-bold text-primary-strong">
              Líder
            </span>
          )}
        </span>
        {extra && <span className="text-xs text-muted">{extra}</span>}
      </span>
    </li>
  );
}

function Grupo({ titulo, personas }: { titulo: string; personas: Persona[] }) {
  if (personas.length === 0) return null;
  return (
    <div>
      <h4 className="text-overline uppercase text-muted">{titulo}</h4>
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
        <Link
          href="/organigrama/derivaciones"
          className="inline-flex min-h-11 items-center gap-1 text-sm font-semibold text-primary-strong"
        >
          Áreas de derivación
          <Icono nombre="flecha-der" tamano={16} />
        </Link>
      </div>

      {org.directores.length > 0 && (
        <Card className="border-primary/40 p-4">
          <h2 className="text-overline uppercase text-muted">Dirección · todos los CAU</h2>
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
            className="acordeon group rounded-tarjeta bg-card shadow-1"
          >
            <summary className="flex min-h-14 cursor-pointer list-none items-center gap-2 px-5 text-h3 [&::-webkit-details-marker]:hidden">
              <span className="flex-1">
                CAU {s.nombre}
                <span className="ml-2 text-sm font-normal text-muted">
                  {s.equipos.length} {s.equipos.length === 1 ? "equipo" : "equipos"}
                </span>
              </span>
              <Icono nombre="chevron-der" className="text-muted transition-transform group-open:rotate-90" />
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
                <div key={e.id} className="rounded-boton bg-surface-2 p-4">
                  <h3 className="mb-1 font-bold">
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
