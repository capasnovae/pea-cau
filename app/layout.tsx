import type { Metadata, Viewport } from "next";
import { cookies } from "next/headers";
import { Plus_Jakarta_Sans } from "next/font/google";
import { COOKIE_TEMA, temaDesdeCookie } from "@/lib/dominio/tema";
import "./globals.css";

// Autoalojada por next/font: sin pedidos a Google desde el navegador ni salto de letra al cargar
const fuente = Plus_Jakarta_Sans({
  subsets: ["latin"],
  weight: ["400", "500", "600", "700", "800"],
  variable: "--fuente",
  display: "swap",
});

export const metadata: Metadata = {
  title: "PEA · Perfil Evolutivo de Asesor",
  description: "Capacitación y base de conocimiento para asesores de los CAU",
};

export const viewport: Viewport = {
  width: "device-width",
  initialScale: 1,
  themeColor: [
    { media: "(prefers-color-scheme: light)", color: "#1e1b4b" },
    { media: "(prefers-color-scheme: dark)", color: "#0b0b16" },
  ],
};

export default async function RootLayout({ children }: LayoutProps<"/">) {
  // El tema elegido en el perfil se aplica acá, en el servidor; "sistema" deja que mande el dispositivo
  const tema = temaDesdeCookie((await cookies()).get(COOKIE_TEMA)?.value);
  return (
    <html
      lang="es-AR"
      className={`${fuente.variable} h-full antialiased`}
      data-theme={tema === "oscuro" ? "dark" : tema === "claro" ? "light" : undefined}
    >
      <body className="flex min-h-full flex-col">{children}</body>
    </html>
  );
}
