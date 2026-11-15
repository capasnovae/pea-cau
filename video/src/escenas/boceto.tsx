// Muñeco de palitos dibujado a mano: trazo de lápiz que "tiembla" apenas (como la animación cuadro a cuadro),
// cabeza grande con cara muy expresiva, manos con dedos y rayitas de movimiento. Cada persona lleva un detalle de color.
import { Circle, Line, Node } from "@revideo/2d";
import type { Reference, ThreadGenerator } from "@revideo/core";
import { all, createRef, easeInOutCubic, easeInOutSine, loop, spawn, waitFor } from "@revideo/core";
import { POSES } from "./muneco.tsx";
import type { Pose } from "./muneco.tsx";

const TINTA = "#1f1d1b";
type P = [number, number];

export type Rasgo = "rodete-anteojos" | "pelo-corto-corbata" | "colita-mochila" | "rulos" | "gorra";
export type LookBoceto = { rasgo: Rasgo; color: string };
export type Cara = "contenta" | "normal" | "sorpresa" | "seria" | "duda" | "triste";

// ---- trazo de lápiz ----
type Trazo = { lineas: Line[]; base: P[]; cerrado: boolean };
const trazos: Trazo[] = [];
let semilla = 1;
const azar = () => {
  semilla = (semilla * 16807) % 2147483647;
  return semilla / 2147483647 - 0.5;
};
function temblar(pts: P[], a: number): P[] {
  return pts.map(([x, y]) => [x + azar() * a, y + azar() * a] as P);
}
/** Una línea a mano: dos pasadas apenas corridas, la segunda más finita y clara. */
function trazo(pts: P[], ancho = 7, cerrado = false, color = TINTA, relleno?: string): Node {
  const l1 = (<Line points={temblar(pts, 2)} stroke={color} lineWidth={ancho} lineCap="round" lineJoin="round" closed={cerrado} fill={relleno} />) as Line;
  const l2 = (<Line points={temblar(pts, 3)} stroke={color} lineWidth={ancho * 0.45} lineCap="round" lineJoin="round" closed={cerrado} opacity={0.55} />) as Line;
  trazos.push({ lineas: [l1, l2], base: pts, cerrado });
  return (<Node>{l1}{l2}</Node>) as Node;
}
/** Segmento recto con un punto en el medio, para que tiemble como lápiz. */
const seg = (a: P, b: P, ancho = 7, color = TINTA) => trazo([a, [(a[0] + b[0]) / 2, (a[1] + b[1]) / 2], b], ancho, false, color);
function circulo(r: number, cx = 0, cy = 0, n = 26): P[] {
  return Array.from({ length: n }, (_, i) => {
    const t = (i / n) * Math.PI * 2;
    return [cx + Math.cos(t) * r, cy + Math.sin(t) * r] as P;
  });
}
function arco(r: number, desde: number, hasta: number, cx = 0, cy = 0, n = 12): P[] {
  return Array.from({ length: n + 1 }, (_, i) => {
    const t = ((desde + ((hasta - desde) * i) / n) * Math.PI) / 180;
    return [cx + Math.cos(t) * r, cy + Math.sin(t) * r] as P;
  });
}

/** Hace temblar todos los trazos cada tanto, como los dibujos animados a mano ("boil"). */
export function hervir() {
  spawn(
    loop(Infinity, function* () {
      yield* waitFor(1 / 8);
      for (const t of trazos) {
        if (!t.lineas[0].parent()) continue;
        t.lineas[0].points(temblar(t.base, 2.2));
        t.lineas[1].points(temblar(t.base, 3.2));
      }
    }),
  );
}

// Esqueleto: brazos largos, cuerpo de un trazo, piernas largas, cabeza grande
const M = { cadera: -250, cuello: -470, cabeza: -555, radio: 82, brazo: 105, antebrazo: 95, muslo: 125, pierna: 125 };

