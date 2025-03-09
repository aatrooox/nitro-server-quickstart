import * as jose from 'jose'
import getWhiteRoutes from '../utils/whiteRoutes'
// 校验有无权限 jwt 
export default defineEventHandler(async (event) => {
  // api/v1 开头的接口需要校验token
  // POST请求需要校验， GET放过
  if (getRequestURL(event).pathname.startsWith('/api/v1') && event.node.req.method !== 'GET') {
    // 排除掉登录和注册
    if (!getWhiteRoutes().includes(getRequestURL(event).pathname)) {
      const { jwtSecret } = useRuntimeConfig(event)
      const token = getCookie(event, 'token')
      if (!token) { 
        // console.log(`无token`, )
        throw createError({
          statusCode: 403,
          message: '请先登录',
        })
      }
      const secret = new TextEncoder().encode(jwtSecret)
      const { payload } = await jose.jwtVerify(token, secret).catch( err => {
        console.log(`jose err`, err)
        throw createError({
          statusCode: 401,
          message: '登录已过期，请重新登录',
        })
      })

       event.context.userId = payload.userId
       event.context.userRole = payload.role

       console.log(`auth0 - ${getRequestURL(event).pathname}`)
      }
    }

  console.log(`public - ${getRequestURL(event).pathname}`)
  } 
)