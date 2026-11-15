import { makeProject } from "@revideo/core";
import muestra from "./escenas/muestra?scene";

export default makeProject({ scenes: [muestra], settings: { shared: { size: { x: 1080, y: 1350 }, background: "#f4efe6" } } });
