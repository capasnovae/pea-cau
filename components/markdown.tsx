import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";

/** Render seguro de Markdown: sin HTML crudo; los links externos abren en otra pestaña. */
export function Markdown({ texto }: { texto: string }) {
  return (
    <div className="markdown text-[15px] leading-relaxed">
      <ReactMarkdown
        remarkPlugins={[remarkGfm]}
        components={{
          a: ({ href, children }) => {
            const externo = href?.startsWith("http");
            return (
              <a
                href={href}
                className="text-primary underline underline-offset-2"
                {...(externo ? { target: "_blank", rel: "noopener noreferrer" } : {})}
              >
                {children}
              </a>
            );
          },
        }}
      >
        {texto}
      </ReactMarkdown>
    </div>
  );
}
