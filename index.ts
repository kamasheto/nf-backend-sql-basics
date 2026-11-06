import { connectDB } from "./db/database";
import express from "express";
import { getAllBlogEntries, getBlogEntryById } from "./src/models";

console.log("Hello via Bun!");

const app = express();
app.use(express.json());
const router = express.Router();


router.get("/", async (_req, res) => {
  console.log("Fetching all blog entries...");
  const entries = await getAllBlogEntries();
  res.status(200).json(entries);
});

router.get("/:id", async (_req, res) => {
  const entry = await getBlogEntryById(_req.params.id); // SQL INJECTION ALERT
  res.json(entry);
})

app.use("/", router);

app.listen(3009, () => {
  console.log("Server is running on port 3009");
});
