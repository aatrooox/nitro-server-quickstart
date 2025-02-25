module.exports = {
  apps: [
    {
      name: 'base-server',
      port: '5770',
      exec_mode: 'fork',
      script: './server/index.mjs',
    }
  ]
}
