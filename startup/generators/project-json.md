# Generator: project.json + PROJECT.md

---

## project.json Schema

The source of truth for all project metadata. Committed to git. No secrets.

```json
{
  "name": "{project-name}",
  "slug": "{slug}",
  "description": "{description}",
  "type": "{saas|landing|ai|internal-tool|api|cli}",
  "created": "{YYYY-MM-DD}",

  "architecture": {
    "language": "{typescript|python|rust|go}",
    "framework": "{next.js|fastapi|axum|hono|astro|etc.}",
    "database": "{cloud-sql-postgres|firestore|none|etc.}",
    "orm": "{drizzle|prisma|sqlalchemy|none}",
    "auth": "{firebase-auth|clerk|nextauth|none|etc.}",
    "hosting": "cloud-run",
    "cicd": "{github-actions|cloud-build}",
    "linter": "{biome|ruff|rustfmt|etc.}"
  },

  "gcp": {
    "projectId": "{slug}",
    "region": "{region}",
    "serviceAccount": "{slug}-sa@{slug}.iam.gserviceaccount.com",
    "cloudRunService": "{slug}",
    "dnsZone": "{slug}-zone"
  },

  "domain": "{domain or null}",

  "github": {
    "org": "{org}",
    "repo": "{slug}",
    "visibility": "{public|private}"
  },

  "services": {
    "ga4": {
      "propertyId": "{id or null}",
      "measurementId": "{G-XXXXXXXXXX or null}",
      "dataStreamId": "{id or null}"
    },
    "searchConsole": {
      "verified": false
    },
    "posthog": {
      "orgId": "{org-id}",
      "projectId": "{project-id}",
      "host": "{posthog-host}"
    },
    "stripe": null,
    "resend": null,
    "errorTracking": {
      "provider": "posthog",
      "enabled": true
    }
  },

  "monitoring": {
    "uptimeCheck": "{slug}-uptime",
    "alertPolicies": ["5xx-rate", "latency"]
  },

  "environments": ["{env-list}"]
}
```

Only include `services.stripe` if the project is paid. Only include `services.resend` if email is needed. Set to `null` if not applicable.

---

## PROJECT.md Generation

Generate from project.json. Format:

```markdown
# {project-name}

> {description}

## Quick Links

| Service | Link |
|---------|------|
| GitHub | https://github.com/{org}/{slug} |
| GCP Console | https://console.cloud.google.com/home/dashboard?project={slug} |
| Cloud Run | {cloud-run-url} |
| GA4 | https://analytics.google.com/analytics/web/#/p{property-id} |
| PostHog | https://app.posthog.com/project/{project-id} |
| Search Console | https://search.google.com/search-console?resource_id=sc-domain:{domain} |
| Stripe | https://dashboard.stripe.com/test/products/{product-id} |
| Domain | https://{domain} |

## Architecture

- **Type:** {type}
- **Stack:** {language} + {framework}
- **Database:** {database}
- **Auth:** {auth}
- **Hosting:** Cloud Run ({region})
- **CI/CD:** {cicd}

## Service Status

| Service | Status |
|---------|--------|
| GCP Project | {slug} |
| Cloud Run | Deployed |
| GA4 | {measurement-id or "Not configured"} |
| PostHog | Project #{project-id} |
| Stripe | {Test mode or "Not configured"} |
| Resend | {domain or "Not configured"} |
| DNS | {domain or "No domain"} |
| Monitoring | Uptime check active |
```

Only include rows for services that are configured. Skip null services.
