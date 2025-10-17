import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  root: 'frontend',
  build: {
    outDir: '../public/vite-assets', // Output built files to a folder Rails can serve
    emptyOutDir: true,
    manifest: true,
    rollupOptions: {
      input: './src/main.jsx', // Your main entry file
    }
  },
  server: {
    port: 3000, // or any port you choose
  }
})
