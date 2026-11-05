type Base = { id: string; padre_id: string | null; orden: number; titulo: string };

export type NodoArticulo<T extends Base> = T & { hijos: NodoArticulo<T>[] };

/** Arma el árbol padre → hijos. Los huérfanos (padre no visible) quedan en la raíz. */
export function armarArbol<T extends Base>(filas: T[]): NodoArticulo<T>[] {
  const nodos = new Map<string, NodoArticulo<T>>(filas.map((f) => [f.id, { ...f, hijos: [] }]));
  const raiz: NodoArticulo<T>[] = [];
  nodos.forEach((n) => {
    const padre = n.padre_id ? nodos.get(n.padre_id) : undefined;
    (padre ? padre.hijos : raiz).push(n);
  });
  const ordenar = (lista: NodoArticulo<T>[]) => {
    lista.sort((a, b) => a.orden - b.orden || a.titulo.localeCompare(b.titulo, "es"));
    lista.forEach((n) => ordenar(n.hijos));
  };
  ordenar(raiz);
  return raiz;
}
