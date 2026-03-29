# Generator: README.md

Generate a beautiful, polished README that makes the project look professional from day one.

---

## Structure

Every README follows this exact structure:

### 1. ASCII Art Header

Generate custom ASCII art from the project name using block letters. Use a simple, clean font style. Example for "MyApp":

```
 __  __          _
|  \/  |        / \   _ __  _ __
| |\/| |  _   / _ \ | '_ \| '_ \
| |  | | | |_/ ___ \| |_) | |_) |
|_|  |_|  \__/_/   \_\ .__/| .__/
                      |_|   |_|
```

Keep it readable. If the name is too long (> 10 chars), use a simpler style or abbreviate.

### 2. One-Paragraph Description

One paragraph that **sells** the project. Not technical — explain what it does for the user, not how it works. Example:

> MyApp is a collaborative project management tool that lets teams plan, track, and ship software without drowning in status meetings. Real-time updates, smart prioritization, and zero overhead.

### 3. Badges

```markdown
![Build Status](https://github.com/{org}/{slug}/actions/workflows/ci.yml/badge.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
```

Add relevant badges based on project type. Only include badges that have actual backing data.

### 4. Screenshot / Demo Placeholder

```markdown
<!-- TODO: Add screenshot or demo GIF -->
<p align="center">
  <img src="docs/screenshot.png" alt="Screenshot" width="600">
</p>
```

### 5. Quick Start

Exactly 3 steps. No more.

```markdown
## Quick Start

\```bash
# 1. Clone
git clone https://github.com/{org}/{slug}.git && cd {slug}

# 2. Install
bun install  # or: pip install -e . / cargo build

# 3. Run
bun dev  # or: python -m src.main / cargo run
\```
```

### 6. Architecture Overview

Brief description + simple diagram (use code block diagram or link to architecture doc):

```markdown
## Architecture

{2-3 sentence description of how the system works}

Built with {framework} on Google Cloud Run. Data stored in {database}.
```

### 7. Tech Stack Table

```markdown
## Tech Stack

| Component | Technology |
|-----------|-----------|
| Framework | Next.js 15 |
| Language | TypeScript |
| Database | Cloud SQL (Postgres) |
| Hosting | Google Cloud Run |
| Analytics | GA4 + PostHog |
| Payments | Stripe |
```

### 8. Development Setup

Detailed local dev setup for contributors:
- Prerequisites (Node, Bun, Python, Rust, etc.)
- Environment variables (reference .env.example)
- Database setup (if applicable)
- How to run tests
- How to lint

### 9. Deployment

Brief deployment instructions referencing CI/CD setup:
```markdown
## Deployment

Push to `main` triggers automatic deployment via GitHub Actions to Google Cloud Run.

Manual deploy: `gcloud run deploy {slug} --source . --region {region}`
```

### 10. Contributing

```markdown
## Contributing

1. Fork the repo
2. Create a feature branch (`git checkout -b feat/amazing-feature`)
3. Commit your changes
4. Push to the branch
5. Open a Pull Request
```

### 11. License

```markdown
## License

MIT License. See [LICENSE](LICENSE) for details.
```

---

## Quality Rules

- **No placeholder text.** Every section should have real content based on the project.
- **Sell, don't describe.** The README is the project's landing page. Make people want to use it.
- **Be specific.** "A web app" → "A real-time collaborative task manager for engineering teams."
- **Keep it scannable.** Headers, tables, code blocks. No walls of text.
- **ASCII art must be clean.** If the font doesn't render well for the project name, use a simpler font or just a large text header.
