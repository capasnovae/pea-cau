# Plan · Cierre del diseño y preparación del despliegue

Rama `mejoras-1-repaso-y-diseno` (PR capacitacion-nova/PEA#1). Fecha: 2026-11-12.

Objetivo: dejar la app lista para subir a Supabase y Vercel, y cerrar los paquetes de diseño P1–P7 de `docs/relevamiento-2026-11/03-diseno.md`.

## R · Despliegue

| #   | Tarea                                                                                                         | Por qué                                                                                                              | Prueba                                                                  |
| --- | ------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| R1  | `supabase/datos-base.sql` con las 7 sedes, los puestos y los subroles; sale de `seed.sql`                     | Hoy solo existen en el seed de desarrollo, que **no** va a producción: sin esto no se puede invitar a nadie con sede | `db reset` + pgTAP + E2E siguen verdes                                  |
| R2  | `docs/despliegue.md`: paso a paso de Supabase y Vercel                                                        | El dueño crea las cuentas; tiene que poder hacerlo solo                                                              | Revisión contra la CLI 3.0 (`db push --remote`, `db query --remote -f`) |
| R3  | Corregir el informe de seguridad: la clave secreta **sí** se usa (solo en el servidor, para invitar usuarios) | El informe decía lo contrario                                                                                        | —                                                                       |

## D · Diseño

| #   | Tarea                                                                                                                       | Paquete    | Prueba                                                 |
| --- | --------------------------------------------------------------------------------------------------------------------------- | ---------- | ------------------------------------------------------ |
| D1  | Glifos de texto (`← ‹ → ✓ × ★ ↑ ↓`, 40 usos) → `Icono`                                                                      | Convención | grep = 0 fuera de textos                               |
| D2  | `text-white` / `bg-white` / hex sueltos → tokens (`--sobre-color`, `card`)                                                  | P7         | grep = 0 fuera de `components/ui` y la marca           |
| D3  | Modo oscuro: tokens oscuros, sigue al sistema y se elige en el perfil (Sistema / Claro / Oscuro) sin parpadeo               | P7         | Unitaria de contraste de tokens (claro y oscuro) + E2E |
| D4  | Barra lateral ancha con etiquetas a partir de 1280 px                                                                       | P1         | Captura y E2E de navegación                            |
| D5  | Portada del examen: jerarquía de datos y botón con ancho acotado                                                            | P3         | E2E de exámenes                                        |
| D6  | Sendero N1→N4 en el perfil: el tramo hasta el nivel actual se dibuja                                                        | P4         | Captura                                                |
| D7  | "Qué hace cada puesto" pasa del organigrama a Ayuda                                                                         | P5         | E2E de organigrama                                     |
| D8  | Contenido: buscador por título                                                                                              | P6         | E2E                                                    |
| D9  | `e2e/diseno.spec.ts`: sin desborde a 360 px, objetivos táctiles de la navegación ≥ 44 px, movimiento reducido y tema oscuro | P7         | —                                                      |

Fuera de este plan (quedan anotados): arrastre para ordenar en el editor, `Select` propio en lugar del nativo, tablas densas de gestión, evolución semanal del panel.

## Orden

R1 → R3 → D1 → D2 → D3 → D4 → D5 → D6 → D7 → D8 → D9 → R2 (la guía al final, con todo lo que cambió) → suite completa → revisión → push.
