// Motion graphics reutilizables: íconos animados, partículas de fondo, confeti y la placa de capítulo.
import { Circle, Layout, Line, Node, Rect, Txt } from "@revideo/2d";
import type { Reference, ThreadGenerator } from "@revideo/core";
import { all, createRef, easeInOutSine, easeOutBack, easeOutCubic, linear, loop, spawn, waitFor } from "@revideo/core";

export type IconoTipo = "lupa" | "calendario" | "estrella" | "alerta" | "correo" | "notebook" | "wifi" | "check";

const TINTA = "#1f1d2b";
const PRIMARIO = "#4f46e5";
const AVISO = "#f59e0b";
const OK = "#10b981";
const LETRA = "Plus Jakarta Sans";

/** Ícono grande que se mueve solo mientras dura el plano. */
export function IconoAnimado({ tipo, x = 0, y = 0, tam = 250 }: { tipo: IconoTipo; x?: number; y?: number; tam?: number }) {
  const caja = createRef<Node>();
  const a = createRef<Node>();
  const b = createRef<Node>();
  const arcos = [createRef<Circle>(), createRef<Circle>(), createRef<Circle>()];
  const lineas = [createRef<Rect>(), createRef<Rect>(), createRef<Rect>()];
  const anillo = createRef<Circle>();
  const dia = createRef<Circle>();
  const fondo = "#ffffff";
  const n = (
    <Node ref={caja} x={x} y={y} scale={0}>
      <Circle size={tam} fill={fondo} stroke={TINTA} lineWidth={4} shadowColor="rgba(28,25,23,0.95)" shadowBlur={0} shadowOffset={[6, 6]} />
      <Circle ref={anillo} size={tam + 34} stroke="#e0452f" lineWidth={6} endAngle={0} lineDash={[14, 10]} />
      <Node scale={tam / 250}>
        {tipo === "correo" && (
          <Node ref={a}>
            <Rect ref={b} width={90} height={70} y={-10} radius={8} fill="#ffffff" stroke={TINTA} lineWidth={5}>
              <Txt text="@" fontFamily={LETRA} fontSize={44} fontWeight={800} fill={PRIMARIO} y={-6} />
            </Rect>
            <Rect width={150} height={100} y={20} radius={14} fill={PRIMARIO} stroke={TINTA} lineWidth={6} />
            <Line points={[[-72, -26], [0, 30], [72, -26]]} stroke={TINTA} lineWidth={6} lineJoin="round" fill="#6366f1" />
          </Node>
        )}
        {tipo === "notebook" && (
          <Node ref={a}>
            <Rect width={150} height={100} y={-20} radius={10} fill="#ffffff" stroke={TINTA} lineWidth={6}>
              <Circle size={10} y={-38} fill={OK} />
              {lineas.map((r, i) => (
                <Rect ref={r} x={-40} y={-12 + i * 22} offset={[-1, 0]} width={0} height={10} radius={5} fill={i === 2 ? OK : PRIMARIO} />
              ))}
            </Rect>
            <Line points={[[-95, 42], [95, 42], [80, 56], [-80, 56]]} closed fill="#c7d2fe" stroke={TINTA} lineWidth={6} lineJoin="round" />
          </Node>
        )}
        {tipo === "wifi" && (
          <Node ref={a} y={30}>
            {arcos.map((r, i) => (
              <Circle ref={r} size={60 + i * 55} startAngle={225} endAngle={315} stroke={PRIMARIO} lineWidth={14} lineCap="round" opacity={0.25} />
            ))}
            <Circle size={22} y={0} fill={PRIMARIO} />
          </Node>
        )}
        {tipo === "alerta" && (
          <Node ref={a}>
            <Line points={[[0, -70], [78, 60], [-78, 60]]} closed fill={AVISO} stroke={TINTA} lineWidth={6} lineJoin="round" />
            <Rect width={14} height={50} y={-2} radius={7} fill={TINTA} />
            <Circle size={16} y={38} fill={TINTA} />
          </Node>
        )}
        {tipo === "lupa" && (
          <Node>
            <Rect width={120} height={140} radius={12} fill="#ffffff" stroke={TINTA} lineWidth={5}>
              {[0, 1, 2, 3].map((i) => (
                <Rect x={-10} y={-40 + i * 26} width={70 - (i % 2) * 20} height={10} radius={5} fill="#c7d2fe" />
              ))}
            </Rect>
            <Node ref={a} x={20} y={10}>
              <Circle size={70} fill="rgba(255,255,255,0.5)" stroke={PRIMARIO} lineWidth={12} />
              <Line points={[[26, 26], [56, 56]]} stroke={PRIMARIO} lineWidth={16} lineCap="round" />
            </Node>
          </Node>
        )}
        {tipo === "calendario" && (
          <Node ref={a}>
            <Rect width={150} height={140} radius={16} fill="#ffffff" stroke={TINTA} lineWidth={6} />
            <Rect width={150} height={38} y={-51} radius={[16, 16, 0, 0]} fill={PRIMARIO} />
            {Array.from({ length: 9 }, (_, i) => (
              <Rect x={-44 + (i % 3) * 44} y={-6 + Math.floor(i / 3) * 32} width={26} height={18} radius={5} fill="#e0e7ff" />
            ))}
            <Circle ref={dia} x={44} y={58} size={44} stroke={AVISO} lineWidth={6} endAngle={0} />
          </Node>
        )}
        {tipo === "estrella" && (
          <Node ref={a}>
            <Line
              points={Array.from({ length: 10 }, (_, i) => {
                const r = i % 2 ? 34 : 80;
                const ang = (Math.PI / 5) * i - Math.PI / 2;
                return [Math.cos(ang) * r, Math.sin(ang) * r] as [number, number];
              })}
              closed
              fill={AVISO}
              stroke={TINTA}
              lineWidth={6}
              lineJoin="round"
            />
          </Node>
        )}
        {tipo === "check" && (
          <Node ref={a}>
            <Circle size={150} fill={OK} />
            <Line points={[[-40, 4], [-12, 32], [44, -28]]} stroke="#ffffff" lineWidth={18} lineCap="round" lineJoin="round" />
          </Node>
        )}
      </Node>
    </Node>
  ) as Node;

  /** Entra con un rebote y después queda en movimiento. */
  function* animar(): ThreadGenerator {
    yield* all(caja().scale(1, 0.6, easeOutBack), anillo().endAngle(360, 0.9, easeOutCubic));
    switch (tipo) {
      case "correo":
        yield* loop(Infinity, function* () {
          yield* b().y(-70, 0.7, easeOutCubic);
          yield* waitFor(0.8);
          yield* b().y(-10, 0.6, easeInOutSine);
          yield* waitFor(0.6);
        });
        break;
      case "notebook":
        yield* loop(Infinity, function* () {
          for (const r of lineas) yield* r().width(80, 0.35, easeOutCubic);
          yield* waitFor(1);
          yield* all(...lineas.map((r) => r().width(0, 0.3)));
        });
        break;
      case "wifi":
        yield* loop(Infinity, function* () {
          for (const r of arcos) yield* r().opacity(1, 0.25);
          yield* waitFor(0.5);
          yield* all(...arcos.map((r) => r().opacity(0.25, 0.3)));
        });
        break;
      case "alerta":
        yield* loop(Infinity, function* () {
          yield* waitFor(1.4);
          for (let i = 0; i < 3; i++) {
            yield* a().rotation(8, 0.06);
            yield* a().rotation(-8, 0.12);
          }
          yield* a().rotation(0, 0.06);
        });
        break;
      case "lupa":
        yield* loop(Infinity, function* () {
          yield* a().position([-20, -30], 0.9, easeInOutSine);
          yield* a().position([25, -5], 0.9, easeInOutSine);
          yield* a().position([-10, 35], 0.9, easeInOutSine);
          yield* a().position([20, 10], 0.9, easeInOutSine);
        });
        break;
      case "calendario":
        yield* loop(Infinity, function* () {
          yield* dia().endAngle(360, 0.7, easeOutCubic);
          yield* waitFor(1.2);
          dia().endAngle(0);
          yield* waitFor(0.3);
        });
        break;
      case "estrella":
        yield* loop(Infinity, function* () {
          yield* a().rotation(a().rotation() + 72, 2.4, easeInOutSine);
        });
        break;
      case "check":
        yield* loop(Infinity, function* () {
          yield* a().scale(1.08, 0.5, easeInOutSine);
          yield* a().scale(1, 0.5, easeInOutSine);
        });
        break;
    }
  }
  return { nodo: n, animar };
}

