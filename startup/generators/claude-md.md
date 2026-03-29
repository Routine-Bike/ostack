# Generator: CLAUDE.md

Seed the project's CLAUDE.md with all context from /startup.

---

## Template

```markdown
# {project-name}

{description}

## Stack

- **Language:** {language}
- **Framework:** {framework}
- **Database:** {database} {+ ORM if applicable}
- **Auth:** {auth}
- **Hosting:** Google Cloud Run ({region})
- **CI/CD:** {cicd}

## Commands

\```bash
{dev-command}         # local development server
{build-command}       # production build
{test-command}        # run tests
{lint-command}        # lint + format
{deploy-command}      # deploy to Cloud Run
\```

## Project Config

- **Project metadata:** `project.json` (source of truth, committed)
- **Secrets:** `.env` (gitignored) — copy from `.env.example` for local dev
- **GCP service account key:** `~/.gcloud-keys/{slug}.json`
- **Production secrets:** GCP Secret Manager (project: {slug})
- **Architecture decisions:** `docs/decisions/`

## GCP

- **Project ID:** {slug}
- **Region:** {region}
- **Service account:** {slug}-sa@{slug}.iam.gserviceaccount.com
- **Cloud Run service:** {slug}

## Deploy Configuration (configured by /startup)

- Platform: Google Cloud Run
- Production URL: https://{domain or cloud-run-url}
- Deploy trigger: {GitHub Actions push to main / Cloud Build / manual}
- Health check: https://{domain or cloud-run-url}/api/health
- Project type: {type}

## Conventions

{List any conventions decided during the architecture conversation. Examples:}
{- Multi-tenant: shared database with tenant_id column}
{- API versioning: URL path (/v1/...)}
{- State management: React Server Components, minimal client state}
```

## Commands by Framework

Fill in the commands based on the framework:

| Framework | Dev | Build | Test | Lint | Deploy |
|-----------|-----|-------|------|------|--------|
| Next.js | `bun dev` | `bun run build` | `bun test` | `bun run lint` | `gcloud run deploy {slug} --source .` |
| FastAPI | `uv run uvicorn src.main:app --reload` | `docker build -t {slug} .` | `uv run pytest` | `uv run ruff check .` | `gcloud run deploy {slug} --source .` |
| Hono | `bun dev` | `bun run build` | `bun test` | `bun run lint` | `gcloud run deploy {slug} --source .` |
| Rust (Axum) | `cargo run` | `cargo build --release` | `cargo test` | `cargo fmt --check && cargo clippy` | `gcloud run deploy {slug} --source .` |
| Astro | `bun dev` | `bun run build` | `bun test` | `bun run lint` | `gcloud run deploy {slug} --source .` |
