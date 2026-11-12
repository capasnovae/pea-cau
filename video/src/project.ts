import { makeProject } from "@revideo/core";
import leccion from "./escenas/leccion?scene";

// Formato 4:5: se ve bien en el celular sin ocupar toda la pantalla de la lección.
export default makeProject({
  scenes: [leccion],
  variables: { titulo: "Lección", guion: [] },
  settings: { shared: { size: { x: 1080, y: 1350 }, background: "#1e1b4b" } },
});
