import { connectDB } from "../db/database";

export async function getAllBlogEntries() {
  const db = await connectDB();
  const entries = await db.all("SELECT * FROM blog_entries");
  return entries;
}

export async function getBlogEntryById(id: string) {
  const db = await connectDB();
  const entry = await db.get("SELECT * FROM blog_entries WHERE id = ?", [id]);
  return entry;
}
