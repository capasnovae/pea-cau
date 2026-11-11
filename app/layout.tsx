import type { Metadata, Viewport } from "next";
import { Plus_Jakarta_Sans } from "next/font/google";
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

export const viewport: Viewport = { width: "device-width", initialScale: 1, themeColor: "#1e1b4b" };

export default function RootLayout({ children }: LayoutProps<"/">) {
  return (
    <html lang="es-AR" className={`${fuente.variable} h-full antialiased`}>
      <body className="flex min-h-full flex-col">{children}</body>
    </html>
  );
}
