import Link from "next/link";

/** Acceso a los avisos con el contador de no leídos. */
export function Campana({ sinLeer }: { sinLeer: number }) {
  return (
    <Link
      href="/avisos"
      aria-label={sinLeer > 0 ? `Avisos: ${sinLeer} sin leer` : "Avisos"}
      className="relative flex size-11 items-center justify-center rounded-full text-ink transition-colors hover:bg-primary-soft"
    >
      <svg
        width="22"
        height="22"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        strokeWidth="2"
        aria-hidden
      >
        <path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9M10.3 21a1.94 1.94 0 0 0 3.4 0" />
      </svg>
      {sinLeer > 0 && (
        <span
          key={sinLeer}
          className="animate-pop absolute right-0 top-0 min-w-5 rounded-full bg-gold px-1 text-center text-[10px] font-extrabold leading-5 text-ink"
        >
          {sinLeer > 99 ? "99+" : sinLeer}
        </span>
      )}
    </Link>
  );
}