/** Formas chicas que suben despacio y giran: dan vida al fondo. */
export function Particulas({ color, cantidad = 12 }: { color: string; cantidad?: number }) {
  const refs = Array.from({ length: cantidad }, () => createRef<Node>());
  const n = (
    <Node>
      {refs.map((r, i) => {
        const x = -500 + ((i * 263) % 1000);
        const y = -600 + ((i * 397) % 1200);
        const tipo = i % 3;
        return (
          <Node ref={r} x={x} y={y} opacity={0.35}>
            {tipo === 0 && <Circle size={16 + (i % 4) * 6} fill={color} />}
            {tipo === 1 && <Circle size={26 + (i % 3) * 8} stroke={color} lineWidth={5} />}
            {tipo === 2 && (
              <Node>
                <Rect width={26} height={7} radius={3} fill={color} />
                <Rect width={7} height={26} radius={3} fill={color} />
              </Node>
            )}
          </Node>
        );
      })}
    </Node>
  ) as Node;
  refs.forEach((r, i) =>
    spawn(
      loop(Infinity, function* () {
        const dur = 9 + (i % 5) * 2;
        yield* all(r().y(r().y() - 160, dur, linear), r().rotation(r().rotation() + 180, dur, linear));
        r().y(r().y() + 160);
      }),
    ),
  );
  return n;
}

