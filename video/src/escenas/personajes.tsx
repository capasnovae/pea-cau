// Video con personajes: Lucía, Martín y la narradora, un chat del CAU y tableros que se arman mientras se habla.
// La línea de tiempo viene armada desde render.ts (cada línea con su audio medido): la escena solo espera a cada momento.
import { Circle, Layout, Line, Node, Rect, Txt, makeScene2D } from "@revideo/2d";
import type { Reference, ThreadGenerator } from "@revideo/core";
import { all, createRef, easeOutBack, loop, spawn, useScene, useThread, waitFor } from "@revideo/core";
import type { LineaConTiempo, Palabra, PlanoConTiempo, Quien, Tarjeta, Tono } from "../../guiones/tipos.ts";

const C = {
  nav: "#1e1b4b",
  banda: "#2e2a6b",
  primario: "#4f46e5",
  suave: "#c7d2fe",
  blanco: "#ffffff",
  tinta: "#111827",
  gris: "#64748b",
  aviso: "#f59e0b",
  ok: "#10b981",
  mal: "#ef4444",
  chat: "#0f766e",
  fondoChat: "#efe7dd",
  enviado: "#d9fdd3",
};
const LETRA = "Plus Jakarta Sans";
const TONO: Record<Tono, string> = { ok: C.ok, aviso: C.aviso, mal: C.mal, neutro: C.primario };

type Look = { piel: string; pelo: string; ropa: string; estilo: "largo" | "corto" | "rodete"; nombre: string; color: string };
const GENTE: Record<Exclude<Quien, "nadie">, Look> = {
  lucia: { piel: "#f2c7a5", pelo: "#3b2418", ropa: "#f97316", estilo: "largo", nombre: "Lucía", color: "#fdba74" },
  martin: { piel: "#d9a47e", pelo: "#2b1d14", ropa: "#2563eb", estilo: "corto", nombre: "Martín · asesor del CAU", color: "#93c5fd" },
  narradora: { piel: "#e8b894", pelo: "#7c3f1d", ropa: "#0f766e", estilo: "rodete", nombre: "Narradora", color: "#6ee7b7" },
};

// ---------- tiempo ----------
function* hasta(t: number) {
  const falta = t - useThread().time();
  if (falta > 0.0001) yield* waitFor(falta);
}

/** Abre y cierra la boca con cada palabra dicha. */
function* hablar(bocas: Reference<Rect>[], palabras: Palabra[], inicio: number) {
  for (const w of palabras) {
    yield* hasta(inicio + w.t);
    const abre = Math.min(0.09, w.d * 0.45);
    yield* all(...bocas.map((b) => b().height(18, abre)));
    yield* all(...bocas.map((b) => b().height(6, Math.min(0.09, w.d * 0.45))));
  }
}

function parpadear(ojos: Reference<Node>) {
  spawn(
    loop(Infinity, function* () {
      yield* waitFor(2.4 + Math.random() * 2);
      yield* ojos().scale.y(0.1, 0.07);
      yield* ojos().scale.y(1, 0.08);
    }),
  );
}

// ---------- personajes ----------
function Cabeza({ look, boca, ojos }: { look: Look; boca: Reference<Rect>; ojos: Reference<Node> }) {
  return (
    <Node>
      {look.estilo === "largo" && <Rect width={206} height={270} radius={[103, 103, 40, 40]} y={62} fill={look.pelo} />}
      {look.estilo === "rodete" && <Circle size={86} y={-96} fill={look.pelo} />}
      <Circle size={160} fill={look.piel} />
      <Circle
        size={174}
        y={-10}
        startAngle={look.estilo === "corto" ? 192 : 180}
        endAngle={look.estilo === "corto" ? 348 : 360}
        closed
        fill={look.pelo}
      />
      {look.estilo === "corto" && <Rect width={150} height={16} y={-16} radius={8} fill={look.pelo} />}
      <Node ref={ojos} y={8}>
        <Circle size={15} x={-30} fill={C.tinta} />
        <Circle size={15} x={30} fill={C.tinta} />
      </Node>
      <Rect width={30} height={5} x={-30} y={-14} radius={3} fill={look.pelo} />
      <Rect width={30} height={5} x={30} y={-14} radius={3} fill={look.pelo} />
      {look.estilo === "rodete" && (
        <Node y={8}>
          <Circle size={48} x={-30} stroke="#334155" lineWidth={5} />
          <Circle size={48} x={30} stroke="#334155" lineWidth={5} />
          <Line points={[[-6, 0], [6, 0]]} stroke="#334155" lineWidth={5} />
        </Node>
      )}
      <Circle size={24} x={-50} y={34} fill="#f87171" opacity={0.35} />
      <Circle size={24} x={50} y={34} fill="#f87171" opacity={0.35} />
      <Rect ref={boca} width={32} height={6} y={46} radius={4} fill="#7f1d1d" />
    </Node>
  );
}

