import { useSafeValidatedQuery, z } from "h3-zod";
import prisma from "~~/lib/prisma";
export default defineEventHandler(async (event) => {
  // const query = useSafeValidatedQuery(event, {
  //   id: z.string(),
  // });
  const users = await prisma.user.findFirst();
  console.log(`users`, users)
  return users || {}
});
