import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import { tipoCaja } from "@/lib/dominio/leccion";

function textoPlano(nodo: unknown): string {
  if (typeof nodo === "string") return nodo;
  if (Array.isArray(nodo)) return nodo.map(textoPlano).join("");
  if (nodo && typeof nodo === "object" && "props" in nodo) return textoPlano((nodo as { props: { children?: unknown } }).props.children);
  return "";
}

/** Markdown de lección: cajas "Error común"/"Tip", capturas con marco y placeholder si la imagen no está disponible. */
export function ContenidoLeccion({ texto }: { texto: string }) {
  return (
    <div className="markdown text-[16px] leading-relaxed">
      <ReactMarkdown
        remarkPlugins={[remarkGfm]}
        components={{
          a: ({ href, children }) => (
            <a href={href} className="font-semibold text-primary-strong underline underline-offset-2"
              {...(href?.startsWith("http") ? { target: "_blank", rel: "noopener noreferrer" } : {})}>
              {children}
            </a>
          ),
          blockquote: ({ children }) => {
            const tipo = tipoCaja(textoPlano(children));
            const estilo =
              tipo === "error" ? "border-warning/40 bg-warning-soft text-[#7c2d12]"
              : tipo === "tip" ? "border-success/40 bg-success-soft text-[#064e3b]"
              : "border-border bg-background text-muted";
            return <aside className={`rounded-2xl border p-4 not-italic ${estilo}`}>{children}</aside>;
          },
          img: ({ src, alt }) => {
            if (!src || src === "#imagen-no-disponible") {
              return (
                <span role="img" aria-label={alt || "Imagen no disponible"}
                  className="flex h-40 items-center justify-center rounded-2xl border border-dashed border-border bg-background text-sm text-muted">
                  Imagen no disponible
                </span>
              );
            }
            // eslint-disable-next-line @next/next/no-img-element
            return <img src={String(src)} alt={alt ?? ""} className="w-full rounded-2xl border border-border shadow-[var(--shadow-suave)]" loading="lazy" />;
          },
        }}
      >
        {texto}
      </ReactMarkdown>
    </div>
  );
}