function Persona({ quien, boca, ojos, telefono }: { quien: Exclude<Quien, "nadie">; boca: Reference<Rect>; ojos: Reference<Node>; telefono?: boolean }) {
  const look = GENTE[quien];
  return (
    <Node>
      <Rect width={246} height={250} radius={[120, 120, 30, 30]} y={210} fill={look.ropa} />
      <Rect width={52} height={50} y={92} fill={look.piel} />
      {quien === "martin" && <Rect width={8} height={120} x={-40} y={170} fill="#facc15" />}
      <Cabeza look={look} boca={boca} ojos={ojos} />
      {telefono && (
        <Node y={200}>
          <Rect width={150} height={46} radius={23} x={-60} rotation={-20} fill={look.piel} />
          <Rect width={150} height={46} radius={23} x={60} rotation={20} fill={look.piel} />
          <Rect width={70} height={112} radius={12} y={-34} fill={C.tinta}>
            <Rect width={58} height={92} radius={8} fill="#a7f3d0" />
          </Rect>
        </Node>
      )}
    </Node>
  );
}

// ---------- piezas ----------
const T = (props: { t: string; tam: number; color?: string; peso?: number; ancho?: number; alinea?: CanvasTextAlign }) => (
  <Txt
    text={props.t}
    fontFamily={LETRA}
    fontSize={props.tam}
    fontWeight={props.peso ?? 600}
    fill={props.color ?? C.blanco}
    textWrap={props.ancho ? true : false}
    width={props.ancho}
    textAlign={props.alinea ?? "left"}
    lineHeight="130%"
  />
);

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

function Icono({ tipo }: { tipo: "lupa" | "calendario" | "estrella" | "alerta" | "check" }) {
  switch (tipo) {
    case "lupa":
      return (
        <Node>
          <Circle size={52} stroke={C.blanco} lineWidth={9} x={-6} y={-6} />
          <Line points={[[14, 14], [32, 32]]} stroke={C.blanco} lineWidth={10} lineCap="round" />
        </Node>
      );
    case "calendario":
      return (
        <Node>
          <Rect width={70} height={62} radius={10} stroke={C.blanco} lineWidth={8} y={4} />
          <Rect width={70} height={16} y={-20} fill={C.blanco} />
          <Rect width={18} height={18} x={12} y={14} radius={4} fill={C.aviso} />
        </Node>
      );
    case "estrella":
      return (
        <Line
          points={Array.from({ length: 10 }, (_, i) => {
            const r = i % 2 ? 16 : 38;
            const a = (Math.PI / 5) * i - Math.PI / 2;
            return [Math.cos(a) * r, Math.sin(a) * r] as [number, number];
          })}
          closed
          fill={C.blanco}
        />
      );
    case "alerta":
      return (
        <Node>
          <Line points={[[0, -36], [40, 32], [-40, 32]]} closed fill={C.blanco} lineJoin="round" />
          <Rect width={9} height={26} y={0} radius={4} fill={C.aviso} />
          <Circle size={10} y={20} fill={C.aviso} />
        </Node>
      );
    case "check":
      return <Line points={[[-22, 2], [-6, 18], [24, -16]]} stroke={C.blanco} lineWidth={11} lineCap="round" lineJoin="round" />;
  }
}

