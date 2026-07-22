import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],

  server: {
    port: 5180,
    proxy: {
      "/v1": "http://localhost:3080",
    },
  },

  build: {
    // Target modern browsers — admin is internal tooling, not public-facing.
    target: "es2020",
    // Warn if any chunk exceeds 800 KB.
    chunkSizeWarningLimit: 800,
    rollupOptions: {
      output: {
        // Split vendor code into a separate long-cached chunk.
        manualChunks: {
          vendor: ["react", "react-dom", "react-router-dom"],
        },
        // Fingerprinted filenames for cache busting.
        entryFileNames: "assets/[name]-[hash].js",
        chunkFileNames: "assets/[name]-[hash].js",
        assetFileNames: "assets/[name]-[hash].[ext]",
      },
    },
    // Generate source maps for production error tracking (Sentry etc.).
    sourcemap: true,
  },

  // Expose VITE_API_BASE as the configurable API base URL.
  // Set via --build arg in Dockerfile: VITE_API_BASE=https://api.moozhayil.com
  envPrefix: "VITE_",
});
