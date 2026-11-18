# Despliegue de PEA: Supabase y Vercel

Guía para poner PEA en producción con la cuenta `capasnova@gmail.com`. Se hace una sola vez y lleva alrededor de una hora.

Reglas:

- La contraseña de la base y la clave secreta nunca van por chat ni al repositorio. Guardalas en un gestor de contraseñas.
- `supabase/seed.sql` **no** va a producción: crea usuarios de ejemplo con una contraseña conocida.
- No uses ni toques el proyecto `amapola-tienda`.

> **Estado (2026-11-12):** PEA ya está en producción en **Netlify** (`https://peacapa.netlify.app`) con el proyecto de Supabase `gjmmykkrvtlbsebnhdzr` (São Paulo). Las invitaciones no dependen del mail: el admin genera un link y lo comparte (copiar o WhatsApp). Esta guía queda como referencia para rehacer el despliegue; donde dice Vercel, en Netlify las mismas tres variables van en _Site configuration → Environment variables_.

## 0. Antes de empezar

1. En GitHub, fusioná el pull request de `mejoras-1-repaso-y-diseno` en `main` (capacitacion-nova/PEA#1). Vercel publica lo que está en `main`.
2. En tu computadora: Node.js 20 o más nuevo y Git.

## 1. Crear el proyecto en Supabase

1. Entrá a supabase.com con `capasnova@gmail.com` y creá una organización.
2. **New project**:
   - Nombre: `pea`.
   - Región: **South America (São Paulo)**.
   - Contraseña de la base: usá la que genera Supabase y guardala en el gestor.
   - Plan: el gratuito sirve para probar. Para usarlo con el equipo conviene **Pro**: el gratuito pausa los proyectos inactivos y no tiene copias de seguridad diarias.
3. Cuando termine de crearse, anotá tres datos (ninguno es secreto salvo el último):
   - **Project ref**: Project Settings → General (también aparece en la URL del panel, 20 letras).
   - **Project URL**: botón **Connect** arriba, o Project Settings → Data API. Tiene la forma `https://<ref>.supabase.co`.
   - **Claves**: Project Settings → **API Keys** → pestaña _Publishable and secret API keys_. Copiá la **publishable** (`sb_publishable_…`) y la **secret** (`sb_secret_…`). La secreta es la que va al gestor.

## 2. Cargar la base desde tu computadora

En una terminal, dentro de la carpeta del proyecto:

```bash
git clone https://github.com/capacitacion-nova/PEA.git pea && cd pea
```

```bash
npm ci
```

```bash
npx supabase login
```

Se abre el navegador: entrá con la cuenta nueva.

```bash
npx supabase link --project-ref TU_PROJECT_REF
```

Con el proyecto vinculado, subí el esquema (todas las migraciones). Si la herramienta te pide la contraseña de la base, es la que guardaste en el paso 1:

```bash
npx supabase db push --remote
```

Y cargá los datos de la organización y el contenido relevado, en este orden:

```bash
npx supabase db query --remote -f supabase/datos-base.sql
```

```bash
npx supabase db query --remote -f supabase/seed-relevamiento.sql
```

```bash
npx supabase db query --remote -f supabase/seed-lecciones.sql
```

Cada uno pide confirmar porque escribe en un proyecto alojado; los tres se pueden volver a correr sin duplicar nada. Comprobá que quedó todo:

```bash
npx supabase db query --remote --read-only "select (select count(*) from public.sedes) as sedes, (select count(*) from public.articulos) as articulos, (select count(*) from public.items where tipo = 'leccion') as lecciones"
```

Tiene que dar 7 sedes, 139 artículos y 40 lecciones. Todo el contenido queda en **borrador** y "A validar" hasta que coordinación lo publique.

## 3. Configurar el acceso (Authentication)

En el panel de Supabase:

1. **Authentication → Sign In / Providers**: desactivá _Allow new users to sign up_. En PEA solo se entra por invitación. Dejá activo el proveedor **Email**.
2. **Authentication → URL Configuration** (completalo cuando tengas la dirección de Vercel, paso 5):
   - **Site URL**: `https://TU-DOMINIO` (por ejemplo `https://pea.vercel.app`).
   - **Redirect URLs**: agregá `https://TU-DOMINIO/auth/confirm`.
3. **Authentication → Emails → Templates**:
   - _Invite user_: asunto `Te invitaron a PEA`; cuerpo: copiá el contenido de `supabase/templates/invitacion.html`.
   - _Reset password_: asunto `Recuperá tu contraseña de PEA`; cuerpo: `supabase/templates/recuperacion.html`.
4. **Authentication → Emails → SMTP Settings**: configurá un servidor de correo propio. El de Supabase solo manda unos pocos mails por hora y a miembros de la organización, así que sin esto las invitaciones no llegan. Sirve cualquier proveedor (Resend, Brevo, o Gmail con una contraseña de aplicación).

## 4. Comprobar la tarea diaria

**Integrations → Cron**: tiene que figurar el trabajo `pea-diario` (corre todos los días a las 03:10 UTC; vence consignas, recertificaciones y manda avisos). Lo crean las migraciones; no hay que hacer nada más.

## 5. Publicar en Vercel

1. Entrá a vercel.com con la cuenta de GitHub `capacitacion-nova`. Para una herramienta de trabajo del equipo, Vercel pide el plan **Pro**; el Hobby es para uso personal.
2. **Add New → Project** → importá `capacitacion-nova/PEA`. Vercel detecta Next.js solo.
3. En **Environment Variables**, cargá las tres (para _Production_):

   | Nombre                                 | Valor              | Notas                                                                          |
   | -------------------------------------- | ------------------ | ------------------------------------------------------------------------------ |
   | `NEXT_PUBLIC_SUPABASE_URL`             | La Project URL     | Pública                                                                        |
   | `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY` | `sb_publishable_…` | Pública                                                                        |
   | `SUPABASE_SECRET_KEY`                  | `sb_secret_…`      | **Secreta**. Sin `NEXT_PUBLIC_`: solo la usa el servidor para invitar usuarios |

4. **Deploy**. Las funciones corren en São Paulo, al lado de la base (`vercel.json`).
5. Si vas a usar un dominio propio: Project Settings → **Domains**. Después volvé al paso 3.2 y poné esa dirección en Supabase.

## 6. Crear el primer admin

Con las invitaciones por link, el primer admin también puede crearse generando un link de invitación con la API de administración (así se hizo en producción). El camino manual sigue siendo este:

La pantalla de invitaciones solo la ve un admin, así que el primero se crea a mano:

1. Supabase → **Authentication → Users → Add user → Send invitation** a tu mail.
2. **SQL Editor**, con tu mail:

   ```sql
   update public.perfiles set rol = 'admin', activo = true where email = 'tu-mail@ejemplo.com';
   ```

3. Abrí el mail de invitación, definí tu contraseña y entrá. Desde **Admin → Usuarios → Invitar** sumás al resto con su sede, área y puesto.

## 7. Revisión final

- [ ] Ingresar con el admin y ver el tablero.
- [ ] Invitar a una persona de prueba y comprobar que le llega el mail y puede definir su contraseña.
- [ ] "¿Te olvidaste la contraseña?" manda el mail de recuperación.
- [ ] Abrir `https://TU-DOMINIO/verificar` sin sesión.
- [ ] Verificación en dos pasos activada en GitHub, Supabase y Vercel.
- [ ] Copias de seguridad diarias (plan Pro de Supabase) y una prueba de restauración.

## Después de publicar

- Coordinación revisa y publica los cursos y sus artículos fuente (hoy todo está en borrador).
- El admin asigna las rutas por puesto en **Admin → Rutas**, así los cursos aparecen en "Mis cursos".
- Para subir cambios futuros a la base: `npx supabase db push --remote` desde `main`.
