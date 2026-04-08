import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // Enable static HTML export for GitHub Pages deployment
  output: "export",
  // Disable server-side image optimization (not supported in static export)
  images: {
    unoptimized: true,
  },
};

export default nextConfig;