/** Texto de los subtítulos en partes cortas, cada una con el momento en que empieza. */
function partes(l: LineaConTiempo): { t: number; texto: string }[] {
  const frases = l.texto.match(/[^.:;?!]+[.:;?!…»]*\s*/g) ?? [l.texto];
  const trozos: string[] = [];
  for (const f of frases) {
    const pal = f.trim().split(/\s+/);
    if (f.length <= 95) trozos.push(f.trim());
    else {
      // frases largas: se cortan en una coma cerca de la mitad, o a la mitad de las palabras
      const comas = [...f.matchAll(/,\s/g)].map((m) => m.index ?? 0);
      const mitad = f.length / 2;
      const corte = comas.sort((a, b) => Math.abs(a - mitad) - Math.abs(b - mitad))[0];
      if (corte && Math.abs(corte - mitad) < f.length * 0.3) trozos.push(f.slice(0, corte + 1).trim(), f.slice(corte + 1).trim());
      else trozos.push(pal.slice(0, Math.ceil(pal.length / 2)).join(" "), pal.slice(Math.ceil(pal.length / 2)).join(" "));
    }
  }
  let n = 0;
  return trozos.filter(Boolean).map((texto) => {
    const w = l.palabras[Math.min(n, l.palabras.length - 1)];
    n += texto.split(/\s+/).filter((p) => /[\p{L}\p{N}]/u.test(p)).length;
    return { t: l.inicio + (w ? w.t : 0), texto };
  });
}

// ---------- escena ----------
type Mensaje = { de: "lucia" | "martin"; tipo: "texto" | "audio"; texto: string; dur?: number; borrador?: boolean };

