import { cn } from "@/lib/utils/cn";
import type { HTMLAttributes } from "react";

/** `interactiva`: se eleva al pasar el cursor y cede al presionar (para tarjetas que son un enlace). */
export function Card({
  className,
  interactiva,
  ...props
}: HTMLAttributes<HTMLDivElement> & { interactiva?: boolean }) {
  return (
    <div
      className={cn(
        "rounded-tarjeta border border-transparent bg-card p-5 shadow-1",
        interactiva && "transition hover:-translate-y-0.5 hover:shadow-2 active:scale-[0.99]",
        className,
      )}
      {...props}
    />
  );
}

export function CardTitle({ className, ...props }: HTMLAttributes<HTMLHeadingElement>) {
  return <h1 className={cn("text-h2", className)} {...props} />;
}
