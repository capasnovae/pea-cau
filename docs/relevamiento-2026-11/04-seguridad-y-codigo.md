# Relevamiento de seguridad y código · noviembre 2026

Rama `etapa-9-recertificacion`. Pruebas hechas contra la base local y la app corriendo, con sesiones reales de asesor, líder y admin por la API (PostgREST) y por la web.

## 1. Resultado

**Sin hallazgos críticos ni altos de seguridad.** Como asesor no se pudo leer datos ajenos, escalar de rol, fabricar certificados ni ver respuestas de exámenes. Los problemas reales eran de robustez a largo plazo y de endurecimiento; los cinco primeros de la tabla ya están corregidos en esta misma rama.

## 2. Qué se probó y cómo salió

| Área | Prueba | Resultado |
| --- | --- | --- |
| RLS | Las 42 tablas tienen RLS activado | Bien |
| Funciones | 154 funciones; todas las `security definer` fijan `search_path`; las internas (`aplicar_efectos`, `job_diario`, `crear_alerta`, etc.) no las ejecuta un usuario | Bien |
| Lectura como asesor | `opciones.es_correcta`, `preguntas.solucion/explicacion/rubrica`, intentos, respuestas, certificaciones, alertas, auditoría, progreso y prácticas ajenas, artículos y cursos en borrador | Todo vacío |
| Escritura como asesor | Cambiarse el rol o la sede, insertar certificaciones, insignias, alertas o intentos aprobados, editar un artículo publicado, marcar hecho un paso con Probalo | Todo rechazado |
| RPC como asesor | `revocar_certificacion`, `habilitar_ubicacion`, `publicar_actualizacion` | "sin permiso" |
| Exámenes | `preguntas_intento` no trae respuestas ni soluciones; `revision_intento` antes de cerrar falla; responder una pregunta fuera del sorteo falla; un segundo inicio devuelve el mismo intento; el intento de otro usuario no se puede leer ni entregar | Bien |
| Markdown | `react-markdown` sin HTML crudo; no hay `dangerouslySetInnerHTML` | Bien |
| Filtros | El texto de búsqueda que entra a `.or()` se limpia de comas, paréntesis y comodines | Bien |
| Redirecciones | `/auth/confirm` y `/salir` redirigen solo a rutas fijas | Bien |
| Secretos | No se usa la clave `service_role`; solo hay variables públicas (URL y clave publicable); `.env.local` no está en el repositorio | Bien |
| Dependencias | `npm audit --omit=dev`: 0 vulnerabilidades | Bien |

## 3. Hallazgos y estado

| # | Severidad | Hallazgo | Estado |
| --- | --- | --- | --- |
| 1 | Alto (robustez) | Borrar un curso borraba en cascada sus certificaciones (la verificación pública dejaba de encontrar el certificado). Borrar un examen borraba todos los intentos. | **Corregido**: las claves pasan a `on delete restrict` (migración `20261114000100_robustez.sql`, pgTAP 44). Se archiva, no se borra. |
| 2 | Medio (rendimiento) | 73 claves foráneas sin índice (`intentos.examen_id`, `respuestas.pregunta_id`, `certificaciones.curso_id`, `items.articulo_id`, etc.). Con volumen, los joins, las políticas y los borrados recorren tablas enteras. | **Corregido**: índice para cada clave foránea sin índice. |
| 3 | Medio | Sin cabeceras de seguridad (clickjacking, sniffing de tipo, referrer). | **Corregido** en `next.config.ts`: `X-Frame-Options`, `nosniff`, `Referrer-Policy`, `Permissions-Policy`, HSTS y CSP acotada (`frame-ancestors`, `base-uri`, `form-action`, `object-src`). E2E. |
| 4 | Medio | Sin páginas de error propias: el 404 salía en inglés ("This page could not be found") y un error mostraba la pantalla de Next. | **Corregido**: `not-found.tsx` y `error.tsx` en castellano, con salida al inicio. E2E. |
| 5 | Bajo | `anon` tenía todos los permisos de tabla sobre bandeja, eventos y favoritos (frenado solo por RLS) y `authenticated` tenía `TRUNCATE` en 43 tablas. No explotable por la API, pero innecesario. | **Corregido**: `anon` sin permisos de tabla, nadie con `TRUNCATE`, y los permisos por defecto para tablas nuevas también. |
| 6 | Bajo | `/salir` cierra la sesión con un GET: un enlace o una imagen en otro sitio puede desloguear a un usuario. | Pendiente (paquete de endurecimiento). |
| 7 | Bajo | `entregar_vencidos()` lo puede llamar cualquier usuario. Solo entrega intentos que ya vencieron, así que no da ventaja. | Aceptado. |
| 8 | Bajo | 29 funciones de trigger y auxiliares puras son ejecutables por `anon`. Las de trigger no se pueden invocar por la API. | Pendiente (limpieza). |
| 9 | Medio (error funcional, encontrado al verificar) | El Probalo de los cursos temáticos fallaba con "Revisá la respuesta": el importador generaba ids que no eran UUID válidos. | **Corregido** (commit anterior), con E2E. |

