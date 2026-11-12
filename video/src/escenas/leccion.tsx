import { Circle, Layout, Line, Rect, Txt, makeScene2D } from "@revideo/2d";
import { all, createRef, useScene, waitFor } from "@revideo/core";

type Escena = { tipo: "portada" | "caso" | "idea" | "ojo" | "cierre"; textos: string[]; segundos: number };

// Colores del sistema de diseño de PEA (tokens de app/globals.css)
const C = {
  nav: "#1e1b4b",
  primario: "#4f46e5",
  suave: "#c7d2fe",
  blanco: "#ffffff",
  aviso: "#fb923c",
  exito: "#34d399",
  nivel: ["#4f46e5", "#0f766e", "#c2410c", "#be185d"],
};
const LETRA = "Plus Jakarta Sans";
const ENTRA = 0.5;
const SALE = 0.4;

/** Logo "Sendero": cuatro puntos que crecen y suben, como en la marca. */
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

export default makeScene2D("leccion", function* (view) {
  // Las variables se leen antes de esperar la letra: después de un yield se pierde el contexto de la escena
  const titulo = useScene().variables.get("titulo", "Lección")();
  const guion = useScene().variables.get("guion", [] as Escena[])();

  // La letra de la marca se carga en la página que fabrica el video
  const fuente = new FontFace(LETRA, "url(/plus-jakarta-sans.woff2)", { weight: "400 800" });
  yield fuente.load().then((f) => document.fonts.add(f));

  for (const e of guion) {
    const caja = createRef<Layout>();
    view.add(
      <Layout ref={caja} layout direction="column" gap={36} width={900} alignItems="start" opacity={0} y={30}>
        {cuerpo(e, titulo)}
      </Layout>,
    );
    yield* all(caja().opacity(1, ENTRA), caja().y(0, ENTRA));
    yield* waitFor(Math.max(0.5, e.segundos - ENTRA - SALE));
    yield* all(caja().opacity(0, SALE), caja().y(-30, SALE));
    caja().remove();
  }
});

const texto = (t: string, tam: number, color = C.blanco, peso = 700) => (
  <Txt
    text={t}
    fontFamily={LETRA}
    fontSize={tam}
    fontWeight={peso}
    fill={color}
    textWrap
    width={900}
    lineHeight="125%"
  />
);

function cuerpo(e: Escena, titulo: string) {
  switch (e.tipo) {
    case "portada":
      return [
        <Sendero escala={0.9} />,
        texto("PEA · Lección", 40, C.suave, 600),
        texto(titulo, 96, C.blanco, 800),
      ];
    case "caso":
      return [
        texto(e.textos[0] ?? "", 38, C.suave, 600),
        <Rect fill={C.primario} radius={[8, 48, 48, 48]} padding={48} width={900}>
          {texto(e.textos[1] ?? "", 52, C.blanco, 700)}
        </Rect>,
      ];
    case "idea":
      return [
        <Rect width={120} height={10} radius={5} fill={C.nivel[1]} />,
        texto(e.textos[0] ?? "", 44, C.suave, 600),
        texto(e.textos[1] ?? "", 72, C.blanco, 800),
      ];
    case "ojo":
      return [
        <Line
          points={[
            [0, -60],
            [60, 50],
            [-60, 50],
          ]}
          closed
          fill={C.aviso}
        />,
        texto("Ojo con", 44, C.aviso, 700),
        texto(e.textos[0] ?? "", 48, C.blanco, 600),
      ];
    case "cierre":
      return [
        <Circle size={130} fill={C.exito}>
          <Line
            layout={false}
            points={[
              [-30, 2],
              [-8, 24],
              [32, -20],
            ]}
            stroke={C.nav}
            lineWidth={14}
            lineCap="round"
            lineJoin="round"
          />
        </Circle>,
        texto("Para recordar", 44, C.exito, 700),
        texto(e.textos[0] ?? "", 76, C.blanco, 800),
      ];
  }
}
