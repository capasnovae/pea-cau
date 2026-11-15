// Muñeco articulado para los videos: cuerpo entero con hombros, codos, caderas, rodillas y cabeza que se mueven con
// curvas suaves. Dos estilos con el mismo esqueleto: "palitos" (trazo de tinta) y "plano" (ropa, pelo y colores).
import { Circle, Line, Node, Rect } from "@revideo/2d";
import type { Reference, ThreadGenerator } from "@revideo/core";
import { all, createRef, easeInOutCubic, easeInOutSine, loop, spawn, waitFor } from "@revideo/core";

export type Estilo = "palitos" | "plano";
export type Look = {
  piel: string;
  pelo: string;
  ropa: string;
  pantalon: string;
  detalle: string; // color de acento: corbata, bufanda, mochila
  peinado: "rodete" | "corto" | "colita" | "largo";
  anteojos?: boolean;
};

const TINTA = "#1c1917";
const PAPEL = "#f4efe6";

// Ángulos en grados. Brazos y piernas cuelgan hacia abajo con ángulo 0; positivo gira en sentido horario en pantalla.
// I = lado izquierdo de la pantalla, D = lado derecho.
export type Pose = {
  hombroI: number;
  codoI: number;
  hombroD: number;
  codoD: number;
  piernaI: number;
  rodillaI: number;
  piernaD: number;
  rodillaD: number;
  cabeza: number;
  torso: number;
};
export const POSES: Record<string, Pose> = {
  reposo: { hombroI: 12, codoI: -6, hombroD: -12, codoD: 6, piernaI: 4, rodillaI: 0, piernaD: -4, rodillaD: 0, cabeza: 0, torso: 0 },
  señalarArriba: { hombroI: 14, codoI: -8, hombroD: -150, codoD: -18, piernaI: 4, rodillaI: 0, piernaD: -4, rodillaD: 0, cabeza: -6, torso: -3 },
  señalarCostado: { hombroI: 14, codoI: -8, hombroD: -95, codoD: -6, piernaI: 4, rodillaI: 0, piernaD: -4, rodillaD: 0, cabeza: -4, torso: -2 },
  explicar: { hombroI: 35, codoI: 85, hombroD: -35, codoD: -85, piernaI: 5, rodillaI: 0, piernaD: -5, rodillaD: 0, cabeza: 0, torso: 0 },
  saludar: { hombroI: 12, codoI: -6, hombroD: -135, codoD: -55, piernaI: 4, rodillaI: 0, piernaD: -4, rodillaD: 0, cabeza: 4, torso: 2 },
  pensar: { hombroI: 20, codoI: 120, hombroD: -40, codoD: -150, piernaI: 4, rodillaI: 0, piernaD: -4, rodillaD: 0, cabeza: 8, torso: 0 },
  festejar: { hombroI: 150, codoI: 20, hombroD: -150, codoD: -20, piernaI: 8, rodillaI: 0, piernaD: -8, rodillaD: 0, cabeza: 0, torso: 0 },
  celular: { hombroI: 25, codoI: 110, hombroD: -25, codoD: -110, piernaI: 4, rodillaI: 0, piernaD: -4, rodillaD: 0, cabeza: 14, torso: 0 },
};

// Medidas del esqueleto (en unidades de dibujo; el muñeco mide ~520 de alto con escala 1)
const M = { cadera: -220, cuello: -400, cabeza: -488, radio: 78, brazo: 92, antebrazo: 86, muslo: 110, pierna: 110, hombroX: 46, caderaX: 26 };

