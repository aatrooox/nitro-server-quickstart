//https://nitro.unjs.io/config
export default defineNitroConfig({
  srcDir: "server",
  compatibilityDate: "2025-02-25",
  runtimeConfig: {
    jwtSecret: 'your_secret_key',
  },
  imports: {
    presets: [
      {
        from: 'zod',
        imports: ['z']
      },
      {
        from: 'h3-zod',
        imports: ['useSafeValidatedQuery', 'useSafeValidatedBody', 'useValidatedParams', 'zh']
      }
    ]
  },
  storage: {
    redis: {
      driver: 'redis',
      host: 'localhost',
      db: 1, // TODO 和其他服务 区分开
      tls: false,
      port: 6379,
    }
  },
});