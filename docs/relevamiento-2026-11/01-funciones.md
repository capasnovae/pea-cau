# Relevamiento de funciones · noviembre 2026

Rama `etapa-9-recertificacion`. Base: recorrido automático de todas las rutas con cada rol (celular y PC), los 52 tests de punta a punta y la lectura del código. El recorrido no encontró errores de consola, páginas de más de 0,7 s ni desbordes para el asesor (el desborde de Contenido ya se corrigió).

## 1. Inventario por área

| Área | Qué hace hoy | Quién | Estado |
| --- | --- | --- | --- |
| Bienvenida, ingreso, invitación | Acceso por invitación y definición de clave | Todos | Bien. Falta "olvidé mi contraseña" visible y probado de punta a punta |
| Tablero | Saludo, curso en curso, por hacer, equipo | Todos | Funciona, pero no muestra avisos, actualizaciones pendientes ni recertificación por vencer |
| Cursos y lecciones | Niveles y capacitaciones, lecciones con bloques, Probalo, prácticas | Todos | Bien. No hay repaso después de terminar ni búsqueda dentro de los cursos |
| Exámenes | Portada, modo examen, revisión antes de entregar, resultado con "estudiá esto" | Todos | Bien. El resultado no ofrece repasar solo lo que falló |
| Perfil, insignias, certificados | Ruta, insignias, PDF con QR, verificación pública | Todos | Bien. El QR usa la dirección del pedido (hay que fijar el dominio) |
| Avisos y actualizaciones | Campana, lista, actualizaciones con mini examen | Todos | Bien. "Actualizaciones" solo se alcanza desde Avisos: no está en el menú ni en el tablero |
| Calendario y bandeja | Eventos por sede, mensajes y anuncios | Todos | Bien |
| Repositorio y búsqueda | Categorías, artículos con versiones, recursos, campañas, buscador | Todos | Bien. 139 artículos siguen en borrador |
| Organigrama y derivaciones | Dirección, sedes, equipos, áreas de derivación | Todos | La lista de áreas de derivación sigue vacía (pendiente del dueño) |
| Consignas | Tareas y lecturas con recurrencia y evidencia | Todos / líder+ | Bien |
| Equipo · Panel | Asesores, atrasos, tasa por pregunta y categoría, cola, CSV | Líder+ | Solo lista por asesor: sin resumen por equipo, sede o puesto, sin evolución en el tiempo y sin entrar al detalle de un asesor |
| Equipo · Correcciones y Ubicación | Cola con toma de 24 h; habilitar examen de ubicación | Líder+ / coord+ | Bien |
| Contenido | Cursos, módulos, pasos, artículos, recursos, campañas, exámenes, preguntas, casos, actualizaciones | Coord+ / admin | Funciona, pero es lento de usar a escala (ver P1) |
| Admin | Usuarios, sedes, equipos, derivaciones, rutas, certificados | Admin | Bien. Alta de usuarios de a uno |
| Ayuda | Texto fijo | Todos | Mínima |

## 2. Fricciones reales

1. **Armar una lección con Probalo lleva dos pantallas.** La lección se crea en Cursos y sus preguntas en Exámenes → Preguntas, eligiendo ahí la lección. Para 40 lecciones es mucho ida y vuelta.
2. **Los cursos temáticos no están asignados a ningún puesto**, así que al publicarlos no le aparecen a nadie en "Mis cursos" hasta que alguien cargue las rutas.
3. **Publicar una lección exige publicar también su artículo fuente, uno por uno.** Con 139 borradores es inviable a mano.
4. **Los borradores globales solo los ve el admin.** Coordinación no puede revisar el contenido que tiene que validar.
5. **El líder ve el estado de las actualizaciones de su equipo pero no el título.**
6. **El panel no responde "¿cómo viene mi equipo?" de un vistazo:** hay que leer la lista asesor por asesor.
7. **No hay alta masiva de usuarios** (son 7 CAU).
8. **El tablero no avisa lo urgente:** certificación por vencer, actualización pendiente y consigna por vencer viven en pantallas distintas.
9. **Después de aprobar un nivel no hay nada que mantenga el conocimiento** hasta la recertificación, un año después.
10. **Sin instalación como app ni uso sin conexión** en el celular.

## 3. Mejoras priorizadas

**P1 (alto impacto)**
- Editor de lección con el Probalo adentro (crear las preguntas en la misma pantalla). M
- Publicación en lote: publicar un curso con sus lecciones y sus fuentes en un paso, con vista previa. M
- Revisión para coordinación: lectura de borradores globales y un estado "validado por" en cada lección. M
- Tablero con "Para hoy": lo urgente primero (vencimientos, actualizaciones, consignas, repaso). M
- Panel con resumen por equipo, sede y puesto, evolución semanal y detalle del asesor. L
- Asignación de rutas por puesto para los cursos temáticos, con una propuesta inicial. S

**P2**
- Repaso diario espaciado (ver informe de aprendizaje). L
- Alta masiva de usuarios por CSV. M
- "Repasar lo que fallé" desde el resultado de un examen. S
- Actualizaciones y repaso en el menú. S
- Recuperación de contraseña probada de punta a punta. S
- Dominio fijo para el QR de los certificados. S

**P3**
- Instalable en el celular (PWA) con lecciones disponibles sin conexión. M
- Ayuda contextual y recorrido de bienvenida. M
- Búsqueda global que incluya lecciones. S

## 4. Paquetes de trabajo independientes

| Paquete | Qué incluye | Archivos que toca |
| --- | --- | --- |
| F1 Autoría rápida | Probalo dentro del editor de lección; publicación en lote; rutas iniciales | `app/(app)/contenido/cursos/**`, `components/contenido/editor-leccion.tsx`, migración propia |
| F2 Revisión de contenido | Lectura de borradores globales para coordinación; marca "validado" | `supabase/migrations` (políticas), `app/(app)/contenido/**` (solo listados) |
| F3 Tablero "Para hoy" | Urgentes, accesos a actualizaciones y repaso | `app/(app)/inicio/**`, `components/tablero/**`, `lib/dominio/roles.ts` |
| F4 Panel 2.0 | Resumen por equipo, sede y puesto; evolución; detalle del asesor; rendimiento por lotes | `app/(app)/equipo/panel/**`, `lib/panel/**`, `lib/dominio/panel.ts`, migración propia |
| F5 Administración a escala | Alta masiva, paginación de usuarios, recuperación de contraseña | `app/(app)/admin/**`, `app/(auth)/**` |
| F6 App en el celular | PWA, sin conexión | `app/manifest.ts`, service worker, `app/layout.tsx` |

F1 a F5 no comparten archivos entre sí. F3 depende del repaso diario si se quiere mostrar ahí.
