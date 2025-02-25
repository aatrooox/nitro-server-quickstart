export default defineEventHandler((event) => {
  // 请求日志打印
  console.log(`${new Date().toLocaleString()} - [${event.method}] - ${event.path}`)
})