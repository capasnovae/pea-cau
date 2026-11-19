// Video explicativo con personajes (Open Peeps, CC0), estilo "cuaderno": fondo de papel, subtítulos karaoke arriba,
// títulos grandes con número de paso, pantallas de ejemplo que cambian, sellos y la narradora que señala.
// La línea de tiempo viene armada desde render-guion.ts (cada línea con su audio medido): la escena espera a cada momento.
import { Circle, Gradient, Img, Layout, Line, Node, Rect, Txt, makeScene2D } from "@revideo/2d";
import type { Reference, ThreadGenerator } from "@revideo/core";
import {
  all,
  createRef,
  easeInOutCubic,
  easeInOutSine,
  easeOutBack,
  easeOutCubic,
  loop,
  spawn,
  useScene,
  useThread,
  waitFor,
} from "@revideo/core";
import { IconoAnimado, Particulas, confeti } from "./graficos.tsx";
import type { Estudiante, LineaConTiempo, Palabra, PlanoConTiempo, Quien, Tarjeta, Tono } from "../../guiones/tipos.ts";

type Persona = Exclude<Quien, "nadie">;
type Cara = "cerrada" | "abierta" | "preocupada" | "contenta" | "apurada";

const C = {
  papel: "#f4efe6",
  tinta: "#1c1917",
  acento: "#e0452f",
  azul: "#2b59c3",
  primario: "#4f46e5",
  suave: "#c7d2fe",
  blanco: "#ffffff",
  gris: "#78716c",
  apagado: "#b9b1a6",
  aviso: "#f2a705",
  ok: "#1f9d55",
  mal: "#e0452f",
  chat: "#0f766e",
  fondoChat: "#ece5dd",
  enviado: "#d9fdd3",
  nav: "#1e1b4b",
};
const LETRA = "Plus Jakarta Sans";
const TITULO = "Anton";
const MONO = "JetBrains Mono";
const SERIF = "Instrument Serif";
const TONO: Record<Tono, string> = { ok: C.ok, aviso: C.aviso, mal: C.mal, neutro: C.azul };
const SIGNO: Record<Tono, string> = { ok: "✓", aviso: "!", mal: "✕", neutro: "•" };
const GENTE: Record<Persona, { nombre: string; color: string; fondo: string }> = {
  estudiante: { nombre: "Lucía", color: "#ea580c", fondo: "#fed7aa" },
  martin: { nombre: "Martín", color: "#2563eb", fondo: "#bfdbfe" },
  narradora: { nombre: "Narradora", color: "#0f766e", fondo: "#a7f3d0" },
};
const SOMBRA = { shadowColor: "rgba(28,25,23,0.95)", shadowBlur: 0, shadowOffset: [6, 6] as [number, number] };
// Los dibujos miden 850 × 1200; la cabeza ocupa más o menos el 40 % de arriba
const PROP = 850 / 1200;
// La dueña prefirió los videos sin personajes dibujados: todo con motion graphics
const SIN_PERSONAJES = true;
let EST: Estudiante = { id: "lucia", nombre: "Lucía", detalle: "Estudiante" };
const src = (q: Persona, c: Cara) => `/peeps/${q === "estudiante" ? EST.id : q}-${c}.svg`;

// ---------- tiempo ----------
function* hasta(t: number) {
  const falta = t - useThread().time();
  if (falta > 0.0001) yield* waitFor(falta);
}

/** Boca abierta y cerrada con cada palabra: se alterna la cara "abierta" por encima de la de reposo. */
function* hablar(bocas: Reference<Img>[], palabras: Palabra[], inicio: number) {
  for (const w of palabras) {
    yield* hasta(inicio + w.t);
    for (const b of bocas) b().opacity(1);
    yield* waitFor(Math.max(0.06, Math.min(0.16, w.d * 0.55)));
    for (const b of bocas) b().opacity(0);
  }
}

/** Respiración: el personaje sube y baja apenas, para que no quede congelado. */
function respirar(n: Reference<Node>, fase = 0) {
  spawn(
    loop(Infinity, function* () {
      yield* n().scale.y(1.012, 1.6 + fase, easeInOutSine);
      yield* n().scale.y(1, 1.6 + fase, easeInOutSine);
    }),
  );
}

// ---------- personajes ----------
type Muñeco = { nodo: Reference<Node>; boca: Reference<Img>; base: Reference<Img> };
const nuevoMuñeco = (): Muñeco => ({ nodo: createRef(), boca: createRef(), base: createRef() });

function Dibujo({ q, alto, m, cara = "cerrada", x = 0, y = 0, espejo = false }: { q: Persona; alto: number; m: Muñeco; cara?: Cara; x?: number; y?: number; espejo?: boolean }) {
  return (
    <Node ref={m.nodo} x={x} y={y} scaleX={espejo ? -1 : 1} opacity={SIN_PERSONAJES ? 0 : 1}>
      <Img ref={m.base} src={src(q, cara)} height={alto} width={alto * PROP} y={-alto / 2} />
      <Img ref={m.boca} src={src(q, "abierta")} height={alto} width={alto * PROP} y={-alto / 2} opacity={0} />
    </Node>
  );
}

/** La narradora abajo a la derecha, señalando hacia arriba (su dibujo ya tiene el dedo en alto). */
function Presentadora({ m, x = 330, alto = 780 }: { m: Muñeco; x?: number; alto?: number }) {
  return (
    <Node>
      {!SIN_PERSONAJES && <Circle size={alto * 0.62} x={x + 20} y={675 - alto * 0.42} fill={GENTE.narradora.fondo} />}
      <Dibujo q="narradora" alto={alto} m={m} x={x} y={690} espejo />
    </Node>
  );
}

// ---------- piezas ----------
const T = (p: { t: string; tam: number; color?: string; peso?: number; ancho?: number; alinea?: CanvasTextAlign; letra?: string }) => (
  <Txt
    text={p.t}
    fontFamily={p.letra ?? LETRA}
    fontSize={p.tam}
    fontWeight={p.peso ?? 600}
    fill={p.color ?? C.tinta}
    textWrap={p.ancho ? true : false}
    width={p.ancho}
    textAlign={p.alinea ?? "left"}
    lineHeight="125%"
  />
);

