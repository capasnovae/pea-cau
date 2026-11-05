import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // Los tests E2E y el desarrollo local entran por 127.0.0.1.
  allowedDevOrigins: ["127.0.0.1"],
  // Subida de recursos: hasta 50 MB por archivo (límite del bucket) + margen del multipart.
  experimental: { serverActions: { bodySizeLimit: "51mb" } },
  turbopack: {
    rules: {
      "*.css": {
        loaders: ["@tailwindcss/turbopack"],
        as: "*.css",
      },
    },
  },
};

export default nextConfig;
