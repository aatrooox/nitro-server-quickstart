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

## 本地开发
0. 修改 `package.json` 中的 `name`, `version`, `description等信息`
1. 配置 DATABASE_URL(mysql)，redis 默认链接 `localhost:6379`, 不需要配置
```
copy -p ./.env.example ./.env
```
2. 根据根目录下的 `docker.compose.example.yml`, [本地启动 Mysql 和 Redis 服务](https://blog.zzao.club/post/nuxt/local-init-mysql-by-docker)

3. 初始化 `Prisma` / 数据库

```bash
# 从头建表, 会提示重置你的数据库数据和表结构
npx prisma migrate dev
# 已经有数据库，根据现有表结构创建 schame
npx prisma db pull
# 已经有 schame，也会重置数据
npx prisma db push
```

4. 运行服务
```
pnpm dev
```
打开 http://localhost:5770/ 可以看到 

```bash
zzclub base server (template) is running ...
```


## 生成环境（gitea）

默认使用 Gitea 自动化部署，具体见 `.gitea/workflows/build.yaml`
1. gitea 需要开启 actions
2. 配置 action 下的密钥（SECRETS）
- DATABASE_URL
- FEISHU_WEBHOOK

