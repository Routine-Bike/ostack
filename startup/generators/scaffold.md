# Generator: Code Scaffold

Generate a working skeleton based on the project route and architecture decisions.

**Hard rule:** The scaffold MUST:
1. Build successfully
2. Run locally
3. Deploy to Cloud Run
4. Pass a health check at `/api/health` or `/health`

**No business logic.** Just a working shell with:
- Proper project structure
- Health endpoint
- Dockerfile optimized for Cloud Run
- Linter/formatter configured
- GA4 tracking code installed (if web project)
- PostHog SDK installed (if web project)
- Stripe webhook handler (if paid)
- Email utility (if Resend)

---

## Dockerfile Pattern (all projects)

Use multi-stage builds for smaller images:

### Next.js
```dockerfile
FROM node:20-alpine AS deps
WORKDIR /app
COPY package.json bun.lockb* ./
RUN npm install --global bun && bun install --frozen-lockfile

FROM node:20-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm install --global bun && bun run build

FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static
COPY --from=builder /app/public ./public
EXPOSE 3000
CMD ["node", "server.js"]
```

### Python (FastAPI)
```dockerfile
FROM python:3.12-slim AS builder
WORKDIR /app
COPY pyproject.toml ./
RUN pip install uv && uv sync --no-dev

FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /app/.venv ./.venv
COPY src/ ./src/
ENV PATH="/app/.venv/bin:$PATH"
EXPOSE 8000
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

### Rust (Axum)
```dockerfile
FROM rust:1.77 AS builder
WORKDIR /app
COPY Cargo.toml Cargo.lock ./
COPY src/ ./src/
RUN cargo build --release

FROM debian:bookworm-slim
COPY --from=builder /app/target/release/{slug} /usr/local/bin/
EXPOSE 8080
CMD ["{slug}"]
```

---

## Health Endpoint Pattern

Every scaffold includes a health endpoint:

### Next.js (App Router)
`src/app/api/health/route.ts`:
```typescript
export function GET() {
  return Response.json({ status: 'ok', timestamp: new Date().toISOString() });
}
```

### FastAPI
`src/routes/health.py`:
```python
from fastapi import APIRouter
router = APIRouter()

@router.get("/health")
def health():
    return {"status": "ok", "timestamp": __import__("datetime").datetime.now().isoformat()}
```

### Hono
`src/routes/health.ts`:
```typescript
import { Hono } from 'hono';
const app = new Hono();
app.get('/health', (c) => c.json({ status: 'ok', timestamp: new Date().toISOString() }));
export default app;
```

---

## Analytics Installation

### GA4 (Next.js)
In `src/app/layout.tsx`, add the GA4 script:
```tsx
import Script from 'next/script';

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html>
      <head>
        <Script src={`https://www.googletagmanager.com/gtag/js?id=${process.env.NEXT_PUBLIC_GA4_MEASUREMENT_ID}`} strategy="afterInteractive" />
        <Script id="ga4" strategy="afterInteractive">
          {`window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());
          gtag('config', '${process.env.NEXT_PUBLIC_GA4_MEASUREMENT_ID}');`}
        </Script>
      </head>
      <body>{children}</body>
    </html>
  );
}
```

### PostHog (Next.js)
Create `src/lib/posthog.ts`:
```typescript
import posthog from 'posthog-js';

export function initPostHog() {
  if (typeof window !== 'undefined' && process.env.NEXT_PUBLIC_POSTHOG_KEY) {
    posthog.init(process.env.NEXT_PUBLIC_POSTHOG_KEY, {
      api_host: process.env.NEXT_PUBLIC_POSTHOG_HOST || 'https://us.i.posthog.com',
    });
  }
}
```

For Python/Rust/Go APIs: install the PostHog server-side SDK instead.

---

## Linter Configuration

### Biome (TypeScript/JavaScript)
`biome.json`:
```json
{
  "$schema": "https://biomejs.dev/schemas/1.9.0/schema.json",
  "organizeImports": { "enabled": true },
  "linter": {
    "enabled": true,
    "rules": { "recommended": true }
  },
  "formatter": {
    "enabled": true,
    "indentStyle": "space",
    "indentWidth": 2
  }
}
```

### Ruff (Python)
`ruff.toml`:
```toml
line-length = 100
target-version = "py312"

[lint]
select = ["E", "F", "I", "N", "W", "UP"]
```

### Rustfmt (Rust)
`rustfmt.toml`:
```toml
edition = "2021"
max_width = 100
```
