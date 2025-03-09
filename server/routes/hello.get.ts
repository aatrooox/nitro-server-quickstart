import { useSafeValidatedQuery, z } from "h3-zod";
export default defineEventHandler(async (event) => {
  const query = useSafeValidatedQuery(event, {
    id: z.string().optional().default('123'),
  });
  const users = await prisma.user.findFirst();
  console.log(`users`, users)
  return users || {}
});