/** Lluvia de papelitos de colores. */
export function confeti(destino: Node): ThreadGenerator {
  const colores = ["#f59e0b", "#10b981", "#6366f1", "#ec4899", "#38bdf8", "#facc15"];
  const piezas = Array.from({ length: 46 }, (_, i) => {
    const r = (
      <Rect
        width={14 + (i % 3) * 6}
        height={8 + (i % 2) * 8}
        radius={3}
        fill={colores[i % colores.length]}
        x={-100 + ((i * 53) % 200)}
        y={-200}
        rotation={(i * 37) % 360}
      />
    ) as Rect;
    destino.add(r);
    return r;
  });
  return all(
    ...piezas.map((p, i) =>
      (function* () {
        const dx = -520 + ((i * 131) % 1040);
        yield* all(p.x(dx, 0.6, easeOutCubic), p.y(-620 + ((i * 71) % 300), 0.6, easeOutCubic));
        yield* all(p.y(800, 2.4 + (i % 5) * 0.3, (v) => v * v), p.rotation(p.rotation() + 540, 2.6), p.x(dx + ((i % 2) ? 60 : -60), 2.6, easeInOutSine));
        p.remove();
      })(),
    ),
  );
}

/** Placa de capítulo: número que se dibuja y título que sube palabra por palabra. */
export function Capitulo({ numero, texto, raiz }: { numero?: string; texto: string; raiz: Reference<Node> }) {
  const aro = createRef<Circle>();
  const num = createRef<Txt>();
  const palabras = texto.split(/\s+/).map(() => createRef<Txt>());
  const barras = [createRef<Rect>(), createRef<Rect>(), createRef<Rect>()];
  const n = (
    <Node ref={raiz}>
      <Rect width={1080} height={1350} fill={PRIMARIO} />
      <Particulas color="#a5b4fc" cantidad={14} />
      {barras.map((r, i) => (
        <Rect ref={r} x={-900} y={-420 + i * 300} width={700} height={18} radius={9} fill={["#818cf8", "#f59e0b", "#34d399"][i]} rotation={-12} />
      ))}
      {numero && (
        <Node y={-260}>
          <Circle ref={aro} size={230} stroke="#ffffff" lineWidth={12} endAngle={0} />
          <Txt ref={num} text={numero} fontFamily={LETRA} fontSize={120} fontWeight={800} fill="#ffffff" scale={0} />
        </Node>
      )}
      <Layout layout direction="row" wrap="wrap" justifyContent="center" gap={22} width={900} y={numero ? 60 : -100}>
        {texto.split(/\s+/).map((p, i) => (
          <Rect layout>
            <Txt ref={palabras[i]} text={p} fontFamily={LETRA} fontSize={88} fontWeight={800} fill="#ffffff" opacity={0} scale={0.6} />
          </Rect>
        ))}
      </Layout>
    </Node>
  ) as Node;
  function* animar(): ThreadGenerator {
    const cruzan = all(...barras.map((r, i) => r().x(900, 1.6 + i * 0.2, easeInOutSine)));
    yield* all(cruzan, (function* () {
      if (numero) yield* all(aro().endAngle(360, 0.6, easeOutCubic), num().scale(1, 0.5, easeOutBack));
      yield* entran();
    })());
  }
  function* entran(): ThreadGenerator {
    // los hilos que se lanzan acá se cortan cuando termina esta función: se espera a que terminen todas
    yield* all(...palabras.map((p, i) => (function* () {
      yield* waitFor(i * 0.08);
      yield* all(p().opacity(1, 0.3), p().scale(1, 0.45, easeOutBack));
    })()));
  }
  return { nodo: n, animar };
}
