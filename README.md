# 服务层

## 功能

- Prisma 
  - 自带 User/OAuth Model
- Mysql
  - 8.0 见 [教程](https://blog.zzao.club/post/nuxt/local-init-mysql-by-docker)
- Redis
  - 7.0 见  [教程](https://blog.zzao.club/post/nuxt/local-init-mysql-by-docker)
- 登录注册
  - 用户名密码注册
  - 用户名密码登录
- 参数校验
  - 基于 zod, h3-zod
- 权限校验
  - middleware/1.auth0.ts
- Cookie
  - 见 api/v1/user/login.post.ts
- Gitea Actions
- PM2 

## 开发环境

1. 配置 mysql 链接
2. redis 默认链接 localhost:6379, 不需要配置
3. 根据根目录下的 docker.compose.example.yml, [本地启动 Mysql 和 Redis 服务](https://blog.zzao.club/post/nuxt/local-init-mysql-by-docker)

```
copy -p ./.env.example ./.env
```

## 生成环境（gitea）

1. gitea 开启 actions
2. 配置 action 下的密钥（SECRETS）
- DATABASE_URL
- FEISHU_WEBHOOK

