CREATE TABLE IF NOT EXISTS blog_entries (
    id INTEGER PRIMARY KEY,

    title TEXT NOT NULL,
    version REAL, -- 0.1

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE blog_entries ADD COLUMN content TEXT;

DROP TABLE blog_entries;
DROP TABLE IF EXISTS blog_entries;

-- INSERT INTO blog_entries (title, version, content) VALUES ('My First Blog Post', 0.1, 'This is the content of my first blog post.');
-- INSERT INTO blog_entries (title, version, content) VALUES ('My Second Blog Post', 0.2, 'This is the content of my second blog post.');
-- INSERT INTO blog_entries (title, version, content) VALUES ('My other Blog Post', 0.4, 'This is the content of my other blog post.');
-- INSERT INTO blog_entries (title, version, content) VALUES ('My other Blog Post', 0.6, 'This is the content of my other blog post.');
--


SELECT * FROM blog_entries;
SELECT id, title, version, created_at, updated_at, content FROM blog_entries;
SELECT id, title, content, version FROM blog_entries;

SELECT *
FROM blog_entries
WHERE version >= 0.2;

SELECT *
FROM blog_entries
WHERE id = 1;

SELECT * FROM blog_entries
WHERE version >= 0.1 AND version <= 0.3;


SELECT * FROM blog_entries
WHERE (version >= 0.1 AND version <= 0.3) OR (version >= 0.5 AND version <= 0.7);



SELECT *
FROM blog_entries
WHERE content LIKE 'other'; -- case insensitive search
-- IS IDENTICAL TO: 👇
-- SELECT *
-- FROM blog_entries
-- WHERE LOWER(content) = LOWER('other');

SELECT *
FROM blog_entries
WHERE content LIKE '%other%';

SELECT *
FROM blog_entries
WHERE version LIKE '0._'; -- 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9
