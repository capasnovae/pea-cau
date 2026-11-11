import { Logo } from "@/components/marca/logo";
import { ElegirRol } from "./elegir-rol";

const NIVELES = [
  { n: "N1", nombre: "Base", x: 30, y: 270, color: "var(--nivel-1)" },
  { n: "N2", nombre: "Operativo", x: 200, y: 190, color: "var(--nivel-2)" },
  { n: "N3", nombre: "Avanzado", x: 330, y: 110, color: "var(--nivel-3)" },
  { n: "N4", nombre: "Referente", x: 480, y: 30, color: "var(--nivel-4)" },
];

export default function PaginaBienvenida() {
  return (
    <main className="flex min-h-dvh flex-1 flex-col md:flex-row">
      <section
        aria-label="PEA"
        className="sobre-oscuro flex flex-col bg-nav px-6 py-8 text-white md:w-[620px] md:px-14 md:py-14"
      >
        <Logo tamano={40} />
        <span className="text-[13px] text-nav-fg-muted">Perfil Evolutivo de Asesor</span>
        <h1 className="mt-8 text-3xl font-extrabold leading-tight md:mt-16 md:text-[44px]">
          Cada día sabés
          <br />
          un poco más.
        </h1>
        <svg
          aria-hidden="true"
          viewBox="0 0 508 320"
          className="mt-auto w-full max-w-[320px] pt-6 md:max-w-[508px] md:pt-10"
        >
          <path
            d="M30 270 C 140 270, 120 190, 200 190 S 300 120, 330 110 S 430 40, 480 30"
            fill="none"
            stroke="var(--primary-strong)"
            strokeWidth="6"
            strokeLinecap="round"
            strokeDasharray="2 14"
          />
          {NIVELES.map((n) => (
            <g key={n.n} fontWeight="800">
              <circle cx={n.x} cy={n.y} r="24" style={{ fill: n.color }} />
              <text x={n.x} y={n.y + 6} textAnchor="middle" fill="#fff" fontSize="15">
                {n.n}
              </text>
              <text
                x={n.x}
                y={n.y + 44}
                textAnchor="middle"
                style={{ fill: "var(--nav-fg)" }}
                fontSize="12"
                fontWeight="600"
              >
                {n.nombre}
              </text>
            </g>
          ))}
        </svg>
      </section>
      <section className="flex flex-1 flex-col justify-center gap-5 px-6 py-10 md:px-[110px]">
        <h2 className="text-h1">¿Cómo ingresás?</h2>
        <ElegirRol />
      </section>
    </main>
  );
}
