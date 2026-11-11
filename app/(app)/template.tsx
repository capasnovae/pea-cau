/** Cada pantalla entra con un fundido corto (solo opacidad: no mueve nada ni rompe elementos fijos). */
export default function PlantillaApp({ children }: { children: React.ReactNode }) {
  return <div className="animate-aparecer">{children}</div>;
}