## 4. Riesgos a largo plazo que quedan

| Riesgo | Por qué importa | Arreglo propuesto | Tamaño |
| --- | --- | --- | --- |
| `panel_asesores` calcula la ruta de cada asesor por separado | Con cientos de asesores el panel va a tardar varios segundos | Calcular el avance en una sola consulta por lotes, o guardar un resumen diario | M |
| El job diario corre en una sola transacción | Un error en un bloque frena los demás (consignas, vencimientos, avisos) | Un bloque `begin … exception` por paso y registrar el error | S |
| Listas sin paginar | Usuarios, exámenes, preguntas, repositorio y panel traen todo | Paginar como se hizo en Contenido | M |
| Borrar un paso o un módulo borra el progreso de ese paso | Un editor puede bajar el avance de todos sin querer | Confirmación con conteo de afectados, o archivar pasos | S |
| No hay registro de quién cambió qué en cursos, preguntas y exámenes | Difícil rastrear un cambio que rompió un examen | Auditoría por trigger en contenido | M |
| La CSP todavía no restringe scripts | Protección parcial ante un XSS futuro | CSP con nonce cuando se defina el dominio | M |
| Sin límite de pedidos en `/verificar` y en el login | Fuerza bruta de códigos o contraseñas | Límite en Vercel o en Supabase Auth al desplegar | S |

## 5. Lista para producción (antes de abrir a usuarios)

A cargo del dueño del proyecto:
- [ ] Crear el proyecto en Supabase (São Paulo) y guardar la contraseña de la base.
- [ ] Verificación en dos pasos en GitHub, Supabase y Vercel.
- [ ] Definir el dominio del sitio.

A cargo de la implementación al desplegar:
- [ ] Subir **solo las migraciones**. Los seeds (`seed.sql`, `seed-relevamiento.sql`, `seed-lecciones.sql`) crean usuarios de ejemplo con contraseña conocida y **no** van a producción; el contenido relevado se carga aparte.
- [ ] Crear el primer admin por invitación.
- [ ] Supabase Auth: URL del sitio y URLs de redirección, desactivar el registro abierto, SMTP propio, límite de intentos de login.
- [ ] Activar `pg_cron` y comprobar que el job `pea-diario` quedó programado.
- [ ] Copias de seguridad diarias y una prueba de restauración.
- [ ] Variables en Vercel: URL y clave publicable de Supabase. Ninguna clave de servicio.

## 6. Paquetes de trabajo

- **S1 Endurecimiento (S):** `/salir` por POST, quitar ejecución a `anon` en funciones de trigger, límite de pedidos.
- **S2 Rendimiento del panel (M):** `panel_asesores` por lotes y paginación del panel.
- **S3 Job diario resistente (S):** bloques independientes y registro de errores.
- **S4 Paginación general (M):** usuarios, exámenes, preguntas, repositorio.
- **S5 Auditoría de contenido (M):** triggers sobre cursos, módulos, pasos, preguntas y exámenes.
