import { connectDB } from "../db/database";

export async function getAllBlogEntries() {
  const db = await connectDB();
  const entries = await db.all("SELECT * FROM blog_entries");
  return entries;
}
