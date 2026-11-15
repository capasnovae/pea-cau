// Muestra del estilo propio "frijol" (opción C) para comparar con palitos y plano.
import { Img, Layout, Node, Rect, Txt, makeScene2D } from "@revideo/2d";
import { all, createRef, easeOutBack, easeOutCubic, waitFor } from "@revideo/core";
import { crearFrijol } from "./muneco.tsx";

export default makeScene2D("muestra", function* (view) {
  const fuentes = [new FontFace("Anton", "url(/fuentes/anton.woff2)"), new FontFace("JetBrains Mono", "url(/fuentes/mono.woff2)")];
  yield Promise.all(fuentes.map((f) => f.load().then((x) => document.fonts.add(x))));
  view.add(<Img src="/fondos/papel.svg" width={1080} height={1350} />);
  const capa = createRef<Node>();
  const tarjeta = createRef<Rect>();
  const sello = createRef<Rect>();
  view.add(
    <Node ref={capa}>
      <Layout layout direction="column" x={-490} y={-620} offset={[-1, -1]} gap={6}>
        <Txt text="// opción C" fontFamily="JetBrains Mono" fontSize={30} fill="#e0452f" />
        <Txt text="PERSONAJE PROPIO" fontFamily="Anton" fontSize={110} fill="#1c1917" />
      </Layout>
      <Rect ref={tarjeta} x={-210} y={-200} width={520} height={190} radius={18} fill="#ffffff" stroke="#1c1917" lineWidth={4} shadowColor="#1c1917" shadowOffset={[6, 6]} scale={0}>
        <Txt text={"EL CORREO\nREGISTRADO"} fontFamily="Anton" fontSize={64} fill="#e0452f" textAlign="center" />
        <Rect ref={sello} layout={false} x={170} y={-80} rotation={-10} opacity={0} scale={1.8}>
          <Rect layout padding={[6, 14]} radius={10} stroke="#e0452f" lineWidth={5} fill="#f4efe6">
            <Txt text="OBLIGATORIO" fontFamily="Anton" fontSize={32} fill="#e0452f" />
          </Rect>
        </Rect>
      </Rect>
    </Node>,
  );
  const narr = crearFrijol({ look: { detalle: "#e0452f", accesorio: "rodete", anteojos: true }, x: 760, y: 640, escala: 1.25 });
  const est = crearFrijol({ look: { detalle: "#7c3aed", accesorio: "colita" }, x: -360, y: 650, escala: 1.0 });
  const mar = crearFrijol({ look: { detalle: "#f2a705", accesorio: "corbata" }, x: -100, y: 650, escala: 1.0 });
  capa().add(narr.nodo);
  narr.vivir();
  yield* narr.caminar(320, 1.8);
  yield* all(narr.gesto("saludar", 1.8), narr.hablar(1.8), narr.cara("contenta"));
  yield* narr.cara("normal");
  yield* all(tarjeta().scale(1, 0.5, easeOutBack), narr.gesto("señalarArriba", 2.2), narr.hablar(2.2));
  yield* all(sello().opacity(1, 0.1), sello().scale(1, 0.25, easeOutBack), narr.cara("sorpresa"));
  yield* all(narr.gesto("explicar", 2.4), narr.hablar(2.4), narr.cara("seria"));
  capa().add(est.nodo);
  capa().add(mar.nodo);
  est.nodo.opacity(0);
  mar.nodo.opacity(0);
  est.vivir();
  mar.vivir();
  yield* all(est.nodo.opacity(1, 0.4, easeOutCubic), mar.nodo.opacity(1, 0.4, easeOutCubic), tarjeta().scale(0, 0.4), narr.cara("normal"));
  yield* all(est.gesto("celular", 2.2), est.hablar(1.6), est.cara("sorpresa"), mar.gesto("pensar", 2.2), mar.cara("duda"));
  yield* all(mar.gesto("explicar", 2), mar.hablar(2), mar.cara("normal"), est.cara("normal"));
  yield* all(narr.gesto("festejar", 1.8), est.gesto("festejar", 1.8), mar.gesto("festejar", 1.8), narr.cara("contenta"), est.cara("contenta"), mar.cara("contenta"));
  yield* waitFor(0.8);
});