export function crearMuneco({ estilo, look, x = 0, y = 0, escala = 1, espejo = false }: { estilo: Estilo; look: Look; x?: number; y?: number; escala?: number; espejo?: boolean }) {
  const raiz = createRef<Node>();
  const cuerpo = createRef<Node>();
  const torso = createRef<Node>();
  const cabeza = createRef<Node>();
  const ojos = createRef<Node>();
  const boca = createRef<Rect>();
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
  const palitos = estilo === "palitos";
  const grosor = palitos ? 16 : 36;
  const segmento = (largo: number, color: string, ancho = grosor) => (
    <Line points={[[0, 0], [0, largo]]} stroke={color} lineWidth={ancho} lineCap="round" />
  );
  const colorBrazo = palitos ? TINTA : look.ropa;
  const colorAntebrazo = palitos ? TINTA : look.piel;
  const colorPierna = palitos ? TINTA : look.pantalon;

  const brazo = (lado: "I" | "D") => (
    <Node ref={lado === "I" ? j.hombroI : j.hombroD} x={palitos ? 0 : lado === "I" ? -M.hombroX : M.hombroX} y={palitos ? M.cuello + 30 : M.cuello + 28}>
      {segmento(M.brazo, colorBrazo)}
      <Node ref={lado === "I" ? j.codoI : j.codoD} y={M.brazo}>
        {segmento(M.antebrazo, colorAntebrazo, palitos ? grosor : grosor - 6)}
        <Circle y={M.antebrazo + 4} size={palitos ? 24 : 34} fill={palitos ? TINTA : look.piel} />
      </Node>
    </Node>
  );
  const pierna = (lado: "I" | "D") => (
    <Node ref={lado === "I" ? j.piernaI : j.piernaD} x={palitos ? 0 : lado === "I" ? -M.caderaX : M.caderaX} y={M.cadera}>
      {segmento(M.muslo, colorPierna, palitos ? grosor : grosor + 4)}
      <Node ref={lado === "I" ? j.rodillaI : j.rodillaD} y={M.muslo}>
        {segmento(M.pierna, colorPierna, palitos ? grosor : grosor + 2)}
        <Rect y={M.pierna + 6} x={lado === "I" ? -10 : 10} width={palitos ? 34 : 54} height={palitos ? 14 : 22} radius={10} fill={palitos ? TINTA : TINTA} />
      </Node>
    </Node>
  );

  const pelo = () => {
    const c = palitos ? TINTA : look.pelo;
    switch (look.peinado) {
      case "rodete":
        return [<Circle size={56} y={-M.radio - 14} fill={c} />, <Circle size={M.radio * 2 + 8} y={-6} startAngle={180} endAngle={360} closed fill={c} />];
      case "corto":
        return [<Circle size={M.radio * 2 + 10} y={-8} startAngle={195} endAngle={345} closed fill={c} />, <Rect width={M.radio * 1.7} height={14} y={-22} radius={7} fill={c} />];
      case "colita":
        return [
          <Line points={[[M.radio - 6, -24], [M.radio + 30, 10], [M.radio + 18, 50]]} stroke={c} lineWidth={22} lineCap="round" lineJoin="round" />,
          <Circle size={M.radio * 2 + 8} y={-6} startAngle={180} endAngle={360} closed fill={c} />,
        ];
      case "largo":
        return [
          <Rect width={M.radio * 2 + 22} height={150} y={36} radius={[60, 60, 24, 24]} fill={c} />,
          <Circle size={M.radio * 2 + 10} y={-6} startAngle={180} endAngle={360} closed fill={c} />,
        ];
    }
  };
  const peloAtras = () => (look.peinado === "largo" || look.peinado === "rodete" ? pelo().slice(0, 1) : []);
  const peloAdelante = () => (look.peinado === "largo" || look.peinado === "rodete" ? pelo().slice(1) : pelo());

  const n = (
    <Node ref={raiz} x={x} y={y} scale={escala} scaleX={espejo ? -escala : escala}>
      {/* sombra en el piso */}
      <Circle size={[200, 30]} y={10} fill="rgba(28,25,23,0.12)" />
      <Node ref={cuerpo}>
        {pierna("I")}
        {pierna("D")}
        <Node ref={torso} y={M.cadera}>
          <Node y={-M.cadera}>
            {brazo("I")}
            {palitos ? (
              <Line points={[[0, M.cadera], [0, M.cuello]]} stroke={TINTA} lineWidth={grosor} lineCap="round" />
            ) : (
              <Rect width={120} height={M.cadera - M.cuello + 30} y={(M.cadera + M.cuello) / 2 - 4} radius={[46, 46, 18, 18]} fill={look.ropa} />
            )}
            {/* detalle de color: corbata, bufanda o tira de mochila */}
            {palitos ? (
              <Line points={[[-30, M.cuello + 14], [30, M.cuello + 14]]} stroke={look.detalle} lineWidth={12} lineCap="round" />
            ) : (
              <Line points={[[0, M.cuello + 12], [0, M.cuello + 90]]} stroke={look.detalle} lineWidth={14} lineCap="round" />
            )}
            {brazo("D")}
            <Node ref={cabeza} y={M.cabeza}>
              {peloAtras()}
              {!palitos && <Rect width={30} height={30} y={M.radio - 4} fill={look.piel} />}
              <Circle size={M.radio * 2} fill={palitos ? PAPEL : look.piel} stroke={TINTA} lineWidth={palitos ? 9 : 0} />
              {peloAdelante()}
              <Node ref={ojos} y={4}>
                <Circle x={-26} size={14} fill={TINTA} />
                <Circle x={26} size={14} fill={TINTA} />
              </Node>
              {look.anteojos && (
                <Node y={4}>
                  <Circle x={-26} size={44} stroke={TINTA} lineWidth={6} />
                  <Circle x={26} size={44} stroke={TINTA} lineWidth={6} />
                  <Line points={[[-3, 0], [3, 0]]} stroke={TINTA} lineWidth={5} />
                </Node>
              )}
              <Rect ref={boca} y={40} width={30} height={6} radius={4} fill={palitos ? TINTA : "#7f1d1d"} />
              {!palitos && <Circle x={-46} y={26} size={22} fill="#f87171" opacity={0.35} />}
              {!palitos && <Circle x={46} y={26} size={22} fill="#f87171" opacity={0.35} />}
            </Node>
          </Node>
        </Node>
      </Node>
    </Node>
  ) as Node;

  function aplicar(p: Pose) {
    for (const k of Object.keys(j) as (keyof typeof j)[]) j[k]().rotation(p[k]);
    cabeza().rotation(p.cabeza);
    torso().rotation(p.torso);
  }
  aplicar(POSES.reposo);

  /** Pasa a una pose con una curva suave. */
  function* pose(nombre: keyof typeof POSES | Pose, dur = 0.5): ThreadGenerator {
    const p = typeof nombre === "string" ? POSES[nombre] : nombre;
    yield* all(
      ...(Object.keys(j) as (keyof typeof j)[]).map((k) => j[k]().rotation(p[k], dur, easeInOutCubic)),
      cabeza().rotation(p.cabeza, dur, easeInOutCubic),
      torso().rotation(p.torso, dur, easeInOutCubic),
    );
  }

  /** Respira, se balancea apenas y parpadea mientras dure el video. */
  function vivir() {
    spawn(
      loop(Infinity, function* () {
        yield* cuerpo().y(-5, 1.4, easeInOutSine);
        yield* cuerpo().y(0, 1.4, easeInOutSine);
      }),
    );
    spawn(
      loop(Infinity, function* () {
        yield* waitFor(2.2 + Math.random() * 2);
        yield* ojos().scale.y(0.1, 0.06);
        yield* ojos().scale.y(1, 0.08);
      }),
    );
  }

  /** Mueve la boca y la cabeza durante un rato (o al ritmo de las palabras, si se pasan). */
  function* hablar(dur: number, palabras?: { t: number; d: number }[]): ThreadGenerator {
    const inicio = 0;
    if (palabras?.length) {
      let t = inicio;
      for (const w of palabras) {
        if (w.t > t) yield* waitFor(w.t - t);
        yield* boca().height(20, Math.min(0.08, w.d / 2));
        yield* boca().height(6, Math.min(0.08, w.d / 2));
        t = w.t + Math.min(0.16, w.d);
      }
      return;
    }
    let t = 0;
    let k = 0;
    while (t < dur) {
      const a = 0.09 + ((k * 37) % 7) * 0.012;
      yield* all(boca().height(10 + ((k * 13) % 12), a), cabeza().rotation(cabeza().rotation() + (k % 2 ? 1.5 : -1.5), a * 2));
      yield* boca().height(6, a);
      t += a * 2;
      k++;
    }
  }

  /** Camina de su lugar hasta x (en pantalla), moviendo piernas y brazos en contrafase. */
  function* caminar(hastaX: number, dur: number): ThreadGenerator {
    const pasos = Math.max(2, Math.round(dur / 0.45));
    const d = dur / pasos;
    spawn(raiz().x(hastaX, dur, (v) => v));
    for (let i = 0; i < pasos; i++) {
      const s = i % 2 ? 1 : -1;
      yield* all(
        j.piernaI().rotation(24 * s, d, easeInOutSine),
        j.piernaD().rotation(-24 * s, d, easeInOutSine),
        j.rodillaI().rotation(s > 0 ? -20 : 0, d, easeInOutSine),
        j.rodillaD().rotation(s < 0 ? -20 : 0, d, easeInOutSine),
        j.hombroI().rotation(-18 * s + 10, d, easeInOutSine),
        j.hombroD().rotation(18 * s - 10, d, easeInOutSine),
        cuerpo().y(-10, d / 2, easeInOutSine).to(0, d / 2, easeInOutSine),
      );
    }
    yield* pose("reposo", 0.3);
  }

  /** Gestos que se repiten mientras habla: saludar mueve el antebrazo, explicar abre y cierra las manos. */
  function* gesto(nombre: "saludar" | "explicar" | "señalarArriba" | "pensar" | "festejar" | "celular", dur: number): ThreadGenerator {
    yield* pose(nombre, 0.45);
    const reps = Math.max(1, Math.floor((dur - 0.9) / 0.6));
    for (let i = 0; i < reps; i++) {
      if (nombre === "saludar") yield* j.codoD().rotation(i % 2 ? -55 : -25, 0.3, easeInOutSine).to(i % 2 ? -25 : -55, 0.3, easeInOutSine);
      else if (nombre === "explicar")
        yield* all(
          j.codoI().rotation(i % 2 ? 70 : 100, 0.6, easeInOutSine),
          j.codoD().rotation(i % 2 ? -100 : -70, 0.6, easeInOutSine),
        );
      else if (nombre === "señalarArriba") yield* j.codoD().rotation(i % 2 ? -18 : -30, 0.6, easeInOutSine);
      else if (nombre === "festejar")
        yield* all(j.codoI().rotation(i % 2 ? 20 : 50, 0.3), j.codoD().rotation(i % 2 ? -20 : -50, 0.3), cuerpo().y(-30, 0.15).to(0, 0.15));
      else yield* waitFor(0.6);
    }
    yield* pose("reposo", 0.45);
  }

  return { nodo: n, pose, vivir, hablar, caminar, gesto, raiz };
}

