// Muestra de los dos estilos de muñeco (palitos y plano) para que la dueña elija.
import { Img, Layout, Node, Rect, Txt, makeScene2D } from "@revideo/2d";
import { all, createRef, easeOutBack, easeOutCubic, waitFor } from "@revideo/core";
import type { Estilo, Look } from "./muneco.tsx";
import { crearMuneco } from "./muneco.tsx";

const LOOKS: Record<"narradora" | "martin" | "estudiante", Look> = {
  narradora: { piel: "#e8b894", pelo: "#5b2d14", ropa: "#0f766e", pantalon: "#1f2937", detalle: "#e0452f", peinado: "rodete", anteojos: true },
  martin: { piel: "#c98e66", pelo: "#2b1d14", ropa: "#2b59c3", pantalon: "#374151", detalle: "#f2a705", peinado: "corto" },
  estudiante: { piel: "#f2c7a5", pelo: "#3b2418", ropa: "#f97316", pantalon: "#1e3a8a", detalle: "#7c3aed", peinado: "colita" },
};

export default makeScene2D("muestra", function* (view) {
  const fuentes = [new FontFace("Anton", "url(/fuentes/anton.woff2)"), new FontFace("JetBrains Mono", "url(/fuentes/mono.woff2)")];
  yield Promise.all(fuentes.map((f) => f.load().then((x) => document.fonts.add(x))));
  view.add(<Img src="/fondos/papel.svg" width={1080} height={1350} />);

  for (const estilo of ["palitos", "plano"] as Estilo[]) {
    const capa = createRef<Node>();
    const tarjeta = createRef<Rect>();
    view.add(
      <Node ref={capa}>
        <Layout layout direction="column" x={-490} y={-620} offset={[-1, -1]} gap={6}>
          <Txt text={estilo === "palitos" ? "// opción A" : "// opción B"} fontFamily="JetBrains Mono" fontSize={30} fill="#e0452f" />
          <Txt text={estilo === "palitos" ? "PALITOS" : "PERSONAJE PLANO"} fontFamily="Anton" fontSize={110} fill="#1c1917" />
        </Layout>
        <Rect ref={tarjeta} x={-200} y={-170} width={520} height={190} radius={18} fill="#ffffff" stroke="#1c1917" lineWidth={4} shadowColor="#1c1917" shadowOffset={[6, 6]} scale={0}>
          <Txt text={"EL CORREO\nREGISTRADO"} fontFamily="Anton" fontSize={64} fill="#e0452f" textAlign="center" />
        </Rect>
      </Node>,
    );
    const narr = crearMuneco({ estilo, look: LOOKS.narradora, x: 760, y: 640, escala: 1.45 });
    const est = crearMuneco({ estilo, look: LOOKS.estudiante, x: -360, y: 650, escala: 1.15 });
    const mar = crearMuneco({ estilo, look: LOOKS.martin, x: -110, y: 650, escala: 1.15 });
    capa().add(narr.nodo);
    narr.vivir();
    // la narradora entra caminando, saluda, señala la tarjeta y explica
    yield* narr.caminar(320, 1.8);
    yield* all(narr.gesto("saludar", 1.8), narr.hablar(1.8));
    yield* all(tarjeta().scale(1, 0.5, easeOutBack), narr.gesto("señalarArriba", 2.2), narr.hablar(2.2));
    yield* all(narr.gesto("explicar", 2.6), narr.hablar(2.6));
    // aparecen la estudiante con el celular y Martín, que piensa
    capa().add(est.nodo);
    capa().add(mar.nodo);
    est.nodo.opacity(0);
    mar.nodo.opacity(0);
    est.vivir();
    mar.vivir();
    yield* all(est.nodo.opacity(1, 0.4, easeOutCubic), mar.nodo.opacity(1, 0.4, easeOutCubic), tarjeta().scale(0, 0.4));
    yield* all(est.gesto("celular", 2.2), est.hablar(1.6), mar.gesto("pensar", 2.2));
    yield* all(mar.gesto("explicar", 2), mar.hablar(2));
    yield* all(narr.gesto("festejar", 1.6), est.gesto("festejar", 1.6), mar.gesto("festejar", 1.6));
    yield* waitFor(0.4);
    yield* capa().opacity(0, 0.4);
    capa().remove();
  }
});
