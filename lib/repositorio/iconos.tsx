const PATHS: Record<string, string> = {
  pagina: "M6 3h9l3 3v15H6zM9 9h6M9 13h6M9 17h4",
  articulo: "M4 5h11a3 3 0 0 1 3 3v11H7a3 3 0 0 1-3-3zM8 9h6M8 13h6",
  video: "M4 6h12v12H4zM16 10l4-2v8l-4-2",
  recurso: "M12 4v10m0 0-4-4m4 4 4-4M5 18h14",
  enlace: "M10 14a4 4 0 0 0 5.6 0l3-3a4 4 0 0 0-5.6-5.6l-1 1M14 10a4 4 0 0 0-5.6 0l-3 3a4 4 0 0 0 5.6 5.6l1-1",
  examen: "M9 11l3 3 7-7M5 5h9M5 12h3M5 19h14",
};

export function IconoItem({ tipo, className }: { tipo: string; className?: string }) {
  return (
    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" className={className}>
      <path d={PATHS[tipo] ?? PATHS.pagina} />
    </svg>
  );
}