export type Muneco = ReturnType<typeof crearMuneco>;

// ---------- estilo propio "frijol": cuerpo y cabeza en una sola forma, trazo grueso y caras de meme ----------
export type Expresion = "normal" | "sorpresa" | "seria" | "contenta" | "duda";
export type LookFrijol = { detalle: string; accesorio: "rodete" | "corbata" | "colita"; anteojos?: boolean };

export function crearFrijol({ look, x = 0, y = 0, escala = 1 }: { look: LookFrijol; x?: number; y?: number; escala?: number }) {
  const raiz = createRef<Node>();
  const cuerpo = createRef<Node>();
  const cara = createRef<Node>();
  const boca = createRef<Node>();
  const parpados = createRef<Node>();
  const expr: Record<Expresion, Reference<Node>> = {
    normal: createRef(),
    sorpresa: createRef(),
    seria: createRef(),
    contenta: createRef(),
    duda: createRef(),
  };
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
  const L = 9; // grosor del trazo
  const ojo = (dx: number) => <Circle x={dx} size={18} fill={TINTA} />;
  const brazo = (lado: "I" | "D") => (
    <Node ref={lado === "I" ? j.hombroI : j.hombroD} x={lado === "I" ? -98 : 98} y={-170}>
      <Line points={[[0, 0], [0, 72]]} stroke={TINTA} lineWidth={L} lineCap="round" />
      <Node ref={lado === "I" ? j.codoI : j.codoD} y={72}>
        <Line points={[[0, 0], [0, 64]]} stroke={TINTA} lineWidth={L} lineCap="round" />
        <Circle y={68} size={26} fill="#ffffff" stroke={TINTA} lineWidth={L - 2} />
      </Node>
    </Node>
  );
  const pierna = (lado: "I" | "D") => (
    <Node ref={lado === "I" ? j.piernaI : j.piernaD} x={lado === "I" ? -40 : 40} y={-34}>
      <Line points={[[0, 0], [0, 40]]} stroke={TINTA} lineWidth={L} lineCap="round" />
      <Node ref={lado === "I" ? j.rodillaI : j.rodillaD} y={40}>
        <Line points={[[0, 0], [0, 38]]} stroke={TINTA} lineWidth={L} lineCap="round" />
        <Rect y={42} x={lado === "I" ? -9 : 9} width={40} height={16} radius={8} fill={TINTA} />
      </Node>
    </Node>
  );
  const n = (
    <Node ref={raiz} x={x} y={y} scale={escala}>
      <Circle size={[220, 30]} y={8} fill="rgba(28,25,23,0.12)" />
      <Node ref={cuerpo}>
        {pierna("I")}
        {pierna("D")}
        {look.accesorio === "rodete" && <Circle y={-372} size={70} fill="#ffffff" stroke={TINTA} lineWidth={L} />}
        {look.accesorio === "colita" && (
          <Line points={[[70, -330], [130, -350], [140, -290]]} stroke={TINTA} lineWidth={L} lineCap="round" lineJoin="round" fill={look.detalle} closed />
        )}
        {brazo("I")}
        {/* el cuerpo-cabeza: una sola forma de frijol */}
        <Rect width={210} height={330} y={-190} radius={[105, 105, 80, 80]} fill="#ffffff" stroke={TINTA} lineWidth={L} />
        {look.accesorio === "corbata" && <Line points={[[0, -150], [16, -110], [0, -70], [-16, -110]]} closed fill={look.detalle} stroke={TINTA} lineWidth={5} />}
        {look.accesorio === "rodete" && <Line points={[[-70, -140], [70, -140]]} stroke={look.detalle} lineWidth={14} lineCap="round" />}
        {look.accesorio === "colita" && <Line points={[[-62, -150], [-30, -60]]} stroke={look.detalle} lineWidth={12} lineCap="round" />}
        {brazo("D")}
        <Node ref={cara} y={-262}>
          <Circle x={-58} y={22} size={28} fill="#fb7185" opacity={0.35} />
          <Circle x={58} y={22} size={28} fill="#fb7185" opacity={0.35} />
          <Node ref={parpados}>
            <Node ref={expr.normal}>
              {ojo(-32)}
              {ojo(32)}
              <Node ref={boca} y={34}>
                <Circle size={34} startAngle={20} endAngle={160} stroke={TINTA} lineWidth={7} lineCap="round" />
              </Node>
            </Node>
            <Node ref={expr.sorpresa} opacity={0}>
              <Circle x={-32} size={34} stroke={TINTA} lineWidth={6} fill="#ffffff" />
              <Circle x={32} size={34} stroke={TINTA} lineWidth={6} fill="#ffffff" />
              <Circle x={-32} size={12} fill={TINTA} />
              <Circle x={32} size={12} fill={TINTA} />
              <Circle y={44} size={[26, 34]} stroke={TINTA} lineWidth={7} />
            </Node>
            <Node ref={expr.seria} opacity={0}>
              <Line points={[[-48, -22], [-18, -14]]} stroke={TINTA} lineWidth={7} lineCap="round" />
              <Line points={[[48, -22], [18, -14]]} stroke={TINTA} lineWidth={7} lineCap="round" />
              {ojo(-32)}
              {ojo(32)}
              <Line points={[[-16, 40], [16, 40]]} stroke={TINTA} lineWidth={7} lineCap="round" />
            </Node>
            <Node ref={expr.contenta} opacity={0}>
              <Circle x={-32} y={4} size={26} startAngle={200} endAngle={340} stroke={TINTA} lineWidth={7} lineCap="round" />
              <Circle x={32} y={4} size={26} startAngle={200} endAngle={340} stroke={TINTA} lineWidth={7} lineCap="round" />
              <Circle y={26} size={50} startAngle={0} endAngle={180} closed fill={TINTA} />
            </Node>
            <Node ref={expr.duda} opacity={0}>
              <Line points={[[-46, -26], [-18, -22]]} stroke={TINTA} lineWidth={7} lineCap="round" />
              <Line points={[[18, -30], [46, -38]]} stroke={TINTA} lineWidth={7} lineCap="round" />
              {ojo(-32)}
              {ojo(32)}
              <Line points={[[-18, 42], [-4, 36], [10, 42], [22, 36]]} stroke={TINTA} lineWidth={7} lineCap="round" lineJoin="round" />
            </Node>
          </Node>
          {look.anteojos && (
            <Node>
              <Circle x={-32} size={52} stroke={TINTA} lineWidth={6} />
              <Circle x={32} size={52} stroke={TINTA} lineWidth={6} />
              <Line points={[[-6, 0], [6, 0]]} stroke={TINTA} lineWidth={6} />
            </Node>
          )}
        </Node>
      </Node>
    </Node>
  ) as Node;

  let actual: Expresion = "normal";
  function* gesto_cara(e: Expresion): ThreadGenerator {
    if (e === actual) return;
    const sale = expr[actual]();
    const entra = expr[e]();
    actual = e;
    yield* all(sale.opacity(0, 0.12), cara().scale(1.12, 0.12));
    yield* all(entra.opacity(1, 0.12), cara().scale(1, 0.25, easeInOutCubic));
  }

  function aplicar(p: Pose) {
    for (const k of Object.keys(j) as (keyof typeof j)[]) j[k]().rotation(p[k]);
  }
  aplicar(POSES.reposo);
  function* pose(nombre: keyof typeof POSES | Pose, dur = 0.5): ThreadGenerator {
    const p = typeof nombre === "string" ? POSES[nombre] : nombre;
    yield* all(...(Object.keys(j) as (keyof typeof j)[]).map((k) => j[k]().rotation(p[k], dur, easeInOutCubic)), cuerpo().rotation(p.torso * 1.5, dur, easeInOutCubic));
  }
  function vivir() {
    spawn(
      loop(Infinity, function* () {
        yield* all(cuerpo().scale.y(1.025, 1.3, easeInOutSine), cuerpo().scale.x(0.985, 1.3, easeInOutSine));
        yield* all(cuerpo().scale.y(1, 1.3, easeInOutSine), cuerpo().scale.x(1, 1.3, easeInOutSine));
      }),
    );
    spawn(
      loop(Infinity, function* () {
        yield* waitFor(2.2 + Math.random() * 2);
        yield* parpados().scale.y(0.1, 0.06);
        yield* parpados().scale.y(1, 0.08);
      }),
    );
  }
  function* hablar(dur: number): ThreadGenerator {
    let t = 0;
    let k = 0;
    while (t < dur) {
      const a = 0.09 + ((k * 37) % 7) * 0.012;
      yield* all(boca().scale.y(2.2 + ((k * 13) % 5) * 0.3, a), cara().rotation(k % 2 ? 3 : -3, a * 2));
      yield* boca().scale.y(1, a);
      t += a * 2;
      k++;
    }
    yield* cara().rotation(0, 0.15);
  }
  function* caminar(hastaX: number, dur: number): ThreadGenerator {
    const pasos = Math.max(2, Math.round(dur / 0.4));
    const d = dur / pasos;
    spawn(raiz().x(hastaX, dur, (v) => v));
    for (let i = 0; i < pasos; i++) {
      const s = i % 2 ? 1 : -1;
      yield* all(
        j.piernaI().rotation(28 * s, d, easeInOutSine),
        j.piernaD().rotation(-28 * s, d, easeInOutSine),
        j.hombroI().rotation(-25 * s + 10, d, easeInOutSine),
        j.hombroD().rotation(25 * s - 10, d, easeInOutSine),
        cuerpo().rotation(4 * s, d, easeInOutSine),
        cuerpo().y(-14, d / 2, easeInOutSine).to(0, d / 2, easeInOutSine),
      );
    }
    yield* all(pose("reposo", 0.3), cuerpo().rotation(0, 0.3));
  }
  function* gesto(nombre: "saludar" | "explicar" | "señalarArriba" | "pensar" | "festejar" | "celular", dur: number): ThreadGenerator {
    yield* pose(nombre, 0.4);
    const reps = Math.max(1, Math.floor((dur - 0.8) / 0.5));
    for (let i = 0; i < reps; i++) {
      if (nombre === "saludar") yield* j.codoD().rotation(i % 2 ? -60 : -20, 0.25, easeInOutSine).to(i % 2 ? -20 : -60, 0.25, easeInOutSine);
      else if (nombre === "explicar") yield* all(j.codoI().rotation(i % 2 ? 60 : 100, 0.5, easeInOutSine), j.codoD().rotation(i % 2 ? -100 : -60, 0.5, easeInOutSine));
      else if (nombre === "festejar") yield* all(j.codoI().rotation(i % 2 ? 10 : 50, 0.25), j.codoD().rotation(i % 2 ? -10 : -50, 0.25), cuerpo().y(-40, 0.12).to(0, 0.13));
      else if (nombre === "señalarArriba") yield* j.codoD().rotation(i % 2 ? -18 : -34, 0.5, easeInOutSine);
      else yield* waitFor(0.5);
    }
    yield* pose("reposo", 0.4);
  }
  return { nodo: n, pose, vivir, hablar, caminar, gesto, cara: gesto_cara, raiz };
}
