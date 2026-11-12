import { cn } from "@/lib/utils/cn";
import type { InputHTMLAttributes, SelectHTMLAttributes } from "react";

const base =
  "h-11 w-full rounded-campo border border-border-control bg-card px-3 text-base transition-colors placeholder:text-subtle focus-visible:border-primary focus-visible:outline-0 focus-visible:ring-3 focus-visible:ring-primary/25 aria-invalid:border-destructive";

export function Input({ className, ...props }: InputHTMLAttributes<HTMLInputElement>) {
  return <input className={cn(base, className)} {...props} />;
}

export function Select({ className, ...props }: SelectHTMLAttributes<HTMLSelectElement>) {
  return <select className={cn(base, className)} {...props} />;
}
