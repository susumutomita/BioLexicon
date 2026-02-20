import { api } from './client';

export interface AuthUser {
  id: number;
  email: string;
  api_key?: string;
}

export async function register(email: string, password: string) {
  const res = await api.post<{ user: AuthUser }>('/auth/register', { email, password });
  return res.data.user;
}

export async function login(email: string, password: string) {
  const res = await api.post<{ token: string; user: AuthUser }>('/auth/login', { email, password });
  return res.data;
}
