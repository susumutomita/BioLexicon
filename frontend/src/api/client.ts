import axios from 'axios';

const API_BASE = '/api/v1';

export const api = axios.create({
  baseURL: API_BASE,
  headers: { 'Content-Type': 'application/json' },
});

// Attach API key and token
api.interceptors.request.use((config) => {
  const apiKey = localStorage.getItem('apiKey') || 'dev-api-key';
  config.headers['X-API-Key'] = apiKey;

  const token = localStorage.getItem('token');
  if (token) {
    config.headers['Authorization'] = `Bearer ${token}`;
  }
  return config;
});