export default makeScene2D("personajes", function* (view) {
  const planos = useScene().variables.get("planos", [] as PlanoConTiempo[])();
  const titulo = useScene().variables.get("titulo", "Lección")();
  const bajada = useScene().variables.get("bajada", "")();
  const total = useScene().variables.get("total", 1)();

  const fuente = new FontFace(LETRA, "url(/plus-jakarta-sans.woff2)", { weight: "400 800" });
  yield fuente.load().then((f) => document.fonts.add(f));

  // Banda de abajo: quién habla (con su cara) y lo que dice
  const escenario = createRef<Node>();
  const banda = createRef<Rect>();
  const nombre = createRef<Txt>();
  const dicho = createRef<Txt>();
  const caras = {} as Record<Exclude<Quien, "nadie">, { nodo: Reference<Node>; boca: Reference<Rect>; ojos: Reference<Node> }>;
  for (const q of ["lucia", "martin", "narradora"] as const) caras[q] = { nodo: createRef(), boca: createRef(), ojos: createRef() };

  view.add(<Node ref={escenario} />);
  view.add(
    <Rect ref={banda} width={1000} height={250} y={518} radius={40} fill={C.banda} opacity={0}>
      <Circle size={176} x={-382} fill="#3f3a8a" clip>
        {(["lucia", "martin", "narradora"] as const).map((q) => (
          <Node ref={caras[q].nodo} y={30} scale={0.95} opacity={0}>
            <Cabeza look={GENTE[q]} boca={caras[q].boca} ojos={caras[q].ojos} />
          </Node>
        ))}
      </Circle>
      <Txt ref={nombre} x={-270} y={-78} offset={[-1, 0]} fontFamily={LETRA} fontSize={30} fontWeight={700} fill={C.suave} text="" />
      <Txt
        ref={dicho}
        x={-270}
        y={14}
        offset={[-1, 0]}
        width={730}
        textWrap
        fontFamily={LETRA}
        fontSize={40}
        fontWeight={600}
        lineHeight="130%"
        fill={C.blanco}
        text=""
      />
    </Rect>,
  );
  for (const q of ["lucia", "martin", "narradora"] as const) parpadear(caras[q].ojos);

  function* mostrarBanda(l: LineaConTiempo) {
    if (l.quien === "nadie") {
      yield* banda().opacity(0, 0.3);
      return;
    }
    for (const q of ["lucia", "martin", "narradora"] as const) caras[q].nodo().opacity(q === l.quien ? 1 : 0);
    nombre().fill(GENTE[l.quien].color);
    if (l.modo === "escribe") {
      nombre().text(`${GENTE[l.quien].nombre} · escribe`);
      dicho().text("");
    } else {
      nombre().text(l.modo === "audio" ? `${GENTE[l.quien].nombre} · mensaje de voz` : GENTE[l.quien].nombre);
      const ps = partes(l);
      dicho().text(ps[0]?.texto ?? "");
      spawn(function* () {
        for (const p of ps.slice(1)) {
          yield* hasta(p.t);
          dicho().text(p.texto);
        }
      });
    }
    if (banda().opacity() < 1) yield* banda().opacity(1, 0.25);
  }

  const historial: Mensaje[] = [];

  for (const plano of planos) {
    yield* hasta(plano.inicio);
    const raiz = createRef<Node>();
    const extra = armar(plano, historial, raiz);
    escenario().add(extra.nodo);
    raiz().opacity(0);
    raiz().y(24);
    yield* all(raiz().opacity(1, 0.4), raiz().y(0, 0.4));
    if (extra.alEntrar) yield* extra.alEntrar();

    for (const l of plano.lineas) {
      yield* hasta(l.inicio - (l.modo === "congela" ? 0.8 : 0));
      if (l.modo === "congela" && extra.congelar) yield* extra.congelar();
      yield* hasta(l.inicio);
      yield* mostrarBanda(l);
      const bocas: Reference<Rect>[] = l.quien === "nadie" ? [] : [caras[l.quien].boca];
      if (l.modo === "congela" && extra.bocaNarradora) bocas.push(extra.bocaNarradora);
      if (bocas.length) spawn(hablar(bocas, l.palabras, l.inicio));
      if (extra.linea) spawn(extra.linea(l));
      yield* hasta(l.inicio + l.dur);
    }

    yield* hasta(plano.fin - 0.35);
    const ultimo = plano === planos[planos.length - 1];
    if (!ultimo) {
      yield* all(raiz().opacity(0, 0.35), raiz().y(-24, 0.35), ...(plano.lineas.length ? [] : [banda().opacity(0, 0.35)]));
      extra.nodo.remove();
    }
  }
  yield* hasta(total);

  // ---------- planos ----------
  function armar(
    plano: PlanoConTiempo,
    historial: Mensaje[],
    raiz: Reference<Node>,
  ): {
    nodo: Node;
    alEntrar?: () => ThreadGenerator;
    linea?: (l: LineaConTiempo) => ThreadGenerator;
    congelar?: () => ThreadGenerator;
    bocaNarradora?: Reference<Rect>;
  } {
    switch (plano.tipo) {
      case "portada": {
        const n = (
          <Node ref={raiz}>
            <Layout layout direction="column" alignItems="center" gap={34} y={-120}>
              <Sendero escala={0.85} />
              <T t="PEA · Lección" tam={40} color={C.suave} />
              <T t={titulo} tam={92} peso={800} ancho={940} alinea="center" />
              <T t={bajada} tam={42} color={C.suave} peso={500} />
            </Layout>
          </Node>
        ) as Node;
        return { nodo: n };
      }

      case "escena": {
        const boca = createRef<Rect>();
        const ojos = createRef<Node>();
        const ciudad = createRef<Node>();
        const aviso = createRef<Rect>();
        const colectivo = plano.lugar === "colectivo";
        const n = (
          <Node ref={raiz}>
            <Rect width={960} height={900} y={-170} radius={48} clip fill={colectivo ? "#bfdbfe" : "#e0e7ff"}>
              {colectivo ? (
                <Node>
                  <Rect width={880} height={330} y={-200} radius={30} fill="#7dd3fc" clip>
                    <Node ref={ciudad} y={60}>
                      {Array.from({ length: 16 }, (_, i) => (
                        <Rect
                          x={-520 + i * 120}
                          y={40 - ((i * 37) % 90)}
                          width={100}
                          height={220 + ((i * 53) % 140)}
                          radius={8}
                          fill={["#94a3b8", "#64748b", "#a5b4fc", "#cbd5e1"][i % 4]}
                        />
                      ))}
                    </Node>
                  </Rect>
                  <Rect width={960} height={400} y={250} fill="#fde68a" />
                  <Rect width={330} height={420} y={110} radius={50} fill="#2563eb" />
                  <Node y={40} scale={1.2}>
                    <Persona quien="lucia" boca={boca} ojos={ojos} telefono />
                  </Node>
                </Node>
              ) : (
                <Node>
                  <Rect width={160} height={200} x={-300} y={-250} radius={14} fill="#c7d2fe" />
                  <Circle size={90} x={330} y={-260} fill="#a7f3d0" />
                  <Node x={-170} y={20} scale={1.15}>
                    <Persona quien="martin" boca={boca} ojos={ojos} />
                  </Node>
                  <Rect width={960} height={260} y={330} fill="#b45309" />
                  <Rect width={330} height={220} x={200} y={100} radius={18} fill={C.tinta}>
                    <Rect width={300} height={186} radius={10} fill="#e2e8f0">
                      <Rect width={200} height={26} x={-30} y={-50} radius={13} fill={C.blanco} />
                      <Rect width={160} height={26} x={50} y={0} radius={13} fill={C.enviado} />
                    </Rect>
                  </Rect>
                  <Rect width={30} height={70} x={200} y={240} fill="#334155" />
                  <Rect ref={aviso} x={200} y={-90} radius={30} padding={[18, 30]} layout fill={C.chat} scale={0} gap={14} alignItems="center">
                    <Circle size={22} fill={C.blanco} />
                    <T t="Nuevo mensaje · Lucía" tam={32} peso={700} />
                  </Rect>
                </Node>
              )}
              <Rect layout padding={[16, 28]} radius={28} y={-400} fill="rgba(30,27,75,0.85)">
                <T t={plano.rotulo} tam={32} peso={700} />
              </Rect>
            </Rect>
          </Node>
        ) as Node;
        parpadear(ojos);
        return {
          nodo: n,
          alEntrar: function* () {
            if (colectivo) spawn(ciudad().x(-600, plano.fin - plano.inicio, (v) => v));
            else spawn(aviso().scale(1, 0.5, easeOutBack));
          },
        };
      }

      case "nota": {
        const n = (
          <Node ref={raiz}>
            <Rect layout direction="column" gap={26} width={860} padding={60} y={-180} radius={40} fill="#fef3c7" rotation={-2}>
              <T t="Lo que Martín todavía no sabe" tam={34} color="#92400e" peso={700} />
              <T t={plano.texto} tam={58} color={C.tinta} peso={800} ancho={740} />
              {plano.detalle && <T t={plano.detalle} tam={38} color="#92400e" peso={600} ancho={740} />}
            </Rect>
          </Node>
        ) as Node;
        return { nodo: n };
      }

      case "chat": {
        const columna = createRef<Layout>();
        const tapa = createRef<Rect>();
        const narr = createRef<Node>();
        const bocaN = createRef<Rect>();
        const ojosN = createRef<Node>();
        const n = (
          <Node ref={raiz}>
            <Rect width={940} height={930} y={-180} radius={44} fill={C.fondoChat} clip>
              <Rect width={940} height={130} y={-400} fill={C.chat} />
              <Circle size={84} x={-380} y={-400} fill="#99f6e4" clip>
                <Node y={22} scale={0.5}>
                  <Cabeza look={GENTE.lucia} boca={createRef()} ojos={createRef()} />
                </Node>
              </Circle>
              <Txt x={-318} y={-418} offset={[-1, 0]} text="Lucía" fontFamily={LETRA} fontSize={38} fontWeight={700} fill={C.blanco} />
              <Txt x={-318} y={-378} offset={[-1, 0]} text="Estudiante · ED" fontFamily={LETRA} fontSize={26} fontWeight={500} fill="#ccfbf1" />
              <Layout
                ref={columna}
                layout
                direction="column"
                justifyContent="end"
                gap={18}
                width={880}
                height={760}
                y={60}
              />
              <Rect ref={tapa} width={940} height={930} fill="rgba(15,23,42,0.6)" opacity={0} />
              <Node ref={narr} y={120} scale={0}>
                <Circle size={360} fill={C.banda} />
                <Node y={40} scale={1.3}>
                  <Cabeza look={GENTE.narradora} boca={bocaN} ojos={ojosN} />
                </Node>
                <Rect layout padding={[18, 34]} radius={30} y={-250} fill={C.aviso}>
                  <T t="¡Pará!" tam={56} peso={800} color={C.tinta} />
                </Rect>
              </Node>
            </Rect>
          </Node>
        ) as Node;
        parpadear(ojosN);
        const borrar = plano.borra && historial[historial.length - 1]?.borrador;
        for (const m of historial) columna().add(burbuja(m).fila);
        return {
          nodo: n,
          bocaNarradora: bocaN,
          alEntrar: function* () {
            if (borrar) {
              const fila = columna().children()[columna().children().length - 1] as Layout;
              yield* all(fila.opacity(0, 0.35), fila.scale(0.8, 0.35));
              fila.remove();
              historial.pop();
            }
          },
          congelar: function* () {
            yield* all(tapa().opacity(1, 0.3), columna().filters.grayscale(1, 0.3), narr().scale(1, 0.5, easeOutBack));
          },
          linea: function* (l) {
            if (l.quien !== "lucia" && l.quien !== "martin") return;
            if (l.modo !== "escribe" && l.modo !== "audio") return;
            const m: Mensaje = { de: l.quien, tipo: l.modo === "audio" ? "audio" : "texto", texto: l.texto, dur: l.dur, borrador: l.corta };
            const b = burbuja(m, true);
            columna().add(b.fila);
            b.fila.scale(0.85);
            b.fila.opacity(0);
            yield* all(b.fila.scale(1, 0.25, easeOutBack), b.fila.opacity(1, 0.2));
            if (m.tipo === "texto" && m.de === "martin" && b.txt) {
              // se escribe al ritmo de la voz
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

      case "tablero": {
        const items: { t: Tarjeta; nodo: Reference<Rect> }[] = plano.tarjetas.map((t) => ({ t, nodo: createRef<Rect>() }));
        const tarjeta = (t: Tarjeta, ref: Reference<Rect>, i: number, ancho: number) => (
          <Rect ref={ref} layout direction="row" gap={22} alignItems="center" width={ancho} padding={[24, 28]} radius={28} fill={C.blanco} opacity={t.marca === undefined ? 1 : 0} scale={t.marca === undefined ? 1 : 0.9}>
            {plano.numeradas ? (
              <Circle size={58} fill={TONO[t.tono]} layout alignItems="center" justifyContent="center">
                <T t={String(i + 1)} tam={32} peso={800} />
              </Circle>
            ) : (
              <Rect width={14} height={70} radius={7} fill={TONO[t.tono]} />
            )}
            <Layout direction="column" gap={6} grow={1}>
              <T t={t.texto} tam={plano.columnas ? 36 : 40} peso={800} color={C.tinta} ancho={ancho - 130} />
              {t.detalle && <T t={t.detalle} tam={plano.columnas ? 28 : 31} peso={500} color={C.gris} ancho={ancho - 130} />}
            </Layout>
          </Rect>
        );
        const cuerpo = plano.columnas ? (
          <Layout direction="row" gap={30} alignItems="start">
            {[0, 1].map((col) => (
              <Layout direction="column" gap={20} width={445}>
                <Rect layout padding={[14, 24]} radius={22} fill={col === 0 ? C.ok : C.mal}>
                  <T t={plano.columnas![col]} tam={34} peso={800} />
                </Rect>
                {items.map(({ t, nodo }, i) => (t.columna === col ? tarjeta(t, nodo, i, 445) : null))}
              </Layout>
            ))}
          </Layout>
        ) : (
          <Layout direction="column" gap={20}>
            {items.map(({ t, nodo }, i) => tarjeta(t, nodo, i, 920))}
          </Layout>
        );
        const n = (
          <Node ref={raiz}>
            <Layout layout direction="column" gap={34} width={920} y={-200} alignItems="start">
              <Layout direction="row" gap={24} alignItems="center">
                {plano.icono && (
                  <Rect width={96} height={96} radius={28} fill={plano.icono === "alerta" ? C.aviso : C.primario} layout={false}>
                    <Icono tipo={plano.icono} />
                  </Rect>
                )}
                <T t={plano.titulo} tam={54} peso={800} ancho={plano.icono ? 790 : 920} />
              </Layout>
              {cuerpo}
            </Layout>
          </Node>
        ) as Node;
        return {
          nodo: n,
          linea: function* (l) {
            if (l.marca === undefined) return;
            yield* all(
              ...items.filter(({ t }) => t.marca === l.marca).map(({ nodo }) => all(nodo().opacity(1, 0.35), nodo().scale(1, 0.45, easeOutBack))),
            );
          },
        };
      }

      case "lista": {
        const marcas = plano.items.map(() => ({ caja: createRef<Circle>(), tilde: createRef<Rect>(), fila: createRef<Layout>() }));
        const n = (
          <Node ref={raiz}>
            <Layout layout direction="column" gap={24} width={920} y={-200} alignItems="start">
              <T t={plano.titulo} tam={54} peso={800} ancho={920} />
              {plano.items.map((it, i) => (
                <Layout ref={marcas[i].fila} direction="row" gap={24} alignItems="center" opacity={0.45}>
                  <Circle ref={marcas[i].caja} size={70} stroke={C.suave} lineWidth={6} layout={false} x={35} />
                  <Rect ref={marcas[i].tilde} scale={0} layout={false} x={35}>
                    <Circle size={70} fill={C.ok} />
                    <Icono tipo="check" />
                  </Rect>
                  <Rect width={70} height={70} />
                  <T t={`${i + 1}. ${it}`} tam={40} peso={700} ancho={820} />
                </Layout>
              ))}
            </Layout>
          </Node>
        ) as Node;
        return {
          nodo: n,
          linea: function* (l) {
            if (l.marca === undefined) return;
            const m = marcas[l.marca];
            yield* all(m.fila().opacity(1, 0.3), m.tilde().scale(1, 0.45, easeOutBack));
          },
        };
      }

      case "cierre": {
        const frases = plano.items.map(() => createRef<Txt>());
        const final = createRef<Layout>();
        const n = (
          <Node ref={raiz}>
            <Layout layout direction="column" gap={40} width={920} y={-200} alignItems="center">
              <Circle size={130} fill={C.ok} layout={false} y={-330}>
                <Icono tipo="check" />
              </Circle>
              <Rect height={120} />
              <T t="Para recordar" tam={44} color={C.ok} peso={700} />
              {plano.items.map((f, i) => (
                <Txt ref={frases[i]} text={f} fontFamily={LETRA} fontSize={72} fontWeight={800} fill={C.blanco} opacity={0} textAlign="center" width={920} textWrap />
              ))}
              <Layout ref={final} direction="row" gap={24} alignItems="center" opacity={0}>
                <Sendero escala={0.4} />
                <T t="Ahora probá vos" tam={44} color={C.suave} peso={700} />
              </Layout>
            </Layout>
          </Node>
        ) as Node;
        return {
          nodo: n,
          linea: function* (l) {
            if (l.marca === undefined) return;
            if (l.marca < frases.length) yield* frases[l.marca]().opacity(1, 0.4);
            else yield* final().opacity(1, 0.4);
          },
        };
      }
    }
  }
});

/** Una burbuja del chat. Las de Martín (CAU) van a la derecha; las de Lucía, a la izquierda. */
function burbuja(m: Mensaje, nueva = false) {
  const txt = createRef<Txt>();
  const meta = createRef<Txt>();
  const barras: Rect[] = [];
  const mio = m.de === "martin";
  const fila = (
    <Layout direction="row" width={880} justifyContent={mio ? "end" : "start"}>
      <Rect
        layout
        direction="column"
        gap={8}
        padding={[18, 24]}
        radius={mio ? [26, 6, 26, 26] : [6, 26, 26, 26]}
        fill={mio ? C.enviado : C.blanco}
        opacity={m.borrador ? 0.85 : 1}
        lineWidth={m.borrador ? 3 : 0}
        stroke={C.aviso}
        lineDash={[12, 8]}
      >
        {m.tipo === "texto" ? (
          <Txt
            ref={txt}
            text={nueva && mio ? "▍" : m.texto}
            fontFamily={LETRA}
            fontSize={33}
            fontWeight={500}
            fill={C.tinta}
            lineHeight="128%"
            textWrap
            maxWidth={640}
          />
        ) : (
          <Layout direction="row" gap={18} alignItems="center">
            <Circle size={62} fill={C.chat} layout alignItems="center" justifyContent="center">
              <Line points={[[-8, -14], [14, 0], [-8, 14]]} closed fill={C.blanco} />
            </Circle>
            <Layout direction="row" gap={5} alignItems="center">
              {Array.from({ length: 28 }, (_, i) => {
                const r = (
                  <Rect width={7} height={14 + Math.abs(Math.sin(i * 1.7) * 40)} radius={4} fill={nueva ? "#94a3b8" : C.chat} />
                ) as Rect;
                barras.push(r);
                return r;
              })}
            </Layout>
            <Txt text={`0:${String(Math.round(m.dur ?? 0)).padStart(2, "0")}`} fontFamily={LETRA} fontSize={26} fill={C.gris} />
          </Layout>
        )}
        <Txt ref={meta} text={m.borrador ? "borrador" : nueva && mio ? "" : "10:42" + (mio ? " ✓✓" : "")} fontFamily={LETRA} fontSize={22} fill={m.borrador ? "#b45309" : C.gris} alignSelf="end" />
      </Rect>
    </Layout>
  ) as Layout;
  return { fila, txt: m.tipo === "texto" ? txt : undefined, meta, barras: m.tipo === "audio" ? barras : undefined };
}
