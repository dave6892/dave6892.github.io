# Creating Notes

This guide explains how to create and manage notes on the site.

## Overview

Notes are shorter, more informal content pieces that appear in the Notes tab. They work similarly to blog posts but are designed for quick references, tips, or brief documentation.

## Creating a New Note

### 1. Create the Markdown File

Create a new `.md` file in the `_notes/` directory:

```bash
touch _notes/my-note-title.md
```

**Important:** Unlike posts, note filenames should **NOT** include date prefixes. 

- ✅ Correct: `my-note-title.md`
- ❌ Incorrect: `2025-12-12-my-note-title.md`

### 2. Add Front Matter

Every note must start with YAML front matter containing metadata:

```yaml
---
title: Your Note Title
date: 2025-12-12 14:00:00 -0500
categories: [Category]
tags: [tag1, tag2]
---
```

#### Required Fields

- `title`: The title of your note (displayed in the notes list and on the note page)
- `date`: Publication date and time in format `YYYY-MM-DD HH:MM:SS TIMEZONE`

#### Optional Fields

- `categories`: List of categories (e.g., `[Development, Tools]`)
- `tags`: List of tags for organizing content (e.g., `[python, tutorial]`)
- `description`: A brief description used in the notes list preview (if not provided, the first 200 characters of content will be used)

### 3. Add Content

After the front matter, write your note content using Markdown:

```markdown
---
title: My Awesome Note
date: 2025-12-12 14:00:00 -0500
categories: [Development]
tags: [tips, productivity]
---

This is the introduction to my note.

## Section Title

Your content here with **bold text**, *italic text*, and [links](https://example.com).

### Code Examples

```python
def hello():
    print("Hello from a note!")
```

## Lists

- Item 1
- Item 2
- Item 3
```

### 4. Build and Preview

Build the site to see your note:

```bash
bundle exec jekyll build
```

Or serve it locally to preview:

```bash
bundle exec jekyll serve
```

Then visit `http://localhost:4000/notes/` to see your notes list, and `http://localhost:4000/notes/my-note-title/` for the individual note.

## Notes vs Posts

| Feature | Posts | Notes |
|---------|-------|-------|
| Directory | `_posts/` | `_notes/` |
| Filename | `YYYY-MM-DD-title.md` | `title.md` |
| URL | `/posts/title/` | `/notes/title/` |
| Purpose | Long-form blog posts | Quick references, tips |

## Tips

1. **Keep filenames descriptive**: Use kebab-case for filenames (e.g., `setting-up-docker.md`)
2. **Use consistent dates**: Make sure your timezone offset is correct
3. **Add descriptions**: Custom descriptions help readers understand the note at a glance
4. **Organize with tags**: Use tags to make notes easier to find and browse

## Troubleshooting

### Note doesn't appear after build

1. Check that the filename doesn't have a date prefix
2. Verify the front matter YAML is valid (proper indentation, no syntax errors)
3. Ensure the file is in the `_notes/` directory
4. Clear the cache and rebuild: `rm -rf .jekyll-cache _site && bundle exec jekyll build`

### Note URL not working

Notes use the filename (without `.md` extension) as the URL slug. For example, `my-note.md` becomes `/notes/my-note/`.