export function crearBoceto({ look, x = 0, y = 0, escala = 1, espejo = false }: { look: LookBoceto; x?: number; y?: number; escala?: number; espejo?: boolean }) {
  const raiz = createRef<Node>();
  const cuerpo = createRef<Node>();
  const cabeza = createRef<Node>();
  const parpados = createRef<Node>();
  const movimiento = createRef<Node>();
  const caras: Record<Cara, Reference<Node>> = { contenta: createRef(), normal: createRef(), sorpresa: createRef(), seria: createRef(), duda: createRef(), triste: createRef() };
  const bocaHabla = createRef<Node>();
  const j = {
    hombroI: createRef<Node>(),
    codoI: createRef<Node>(),
    hombroD: createRef<Node>(),
    codoD: createRef<Node>(),
    piernaI: createRef<Node>(),
    rodillaI: createRef<Node>(),
    piernaD: createRef<Node>(),
    rodillaD: createRef<Node>(),
  };

  const mano = (lado: "I" | "D") => {
    const s = lado === "I" ? -1 : 1;
    return (
      <Node y={M.antebrazo} scale={1.45}>
        {trazo(circulo(15, 0, 14, 12), 6, true, TINTA, "#ffffff")}
        {seg([-10 * s, 24], [-14 * s, 46], 5)}
        {seg([-3 * s, 28], [-4 * s, 52], 5)}
        {seg([5 * s, 27], [7 * s, 50], 5)}
        {seg([12 * s, 22], [17 * s, 42], 5)}
        {seg([14 * s, 8], [30 * s, 2], 5)}
      </Node>
    );
  };
  const brazo = (lado: "I" | "D") => (
    <Node ref={lado === "I" ? j.hombroI : j.hombroD} y={M.cuello + 28}>
      {seg([0, 0], [0, M.brazo])}
      <Node ref={lado === "I" ? j.codoI : j.codoD} y={M.brazo}>
        {seg([0, 0], [0, M.antebrazo])}
        {mano(lado)}
      </Node>
    </Node>
  );
  const pierna = (lado: "I" | "D") => (
    <Node ref={lado === "I" ? j.piernaI : j.piernaD} y={M.cadera}>
      {seg([0, 0], [0, M.muslo])}
      <Node ref={lado === "I" ? j.rodillaI : j.rodillaD} y={M.muslo}>
        {seg([0, 0], [0, M.pierna])}
        {seg([0, M.pierna], [lado === "I" ? -30 : 30, M.pierna + 4], 8)}
      </Node>
    </Node>
  );

  const R = M.radio;
  const ojos = (dy = -8) => (
    <Node y={dy}>
      <Circle x={-26} size={[18, 26]} fill={TINTA} />
      <Circle x={26} size={[18, 26]} fill={TINTA} />
      <Circle x={-23} y={-6} size={6} fill="#ffffff" />
      <Circle x={29} y={-6} size={6} fill="#ffffff" />
    </Node>
  );
  const rasgo = () => {
    const c = look.color;
    switch (look.rasgo) {
      case "rodete-anteojos":
        return [
          trazo(circulo(30, 0, -R - 22, 14), 7, true, TINTA, "#ffffff"),
          trazo(circulo(24, -28, -10, 14), 5, true),
          trazo(circulo(24, 28, -10, 14), 5, true),
          seg([-5, -10], [5, -10], 5),
        ];
      case "pelo-corto-corbata":
        return [
          trazo([[-60, -R + 26], [-40, -R - 6], [-18, -R + 10], [0, -R - 10], [20, -R + 8], [42, -R - 6], [62, -R + 24]], 7),
        ];
      case "colita-mochila":
        return [trazo([[R - 10, -40], [R + 40, -70], [R + 55, -20], [R + 30, 10]], 7, false, TINTA), trazo(circulo(9, R - 4, -40, 8), 5, true, c, c)];
      case "rulos":
        return Array.from({ length: 7 }, (_, i) => trazo(circulo(16, -60 + i * 20, -R + 6 - Math.sin((i / 6) * Math.PI) * 18, 10), 6, true));
      case "gorra":
        return [trazo([[-R + 4, -26], [-R + 14, -R + 10], [R - 14, -R + 10], [R - 4, -26]], 7, false, TINTA, c), seg([R - 6, -28], [R + 50, -22], 8, c)];
    }
  };
  // detalle de color sobre el cuerpo: bufanda, corbata o tira de mochila
  const detalleCuerpo = () => {
    const c = look.color;
    switch (look.rasgo) {
      case "rodete-anteojos":
        return [seg([-34, M.cuello + 8], [34, M.cuello + 8], 14, c), seg([18, M.cuello + 8], [26, M.cuello + 60], 12, c)];
      case "pelo-corto-corbata":
        return [trazo([[0, M.cuello + 10], [14, M.cuello + 50], [0, M.cuello + 100], [-14, M.cuello + 50]], 5, true, TINTA, c)];
      case "colita-mochila":
        return [seg([-30, M.cuello + 20], [10, M.cadera - 10], 12, c)];
      default:
        return [seg([-30, M.cuello + 8], [30, M.cuello + 8], 12, c)];
    }
  };

  const n = (
    <Node ref={raiz} x={x} y={y} scale={escala} scaleX={espejo ? -escala : escala}>
      <Node ref={cuerpo}>
        {pierna("I")}
        {pierna("D")}
        {brazo("I")}
        {seg([0, M.cadera], [0, M.cuello])}
        {detalleCuerpo()}
        {brazo("D")}
        <Node ref={cabeza} y={M.cabeza}>
          {trazo(circulo(R), 8, true, TINTA, "#ffffff")}
          {/* sombreado de lápiz a un costado */}
          {trazo(arco(R - 12, 20, 80), 3, false, "#8a8580")}
          {rasgo()}
          <Node ref={parpados}>
            <Node ref={caras.contenta}>
              {ojos()}
              {trazo([...arco(40, 10, 170, 0, 18)], 6, true, TINTA, TINTA)}
              <Circle y={44} size={[30, 16]} fill="#f87171" />
            </Node>
            <Node ref={caras.normal} opacity={0}>
              {ojos()}
              {trazo(arco(30, 25, 155, 0, 14), 6)}
            </Node>
            <Node ref={caras.sorpresa} opacity={0}>
              {ojos(-12)}
              {trazo(circulo(14, 0, 34, 12), 6, true, TINTA, TINTA)}
              {seg([-38, -44], [-16, -50], 5)}
              {seg([16, -50], [38, -44], 5)}
            </Node>
            <Node ref={caras.seria} opacity={0}>
              {ojos()}
              {seg([-42, -36], [-14, -28], 6)}
              {seg([42, -36], [14, -28], 6)}
              {seg([-18, 36], [18, 36], 6)}
            </Node>
            <Node ref={caras.duda} opacity={0}>
              {ojos()}
              {seg([-40, -34], [-14, -32], 6)}
              {seg([14, -44], [40, -52], 6)}
              {trazo([[-20, 38], [-6, 32], [8, 38], [22, 32]], 6)}
            </Node>
            <Node ref={caras.triste} opacity={0}>
              {ojos()}
              {trazo(arco(26, 205, 335, 0, 54), 6)}
            </Node>
          </Node>
          <Node ref={bocaHabla} y={28} opacity={0}>
            {trazo(circulo(18, 0, 6, 12), 6, true, TINTA, TINTA)}
          </Node>
        </Node>
        {/* rayitas de movimiento junto a la mano que saluda */}
        <Node ref={movimiento} opacity={0} x={235} y={M.cuello - 120}>
          {trazo(arco(30, 200, 250), 5)}
          {trazo(arco(30, 290, 340), 5)}
        </Node>
      </Node>
    </Node>
  ) as Node;

  let caraActual: Cara = "contenta";
  function* cara(c: Cara): ThreadGenerator {
    if (c === caraActual) return;
    const sale = caras[caraActual]();
    const entra = caras[c]();
    caraActual = c;
    yield* all(sale.opacity(0, 0.1), cabeza().scale(1.08, 0.1));
    yield* all(entra.opacity(1, 0.1), cabeza().scale(1, 0.25, easeInOutCubic));
  }
  function aplicar(p: Pose) {
    for (const k of Object.keys(j) as (keyof typeof j)[]) j[k]().rotation(p[k]);
  }
  aplicar(POSES.reposo);
  function* pose(nombre: keyof typeof POSES | Pose, dur = 0.5): ThreadGenerator {
    const p = typeof nombre === "string" ? POSES[nombre] : nombre;
    yield* all(
      ...(Object.keys(j) as (keyof typeof j)[]).map((k) => j[k]().rotation(p[k], dur, easeInOutCubic)),
      cabeza().rotation(p.cabeza, dur, easeInOutCubic),
      cuerpo().rotation(p.torso, dur, easeInOutCubic),
    );
  }
  function vivir() {
    spawn(
      loop(Infinity, function* () {
        yield* cuerpo().y(-6, 1.4, easeInOutSine);
        yield* cuerpo().y(0, 1.4, easeInOutSine);
      }),
    );
    spawn(
      loop(Infinity, function* () {
        yield* waitFor(2.4 + Math.random() * 2);
        yield* parpados().scale.y(0.1, 0.06);
        yield* parpados().scale.y(1, 0.08);
      }),
    );
  }
  /** Habla: se alterna la boca abierta con la de la cara del momento, y la cabeza acompaña. */
  function* hablar(dur: number, palabras?: { t: number; d: number }[]): ThreadGenerator {
    const marcas = palabras?.length ? palabras : Array.from({ length: Math.floor(dur / 0.22) }, (_, i) => ({ t: i * 0.22, d: 0.14 }));
    let t = 0;
    for (const [i, w] of marcas.entries()) {
      if (w.t > t) yield* waitFor(w.t - t);
      const abierta = Math.min(0.13, w.d * 0.6);
      bocaHabla().opacity(1);
      yield* all(bocaHabla().scale.y(i % 3 === 0 ? 1.3 : 0.9, abierta), cabeza().rotation(i % 2 ? 2 : -2, abierta));
      bocaHabla().opacity(0);
      t = w.t + abierta;
    }
    yield* cabeza().rotation(0, 0.15);
  }
  function* caminar(hastaX: number, dur: number): ThreadGenerator {
    const pasos = Math.max(2, Math.round(dur / 0.42));
    const d = dur / pasos;
    spawn(raiz().x(hastaX, dur, (v) => v));
    for (let i = 0; i < pasos; i++) {
      const s = i % 2 ? 1 : -1;
      yield* all(
        j.piernaI().rotation(26 * s, d, easeInOutSine),
        j.piernaD().rotation(-26 * s, d, easeInOutSine),
        j.rodillaI().rotation(s > 0 ? -22 : 0, d, easeInOutSine),
        j.rodillaD().rotation(s < 0 ? -22 : 0, d, easeInOutSine),
        j.hombroI().rotation(-20 * s + 10, d, easeInOutSine),
        j.hombroD().rotation(20 * s - 10, d, easeInOutSine),
        cuerpo().y(-12, d / 2, easeInOutSine).to(0, d / 2, easeInOutSine),
      );
    }
    yield* pose("reposo", 0.3);
  }
  function* gesto(nombre: "saludar" | "explicar" | "señalarArriba" | "pensar" | "festejar" | "celular" | "manoEnCintura", dur: number): ThreadGenerator {
    // saludo con la mano bien afuera, al costado de la cabeza (no por encima)
    const saludo = { ...POSES.saludar, hombroD: -112, codoD: -38 };
    if (nombre === "manoEnCintura") yield* pose({ ...saludo, hombroI: 40, codoI: -95 }, 0.45);
    else if (nombre === "saludar") yield* pose(saludo, 0.45);
    else yield* pose(nombre, 0.45);
    if (nombre === "saludar") movimiento().opacity(1);
    const reps = Math.max(1, Math.floor((dur - 0.9) / 0.5));
    for (let i = 0; i < reps; i++) {
      if (nombre === "saludar" || nombre === "manoEnCintura")
        yield* j.codoD().rotation(i % 2 ? -62 : -28, 0.25, easeInOutSine).to(i % 2 ? -28 : -62, 0.25, easeInOutSine);
      else if (nombre === "explicar") yield* all(j.codoI().rotation(i % 2 ? 65 : 100, 0.5, easeInOutSine), j.codoD().rotation(i % 2 ? -100 : -65, 0.5, easeInOutSine));
      else if (nombre === "festejar") yield* all(j.codoI().rotation(i % 2 ? 15 : 50, 0.25), j.codoD().rotation(i % 2 ? -15 : -50, 0.25), cuerpo().y(-40, 0.12).to(0, 0.13));
      else if (nombre === "señalarArriba") yield* j.codoD().rotation(i % 2 ? -14 : -30, 0.5, easeInOutSine);
      else yield* waitFor(0.5);
    }
    movimiento().opacity(0);
    yield* pose("reposo", 0.45);
  }
  return { nodo: n, pose, vivir, hablar, caminar, gesto, cara, raiz };
}
