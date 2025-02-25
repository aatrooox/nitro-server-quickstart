export default defineNitroPlugin((nitro) => {
  nitro.hooks.hook("error", async (error, { event }) => {
    console.error(`${new Date().toLocaleString()} - [${event.method}] - ${event.path} - ERROR:`, error)
  });
})