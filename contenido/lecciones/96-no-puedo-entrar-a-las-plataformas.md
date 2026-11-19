---
titulo: "No puedo entrar a las plataformas: validaciones antes de derivar"
curso: "plataformas"
modulo: "Portal y aula"
orden: 96
fuente: "kb-07-incidencias-en-plataformas"
formato: "tarjetas"
---

## caso

persona: Emilia
canal: whatsapp
Estoy de viaje y no puedo entrar a Canvas: me dice "No tienes permiso para acceder a este recurso". Probé recuperar la contraseña y no me llega el mail.

## preguntar

- [x] ¿Le pasa en una plataforma o en todas?
  > Si es en todas, puede ser una caída general.
- [x] ¿Qué mensaje de error ve?
  > "No tienes permiso..." aparece por inicios de sesión desde distintos lugares.
- [x] ¿El correo personal registrado es correcto y está activo?
  > El recupero llega a ese correo.
- [ ] ¿A dónde viajó?
  > Solo importa que inició sesión desde otro lugar.

## idea: Validaciones previas

Con un solo usuario y contraseña entra al Portal, Canvas y Klarway. Primero impersonás desde SGU y en Perfil verificás el correo institucional: si figura un "-", migrás con el botón Migrar (no se deriva). Después ves si falla una plataforma o todas: ante una caída masiva no se deriva, se espera. Klarway y el empadronamiento van a Sistema Q, no a SITA.

clave: Correo institucional migrado, alcance del problema y Klarway a Sistema Q.
ejemplo: El perfil de Emilia muestra su correo institucional: está migrada.

## probalo 1

## idea: Recuperar la contraseña

El recupero siempre lo hace el estudiante, desde el recupero institucional; no se deriva. Si no le llega el correo, revisás que el correo personal sea correcto y esté activo; con su consentimiento, podés cambiarlo por otro. Que pruebe en incógnito, borre caché y cookies, o use una computadora si probó desde la App. "No tienes permiso para acceder a este recurso" lo genera Microsoft por inicios desde distintos lugares: se resuelve restableciendo la contraseña.

clave: El recupero lo hace el estudiante; "No tienes permiso" se resuelve restableciendo.

## probalo 2

## idea: Reglas de contraseña y derivación

La contraseña tiene de 8 a 256 caracteres, con 3 de 4 tipos (mayúsculas, minúsculas, números, especiales) y sin el nombre ni el correo. Con 10 intentos fallidos en menos de 60 segundos se bloquea un minuto. Si después de todo sigue sin entrar, derivás "Error Plataformas" con plataforma, descripción, validaciones, DNI, legajo y captura obligatoria.

clave: 10 intentos fallidos bloquean; derivación con captura obligatoria.

## cierre

A Emilia le explicás que ese mensaje aparece por iniciar sesión desde otro lugar y que se resuelve restableciendo la contraseña. Como no le llega el correo, revisan juntas que su correo personal esté bien; con su permiso, lo cambiás por otro y repite el recupero, en una ventana de incógnito.

recordar: Validar migración, alcance y recupero antes de "Error Plataformas".

## Probalo

### unica: Un estudiante no puede entrar a Klarway. ¿Cómo se deriva?

- [ ] "Error Plataformas" a SITA.
  > SITA no interviene en Klarway.
- [x] Con la tipificación correspondiente de Sistema Q.
  > Klarway va por Sistema Q.
- [ ] No se deriva nunca.
  > Se deriva por el circuito de Klarway.

> Los problemas de Klarway se derivan por Sistema Q, no a SITA.

### unica: El perfil del estudiante muestra "-" en el correo institucional. ¿Qué hacés?

- [ ] Derivás a SITA.
  > La migración no se deriva.
- [x] Lo migrás con el botón Migrar.
  > Es una migración manual desde el Portal.
- [ ] Le pedís que espere.
  > Lo podés resolver en el momento.

> Si el correo institucional figura con "-", se migra con el botón Migrar.

### vf: Si el estudiante no puede recuperar la contraseña, el asesor la restablece por él.

- [ ] Verdadero
- [x] Falso

> El recupero siempre lo hace el estudiante desde el recupero institucional.