/** Título grande en mayúsculas, con la última palabra en color. */
function Titulo({ texto, tam = 92, ancho = 600, alinea = "start" }: { texto: string; tam?: number; ancho?: number; alinea?: "start" | "center" }) {
  const pal = texto.toUpperCase().split(/\s+/);
  return (
    <Layout direction="row" wrap="wrap" gap={tam * 0.22} width={ancho} justifyContent={alinea}>
      {pal.map((p, i) => (
        <Txt text={p} fontFamily={TITULO} fontSize={tam} fill={i === pal.length - 1 ? C.acento : C.tinta} lineHeight="105%" />
      ))}
    </Layout>
  );
}

const Etiqueta = ({ t, color = C.gris, tam = 26 }: { t: string; color?: string; tam?: number }) => (
  <Txt text={t} fontFamily={MONO} fontSize={tam} fontWeight={500} fill={color} />
);

/** Número de paso en un cuadrado negro. */
const Paso = ({ n, tam = 84 }: { n: string; tam?: number }) => (
  <Rect width={tam} height={tam} radius={14} fill={C.tinta} layout alignItems="center" justifyContent="center" {...SOMBRA} shadowColor={C.acento}>
    <Txt text={n} fontFamily={TITULO} fontSize={tam * 0.72} fill={C.blanco} />
  </Rect>
);

/** Sello torcido que "cae" sobre una tarjeta. */
function Sello({ t, r, x = 0, y = 0, rot = -8 }: { t: string; r: Reference<Rect>; x?: number; y?: number; rot?: number }) {
  return (
    <Rect ref={r} layout={false} x={x} y={y} rotation={rot} opacity={0} scale={1.8}>
      <Rect layout padding={[6, 14]} radius={10} stroke={C.acento} lineWidth={5} fill="rgba(244,239,230,0.92)">
        <Txt text={t.toUpperCase()} fontFamily={TITULO} fontSize={30} fill={C.acento} />
      </Rect>
    </Rect>
  );
}
function* golpe(r: Reference<Rect>) {
  yield* all(r().opacity(1, 0.12), r().scale(1, 0.22, easeOutBack));
}

/** Fondo de papel con puntitos y algunas formas que suben despacio. */
function Fondo() {
  return (
    <Node>
      <Img src="/fondos/papel.svg" width={1080} height={1350} />
      <Particulas color="#d6cfc4" cantidad={10} />
    </Node>
  );
}

function Sendero({ escala = 1 }: { escala?: number }) {
  const puntos = [
    [-54, 44, 9],
    [-18, 20, 11],
    [18, -10, 13],
    [54, -46, 16],
  ] as const;
  return (
    <Rect scale={escala} width={190} height={190} radius={52} fill={C.primario}>
      {puntos.map(([x, y, r], i) => (
        <Circle layout={false} x={x} y={y} size={r * 2} fill={C.blanco} opacity={0.55 + i * 0.15} />
      ))}
    </Rect>
  );
}

const degradado = (a: string, b: string) =>
  new Gradient({ type: "linear", from: [0, -675], to: [0, 675], stops: [{ offset: 0, color: a }, { offset: 1, color: b }] });

/** Texto de los subtítulos en partes cortas; cada parte sabe en qué palabra de la línea empieza. */
function partes(l: LineaConTiempo): { n: number; texto: string }[] {
  const frases = l.texto.match(/[^.:;?!]+[.:;?!…»]*\s*/g) ?? [l.texto];
  const trozos: string[] = [];
  for (const f of frases) {
    const pal = f.trim().split(/\s+/);
    if (f.length <= 70) trozos.push(f.trim());
    else {
      const comas = [...f.matchAll(/,\s/g)].map((m) => m.index ?? 0);
      const mitad = f.length / 2;
      const corte = comas.sort((a, b) => Math.abs(a - mitad) - Math.abs(b - mitad))[0];
      if (corte && Math.abs(corte - mitad) < f.length * 0.3) trozos.push(f.slice(0, corte + 1).trim(), f.slice(corte + 1).trim());
      else trozos.push(pal.slice(0, Math.ceil(pal.length / 2)).join(" "), pal.slice(Math.ceil(pal.length / 2)).join(" "));
    }
  }
  let n = 0;
  return trozos.filter(Boolean).map((texto) => {
    const r = { n, texto };
    n += texto.split(/\s+/).filter((p) => /[\p{L}\p{N}]/u.test(p)).length;
    return r;
  });
}

// ---------- escena ----------
type Mensaje = { de: "estudiante" | "martin"; tipo: "texto" | "audio"; texto: string; dur?: number; borrador?: boolean };
type Armado = {
  nodo: Node;
  alEntrar?: () => ThreadGenerator;
  linea?: (l: LineaConTiempo) => ThreadGenerator;
  congelar?: () => ThreadGenerator;
  bocas?: Partial<Record<Persona, Reference<Img>>>;
};

