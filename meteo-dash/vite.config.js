import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],

  preview: {
    port: 5000,
  },
// for dev
  server: {
    port: 5000,
  },
})