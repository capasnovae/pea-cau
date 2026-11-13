import { makeProject } from "@revideo/core";
import personajes from "./escenas/personajes?scene";

// Videos con personajes (lecciones que tienen guion en video/guiones). Mismo formato 4:5 que los demás.
export default makeProject({
  scenes: [personajes],
  variables: { planos: [], titulo: "Lección", bajada: "", total: 1 },
  settings: { shared: { size: { x: 1080, y: 1350 }, background: "#1e1b4b" } },
});