export default makeScene2D("personajes", function* (view) {
  const planos = useScene().variables.get("planos", [] as PlanoConTiempo[])();
  const titulo = useScene().variables.get("titulo", "Lección")();
  const bajada = useScene().variables.get("bajada", "")();
  const total = useScene().variables.get("total", 1)();
  const tipo = useScene().variables.get("tipo", "lección")();
  EST = useScene().variables.get("estudiante", EST)();
  GENTE.estudiante.nombre = EST.nombre;
  const primerMensaje = planos.flatMap((p) => p.lineas).find((l) => l.quien === "estudiante" && l.modo === "escribe")?.texto ?? "";
  const avisoTexto = primerMensaje.length > 24 ? primerMensaje.slice(0, 22).trimEnd() + "…" : primerMensaje;

  const fuentes = [
    new FontFace(LETRA, "url(/plus-jakarta-sans.woff2)", { weight: "400 800" }),
    new FontFace(TITULO, "url(/fuentes/anton.woff2)"),
    new FontFace(MONO, "url(/fuentes/mono.woff2)", { weight: "500" }),
    new FontFace(SERIF, "url(/fuentes/serif-italica.woff2)", { style: "italic" }),
  ];
  yield Promise.all(fuentes.map((f) => f.load().then((x) => document.fonts.add(x))));

  // ---- karaoke arriba: quién habla y la frase, con la palabra del momento en color ----
  const escenario = createRef<Node>();
  const karaoke = createRef<Node>();
  const quienTxt = createRef<Txt>();
  const renglones = createRef<Layout>();
  const cortina = createRef<Circle>();
  const progreso = createRef<Rect>();
  view.add(<Node ref={escenario} />);
  view.add(
    <Node ref={karaoke} opacity={0}>
      <Rect width={1080} height={300} y={-525} fill={degradado("rgba(244,239,230,0.97)", "rgba(244,239,230,0)")} />
      <Txt ref={quienTxt} x={-490} y={-612} offset={[-1, 0]} fontFamily={MONO} fontSize={26} fontWeight={500} fill={C.gris} text="" />
      <Layout ref={renglones} layout direction="row" wrap="wrap" columnGap={13} rowGap={2} width={980} x={-490} y={-585} offset={[-1, -1]} />
    </Node>,
  );
  view.add(<Circle ref={cortina} size={0} fill={C.acento} />);
  view.add(<Rect width={1080} height={8} y={-671} fill="rgba(28,25,23,0.08)" />);
  view.add(<Rect ref={progreso} width={0} height={8} x={-540} y={-671} offset={[-1, 0]} fill={C.acento} />);
  spawn(progreso().width(1080, total, (v) => v));

  let etiqueta = "// el caso";
  let pasoActual: string | undefined;
  function* mostrarKaraoke(l: LineaConTiempo) {
    if (l.quien === "nadie") {
      yield* karaoke().opacity(0, 0.25);
      return;
    }
    const nombre = GENTE[l.quien].nombre.toLowerCase();
    if (l.quien === "narradora") quienTxt().text(etiqueta);
    else if (l.modo === "escribe") quienTxt().text(`// ${nombre} escribe…`);
    else if (l.modo === "audio") quienTxt().text(`// ${nombre} · mensaje de voz`);
    else quienTxt().text(`// ${nombre}`);
    quienTxt().fill(l.quien === "narradora" ? C.gris : GENTE[l.quien].color);
    renglones().removeChildren();
    if (karaoke().opacity() < 1) spawn(karaoke().opacity(1, 0.25));
    if (l.modo === "escribe") return; // lo que se escribe ya se lee en el chat
    const ps = partes(l);
    spawn(function* () {
      for (const p of ps) {
        const w0 = l.palabras[Math.min(p.n, l.palabras.length - 1)];
        yield* hasta(l.inicio + (w0 ? w0.t : 0) - 0.05);
        renglones().removeChildren();
        const pal = p.texto.split(/\s+/);
        const txts = pal.map((x) => (<Txt text={x} fontFamily={LETRA} fontSize={46} fontWeight={700} fill={C.apagado} lineHeight="128%" />) as Txt);
        for (const t of txts) renglones().add(t);
        let k = p.n;
        for (let i = 0; i < txts.length; i++) {
          if (!/[\p{L}\p{N}]/u.test(pal[i])) continue;
          const w = l.palabras[Math.min(k, l.palabras.length - 1)];
          k++;
          if (w) yield* hasta(l.inicio + w.t);
          if (i > 0) for (let j = 0; j < i; j++) txts[j].fill(C.tinta);
          txts[i].fill(C.acento);
        }
        yield* hasta(l.inicio + l.dur);
        txts.forEach((t) => t.fill(C.tinta));
      }
    });
  }

  const historial: Mensaje[] = [];

  for (const plano of planos) {
    yield* hasta(plano.inicio);
    // Un video de módulo puede tener varios casos, cada uno con su estudiante
    if ((plano.tipo === "chat" || plano.tipo === "escena") && plano.estudiante) {
      EST = plano.estudiante;
      GENTE.estudiante.nombre = EST.nombre;
      historial.length = 0; // chat nuevo para el caso nuevo
    }
    if (plano.tipo === "capitulo") pasoActual = plano.numero;
    if (plano.tipo === "cierre") etiqueta = "// para recordar";
    if (plano.tipo === "capitulo" && plano.numero) etiqueta = `// paso ${plano.numero} · ${plano.texto.toLowerCase()}`;
    if (plano.tipo === "capitulo" && !plano.numero) etiqueta = `// ${plano.texto.toLowerCase()}`;
    const raiz = createRef<Node>();
    const a = armar(plano, historial, raiz);
    escenario().add(a.nodo);
    const conCortina = cortina().width() > 0;
    if (!plano.lineas.some((l) => l.quien !== "nadie") && karaoke().opacity() > 0) spawn(karaoke().opacity(0, 0.25));
    if (conCortina) {
      if (a.alEntrar) spawn(a.alEntrar());
      yield* all(cortina().size(0, 0.5, easeInOutCubic), cortina().position([480, -620], 0.5, easeInOutCubic));
    } else {
      raiz().opacity(0);
      raiz().scale(1.04);
      yield* all(raiz().opacity(1, 0.45, easeOutCubic), raiz().scale(1, 0.6, easeOutCubic));
      if (a.alEntrar) spawn(a.alEntrar());
    }

    for (const l of plano.lineas) {
      yield* hasta(l.inicio - (l.modo === "congela" ? 0.8 : 0));
      if (l.modo === "congela" && a.congelar) yield* a.congelar();
      yield* hasta(l.inicio);
      yield* mostrarKaraoke(l);
      const bocas: Reference<Img>[] = [];
      if (l.quien !== "nadie") {
        const propia = a.bocas?.[l.quien];
        if (propia) bocas.push(propia);
      }
      if (bocas.length) spawn(hablar(bocas, l.palabras, l.inicio));
      if (a.linea) spawn(a.linea(l));
      yield* hasta(l.inicio + l.dur);
    }

    yield* hasta(plano.fin - 0.4);
    const sig = planos[planos.indexOf(plano) + 1];
    if (sig) {
      const suave = sig.tipo === "chat" && sig.sigue && plano.tipo === "chat";
      if (suave) yield* all(raiz().opacity(0, 0.4, easeInOutCubic), raiz().scale(0.97, 0.4));
      else {
        const esquinas: [number, number][] = [[-540, 675], [540, 675], [-540, -675], [540, -675]];
        const i = planos.indexOf(plano);
        cortina().position(esquinas[i % 4]);
        cortina().fill([C.acento, C.tinta, C.azul, C.aviso][i % 4]);
        const sinVoz = !sig.lineas?.some((l) => l.quien !== "nadie");
        yield* all(cortina().size(3600, 0.4, easeInOutCubic), raiz().scale(0.97, 0.4), ...(sinVoz ? [karaoke().opacity(0, 0.3)] : []));
      }
      a.nodo.remove();
    }
  }
  yield* hasta(total);

  // ---------- planos ----------
  function armar(plano: PlanoConTiempo, historial: Mensaje[], raiz: Reference<Node>): Armado {
    switch (plano.tipo) {
      case "portada": {
        const ms = [nuevoMuñeco(), nuevoMuñeco(), nuevoMuñeco()];
        const iconosPortada = [
          IconoAnimado({ tipo: "correo", x: -320, y: 380, tam: 230 }),
          IconoAnimado({ tipo: "check", x: 0, y: 470, tam: 230 }),
          IconoAnimado({ tipo: "notebook", x: 320, y: 380, tam: 230 }),
        ];
        const subrayado = createRef<Rect>();
        const n = (
          <Node ref={raiz}>
            <Fondo />
            <Layout layout direction="column" alignItems="start" gap={18} x={-470} y={-560} offset={[-1, -1]} width={940}>
              <Layout direction="row" gap={18} alignItems="center">
                <Sendero escala={0.4} />
                <Etiqueta t={`// PEA · ${tipo}`} tam={30} />
              </Layout>
              <Titulo texto={titulo} tam={150} ancho={940} />
              <Rect ref={subrayado} width={0} height={14} radius={7} fill={C.acento} />
              <Txt text={bajada} fontFamily={SERIF} fontStyle="italic" fontSize={58} fill={C.tinta} />
            </Layout>
            {iconosPortada.map((ic) => ic.nodo)}
            <Dibujo q="estudiante" alto={540} m={ms[0]} x={-310} y={720} cara="contenta" />
            <Dibujo q="narradora" alto={540} m={ms[1]} x={0} y={740} cara="contenta" />
            <Dibujo q="martin" alto={540} m={ms[2]} x={310} y={720} cara="contenta" />
          </Node>
        ) as Node;
        ms.forEach((m, i) => respirar(m.nodo, i * 0.2));
        return {
          nodo: n,
          alEntrar: function* () {
            ms.forEach((m) => m.nodo().y(m.nodo().y() + 400));
            yield* all(
              subrayado().width(320, 0.7, easeOutCubic),
              ...ms.map((m, i) => m.nodo().y(m.nodo().y() - 400, 0.8 + i * 0.12, easeOutBack)),
              ...iconosPortada.map((ic, i) =>
                (function* () {
                  yield* waitFor(0.2 + i * 0.15);
                  yield* ic.animar();
                })(),
              ),
            );
          },
        };
      }

      case "escena": {
        const m = nuevoMuñeco();
        const ciudad = createRef<Node>();
        const aviso = createRef<Rect>();
        const envio = createRef<Rect>();
        const camara = createRef<Node>();
        const colectivo = plano.lugar === "colectivo";
        const n = (
          <Node ref={raiz}>
            <Node ref={camara}>
              {plano.lugar === "casa" ? (
                <Node>
                  {/* su casa, de noche */}
                  <Rect width={1080} height={1350} fill={degradado("#312e81", "#4338ca")} />
                  <Rect width={520} height={460} x={-200} y={-330} radius={30} fill={degradado("#0f172a", "#1e3a8a")} stroke="#a16207" lineWidth={18} clip>
                    <Circle size={110} x={120} y={-90} fill="#fef9c3" />
                    <Circle size={110} x={150} y={-110} fill="#1e293b" />
                    {Array.from({ length: 14 }, (_, i) => (
                      <Circle size={6 + (i % 3) * 3} x={-230 + ((i * 97) % 460)} y={-190 + ((i * 61) % 300)} fill="#fef3c7" opacity={0.8} />
                    ))}
                  </Rect>
                  <Rect width={16} height={460} x={-200} y={-330} fill="#a16207" />
                  {/* lámpara con su luz */}
                  <Circle size={520} x={330} y={-120} fill="#fde68a" opacity={0.18} />
                  <Line points={[[330, -60], [330, 300]]} stroke="#78350f" lineWidth={12} />
                  <Line points={[[250, -60], [410, -60], [370, -200], [290, -200]]} closed fill="#fbbf24" />
                  {/* sillón */}
                  <Rect width={900} height={520} y={420} radius={[90, 90, 20, 20]} fill="#7c3aed" />
                  <Rect width={1000} height={180} y={640} radius={40} fill="#6d28d9" />
                  <Dibujo q="estudiante" alto={880} m={m} y={700} cara="preocupada" />
                </Node>
              ) : colectivo ? (
                <Node>
                  <Rect width={1080} height={1350} fill={degradado("#fde68a", "#fbbf24")} />
                  {/* ventanilla con la ciudad que pasa */}
                  <Rect width={940} height={520} y={-330} radius={60} fill={degradado("#7dd3fc", "#e0f2fe")} clip stroke="#92400e" lineWidth={22}>
                    <Circle size={120} x={300} y={-150} fill="#fef9c3" />
                    <Node ref={ciudad} y={120}>
                      {Array.from({ length: 20 }, (_, i) => (
                        <Rect x={-560 + i * 110} y={60 - ((i * 37) % 120)} width={96} height={260 + ((i * 53) % 160)} radius={10} fill={["#64748b", "#475569", "#818cf8", "#94a3b8"][i % 4]}>
                          {Array.from({ length: 4 }, (_, k) => (
                            <Rect y={-80 + k * 50} width={56} height={18} radius={4} fill="#fef3c7" opacity={0.7} />
                          ))}
                        </Rect>
                      ))}
                    </Node>
                    <Rect width={940} height={70} y={225} fill="#334155" />
                  </Rect>
                  <Rect width={14} height={520} y={-330} fill="#92400e" />
                  {/* asiento */}
                  <Rect width={520} height={620} y={300} radius={[80, 80, 20, 20]} fill="#1d4ed8" />
                  <Rect width={440} height={80} y={40} radius={40} fill="#3b82f6" />
                  <Dibujo q="estudiante" alto={900} m={m} y={700} cara="preocupada" />
                  {/* agarradera */}
                  <Line points={[[-420, -675], [-420, -560]]} stroke="#9ca3af" lineWidth={10} />
                  <Circle size={70} x={-420} y={-530} stroke="#9ca3af" lineWidth={12} />
                </Node>
              ) : (
                <Node>
                  <Rect width={1080} height={1350} fill={degradado("#e0e7ff", "#c7d2fe")} />
                  <Rect width={260} height={340} x={-330} y={-420} radius={20} fill="#ffffff" opacity={0.7}>
                    <Rect width={200} height={30} y={-110} radius={8} fill="#a5b4fc" />
                    <Rect width={200} height={18} y={-60} radius={6} fill="#e0e7ff" />
                    <Rect width={160} height={18} y={-30} radius={6} fill="#e0e7ff" />
                  </Rect>
                  {/* planta */}
                  <Node x={400} y={-60}>
                    <Circle size={150} y={-120} fill="#34d399" />
                    <Circle size={110} x={-60} y={-60} fill="#10b981" />
                    <Rect width={110} height={120} radius={[10, 10, 30, 30]} fill="#b45309" />
                  </Node>
                  <Dibujo q="martin" alto={820} m={m} x={-210} y={560} />
                  {/* escritorio y monitor */}
                  <Rect width={1080} height={430} y={460} fill={degradado("#a16207", "#78350f")} />
                  <Rect width={1080} height={26} y={258} fill="#ca8a04" />
                  <Rect width={420} height={290} x={SIN_PERSONAJES ? 0 : 240} y={60} radius={22} fill={C.tinta} scale={SIN_PERSONAJES ? 1.5 : 1}>
                    <Rect width={384} height={252} radius={12} fill="#f1f5f9">
                      <Rect width={384} height={50} y={-101} fill={C.chat} />
                      <Rect width={220} height={34} x={-60} y={-30} radius={17} fill={C.blanco} />
                      <Rect width={180} height={34} x={70} y={30} radius={17} fill={C.enviado} />
                    </Rect>
                  </Rect>
                  <Rect width={40} height={70} x={SIN_PERSONAJES ? 0 : 240} y={SIN_PERSONAJES ? 290 : 232} fill="#334155" />
                  <Rect ref={aviso} x={SIN_PERSONAJES ? 0 : 240} y={SIN_PERSONAJES ? -230 : -150} radius={32} padding={[20, 30]} layout fill={C.blanco} scale={0} gap={16} alignItems="center" shadowColor="rgba(0,0,0,0.2)" shadowBlur={30} shadowOffsetY={8}>
                    <Circle size={48} fill={C.chat} />
                    <Layout direction="column">
                      <T t={EST.nombre} tam={30} peso={800} />
                      <T t={avisoTexto} tam={26} color={C.gris} peso={500} />
                    </Layout>
                  </Rect>
                </Node>
              )}
            </Node>
            {plano.lugar !== "cau" && (
              <Rect ref={envio} layout direction="column" gap={10} width={760} padding={[28, 34]} radius={28} y={140} fill={C.blanco} stroke={C.tinta} lineWidth={4} {...SOMBRA} scale={0}>
                <Layout direction="row" gap={14} alignItems="center">
                  <Circle size={46} fill={C.chat} />
                  <Txt text={`${EST.nombre} → CAU`} fontFamily={LETRA} fontSize={32} fontWeight={800} fill={C.tinta} />
                  <Txt text="enviando…" fontFamily={MONO} fontSize={24} fill={C.gris} />
                </Layout>
                <T t={primerMensaje} tam={34} peso={600} ancho={690} />
              </Rect>
            )}
            <Rect layout padding={[18, 32]} radius={30} y={-600} fill="rgba(30,27,75,0.85)">
              <T t={plano.rotulo} tam={32} peso={700} color={C.blanco} />
            </Rect>
          </Node>
        ) as Node;
        respirar(m.nodo);
        const dur = plano.fin - plano.inicio;
        return {
          nodo: n,
          alEntrar: function* () {
            yield* all(
              camara().scale(1.07, dur, (v) => v),
              colectivo ? ciudad().x(-900, dur, (v) => v) : waitFor(0),
              plano.lugar === "cau"
                ? (function* () {
                    yield* waitFor(0.5);
                    yield* aviso().scale(1, 0.5, easeOutBack);
                  })()
                : (function* () {
                    yield* waitFor(0.4);
                    yield* envio().scale(1, 0.5, easeOutBack);
                  })(),
            );
          },
        };
      }

      case "nota": {
        const n = (
          <Node ref={raiz}>
            <Fondo />
            <Rect layout direction="column" gap={24} width={840} padding={60} y={-80} radius={24} fill="#fff3c4" rotation={-2} stroke={C.tinta} lineWidth={4} {...SOMBRA}>
              <Etiqueta t="// lo que Martín todavía no sabe" color="#92400e" tam={28} />
              <T t={plano.texto} tam={62} color={C.tinta} peso={800} ancho={716} />
              {plano.detalle && <Txt text={plano.detalle} fontFamily={SERIF} fontStyle="italic" fontSize={50} fill={C.acento} />}
            </Rect>
          </Node>
        ) as Node;
        return { nodo: n };
      }

      case "chat": {
        const columna = createRef<Layout>();
        const tapa = createRef<Rect>();
        const narr = nuevoMuñeco();
        const narrCaja = createRef<Node>();
        const gente = { estudiante: nuevoMuñeco(), martin: nuevoMuñeco() };
        const telefono = createRef<Node>();
        const circulo = createRef<Circle>();
        const n = (
          <Node ref={raiz}>
            <Node ref={telefono}>
              <Fondo />
              <Circle ref={circulo} size={460} x={-330} y={330} fill={GENTE.estudiante.fondo} opacity={SIN_PERSONAJES ? 0 : 1} />
              <Node opacity={SIN_PERSONAJES ? 0 : 1}>
                <Dibujo q="estudiante" alto={760} m={gente.estudiante} x={-330} y={690} />
                <Dibujo q="martin" alto={760} m={gente.martin} x={-330} y={690} />
              </Node>
              <Rect width={600} height={900} x={SIN_PERSONAJES ? 0 : 200} y={60} radius={64} fill="#111827" {...SOMBRA}>
                <Rect width={562} height={862} radius={48} fill={C.fondoChat} clip>
                  <Layout ref={columna} layout direction="column" justifyContent="end" gap={12} width={524} height={700} y={65} />
                  <Rect width={562} height={140} y={-361} fill={C.chat} />
                  <Circle size={66} x={-195} y={-340} fill={GENTE.estudiante.fondo} layout alignItems="center" justifyContent="center">
                    <Txt text={EST.nombre.slice(0, 1)} fontFamily={TITULO} fontSize={38} fill={GENTE.estudiante.color} />
                  </Circle>
                  <Txt x={-148} y={-354} offset={[-1, 0]} text={EST.nombre} fontFamily={LETRA} fontSize={32} fontWeight={700} fill={C.blanco} />
                  <Txt x={-148} y={-320} offset={[-1, 0]} text={EST.detalle} fontFamily={LETRA} fontSize={21} fontWeight={500} fill="#ccfbf1" />
                  <Rect width={160} height={30} y={-414} radius={15} fill="#111827" />
                </Rect>
              </Rect>
            </Node>
            <Rect ref={tapa} width={1080} height={1350} fill="rgba(28,25,23,0.55)" opacity={0} />
            <Node ref={narrCaja} x={SIN_PERSONAJES ? 0 : 1300} scale={SIN_PERSONAJES ? 0 : 1}>
              {!SIN_PERSONAJES && <Circle size={540} x={250} y={260} fill={GENTE.narradora.fondo} />}
              <Dibujo q="narradora" alto={960} m={narr} x={250} y={690} espejo />
              <Rect layout padding={[24, 44]} radius={18} x={SIN_PERSONAJES ? 0 : 10} y={SIN_PERSONAJES ? -40 : -250} fill={C.acento} rotation={-5} {...SOMBRA}>
                <Txt text="¡PARÁ, MARTÍN!" fontFamily={TITULO} fontSize={SIN_PERSONAJES ? 110 : 74} fill={C.blanco} />
              </Rect>
              {SIN_PERSONAJES && (
                <Rect layout padding={[10, 22]} radius={12} y={110} rotation={4} stroke={C.blanco} lineWidth={5}>
                  <Txt text="PRIMERO, REVISÁ" fontFamily={TITULO} fontSize={54} fill={C.blanco} />
                </Rect>
              )}
            </Node>
          </Node>
        ) as Node;
        respirar(gente.estudiante.nodo);
        respirar(gente.martin.nodo, 0.3);
        respirar(narr.nodo);
        const primero = plano.lineas.find((l) => l.quien === "estudiante" || l.quien === "martin")?.quien ?? "estudiante";
        let visible: "estudiante" | "martin" = primero as "estudiante" | "martin";
        circulo().fill(GENTE[visible].fondo);
        gente.estudiante.nodo().opacity(visible === "estudiante" ? 1 : 0);
        gente.martin.nodo().opacity(visible === "martin" ? 1 : 0);
        const borrar = plano.borra && historial[historial.length - 1]?.borrador;
        for (const m of historial) columna().add(burbuja(m).fila);
        function* cambiar(q: "estudiante" | "martin") {
          if (q === visible) return;
          const sale = gente[visible].nodo();
          const entra = gente[q].nodo();
          visible = q;
          yield* all(sale.opacity(0, 0.3), sale.x(-390, 0.3), circulo().fill(GENTE[q].fondo, 0.5));
          entra.x(-270);
          yield* all(entra.opacity(1, 0.35), entra.x(-330, 0.35, easeOutCubic));
        }
        return {
          nodo: n,
          bocas: { narradora: narr.boca, estudiante: gente.estudiante.boca, martin: gente.martin.boca },
          alEntrar: function* () {
            if (borrar) {
              const fila = columna().children()[columna().children().length - 1] as Layout;
              yield* all(fila.opacity(0, 0.35), fila.scale(0.8, 0.35));
              fila.remove();
              historial.pop();
            }
          },
          congelar: function* () {
            yield* all(tapa().opacity(1, 0.3), telefono().filters.grayscale(1, 0.3), telefono().filters.blur(4, 0.3), SIN_PERSONAJES ? narrCaja().scale(1, 0.45, easeOutBack) : narrCaja().x(0, 0.55, easeOutBack));
          },
          linea: function* (l) {
            if (l.quien !== "estudiante" && l.quien !== "martin") return;
            if (l.modo !== "escribe" && l.modo !== "audio") return;
            yield* cambiar(l.quien);
            const m: Mensaje = { de: l.quien, tipo: l.modo === "audio" ? "audio" : "texto", texto: l.texto, dur: l.dur, borrador: l.corta };
            if (m.de === "estudiante" && m.tipo === "texto") {
              const puntos = [createRef<Circle>(), createRef<Circle>(), createRef<Circle>()];
              const fila = (
                <Layout direction="row" width={524} justifyContent="start">
                  <Rect layout direction="row" gap={10} padding={[22, 26]} radius={[6, 24, 24, 24]} fill={C.blanco} alignItems="center">
                    {puntos.map((r) => <Circle ref={r} size={14} fill="#9ca3af" />)}
                  </Rect>
                </Layout>
              ) as Layout;
              columna().add(fila);
              yield* all(
                ...puntos.map((r, i) =>
                  (function* () {
                    yield* waitFor(i * 0.1);
                    yield* r().scale(1.5, 0.15).to(1, 0.15);
                  })(),
                ),
              );
              fila.remove();
            }
            const b = burbuja(m, true);
            columna().add(b.fila);
            b.fila.scale(0.85);
            b.fila.opacity(0);
            yield* all(b.fila.scale(1, 0.3, easeOutBack), b.fila.opacity(1, 0.2));
            if (m.tipo === "texto" && m.de === "martin" && b.txt) {
              const palabras = l.texto.split(/\s+/);
              for (let i = 0; i < palabras.length; i++) {
                const w = l.palabras[Math.min(i, l.palabras.length - 1)];
                if (w) yield* hasta(l.inicio + w.t);
                b.txt().text(palabras.slice(0, i + 1).join(" ") + (i < palabras.length - 1 ? " ▍" : ""));
              }
              yield* hasta(l.inicio + l.dur);
              if (!m.borrador) b.meta?.().text("10:42 ✓✓");
            }
            if (m.tipo === "audio" && b.barras) {
              const barras = b.barras;
              for (let i = 0; i < barras.length; i++) {
                yield* hasta(l.inicio + (l.dur * (i + 1)) / barras.length);
                barras[i].fill(C.chat);
              }
            }
            historial.push(m);
          },
        };
      }

      case "tablero":
      case "lista": {
        const narr = nuevoMuñeco();
        const esLista = plano.tipo === "lista";
        const tarjetas: Tarjeta[] = esLista
          ? plano.items.map((texto, i) => ({ texto: `${i + 1}. ${texto}`, tono: "neutro", marca: i }))
          : plano.tarjetas;
        const items = tarjetas.map((t) => ({ t, nodo: createRef<Rect>(), signo: createRef<Circle>(), signoTxt: createRef<Txt>(), sello: createRef<Rect>() }));
        const columnas = plano.tipo === "tablero" ? plano.columnas : undefined;
        const numeradas = plano.tipo === "tablero" && plano.numeradas;
        const ancho = SIN_PERSONAJES ? (columnas ? 460 : 940) : columnas ? 300 : 610;
        const oculta = (t: Tarjeta) => !esLista && t.marca !== undefined;
        const tarjeta = (it: (typeof items)[number], i: number) => (
          <Rect
            ref={it.nodo}
            layout
            direction="row"
            gap={18}
            alignItems="center"
            width={ancho}
            padding={[20, 22]}
            radius={18}
            fill={C.blanco}
            stroke={C.tinta}
            lineWidth={3}
            {...SOMBRA}
            opacity={oculta(it.t) ? 0 : esLista ? 0.5 : 1}
            x={oculta(it.t) ? 60 : 0}
          >
            <Circle ref={it.signo} size={52} fill={esLista ? "#e7e2d9" : TONO[it.t.tono]} layout alignItems="center" justifyContent="center">
              <Txt ref={it.signoTxt} text={numeradas ? String(i + 1) : esLista ? "" : SIGNO[it.t.tono]} fontFamily={LETRA} fontSize={28} fontWeight={800} fill={C.blanco} />
            </Circle>
            <Layout direction="column" gap={4}>
              <T t={it.t.texto} tam={columnas ? 30 : 38} peso={800} ancho={ancho - (columnas ? 100 : 116)} />
              {it.t.detalle && <T t={it.t.detalle} tam={columnas ? 25 : 30} peso={500} color={C.gris} ancho={ancho - (columnas ? 100 : 116)} />}
            </Layout>
            {it.t.sello && <Sello t={it.t.sello} r={it.sello} x={ancho / 2 - 70} y={-38} rot={-8 + (i % 2) * 5} />}
          </Rect>
        );
        const cuerpo = columnas ? (
          <Layout direction="row" gap={14} alignItems="start">
            {[0, 1].map((col) => (
              <Layout direction="column" gap={18} width={ancho}>
                <Rect layout padding={[10, 18]} radius={12} fill={col === 0 ? C.ok : C.mal}>
                  <Txt text={columnas[col].toUpperCase()} fontFamily={TITULO} fontSize={36} fill={C.blanco} />
                </Rect>
                {items.map((it, i) => (it.t.columna === col ? tarjeta(it, i) : null))}
              </Layout>
            ))}
          </Layout>
        ) : (
          <Layout direction="column" gap={18}>
            {items.map((it, i) => tarjeta(it, i))}
          </Layout>
        );
        const icono = plano.icono;
        const animado = icono ? (SIN_PERSONAJES ? IconoAnimado({ tipo: icono, x: 400, y: -330, tam: 170 }) : IconoAnimado({ tipo: icono, x: 390, y: -300, tam: 210 })) : undefined;
        const subrayado = createRef<Rect>();
        const paso = pasoActual;
        const n = (
          <Node ref={raiz}>
            <Fondo />
            <Layout layout direction="column" gap={26} width={SIN_PERSONAJES ? 960 : 640} x={-490} y={-410} offset={[-1, -1]} alignItems="start">
              <Layout direction="row" gap={18} alignItems="end">
                <Titulo texto={plano.titulo} tam={SIN_PERSONAJES ? 84 : 78} ancho={SIN_PERSONAJES ? (icono ? 640 : 820) - (paso ? 90 : 0) : paso ? 520 : 640} />
                {paso && <Paso n={paso} tam={74} />}
              </Layout>
              <Rect ref={subrayado} width={0} height={10} radius={5} fill={C.acento} />
              {cuerpo}
            </Layout>
            {animado?.nodo}
            <Presentadora m={narr} x={360} alto={700} />
          </Node>
        ) as Node;
        respirar(narr.nodo);
        return {
          nodo: n,
          bocas: { narradora: narr.boca },
          alEntrar: function* () {
            const sinMarca = items.filter((it) => it.t.sello && !oculta(it.t));
            yield* all(
              subrayado().width(150, 0.6, easeOutCubic),
              ...(animado ? [animado.animar()] : []),
              ...sinMarca.map((it, k) =>
                (function* () {
                  yield* waitFor(0.6 + k * 0.3);
                  yield* golpe(it.sello);
                })(),
              ),
            );
          },
          linea: function* (l) {
            if (l.marca === undefined) return;
            const nuevas = items.filter(({ t }) => t.marca === l.marca);
            yield* all(
              ...nuevas.map((it) =>
                esLista
                  ? all(it.nodo().opacity(1, 0.3), it.signo().fill(C.ok, 0.3), it.signo().scale(1.25, 0.15).to(1, 0.2), (function* () {
                      it.signoTxt().text("✓");
                    })())
                  : (function* () {
                      yield* all(it.nodo().opacity(1, 0.35), it.nodo().x(0, 0.5, easeOutBack));
                      if (it.t.sello) yield* golpe(it.sello);
                    })(),
              ),
            );
          },
        };
      }

      case "capitulo": {
        const narr = nuevoMuñeco();
        const num = createRef<Txt>();
        const barra = createRef<Rect>();
        const palabras = plano.texto.toUpperCase().split(/\s+/);
        const refs = palabras.map(() => createRef<Txt>());
        const n = (
          <Node ref={raiz}>
            <Fondo />
            <Layout layout direction="column" gap={10} x={-490} y={-520} offset={[-1, -1]} width={700} alignItems="start">
              <Etiqueta t={plano.numero ? `// paso ${plano.numero}` : "// y ahora"} tam={30} color={C.acento} />
              {plano.numero && <Txt ref={num} text={plano.numero} fontFamily={TITULO} fontSize={300} fill={C.acento} lineHeight="100%" scale={0} />}
              <Layout direction="row" wrap="wrap" gap={24} width={700}>
                {palabras.map((p, i) => (
                  <Txt ref={refs[i]} text={p} fontFamily={TITULO} fontSize={plano.numero ? 112 : 140} fill={i === palabras.length - 1 ? C.acento : C.tinta} opacity={0} lineHeight="105%" />
                ))}
              </Layout>
              <Rect ref={barra} width={0} height={14} radius={7} fill={C.tinta} />
            </Layout>
            <Presentadora m={narr} x={360} alto={760} />
          </Node>
        ) as Node;
        respirar(narr.nodo);
        return {
          nodo: n,
          alEntrar: function* () {
            if (plano.numero) yield* num().scale(1, 0.5, easeOutBack);
            yield* all(
              barra().width(260, 0.7, easeOutCubic),
              ...refs.map((r, i) =>
                (function* () {
                  yield* waitFor(i * 0.09);
                  r().y(40);
                  yield* all(r().opacity(1, 0.25), r().y(0, 0.4, easeOutCubic));
                })(),
              ),
            );
          },
        };
      }

      case "cierre": {
        const frases = plano.items.map(() => createRef<Txt>());
        const final = createRef<Layout>();
        const ms = [nuevoMuñeco(), nuevoMuñeco(), nuevoMuñeco()];
        const n = (
          <Node ref={raiz}>
            <Fondo />
            <Layout layout direction="column" gap={56} width={960} y={SIN_PERSONAJES ? 40 : -100} alignItems="center">
              <Etiqueta t="// para recordar" tam={32} color={C.acento} />
              {plano.items.map((f, i) => (
                <Txt ref={frases[i]} text={f.toUpperCase()} fontFamily={TITULO} fontSize={76} fill={i % 2 ? C.acento : C.tinta} opacity={0} textAlign="center" width={960} textWrap lineHeight="108%" />
              ))}
              <Layout ref={final} direction="row" gap={20} alignItems="center" opacity={0}>
                <Sendero escala={0.35} />
                <Txt text="Ahora probá vos" fontFamily={SERIF} fontStyle="italic" fontSize={60} fill={C.tinta} />
              </Layout>
            </Layout>
            {!SIN_PERSONAJES && <Circle size={280} x={-330} y={500} fill={GENTE.estudiante.fondo} />}
            {!SIN_PERSONAJES && <Circle size={280} x={0} y={520} fill={GENTE.narradora.fondo} />}
            {!SIN_PERSONAJES && <Circle size={280} x={330} y={500} fill={GENTE.martin.fondo} />}
            <Dibujo q="estudiante" alto={360} m={ms[0]} x={-330} y={690} cara="contenta" />
            <Dibujo q="narradora" alto={360} m={ms[1]} x={0} y={700} cara="contenta" />
            <Dibujo q="martin" alto={360} m={ms[2]} x={330} y={690} cara="contenta" />
          </Node>
        ) as Node;
        ms.forEach((m, i) => respirar(m.nodo, i * 0.2));
        return {
          nodo: n,
          bocas: { narradora: ms[1].boca },
          linea: function* (l) {
            if (l.marca === undefined) return;
            if (l.marca === 0) spawn(confeti(raiz()));
            if (l.marca < frases.length) {
              const f = frases[l.marca]();
              f.scale(1.3);
              yield* all(f.opacity(1, 0.25), f.scale(1, 0.4, easeOutBack));
            } else yield* final().opacity(1, 0.4);
          },
        };
      }
    }
  }
});

