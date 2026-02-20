import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173,
    proxy: {
      '/api': process.env.API_PROXY_TARGET || 'http://api:3000',
      '/health': process.env.API_PROXY_TARGET || 'http://api:3000',
    },
  },
});
