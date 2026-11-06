import { open, Database } from "sqlite";
import sqlite3 from "sqlite3";
import path from "path";

const DB_FILE = path.join(process.cwd(), "db", "Playground.db");

let db: Database | null = null;

export async function connectDB() {
  console.log("Database connection is being established...");
  db = await open({
    filename: DB_FILE,
    driver: sqlite3.Database,
  })

  await db.run(`
    CREATE TABLE IF NOT EXISTS blog_entries (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      teaser TEXT NOT NULL,
      author TEXT NOT NULL,
      createdAt TEXT NOT NULL,
      image TEXT NOT NULL,
      content TEXT NOT NULL
    )
  `);

  return db;
}
