/// <reference types="@revideo/core/project" />
// Las escenas se importan con "?scene" (lo resuelve el plugin de Vite de Revideo)
declare module "*?scene" {
  const escena: import("@revideo/core").FullSceneDescription;
  export default escena;
}