/** Una burbuja del chat. Las de Martín (CAU) van a la derecha; las del estudiante, a la izquierda. */
function burbuja(m: Mensaje, nueva = false) {
  const txt = createRef<Txt>();
  const meta = createRef<Txt>();
  const barras: Rect[] = [];
  const mio = m.de === "martin";
  const fila = (
    <Layout direction="row" width={540} justifyContent={mio ? "end" : "start"}>
      <Rect
        layout
        direction="column"
        gap={6}
        padding={[16, 20]}
        radius={mio ? [24, 6, 24, 24] : [6, 24, 24, 24]}
        fill={mio ? C.enviado : C.blanco}
        opacity={m.borrador ? 0.9 : 1}
        lineWidth={m.borrador ? 3 : 0}
        stroke={C.aviso}
        lineDash={[12, 8]}
        shadowColor="rgba(0,0,0,0.08)"
        shadowBlur={6}
        shadowOffsetY={2}
      >
        {m.tipo === "texto" ? (
          <Txt ref={txt} text={nueva && mio ? "▍" : m.texto} fontFamily={LETRA} fontSize={27} fontWeight={500} fill={C.tinta} lineHeight="130%" textWrap maxWidth={420} />
        ) : (
          <Layout direction="row" gap={14} alignItems="center">
            <Circle size={52} fill={C.chat} layout alignItems="center" justifyContent="center">
              <Line points={[[-7, -12], [12, 0], [-7, 12]]} closed fill={C.blanco} />
            </Circle>
            <Layout direction="row" gap={4} alignItems="center">
              {Array.from({ length: 24 }, (_, i) => {
                const r = (<Rect width={6} height={12 + Math.abs(Math.sin(i * 1.7) * 34)} radius={3} fill={nueva ? "#94a3b8" : C.chat} />) as Rect;
                barras.push(r);
                return r;
              })}
            </Layout>
            <Txt text={`0:${String(Math.round(m.dur ?? 0)).padStart(2, "0")}`} fontFamily={LETRA} fontSize={22} fill={C.gris} />
          </Layout>
        )}
        <Txt ref={meta} text={m.borrador ? "borrador" : nueva && mio ? "" : "10:42" + (mio ? " ✓✓" : "")} fontFamily={LETRA} fontSize={19} fill={m.borrador ? "#b45309" : C.gris} alignSelf="end" />
      </Rect>
    </Layout>
  ) as Layout;
  return { fila, txt: m.tipo === "texto" ? txt : undefined, meta, barras: m.tipo === "audio" ? barras : undefined };
}
